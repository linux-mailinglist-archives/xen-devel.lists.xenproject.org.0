Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F8C7D82BF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 14:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623788.971963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzaL-0002oG-LP; Thu, 26 Oct 2023 12:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623788.971963; Thu, 26 Oct 2023 12:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzaL-0002mD-IW; Thu, 26 Oct 2023 12:35:37 +0000
Received: by outflank-mailman (input) for mailman id 623788;
 Thu, 26 Oct 2023 12:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm+b=GI=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qvzaJ-0002m7-Tj
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 12:35:36 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27474139-73fc-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 14:35:33 +0200 (CEST)
Received: from SN4PR0501CA0109.namprd05.prod.outlook.com
 (2603:10b6:803:42::26) by PH7PR12MB8178.namprd12.prod.outlook.com
 (2603:10b6:510:2b3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Thu, 26 Oct
 2023 12:35:27 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:803:42:cafe::7d) by SN4PR0501CA0109.outlook.office365.com
 (2603:10b6:803:42::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.8 via Frontend
 Transport; Thu, 26 Oct 2023 12:35:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 12:35:27 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 07:35:25 -0500
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
X-Inumbo-ID: 27474139-73fc-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTc1xbsVZs8vwLQ5VoyWZ1ss19T5K8m0bvMXNimXsWQ+N6hEaUA9YfIc8Elsip2PznJxGtMECK4CVlLPWamlHPGT7/ckwyhx3UQplTTfjL7EH0byWtmXKD4wxb1Tqh70SSYkFO1aQb4s3AxUlderHeHpjmwsoVXpRm7v2vO3aZ8X/x0+SZBmzk1WHholvQHdi34632hS7MW9scqorwAB4uce1yXJV6mFbIcIsGKb3KT6HCUISKY9M+XHZ6HGDr766+A/S3UrQWAFcM5O6RXoi2XSqA4gJFhSzZzOhzJWMbmD0EkNMDXRyI5+pNM1YRrDEmZIJyHP6lQiSD/FPHbcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Z0YrACsDmrJTDBS5/nxOQkTWg003VE1l/wnmJpsq7Y=;
 b=Olxkq4uTAGdqA0ZIMVCxBMkZsgVHthhyaezTks7hQ85ln7q+GwUKJP0BsQG34gnCD3F8rMDVjRxDuHhxpz5VI9w4dUjM0hIbDVZ7NRLjqIq+wfuWkYdS4n0Mhomr6HKshvziJ5ndJAADVRzzmFNBnUJimHhn2jGA9AEKcXAw8qQKHmrk46NG2ApPOECdZf/MDU/wT8uM38kMJjllXfgDnhW8Ch79X8/ftnNSZwCimzKAK3SD+glkMT32joKEapyqGemsX+M0fOgF6zsthsk4hBB5ZDoSng786CTz0VWG5LA49+ejX7tUBS7j3e/bpdevm+26VCCAjdFOIM/rufnI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Z0YrACsDmrJTDBS5/nxOQkTWg003VE1l/wnmJpsq7Y=;
 b=3DurrXjHUk1GJp4VWI3A6VMDy84TRXiUo7odhLS/1A8jq944RzhIvIGN8Qkv1uhtSSjn2A66UembG+XDxnXOTkVNvvnDlMpPY3SG4i3EXh98XIKAzB1hCfqE/OiBYFRMbDBlUOztpaWaQu/EyuPLYGJ4qVSfy1dwqyB6TXXUVMo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b5330686-82a0-4d47-9549-2d943ca68c7e@amd.com>
Date: Thu, 26 Oct 2023 15:35:22 +0300
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
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <c81a8275-ecfd-7598-c119-ed83b156c0e5@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|PH7PR12MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: e04f3ab4-9a79-4d56-7827-08dbd6200887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y0sqXbiy0fTEc8NMIN1PXDoVLsA29MfdE5Hq/Frj75MxXy0ajbY/3wbTup+CMCDw3h72OoUkK8k8DPxwlBdDTpxwehIH2uo8ca0TyCahOF/CKCkQNY0Sx/+1Ndtd40Q+qYDkyA3TfRyCAsTr9GhiisDerCrRIuQ4nt/vDs0BPogsXqYOt8hbxcqaAl3zPiM7a2hMJ0Y5DzwFNJnXKsS3/MVy+cPb+m9OeCynGT7KZsbIeXXnM0t7B//uKIBjEm+WbCE8eLfDuaVvpkvbc2X9QO1LqBvVFMrD34PxmFD4fyjDW7EuOybvGZowk02GX8pPvdyPF30XyHzdkBKEz89KpOkWi+W1F77JJwt+CEBjbAy3Td79ltZDftdbGltjKS4+4LHRpUfDWBU9HEZ1kvseyIKPOd04qizqjBC+LFI9Bxt7pWEdWiQmlw6RNenZlqwhhoaMkSmUggcgeWXMfwZAHjA2POUWDa6i/6FDLmOskwEduqhSxmpt1sUp/4tWFFGAEQTe2OlKZyC0439e152NxHDoA2ImI3i9mlSbR7TIlNIo4ynMv7K/p7wByz0hGAHQil6B1j53eZgtIZeAwEQWw/IKYlxSdNChHXuHBgf0Upqn8Xi7RDCw/TQZC51bRTSVoxKQ7pkPqBD77rtMJZrYwUP+fVpFlvCBwBlrkc1vYlm9tqAxKvFcv6+0D+b8ui+PvxBLJGmG33l8kCX2aAbFeVQdCaBnKSf2XA2QxHLZRiXG9G7Rb5D7ml9zs2LURpsdLmWqQ/iaFXUCrwSHs7flJtF0JymyYJbo3qpLVLIurAgjU18V1eUSfP+INH+NmuqV
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(46966006)(40470700004)(36840700001)(16526019)(26005)(31686004)(66899024)(41300700001)(2906002)(36860700001)(44832011)(31696002)(36756003)(40460700003)(86362001)(5660300002)(8676002)(8936002)(4326008)(478600001)(6916009)(6666004)(70206006)(81166007)(82740400003)(54906003)(16576012)(70586007)(356005)(83380400001)(336012)(2616005)(53546011)(47076005)(426003)(40480700001)(316002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 12:35:27.2825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e04f3ab4-9a79-4d56-7827-08dbd6200887
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8178



On 26/10/23 14:51, Jan Beulich wrote:
> On 26.10.2023 11:46, Xenia Ragiadakou wrote:
>> On 26/10/23 11:45, Jan Beulich wrote:
>>> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
>>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>>>>             if ( end <= kernel_start || start >= kernel_end )
>>>>>>                 ; /* No overlap, nothing to do. */
>>>>>>             /* Deal with the kernel already being loaded in the region. */
>>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>>> +        else if ( kernel_start + kernel_end > start + end )
>>>>> What meaning has the sum of the start and end of either range? I can't
>>>>> figure how comparing those two values will be generally correct / useful.
>>>>> If the partial-overlap case needs handling in the first place, I think
>>>>> new conditionals need adding (and the existing one needs constraining to
>>>>> "kernel range fully contained") to use
>>>>> - as before, the larger of the non-overlapping ranges at start and end
>>>>>      if the kernel range is fully contained,
>>>>> - the tail of the range when the overlap is at the start,
>>>>> - the head of the range when the overlap is at the end.
>>>> Yes it is not quite straight forward to understand and is based on the
>>>> assumption that end > kernel_start and start < kernel_end, due to
>>>> the first condition failing.
>>>>
>>>> Both cases:
>>>> (start < kernel_start && end < kernel_end) and
>>>> (kernel_start - start > end - kernel_end)
>>>> fall into the condition ( kernel_start + kernel_end > start + end )
>>>>
>>>> And both the cases:
>>>> (start > kernel_start && end > kernel_end) and
>>>> (end - kernel_end > kernel_start - start)
>>>> fall into the condition ( kernel_start + kernel_end < start + end )
>>>>
>>>> ... unless of course I miss a case
>>> Well, mathematically (i.e. ignoring the potential for overflow) the
>>> original expression and your replacement are identical anyway. But
>>> overflow needs to be taken into consideration, and hence there is a
>>> (theoretical only at this point) risk with the replacement expression
>>> as well. As a result I still think that ...
>>>
>>>>> That said, in the "kernel range fully contained" case it may want
>>>>> considering to use the tail range if it is large enough, rather than
>>>>> the larger of the two ranges. In fact when switching to that model, we
>>>>> ought to be able to get away with one less conditional, as then the
>>>>> "kernel range fully contained" case doesn't need treating specially.
>>> ... this alternative approach may want considering (provided we need
>>> to make a change in the first place, which I continue to be
>>> unconvinced of).
>> Hmm, I see your point regarding the overflow.
>> Given that start < kernel_end and end > kernel_start, this could
>> be resolved by changing the above condition into:
>> if ( kernel_end - start > end - kernel_start )
>>
>> Would that work for you?
> 
> That would look quite a bit more natural, yes. But I don't think it covers
> all cases: What if the E820 range is a proper sub-range of the kernel one?
> If we consider kernel range crossing E820 region boundaries, we also need
> to take that possibility into account, I think.

You are right, this case is not handled and can lead to either of the 
issues mentioned in commit message.
Maybe we should check whether end > start before proceeding with 
checking the size.

> 
> Jan

