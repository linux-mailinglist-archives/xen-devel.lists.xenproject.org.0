Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKduHb0pBGrfEwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 09:35:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9134952EB94
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 09:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307638.1579236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN47J-0003z1-6x; Wed, 13 May 2026 07:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307638.1579236; Wed, 13 May 2026 07:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN47J-0003wW-3u; Wed, 13 May 2026 07:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1307638;
 Wed, 13 May 2026 07:34:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wN47G-0003wO-QI
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 07:34:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN47G-003ZpV-1u
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 09:34:50 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a042995-e002-0a2a0a5209dd-0a2a4502b3a2-12
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 09:34:49 +0200
Received: from [40.107.200.1]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a042997-af86-0a2a45020019-286bc8010fdd-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 09:34:49 +0200
Received: from CH0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:610:b1::25)
 by SA1PR12MB999107.namprd12.prod.outlook.com (2603:10b6:806:4a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 07:34:40 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::63) by CH0PR13CA0020.outlook.office365.com
 (2603:10b6:610:b1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 07:34:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 07:34:39 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 02:34:39 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 00:34:39 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 02:34:37 -0500
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
 b=wlryTcnyNbBveaz2Yjh6snIpO6RM81aAd4k4wtd4xcROQxvNdXXSHIT46Q5kOmFdwpFQUursfLrEa+VcFG6PUdltsz20KlCv9cvqVjnGOtx4IDnfOthmrR8dlnW9i4M7xaDMtqbLmcZo9JyOkra1c19dtIXB766a1PUdl9S7GZY6zyq7B+K4y0JB2Cts/Zs5h1Z8YwtZSkkx5GngoQsJpZ22CmqZXxGqzaaaaB/A2++hzwMIEz0bQEWL7VpdSHylW5TvMPxQwps/+2EVn1ZqiMDfjrNWs8EkaTLFqbnI2Dp6wYsVowxWvPgRzNrh5gvgl3Nz0rAmMpL+CWjZMUNz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1VlGwiKFIn3nfu3rl8MUo5VieFoKPN42QSZBbZM11A=;
 b=iQB50aFBFtVHWLffiw/2iG5pA27PZCtf62m9/rDTaZriRbS7oQIXl8T2mU0vf9kImhBOjte5ia443IBy7lfnF1xxIQ5ZTPjNiqpnd7s6JwEwkWEDoMdsWojjVm+sm4szrwsC0sNs+83j0xtpPRtuJwk1xPtlALNUYJXOg6FYJps3beh63sTZkIz7UTxzOjxmg/n7Eaae2f2vh3Mn9L6n7D9P7wDiCWN0VnsTVC2BJtEW3aXvqC84rwCG1rq12WoJtJCenGncGBKFaydpH4S2SwdX/b4HFofwHqIP5dY7mFqtqKs1MXP6bw8lp2s1uKI3+DFyLmp3Yv5OiT6JkqEGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1VlGwiKFIn3nfu3rl8MUo5VieFoKPN42QSZBbZM11A=;
 b=RMuk8nL3x/t5nwoJI9w3oMVrRZQdtTQ10oZKRv0th0iDCwdzn2Hmn6N34DVsw9cLDVxyNojUXCelMil/i1TzKgCIqHTemSdBP7F5Zt6Mr6MJTMvVHHOinwUXdaXFNhtEr2aYG//1xBq/X2Uc8XLklCbvLhYScMnvzWPKMFlaUck=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <12115791-513e-4d1b-956c-6b0c00bebe3b@amd.com>
Date: Wed, 13 May 2026 09:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Harry Ramsey <harry.ramsey@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260512175729.1915120-1-luca.fancellu@arm.com>
 <20260512175729.1915120-3-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260512175729.1915120-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|SA1PR12MB999107:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b4ad87-142f-44fd-e4a4-08deb0c2179f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	X6ovzJL4stbQyl//0NOVFfXOxl+AI3Qd0Fg0AZEQ7unjAN1HmqpfLig1Ie6GkTUoh7nnpIJ2N8Ka2j/wlDuXOAv8mbfvc+7Yl6Pc5lSPsYJy0DQ2s4sAZ/4MKog4GaYQk/AdFXjWWL9Xdxzg3Ve843VYfVQrl2TFjqZbN+gNyHAN2S6kPEKoO2NKPDD9Z7+AEBjUVPP1PEeZMoBOqhG/uekV81lePJhfTd3PjFLgoOReh3QDpO/gTbbwCspe2xrF2EFE9puDSswfwlzKAh3ib2vDU5/1TBuFYGOdboP2ge2jU6W4XvnfiS9v9GBO4b0gl1XK69a8xliXUyiFZI07DWJkLvUdxovyXiKmGrDvUFDCvG53AhzPn+n74gfjQjyRbvujItoZlY1kdfCGghXrYaoEKL++ybtxFV5LvgiP4RQlOdKFf+O4KJPs17oFh0ao3HOnVA5OGRovWzmYdLZAUQZ9nXm0rBUghrICr1kmDaI4GQORD81b1M/pUdwj8/xa1O4+xurcpOBNt2UVgIZ7NvCwoBk0oRPHZf0q8JE1gZssMzX1BfA3j3T2+6sh9BrfkLYb2e9lvfHh4iB8SBTIFLvX+doXSvnFfqUkO/GJQsyE/rusLyHWQpgda7zL04zR4ZLW7691hkQIn6plfMAjhWFFvS7Ct8mWKNSTIllxWiLzethfHlDFE+bvU7/lkFtgw0scz6dFEyqa42Fe4LTRLHVemebwz++0kFKDK0Jgb3Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nmNLfDK6cLJIR+AncfkfsfIMUY26lKA57PdTC2s0vTqWNe4wwoFjlpTSvVxIqVAn1foUSS8Sv2NCKdobOP1mKBCXal19JQIzPLZ8xT8UW7+4eFNpGmmtx2J8j/TDtdr2AOzPC17iuIRqqyPFSHpkWRbMSBkyi3j6kr7YTAlWvBfoiDKRlUGucd9dLofP0oS5MasK6iMJhtcKcE0s3oaXdDNDZswS/lQK1WNy1zTxdnxN7ZXnjbeTkoEvUtyxYnLvs2WPqwsurChiFC3Epgo2sF33ZF2uM5QqhmElw0iwCbAyS76Kqj1d3iNv6GbFop0nylfc5s+mtM0TWJDiwTtYjD5XqEyp0tLyYejSewcNV6ptvnExdPN8Vprr/h80gAWqk3nIP6fjZKHFU9xP5anXVqQD2MIfo7MKccZdsoeti6l3aAjsChAanjwfpDM5C6F6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:34:39.9353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b4ad87-142f-44fd-e4a4-08deb0c2179f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999107
X-purgate-ID: tlsNG-720697/1778657689-A9B70161-1E4B1D7A/0/0
X-purgate-type: clean
X-purgate-size: 14499
X-Rspamd-Queue-Id: 9134952EB94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:harry.ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 12-May-26 19:57, Luca Fancellu wrote:
> From: Harry Ramsey <harry.ramsey@arm.com>
> 
> Add a new device tree property `v8r_el1_msa` to select the MSA (memory
> system architecture) at EL1 for Armv8-R architecture: MPU or MMU, the
> former is the default if the property is not passed.
> 
> Implement the dom0less path to parse the new device tree property, add
> a new domctl hypercall input parameter `v8r_el1_msa` for arm and
> add the sanitisation in arch_sanitise_domain_config(), the parameter
> is intended to be used on CONFIG_MPU systems and returns an error if
> selected for MMU.
> 
> While there, add explicit padding and check that it's zero during
> arch domain config sanitisation, given the breaking change, bump the
> XEN_DOMCTL_INTERFACE_VERSION.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v6:
>  - Add explicit padding to `struct xen_arch_domainconfig` and check it
>  - Provide common v8r_el1_msa_domain_sanitise_config() for MMU/MPU
>  - During domu_dt_v8r_el1_msa_parse() set PMSA when property not present
>  - constify *node in domu_dt_v8r_el1_msa_parse()
>  - Print full path of the node in domu_dt_v8r_el1_msa_parse() error msgs
>  - typo fixing
> v5:
>  - follow the way domu_dt_sci_parse and ARM_SCI is doing, but
>    return error if property is present in MMU systems.
>  - Align the commit message on the new changes
>  - fix documentation
>  - fix multiline comment
>  - drop the explicit padding from struct xen_arch_domainconfig
> v4:
> - Rework the patch to have the v8r_el1_msa input parameter more
>   enclosed in the Armv8-A (mmu)/Armv8-R (mpu) space.
> v3:
> - Improve commit message and device tree property description
> - Remove macro protection
> - Remove unused function is_mpu_domain
> - Code formatting
> ---
>  docs/misc/arm/device-tree/booting.txt   | 14 +++++
>  xen/arch/arm/dom0less-build.c           | 74 +++++++++++++++++++++++++
>  xen/arch/arm/domain.c                   | 37 +++++++++++++
>  xen/arch/arm/include/asm/domain.h       |  4 ++
>  xen/arch/arm/include/asm/domain_build.h | 10 ++++
>  xen/arch/arm/mpu/arm32/mm.c             |  7 +++
>  xen/arch/arm/mpu/arm64/mm.c             |  7 +++
>  xen/include/public/arch-arm.h           |  7 +++
>  xen/include/public/domctl.h             |  4 +-
>  9 files changed, 162 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 977b4286082f..f73839df090b 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -322,6 +322,20 @@ with the following properties:
>      Should be used together with scmi-smc-passthrough Xen command line
>      option.
>  
> +- v8r_el1_msa
> +
> +    A string property specifying whether, on Armv8-R systems at EL1, a domain
> +    should use PMSAv8 (MPU) or VMSAv8 (MMU).
> +
> +    - "mmu"
> +    Enables VMSAv8 at EL1. This requires hardware support and is only
> +    optionally available on AArch64. Not supported on AArch32.
> +
> +    - "mpu"
> +    Enables PMSAv8 at EL1. This is the default behavior when the property is
> +    not passed. This configuration requires static allocation (xen,static-mem)
> +    and direct mapping (direct-map).
> +
>  Under the "xen,domain" compatible node, one or more sub-nodes are present
>  for the DomU kernel and ramdisk.
>  
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 52cf788a45ea..fecdb33d3e3a 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -302,6 +302,77 @@ static int __init domu_dt_sci_parse(struct dt_device_node *node,
>      return 0;
>  }
>  
> +static int __init
> +domu_dt_v8r_el1_msa_parse(const struct dt_device_node *node,
> +                          struct xen_domctl_createdomain *d_cfg,
> +                          unsigned int flags)
> +{
> +    bool property_present = dt_property_read_bool(node, "v8r_el1_msa");
I know it's present in the code for SCI, but it's not really necessary to do the
DT parsing twice (once for boot, second for string given that
dt_property_read_string returns -EINVAL if no property found).

You could move this bool check ...

> +
> +    if ( !IS_ENABLED(CONFIG_MPU) )
> +    {
> +        d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE;
> +
> +        if ( !property_present )
... here.

> +            return 0;
> +
> +        printk(XENLOG_ERR
> +               "Not supported 'v8r_el1_msa' DT property found for domain %s\n",
> +               dt_node_full_name(node));
> +        return -EINVAL;
> +    }
> +
> +    if ( !property_present )
> +        d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA;
> +    else
> +    {
> +        const char *v8r_el1_msa;
> +        int ret = dt_property_read_string(node, "v8r_el1_msa", &v8r_el1_msa);
> +
> +        if ( ret )
> +            return ret;
> +
> +        if ( !strcmp(v8r_el1_msa, "mpu") )
> +            d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA;
> +        else if ( !strcmp(v8r_el1_msa, "mmu") )
> +            d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA;
> +        else
> +        {
> +            printk(XENLOG_ERR
> +                   "v8r_el1_msa value (%s) not valid for domain %s\n",
> +                   v8r_el1_msa, dt_node_full_name(node));
> +            return -EINVAL;
> +        }
> +    }
> +
> +    switch ( d_cfg->arch.v8r_el1_msa )
> +    {
> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA:
> +        if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
> +        {
> +            printk(XENLOG_ERR
> +                   "PMSA is not valid for domain (%s) without static allocation and direct map (v8r_el1_msa)\n",
> +                   dt_node_full_name(node));
> +            return -EINVAL;
> +        }
> +        break;
> +
> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA:
> +        if ( !has_v8r_vmsa_support() )
> +        {
> +            printk(XENLOG_ERR
> +                   "Platform doesn't support VMSA at EL1 (v8r_el1_msa)\n");
> +            return -EINVAL;
> +        }
> +        break;
> +
> +    default:
> +        return -EINVAL;
> +    }
> +
> +    return 0;
This does not look very clean. How about:

static int __init
domu_dt_v8r_el1_msa_parse(const struct dt_device_node *node,
                          struct xen_domctl_createdomain *d_cfg,
                          unsigned int flags)
{
    const char *value;
    int ret;

    if ( !IS_ENABLED(CONFIG_MPU) )
    {
        d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE;

        if ( !dt_property_read_bool(node, "v8r_el1_msa") )
            return 0;

        printk(XENLOG_ERR
               "v8r_el1_msa not supported on this build for domain %s\n",
               dt_node_full_name(node));
        return -EINVAL;
    }

    ret = dt_property_read_string(node, "v8r_el1_msa", &value);
    /* property absent: PMSA is the default */
    if ( ret == -EINVAL )
        value = "mpu";
    else if ( ret )
        return ret;

    if ( !strcmp(value, "mpu") )
    {
        if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
        {
            printk(XENLOG_ERR
                   "v8r_el1_msa=mpu requires static-mem and direct-map for
domain %s\n",
                   dt_node_full_name(node));
            return -EINVAL;
        }
        d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA;
        return 0;
    }

    if ( !strcmp(value, "mmu") )
    {
        if ( !has_v8r_vmsa_support() )
        {
            printk(XENLOG_ERR
                   "v8r_el1_msa=mmu unsupported by platform for domain %s\n",
                   dt_node_full_name(node));
            return -EINVAL;
        }
        d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA;
        return 0;
    }

    printk(XENLOG_ERR "v8r_el1_msa value '%s' not valid for domain %s\n",
           value, dt_node_full_name(node));
    return -EINVAL;
}


> +}
> +
>  int __init arch_parse_dom0less_node(struct dt_device_node *node,
>                                      struct boot_domain *bd)
>  {
> @@ -315,6 +386,9 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>      if ( domu_dt_sci_parse(node, d_cfg) )
>          panic("Error getting SCI configuration\n");
>  
> +    if ( domu_dt_v8r_el1_msa_parse(node, d_cfg, flags) )
> +        panic("Error getting v8r_el1_msa configuration\n");
> +
>      if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
>      {
>          int vpl011_virq = GUEST_VPL011_SPI;
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 26380a807cad..e579c3b1bb3c 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -18,6 +18,7 @@
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
>  #include <asm/current.h>
> +#include <asm/domain_build.h>
You don't seem to use anything from this header.

>  #include <asm/event.h>
>  #include <asm/gic.h>
>  #include <asm/guest_atomics.h>
> @@ -538,6 +539,24 @@ void vcpu_switch_to_aarch64_mode(struct vcpu *v)
>      v->arch.hcr_el2 |= HCR_RW;
>  }
>  
> +static bool v8r_el1_msa_domain_sanitise_config(
> +    const struct xen_domctl_createdomain *config)
> +{
> +    uint8_t v8r_el1_msa = config->arch.v8r_el1_msa;
That is not a useful assignment.

> +
> +    if ( !IS_ENABLED(CONFIG_MPU) )
> +        return v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE;
> +
> +    if ( IS_ENABLED(CONFIG_ARM_32) )
> +        return v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA;
> +
> +    if ( IS_ENABLED(CONFIG_ARM_64) )
> +        return (v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA) ||
> +               (v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA);
> +
> +    return false;
Arm32 and Arm64 are mutually exclusive, so this line is unreachable.
How about:
  static bool v8r_el1_msa_domain_sanitise_config(
      const struct xen_domctl_createdomain *config)
  {
      switch ( config->arch.v8r_el1_msa )
      {
      case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE:
          return !IS_ENABLED(CONFIG_MPU);

      case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA:
          return IS_ENABLED(CONFIG_MPU);

      case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA:
          return IS_ENABLED(CONFIG_MPU) && IS_ENABLED(CONFIG_ARM_64);

      default:
          return false;
      }
  }

> +}
> +
>  int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>  {
>      unsigned int max_vcpus;
> @@ -554,6 +573,14 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    /* Check config structure padding */
> +    if ( config->arch.pad )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "Invalid domain configuration during domain creation\n");
> +        return -EINVAL;
> +    }
> +
>      /* Check feature flags */
>      if ( sve_vl_bits > 0 )
>      {
> @@ -630,6 +657,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( !v8r_el1_msa_domain_sanitise_config(config) )
> +    {
> +        dprintk(XENLOG_INFO, "Unsupported v8r_el1_msa value\n");
> +        return -EINVAL;
> +    }
> +
>      return sci_domain_sanitise_config(config);
>  }
>  
> @@ -722,6 +755,10 @@ int arch_domain_create(struct domain *d,
>      d->arch.sve_vl = config->arch.sve_vl;
>  #endif
>  
> +#ifdef CONFIG_MPU
> +    d->arch.v8r_el1_msa = config->arch.v8r_el1_msa;
> +#endif
> +
>      if ( (rc = sci_domain_init(d, config)) != 0 )
>          goto fail;
>  
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index b24f02d269be..ac7300e41fcd 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -112,6 +112,10 @@ struct arch_domain
>  #endif
>  
>      struct resume_info resume_ctx;
> +
> +#ifdef CONFIG_MPU
> +    uint8_t v8r_el1_msa;
> +#endif
>  }  __cacheline_aligned;
>  
>  struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index 6674dac5e2f8..13e88fc0891b 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -19,6 +19,16 @@ int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
>  
>  int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
>  
> +#ifdef CONFIG_MPU
You could do: && CONFIG_ARM64 and then ...

> +/* Utility function to determine if an Armv8-R processor supports VMSA. */
> +bool has_v8r_vmsa_support(void);
> +#else
> +static inline bool has_v8r_vmsa_support(void)
> +{
> +    return false;
> +}
> +#endif /* CONFIG_MPU */
> +
>  #endif
>  
>  /*
> diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
> index a4673c351141..702bea804acd 100644
> --- a/xen/arch/arm/mpu/arm32/mm.c
> +++ b/xen/arch/arm/mpu/arm32/mm.c
> @@ -5,6 +5,8 @@
>  #include <asm/mpu.h>
>  #include <asm/sysregs.h>
>  #include <asm/system.h>
> +#include <public/arch-arm.h>
> +#include <public/domctl.h>
You don't seem to add anything from these headers.

>  
>  #define GENERATE_WRITE_PR_REG_CASE(num, pr)               \
>      case num:                                             \
> @@ -38,6 +40,11 @@
>          break;                                            \
>      }
>  
> +bool has_v8r_vmsa_support(void)
> +{
> +    return false;
> +}
... and then you could get rid of this stub
> +
>  /*
>   * Armv8-R supports direct access and indirect access to the MPU regions through
>   * registers:
> diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
> index ed643cad4073..b8abcc6f7bc6 100644
> --- a/xen/arch/arm/mpu/arm64/mm.c
> +++ b/xen/arch/arm/mpu/arm64/mm.c
> @@ -5,6 +5,8 @@
>  #include <asm/mpu.h>
>  #include <asm/sysregs.h>
>  #include <asm/system.h>
> +#include <public/arch-arm.h>
> +#include <public/domctl.h>
You don't seem to add anything from these headers.

~Michal


