<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->increments('id');
            $table->string('subject', 100);
            $table->string('customer_name', 150);
            $table->string('phone_number', 50);
            $table->integer('district_id')->unsigned()->nullable();
            $table->integer('police_station_id')->unsigned()->nullable();
            $table->string('customer_address');
            $table->string('product_name_with_model');
            $table->integer('ticket_status_id')->unsigned();
            $table->integer('ticket_type_id')->unsigned();
            $table->integer('assigned_id')->unsigned();
            $table->string('cc_to', 50)->nullable();
            $table->string('invoice_no', 100)->nullable();
            $table->string('job_no', 100)->nullable();
            $table->string('warranty_or_paid', 100)->nullable();
            $table->string('tp_or_engineer_name')->nullable();
            $table->string('verbatim_or_issue', 700);
            $table->string('agent_comment')->nullable();
            $table->string('user_comment')->nullable();
            $table->integer('panel_feed_back_by')->unsigned()->nullable();
            $table->timestamp('panel_feed_back_at')->nullable();
            $table->integer('agent_closed_by')->unsigned()->nullable();
            $table->timestamp('agent_closed_at')->nullable();
            $table->string('status', 50)->nullable();
            $table->integer('created_by')->unsigned()->nullable();
            $table->integer('updated_by')->unsigned()->nullable();
            $table->integer('deleted_by')->unsigned()->nullable();
            $table->timestamp('deleted_at')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('tickets');
    }
}
