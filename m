Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FLaCTcW82llxAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 10:43:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE949F586
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 10:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297987.1573616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIMzD-0008HQ-1p; Thu, 30 Apr 2026 08:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297987.1573616; Thu, 30 Apr 2026 08:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIMzC-0008EQ-V5; Thu, 30 Apr 2026 08:43:06 +0000
Received: by outflank-mailman (input) for mailman id 1297987;
 Thu, 30 Apr 2026 08:43:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wIMzB-0008EK-H8
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 08:43:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIMzA-00EmiP-TN
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 10:43:04 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f3160a-5cb7-0a2a0a5109dd-0a2a450a8abe-30
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 10:43:04 +0200
Received: from [52.101.57.55]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f31616-56b3-0a2a450a0019-34653937eba7-4
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 10:43:03 +0200
Received: from DM6PR02CA0116.namprd02.prod.outlook.com (2603:10b6:5:1b4::18)
 by BN3PR12MB9570.namprd12.prod.outlook.com (2603:10b6:408:2ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Thu, 30 Apr
 2026 08:42:59 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:5:1b4:cafe::b7) by DM6PR02CA0116.outlook.office365.com
 (2603:10b6:5:1b4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 08:42:59 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Thu, 30 Apr 2026 08:42:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 03:42:58 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 03:42:58 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 30 Apr 2026 03:42:57 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOZkYm9qeKj6mBNutGeywT3/8qWLOVq/33wiIN9oCdKKBf6FO0MKNCx2w3NVYRd/gxk4jHKZWJynMIpS6NELsdrhD4SpPtJc/X8vkDZoYHXOa7hJiChgLzqloCRqdpFYeKqJkgA42qCvM17WqimMdDhiFhajca3VAKP8w67ugXVw6C1j5hcs0LTYB0wNmt6TVfG7+7eqv5Hf+h9NdOskBTOnZgEWMosUXA2KzuU7NvL6vEmxiNIqzx0oS2bFLaWIeSsvPQV3cEue3qSBxUreA4NWoMCeXq9NEBxR4t84E3mfrwuZe9l8uF50wSljNkmwMmWGNiJuj36LiYRdkNhHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JHC7x+39OR/WKJ+HCK0KVv7pkbu7w3ghxIhbpjgLIM=;
 b=ECos6BCeQ2KwmWZ76bEE/scwyZZWxYE7vHe1O8dcVmqbYasuy5fIrHGdyoDBu0R1LRZCsfr3KPVi6g87Bm3THfrrIlwk8CriiWf89zmnC3ohh440KYQzw8SVNIXM7/VcK607U7G28K3JBFkTsUuSXAReuhJqOqHAqedPV1kso8piQ0cNxkgqj/4tK/MRY4aQGa22RCoo4caIxxJO0YPV4VJilZaM9N50TaFyM9OIRHwBbuAD1AdVNUghM7lpzSJBlXy64/pIc3ZKpio4HY+fTsi+tdnAY1QGjntAmC8ChtWzDnjg8Q15HdjPjiHLkGgUf8GfD7VWFtVf/j144EFjRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JHC7x+39OR/WKJ+HCK0KVv7pkbu7w3ghxIhbpjgLIM=;
 b=IpjFjQM9qPSAIewFPqKDs3AE+IAgm0IyiLEk5FKLoFSB+P/emparDlKioKFFWB0x7CHsZVK3A+wazAHc8Jh8jSzsuP57/FLYip5+sDmjrNaAhWG0YKverQdFwJDxJ0IwF1gEdTIkaRa1AnAWBKD5XqbsfxrDk5J/Kp2gY0aXoOA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8c5da373-53db-45ac-8725-18e450d322f1@amd.com>
Date: Thu, 30 Apr 2026 10:42:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>
References: <20260417091124.39552-1-michal.orzel@amd.com>
 <6a43af84-ca86-41f2-b58d-57be5baf49de@xen.org>
 <d023e89c-6670-4604-92db-6796d200a988@amd.com>
 <c43983c9-35cf-4859-9ad4-6d46b731bb15@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <c43983c9-35cf-4859-9ad4-6d46b731bb15@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|BN3PR12MB9570:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc0f588-89e0-43fb-7811-08dea6947b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uUaKYxtLqDmz5WJJWO3NlRTC0KDobvzktoiRvYJxrOH2bpb96W2Bg7DHAx6Iu3qKFFh6n2e/Qyw1WmABxK5LrNKtCOQHzgdNURZ/Ni5ONZEpL4DQI7oHcb9HbegRRzTfHZItY00Ebqmkt4ahMjjjbqyHgcU9G3rj3Rigw9UnkNhVkXjZkQj2k1C/tohZDBJm0UxKVA1AJqUk879ncmFCS18WnFe/FS0e3xVA5RHTIRyVnuWQlwlYm08/F6EEl/R0SnDc9k3BNDMqebDVT73waxToQFfBNq2qcN2TJQvmz3o2N361575PeSYhqQSl3AJZZe9VzidQYfPKfKAtHqRWs7llms09XZmiJV7EDdJJMyia4/k/jeiainV6RrGHIz+TCZuUHmotuP1t623vpWfdYeN/05ohEHtHAoMK5+rQGl7Hmqd8VmnkgQUFsCHTExg2ykN9a/RYyjn8c3w7mBAYGpy4vt49+ortG8AhCIAesLt145ju0lFxKGYMqVF1IUsCkZwNXAxuOBo+ACFwijT8LboVbbTbSiTqsgmnZp/HhfJyAOac2CmGulTSmkT1KB7Xqw1jjLIEKH5mrmDIbV47DMPA6T4PmtRp2ZdxVULlWWq+HlfodwKzQ6Y4RaLsJLGE07c8Rri6N7xALo5VLLnP7DeVq9+GanuCKi4P0FhSM41372mbn/pV1zd4wq6xJhj4GizyvAhG1Wjvx3IkAL1uj9o2oGuqpH4ovDUTaNUoJyIawwOSIKqBgG53tHFRGl3H99eL2eR6QF/huZceeyeNGw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qexHVcJz+T/5GTHdWQTwAoRbEGWRRjE/PWWWxqZ95iEWIXT4gLn7oZBZZ+5NY4EraXv/EmvvtGtdLXCiPSHAFJwjR7gozGI/AX9zEtGxHotMPkrRXfCi67YM5QQS21DQ2rlAcGXRPSz85lqw5CAPQev3L49NSC9q9wlIBwOevP2DPIUKNhlZJYXsrA6CFIDA7kUpNASq1W/3ky82HDQBrSLGPBwteBFV4c4SC4WHA74hO5BDz1Oe3AmLDoWxxQdaM5+An5K5kcWk31MQi6S6SZp3ICL3Ul8o20oiaaNNj7s5xiTxJ3b/yZs3qTg6hTe/sjxCt+OPpxwfV+QZyizMYHcPE03JHaduL9Mq7mzdUwoxvbY3fLMv+U0JP7pxMtBjRkfo6Umh6GRqLgNLB9jIWgO0qr6+yHDB8FxFLgVl1j/MMFvPxT7I69/Dm4g2GLTt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 08:42:58.9814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc0f588-89e0-43fb-7811-08dea6947b79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9570
X-purgate-ID: tlsNG-4011c0/1777538584-CDD688B7-B24F7951/0/0
X-purgate-type: clean
X-purgate-size: 6329
X-Rspamd-Queue-Id: 73CE949F586
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Luca.Fancellu@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid]



On 29-Apr-26 16:42, Julien Grall wrote:
> Hi Michal,
> 
> On 22/04/2026 09:25, Orzel, Michal wrote:
>>
>>
>> On 22/04/2026 09:01, Julien Grall wrote:
>>> Hi Michal,
>>>
>>> On 17/04/2026 10:11, Michal Orzel wrote:
>>>> Refactor setup_frametable_mappings() into init_frametable(), modeled
>>>> after x86's implementation. Instead of mapping one contiguous frametable
>>>> covering ram_start to ram_end (including holes), iterate the
>>>> pdx_group_valid bitmap to allocate and map frametable memory only for
>>>> valid PDX groups, skipping gaps in the physical address space. At the
>>>> moment we don't really take into account pdx_group_valid bitmap.
>>>>
>>>> This reduces memory consumption on systems with sparse RAM layouts by
>>>> not allocating frametable entries for non-existent memory regions.
>>>>
>>>> A file-local pdx_to_page() override is needed because the generic macro
>>>> in xen/include/xen/pdx.h does not account for ARM's non-zero
>>>> frametable_base_pdx.
>>>
>>> Can you provide a bit more details? I am a bit concerned that this could
>>> result to subttle bug in the future if code within mm.c is expecting the
>>> original behavior. It would be preferable if the change is either for
>>> everyone on Arm or the function is renamed to avoid any clash.
>> The generic pdx_to_page macro does not account for offset which is something I
>> mentioned in the footer and I'm willing to work on in the future.
> 
> Sorry I missed the comment in the footer. But if the function is broken, 
> then why can't we implement pdx_to_page() correctly now? I understand 
> that ...
I wanted to do this in the future but ok, will do in v2.

> 
>   As of today,
>> this macro is *unused* on Arm. It's only used by x86 in some special big mem
>> related scenario. Using generic pdx_to_page on Arm would be wrong, so a future
>> patch doing that would be wrong (the fact that this patch adds a local redefine
>> does not change anything). Do we need a rename for a local redefine in a file
>> that is only related to frametable? Maybe a comment and a TODO would be ok?
> 
> ... this is not meant to be used by Arm today. But given this is used in 
> the page list, it is definitely not obvious that it is broken.
> 
> The alternative is to protect/move pdx_to_page() in x86. But I don't 
> know much churn this would involve.
> 
>>
>>>
>>> [...]
>>>
>>>> +void __init init_frametable(paddr_t ram_start)
>>>> +{
>>>> +    unsigned int sidx, nidx, max_idx;
>>>>    
>>>>        /*
>>>>         * The size of paddr_t should be sufficient for the complete range of
>>>> @@ -26,24 +47,34 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>>>        BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
>>>>        BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
>>>>    
>>>> -    if ( frametable_size > FRAMETABLE_SIZE )
>>>> -        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
>>>> -              ps, pe);
>>>> +    max_idx = DIV_ROUND_UP(max_pdx, PDX_GROUP_COUNT);
>>>> +    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ram_start));
>>>>    
>>>> -    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
>>>> -    /* Round up to 2M or 32M boundary, as appropriate. */
>>>> -    frametable_size = ROUNDUP(frametable_size, mapping_size);
>>>> -    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
>>>> +    /*
>>>> +     * pdx_to_page(pdx_s) in init_frametable_chunk must be page-aligned
>>>> +     * for map_pages_to_xen(). Aligning to PDX_GROUP_COUNT guarantees this
>>>> +     * because PDX_GROUP_COUNT * sizeof(page_info) is always a multiple of
>>>> +     * PAGE_SIZE by construction.
>>>> +     */
>>>> +    frametable_base_pdx = ROUNDDOWN(frametable_base_pdx, PDX_GROUP_COUNT);
>>>>    
>>>> -    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
>>>> -                          frametable_size >> PAGE_SHIFT,
>>>> -                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
>>>> -    if ( rc )
>>>> -        panic("Unable to setup the frametable mappings.\n");
>>>> +    if ( (max_pdx - frametable_base_pdx) > FRAMETABLE_NR )
>>>> +        panic("Frametable too small\n");
>>>> +
>>>> +    for ( sidx = (frametable_base_pdx / PDX_GROUP_COUNT); ; sidx = nidx )
>>>> +    {
>>>> +        unsigned int eidx;
>>>> +
>>>> +        eidx = find_next_zero_bit(pdx_group_valid, max_idx, sidx);
>>>> +        nidx = find_next_bit(pdx_group_valid, max_idx, eidx);
>>>> +
>>>> +        if ( nidx >= max_idx )
>>>> +            break;
>>>> +
>>>> +        init_frametable_chunk(sidx * PDX_GROUP_COUNT, eidx * PDX_GROUP_COUNT);
>>>
>>> The function will do a round-up the mapping to either a 2MiB or 32MiB
>>> aligned size. This means we could potentially cover the previous mapped
>>> region or the next one. I can't seem to find any code to cover this
>>> use-case. What did I miss?
>> Hmm, I think I calculated something wrong here. Anyway, how about using 2MB
>> mapping size all the time? PDX group size is 2MB,
> 
> Looking at the code, it seems to be based on SECOND_SHIFT which 
> technically depends on the page granularity. Even though Xen supports 
> only 4KiB, we are trying to avoid making such assumption or add least 
> adding a BUILD_BUG_ON() (in this case, I would consider that 
> PDX_GROUP_COUNT is always 2MiB or SECOND_SHIFT).
> 
>> in-loop chunks are multiple of
>> 2MB, there is no roundup needed - zero overshoot. The last chunk may have ~2MB
>> overshoot but it does not matter as there is nothing after it to conflict with.
>> The downside is more TLB pressure.
> 
> I am a bit warry to modify the frametable allocation method because it 
> is used fairly often in Xen. Would it be possible to hence the loop to 
> detect contiguous chunk and decide the size allocation based on the chunk?
To eliminate overshoot I'll round up to page size. In-loop chunks are already
page aligned so the round up is a no op except for the last chunk.

What we care about is to reduce TLB pressure by setting wherever possible
contiguous bit. It's not lost because map_pages_to_xen with block flag handles
contiguous internally via xen_pt_check_contig. Will do in v2.

~Michal


