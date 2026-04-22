Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBNrAyuG6GkNLQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:26:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 675574436CD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:26:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289993.1569677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFSuF-0003MW-DB; Wed, 22 Apr 2026 08:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289993.1569677; Wed, 22 Apr 2026 08:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFSuF-0003K1-9H; Wed, 22 Apr 2026 08:25:59 +0000
Received: by outflank-mailman (input) for mailman id 1289993;
 Wed, 22 Apr 2026 08:25:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wFSuD-0003Jv-PQ
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 08:25:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFSuD-00H70f-6B
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 10:25:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8860f-5cb7-0a2a0a5109dd-0a2a450a85e4-22
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:25:56 +0200
Received: from [40.107.200.2]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e88613-56b3-0a2a450a0019-286bc8026651-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:25:56 +0200
Received: from PH7P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::23)
 by DS0PR12MB7802.namprd12.prod.outlook.com (2603:10b6:8:145::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 08:25:51 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2603:10b6:510:338:cafe::fb) by PH7P223CA0016.outlook.office365.com
 (2603:10b6:510:338::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 08:25:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.4 via Frontend Transport; Wed, 22 Apr 2026 08:25:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 03:25:49 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 03:25:49 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 03:25:48 -0500
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
 b=PQcdmBTTwJ7gfgJelah4T1/4orDHKJMsdGbF5nXPfP5bPtkAihhugDr7s8Zu4sjgWDvnT5Wlli/5k+9InkHnqJl5VhALeLtd6RAM3/TIZWhhz8TItZOzYHOPaltuLElhtQnRRBMh6XXdTTnqdgSUGObTQANX2/+6FfgqlPptzydCZaRLeeijapNlFkAj1Unq/b265ZAr453iddFaAJJFZDtfem9sZz+iJ3Ix13Xcj9NCyda8/AHWvAzSRb2PY5P2+ezCg6TCB1nxQU6fxlRc0DhGpVqipqZzfLG0Zzt7BGufsnEF+EzDNjBibOScLXFCpjZzKh/DK1/w6hyYouO0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPaZejoR446CmFJSSpqOycV/xusB3cs2ho6iO59XoN8=;
 b=LhA7CoLDliU1FC/jMbvYYV/Gq48vvBI+KnFoyOeqFD3gMoq+B4jaoIEVV+bo53F4DHssLwj35WSiuzdCu2ByYNOof5J+O3jGNx1vQFkLUJdipMqSImK2qaNLUXwXwfh/fNyZzkYMZA34pltb3Fw0Tx7LUYACOcYw0lr1ZU+bB2oCUq1YFsiRWvHs3w6oYzOMuYo8XxS82aAxO9H7Fy+bZiZD4m3whean0RXEYg4NYn1tpG6aOp0qiuEz9NegL3Jj+utZ3nebl1aRIOlaFFnY/5ygRjLsNmgNk5GwvH67RISO5pPPi20qNWGFKrl2sBjVqOHeYPCua80PMsjn8Ffh9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPaZejoR446CmFJSSpqOycV/xusB3cs2ho6iO59XoN8=;
 b=fsyHHQP6x4pZ7gbYsDFvl2x6Fum/qG/rc1Q6IhNtiKERA0iCXKLig0qrkVM7/RFpQ7C1FLJIX9+Qni2Dr/c8aIIxvqjk53JcaL+5d++778nlMqsSc2uundrm83iHRUCCxLzigxM0VgyPP/ZQauNekNxObdxi+W24YpxApXrN2ik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d023e89c-6670-4604-92db-6796d200a988@amd.com>
Date: Wed, 22 Apr 2026 10:25:48 +0200
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
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6a43af84-ca86-41f2-b58d-57be5baf49de@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|DS0PR12MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fdca39-a71d-41be-fd6d-08dea048c312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18096099003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dDkcE0BgaooLq/Ux9xe2dGpnBwjGPah5oazwnG4aylfZ9Om7SqONuGkqgjHDh3VmjN2RhvURVj9Ckv9DlpVI3JDELNAyC+qJqZFJylGZ3WK3Js5FhATfBPfEEYjD78o9JhfIpd7urTsLm81uSPTx5g5sDhpMN3FF301ZaPsN+nQO9w5BjPdMfJlikihcXKRDiEhvSjzRMaIS7h1oRC0kyAueaobCWeXqsDf+ADWja/ti7TzvpHsnpbPclx6BGxrFLAHJfSYUiOdaH3tGimxTTMeYIcoR6MiBgtAl5ut0tMsTPmAnKBBKixWQ2HwzE0wbfyY07wYsmiyuXHJyY8QsLnqy/EFkLEDPPybiFRj0y3i/JmjTdgKJ5mGjbUrkhzNcKllu/U+B93oMNAS5ouhPgXUleG6pSH5lQZZtdMTtV3QsG7y/dGXrOb0cHQ+VmcEqUOdTBp0+oB6BQGtTLBpo34Vy1JVIf65SEXFWfof3pwClKcFLhzD3GILjeSK/U+xO9BzzfdYkBQDBV0y5t/nLbPaiNvDtztcq1JDRhKas9fIgP3ACo4ydvqr0rW0JrPQB5gODWBM1+b58kMERQH4lvljfEDGEYkGsh0gS1EvNEDg9gpCTu8fOw/bTAydhy80gFhTi8EJPxbHTN6lbTxl31fGh6om1Od/RkKpRgEGEqRFFyOSlAbbqyOkp6144GZX3i54qRpgehVyqjvFFusJ2V/6VGY5b8VVqZn6ZcHytl92bIsXdhVQwpB/+Q8nufMaWrYffIXCrfkB5QotMPugAhg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18096099003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RPJ79BiP0B7vKWImwLE+leo2lavhMy3zpi6IhAWsimMWFf2iGIVs435UYlDabtUyk4uMBQivmRTYMGIh+vw4FjbL3zo+j5zVUdZ2G4keDhLX25Mz/ZWgNDZEtOn9RjRV/WeL5MGwUk/EyGcmvSI+a3GiBtfLp7ZS49+WgkB4C/91QrrjcqBG3V81hlaQqh7rikQMaFQtY8Q604vA9Dc+906bipOnJit9MgsRt6J7lAFGRIGwR4sv4SB2tiHB45upHbTPxse/1Ca/Jorplz5rMnx3wOrz5pEHXR19+oFEwOoqajnIZeHFJzHjwA6hXRLWHcLZiFvNf/6DIapUqVCRGHopyIT57IexeKsh4xo/5gykXdCXY9IOdVMfMO6k5eDG94rV+o30uCPWCHed2fBBm61etGJnchRBFytyt7HYSMMIO7CP57JueN2TytU3vU6M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 08:25:50.2755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fdca39-a71d-41be-fd6d-08dea048c312
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7802
X-purgate-ID: tlsNG-4011c0/1776846356-815848B7-2E916D50/0/0
X-purgate-type: clean
X-purgate-size: 4706
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 675574436CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22/04/2026 09:01, Julien Grall wrote:
> Hi Michal,
> 
> On 17/04/2026 10:11, Michal Orzel wrote:
>> Refactor setup_frametable_mappings() into init_frametable(), modeled
>> after x86's implementation. Instead of mapping one contiguous frametable
>> covering ram_start to ram_end (including holes), iterate the
>> pdx_group_valid bitmap to allocate and map frametable memory only for
>> valid PDX groups, skipping gaps in the physical address space. At the
>> moment we don't really take into account pdx_group_valid bitmap.
>>
>> This reduces memory consumption on systems with sparse RAM layouts by
>> not allocating frametable entries for non-existent memory regions.
>>
>> A file-local pdx_to_page() override is needed because the generic macro
>> in xen/include/xen/pdx.h does not account for ARM's non-zero
>> frametable_base_pdx.
> 
> Can you provide a bit more details? I am a bit concerned that this could 
> result to subttle bug in the future if code within mm.c is expecting the 
> original behavior. It would be preferable if the change is either for 
> everyone on Arm or the function is renamed to avoid any clash.
The generic pdx_to_page macro does not account for offset which is something I
mentioned in the footer and I'm willing to work on in the future. As of today,
this macro is *unused* on Arm. It's only used by x86 in some special big mem
related scenario. Using generic pdx_to_page on Arm would be wrong, so a future
patch doing that would be wrong (the fact that this patch adds a local redefine
does not change anything). Do we need a rename for a local redefine in a file
that is only related to frametable? Maybe a comment and a TODO would be ok?

> 
> [...]
> 
>> +void __init init_frametable(paddr_t ram_start)
>> +{
>> +    unsigned int sidx, nidx, max_idx;
>>   
>>       /*
>>        * The size of paddr_t should be sufficient for the complete range of
>> @@ -26,24 +47,34 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>       BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
>>       BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
>>   
>> -    if ( frametable_size > FRAMETABLE_SIZE )
>> -        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
>> -              ps, pe);
>> +    max_idx = DIV_ROUND_UP(max_pdx, PDX_GROUP_COUNT);
>> +    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ram_start));
>>   
>> -    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
>> -    /* Round up to 2M or 32M boundary, as appropriate. */
>> -    frametable_size = ROUNDUP(frametable_size, mapping_size);
>> -    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
>> +    /*
>> +     * pdx_to_page(pdx_s) in init_frametable_chunk must be page-aligned
>> +     * for map_pages_to_xen(). Aligning to PDX_GROUP_COUNT guarantees this
>> +     * because PDX_GROUP_COUNT * sizeof(page_info) is always a multiple of
>> +     * PAGE_SIZE by construction.
>> +     */
>> +    frametable_base_pdx = ROUNDDOWN(frametable_base_pdx, PDX_GROUP_COUNT);
>>   
>> -    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
>> -                          frametable_size >> PAGE_SHIFT,
>> -                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
>> -    if ( rc )
>> -        panic("Unable to setup the frametable mappings.\n");
>> +    if ( (max_pdx - frametable_base_pdx) > FRAMETABLE_NR )
>> +        panic("Frametable too small\n");
>> +
>> +    for ( sidx = (frametable_base_pdx / PDX_GROUP_COUNT); ; sidx = nidx )
>> +    {
>> +        unsigned int eidx;
>> +
>> +        eidx = find_next_zero_bit(pdx_group_valid, max_idx, sidx);
>> +        nidx = find_next_bit(pdx_group_valid, max_idx, eidx);
>> +
>> +        if ( nidx >= max_idx )
>> +            break;
>> +
>> +        init_frametable_chunk(sidx * PDX_GROUP_COUNT, eidx * PDX_GROUP_COUNT);
> 
> The function will do a round-up the mapping to either a 2MiB or 32MiB 
> aligned size. This means we could potentially cover the previous mapped 
> region or the next one. I can't seem to find any code to cover this 
> use-case. What did I miss?
Hmm, I think I calculated something wrong here. Anyway, how about using 2MB
mapping size all the time? PDX group size is 2MB, in-loop chunks are multiple of
2MB, there is no roundup needed - zero overshoot. The last chunk may have ~2MB
overshoot but it does not matter as there is nothing after it to conflict with.
The downside is more TLB pressure.

Alternatively, we could reduce the mapping size closer to boundaries (x86
choice) but that would require a bit more work.

~Michal


