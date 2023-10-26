Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659C97D8416
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 15:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623838.972073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw0tE-0001yS-2X; Thu, 26 Oct 2023 13:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623838.972073; Thu, 26 Oct 2023 13:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw0tD-0001wn-W4; Thu, 26 Oct 2023 13:59:11 +0000
Received: by outflank-mailman (input) for mailman id 623838;
 Thu, 26 Oct 2023 13:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm+b=GI=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qw0tC-0001wh-M0
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 13:59:10 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4eff332-7407-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 15:59:09 +0200 (CEST)
Received: from DM6PR03CA0067.namprd03.prod.outlook.com (2603:10b6:5:100::44)
 by CO6PR12MB5410.namprd12.prod.outlook.com (2603:10b6:5:35b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Thu, 26 Oct
 2023 13:59:05 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:100:cafe::3a) by DM6PR03CA0067.outlook.office365.com
 (2603:10b6:5:100::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Thu, 26 Oct 2023 13:59:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.18 via Frontend Transport; Thu, 26 Oct 2023 13:59:04 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 08:59:02 -0500
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
X-Inumbo-ID: d4eff332-7407-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQq/CZK9fSMAUt9N52hX7y9XCoNg5riw28lo9iPgh5eaJwR/HK9q6LdImWPTy/NKLmcZcYsf1pwHBCc6gams4Pj2mTiNuMHJo8zh5+4QeeMXNWxbEb+3pR5GVU3g2q9Oc8DQpQmVerDJUpwcH7r1yMvAqeW+S3lAv+MbEVOEFjOXxfb0/C67fkenFkJE5mtr8OhmUQvuDRdnklgTJqxye1SYEHh5MaEZClNQjatlRxKRRpPcjlZXUudi1m4UrxDKiNLOxh6m0ejK4XZ3tK9VhALSnenlZAalH0hyETiukXrxcWFExvJkwjDN0kOMs5uFjiAbMHaiRQDUa6crLVh4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbtBfkCvMN9jSjxeIme2SvJ1BjQKvBFZ3xQppVQBGTI=;
 b=SbIfxrjg4+3ag42IVsRMKv8hT9ximdVUYjt7TDi3zwAZ/8P2E7PCMpP+oFCurnCjY13ABKf1MRc3orSehl2ooBXNBs5UqTy6kqwC8d2VdHzsMKuTPhsM2NOw3xalUyw7nC5BJrAi/5KiAQRIIezTlgiSuJ/DK9ZxG6trta+3kRCAnHHW4TINv5SRBJW0R/7SP/0O0+3/VuD+8Bv3JV+66qMg3wsYoxEKKzRk8jWvQeoB3FbquJG4LLtCixHv+9Hmx/suOOVwqMhdjl6F6OsrgXQ1314QL4HltXX+m0cdVVfFpv74iKV5mwXJgnY3KKOg5vrAe2i7i/3jrQ2a64kE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbtBfkCvMN9jSjxeIme2SvJ1BjQKvBFZ3xQppVQBGTI=;
 b=YsXX27agglHxuQqmhhk/q3YfuLjAC0RKrcNVaOf0ZxTzH2CwUmu3waBiqa4SMiv5q/blER3aeG18MpoMptP8Hd9xQ+RXhy9Bq0RfDAtu7A0oE7JqAvCgrDiptosNi61THY55l/Pryhc78vUWRyfsRq8UHanJs/upgayrjofqTv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <92ba94d2-9e57-4241-8626-33f06f88e726@amd.com>
Date: Thu, 26 Oct 2023 16:58:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
 <809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com>
 <c107d63c-25a3-4f17-a5e8-7ec3ccd94ce3@amd.com>
 <c81a8275-ecfd-7598-c119-ed83b156c0e5@suse.com>
 <b5330686-82a0-4d47-9549-2d943ca68c7e@amd.com>
 <1cc98108-3328-94d3-5f8d-ff03c965087e@suse.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <1cc98108-3328-94d3-5f8d-ff03c965087e@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|CO6PR12MB5410:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6ab61a-c44d-4cff-4277-08dbd62bb71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5w/6bHWIi7P/jXlarh36FBKKsfZLDmtdyUuRL/j9sBggEeDWQIny22P5Cd6C4lbEUmkqJSfPy0lBWVzh17gf4hcd5q0NhQvCIn9kq7iBLiJfopery86fVY3bImVv7rLS72H6pvlffkr0ch7ZbSLno+FU8CivC0Q87WwOJNmNncw79N7Jb+7mLAbHe+pk9R0a+xhws1PWQCD8PfzKMHzuAyI6urSKmmwZlWejKB/f37qzWPrOLP27FLKYKgFoxp3vLKLxf1nta52kta5NOaYyQxbs2zJrm6eH0AIrMi/poDyM7mK2Zd5Rst+XPS+CmcK1gzOX+/jw9iU5VWOfWNKBCsvCAa0noJPNw+A590IjEBrvA7tY5Us2AhMvUcJD8IzfyqJVSLbVBXJba3pP+veg5fmksgSSWjUgS/PAezf5FAD+2+PszvfwYaYbH4hOKRXQAnYduhkjZjRTf280WgUW2qz0k/YegR/DtxKgWnq7j+r3XVgWnMliV0G9d8xYKQ6EiFqpBmrDVCpHaaEYOJg0EjFsxLXuVAEnD85zt/LmUoZ+sph/mQG0STTE5Gn6sneYAzTrh08oSEBtob4mb76mSFnGBEFoPkAJeB258yRQYBK2rNPrPizyjrdLh/CTDterbvH6EnbnL5FZpTn04Enk5hrmammdQs0Jpb7TshpZs2D5JvxTccyfQOnimB092p86bcs9d1FWYCtmb7yC+llW1Je2dDI9YeY/jqvsty9ksnYcKpfoLMU45IfRYDKDVwv+byzsCcMDw5KFBQM/dPZgRJD/Mcpd95xvM9RYrByG03C4MCSlsaYdt1aWVFcL+WLi
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40470700004)(40480700001)(36756003)(31686004)(40460700003)(66899024)(54906003)(70586007)(70206006)(16576012)(86362001)(81166007)(356005)(31696002)(82740400003)(36860700001)(47076005)(83380400001)(426003)(336012)(26005)(16526019)(2616005)(6666004)(53546011)(2906002)(478600001)(316002)(41300700001)(4326008)(6916009)(5660300002)(44832011)(8676002)(8936002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 13:59:04.6361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6ab61a-c44d-4cff-4277-08dbd62bb71d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5410


On 26/10/23 15:37, Jan Beulich wrote:
> On 26.10.2023 14:35, Xenia Ragiadakou wrote:
>>
>>
>> On 26/10/23 14:51, Jan Beulich wrote:
>>> On 26.10.2023 11:46, Xenia Ragiadakou wrote:
>>>> On 26/10/23 11:45, Jan Beulich wrote:
>>>>> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
>>>>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>>>>>>              if ( end <= kernel_start || start >= kernel_end )
>>>>>>>>                  ; /* No overlap, nothing to do. */
>>>>>>>>              /* Deal with the kernel already being loaded in the region. */
>>>>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>>>>> +        else if ( kernel_start + kernel_end > start + end )
>>>>>>> What meaning has the sum of the start and end of either range? I can't
>>>>>>> figure how comparing those two values will be generally correct / useful.
>>>>>>> If the partial-overlap case needs handling in the first place, I think
>>>>>>> new conditionals need adding (and the existing one needs constraining to
>>>>>>> "kernel range fully contained") to use
>>>>>>> - as before, the larger of the non-overlapping ranges at start and end
>>>>>>>       if the kernel range is fully contained,
>>>>>>> - the tail of the range when the overlap is at the start,
>>>>>>> - the head of the range when the overlap is at the end.
>>>>>> Yes it is not quite straight forward to understand and is based on the
>>>>>> assumption that end > kernel_start and start < kernel_end, due to
>>>>>> the first condition failing.
>>>>>>
>>>>>> Both cases:
>>>>>> (start < kernel_start && end < kernel_end) and
>>>>>> (kernel_start - start > end - kernel_end)
>>>>>> fall into the condition ( kernel_start + kernel_end > start + end )
>>>>>>
>>>>>> And both the cases:
>>>>>> (start > kernel_start && end > kernel_end) and
>>>>>> (end - kernel_end > kernel_start - start)
>>>>>> fall into the condition ( kernel_start + kernel_end < start + end )
>>>>>>
>>>>>> ... unless of course I miss a case
>>>>> Well, mathematically (i.e. ignoring the potential for overflow) the
>>>>> original expression and your replacement are identical anyway. But
>>>>> overflow needs to be taken into consideration, and hence there is a
>>>>> (theoretical only at this point) risk with the replacement expression
>>>>> as well. As a result I still think that ...
>>>>>
>>>>>>> That said, in the "kernel range fully contained" case it may want
>>>>>>> considering to use the tail range if it is large enough, rather than
>>>>>>> the larger of the two ranges. In fact when switching to that model, we
>>>>>>> ought to be able to get away with one less conditional, as then the
>>>>>>> "kernel range fully contained" case doesn't need treating specially.
>>>>> ... this alternative approach may want considering (provided we need
>>>>> to make a change in the first place, which I continue to be
>>>>> unconvinced of).
>>>> Hmm, I see your point regarding the overflow.
>>>> Given that start < kernel_end and end > kernel_start, this could
>>>> be resolved by changing the above condition into:
>>>> if ( kernel_end - start > end - kernel_start )
>>>>
>>>> Would that work for you?
>>>
>>> That would look quite a bit more natural, yes. But I don't think it covers
>>> all cases: What if the E820 range is a proper sub-range of the kernel one?
>>> If we consider kernel range crossing E820 region boundaries, we also need
>>> to take that possibility into account, I think.
>>
>> You are right, this case is not handled and can lead to either of the
>> issues mentioned in commit message.
>> Maybe we should check whether end > start before proceeding with
>> checking the size.
> 
> It looks like it all boils down to the alternative I did sketch out.

I 'm not sure I fully understood the alternative.
Do you mean sth in the lines below?

          if ( end <= kernel_start || start >= kernel_end )
              ; /* No overlap, nothing to do. */
          /* Deal with the kernel already being loaded in the region. */
-        else if ( kernel_start - start > end - kernel_end )
+        else if ( start < kernel_start && end > kernel_end ) {
+            if ( kernel_start - start > end - kernel_end )
+                end = kernel_start;
+            else
+                start = kernel_end;
+        }
+        else if ( start < kernel_start )
              end = kernel_start;
-        else
+        else if ( end > kernel_end )
              start = kernel_end;
+        else
+            continue;

          if ( end - start >= size )
              return start;

You wouldn't like to consider this approach?

          if ( end <= kernel_start || start >= kernel_end )
              ; /* No overlap, nothing to do. */
          /* Deal with the kernel already being loaded in the region. */
-        else if ( kernel_start - start > end - kernel_end )
+        else if ( kernel_end - start > end - kernel_start )
              end = kernel_start;
          else
              start = kernel_end;

-        if ( end - start >= size )
+        if ( end > start && end - start >= size )
              return start;
      }

> 
> Jan

