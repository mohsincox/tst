@if(isset($option))
    {!! Form::model($option, ['url' => "option/$option->id", 'method' => 'put', 'class' => 'form-horizontal']) !!}
@else
    {!! Form::open(['url' => 'option', 'method' => 'post', 'class' => 'form-horizontal']) !!}
@endif
<div class="form-group required {{ $errors->has('select_id') ? 'has-error' : '' }}">
    {!! Form::label('select_id', 'Select SELECT NAME', ['class' => 'control-label col-sm-3 col-xs-3']) !!}
    <div class="col-xs-9 col-sm-9">
        <div class="col-xs-12 col-sm-12">
            {!! Form::select('select_id', $selectList, null, ['class' => 'form-control', 'placeholder' => 'Select SELECT NAME']) !!}
            <span class="text-danger">
                {{ $errors->first('select_id') }}
            </span>
        </div>
    </div>
</div>

<div class="required form-group {{ $errors->has('name') ? 'has-error' : ''}}">
    {!! Form::label('name', 'Option Name', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
    <div class="col-xs-9 col-sm-9">
    	<div class="col-xs-12 col-sm-12">
	        {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Enter Option Name', 'autocomplete' => 'off']) !!}
	        <span class="text-danger">
			    {{ $errors->first('name') }}
		    </span>
		</div>
    </div>
</div>

@if(isset($option))
    <div class="form-group required {{ $errors->has('status') ? 'has-error' : '' }}">
        {!! Form::label('status', 'Select Status', ['class' => 'control-label col-sm-3 col-xs-3']) !!}
        <div class="col-xs-9 col-sm-9">
            <div class="col-xs-12 col-sm-12">
                {!! Form::select('status', ['Active' => 'Active', 'Inactive' => 'Inactive'], null, ['class' => 'form-control', 'placeholder' => 'Select Status']) !!}
                <span class="text-danger">
                    {{ $errors->first('status') }}
                </span>
            </div>
        </div>
    </div>
@endif

<div class="form-group">
    <div class="col-xs-12 col-sm-12">
        {!! Form::submit('Submit', ['class' => 'btn btn-primary btn-block']) !!}
    </div>
</div>
{!! Form::close() !!}