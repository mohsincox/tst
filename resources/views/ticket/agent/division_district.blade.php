<div class="required form-group {{ $errors->has('district_id') ? 'has-error' : ''}}">
    {!! Form::label('district_id', 'Select District', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
    <div class="col-xs-9 col-sm-9">
        <div class="col-xs-12 col-sm-12">
           {!! Form::select('district_id', $divWiseDistrictList, null, ['class' => 'form-control','placeholder' => 'Select District Name', 'id' => 'district_id']) !!}
            <span class="text-danger">
                {{ $errors->first('district_id') }}
            </span>
        </div>
    </div>
</div>
