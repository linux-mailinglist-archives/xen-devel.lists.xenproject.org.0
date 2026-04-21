Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAexOadS52mn6gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:34:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EA5439973
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288842.1569079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8QZ-0001ji-5n; Tue, 21 Apr 2026 10:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288842.1569079; Tue, 21 Apr 2026 10:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8QZ-0001i3-2b; Tue, 21 Apr 2026 10:33:59 +0000
Received: by outflank-mailman (input) for mailman id 1288842;
 Tue, 21 Apr 2026 10:33:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wF8QX-0001hx-QH
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:33:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8QX-003IaE-75
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:33:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e75291-bab6-0a2a0a5309dd-0a2a45029a20-22
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:33:56 +0200
Received: from [52.101.43.30]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e75291-af86-0a2a45020019-34652b1efb6c-4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:33:55 +0200
Received: from CH2PR19CA0013.namprd19.prod.outlook.com (2603:10b6:610:4d::23)
 by BN7PPF3C1137D8A.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6cd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 21 Apr
 2026 10:33:49 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::ad) by CH2PR19CA0013.outlook.office365.com
 (2603:10b6:610:4d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:33:48 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 10:33:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 21 Apr
 2026 05:33:48 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Apr
 2026 05:33:48 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 05:33:46 -0500
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
 b=NbeTWD0poOGL/jD6lJmAGOstYfXbpo9LYns9Nt8SuoW0gVD9TuOZ5H4+Tk0zTZjbhvX2OHI2aGUrg0kbTybemDEQnahRuECKRns0q63PI96e/2CiyolBilDBPw15dVCWpyQheFNnJ1NPd6OV7WdFLXTU8ZyjLDuRBRzv/SWueQDWhFxVdLloZwv2VXogcc+U6joaPFrErI9Ztb2fWQB3/bWSIBnX4VIMuhc/5Qj8O9AwWKo+zR+xKH+qCx8ix0ALOaEQvMYyyCjjkn+OdmvGQazeRTXGSZi6zp9PlBZEXzi9xoQ+/4Kjkf0e7vucjOrfmNWjbSG3drsOEXKB2o6mRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxmIw3KmI0vcN0/yo8LF+iFhya3BDpRME4P4eJ4t2CA=;
 b=rQ2V5px5ucAxiMVF3mX7IOf5IM+8710M+DERFhCW+4v3wBDvHUpLO+S4N5uM3s8TSwFk4ukl0VOtRgR6aYVRuVLpPowWSesC/XHLb4D7pNzsmfT50ufLp+J1nOJz34yqvX36Qt29QgGh4UAKZa3DO+0bPrfKMguufq+rXPbYgF8dI6pca+5xCtTKgsNC/v8WKeBijXFKqjt+3ZqmiBzUf0Oa7D59SY8eTymrGyL/7LvVtgXxqLaLFkX7kU1coBpjY3jFFYcHm9sxOcHl7HybKRrQ1EEbPVlfkxr2bq101A/kquo4uHCFtraJTa+KdW6zWEBv18yA10+v/znlEmQLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxmIw3KmI0vcN0/yo8LF+iFhya3BDpRME4P4eJ4t2CA=;
 b=gzGrVij+sWFmCYLQ35DoqqI5hUZUCAqvteVvvRIlfOXDoKYvLRiH/ehmqAPMtJ5TcabIj5gtVWil039xXxtGIby9cXo8bs2thGK3HLp1h7GXDBW0TGqVwA1ioxHBwvevEJqQmF6qs9/lz7ZXy81T+Kc9OjPqenEA2HnRa3B+eC4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <6a6aefa7-530b-4221-b2b3-65ca3298aef1@amd.com>
Date: Tue, 21 Apr 2026 12:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20260417091124.39552-1-michal.orzel@amd.com>
 <DB4CBEA0-B901-466E-80AE-483FE00A1282@arm.com>
 <10ef543f-ec21-47ae-aeb2-f569f8d48e27@amd.com>
 <F79D2A76-9FD3-4E6F-A26F-286B57E87BD8@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <F79D2A76-9FD3-4E6F-A26F-286B57E87BD8@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|BN7PPF3C1137D8A:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e78135-147f-4f2d-5b91-08de9f917953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|18096099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/E+5nfcShUtcKyNJZ5RbA9GommDTLC5mJBKEjg2iP3yX/QIMd/IXbaecatdHc3HxDPFkWa6WDjv+lkvSrmH9US+2maJU1M0LuO9OAuMv8ZTRWH7gztWAl2Q6aXCpe4Hbt2T/GiwnHtzrZ4enEHU+dxSsuXv8HNUEThXz4HeMoNjFfY2tFJ+2IVBBakFCMnLUc2cjewikODX0nYqM9+w9UzBp+4Xy89nScWnHzTRtr4pkZ2pUHiGYLK6dIwyZ/xscjrz1r4ADE9cb1uCB0SvZwR6rw5MAksE+huTYuEsCmpuE4jr81i70R+UD7S7Atqg8pvLECKxzHeMhqFf20wlDwX1KSWYeZx25A3DAypD37vkdm9l6afQ0IEwN1Qf8sM+LhxcAVr6cJ8X2iX27J0choHWwx8cvjIStHf4D4Skrshx9fF2ZRb/9pfONhdWjApTxRFwIHzWazSuV5FpNPiIde53Rs0ivwola2ZN7V/EBk8ThOOXhuiElyvql4tqwXoq4mpD2F97RWHxMB9IC5zyry0WKUUHhzqbvInabC+TwPFFuRlWbyeSqGRW9CxOjqqazoh+U6vQC6jNj7Y1iLIYYZqtDyg4pJWKTkhK6bMsNGWWpbQjD4vSXUGxVtD0V9vi1vxaoMARmsTRDwb6cQvDSI0oMqIHSQ4O6TTQ/vIlaXAIIwDA4vbctda5CCdEeSWIDLzXnlgAVeWCJ4GLDCubXatzF2FFNtpzKqFpvpHm+t6+kVpt+qMLeBFJfEMrDfKJXSeqx5X/QWVi74CgwDN7FxQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(18096099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Bx/7z7wPkdGsL8/M8UgVN3UJrgUf579tNNBCv+KafMPU4ta2kV/zq84BZR3LAt4rdtv3xwqknaWihZ4zEE61EOD3UwZROS42LoQxygwSJMfuHg2AKEqu/Pj7BGEguwYXxdLOH07R6xmkO1lGMy1Fxla5Om3OsPQyMj8bYxht/m4t77VWdTwGWjpmCVkRp4q9KEnOecg/G08celjjIufN+jmVn3eQAFyHrCRYFDEpXrhepbwfEYPK/lzMj/ZLBxSKwvKdFZAzuttoQKcFpS8RM1zcIujtmI+JFFr7+2dzDN5TihDY2gWNPdKQPEzb+K/fDMF6nC1TMrnzydRC4U7S4wS2GhW3+846Kj1jFBQRqEyE+5uFrYtd4YLLGDggdHEInjb009ZPuhndqAIQN8bJ0Tc2KrKOltYhMdWhjxiYH6agXVR/o/xTTIFW/tT6JXQs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:33:48.7222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e78135-147f-4f2d-5b91-08de9f917953
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF3C1137D8A
X-purgate-ID: tlsNG-720697/1776767636-82374161-C161E082/0/0
X-purgate-type: clean
X-purgate-size: 3976
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 54EA5439973
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 20/04/2026 16:06, Luca Fancellu wrote:
> HI Michal,
> 
>>>> +void __init init_frametable(paddr_t ram_start)
>>>> +{
>>>> +    unsigned int sidx, nidx, max_idx;
>>>>
>>>>    /*
>>>>     * The size of paddr_t should be sufficient for the complete range of
>>>> @@ -26,24 +47,34 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>>>    BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
>>>>    BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
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
>>>
>>> We are now rounding down frametable_base_pdx which before this patch it was the start of the ram,
>>> but in xen/xen/arch/arm/include/asm/mm.h, mfn_valid(mfn) is using frametable_base_pdx to check for
>>> mfn validity, this means that we could pass an mfn before the start of the ram and if __mfn_valid is happy,
>>> we are getting a regression.
>>>
>>> Can this happen or am I missing something?
>> mfn_valid() can indeed return true for an MFN below ram_start that falls
>> in the same PDX group, but this is safe. init_frametable_chunk() maps
>> and zeroes the frametable for that range, so mfn_to_page() won't fault.
>> The zeroed page_info has count_info == 0 and no owner, so any get_page()
>> call on it will fail — the page is effectively inert.
> 
> Yes, I’ve checked and many path relying on mfn_valid() go also through mfn_to_page()
> and/or get_page(), there is only one in process_shm() that potentially could add a shared memory page
> given that we are relaxing mfn_valid now.
We are not relaxing mfn_valid now. It has never meant to mean RAM. It means the
MFN has a corresponding frame table entry with struct page_info. This is what
it's comment says.

Static shmem is safe for ghost MFN. In prepare_staticmem_pages() we have a check
for count_info that for ghost MFN is 0.

> 
> I’m trying also to follow is_iomem_page(), to check if subsequent mfn_to_page() fail safely, but I think that depending
> on that (mfn_valid) the page will be only treated differently, not sure if it’s a latent bug to leave mfn_valid() as it is.\
On Arm, is_iomem_page() is just !mfn_valid(), so yes, ghost MFNs
would be classified as not IOMEM. But this is harmless because is_iomem_page()
on ARM is only called from grant table paths that operate on pages obrtained by
get_page(), so no Arm code can reach is_iomem_page with a ghost MFN.

> 
> Would it be valid to have something like mfn_to_page() != 0 to be part of mfn_valid() to ensure it’s a real host ram page?
> I’m truly asking here because I didn’t check if it’s doable.
As already said, mfn_valid was never supposed to mean RAM page. It is just that
on ARM the two happened to coincide until this patch.

> 
> Otherwise we could split the round down and the frametable_base_pdx in this way maybe?
I don't think we need this extra complexity for something that is safe and has
always been in use. We've never had mfn_valid == RAM guarantee.

~Michal


