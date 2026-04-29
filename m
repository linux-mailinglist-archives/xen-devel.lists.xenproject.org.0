Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEakIUO/8WkbkQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 10:20:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DD74911CE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 10:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297103.1573239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI09O-0003P6-9t; Wed, 29 Apr 2026 08:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297103.1573239; Wed, 29 Apr 2026 08:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI09O-0003Ne-6P; Wed, 29 Apr 2026 08:20:06 +0000
Received: by outflank-mailman (input) for mailman id 1297103;
 Wed, 29 Apr 2026 08:20:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wI09M-000376-DS
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 08:20:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI09L-00BiLo-Pf
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 10:20:03 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f1bf2e-bab6-0a2a0a5309dd-0a2a4505d49a-34
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 10:20:03 +0200
Received: from [52.101.52.4]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f1bf31-aaa8-0a2a45050019-34653404aa11-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 10:20:02 +0200
Received: from DM6PR18CA0020.namprd18.prod.outlook.com (2603:10b6:5:15b::33)
 by LV3PR12MB9354.namprd12.prod.outlook.com (2603:10b6:408:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 08:19:56 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:5:15b:cafe::bb) by DM6PR18CA0020.outlook.office365.com
 (2603:10b6:5:15b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 08:19:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 08:19:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Apr
 2026 03:19:56 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 03:19:54 -0500
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
 b=ZGH04N0miKyh4cAqzgkKBH4CllAPv/kgJeLl2OrUE8z7nMMpIeaeZvO3iMKUootqmr7a4iDC+4UjmNAwyzmU0nGmnetxC+EyQ++UMw0NZpwd7muiKaTrPK5Sougejg4kUJ/vo6mDrrMpy/ARsfsr8mZ5BORBQw62U5J8L0ovdkpk3heJjhs/Jx/D/LAucDKeNELekG8ofMD0iaj5N21+k7y/4m/lZf0npHjzhf/3s9Cx1mlW5Wc1B1awmtF0snnzwmXxJK4YqvAi9hrinRhGWG1juNTkKYmTedfVhspzYqxGMKVqbrbngODOD9A1DLFzdeEwz8i/WmXiX/XA1upgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCtXFZ4vmBw/HVZX3GMMi3hktLdKRP5ivDFK3iSz6cY=;
 b=SWQl0LpECYzCl7zL+NZZuKSlCvGUUp6nRlC7Ycu/Ef1GEClArz8SX6j46QpbWbRFLhas/ok/mJ8PEj+jyk7L8Hvrq1hhC3mZs7hECqk2KNwqPHW0AstmKecmJpAyL3W73RavBzH4RqmSlQoRnneJyO8Gfl5Lna/AcAoXDILmtzrKT023PvS8muKM8bujoajyC9XWXOQak9RsasMUOu9UwHiRtpNe/bsDkvCrrbk+gw55/SVUfqSYF8Mm1kTxxid/PjdhMWe5fZHvcsoGtgNq6XLwSA3C8e5ZY3kIt21ZALFHgkNzFk5vXZjtw758YU1l5kt/0PwBhUew+L518Q/lYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCtXFZ4vmBw/HVZX3GMMi3hktLdKRP5ivDFK3iSz6cY=;
 b=DFu75JJeb7FEDA7IFD5Rub4A7L1efVXU9NFoW9s8xH65seKrc5LfPkFDw9zG/C6RkryFbpoCfhydsnLU8OiXKg7H6BM4XpufCKrJc8V0a74yydwxpZfunaDVeFnSQdVFbKBNdDuq41BuPOS5wHMcNdidZHgfhxOIsBYslCRKlbs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <59548223-99d7-4a11-ac81-39eee6474562@amd.com>
Date: Wed, 29 Apr 2026 10:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: gic-v2: disable interrupt bypass on CPU
 shutdown
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <18c5532816d852fca073d0552dcb6d497730a6c2.1777377278.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <18c5532816d852fca073d0552dcb6d497730a6c2.1777377278.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|LV3PR12MB9354:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a253f6-4747-4e16-75c2-08dea5c81911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	P8sd2gXGV8F/skFNwvG26vMhGNqnTh6KnS+Pwe6gdzHE7+NdWy63JF4G9UACvvl5JIya7DzGW/SyIyKiryflNW8G/SHT3PnY+me/6+CDjxH7fsaECc/tCAbNZFTD20QzqFsNNOnD5ILVRdvMHK2CES6x6ljnLI1eSVILzYzdPwivIvQUevrDt0R3hJQTPEwBBqdR+f9ayb8eJNbsXLEF6yn/4fi9dznaLIeh2FqESBBHMnXsojMGBAf/npfG1lAh+W57n0OMT1jVR+gPsojbRj9p1Llvev21FgEa5kZc/LCg095YbUWKatqsLJ9U6GbE0/Q0zmjYp4iN4LAdydSidtex/bo35eLMNVxzkdFmFRwad4EAn1ux/AeDQXPtdAse4y/qkK0c6wIwvCHGff5P0LOPrNrwvCtqlMzVhmaE7Hk1E/GL3zZ8KqejEZpPh0ErDq7MlSfs0G3ZHINMGXX8jpyuROrYLgBQd9iMLXww8Ml1mDCYOHLOxoHf+G1EULDkNYSUwYf0OSlFEI1K4EA22bun7JT4It4JXKQfH0LXnAdt9TOdCiL0Gw6ahC+6xoK8OdvScq29cUO9DRLzGIED7/0SgBygpwsTwXo+hg4Q+PExvaZ45VZm7iZZ2OrS8FX/uznv3Nh+IhuPvUfVKYaizZh3L8kDwuxSkd8u3yeW6RDZBFwyC6P07XrVZg5vWeoy+CPqw1I+7LyumCfN4UTLSQQO9vprYaJY/2eOfXjdGDCf7569/bwzUz35QAu1dhp5iCviBjqacZM+s+C4mhLYQw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GbwjqbxnugEvb3Y7uiqjopvWtjL3dIXhZcbtEoBwK93mDKY80dKyQ1mQ728W0RVai5hGg0wqRWLT1p89VVsibvpPpJ6kwoyrdHb0SQy6kry1ogPnrto2p1YnqyTTH7QkG3qlYmhu0OsKYILo7kz6easVEeLtTOASfEBAxunZs215rOkT5xyAo+f3Ef9DjkxzDXOB0QgHA/xx3Ipc919bElXtnyC7O0LuLdDoAba+fa8NkEahaI9aI7ablChaTYot4eJXPiimBrNCK+5KsBXsX8KFrHYLOlCeKURBjuoTqRCs/ajC2ZGjuThiGT/hoZmioeRdjQe3G0q3Iy0B8u7oPgpfA0tGpLo0L65V9OpVF/0karIWfEagw2wxWQYUUxer0J6cPG3hL9/I698oSmn3UwQr5zJCvZobUVXSu+QzBKPZZiO6CdPXG7oN9YNkPMOT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 08:19:56.4995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a253f6-4747-4e16-75c2-08dea5c81911
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9354
X-purgate-ID: tlsNG-c201ff/1777450803-2AF6E443-1035E2C9/0/0
X-purgate-type: clean
X-purgate-size: 4842
X-Rspamd-Queue-Id: E4DD74911CE
X-Rspamd-Action: no action
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.953];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid,epam.com:email]



On 28-Apr-26 13:57, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The GICv2 CPU shutdown path currently writes 0 to GICC_CTLR.
> 
> Per IHI0048B.b section 2.3.1, clearing the architected bypass-disable
> bits selects bypass rather than deasserted interrupt outputs when the
> CPU interface stops driving them. Tables 2-2 and 2-3 show that a zeroed
> GICC_CTLR can fall back to the legacy IRQ/FIQ inputs instead of fully
> disabling the interface.
> 
> Fix this by reading GICC_CTLR, then setting the bypass-disable bits and
> clearing the group-enable bits that are architecturally defined for the
> current GICC_CTLR view before writing the value back. When Security
> Extensions are implemented Xen accesses the Non-secure copy of
> GICC_CTLR, where IRQBypDisGrp1 and FIQBypDisGrp1 are at bits [6:5] and
> bits [8:7] are reserved.
> 
> Without Security Extensions there is no separate Secure/Non-secure CPU
> interface view, so disabling both group-enable bits affects the shared
> interface state. This is still appropriate for the CPU shutdown path,
> which is expected to stop normal interrupt delivery through the interface
> and rely only on the architecturally separate wakeup event signaling.
> 
> Section 2.3.2 also states that wakeup event signals remain available
> even when both GIC interrupt signaling and interrupt bypass are
> disabled, so disabling bypass does not break the power-management use
> case, i.e. suspend modes.
> 
> Fixes: 5e40a1b4351e ("arm: SMP CPU shutdown")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> 
> ---
> Changes in v2:
> - derive the shutdown masks from the active GICC_CTLR layout
> - use the Non-secure GICC_CTLR layout when GICD_TYPER.SecurityExtn is set
> - stop writing reserved bits [8:7] on Security Extensions systems
> ---
>  xen/arch/arm/gic-v2.c          | 16 +++++++++++++++-
>  xen/arch/arm/include/asm/gic.h | 25 +++++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 014f955967..241c1ff5c5 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -408,7 +408,21 @@ static void gicv2_cpu_init(void)
>  
>  static void gicv2_cpu_disable(void)
>  {
> -    writel_gicc(0x0, GICC_CTLR);
> +    uint32_t ctlr = readl_gicc(GICC_CTLR);
> +
> +    if ( readl_gicd(GICD_TYPER) & GICD_TYPE_SEC )
> +    {
> +        ctlr |= GICC_NS_CTLR_BYPASS_DISABLE_GRP1_MASK;
> +        ctlr &= ~GICC_CTL_ENABLE;
> +    }
> +    else
> +    {
> +        ctlr |= GICC_CTLR_BYPASS_DISABLE_GRP0_MASK |
> +                GICC_CTLR_BYPASS_DISABLE_GRP1_MASK;
> +        ctlr &= ~(GICC_CTL_ENABLE | GICC_CTL_ENABLE_GRP1);
> +    }
I don't understand why you want to set both G0 and G1,
Bits 5-6 in the NS view control Group 1, while the same bits in the
Secure/single-security-state view control Group 0. So in the latter case you
don't need to set G1. Without security extensions all interrupts are G0 and with
security extensions (NS access) all interrupts are G1. The spec guarantees the
functional mapping.

~Michal


> +
> +    writel_gicc(ctlr, GICC_CTLR);
>  }
>  
>  static void gicv2_hyp_init(void)
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index 8e713aa477..ff22dea40d 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -102,8 +102,29 @@
>  #define GICD_TYPE_SEC   0x400
>  #define GICD_TYPER_DVIS (1U << 18)
>  
> -#define GICC_CTL_ENABLE 0x1
> -#define GICC_CTL_EOI    (0x1 << 9)
> +/*
> + * Xen runs in the Non-secure world. When Security Extensions are present,
> + * Xen accesses the Non-secure GICC_CTLR view, where bit[0] is EnableGrp1
> + * and bits[6:5] are the Group 1 bypass-disable bits. Otherwise Xen sees the
> + * common GICC_CTLR layout, where bit[0] is EnableGrp0, bit[1] is EnableGrp1,
> + * bits[6:5] are the Group 0 bypass-disable bits, and bits[8:7] are the
> + * Group 1 bypass-disable bits.
> + */
> +#define GICC_CTL_ENABLE        (0x1 << 0)
> +#define GICC_CTL_ENABLE_GRP1   (0x1 << 1)
> +#define GICC_CTL_FIQBypDisGrp0 (0x1 << 5)
> +#define GICC_CTL_IRQBypDisGrp0 (0x1 << 6)
> +#define GICC_CTL_FIQBypDisGrp1 (0x1 << 7)
> +#define GICC_CTL_IRQBypDisGrp1 (0x1 << 8)
> +
> +#define GICC_CTLR_BYPASS_DISABLE_GRP0_MASK              \
> +    (GICC_CTL_FIQBypDisGrp0 | GICC_CTL_IRQBypDisGrp0)
> +#define GICC_CTLR_BYPASS_DISABLE_GRP1_MASK              \
> +    (GICC_CTL_FIQBypDisGrp1 | GICC_CTL_IRQBypDisGrp1)
> +#define GICC_NS_CTLR_BYPASS_DISABLE_GRP1_MASK           \
> +    GICC_CTLR_BYPASS_DISABLE_GRP0_MASK
> +
> +#define GICC_CTL_EOI           (0x1 << 9)
>  
>  #define GICC_IA_IRQ       0x03ff
>  #define GICC_IA_CPU_MASK  0x1c00


