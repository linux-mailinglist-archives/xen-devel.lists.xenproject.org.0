Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5557DB47C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 08:39:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.624957.973763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxMqK-0001uS-Th; Mon, 30 Oct 2023 07:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624957.973763; Mon, 30 Oct 2023 07:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxMqK-0001ry-Q1; Mon, 30 Oct 2023 07:37:48 +0000
Received: by outflank-mailman (input) for mailman id 624957;
 Mon, 30 Oct 2023 07:37:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=crLw=GM=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qxMqJ-0001rs-2R
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 07:37:47 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 353db09b-76f7-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 08:37:42 +0100 (CET)
Received: from CH0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:610:b0::9)
 by PH8PR12MB6915.namprd12.prod.outlook.com (2603:10b6:510:1bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 07:37:38 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::7d) by CH0PR03CA0004.outlook.office365.com
 (2603:10b6:610:b0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28 via Frontend
 Transport; Mon, 30 Oct 2023 07:37:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 30 Oct 2023 07:37:38 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 02:37:34 -0500
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
X-Inumbo-ID: 353db09b-76f7-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSKeomCb8xN8dhZkFphJ9Gv097jrA8LeHB4Orymb/dGer2lZywNroW+m64ZuJUVERJZqVvBaMfX1A/Yg0pVGCMKnAIrsGhefooESRd93i3NbNz7lrQHxqfUzm4RLx3gsaLyYA9tv6xkopABOq4+DkPF7pYrbKCAUeDpO2YRh51CqLWNTv6PJprQ45rphEM6bRhN4XJpicMG982VUoHUO9kJO3RJVU4cEA4O4wZe4NEuA8Ij/YiRoIImzF5rgmiBMGJPsjPP17FZGGpPe5YWI55BnvUt+cMnXonylJhKQ4j9VBsVbsanwsFX8B9QFB4hXSPD9CvM8J1XYpzJyrdD5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/CYNdLL1LC3+hOLXS5kCLgVvdRZGednHHuby0bDhEk=;
 b=n2PN/vfgFCzl3kCGqcp4NGKPAsyJ0SG6+3E+1ZlVU8yC7BY2+DMlzqyshCMO/r71UPIMBCn14O90kkApGIkXwnHgK5+q6eKlAD7uUEgj4ojF1B2wKuvosrsa0/lb6QwamTu5kcnLZzVnSNtmcS5QCtaNZG8XSOLb46H0OCjdAkwQjakPuLvnZ+Z+S7zkJKYyY8EsiCIg+Can/JbeaIrhNyOs4JpKcw8UgeUqTMUeEkHwn7gwcN9Pu5CLLeRVULgxotsuKt39qvn0McQqJM1zRqc5/oSu8ZtBBtY1ffbSulouubGqlyzfcIVBB6ObNTM7PNfybzzZ7uXWhs7b783geA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/CYNdLL1LC3+hOLXS5kCLgVvdRZGednHHuby0bDhEk=;
 b=3gQWg080ebn47Y+QYw46n/OiMz78QhzvJmxToTQ9rb8H99eqgPGGNwLdl6a7r01b3yYfJsWpi+PXUEHgJyC6EnxQ6aEWC8Oa9DgKLGJqyU2nEH81jL4JxGxq7Xd3dU5kuAxcfybPUl/LEHm4tko/m1imAQyBfWfYq6mfZNKtb+Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b203d30f-1563-45b6-9469-b25dda8df9a4@amd.com>
Date: Mon, 30 Oct 2023 09:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
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
 <987b5b7d-57f8-4d63-bd13-fe662b6cb87f@amd.com>
 <486c778c-4a33-703f-2811-27101d10ea9b@suse.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <486c778c-4a33-703f-2811-27101d10ea9b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|PH8PR12MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 9296c38b-d8d3-4f53-fd1e-08dbd91b1747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c4YrdPQeZN+liLTQ3IuJRAa8e7BVCo7SJCNNTFNn1oDkZwLn+/VE+KZg+nV58QTGnwHwij33/m1QsgzujExa7mNz9rvzP1RhoIhpI4nTLh+2kgF8yBAz1prsmH4p2U6N2Z4jkzV+edHMrm631J/ggGr52+ywNaivABhdTz4r5lDy67xJSq17+gmnCf0UgpqEAbZ6tEeZytfokWx7Cj/1vBcuz4YX3X1bW3Ha9grMlkOG980OPHJmigxydbnYuUMtSdc7t5LWr8zGvsIFgnpiggC2UT/NXTbRlcx0x6njfTmiaELL0kA4znmfC1W90mUBhY2qNbXBt8I213giwnugjMEZuzdXhz/HUd3AmJhX7/sB67foNnXO7eIR6UG4bPwPlrm1Al2vhI1D1iCKq5H8Xwy59HNWnrasfmgHxJL/I4AYH8NHiII09ty+KnnFjPqw54tTc+T+h/QH4zG5UOLNDj8N2hu6XkvbKBhFZ10xS+cyqfciCM/Z8y4rbPOeC4p7Q6wVQvDnEeXYYBkwpuqxb+ffQoS170ALLO7GURj2SBgs3FbdyoBOA0hW8fZ8FIk0RLuD/gflyxT9rVJuutTrUX7YwNiTzWrfblqpBBt7iH2rg7rC/jidYrCUcP3dK0Iss1/e8+lgspuiy/ZxPpfSHZYwLYYnUONLinm1u0621O1pNVKkElP6rJe4W6OKGE9nRD+u31MOPff9t2+uqZjJ+avwoXwnbT0j9/xoGMdDjOAg/2ClUVLoB1IqcoT727Vk4SXA2VLVKmYRR0QBdizgbhh63beOUF4cfLTqsKS/FSxg7MUgVsSAJShg4IVJSvDW
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(41300700001)(5660300002)(2906002)(478600001)(40460700003)(40480700001)(316002)(16576012)(54906003)(44832011)(4326008)(8676002)(8936002)(110136005)(70206006)(70586007)(66899024)(36860700001)(83380400001)(36756003)(47076005)(31696002)(31686004)(86362001)(356005)(81166007)(82740400003)(16526019)(426003)(2616005)(336012)(26005)(6666004)(53546011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 07:37:38.0526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9296c38b-d8d3-4f53-fd1e-08dbd91b1747
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6915


On 27/10/23 15:01, Jan Beulich wrote:
> On 27.10.2023 13:18, Xenia Ragiadakou wrote:
>>
>> On 27/10/23 09:37, Jan Beulich wrote:
>>> On 26.10.2023 18:55, Xenia Ragiadakou wrote:
>>>>
>>>>
>>>> On 26/10/23 17:55, Jan Beulich wrote:
>>>>> On 26.10.2023 15:58, Xenia Ragiadakou wrote:
>>>>>>
>>>>>> On 26/10/23 15:37, Jan Beulich wrote:
>>>>>>> On 26.10.2023 14:35, Xenia Ragiadakou wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 26/10/23 14:51, Jan Beulich wrote:
>>>>>>>>> On 26.10.2023 11:46, Xenia Ragiadakou wrote:
>>>>>>>>>> On 26/10/23 11:45, Jan Beulich wrote:
>>>>>>>>>>> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
>>>>>>>>>>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>>>>>>>>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>>>>>>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>>>>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>>>>>>>>>>>>                 if ( end <= kernel_start || start >= kernel_end )
>>>>>>>>>>>>>>                     ; /* No overlap, nothing to do. */
>>>>>>>>>>>>>>                 /* Deal with the kernel already being loaded in the region. */
>>>>>>>>>>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>>>>>>>>>>> +        else if ( kernel_start + kernel_end > start + end )
>>>>>>>>>>>>> What meaning has the sum of the start and end of either range? I can't
>>>>>>>>>>>>> figure how comparing those two values will be generally correct / useful.
>>>>>>>>>>>>> If the partial-overlap case needs handling in the first place, I think
>>>>>>>>>>>>> new conditionals need adding (and the existing one needs constraining to
>>>>>>>>>>>>> "kernel range fully contained") to use
>>>>>>>>>>>>> - as before, the larger of the non-overlapping ranges at start and end
>>>>>>>>>>>>>          if the kernel range is fully contained,
>>>>>>>>>>>>> - the tail of the range when the overlap is at the start,
>>>>>>>>>>>>> - the head of the range when the overlap is at the end.
>>>>>>>>>>>> Yes it is not quite straight forward to understand and is based on the
>>>>>>>>>>>> assumption that end > kernel_start and start < kernel_end, due to
>>>>>>>>>>>> the first condition failing.
>>>>>>>>>>>>
>>>>>>>>>>>> Both cases:
>>>>>>>>>>>> (start < kernel_start && end < kernel_end) and
>>>>>>>>>>>> (kernel_start - start > end - kernel_end)
>>>>>>>>>>>> fall into the condition ( kernel_start + kernel_end > start + end )
>>>>>>>>>>>>
>>>>>>>>>>>> And both the cases:
>>>>>>>>>>>> (start > kernel_start && end > kernel_end) and
>>>>>>>>>>>> (end - kernel_end > kernel_start - start)
>>>>>>>>>>>> fall into the condition ( kernel_start + kernel_end < start + end )
>>>>>>>>>>>>
>>>>>>>>>>>> ... unless of course I miss a case
>>>>>>>>>>> Well, mathematically (i.e. ignoring the potential for overflow) the
>>>>>>>>>>> original expression and your replacement are identical anyway. But
>>>>>>>>>>> overflow needs to be taken into consideration, and hence there is a
>>>>>>>>>>> (theoretical only at this point) risk with the replacement expression
>>>>>>>>>>> as well. As a result I still think that ...
>>>>>>>>>>>
>>>>>>>>>>>>> That said, in the "kernel range fully contained" case it may want
>>>>>>>>>>>>> considering to use the tail range if it is large enough, rather than
>>>>>>>>>>>>> the larger of the two ranges. In fact when switching to that model, we
>>>>>>>>>>>>> ought to be able to get away with one less conditional, as then the
>>>>>>>>>>>>> "kernel range fully contained" case doesn't need treating specially.
>>>>>>>>>>> ... this alternative approach may want considering (provided we need
>>>>>>>>>>> to make a change in the first place, which I continue to be
>>>>>>>>>>> unconvinced of).
>>>>>>>>>> Hmm, I see your point regarding the overflow.
>>>>>>>>>> Given that start < kernel_end and end > kernel_start, this could
>>>>>>>>>> be resolved by changing the above condition into:
>>>>>>>>>> if ( kernel_end - start > end - kernel_start )
>>>>>>>>>>
>>>>>>>>>> Would that work for you?
>>>>>>>>>
>>>>>>>>> That would look quite a bit more natural, yes. But I don't think it covers
>>>>>>>>> all cases: What if the E820 range is a proper sub-range of the kernel one?
>>>>>>>>> If we consider kernel range crossing E820 region boundaries, we also need
>>>>>>>>> to take that possibility into account, I think.
>>>>>>>>
>>>>>>>> You are right, this case is not handled and can lead to either of the
>>>>>>>> issues mentioned in commit message.
>>>>>>>> Maybe we should check whether end > start before proceeding with
>>>>>>>> checking the size.
>>>>>>>
>>>>>>> It looks like it all boils down to the alternative I did sketch out.
>>>>>>
>>>>>> I 'm not sure I fully understood the alternative.
>>>>>> Do you mean sth in the lines below?
>>>>>>
>>>>>>              if ( end <= kernel_start || start >= kernel_end )
>>>>>>                  ; /* No overlap, nothing to do. */
>>>>>>              /* Deal with the kernel already being loaded in the region. */
>>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>>> +        else if ( start < kernel_start && end > kernel_end ) {
>>>>>> +            if ( kernel_start - start > end - kernel_end )
>>>>>> +                end = kernel_start;
>>>>>> +            else
>>>>>> +                start = kernel_end;
>>>>>> +        }
>>>>>> +        else if ( start < kernel_start )
>>>>>>                  end = kernel_start;
>>>>>> -        else
>>>>>> +        else if ( end > kernel_end )
>>>>>>                  start = kernel_end;
>>>>>> +        else
>>>>>> +            continue;
>>>>>>
>>>>>>              if ( end - start >= size )
>>>>>>                  return start;
>>>>>
>>>>> Not exactly, no, because this still takes the size into account only
>>>>> in this final if().
>>>>>
>>>>>> You wouldn't like to consider this approach?
>>>>>
>>>>> I'm happy to consider any other approach. Just that ...
>>>>>
>>>>>>              if ( end <= kernel_start || start >= kernel_end )
>>>>>>                  ; /* No overlap, nothing to do. */
>>>>>>              /* Deal with the kernel already being loaded in the region. */
>>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>>> +        else if ( kernel_end - start > end - kernel_start )
>>>>>>                  end = kernel_start;
>>>>>>              else
>>>>>>                  start = kernel_end;
>>>>>>
>>>>>> -        if ( end - start >= size )
>>>>>> +        if ( end > start && end - start >= size )
>>>>>>                  return start;
>>>>>>          }
>>>>>
>>>>> ... I'm afraid this doesn't deal well with the specific case I was
>>>>> mentioning: If the E820 region is fully contained in the kernel range,
>>>>> it looks to me as if this approach would ignore the E820 altogether,
>>>>> since you either move end ahead of start or start past end then. Both
>>>>> head and tail regions may be large enough in this case, and if this
>>>>> was the only region above 1M, there'd be no other space to fall back
>>>>> to.
>>>>
>>>> Yes, in which case it will fail. This is legitimate.
>>>
>>> Not really, if there is space available (but just not properly used).
>>
>> I said so because I noticed that, if, for instance, the loading address
>> conflicts with a reserved memory region, xen won't attempt to relocate
>> the kernel (assuming that it is relocatable). It will fail.
> 
> Hmm, if so, perhaps yet something else to deal with.
> 
>>>> Currently, the code proceeds with the dom0 kernel being corrupted.
>>>
>>> And we agree that this wants fixing.
>>
>> Ok, and IIUC, using rangeset as per Roger's suggestion, right?
> 
> Going that route would be optimal of course, but I for one wouldn't
> insist.

Roger what's your opinion on this? Would it be ok for now to send a v2 
with just the change above (i.e. that might fail if the image extends 
over a really large memory area containing all usable memory regions) 
and implement later your suggested solution (probably taking into 
account in the implementation also image relocation aspect in case of 
conflicts)?

Jan would it be possible to sketch a patch of your suggested solution 
because I 'm afraid I have not fully understood it yet and I won't be 
able to implement it properly for a v2?

