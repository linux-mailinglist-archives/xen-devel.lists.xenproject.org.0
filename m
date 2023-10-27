Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A646B7D965D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 13:19:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624341.972851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwKrE-0008MP-U9; Fri, 27 Oct 2023 11:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624341.972851; Fri, 27 Oct 2023 11:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwKrE-0008Jg-Pv; Fri, 27 Oct 2023 11:18:28 +0000
Received: by outflank-mailman (input) for mailman id 624341;
 Fri, 27 Oct 2023 11:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWeN=GJ=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qwKrD-0008Ja-3q
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 11:18:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a8eb7c1-74ba-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 13:18:24 +0200 (CEST)
Received: from DM6PR06CA0040.namprd06.prod.outlook.com (2603:10b6:5:54::17) by
 CH2PR12MB4229.namprd12.prod.outlook.com (2603:10b6:610:a5::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.24; Fri, 27 Oct 2023 11:18:18 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:54:cafe::34) by DM6PR06CA0040.outlook.office365.com
 (2603:10b6:5:54::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24 via Frontend
 Transport; Fri, 27 Oct 2023 11:18:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Fri, 27 Oct 2023 11:18:17 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 27 Oct
 2023 06:18:15 -0500
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
X-Inumbo-ID: 8a8eb7c1-74ba-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/FaBt7NAGL2dcehVuVcsrae/vgENTWTyWbtQxE+1pc7XB3V13O1e/gcebF10MZu5vbKZmTyQdoCc8SW3bO2grrIcq0dkaMF06ZpYN5+Y4yk/fXSPiQjStYlJwwleBI6xbcoI29V1ZtRTnGQNk/2d7D38/4cjpe83ipGLgmnOSFz6Nm6d+0P/svCIbsS06An6/ngSkQaVPKATCNP1snbzSyykndBUZyJFuwg8ceFORrCej/5+cpJ6Wc+cTY7iLOx1Yzn1NUhsvGLcHMOvsTAPjcboC8VuxuQ/mJrc6AZySHUjwrr0JZZlAvhKh50vA/c50D+1bSRJWdUvR9YuEBUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz99m5x5xtMufJ5gK5rnfWtKLPtwi5hDQMUX861Svv8=;
 b=nOVI98Jw53l4rMdTe4Z2bmv2Qth5i1qwAeEZxP8TYXbVTM5JjE11c+8qqoMXwTliiDEECp0IQdpzdD28TPvNhaRjSq88+MpR9CJ0oanVW6oOgD4lnTCBmH/O0i+Jf9Cl+YIDICmM0Z/hvGVGdXUC5e+7wLteeX+EsjafDW5FrPICC5LsZ/Lbww/cAfONY5eIa1NtpEe5MxgNZPMzQdgwLxY8QmFAmeRqijl9EsdBCry2Zsz/Z/ma1YXuvujU5cYckGlQIw6OhbXIbn0jhZiN+3HnZVd7/f9oiZZdEVvhqXwQm4CpD3WyAOiSa4JR+wrSz1iXi9NdSUR43nmGQ5HylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fz99m5x5xtMufJ5gK5rnfWtKLPtwi5hDQMUX861Svv8=;
 b=Sbx0iyHMlXDpiYIeVABwzUzP2Xo1LhjprWJcQFol/EKlNCDKxpB/ChRq6aFIUiynAlb5ubK/U7q3tUq62aW5txbj+AI9DYLGkqdbhm2vQ4c9oBwgYSG3K1ixtoxOlonS5BZeQ3qg02rmwkvJF7x4RAr+nnk113RaecuN3O+SU14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <987b5b7d-57f8-4d63-bd13-fe662b6cb87f@amd.com>
Date: Fri, 27 Oct 2023 14:18:12 +0300
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
 <92ba94d2-9e57-4241-8626-33f06f88e726@amd.com>
 <a61926bc-e3e6-e381-45de-be3a4878b6af@suse.com>
 <217d9079-3072-441a-a4ba-4db28c565bc7@amd.com>
 <08ea1b7b-c85f-337a-42c4-520e40b75288@suse.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <08ea1b7b-c85f-337a-42c4-520e40b75288@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|CH2PR12MB4229:EE_
X-MS-Office365-Filtering-Correlation-Id: f51f31f6-7c84-4ae5-959e-08dbd6de6b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ds4oxGJIZgQhgEgzBkDNK5A+i1oxmGEkPBDBgN4aEH3d7CtYdPiKfDBHqN4qhWbbEmuYaHTUhMJXcJEUkTk3D+VzqA9HbCLQOeUOG4Hc+c+15+iSX7eUwdUZ2XEf4JPMe22gg6F54yph2U5GgkRtRJ46GVEm9gQEepqkXwNviDuX9Y0kdEzMCcIu89JNXhZQaqQ8EHhnJM67Vdzg6Spzwr7usE+iAo9UBbjkibrXLXer6FduQhm5xeoeqmcMiSN+rvNCGuO/czunIvYiioiENkP3vjNglPAEa+pCTEsQuJWOiLYQIZ8qQDH8KcUTo29Tvz1SFKl4A8QBfD0TN3OSxcVC8goH/7lFaLyxJX6l9B6LJeFDFoaCROm8zWhIS+4LCoElWin8/hWw25s109XoOb4BkNY9J/T3wDdwegWsXz65IMx0PWF/5OUEa6WnJ70Xu7LFBymc9fsoRUBItbk1LFON6PXBcgWFxtx4bHUlqDrJ39rIjSfONHsCtDdv/47KrSGiDe2TxNLWIrjE6AGyCItiI3kpXP60qoMmZ6lQCSfmLlJYCh016yYxCKtVW6TsxismD5e69Hv0iWCVqpIRZr8t8O33Hr+FKaKwDtZ+ePUHxGxcRMv8wrzuysB+RGBbI90+HPVLfDIx1tXLi8TCpXK9QIrDSzJXmTs+nlqhg3mrj1t4ehd4/QjkGTKsYmmTaAysvw7F5yVrO+ygfV+eye93NgarfewGoEhqQFEWUGYC6Nk4DFoJkLEXZ2Q/8yN/UXKMCuMW0lA5BdW8TRnAiE1f8hsFJ67bboXDgLnic2iYdk8ujmgDGoLyg60ej8Ra
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(82310400011)(1800799009)(451199024)(186009)(64100799003)(46966006)(40470700004)(36840700001)(66899024)(40460700003)(2616005)(336012)(426003)(26005)(16526019)(53546011)(6666004)(83380400001)(47076005)(16576012)(4326008)(41300700001)(8676002)(8936002)(44832011)(5660300002)(2906002)(36860700001)(6916009)(478600001)(316002)(54906003)(70586007)(70206006)(82740400003)(31696002)(86362001)(81166007)(356005)(36756003)(40480700001)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 11:18:17.6802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f51f31f6-7c84-4ae5-959e-08dbd6de6b98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4229


On 27/10/23 09:37, Jan Beulich wrote:
> On 26.10.2023 18:55, Xenia Ragiadakou wrote:
>>
>>
>> On 26/10/23 17:55, Jan Beulich wrote:
>>> On 26.10.2023 15:58, Xenia Ragiadakou wrote:
>>>>
>>>> On 26/10/23 15:37, Jan Beulich wrote:
>>>>> On 26.10.2023 14:35, Xenia Ragiadakou wrote:
>>>>>>
>>>>>>
>>>>>> On 26/10/23 14:51, Jan Beulich wrote:
>>>>>>> On 26.10.2023 11:46, Xenia Ragiadakou wrote:
>>>>>>>> On 26/10/23 11:45, Jan Beulich wrote:
>>>>>>>>> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
>>>>>>>>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>>>>>>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>>>>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>>>>>>>>>>                if ( end <= kernel_start || start >= kernel_end )
>>>>>>>>>>>>                    ; /* No overlap, nothing to do. */
>>>>>>>>>>>>                /* Deal with the kernel already being loaded in the region. */
>>>>>>>>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>>>>>>>>> +        else if ( kernel_start + kernel_end > start + end )
>>>>>>>>>>> What meaning has the sum of the start and end of either range? I can't
>>>>>>>>>>> figure how comparing those two values will be generally correct / useful.
>>>>>>>>>>> If the partial-overlap case needs handling in the first place, I think
>>>>>>>>>>> new conditionals need adding (and the existing one needs constraining to
>>>>>>>>>>> "kernel range fully contained") to use
>>>>>>>>>>> - as before, the larger of the non-overlapping ranges at start and end
>>>>>>>>>>>         if the kernel range is fully contained,
>>>>>>>>>>> - the tail of the range when the overlap is at the start,
>>>>>>>>>>> - the head of the range when the overlap is at the end.
>>>>>>>>>> Yes it is not quite straight forward to understand and is based on the
>>>>>>>>>> assumption that end > kernel_start and start < kernel_end, due to
>>>>>>>>>> the first condition failing.
>>>>>>>>>>
>>>>>>>>>> Both cases:
>>>>>>>>>> (start < kernel_start && end < kernel_end) and
>>>>>>>>>> (kernel_start - start > end - kernel_end)
>>>>>>>>>> fall into the condition ( kernel_start + kernel_end > start + end )
>>>>>>>>>>
>>>>>>>>>> And both the cases:
>>>>>>>>>> (start > kernel_start && end > kernel_end) and
>>>>>>>>>> (end - kernel_end > kernel_start - start)
>>>>>>>>>> fall into the condition ( kernel_start + kernel_end < start + end )
>>>>>>>>>>
>>>>>>>>>> ... unless of course I miss a case
>>>>>>>>> Well, mathematically (i.e. ignoring the potential for overflow) the
>>>>>>>>> original expression and your replacement are identical anyway. But
>>>>>>>>> overflow needs to be taken into consideration, and hence there is a
>>>>>>>>> (theoretical only at this point) risk with the replacement expression
>>>>>>>>> as well. As a result I still think that ...
>>>>>>>>>
>>>>>>>>>>> That said, in the "kernel range fully contained" case it may want
>>>>>>>>>>> considering to use the tail range if it is large enough, rather than
>>>>>>>>>>> the larger of the two ranges. In fact when switching to that model, we
>>>>>>>>>>> ought to be able to get away with one less conditional, as then the
>>>>>>>>>>> "kernel range fully contained" case doesn't need treating specially.
>>>>>>>>> ... this alternative approach may want considering (provided we need
>>>>>>>>> to make a change in the first place, which I continue to be
>>>>>>>>> unconvinced of).
>>>>>>>> Hmm, I see your point regarding the overflow.
>>>>>>>> Given that start < kernel_end and end > kernel_start, this could
>>>>>>>> be resolved by changing the above condition into:
>>>>>>>> if ( kernel_end - start > end - kernel_start )
>>>>>>>>
>>>>>>>> Would that work for you?
>>>>>>>
>>>>>>> That would look quite a bit more natural, yes. But I don't think it covers
>>>>>>> all cases: What if the E820 range is a proper sub-range of the kernel one?
>>>>>>> If we consider kernel range crossing E820 region boundaries, we also need
>>>>>>> to take that possibility into account, I think.
>>>>>>
>>>>>> You are right, this case is not handled and can lead to either of the
>>>>>> issues mentioned in commit message.
>>>>>> Maybe we should check whether end > start before proceeding with
>>>>>> checking the size.
>>>>>
>>>>> It looks like it all boils down to the alternative I did sketch out.
>>>>
>>>> I 'm not sure I fully understood the alternative.
>>>> Do you mean sth in the lines below?
>>>>
>>>>             if ( end <= kernel_start || start >= kernel_end )
>>>>                 ; /* No overlap, nothing to do. */
>>>>             /* Deal with the kernel already being loaded in the region. */
>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>> +        else if ( start < kernel_start && end > kernel_end ) {
>>>> +            if ( kernel_start - start > end - kernel_end )
>>>> +                end = kernel_start;
>>>> +            else
>>>> +                start = kernel_end;
>>>> +        }
>>>> +        else if ( start < kernel_start )
>>>>                 end = kernel_start;
>>>> -        else
>>>> +        else if ( end > kernel_end )
>>>>                 start = kernel_end;
>>>> +        else
>>>> +            continue;
>>>>
>>>>             if ( end - start >= size )
>>>>                 return start;
>>>
>>> Not exactly, no, because this still takes the size into account only
>>> in this final if().
>>>
>>>> You wouldn't like to consider this approach?
>>>
>>> I'm happy to consider any other approach. Just that ...
>>>
>>>>             if ( end <= kernel_start || start >= kernel_end )
>>>>                 ; /* No overlap, nothing to do. */
>>>>             /* Deal with the kernel already being loaded in the region. */
>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>> +        else if ( kernel_end - start > end - kernel_start )
>>>>                 end = kernel_start;
>>>>             else
>>>>                 start = kernel_end;
>>>>
>>>> -        if ( end - start >= size )
>>>> +        if ( end > start && end - start >= size )
>>>>                 return start;
>>>>         }
>>>
>>> ... I'm afraid this doesn't deal well with the specific case I was
>>> mentioning: If the E820 region is fully contained in the kernel range,
>>> it looks to me as if this approach would ignore the E820 altogether,
>>> since you either move end ahead of start or start past end then. Both
>>> head and tail regions may be large enough in this case, and if this
>>> was the only region above 1M, there'd be no other space to fall back
>>> to.
>>
>> Yes, in which case it will fail. This is legitimate.
> 
> Not really, if there is space available (but just not properly used).

I said so because I noticed that, if, for instance, the loading address 
conflicts with a reserved memory region, xen won't attempt to relocate 
the kernel (assuming that it is relocatable). It will fail.

> 
>> Currently, the code proceeds with the dom0 kernel being corrupted.
> 
> And we agree that this wants fixing.

Ok, and IIUC, using rangeset as per Roger's suggestion, right?

> 
> Jan

