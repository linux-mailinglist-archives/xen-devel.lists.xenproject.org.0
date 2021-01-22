Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F84300CD0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 20:54:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73083.131756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l32Uc-0006EW-FJ; Fri, 22 Jan 2021 19:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73083.131756; Fri, 22 Jan 2021 19:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l32Uc-0006E7-BN; Fri, 22 Jan 2021 19:53:14 +0000
Received: by outflank-mailman (input) for mailman id 73083;
 Fri, 22 Jan 2021 19:53:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1HJv=GZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l32Ua-0006E2-CL
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 19:53:12 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8726a6da-8bad-4a81-af59-8551e61b21db;
 Fri, 22 Jan 2021 19:53:10 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MJnTfD170757;
 Fri, 22 Jan 2021 19:53:05 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 3668qrnveh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 19:53:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MJo9pi135148;
 Fri, 22 Jan 2021 19:53:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by aserp3020.oracle.com with ESMTP id 3668rj2sv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 19:53:04 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Fri, 22 Jan
 2021 19:53:02 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb%5]) with mapi id 15.20.3784.015; Fri, 22 Jan 2021
 19:53:02 +0000
Received: from [10.74.97.144] (138.3.200.16) by
 BY5PR16CA0033.namprd16.prod.outlook.com (2603:10b6:a03:1a0::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Fri, 22 Jan 2021 19:53:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8726a6da-8bad-4a81-af59-8551e61b21db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=4iHA4YGb40I3EifqBlJ3FCNzv19sKWY/8yYdNdhUaOw=;
 b=mwhCRdv+hFfway99yt5VN6Q71bI4j8Y9xh/l/N0VX358DIaCmbhnHA8Fvj6gyJAVVHAU
 i8a2938Q4Sk/+lj/Xt+5mjXpOV+1YqQ+Nj8DqKG+MY9PrnlFUxA1827TGQocAw5iun4I
 6qxoLw/b8cV9DBF89uIeV+gIQl6EA4NEtH1B1Z8d/AwvewqrW51niF59iRzPiIFO4qbs
 io8GKXF4LDNCGDNxbs2XvbQ1IsTCnyyQwak3gmzJ1jg1FQl+BOng9OH9j4nWhL288Lws
 IGwJEGS/G5xKNW1tEn2B1cUNMch1S1ESbPU/9i+L5AFz/30R2lcFlYiQmZKt7P9xHhC5 Jg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEWCX6U97wxCYY/BnhMqLy9KMBkASfd4GVlXcsTJLCFfM3audqbqxnBg1WVK8uqtAIGqc3GjbP3ihLppWJRg/elgOlUwGbZQwdTLyTA2kPAB8rPc5XqH4mc1zT1JKRYeoHCjQ6VP9ovXIZtdNC7gVvKHeG3Ij6WD0W1V4kbIufz+kq3ybX3cE7O/B19F+X0hfXHPhcjp0I2zSS7r3rusHX87HTJDDON5+4gb4rvB22jxrKOiYiukpTw3gfGB7BxTfz6pCBPbqyXkmHWd99vG1imcJEHscIWvxHUiOZGkmNcOy/WwK01ANvt/DsA/TZ9Q9zgE/uM6vJjrKgor3ZI63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iHA4YGb40I3EifqBlJ3FCNzv19sKWY/8yYdNdhUaOw=;
 b=cnajEBN944EEyGxwwaLxB9vsvlldc0elAmvA1FeDhQxHNmTuA6F2DXnIHLmfF1nhmu+SS6uwRND07dv2mdu49NootBfwlSCQ5hyZ5BvCYVnXsgzz0K5/bL0hVs819HIzTKvEAyr0aGqNBSP6SODPWDtEISrXkxDv7zpO1DaaL5ZjNyzoczjITS2DJu8fwUnwEKe21GJvZRptxv5u7gfJWEctdOcLFBhrcKEpXBszNGU11cwIprNDHOBvzc4KQvGUYNqfdvFqRqxG8JeACLMZjU0LEVCqSTz1xFK//ER1K8+BBJpkOdMYfwkjtET4sgyTJ4td5rr7LJ9Pc8b5B7UjSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iHA4YGb40I3EifqBlJ3FCNzv19sKWY/8yYdNdhUaOw=;
 b=n+j823S8CciaIo5rOnZ2JWSgUCWvfqKXEMc7rFbArOc05mj5lYRYPdqNZOL76SLwrVxVCrNLYHL4AfnIq5KOiZ9FtzYerI+BMMD5Rc3BwFfB3Q1OF7/npGkGkInGgjHIr4KGnobx+1JRpDgCAPpg5iqEMBT2C82C/pzn6QC9C0k=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH v2 3/4] x86: Allow non-faulting accesses to non-emulated
 MSRs if policy permits this
To: Jan Beulich <jbeulich@suse.com>
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        xen-devel@lists.xenproject.org
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
 <c9ee36ca-e19d-0408-d137-8dcee4110ef3@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <dc4ec7c0-c2cf-bf15-a757-7f1836ca801d@oracle.com>
Date: Fri, 22 Jan 2021 14:52:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
In-Reply-To: <c9ee36ca-e19d-0408-d137-8dcee4110ef3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BY5PR16CA0033.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::46) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d084cf1-2404-41f3-0259-08d8bf0f53df
X-MS-TrafficTypeDiagnostic: BYAPR10MB3320:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3320818352AEE5A39AFC95E88AA00@BYAPR10MB3320.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EKEV2pLHNokXEqA3N6yyUcYXFkjF9mZ6D5PVT81hpESo4AnoSikfsQsaz8XIzFPzfRI6o7sJFPt/4g2WAvWssLW/1NgOxzBIN64ihGPiOophQileX6Or+4zJNy0ncyeLV27JzuQj1Z77tMgapMY7uWGaIsjVYEmZ8p+BME00R6e4opaghug9UvAeybAXVumnAPsh2ut8++mbqYOQKUgFulo0d/wdfpO5zldoRf2L4RlvR+TBE6vI+dLigPGp9G+4RN3lnJMRReg+CT7KIWEJ6pTtvveR2S6JlhtpIg42kgTQEnZVL5PKrkvxbXC3r5+w04R1G/992xpkY1xJ4KU4s3dTEWU3DxerPNhVTmRFpUELgD/5UTbqqJHTBUlrc6q29qAE5fwRFfQD4lNPXoGfK2jBDByLCiLY3D/1iiPwlkfruM8vPgrEPENAbajFYssVDe/ZyXUbIo/Oh3Oi8YueL2lrLkQZonQZNrKQnFX583E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(39860400002)(396003)(366004)(2906002)(186003)(53546011)(16576012)(5660300002)(66946007)(83380400001)(36756003)(6486002)(66476007)(478600001)(26005)(86362001)(44832011)(6916009)(8676002)(4326008)(31686004)(31696002)(2616005)(8936002)(316002)(16526019)(956004)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SkR4SzJLRHlGWnZhd0UyM0FkeHNLZ1dDMC9rY0dlTTc1dXlqVlVVWEtwUENZ?=
 =?utf-8?B?UnZ4ZTJtZzZDbWRjQnNadytWZnNsOXJINllPOHRlbjM3ME53WDAvMlY2MUl4?=
 =?utf-8?B?b2t6K1hjUFY0K2QwZ2UzM21XMGROV25lUElSRkkrekZFeDFia1BwU3pqR3FE?=
 =?utf-8?B?dGc4aElVL0FIU2NnZnFZSWhZZCtYaHNJMHVsdzVVZk5Ld1NVYnZzd3VLaDg4?=
 =?utf-8?B?Rzc5LzNZdWF0MkdCUEp0aWVvQXFZanJ5eWZtNU55OEo1UTRScWtlaDRYZjdI?=
 =?utf-8?B?cHBOTXdDSE9Qd1ZVejN6d2xGWHVXVVJELzM0NkU3M3AwVmpsZDRpWlJQYXFy?=
 =?utf-8?B?Q2p2S0xEWlVkbmYrZkp0V01FeDlDc0x6bjhPc0Q1U1NOSGVSUFZKK2dvaUFl?=
 =?utf-8?B?cFhXN1pINnRuSEZDTkQyc1p3aFQ2MkVkZEtsUGpNWHdnUXFCNVdpRDVPZXJZ?=
 =?utf-8?B?R2dyZ2tnNm1rd3dEYWV3UTlBUm9zblBCbFpJTW8xcmx5T1h2L3dkUUtxaVZ5?=
 =?utf-8?B?L3NLUW1pOFk2UHBnZXZRWnZhUWtDbG44cDhERml3eW1FenFyQWwxTUpGbVlV?=
 =?utf-8?B?dHRDZXBSRk96MEU0MmUzbTl2aWNMUmh5cFY2eXdJZk96ZWxOTHVLVm51VFJu?=
 =?utf-8?B?dUFxRzdrRjliLzFYMjIrSGR3ckM2VU9zcy9nQTFTaGpWWlJpZ3pPK2NjRjI1?=
 =?utf-8?B?Z2grZlBtdk9mVVJRWjFWSnlCdkhrR29zVGRRYythZFpTQkRxOHZLVVd6TTJ2?=
 =?utf-8?B?dk0rdUNjVGJhYkh6N0pJamxlSE8zU2srNlJIVEw1eHhwaVBtSklxY0lGNmYw?=
 =?utf-8?B?VUhXdXFUYXIzYU9oS3gvYWtMY0JFeVh0cE1MU0w0UVpHcnQxRmZ5dC96ZzBD?=
 =?utf-8?B?SFI2S2crWTVDTzMxZldZZHJveHFVb25MVVVDWitNU3RqcHN3RGpwb2NTSVpJ?=
 =?utf-8?B?MzFwSHRxOHpKb0lvUVU2blZzVi85aVd4aXdHNWdmWktnLy9tRFMzMDdaaFZv?=
 =?utf-8?B?a2ZKNllwUDZLNGVnTWxEMk90d1phYVpyY0o5WXcrY29JL0ovZWs2YXByT1Br?=
 =?utf-8?B?OTdXajdkOWl5TVBMYkpJOXZSSmhPZmxUZzRZbUhDbVVWazVqSHkvZlpWc2h3?=
 =?utf-8?B?bHVQYTZ2MDhJbjdRYWdTeThSYURmazRmYWdwNXdQMDE5TDBMNDJtUFNYZ2lY?=
 =?utf-8?B?VDk3eWFGR1hoOXkxSzFrbU52c24wWlk4Vk1XVVRTZU1QZnpzaDV4OGRzVTVn?=
 =?utf-8?B?bTNXNTBwak5tZFJ6SkdFR25SekNkdGxEbEIrRjFOQ0NRd2ZrYXlraWtNcEF6?=
 =?utf-8?Q?ydtsb8SwPr1ccXd4SDJFBPK091s19WOeBy?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d084cf1-2404-41f3-0259-08d8bf0f53df
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 19:53:02.7023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtkrYq+Gm826XoMJMn4Peler+hRxwC0QL4oh1CbOTdPc0wec/QPCc4zodgLDuedHuVSWrHvRojijNA/tOsIkvXHSRu9rJHuDGnewoq0SQa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3320
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220101
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220101



On 1/22/21 7:51 AM, Jan Beulich wrote:
> On 20.01.2021 23:49, Boris Ostrovsky wrote:


> 
>> +
>> +    /*
>> +     * Accesses to unimplemented MSRs as part of emulation of instructions
>> +     * other than guest's RDMSR/WRMSR should never succeed.
>> +     */
>> +    if ( !is_guest_msr_access )
>> +        ignore_msrs = MSR_UNHANDLED_NEVER;
> 
> Wouldn't you better "return true" here? Such accesses also
> shouldn't be logged imo (albeit I agree that's a change from
> current behavior).


Yes, that's why I didn't return here. We will be here in !is_guest_msr_access case most likely due to a bug in the emulator so I think we do want to see the error logged.


> 
>> +    if ( unlikely(ignore_msrs != MSR_UNHANDLED_NEVER) )
>> +        *val = 0;
> 
> I don't understand the conditional here, even more so with
> the respective changelog entry. In any event you don't
> want to clobber the value ahead of ...
> 
>> +    if ( likely(ignore_msrs != MSR_UNHANDLED_SILENT) )
>> +    {
>> +        if ( is_write )
>> +            gdprintk(XENLOG_WARNING, "WRMSR 0x%08x val 0x%016"PRIx64
>> +                    " unimplemented\n", msr, *val);
> 
> ... logging it.


True. I dropped !is_write from v1 without considering this.

As far as the conditional --- dropping it too would be a behavior change. 


> 
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>> @@ -850,4 +850,10 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
>>      ctxt->event = (struct x86_event){};
>>  }
>>  
>> +static inline bool x86_emul_guest_msr_access(struct x86_emulate_ctxt *ctxt)
> 
> The parameter wants to be pointer-to-const. In addition I wonder
> whether this wouldn't better be a sibling to
> x86_insn_is_cr_access() (without a "state" parameter, which
> would be unused and unavailable to the callers), which may end
> up finding further uses down the road.


"Sibling" in terms of name (yes, it would be) or something else?


> 
>> +{
>> +    return ctxt->opcode == X86EMUL_OPC(0x0f, 0x32) ||  /* RDMSR */
>> +           ctxt->opcode == X86EMUL_OPC(0x0f, 0x30);    /* WRMSR */
>> +}
> 
> Personally I'd prefer if this was a single comparison:
> 
>     return (ctxt->opcode | 2) == X86EMUL_OPC(0x0f, 0x32);
> 
> But maybe nowadays' compilers are capable of this
> transformation?

Here is what I've got (not an inline but shouldn't make much difference I'd think)

ffff82d040385960 <x86_emul_guest_msr_access_2>: # your code
ffff82d040385960:       8b 47 2c                mov    0x2c(%rdi),%eax
ffff82d040385963:       83 e0 fd                and    $0xfffffffd,%eax
ffff82d040385966:       3d 30 00 0f 00          cmp    $0xf0030,%eax
ffff82d04038596b:       0f 94 c0                sete   %al
ffff82d04038596e:       c3                      retq

ffff82d04038596f <x86_emul_guest_msr_access_1>: # my code
ffff82d04038596f:       8b 47 2c                mov    0x2c(%rdi),%eax
ffff82d040385972:       83 c8 02                or     $0x2,%eax
ffff82d040385975:       3d 32 00 0f 00          cmp    $0xf0032,%eax
ffff82d04038597a:       0f 94 c0                sete   %al
ffff82d04038597d:       c3                      retq


So it's a wash in terms of generated code.

> 
> I notice you use this function only from PV priv-op emulation.
> What about the call paths through hvmemul_{read,write}_msr()?
> (It's also questionable whether the write paths need this -
> the only MSR written outside of WRMSR emulation is
> MSR_SHADOW_GS_BASE, which can't possibly reach the "unhandled"
> logic anywhere. But maybe better to be future proof here in
> case new MSR writes appear in the emulator, down the road.)


Won't we end up in hvm_funcs.msr_write_intercept ops which do call it?


-boris

