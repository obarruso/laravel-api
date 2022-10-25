<?php

namespace App\Filters\V1;

use App\Filters\ApiFilter;

class InvoiceFilter extends ApiFilter
{
    protected $allowedParams = [
        'customerId' => ['eq'],
        'amount' => ['eq','gt','lt','gte','lte'],
        'status' => ['eq', 'ne'],
        'billedDate' => ['eq','gt','lt','gte','lte'],
        'paidDate' => ['eq'],
    ];
    protected $columnMap = [
        'customerId' => 'customer_id',
        'billedDate' => 'billed_date',
        'paidDate' => 'paid_date',
    ];
    protected $operatorMap = [
        'eq' => '=',
        'gt' => '>',
        'lt' => '<',
        'gte' => '>=',
        'lte' => '<=',
        'ne' => '!=',
    ];
}