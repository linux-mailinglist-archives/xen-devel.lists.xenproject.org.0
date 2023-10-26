Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48887D8719
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 18:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623932.972229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw3eM-0000cW-16; Thu, 26 Oct 2023 16:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623932.972229; Thu, 26 Oct 2023 16:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw3eL-0000ar-UY; Thu, 26 Oct 2023 16:56:01 +0000
Received: by outflank-mailman (input) for mailman id 623932;
 Thu, 26 Oct 2023 16:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm+b=GI=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qw3eJ-0000ZX-S3
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 16:56:00 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e89::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 881781dd-7420-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 18:55:57 +0200 (CEST)
Received: from BL1P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::26)
 by DM4PR12MB6542.namprd12.prod.outlook.com (2603:10b6:8:89::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.26; Thu, 26 Oct 2023 16:55:53 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::ab) by BL1P221CA0014.outlook.office365.com
 (2603:10b6:208:2c5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Thu, 26 Oct 2023 16:55:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 16:55:53 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 11:55:51 -0500
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
X-Inumbo-ID: 881781dd-7420-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYko6/PgnIvbbRZ8NcRFezpJIsQE7l6tp9JTpas4+Z+nDuxd2KmX6Pxd+nYTM5n9Vfl4YTLN5WWZ7486XvaYZB0fdzeNGeHpdPXiO0tVcKQVLLRhV5cVSIFPJm9x+KOlse94HMe2iGfbZ+G3OLTY98ml+RRE9XUAKh3J7vaklM7R00F0Y0rPCKewJ4wmfTzZsHSs201PZMpIxPb3StVhjFD7vsLc0kDqGvrwgESxEt+Hz9eGpvrQKCsQejuG1gfVjXJKU3Nvx2kGuVnPCCAb94Z1Gc24i5E1jmVJOf4AzzyOZpBGvuxg8YGX7KqHoJnSq9CvC0kQOa5M+onN+WwucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmM4VFXFDvI7vffaTVwp2NFg8lPVjkYqfb5g2Ur4ErA=;
 b=KvXonN9uyCPfD7w2g7AN/ZCOyhomo370Jtww+Vgbb4h7BlaCFlko1j7paxHgJ3UjbS8cnTnxdZNfVhK514lJEyUDJDsugP78u1ovNZGsO4r7OSzyacC1fxMDDAZGmC2doqdvKmQEXVX7FwCJJup2+hSBmdaQZOkpPjuR2N39ux4+Egb4kx8SpfndDm1JB30u4kDNWelTEYJYpnYIt3lfMaA/+z2rIa3dwMuiuxMJZZ2ZFEHbLgQmF4b2m7agl3563zcDFbwtkTjeYHReWXOoUHYFXgIyRRSfOhUk3vlf6odAmFMkJiI7Pvl8q8U/AYCjpmvoayjvRU+YrB4eoimJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmM4VFXFDvI7vffaTVwp2NFg8lPVjkYqfb5g2Ur4ErA=;
 b=LZ8tvn+adkY1Eu9zP+ZfA0O0uuI02qldR1rq38cU12QYp/n1kd76tx0GXAXLC2OKnPlsrpIHo8Zn2AviVNX0NqNrpNse/R2pQ+yF5yfdMe/o8W2U87yC8NtE78vC/kf8lf3KJpeRO8Rog0d8Y/VT3I5AaVjOOcYr1u9a6Fp+7Hk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <217d9079-3072-441a-a4ba-4db28c565bc7@amd.com>
Date: Thu, 26 Oct 2023 19:55:44 +0300
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
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <a61926bc-e3e6-e381-45de-be3a4878b6af@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|DM4PR12MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cb8e0d1-908c-4741-1e54-08dbd6446a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r4V+q5Z175YBmc3fJCDBaRKscWEmp3WZgptrFqTXmUkUe+4Ju7BIJfPtp66XuYeI5VIw67qE4l3WrPL2BQLLYzT87NNCcDOa7HUVSdAmrgwe94yuYQkgmUzEKwqHtlxo5txpfiluZ4/6mhpV/YbANFwDIXSa+KWzhh7wetrQ+1a6Y/Qb14ng/l1T048qg0AuKBgrCWocIWmoh5c8DPMMLpoVnNzClr7wiPEmh5W/dU2FvtvpIhVhIEdpHu/r6suSi99gzncEyYuhOFXdMX/J27xpiyDEnudxcda1HHvmi3UO+36mSsQvD3MY9Yc3w8Tzb78XKihzodJaeUW8TaVm0p4Vqrut19+HOyPjef5lLLWvpwVwk3o/5z91okLGUMXSWcIXv7uRdEtmWonzhfUgywEou1w6jk88vFatRn9ucZKhgOg3pQ38Hu7lnpeTcrwXH9hMxDuAgB8a/jcrrljGzWljke0iHMw9l3anxjBUSkICOZUfgwVPcPFE6GobtV/XSlRNJGykByFb2ZHc/zjxKyfWO09l9x3Fi6J4f/lCRVk8XlgBNT+5Nrpsu1Q0gGdwI1rnkqWMBjjhtRjVgLY5Se3E8EEzgnY62X/sZXNWhVpxBFwASeJAe4xnhNTjakL6bBQ8HremmP6tbN+iJluqqGhjfnP+2DqFaH5LJK1oNIsbKZnp1Iqs55QgAv/chm+x8FihxQ0solkTyRQobv4uxCOwoeDpMF9cYxNqh1TSOLkci8/9r/JnSOCT9qIZ7mlqFSMf1tUqg/N+Emvd3JFKbS2OFjUzBu/ynzUXxFk6p+t0bMaBMVCe42LfdgMjTyk4
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799009)(40470700004)(46966006)(36840700001)(36756003)(66899024)(40480700001)(31686004)(40460700003)(16576012)(2616005)(54906003)(316002)(6916009)(81166007)(31696002)(70206006)(86362001)(82740400003)(70586007)(356005)(426003)(2906002)(336012)(83380400001)(16526019)(36860700001)(26005)(6666004)(8936002)(53546011)(41300700001)(47076005)(4326008)(44832011)(5660300002)(478600001)(8676002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 16:55:53.0680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb8e0d1-908c-4741-1e54-08dbd6446a39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6542



On 26/10/23 17:55, Jan Beulich wrote:
> On 26.10.2023 15:58, Xenia Ragiadakou wrote:
>>
>> On 26/10/23 15:37, Jan Beulich wrote:
>>> On 26.10.2023 14:35, Xenia Ragiadakou wrote:
>>>>
>>>>
>>>> On 26/10/23 14:51, Jan Beulich wrote:
>>>>> On 26.10.2023 11:46, Xenia Ragiadakou wrote:
>>>>>> On 26/10/23 11:45, Jan Beulich wrote:
>>>>>>> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
>>>>>>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>>>>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>>>>>>>>               if ( end <= kernel_start || start >= kernel_end )
>>>>>>>>>>                   ; /* No overlap, nothing to do. */
>>>>>>>>>>               /* Deal with the kernel already being loaded in the region. */
>>>>>>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>>>>>>> +        else if ( kernel_start + kernel_end > start + end )
>>>>>>>>> What meaning has the sum of the start and end of either range? I can't
>>>>>>>>> figure how comparing those two values will be generally correct / useful.
>>>>>>>>> If the partial-overlap case needs handling in the first place, I think
>>>>>>>>> new conditionals need adding (and the existing one needs constraining to
>>>>>>>>> "kernel range fully contained") to use
>>>>>>>>> - as before, the larger of the non-overlapping ranges at start and end
>>>>>>>>>        if the kernel range is fully contained,
>>>>>>>>> - the tail of the range when the overlap is at the start,
>>>>>>>>> - the head of the range when the overlap is at the end.
>>>>>>>> Yes it is not quite straight forward to understand and is based on the
>>>>>>>> assumption that end > kernel_start and start < kernel_end, due to
>>>>>>>> the first condition failing.
>>>>>>>>
>>>>>>>> Both cases:
>>>>>>>> (start < kernel_start && end < kernel_end) and
>>>>>>>> (kernel_start - start > end - kernel_end)
>>>>>>>> fall into the condition ( kernel_start + kernel_end > start + end )
>>>>>>>>
>>>>>>>> And both the cases:
>>>>>>>> (start > kernel_start && end > kernel_end) and
>>>>>>>> (end - kernel_end > kernel_start - start)
>>>>>>>> fall into the condition ( kernel_start + kernel_end < start + end )
>>>>>>>>
>>>>>>>> ... unless of course I miss a case
>>>>>>> Well, mathematically (i.e. ignoring the potential for overflow) the
>>>>>>> original expression and your replacement are identical anyway. But
>>>>>>> overflow needs to be taken into consideration, and hence there is a
>>>>>>> (theoretical only at this point) risk with the replacement expression
>>>>>>> as well. As a result I still think that ...
>>>>>>>
>>>>>>>>> That said, in the "kernel range fully contained" case it may want
>>>>>>>>> considering to use the tail range if it is large enough, rather than
>>>>>>>>> the larger of the two ranges. In fact when switching to that model, we
>>>>>>>>> ought to be able to get away with one less conditional, as then the
>>>>>>>>> "kernel range fully contained" case doesn't need treating specially.
>>>>>>> ... this alternative approach may want considering (provided we need
>>>>>>> to make a change in the first place, which I continue to be
>>>>>>> unconvinced of).
>>>>>> Hmm, I see your point regarding the overflow.
>>>>>> Given that start < kernel_end and end > kernel_start, this could
>>>>>> be resolved by changing the above condition into:
>>>>>> if ( kernel_end - start > end - kernel_start )
>>>>>>
>>>>>> Would that work for you?
>>>>>
>>>>> That would look quite a bit more natural, yes. But I don't think it covers
>>>>> all cases: What if the E820 range is a proper sub-range of the kernel one?
>>>>> If we consider kernel range crossing E820 region boundaries, we also need
>>>>> to take that possibility into account, I think.
>>>>
>>>> You are right, this case is not handled and can lead to either of the
>>>> issues mentioned in commit message.
>>>> Maybe we should check whether end > start before proceeding with
>>>> checking the size.
>>>
>>> It looks like it all boils down to the alternative I did sketch out.
>>
>> I 'm not sure I fully understood the alternative.
>> Do you mean sth in the lines below?
>>
>>            if ( end <= kernel_start || start >= kernel_end )
>>                ; /* No overlap, nothing to do. */
>>            /* Deal with the kernel already being loaded in the region. */
>> -        else if ( kernel_start - start > end - kernel_end )
>> +        else if ( start < kernel_start && end > kernel_end ) {
>> +            if ( kernel_start - start > end - kernel_end )
>> +                end = kernel_start;
>> +            else
>> +                start = kernel_end;
>> +        }
>> +        else if ( start < kernel_start )
>>                end = kernel_start;
>> -        else
>> +        else if ( end > kernel_end )
>>                start = kernel_end;
>> +        else
>> +            continue;
>>
>>            if ( end - start >= size )
>>                return start;
> 
> Not exactly, no, because this still takes the size into account only
> in this final if().
> 
>> You wouldn't like to consider this approach?
> 
> I'm happy to consider any other approach. Just that ...
> 
>>            if ( end <= kernel_start || start >= kernel_end )
>>                ; /* No overlap, nothing to do. */
>>            /* Deal with the kernel already being loaded in the region. */
>> -        else if ( kernel_start - start > end - kernel_end )
>> +        else if ( kernel_end - start > end - kernel_start )
>>                end = kernel_start;
>>            else
>>                start = kernel_end;
>>
>> -        if ( end - start >= size )
>> +        if ( end > start && end - start >= size )
>>                return start;
>>        }
> 
> ... I'm afraid this doesn't deal well with the specific case I was
> mentioning: If the E820 region is fully contained in the kernel range,
> it looks to me as if this approach would ignore the E820 altogether,
> since you either move end ahead of start or start past end then. Both
> head and tail regions may be large enough in this case, and if this
> was the only region above 1M, there'd be no other space to fall back
> to.

Yes, in which case it will fail. This is legitimate.
Currently, the code proceeds with the dom0 kernel being corrupted.

> 
> Jan

