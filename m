Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNEnGS7d+WkwEwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 14:06:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C834CD325
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 14:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300616.1575152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEWz-0003Dy-S0; Tue, 05 May 2026 12:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300616.1575152; Tue, 05 May 2026 12:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEWz-0003Bj-On; Tue, 05 May 2026 12:05:41 +0000
Received: by outflank-mailman (input) for mailman id 1300616;
 Tue, 05 May 2026 12:05:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wKEWy-0003Bd-QU
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:05:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKEWx-005vM1-Kz
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 14:05:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f9dd0f-2eae-0a2a0a5409dd-0a2a450c8aaa-18
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 14:05:39 +0200
Received: from [52.101.43.27]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f9dd0f-62f1-0a2a450c0019-34652b1b576d-4
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 14:05:38 +0200
Received: from SN7PR04CA0187.namprd04.prod.outlook.com (2603:10b6:806:126::12)
 by MN0PR12MB6031.namprd12.prod.outlook.com (2603:10b6:208:3cd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 12:05:32 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:806:126:cafe::9e) by SN7PR04CA0187.outlook.office365.com
 (2603:10b6:806:126::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 12:05:32 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 12:05:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 5 May
 2026 07:05:31 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 May
 2026 07:05:31 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 5 May 2026 07:05:29 -0500
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
 b=CKo/fRfXwmPSo7mXghDEEgYPu6Or2DbszOeVDiIWXWh1/kgcNMmnq/BMCJxnFllEiVUyRx+lbzEbRp8y+s6Sp+mndxhyEcwVyJTIbN4Q7pPZl70W0FD1uB40N/5sz7N24Jhs3xZ33clB9TKorX7N1wV5JIUDxrjtrj7sqhVEAJQQ5xETilaGaAYaxFh7cuLNuHAQE26JYrWbgiLLiGTLpRw3f3aSSsyqdlios9eqnRUEiHirKC5l8MCOX90P/wfFIeSEHl8DhU+ElEUP163zLKu52oNnXnFc8WjiM2BM6TuqkLhxGfuy5k60IFaCHZg4SEOxCV9/TQ2vndlHPGt8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1wjyIEW03DCcuHQQRebCMd7gpjUDK0w5BpKWUMVNxY=;
 b=LyKSTYtzZw6K1HWZmUY1zYH6JPABiQOnqDdwLR9dRKYZ9TYZ31NZLVNI+Reg4t+EGxjRo7W2VVB4pKKw1XhMZSB/p2Hk69i6wRD6u7g0K+oiSm+sgZ3psvtdZsykZ1Oq28g8y+WONN2QJ+y7vqGpiNvHir63FYg6Q3bHJUhf23N4+mJ60uoJKIF95mm2bkNg8+igmpcgC6KxXTGfa9gI18G8AvArp8Zkr5LpWnKzhFPyXoYAbMQcaBYiO9F159KhcvE4dan81U+DGzRSZ/v8xi4lhcCNZj2zw1oEDpAaV3txSPAf81jM5Z1gro81BQ1Rha/XjSmLznCHQRXtBhIucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1wjyIEW03DCcuHQQRebCMd7gpjUDK0w5BpKWUMVNxY=;
 b=w+6fnbc2mT13C7KZ2Bx39HXUBDeuTxBcWvxbjd/x8VXbAVCHVdBAdeHsyjsGfBbt4HoVrfuhRc8jI1BXABF+3yqrqb7C1Ar1KxNwnVd0r+fXM7mYVZxHGlv2dvf3PHS4YyBQ5kK42o9sA5O+RKIFXjOpuK/oo1g7SbZf16pwBa0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <177a399e-b5f3-4f5e-9011-c77978bc6acc@amd.com>
Date: Tue, 5 May 2026 14:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm/mpu: Implement p2m tables
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Harry Ramsey <harry.ramsey@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260420142224.1802911-1-luca.fancellu@arm.com>
 <20260420142224.1802911-4-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260420142224.1802911-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|MN0PR12MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db6145c-ae75-4e2e-8c91-08deaa9e9b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+ykKu3OGEpATGM2OLPqxqRQwCHTgC7wUCAPlkq+b8yNwntGqsO+t4UAW9KlmZ8c0Kq1RIbZkKOwrGnkr+pLe89zTODOHFrTD+vXx3NtK465gi7OsVKuKJ5+FzlVJQumwfwBmbMT4jmYHAihgEogA/mu9KCd7qvxHNJ4p7msoGeOxSIbsstxkFn7SvxgMVJWJegBIy0HKwi5eiHsaDbWG6mu4VIce09Lr+mHoKoe3fTnLCd9Qs6b5iZ4fGhUt1gXsqTVP8SA1vNToIRXqJaSSpCK7E9BqllnhjMO5qVPR2KVIu85vKLsPLUTToOZRDB2gQ/bsili4iZ8jyGq/hANmxzdeHF6FJCoQDcd4Z5kP2hkOYrMi42kqjwCZcb3x6ytrNqtlmYmvVhZzx07A8kWo/U5sfRDAPObB2XosYheoRfWfzGKZJobNdy0+YYt06h0EY9XfIVGNx4Fpg2lKaWf8AfB4UzvorncayY9QrRpIJf9sBn8SbP7yhkvKY6p7KJKCeDbMZYypeeQxsIAj33OY3IqVmyLvXawTjUKm3E5/7YUo9liXiihkeUTZADndFAIQxPj5QP8oh9/HMcolgyPY4xbIWFl6frcdjpsyj1C/gchTZg+fuMVHLLdW9QbmlAWwYSgT0xecQpNeWAqPpPWRvevzC8ysA/UqVGuItgvHaI5Ll+WsDCq26PDlCE1GjRHUtaL2/xett3awbJKzUYEuC7MeJsRZ8VugdFXBDwUxwOw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LUeI3dNZApWS6lTqw1D1VT5Wd00E428VKhvgcQMaC440uu1ClqhfiusAsu4J3Ks39qkHzwXiHIfiI8CXRAcTZA/LABVRa1SU5sB3L3u5Y/5ZdugsdM4gZZSCY//J57T+F9fQ6gWKo/Yy8ze9nDkmRhdKBR2vRvdr40e7USB+QW2e6MZDVZKmarqFnoisRuFIZqHzeMJrubnxzrr0xL+wkEDDsLHzZEDY+Q7TyOeHPjCKLk+rux9poaM757D14xUsNXhbClP5HtCQ43U+6Oe+UA3pBJ+UfMamKCll6Dv9qy/PbdNcsaEZxXF42ICAJurq+yOQ+SjVtttSAI61px3rs6TOg0jOLOapAqyC+90eskCBDB/4lKnJS1ccrOZr3R8A4VTSa54R1pEkgVbKNyyBHk06cZ27x60cc/j9tU/LnP+vS1G22Kj+BFqu05bNzQSv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 12:05:31.8854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db6145c-ae75-4e2e-8c91-08deaa9e9b41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6031
X-purgate-ID: tlsNG-d25034/1777982739-F600DCF5-1DA359C9/0/0
X-purgate-type: clean
X-purgate-size: 6652
X-Rspamd-Queue-Id: B3C834CD325
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:harry.ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]



On 20-Apr-26 16:22, Luca Fancellu wrote:
> From: Harry Ramsey <harry.ramsey@arm.com>
> 
> Implement `p2m_alloc_table`, `p2m_init` and `p2m_final_teardown` for MPU
> systems.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4:
>  - no changes
> v3:
> - Check for alloc_xenheap_pages allocation
> - Clear additional page allocated for ARM64
> - Add check for INVALID_VCPU_ID
> - Remove unnecessary function generate_vsctlr
> - Code formatting fixes
> ---
>  xen/arch/arm/include/asm/arm32/mpu.h |  2 +
>  xen/arch/arm/include/asm/arm64/mpu.h |  2 +
>  xen/arch/arm/include/asm/mpu/p2m.h   | 12 +++++
>  xen/arch/arm/include/asm/p2m.h       |  5 ++
>  xen/arch/arm/mpu/p2m.c               | 78 ++++++++++++++++++++++++++--
>  5 files changed, 96 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
> index 2cf0f8cbacae..d565230f84ee 100644
> --- a/xen/arch/arm/include/asm/arm32/mpu.h
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -11,6 +11,8 @@
>   */
>  #define MPU_REGION_RES0       0x0
>  
> +#define VSCTLR_VMID_SHIFT     16
> +
>  /* Hypervisor Protection Region Base Address Register */
>  typedef union {
>      struct {
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index 4f694190a8a3..8b86a03fee44 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -7,6 +7,8 @@
>  
>  #define MPU_REGION_RES0        (0xFFFFULL << 48)
>  
> +#define VSCTLR_VMID_SHIFT      48
> +
>  /* Protection Region Base Address Register */
>  typedef union {
>      struct __packed {
> diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
> index e46d9e757a1d..39fc0c944916 100644
> --- a/xen/arch/arm/include/asm/mpu/p2m.h
> +++ b/xen/arch/arm/include/asm/mpu/p2m.h
> @@ -3,8 +3,20 @@
>  #ifndef __ARM_MPU_P2M_H__
>  #define __ARM_MPU_P2M_H__
>  
> +#include <xen/bitops.h>
> +#include <xen/macros.h>
> +#include <xen/page-size.h>
> +
>  struct p2m_domain;
>  
> +/*
> + * The architecture allows at most 255 EL2 MPU memory regions. The size of the
> + * MPU structure entry (pr_t) is 32 Bytes on AArch64 (requiring two 4KB pages)
> + * and 16 bytes on AArch32 (requiring one 4KB page).
This comment may go stale if we add something to pr_t. I don't think it's super
useful.

> + */
> +#define P2M_ROOT_PAGES DIV_ROUND_UP(255 * sizeof(pr_t), PAGE_SIZE)
Please don't opencode max number of regions. Instead use MAX_MPU_REGION_NR

> +#define P2M_ROOT_ORDER get_count_order(P2M_ROOT_PAGES)
> +
>  static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
>  
>  static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 010ce8c9ebbd..ed1b6dd40f40 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -48,8 +48,13 @@ struct p2m_domain {
>      /* Current VMID in use */
>      uint16_t vmid;
>  
> +#ifdef CONFIG_MMU
>      /* Current Translation Table Base Register for the p2m */
>      uint64_t vttbr;
> +#else
> +    /* Current Virtualization System Control Register for the p2m */
> +    register_t vsctlr;
> +#endif
>  
>      /* Highest guest frame that's ever been mapped in the p2m */
>      gfn_t max_mapped_gfn;
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> index f7fb58ab6aa8..ec8f630acd90 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -28,10 +28,69 @@ void p2m_dump_info(struct domain *d)
>      BUG_ON("unimplemented");
>  }
>  
> +static int p2m_alloc_table(struct domain *d)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    void *table = alloc_xenheap_pages(P2M_ROOT_ORDER, 0);
> +
> +    if ( !table )
> +    {
> +        printk(XENLOG_G_ERR "%pd: p2m: unable to allocate P2M MPU mapping table\n",
> +               d);
> +        return -ENOMEM;
> +    }
> +
> +    p2m->root = virt_to_page(table);
> +
> +    for (int i = 0; i < P2M_ROOT_PAGES; i++)
unsigned int and we usually declare it at the top
Also, missing spaces around brackets

> +        clear_page(page_to_virt(p2m->root + i));
Instead of the conversion, you should use table here which is already a VA.

> +
> +    return 0;
> +}
> +
>  int p2m_init(struct domain *d)
>  {
> -    BUG_ON("unimplemented");
> -    return -EINVAL;
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    int rc = 0;
> +    unsigned int cpu;
> +
> +    rwlock_init(&p2m->lock);
> +
> +    p2m->vmid = INVALID_VMID;
> +    p2m->max_mapped_gfn = _gfn(0);
> +    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
> +
> +    p2m->default_access = p2m_access_rwx;
> +    /* mem_access is NOT supported in MPU system. */
> +    p2m->mem_access_enabled = false;
> +
> +    /* Ensure that the type chosen is large enough for MAX_VIRT_CPUS. */
> +    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < MAX_VIRT_CPUS);
> +    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < INVALID_VCPU_ID);
> +
> +    for_each_possible_cpu(cpu)
> +        p2m->last_vcpu_ran[cpu] = INVALID_VCPU_ID;
> +
> +    /*
> +     * "Trivial" initialization is now complete. Set the backpointer so that
> +     * p2m_teardown() and related functions know to do something.
> +     */
> +    p2m->domain = d;
> +
> +    rc = p2m_alloc_vmid(d);
> +    if ( rc )
> +        return rc;
> +
> +    p2m->vsctlr = ((register_t)p2m->vmid << VSCTLR_VMID_SHIFT);
> +
> +    rc = p2m_alloc_table(d);
> +    if ( rc )
> +    {
> +        p2m_free_vmid(d);
You should not free it because you risk double free given that it is also freed
in p2m_final_teardown. That's why on MMU we don't do it.

> +        return rc;
> +    }
> +
> +    return 0;
>  }
>  
>  void p2m_save_state(struct vcpu *p)
> @@ -46,7 +105,20 @@ void p2m_restore_state(struct vcpu *n)
>  
>  void p2m_final_teardown(struct domain *d)
>  {
> -    BUG_ON("unimplemented");
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +    /* p2m not actually initialized */
> +    if ( !p2m->domain )
> +        return;
> +
> +    if ( p2m->root )
> +        free_xenheap_pages(page_to_virt(p2m->root), P2M_ROOT_ORDER);
> +
> +    p2m->root = NULL;
> +
> +    p2m_free_vmid(d);
> +
> +    p2m->domain = NULL;
>  }
>  
>  bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)

~Michal


