<div class="form-group {{ $errors->has('police_station_id') ? 'has-error' : ''}}">
    {!! Form::label('police_station_id', 'Select Police Station', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
    <div class="col-xs-9 col-sm-9">
        <div class="col-xs-12 col-sm-12">
           {!! Form::select('police_station_id', $disWisePsList, null, ['class' => 'form-control js-example-basic-single','placeholder' => 'Select Customer Police Station', 'id' => 'police_station_id']) !!}
            <span class="text-danger">
                {{ $errors->first('police_station_id') }}
            </span>
        </div>
    </div>
</div>
