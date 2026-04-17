Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHz9FTMv4ml22gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:01:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72FF41B699
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284247.1566081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDioC-0007ZV-OG; Fri, 17 Apr 2026 13:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284247.1566081; Fri, 17 Apr 2026 13:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDioC-0007Wz-Kl; Fri, 17 Apr 2026 13:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1284247;
 Fri, 17 Apr 2026 13:00:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wDioA-0007Wt-Tu
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:00:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDioA-0004OW-Ag
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 15:00:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e22ee9-5cb7-0a2a0a5109dd-0a2a4506bafe-30
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:00:29 +0200
Received: from [40.93.194.22]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e22eec-7371-0a2a45060019-285dc21612f9-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:00:29 +0200
Received: from BN9PR03CA0565.namprd03.prod.outlook.com (2603:10b6:408:138::30)
 by SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 13:00:22 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:138:cafe::eb) by BN9PR03CA0565.outlook.office365.com
 (2603:10b6:408:138::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 13:00:22 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 13:00:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Apr
 2026 08:00:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Apr
 2026 08:00:21 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 17 Apr 2026 08:00:20 -0500
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
 b=u/QTFZurobU2adsVIwHsPfdltGUrv3Lw1Uua0Wn7DypL3DHWrzqcfvrC9VJ7E2qArhJQoKXHRA0bk/3oBWnpQH54aWO98qH1Z4BaYvdhvQFX4DsuJZUdeDpU3z8UbWntvRC3i5Ca8x58F39ERTAMOcgH3Fe5V0X3mxFrIu2eXkqMZOzN+ZkIlHZg5RnnMv7UIPzMzA9BN6D2odlU0kqNZIJm1cRSWTESMSoOntL2b4uhJ7+/uo3U4HBA8PXrPDbED6jnWwfjFt9qbH0vTcbdW8f3Nx1ERZBralRd/UsbESkFFXBD82vrJjF2apV0JHM4oSEhCunKQ9tFIUNWTRZVrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGBCUoFvBoLY1l8zK2g1yAcOw/qCn1Vfog7D6mHfJGc=;
 b=Y+DHJhlB+xvTfpCuwx7iP/LcmycmBuV1lKwOYs5AHzjvppfZr9BaavgHrlsbvyCkWkbzFT4ST8moByaZhpruYdmsw/6tIAqsOxYvLu3SpwbIV586/rgnOdPM94dVycSoZ+oJXnoFiYXI/e2E4Mdf/R17ZmnjzoWIMVAtrifgExRAQR+xw8KJkB8xTOF1aanlkzMTYZnzCpGrGsDQimTHRMXiV6Pc0F/YwFOUtNHKav5MQ/21BJvKtF22yegtYgeKNPZFQkSufSxlw4YRCPMws8qAh7KuxrD69zucwy6KVmV+I/JvoeDNuzPQRmyKuNCfyAEbppE4Sq7CZlhR0rNZ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGBCUoFvBoLY1l8zK2g1yAcOw/qCn1Vfog7D6mHfJGc=;
 b=Vm8zYNlgldPgjoEXg+KClQYt3Ami/nANNmlP453vxxgRqz1huIZxpGeW4CxjcwSHjEXBILAD4N7kbrnQISXJRrB3VJi3+mgl1MK50lk2lmyYT84QcCZdjLUiLnU3ibVBgWb7frAeMJ7Vx5GBkHn8KCb+30H/er4RuiElY5qLyKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <10ef543f-ec21-47ae-aeb2-f569f8d48e27@amd.com>
Date: Fri, 17 Apr 2026 15:00:19 +0200
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
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <DB4CBEA0-B901-466E-80AE-483FE00A1282@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|SA3PR12MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ba5cc8-05a6-4f5e-af4d-08de9c8148f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18096099003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Q3QC4sYB1shys1ji2SStLTIAPOA99ayClXvZmeZv+zZl79AGk+Wp/J8mUXNqXt00pOoofIwdBWHgKq/Oxwea5lwpDypqkLuV0YnklJry0q3EI+qbYRS7pbYXVPneHUMvIpLRarRcmvLeD6w3eYxbPNFfRPXpiRr6TsWOp6ifGKYXCB1Nx1EfGCfYAP6WvtlgdpSng2lQ+CUNoH8H1b9tMFtj/HF9lwLWaAZ3m+Rz5wmgCd2uAOOCyKvBBI+XLr/NnjmdHBp+XtXMfDqNubMc3kTroDc7ISlwG3eeclRVVMynzBR5w9WJ63qjBDFky/DfgU0oMuRt9yued+d5RqGy7GMxjbaJYjBgnNVhbf4ikf8FyR/0WvhnzyoFteXvAxtqoyv4II6ro+ElqQMwoGHKgx8BV88R31qGXlTRmlIO6fb2r/4I8v5VsLIXO/isMvOqq0Q39Yg5HNlzeO2HLGICa6lV5w1tzpFKSM2VATo/kigA8u123U5U1TZNAbdBDZhKfl19goPV1VzD489gr3ZQekzCRMfxg0aZceQ9wd1NmoXhrFmET74rIQOcuX4WW8ZmFEJSrKsBsCHEJVhV6BBp2iuAJoy74JHaNzUXX1DT2+7YFPYQVTS9wogBqg3u1zORctVNBrDKBPvSS1eUmfGn2dHR9GFRtDzRFa2iKepgfT/vv5/VN/pqAMhHbHG1VWsF9SgNg1ce8N2UEo+soFmVJemFzN7X/4EbPoKQrqeyNMy2ylfAoX1tzFCiiPDD3giaGHGo2y1YoUEN4+JWhlaULQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18096099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5Q1fkmpiTnC2OAcVts4qa7+3EC553sFxD++5VROxj4it8HNZro1+uZRB9gPsLcaAYiIdcD3fqv4dKXLSwwZbOEZCmKHIdRtZl6wSYAmk1NVa6+KIt2OLoQg08FjYeRnr2IoU6l3i8Ln0mYchdO6FkUJ3gE6GLlHKQsyB6HOU9xpfpOzId2jxvuKQIPNvYrAgaUUMTo7AA0SC930mXUKV2nxeGNU2UrkS6bT0ggv5W2wuzeLmIPUPyUkcp//i6bNQyhsyyZBL8HGgSvOSINhBBntQEuYQ1A1iqVzocC+OW56033yIPnALDaN67iZbMej+hlPx7ALeCQtNEbzgQoxsnSqx8B7Qkq0HIH/yrlOyxmrefrQjqqJMTJyP8yf77a+UNqYjzYean3WVaaIq+7F3/8qr3HklAAr285HLJFlVKet94esCzSQM8nguVKpjGBWh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 13:00:22.1435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ba5cc8-05a6-4f5e-af4d-08de9c8148f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859
X-purgate-ID: tlsNG-16d1c6/1776430829-90E7CD75-ABF76D70/0/0
X-purgate-type: clean
X-purgate-size: 11206
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: A72FF41B699
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 17/04/2026 13:55, Luca Fancellu wrote:
> HI Michal,
> 
>> On 17 Apr 2026, at 10:11, Michal Orzel <michal.orzel@amd.com> wrote:
>>
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
>>
>> Update the MPU implementation to match the new init_frametable()
>> signature. Since MPU has no virtual address translation (ma == va),
>> hole-skipping is not possible and the frametable remains a single
>> contiguous allocation.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> We've been using this approach at AMD for a while now. Without this we would not
>> be able to boot some of our boards that have huge holes in the PA space, so I
>> consider this patch a great improvement.
>>
>> Two things to consider as a follow-up in the future:
>> - change generic pdx_to_page, page_to_pdx to take into account offset that
>>   on x86 is zero but on other arches it is not. The page list code is
>>   for now unaffected because the offset cancels out,
>> - use the same on RISCV.
>> ---
>> xen/arch/arm/arm32/mmu/mm.c   |  3 +-
>> xen/arch/arm/include/asm/mm.h |  4 +-
>> xen/arch/arm/mm.c             |  2 +-
>> xen/arch/arm/mmu/mm.c         | 77 ++++++++++++++++++++++++-----------
>> xen/arch/arm/mpu/mm.c         | 23 ++++++-----
>> 5 files changed, 70 insertions(+), 39 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
>> index 5e4766ddcf65..0b595baa11b3 100644
>> --- a/xen/arch/arm/arm32/mmu/mm.c
>> +++ b/xen/arch/arm/arm32/mmu/mm.c
>> @@ -178,8 +178,7 @@ void __init setup_mm(void)
>>
>>     setup_directmap_mappings(mfn_x(directmap_mfn_start), xenheap_pages);
>>
>> -    /* Frame table covers all of RAM region, including holes */
>> -    setup_frametable_mappings(ram_start, ram_end);
>> +    init_frametable(ram_start);
>>
>>     /*
>>      * The allocators may need to use map_domain_page() (such as for
>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>> index 72a692862420..2eb8465aa904 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -196,8 +196,8 @@ extern void *early_fdt_map(paddr_t fdt_paddr);
>> extern void remove_early_mappings(void);
>> /* Prepare the memory subystem to bring-up the given secondary CPU */
>> extern int prepare_secondary_mm(int cpu);
>> -/* Map a frame table to cover physical addresses ps through pe */
>> -extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>> +/* Map a frame table */
> 
> NIT: Would /* Initialize the frame table */ fit better the new helper description?
> 
>> +void init_frametable(paddr_t ram_start);
>> /* Helper function to setup memory management */
>> void setup_mm_helper(void);
>> /* map a physical range in virtual memory */
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 6df8b616e464..e6b651956927 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -62,7 +62,7 @@ void __init setup_mm(void)
>>
>>     setup_mm_helper();
>>
>> -    setup_frametable_mappings(ram_start, ram_end);
>> +    init_frametable(ram_start);
>>
>>     init_staticmem_pages();
>>     init_sharedmem_pages();
>> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
>> index 6604f3bf4e6a..4b4da349c16c 100644
>> --- a/xen/arch/arm/mmu/mm.c
>> +++ b/xen/arch/arm/mmu/mm.c
>> @@ -8,16 +8,37 @@
>> #include <xen/pdx.h>
>> #include <xen/string.h>
>>
>> -/* Map a frame table to cover physical addresses ps through pe */
>> -void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>> +#undef pdx_to_page
>> +#define pdx_to_page(pdx) gcc11_wrap(frame_table + ((pdx) - frametable_base_pdx))
>> +
>> +static void __init
>> +init_frametable_chunk(unsigned long pdx_s, unsigned long pdx_e)
>> {
>> -    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
>> -                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
>> -    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
>> -    mfn_t base_mfn;
>> -    const unsigned long mapping_size = frametable_size < MB(32) ? MB(2)
>> -                                                                : MB(32);
>> +    unsigned long nr_pdxs = pdx_e - pdx_s;
>> +    unsigned long chunk_size = nr_pdxs * sizeof(struct page_info);
>> +    const unsigned long mapping_size = chunk_size < MB(32) ? MB(2) : MB(32);
>> +    unsigned long virt;
>>     int rc;
>> +    mfn_t base_mfn;
>> +
>> +    /* Round up to 2M or 32M boundary, as appropriate. */
>> +    chunk_size = ROUNDUP(chunk_size, mapping_size);
>> +    base_mfn = alloc_boot_pages(chunk_size >> PAGE_SHIFT, 32 << (20 - 12));
>> +
>> +    virt = (unsigned long)pdx_to_page(pdx_s);
>> +    rc = map_pages_to_xen(virt, base_mfn, chunk_size >> PAGE_SHIFT,
>> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
>> +    if ( rc )
>> +        panic("Unable to setup the frametable mappings\n");
>> +
>> +    memset(pdx_to_page(pdx_s), 0, nr_pdxs * sizeof(struct page_info));
>> +    memset(pdx_to_page(pdx_e), -1,
>> +           chunk_size - nr_pdxs * sizeof(struct page_info));
>> +}
>> +
>> +void __init init_frametable(paddr_t ram_start)
>> +{
>> +    unsigned int sidx, nidx, max_idx;
>>
>>     /*
>>      * The size of paddr_t should be sufficient for the complete range of
>> @@ -26,24 +47,34 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>     BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
>>     BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
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
> 
> We are now rounding down frametable_base_pdx which before this patch it was the start of the ram,
> but in xen/xen/arch/arm/include/asm/mm.h, mfn_valid(mfn) is using frametable_base_pdx to check for
> mfn validity, this means that we could pass an mfn before the start of the ram and if __mfn_valid is happy,
> we are getting a regression.
> 
> Can this happen or am I missing something?
mfn_valid() can indeed return true for an MFN below ram_start that falls
in the same PDX group, but this is safe. init_frametable_chunk() maps
and zeroes the frametable for that range, so mfn_to_page() won't fault.
The zeroed page_info has count_info == 0 and no owner, so any get_page()
call on it will fail — the page is effectively inert.

~Michal

> 
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
>> +    }
>>
>> -    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
>> -    memset(&frame_table[nr_pdxs], -1,
>> -           frametable_size - (nr_pdxs * sizeof(struct page_info)));
>> +    init_frametable_chunk(sidx * PDX_GROUP_COUNT, max_pdx);
>> }
>>
>> /*
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index aff88bd3a9c1..9c568831c128 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -186,16 +186,15 @@ static int is_mm_attr_match(pr_t *region, unsigned int attributes)
>>     return 0;
>> }
>>
>> -/* Map a frame table to cover physical addresses ps through pe */
>> -void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>> +/*
>> + * Allocate a contiguous frame table covering ram_start through max_pdx.
>> + * Unlike the MMU version, MPU cannot skip holes because there is no virtual
>> + * address translation (ma == va).
>> + */
>> +void __init init_frametable(paddr_t ram_start)
>> {
>> +    unsigned long nr_pdxs, frametable_size;
>>     mfn_t base_mfn;
>> -    paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
>> -    paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
>> -
>> -    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(aligned_pe), -1)) -
>> -                            mfn_to_pdx(maddr_to_mfn(aligned_ps)) + 1;
>> -    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
>>
>>     /*
>>      * The size of paddr_t should be sufficient for the complete range of
>> @@ -204,11 +203,13 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>     BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
>>     BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
>>
>> +    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ram_start));
>> +    nr_pdxs = max_pdx - frametable_base_pdx;
>> +    frametable_size = nr_pdxs * sizeof(struct page_info);
>> +
>>     if ( frametable_size > FRAMETABLE_SIZE )
>> -        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
>> -              ps, pe);
>> +        panic("Frametable too small\n");
>>
>> -    frametable_base_pdx = paddr_to_pdx(aligned_ps);
>>     frametable_size = ROUNDUP(frametable_size, PAGE_SIZE);
>>
>>     base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 1);
>> -- 
>> 2.43.0
>>
> 


