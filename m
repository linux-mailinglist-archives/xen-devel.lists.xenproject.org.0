Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MzvAp+sAWoMhwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:17:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E34850BC0B
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:17:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305966.1578067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMNgB-000697-Fg; Mon, 11 May 2026 10:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305966.1578067; Mon, 11 May 2026 10:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMNgB-00066U-CP; Mon, 11 May 2026 10:16:03 +0000
Received: by outflank-mailman (input) for mailman id 1305966;
 Mon, 11 May 2026 10:16:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMNg9-00066O-FJ
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 10:16:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMNg8-002fTn-SM
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:16:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01ac52-2eae-0a2a0a5409dd-0a2a4505c22a-26
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:16:00 +0200
Received: from [52.101.46.64]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01ac5e-aaa8-0a2a45050019-34652e40ecff-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:16:00 +0200
Received: from CY8PR12CA0022.namprd12.prod.outlook.com (2603:10b6:930:4e::17)
 by SN7PR12MB6984.namprd12.prod.outlook.com (2603:10b6:806:260::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 10:15:53 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:4e:cafe::7d) by CY8PR12CA0022.outlook.office365.com
 (2603:10b6:930:4e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:15:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 10:15:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 11 May
 2026 05:15:52 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 May
 2026 05:15:52 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 05:15:50 -0500
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
 b=ULJSeZK/b90pb+Vu99pRsy487KGXHyFwc/PXBfjRf6JROKm8hOflHehBl4SGWqayj5oaXyXzoWRPmBouqwN0DOfNHFgm8rt/BZlH27n9CILDyUvJrJzHwMbZ1JWfF6NT5x4q+p4p59jzDeop6EjXTo6AfXmsZaFHxj65tc/CVPYZAbTE6cY0SfFx0sCiuhmMuvgfY8aqM66FSkUZ7PZL7+P6oML9icHzHHUrF+ZVHO/ME7TQXmNHmpNnOdgmkhDeKgnmZT56/aCyP52P0L4WtguyaEmtSHgyWIlGFVCO9yrGDyoNzNBCvX9CabBpA+I8LTV+0IcpLvkkkJLyB2LJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wy62t5pMG6OU0Yn66m7Z2DmwJW0UbR2c54uKV84Z7PU=;
 b=qlahfv3TSAOOYXEB3yhnPnSIHu0v2U0zZQM0/f1dxTZ46ApLVew7p7NCz2CaLqrL6RQr25yLVwb09lCwBUxn+bnL2GRVMRPSTqczC4K21FH6oqeZuCNnNNjvlnS4lfA4JGelSOE+8rPI6+I+SxBKvMQ3KaSK6aZc1v73pfu5iBfHouTYt/65hPLRg9S/GsH1PbWdF5rZNsybBRD/hDGSRxLMts3WL1C8RsAi32KhPwCINUnbIFKUnwVMxogMFKLEPFO4cvDhML4k9rvL9YWaWxCYoQ3g30yWpLZjlh3cTU7dKCgX2DXbfZpVxFberMVRkEvSGSLxzQ1VpQwfL3YXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wy62t5pMG6OU0Yn66m7Z2DmwJW0UbR2c54uKV84Z7PU=;
 b=y5TBnJ9/R/JPNzw+fGM/A7nUo+0BCbFB4dxOKY9Lo1Uc+xM27DrQqsLCNTzoFv1At/cJ5NhBt1tin1KRe8oz/M6Jp4p4jxrAWPHKbS+7JtLs4Xi/jdyWYTDuAWwULo3ZeRrl3SvdvIYQmGjgbf13JzvinleY7z+BMu6Kau58D6I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <63c08741-42dd-41c2-9f27-b14f350544c7@amd.com>
Date: Mon, 11 May 2026 12:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Harry Ramsey <harry.ramsey@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-3-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260508143353.3512004-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|SN7PR12MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f1bc23-f951-4305-9893-08deaf464858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OJtzhJ2RocMMLimkiDj5uw0QS/U6ZbEV63hpVHEdgWk59BvGncf2Aziijj3cBXHhUgrr0YBTxZsvr2/S2Yy9G/qt1piwN2kWJCNfKO1gaIhOLbkbGN8dw8QeqEsqhGB33O6ZRktaqihM64ndRRjpMOL0z3zy/JDJY2Hao6Hyvp0ESxhHZRMCEp/nUIsWqxX2TbWdZVzQHNKaqEmGtVaMPQfXbYf3iFSvrBqmDhldkPue24EkLkGCllOgiXvpJC/La2lLiSZww7v8eHxmJLuYF3101rL/Ex6N13xLyQoybs4slh937ZByn1Mowqe6SvBsqnTaFfxAMaJ9ANMhNCcvxhJmATflunuxpktBrZu6hiE0S5yh+B9j3R0ZYF4s7YEpMUXEGifcpIR8h739QHaVH6aL7qse+TKmnNPMwrMCKFea0U/kc7xw/L9yFNwtCbXH8NJGOvZG3YFQAFJHgycbrzoOOoz/TkilF2giilVfJ0j87UeqTbYQTjCn8L1+TbxFrVyh3kbRTcFDnyKoVY577rAsuOm1ydAP185KuzARUW68mCjVYuYJ5NWYza9il0FJdqxr9+UK0OKBAkwvEb5P18ZXJ3dzfV4484AL59cen1E8LkY1t5GOElV1J12QSvkrL7jR9Rx9SiGA9tnn3lwG4tSmtQU4Y3dCD2nb7K+Hc1tnocoU1J9Hv9q8rgErNBSZBfRfSOsrg6uMjoEiDSBQdY3GapYKyNp6ob8Zju6NnJE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6E2i9eEwH3eNSU08KxErThEKw+hdyS+BCYlWNrXcZ3kjdLnvcU+TxZ1CyKlBFO1ipZ3arGCFWT502O/VQPkL3uxbSmZKIc1xQeg8wBvAMCaVfXBlb92xuqWhaa9QY8LFNCbFfRsL1raGv7W1jSPQ2NHjWjiF3TurLePA2NL6IMFI2C+c3VAtUDiqKSyklXlu1zuiQsVuzInl8VdaTeeY7+HkcKF4IrFdjv0km1R9M5y0vyffmySERw3czvrNHcLYlAOCcKLesfRseolQeluoQuD5Z3qg5i7yUwDNN03tvMAPBea/T3ziW/HDmxMUGHvSp+onSk2UgMU06Pfly1JDat4D11/QR7WBUJUutdN4iWAPU5Lq7RZpMth1QWq+PrrnS/JYs+GRh+x83bzxWCs9x4CSdimBYK7VoiGPXBorGlYAc61us47haOfuWJ5IKTgu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:15:52.8618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f1bc23-f951-4305-9893-08deaf464858
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6984
X-purgate-ID: tlsNG-c201ff/1778494560-E0461443-F87F1A77/0/0
X-purgate-type: clean
X-purgate-size: 10302
X-Rspamd-Queue-Id: 3E34850BC0B
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
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:harry.ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 08-May-26 16:33, Luca Fancellu wrote:
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
> Given the breaking change, bump the XEN_DOMCTL_INTERFACE_VERSION.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
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
>  xen/arch/arm/domain.c                   | 11 ++++
>  xen/arch/arm/include/asm/domain.h       |  4 ++
>  xen/arch/arm/include/asm/domain_build.h | 21 +++++++
>  xen/arch/arm/mpu/arm32/mm.c             | 17 ++++++
>  xen/arch/arm/mpu/arm64/mm.c             | 18 ++++++
>  xen/include/public/arch-arm.h           |  6 ++
>  xen/include/public/domctl.h             |  4 +-
>  9 files changed, 167 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 977b4286082f..2389ae610963 100644
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
> +    Enables PMSAv8 at EL1. This is the default behaviour when the property is
s/behaviour/behavior/

> +    not passed. This configuration requires static allocation (xen,static-mem)
> +    and direct mapping (direct-map).
> +
>  Under the "xen,domain" compatible node, one or more sub-nodes are present
>  for the DomU kernel and ramdisk.
>  
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 6f73c65e5151..2a0671bd0e8e 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -295,6 +295,77 @@ static int __init domu_dt_sci_parse(struct dt_device_node *node,
>      return 0;
>  }
>  
> +static int __init
> +domu_dt_v8r_el1_msa_parse(struct dt_device_node *node,
node can be const

> +                          struct xen_domctl_createdomain *d_cfg,
> +                          unsigned int flags)
> +{
> +    bool property_present = dt_property_read_bool(node, "v8r_el1_msa");
> +
> +    if ( !property_present )
> +        d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE;
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
> +                   v8r_el1_msa, dt_node_name(node));
dt_node_name can be any arbitrary name not necessarily denoting a domain in a
meaningful way. Without a full path it can be misleading. Either print a full
path or don't print it at all. Here and elsewhere.

> +            return -EINVAL;
> +        }
> +    }
> +
> +    if ( !IS_ENABLED(CONFIG_MPU) )
> +    {
> +        if ( !property_present )
> +            return 0;
> +
> +        printk(XENLOG_ERR
> +               "Not supported 'v8r_el1_msa' DT property found for domain %s\n",
> +               dt_node_name(node));
> +        return -EINVAL;
> +    }
> +
> +    switch ( d_cfg->arch.v8r_el1_msa )
> +    {
> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE:
> +        fallthrough;
> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA:
> +        if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
> +        {
> +            printk(XENLOG_ERR
> +                   "PMSA is not valid for domain (%s) without static allocation and direct map (v8r_el1_msa)\n",
> +                   dt_node_name(node));
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
> +}
> +
>  int __init arch_parse_dom0less_node(struct dt_device_node *node,
>                                      struct boot_domain *bd)
>  {
> @@ -308,6 +379,9 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
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
> index 26380a807cad..ac7d1abd9c7c 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -18,6 +18,7 @@
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
>  #include <asm/current.h>
> +#include <asm/domain_build.h>
>  #include <asm/event.h>
>  #include <asm/gic.h>
>  #include <asm/guest_atomics.h>
> @@ -630,6 +631,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
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
> @@ -722,6 +729,10 @@ int arch_domain_create(struct domain *d,
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
> index 6674dac5e2f8..50ddc0511e7e 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -19,6 +19,27 @@ int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
>  
>  int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
>  
> +#ifdef CONFIG_MPU
> +/* Utility function to determine if an Armv8-R processor supports VMSA. */
> +bool has_v8r_vmsa_support(void);
> +bool v8r_el1_msa_domain_sanitise_config(
> +    const struct xen_domctl_createdomain *config);
> +#else
> +static inline bool has_v8r_vmsa_support(void)
> +{
> +    return false;
> +}
> +
> +static inline bool v8r_el1_msa_domain_sanitise_config(
> +    const struct xen_domctl_createdomain *config)
Why can't this function be common? I can see 3 definitions (Arm64 MPU, Arm32
MPU, MMU) but they do not have anything that would prevent from generalizing
them in a single function.

> +{
> +    if ( config->arch.v8r_el1_msa != XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE )
> +        return false;
> +
> +    return true;
> +}
> +#endif /* CONFIG_MPU */
> +
>  #endif
>  
>  /*
> diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
> index a4673c351141..a759ebdfc124 100644
> --- a/xen/arch/arm/mpu/arm32/mm.c
> +++ b/xen/arch/arm/mpu/arm32/mm.c
> @@ -5,6 +5,8 @@
>  #include <asm/mpu.h>
>  #include <asm/sysregs.h>
>  #include <asm/system.h>
> +#include <public/arch-arm.h>
> +#include <public/domctl.h>
>  
>  #define GENERATE_WRITE_PR_REG_CASE(num, pr)               \
>      case num:                                             \
> @@ -38,6 +40,21 @@
>          break;                                            \
>      }
>  
> +bool has_v8r_vmsa_support(void)
> +{
> +    return false;
> +}
> +
> +bool v8r_el1_msa_domain_sanitise_config(
> +    const struct xen_domctl_createdomain *config)
> +{
> +    if ( config->arch.v8r_el1_msa != XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE &&
> +         config->arch.v8r_el1_msa != XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA )
Please add brackets ( () && () )


~Michal


