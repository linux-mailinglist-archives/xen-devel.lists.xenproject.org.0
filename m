Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMw2ET6dHmq5CgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:07:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE762B0FA
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324641.1590132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUL5P-0000Nn-50; Tue, 02 Jun 2026 09:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324641.1590132; Tue, 02 Jun 2026 09:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUL5P-0000Kg-1O; Tue, 02 Jun 2026 09:06:59 +0000
Received: by outflank-mailman (input) for mailman id 1324641;
 Tue, 02 Jun 2026 09:06:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wUL5M-0000KU-Qx
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:06:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUL5M-007Lch-3d
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:06:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1e9d2d-5cb7-0a2a0a5109dd-0a2a450792fa-18
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:06:55 +0200
Received: from [40.93.201.68]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1e9d2d-229c-0a2a45070019-285dc944925b-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:06:55 +0200
Received: from SA1P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::10)
 by IA4PR12MB9812.namprd12.prod.outlook.com (2603:10b6:208:55b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 09:06:49 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:22c:cafe::20) by SA1P222CA0025.outlook.office365.com
 (2603:10b6:806:22c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 09:06:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 09:06:47 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 04:06:47 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 2 Jun 2026 04:06:45 -0500
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
 b=Nc4lwAfGqKHcCQ1jph2bfqsnySFKz/G+ZyuyUwzcCALrG5wbQUTvnOUXvbWoBjAf/f4Hg3WadQGuHsy/kjKKVMgiDcdIiEUlVuivM9ryPusjABT0LpKRHCK6rpxo6efTNNEMYB3PKika6Xcs2E/hDm+VfEUhkrzgRluW5/gr5ddGRdTs5/PRbSL8U6bAeJz8xVo9HcK72ZlCvb5kqM1z1fyzdNEleiz6n8lGyZNpzEyxg+IDH5sN3fUajUPYT9zAqYkewzyY5D38gZ+6DJUlolBiGWuLOqOnEz87BmvmmPDvr/H9bdG18A90LZtCNfC2fccJlYxOzTfQWLtJ8f+MJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PajO6ydWs3LKJXZ80LVKPJjXwpAaZvgCd1Lf3j6U6aU=;
 b=lrTUCplB78rYnqQgJOz4W29KunRQkJtLzrHpWLPCSyptnBZPI/OlFKCd59wmFQUBwtywiHiqER2lO3ctcn6xBkr9Lcy041Tv6KjXBCZ/ff8UxokpMYyJJ3lBCggv/GQRcZ38X0uwmNq7l8rsVMMiaccs911J0O/4DzFDFHzESp9/NvBRsNMFnovdKLd/O5X7S6jaUT9+uo5y0LYIG+GYZ4w420xk72CqRv9J5kBtN1e6eq+9i+bpn+/3GgNPoh2oe5evG04rSGyV4RViPwQzcET/Ej5E7FhKv+f8/2H/FKBI90NCngUsoqwYQbsYNTb53fY+Ql2O25HoPrujVgKyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PajO6ydWs3LKJXZ80LVKPJjXwpAaZvgCd1Lf3j6U6aU=;
 b=gOF3yOhsLna8kSE5E/SBk9rzLhtGvDqC69lNiSPQ+mnKtYkjSmhsWQUXYyKgU6KUtPJV5UNZKFHQVDJ717ZYzNfUAQhnqpNqJleRFWBDzea9DPaBQ5Qzktv1O3olm/zm9FZIGGOrYMCJehUh/9i5uo6UWuI4fogcjQsUcrnGCvg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <8d8b72d2-8188-4148-9812-0c116cc330e4@amd.com>
Date: Tue, 2 Jun 2026 11:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] device-tree: validate first hwdom bank for boot
 modules
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4f862bb2dc323914b8120b0f16af7516140cf42b.1780065103.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4f862bb2dc323914b8120b0f16af7516140cf42b.1780065103.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|IA4PR12MB9812:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b024d6-3dfc-404f-c932-08dec08646de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|18002099003|22082099003|11063799006|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	Sjbc+dz7AR3A2UW2cCCLbBSnzRmzijuyNqNmkSOdLWMk4hOjkOTnRonLmw/aKfOy70ZWdOCfWQmrXc/Sw9a98dvvkWUOCtfpBjCmEqqGi3zGtP/mxDabseLlVNxDspMqOhnyQqa6YeNBvgy6utGfqlphj3rRPeMCxNSuIlNfYNiZNH0aQv5x7P2w96czE7fv9zj+0ml83Lv7Z1CTPYi20EEyosGH3NW/qu1toDLluuWqaO5XXO0Ze8N3LvOGsqXEWAesLJ/d76c2VXU4qZSqRO0zw4h6AQlH3RYwpW9LQxixjhLnFrRjik8EZv2nZuLXhu4lijAHahqF+TWFoozYhWqJ55JqgqPvzeE/MKkTrdwjhA3UY5T5LSaWTqJ7qZmhqjjN5WLI2sOlzCdWZhTSZ2OCufl/GBz9EyL/gTmBWBfsqjF9woYVqUzLazWUrEasxixUMFN4EM0Cj4vnZJ+qzD7INOO3BFJmU7vyUtr+AsKt1/BhDp9F9VuiUw++u3wK+dZ12wUihg/PIsh9gu3A3E5fpF7yLbV9F/EX04oJp7jsLbj38UIClyuVJB+4Z+TdwJSONmqdCIORthK16aImM2X+HvGSPosqM6DQUS2q0pJU+hLXkOH7CnpM3KlIf644tC8xpGyrYTiuyyFZbouauj9n4b6Ti5H1KG/Pmiddk7+DP/KZzi3xvly0ZI7eH8UN
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ky/4isn3h00C6g/IkaCj3aLzAidtAsB3Wb5qFAz9sAcwuUnpNRp5P/MNHUSq1u+Tl8P86hjcEjXdwNWeBLkv2r9HX7CVx1T1k0NbI8tKv+d2txLBa1EeTVThggab3Gv7PkVA2wxJxQIWY95ZKg/vH9l20KjZ52Gmn5MAi6EK01IFMSAQyA7moyxeulOOU11ZHmfBGc27mfCVQhIKvNk3qhS38ZN79bbEQpVS70UN+C21N+G2ewa2eBwTpA84XhwJFupAmVT733tnTiZyTpt/BMoqOco4XRlVoQrBbe4GBPZBB6fnpkbHR19XAW8sB4cVZKVFv65p8qfzqzgdnCK1Wr2qlpJ551EWmuQx3JsitOO+izdcvM67CcRjC2gk9bjsYTrHA1KU/Xnh1x+3poYN8KVacX1KzL0yULAw5BiD0D2Cvwd1QEfjajd+Cr+IKDEZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 09:06:47.9716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b024d6-3dfc-404f-c932-08dec08646de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9812
X-purgate-ID: tlsNG-ef75cf/1780391215-2377AC48-A9951FA5/0/0
X-purgate-type: clean
X-purgate-size: 18152
X-Rspamd-Queue-Id: 70DE762B0FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,gitlab.com:url,epam.com:email,patchew.org:url]
X-Rspamd-Action: no action



On 29-May-26 17:10, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> With LLC coloring enabled, the hardware domain memory is allocated by
> allocate_hwdom_memory() rather than by using the fixed direct-map layout.
> 
> Commit de99f3263555 ("device-tree: Improve hwdom memory allocation for
> DMA") made that allocator prefer lower host regions. The first-bank
> filter, however, still only checked the old 128MB heuristic. A low
> region can satisfy that heuristic but still be too small, or otherwise
> unsuitable, for the hardware-domain kernel and the DTB/initrd module
> area to fit in bank 0 according to the Arm placement rules.
> 
> Keep the existing first-bank size policy and add an architecture-specific
> candidate check. On Arm, compute the kernel load address for the candidate
> bank using the same logic as kernel_zimage_place(), verify that the kernel
> range is covered by that bank, and then reuse the same module-placement
> helper as place_modules(). The FDT is generated later, so use the
> hardware-domain FDT allocation size as a conservative upper bound for the
> final DTB size.
> 
> Check the candidate after capping the host region by the remaining
> unassigned hardware-domain memory, so the validation is performed against
> the size that would actually become bank 0.
> 
> This keeps the DMA-oriented allocation policy from de99f3263555 while
> preventing a too-small bank 0 from reaching place_modules().
> 
> Fixes: de99f3263555 ("device-tree: Improve hwdom memory allocation for DMA")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes since RFC:
> - Do not keep the RFC scalar minimum-size check. It can both reject
>   valid layouts and accept layouts which still fail later. Instead,
>   validate the candidate bank using the same kernel and module placement
>   rules as the load path.
>   Replace the scalar minimum-size check with arch_hwdom_first_bank_ok().
> - Reuse the existing Arm kernel and DTB/initrd placement rules for the
>   first-bank candidate check.
> - Treat the hardware-domain FDT allocation size as a conservative upper
>   bound because the final FDT is generated later.
> 
> Link to RFC:
>    https://patchew.org/Xen/9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola._5Fkvach@epam.com/
> 
> Why the RFC scalar approach was not kept:
> 
> A simple minimum-size check is not sufficient here because the validity of
> the first bank depends on the actual Arm placement rules, not only on the
> aggregate size of the kernel, DTB and initrd. The DTB/initrd area may fit
> before a 64-bit Image loaded with a text offset, while an AArch32
> position-independent kernel may leave no valid module location even when
> the aggregate size appears to fit. Fixed-address kernels also need the
> candidate bank start to be considered.
> 
> Link to synthetic tests output:
>    https://gitlab.com/xen-project/people/mykola_kvach/xen/-/blob/fix/hwdom-first-bank-dom0-modules-v2-new/tools/tests/arm-boot-modules/test-arm-boot-modules.log?ref_type=heads
> 
> ---
>  xen/arch/arm/acpi/domain_build.c        |   2 -
>  xen/arch/arm/domain_build.c             |   8 ++
>  xen/arch/arm/include/asm/domain_build.h |   4 +
>  xen/arch/arm/include/asm/kernel.h       |   9 ++
>  xen/arch/arm/kernel.c                   | 179 ++++++++++++++++++------
>  xen/common/device-tree/domain-build.c   |  24 +++-
>  xen/include/xen/fdt-kernel.h            |   9 ++
>  7 files changed, 182 insertions(+), 53 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index 249d899c33..db16f7fa94 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -26,8 +26,6 @@
>  #undef virt_to_mfn
>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
>  
> -#define ACPI_DOM0_FDT_MIN_SIZE 4096
> -
>  static int __init acpi_iomem_deny_access(struct domain *d)
>  {
>      acpi_status status;
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1efddc60ef..550617f152 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -115,6 +115,14 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>                               (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
>                                (NR_SHMEM_BANKS * (160 + 16)) : 0))
>  
> +paddr_t __init hwdom_get_fdt_alloc_size(void)
> +{
> +    if ( acpi_disabled )
> +        return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE;
> +
> +    return ACPI_DOM0_FDT_MIN_SIZE;
> +}
> +
>  unsigned int __init dom0_max_vcpus(void)
>  {
>      if ( opt_dom0_max_vcpus == 0 )
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index df8b361b3d..85cf46a958 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -19,6 +19,10 @@ int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
>  
>  int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
>  
> +#define ACPI_DOM0_FDT_MIN_SIZE 4096
> +
> +paddr_t hwdom_get_fdt_alloc_size(void);
> +
>  #if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
>  /* Utility function to determine if an Armv8-R processor supports VMSA. */
>  bool has_v8r_vmsa_support(void);
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 21f4273fa1..bf14fb208a 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -8,12 +8,21 @@
>  
>  #include <asm/domain.h>
>  
> +#include <xen/types.h>
> +
> +struct kernel_info;
> +
>  struct arch_kernel_info
>  {
>      /* Enable pl011 emulation */
>      bool vpl011;
>  };
>  
> +#define arch_hwdom_first_bank_ok arch_hwdom_first_bank_ok
> +bool arch_hwdom_first_bank_ok(const struct kernel_info *info,
> +                              paddr_t bank_start,
> +                              paddr_t bank_size);
> +
>  #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index b72585b7fe..907239a246 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -40,27 +40,67 @@ struct minimal_dtb_header {
>      /* There are other fields but we don't use them yet. */
>  };
>  
> -static void __init place_modules(struct kernel_info *info,
> -                                 paddr_t kernbase, paddr_t kernend)
> +static paddr_t __init
> +kernel_zimage_place_in_bank(const struct kernel_info *info,
> +                            paddr_t bank_start, paddr_t bank_size)
>  {
> -    /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
> -    const struct boot_module *mod = info->bd.initrd;
> -    const struct membanks *mem = kernel_info_get_mem(info);
> -    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
> -    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
> -    const paddr_t modsize = initrd_len + dtb_len;
> +    paddr_t load_addr;
>  
> -    /* Convenient */
> -    const paddr_t rambase = mem->bank[0].start;
> -    const paddr_t ramsize = mem->bank[0].size;
> -    const paddr_t ramend = rambase + ramsize;
> +#ifdef CONFIG_HAS_DOMAIN_TYPE
> +    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
> +        return bank_start + info->image.text_offset;
> +#endif
> +
> +    /*
> +     * If start is zero, the zImage is position independent, in this
> +     * case Documentation/arm/Booting recommends loading below 128MiB
> +     * and above 32MiB. Load it as high as possible within these
> +     * constraints, while also avoiding the DTB.
> +     */
> +    if ( info->image.start == 0 )
> +    {
> +        paddr_t load_end;
> +        paddr_t ram128mb;
> +
> +        ram128mb = bank_start + MB(128);
> +        load_end = bank_start + bank_size;
> +        load_end = min(ram128mb, load_end);
> +
> +        if ( load_end - bank_start < info->image.len )
> +            return INVALID_PADDR;
> +
> +        load_addr = load_end - info->image.len;
> +        /* Align to 2MB */
> +        load_addr &= ~(MB(2) - 1);
> +        if ( load_addr < bank_start )
> +            return INVALID_PADDR;
> +    }
> +    else
> +        load_addr = info->image.start;
> +
> +    return load_addr;
> +}
> +
> +static bool __init
> +first_bank_has_enough_room(paddr_t ramsize, paddr_t kernbase,
> +                           paddr_t kernend, paddr_t modsize)
How about first_bank_can_fit_modules()? The name would be more descriptive.

> +{
>      const paddr_t kernsize = ROUNDUP(kernend, MB(2)) - kernbase;
> -    const paddr_t ram128mb = rambase + MB(128);
>  
> -    paddr_t modbase;
> +    /*
> +     * Check only the aggregate kernel/module footprint. The actual DTB/initrd
> +     * location is selected by find_module_placement().
I don't particularly like that we call dtb+initrd modules while kernel is also a
module. How about renaming to find_dtb_initrd_placement()? This will improve the
readability by a lot. We could also rename place_modules() to
place_dtb_initrd_modules() or just place_dtb_initrd().

> +     */
> +    return modsize + kernsize <= ramsize;
> +}
>  
> -    if ( modsize + kernsize > ramsize )
> -        panic("Not enough memory in the first bank for the kernel+dtb+initrd\n");
> +static bool __init
> +find_module_placement(paddr_t rambase, paddr_t ramsize,
> +                      paddr_t kernbase, paddr_t kernend,
> +                      paddr_t modsize, paddr_t *modbase)
> +{
> +    const paddr_t ramend = rambase + ramsize;
Instead of passing ramsize, pass ramend right away to avoid this line (similar
to kernbase, kernend).

> +    const paddr_t ram128mb = rambase + MB(128);
>  
>      /*
>       * DTB must be loaded such that it does not conflict with the
> @@ -80,17 +120,49 @@ static void __init place_modules(struct kernel_info *info,
>       * tools/libxc/xc_dom_arm.c:arch_setup_meminit as well.
This is a stale path. Please update to tools/libs/guest/xg_dom_arm.c:meminit

>       */
>      if ( ramend >= ram128mb + modsize && kernend < ram128mb )
> -        modbase = ram128mb;
> -    else if ( ramend - modsize > ROUNDUP(kernend, MB(2)) )
> -        modbase = ramend - modsize;
> -    else if ( kernbase - rambase > modsize )
> -        modbase = kernbase - modsize;
> -    else
>      {
> -        panic("Unable to find suitable location for dtb+initrd\n");
> -        return;
> +        *modbase = ram128mb;
Do we need this extra variable? Can't we just *modbase = rambase + MB(128)?

> +        return true;
> +    }
> +
> +    if ( ramend - modsize > ROUNDUP(kernend, MB(2)) )
> +    {
> +        *modbase = ramend - modsize;
> +        return true;
> +    }
> +
> +    if ( kernbase - rambase > modsize )
> +    {
> +        *modbase = kernbase - modsize;
> +        return true;
>      }
>  
> +    return false;
> +}
> +
> +static void __init place_modules(struct kernel_info *info,
> +                                 paddr_t kernbase, paddr_t kernend)
> +{
> +    /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
> +    const struct boot_module *mod = info->bd.initrd;
> +    const struct membanks *mem = kernel_info_get_mem(info);
> +    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
> +    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
> +    const paddr_t modsize = initrd_len + dtb_len;
> +
> +    /* Convenient */
> +    const paddr_t rambase = mem->bank[0].start;
> +    const paddr_t ramsize = mem->bank[0].size;
> +
> +    paddr_t modbase;
> +
> +    if ( !first_bank_has_enough_room(ramsize, kernbase, kernend, modsize) )
> +        panic("Not enough memory in the first bank for the kernel+dtb+initrd\n");
> +
> +    if ( !find_module_placement(rambase, ramsize, kernbase, kernend, modsize,
> +                                &modbase) )
> +        panic("Unable to find suitable location for dtb+initrd\n");
> +
>      info->dtb_paddr = modbase;
>      info->initrd_paddr = info->dtb_paddr + dtb_len;
>  }
> @@ -100,32 +172,51 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>      const struct membanks *mem = kernel_info_get_mem(info);
>      paddr_t load_addr;
>  
> -#ifdef CONFIG_HAS_DOMAIN_TYPE
> -    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
> -        return mem->bank[0].start + info->image.text_offset;
> -#endif
> +    load_addr = kernel_zimage_place_in_bank(info, mem->bank[0].start,
> +                                            mem->bank[0].size);
> +    if ( load_addr == INVALID_PADDR )
> +        panic("Unable to find suitable location for the kernel\n");
>  
> +    return load_addr;
> +}
> +
> +bool __init arch_hwdom_first_bank_ok(const struct kernel_info *info,
> +                                     paddr_t bank_start,
> +                                     paddr_t bank_size)
> +{
> +    const struct boot_module *initrd = info->bd.initrd;
>      /*
> -     * If start is zero, the zImage is position independent, in this
> -     * case Documentation/arm/Booting recommends loading below 128MiB
> -     * and above 32MiB. Load it as high as possible within these
> -     * constraints, while also avoiding the DTB.
> +     * place_modules() rounds the DTB and initrd placement to 2MB boundaries;
> +     * use the same granularity when checking whether the first bank can hold
> +     * the boot modules.
>       */
> -    if ( info->image.start == 0 )
> -    {
> -        paddr_t load_end;
> +    const paddr_t initrd_len = ROUNDUP(initrd ? initrd->size : 0, MB(2));
> +    /*
> +     * The hardware domain FDT has not been generated yet. Use the allocation
> +     * size as a conservative upper bound for the final DTB size.
> +     */
> +    const paddr_t dtb_len = ROUNDUP(hwdom_get_fdt_alloc_size(), MB(2));
> +    const paddr_t rambase = bank_start;
> +    const paddr_t ramsize = bank_size;
> +    const paddr_t modsize = initrd_len + dtb_len;
> +    const paddr_t ramend = rambase + ramsize;
> +    paddr_t kernbase;
> +    paddr_t kernend;
> +    paddr_t modbase;
>  
> -        load_end = mem->bank[0].start + mem->bank[0].size;
> -        load_end = MIN(mem->bank[0].start + MB(128), load_end);
> +    kernbase = kernel_zimage_place_in_bank(info, bank_start, bank_size);
> +    if ( kernbase == INVALID_PADDR ||
> +         info->image.len > INVALID_PADDR - kernbase )
> +        return false;
>  
> -        load_addr = load_end - info->image.len;
> -        /* Align to 2MB */
> -        load_addr &= ~((2 << 20) - 1);
> -    }
> -    else
> -        load_addr = info->image.start;
> +    kernend = kernbase + info->image.len;
>  
> -    return load_addr;
> +    if ( kernbase < rambase || kernend > ramend )
> +        return false;
> +
> +    return first_bank_has_enough_room(ramsize, kernbase, kernend, modsize) &&
> +           find_module_placement(rambase, ramsize, kernbase, kernend, modsize,
> +                                 &modbase);
>  }
>  
>  static void __init kernel_zimage_load(struct kernel_info *info)
> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> index 2a760b007b..25bc392fea 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -299,20 +299,30 @@ static bool __init allocate_hwdom_memory(struct kernel_info *kinfo)
>  
>      for ( i = 0; (kinfo->unassigned_mem > 0) && (i < nr_banks); i++ )
>      {
> -        paddr_t bank_size;
> +        const paddr_t bank_start = hwdom_free_mem->bank[i].start;
> +        paddr_t bank_size = hwdom_free_mem->bank[i].size;
> +
> +        /*
> +         * Check the size that would actually be assigned, not just the size
> +         * of the host region.
> +         */
> +        bank_size = min(bank_size, kinfo->unassigned_mem);
>  
>          /*
>           * The first bank must be large enough for place_modules() to
>           * fit the kernel, DTB and initrd.  Skip small regions to avoid
>           * ending up with a tiny first bank.
>           */
> -        if ( !mem->nr_banks && (hwdom_free_mem->bank[i].size < min_bank_size) )
> -            continue;
> +        if ( !mem->nr_banks )
> +        {
> +            if ( bank_size < min_bank_size )
> +                continue;
> +
> +            if ( !arch_hwdom_first_bank_ok(kinfo, bank_start, bank_size) )
> +                continue;
> +        }
>  
> -        bank_size = MIN(hwdom_free_mem->bank[i].size, kinfo->unassigned_mem);
> -        if ( !allocate_bank_memory(kinfo,
> -                                   gaddr_to_gfn(hwdom_free_mem->bank[i].start),
> -                                   bank_size) )
> +        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
>          {
>              xfree(hwdom_free_mem);
>              return false;
> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> index 00c37be101..86f2a69ede 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -93,6 +93,15 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
>      return container_of(&kinfo->mem.common, const struct membanks, common);
>  }
>  
> +#ifndef arch_hwdom_first_bank_ok
> +static inline bool
> +arch_hwdom_first_bank_ok(const struct kernel_info *info, paddr_t bank_start,
> +                         paddr_t bank_size)
> +{
> +    return true;
> +}
> +#endif
> +
>  #ifndef KERNEL_INFO_SHM_MEM_INIT
>  
>  #ifdef CONFIG_STATIC_SHM

I would prefer if this patch was split into refactoring (e.g. split
place_modules() into functions later on used by patch 2) + hwdom fix (2
patches). The first patch would also fit the rename I suggested.

~Michal


