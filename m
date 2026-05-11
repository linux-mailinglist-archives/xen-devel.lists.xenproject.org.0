Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H4uN1OxAWppigEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:37:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DC450BFBA
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305979.1578075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMO07-0000qH-3I; Mon, 11 May 2026 10:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305979.1578075; Mon, 11 May 2026 10:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMO07-0000ny-0N; Mon, 11 May 2026 10:36:39 +0000
Received: by outflank-mailman (input) for mailman id 1305979;
 Mon, 11 May 2026 10:36:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMO05-0000nr-N6
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 10:36:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMO04-005y1f-Sl
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:36:36 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01b134-5cb7-0a2a0a5109dd-0a2a4509b7fe-2
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:36:36 +0200
Received: from [52.101.61.10]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01b132-2497-0a2a45090019-34653d0a84b9-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:36:36 +0200
Received: from SA1PR02CA0012.namprd02.prod.outlook.com (2603:10b6:806:2cf::17)
 by PH0PR12MB999088.namprd12.prod.outlook.com (2603:10b6:510:38d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:36:31 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::1f) by SA1PR02CA0012.outlook.office365.com
 (2603:10b6:806:2cf::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:36:31 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 10:36:31 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 05:36:30 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 05:36:29 -0500
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
 b=mVY8qfB/vE6NAAuWlRaVFrayI1i/FtTmtVcQbX+vKbA1NSLdlU3WM5NVc3cR86G7ZwohHUfN4ZbR5ScDeU82l9TwerulAQd+eUOTVsKs48uNAyqkxbwJFjb9CzmcAQf7rOWrzAK5FAodOc2VXIoCWZTs9hMVN3XoNqqQBvSB8nnnb/+nMYYB4xvroemvXTEUR1xmfIFkHIjVfKHJdRYoFk2ozlWKhAFvW8zhAFpV/0k3rGlvvRTG94oYfgS8fSCkT53M0Z/wOUd1+cNGpQF0TJgJKXKE3s0H6QR+BmetMURVnbNK1dGtrdzOjhUzlIgddJDXb/YOOEPfZ0llOudrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmlcBMtgTUbMbO5vSUFU8z0giO0xkCTKxNxFf/bABSU=;
 b=RrwgelmiUkYmxen+xxyuyYEYIPb2PpjaxjMh/BvLpm75N6GY3PHJXtpANFk44rjSw7qoDR9wsOydc/Dr7A0rTp63qbEshAWoGwt6avDFLUqW8xX+P/jmkZ0KmK3CnquqEBMvtYhU8yTBgwMmQGqCHCeaP31hQuq5Zd2MWe2XzGfnHz+B9eE+aLpXsmGpsl5eogvf8L6TW42WkGZZvI72dzgDz08NpwvLm1dLINxWFD1LaPETbbRlOXdTu8kulV3PkuVDJZBx/R8NbP/obppKL2d0MXxk1rNYMq+hU0F0UfkivCL+hlbjJ+ne44lKtms6cmVkbYaumfdaqt0gUHk8vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmlcBMtgTUbMbO5vSUFU8z0giO0xkCTKxNxFf/bABSU=;
 b=4LhAGxe8C48MvneKm5QzGVsG34hAFfM1ECDTfUUlsEt771BWW22+VPeWfkGS6xx+kFI8iKc85JnCGsSw8tSLe7syxqLKTMvu/PGuEVwTzqK6KaXJtZn8uHCi05/NHs7OZ9EK9t5RqCsKv8XpYQ227sYgMsi8NHzKxdO+fT8n8YU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a9460f33-1798-461d-95dc-c40cdf2f7f68@amd.com>
Date: Mon, 11 May 2026 12:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm/mpu: Implement p2m tables
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Harry Ramsey <harry.ramsey@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-4-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260508143353.3512004-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|PH0PR12MB999088:EE_
X-MS-Office365-Filtering-Correlation-Id: 53816c8d-cf0c-4632-3fa7-08deaf492a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n4BRrBukqoz6GykjW4b7dryO+EzgGiz4unT5hdWTyal5072g0j5xo+AHYlRVb3H+JcWR7wu6ODkDtKi5PMs3edvH03b143ZB4lzi0GHH1NtUKhF/TqUZ5dlpfEodm3O/9Gk5gQdOS3tqU3Ip+erriv4uQ5gEhPzTfRxWhEgX4Hm2ReGJChDg6E/VxyuAGoLJ2WoJh7/fZobB+zzoo9XUfW+SSH3VocqIbvEL+ga5aK+ZK5zpeMfqwdbbtuYMxXGgeZYAeCocmDfkJ7WqFfG3MYyenuP5FV0kVHVh1N5PhiIIfRVYGF9bivuotO6bwnp28kmxFUMgnhq7fQbzRTPq3DkH9+d8acQG6Sytuj9Cthn7m+/o75IZh6ujNM9cAKpU/x8MoZRTXQqq5BnX0t4CZUV74Dz8PHvPCCZUSaYfOmFRvwArYsLDEZVqMnJDEQEO8JdRkYG7GiZ3ZeRlksa8jxNlRdIUldRHnzfJA2YWfl/296WOE+ob0SUy54aAHolvpijH48jgH9QZoiqLm4HX8ypSDWBU2g5mJ3wIvCX6zv+HcOU++GIBOdvhzlTf2VFxvECe5VxXswbKSOuTul+IQJ94kWxvEm5C54LWNnje/POdRLbUzy9Pv1YhTf2uwPo4Rx/nYJky7qGxNYr3UlfdEe7TDC1CAJ0Ia0DQUBAoxOIL4KQ3dxySZ5z91MZOWqyCMoZlsFy+4XCI7fujUOkrWYccx5HP9PGBzFu+NR1SYZo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	86qu4UT6d5AUdGI8zPjOp8rS8wP11DAPEzlG9Ztu3J8UJSs2+piciVNzqnsnvkuCHxa5/g+a9nxCFJayJtdPJYG3vEa4MVyomqJ7yz8D9Nwy5LqEU5P0R9de1OzPaP1ReXZW34FIiqGGpbOzp3ydK/SJ2TUWjY4H2xhFmlLrsq99222lsw4me5lDClyk2oh6r5zyLFRQ6F1Oc+S2ARZhdj+H8Nr9Y2wDteVUJuR4jshP9Zxca+UVDsjVwqvDUNfPgNjQKSCXl5n+WrBJM5y/8WLcK3yOK2Y7Kgq53iNIFfgUdwMn+aZ0Rb7b6V4pUkr9QDMHrbFKEEO4y0h/3ussbueieQkWXE/YUvTPwT1jn4Z1qaHVdRuBhjg/uvBbDlyslLuvLpIHPebHXxqGyMkeqy5s/lMBDX+vbZdjhN/E6711wNu+2ziWP5JRYjK4t0jy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:36:31.0784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53816c8d-cf0c-4632-3fa7-08deaf492a58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999088
X-purgate-ID: tlsNG-bad1c0/1778495796-43D7FA53-EF40598B/0/0
X-purgate-type: clean
X-purgate-size: 4961
X-Rspamd-Queue-Id: 56DC450BFBA
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
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action



On 08-May-26 16:33, Luca Fancellu wrote:
> From: Harry Ramsey <harry.ramsey@arm.com>
> 
> Implement `p2m_alloc_table`, `p2m_init` and `p2m_final_teardown` for MPU
> systems.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v5:
>  - removed comment for P2M_ROOT_PAGES/P2M_ROOT_ORDER
>  - used MAX_MPU_REGION_NR instead of opencoding 255
>  - use 'table' in p2m_alloc_table to clear pages
>  - remove p2m_free_vmid() from error path in p2m_init()
>    which is already handled outside
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
>  xen/arch/arm/include/asm/mpu/p2m.h   |  7 +++
>  xen/arch/arm/include/asm/p2m.h       |  5 ++
>  xen/arch/arm/mpu/p2m.c               | 72 ++++++++++++++++++++++++++--
>  5 files changed, 85 insertions(+), 3 deletions(-)
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
> index e46d9e757a1d..0d4149c71987 100644
> --- a/xen/arch/arm/include/asm/mpu/p2m.h
> +++ b/xen/arch/arm/include/asm/mpu/p2m.h
> @@ -3,8 +3,15 @@
>  #ifndef __ARM_MPU_P2M_H__
>  #define __ARM_MPU_P2M_H__
>  
> +#include <xen/bitops.h>
> +#include <xen/macros.h>
> +#include <xen/page-size.h>
> +
>  struct p2m_domain;
>  
> +#define P2M_ROOT_PAGES DIV_ROUND_UP(MAX_MPU_REGION_NR * sizeof(pr_t), PAGE_SIZE)
You should include mpu.h for MAX_MPU_REGION_NR definition

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
> index f7fb58ab6aa8..8d5c65b1003f 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -28,10 +28,63 @@ void p2m_dump_info(struct domain *d)
>      BUG_ON("unimplemented");
>  }
>  
> +static int p2m_alloc_table(struct domain *d)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    char *table = alloc_xenheap_pages(P2M_ROOT_ORDER, 0);
Why char and not void? We use void and pointer arithmetic is done by treating
the size of a void as 1.
> +    unsigned int i;
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
> +    for ( i = 0; i < P2M_ROOT_PAGES; i++ )
> +        clear_page(table + (i * PAGE_SIZE));
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
s/in/on

With the above fixed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


