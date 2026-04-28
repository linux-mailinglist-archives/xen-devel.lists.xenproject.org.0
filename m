Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLDdAnIT8WlZcwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 22:07:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D2848B723
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 22:07:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296829.1573049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHoh9-0001Fs-Fg; Tue, 28 Apr 2026 20:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296829.1573049; Tue, 28 Apr 2026 20:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHoh9-0001Cs-Bt; Tue, 28 Apr 2026 20:06:11 +0000
Received: by outflank-mailman (input) for mailman id 1296829;
 Tue, 28 Apr 2026 20:06:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1wHoh7-0001Cm-D2
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 20:06:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHoh6-001FOW-Aa
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 22:06:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69f11325-2eae-0a2a0a5409dd-0a2a450aec1a-12
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 22:06:07 +0200
Received: from [52.101.43.12]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69f1132d-56b3-0a2a450a0019-34652b0cd477-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 22:06:07 +0200
Received: from BN9PR03CA0657.namprd03.prod.outlook.com (2603:10b6:408:13b::32)
 by DS0PR12MB8366.namprd12.prod.outlook.com (2603:10b6:8:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 20:06:01 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::d6) by BN9PR03CA0657.outlook.office365.com
 (2603:10b6:408:13b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 20:06:01 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 20:06:00 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 15:06:00 -0500
Received: from [172.24.40.209] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 15:05:59 -0500
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
 b=d8sRZd4UCq8rN7DD5AGklHjrf0iowqpsVC2v0BWEQ4lsmDSBXMZNFlFIEmjcN2F1p3ZYMlNp6XVF5vtMHwiujS6/Lbi+JslRoJesd0tZ0iKqVQcRmOKSLkSZDlk3rzJOx9upfeo4sidEMlcQXBJSJtsD9bi+RtLrqIwwQfEgZSf0ZClxRQ+kO/4AYBlEpq9VwEjy7xwCveUA5TUX/Q9GdCbkSTIw/tql/UOnQF3RxQsG7Qt47DACyuPeZEFJEP33BdX8/e6ilrKJeQS0ymvRotlTKxuDk6xxtpV4lgyX4P/irROXM8lPbBUBLrDW5mIXM6Z80t8RQlDHNV9mUimNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0D0pZeBYa/0GoYlAsZ1ArtMsS7D7ytJx33yY1bDjnM=;
 b=J135POFdWqC3nrSnsbI7v1k67aZlHHY5ziE+u00S5ofn8YId2ayN5w9W/TUO3AxV6pT0XhwVQu9SnxoN3l2Rt4DKGEYY3NezzordVoZqjvmcpL3rrU/zDdKoINbilsSYWSf95cKrAeCn3I84/v9noqn5szmroKsxYiwXlWQPyuDwQzodT16Am9rtDh3wS8x9dNu+Z1nl8tdpuLPM95VEvoLgh49hQQLjPsQ6/CYnNI3CHCfYb58wezHUHqXsLr83b2/5eT3C4Zc9tVZe5EBFBu6yl6Ti2hXbcLxdC9UxhTEiTrLML37yyYA1UKjdpgF5YVlnpxgBAnBnF8/qAMqqlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0D0pZeBYa/0GoYlAsZ1ArtMsS7D7ytJx33yY1bDjnM=;
 b=3Fts5gYu+cEfOM3BUjN5AMbuBydqMyFlj83kcS4lJzZuY0wxhIa7FMd5gVVmMOEgh4Zd/wUhxNGVN2X8RTxdfNz3fjAJqo2h9HIckx1USnho8RPbEsRrhLpMYHS2D233j0DjVuqAZR3iT6xgWUN/FGGrVuPN+bzNtbyAdR0xzlU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <275c1e83-ddf3-4d1b-9777-cd6d56d357a3@amd.com>
Date: Tue, 28 Apr 2026 16:05:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|DS0PR12MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 894627f6-9595-4e1e-f467-08dea56191d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SkFn9AmsvAxALFWwFf3u5yCqM8GPKibI113/OOLTtdveoI4wJ/oLtP4/iZ8yLQp1vX8lCoh7Vfb+b2xw+oF61VVxdTEynG4PnjL8FHf6M/rmv2J5JNHi9iVxt/sfaRAjSkQBSbd9XEOEC9M1+sJ4UPNmSU5Ns8jqt4orojNyOZcRXypnNMfZhr9IwACB8nhcx4vouHHk81NwHwdF00fdpYdN0jdM0L139gr3+YIzBf+eOfWHHrQwtTQl7HjVbDczalrQ6gGlD7HJABOq54xnubC78yS0iC50IqChX/VLFNcaOjIMl6+itvoIAmynVrqaSFiQhQvhk1FMCDVZgPDFLB81BnmXTFCe2ZQ6smqq7rhBBd61NvTLIVdwbn189541XnuaRrrxFaqVOApkA7ihKdjrkV/7V3+45ASEiJgatz4/fr+F9aSCXTlZJEPwo8ki27w9Y3o2AbAvnkybG/Die90fasQvcBWGksTbBGM+wMFXXONr/Mr/zJ9QRO6u/SotHu8sBkJiNak8A8K+ighxWTDAXi0+01GjanAtLlfqdT6Z0bdL+P5LJdYQ2I9JE9Pi07j+gLd3cSzK9Vf1uMzwhRAQaWMb08PH4iVn9d+IYFg3hYQKsfr/UW+kH48GlgrnjlXPTvIFnOcjXZFnoLKwlRuxuq6VazgseMiziM/kEqpCRzKp+zcJjsbKF5DBpTLUYTfTvGYy6TRr75yInBls4/13uYr1iPj9IWN0Iv/IP76CVtuNgN66Gm+l6OKY6ktjBpUMIRAxQQ7qnnnh5B/C4w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dmhf0mokdWGpkI+mmpUQ7GitauQav2GdIeAFiTte9uzaFO3289fQAcwyzJk+yKVczED1fojqj3hARYC0pWnmtrDtxhDpmuQfGkjlLtlzy/A5KfTxQWbhvOkSKpEZd/DRIiNvQBCLhkh6Pip3mw/L//I43nEjOaM+2kGZpPs6y+phIGkbju6kpJYlNuHXDS6rX55V9h6gRm/j9T9Z+TiOnk02GE/WhnF7XCPnBvzRC9qc7po2gu0qfYGucpefyNe65CGgzrWpdRXN9Boil65gAV6YCany5VUno8mNPqJ8IveXEHbE5WpYiUR5Pi/rhi5msuoz06FQoOqeZma3F5xO3nCj66N6ThP86Mkd7nnFyLEr1xyAp08hatHdMnFFynfp4crFn4USnkpBFGpRHe6IEk6abI0np8HbayDWc0L67vxEMjhUmTx9IXJVKDNGrLuY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 20:06:00.9670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 894627f6-9595-4e1e-f467-08dea56191d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8366
X-purgate-ID: tlsNG-4011c0/1777406767-4576D8B7-54372D30/0/0
X-purgate-type: clean
X-purgate-size: 15072
X-Rspamd-Queue-Id: 17D2848B723
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,citrix.com:email]

On 4/9/26 10:01, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> This code is expected to only be used by privileged domains,
> unprivileged domains should not get access to the SR-IOV capability.
> 
> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
> for possible changes in the system page size register. Also force VFs to
> always use emulated reads for command register, this is needed to
> prevent some drivers accidentally unmapping BARs. Discovery of VFs is
> done by Dom0, which must register them with Xen.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v2->v3:
> * rework adding VFs with multiple mapping operations support
> * use private.h
> * style fixes
> * fixup cleanup_sriov
> * emulate command register read for VFs

Also noteworthy: switched back to no longer adding VFs within Xen.

> 
> v1->v2:
> * switch to VF discovery by Xen
> * fix sequential vpci_modify_bars calls
> * move documentation changes to a separate commit
> ---
>  xen/drivers/vpci/Makefile  |   1 +
>  xen/drivers/vpci/header.c  |   6 +-
>  xen/drivers/vpci/private.h |   1 +
>  xen/drivers/vpci/sriov.c   | 314 +++++++++++++++++++++++++++++++++++++
>  xen/include/xen/vpci.h     |   7 +-
>  5 files changed, 327 insertions(+), 2 deletions(-)
>  create mode 100644 xen/drivers/vpci/sriov.c
> 
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index 9793a4f9b0..8b0e3c03a7 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1,3 +1,4 @@
>  obj-y += cap.o
>  obj-y += vpci.o header.o rebar.o
> +obj-y += sriov.o
>  obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 451cdd3a6f..a36285672e 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -869,7 +869,8 @@ int vpci_init_header(struct pci_dev *pdev)
>       * PCI_COMMAND_PARITY, PCI_COMMAND_SERR, and PCI_COMMAND_FAST_BACK.
>       */
>      rc = vpci_add_register_mask(pdev->vpci,
> -                                is_hwdom ? vpci_hw_read16 : guest_cmd_read,
> +                                is_hwdom && !pdev->info.is_virtfn
> +                                ? vpci_hw_read16 : guest_cmd_read,
>                                  cmd_write, PCI_COMMAND, 2, header, 0, 0,
>                                  is_hwdom ? 0
>                                           : PCI_COMMAND_RSVDP_MASK |
> @@ -900,6 +901,9 @@ int vpci_init_header(struct pci_dev *pdev)
>  
>      header->guest_cmd = cmd;
>  
> +    if ( pdev->info.is_virtfn )
> +        return vpci_vf_init_header(pdev);
> +
>      /* Disable memory decoding before sizing. */
>      if ( !is_hwdom || (cmd & PCI_COMMAND_MEMORY) )
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
> diff --git a/xen/drivers/vpci/private.h b/xen/drivers/vpci/private.h
> index f012fd160d..8e0043ddbe 100644
> --- a/xen/drivers/vpci/private.h
> +++ b/xen/drivers/vpci/private.h
> @@ -45,6 +45,7 @@ typedef struct {
>      REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
>  
>  int __must_check vpci_init_header(struct pci_dev *pdev);
> +int __must_check vpci_vf_init_header(struct pci_dev *pdev);
>  
>  int vpci_init_capabilities(struct pci_dev *pdev, bool ext_only);
>  void vpci_cleanup_capabilities(struct pci_dev *pdev, bool ext_only);
> diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
> new file mode 100644
> index 0000000000..ec6a7b84d5
> --- /dev/null
> +++ b/xen/drivers/vpci/sriov.c
> @@ -0,0 +1,314 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Handlers for accesses to the SR-IOV capability structure.
> + *
> + * Copyright (C) 2026 Citrix Systems R&D
> + */
> +
> +#include <xen/sched.h>
> +#include <xen/vpci.h>
> +#include <xsm/xsm.h>
> +#include "private.h"
Should "private.h" move up so it's first?

> +
> +static int vf_init_bars(const struct pci_dev *vf_pdev)
> +{
> +    int vf_idx;
> +    unsigned int i;
> +    const struct pci_dev *pf_pdev = vf_pdev->pf_pdev;
> +    struct vpci_bar *bars = vf_pdev->vpci->header.bars;
> +    struct vpci_bar *physfn_vf_bars = pf_pdev->vpci->sriov->vf_bars;
> +    unsigned int sriov_pos = pci_find_ext_capability(pf_pdev,
> +                                                     PCI_EXT_CAP_ID_SRIOV);
> +    uint16_t offset = pci_conf_read16(pf_pdev->sbdf,
> +                                      sriov_pos + PCI_SRIOV_VF_OFFSET);
> +    uint16_t stride = pci_conf_read16(pf_pdev->sbdf,
> +                                      sriov_pos + PCI_SRIOV_VF_STRIDE);
> +
> +    vf_idx = vf_pdev->sbdf.sbdf - (pf_pdev->sbdf.sbdf + offset);
> +    if ( vf_idx < 0 )
> +        return -EINVAL;
> +
> +    if ( stride )
> +    {
> +        if ( vf_idx % stride )
> +            return -EINVAL;
> +        vf_idx /= stride;
> +    }
> +
> +    /*
> +     * Set up BARs for this VF out of PF's VF BARs taking into account
> +     * the index of the VF.
> +     */
> +    for ( i = 0; i < PCI_SRIOV_NUM_BARS; i++ )
> +    {
> +        bars[i].addr = physfn_vf_bars[i].addr + vf_idx * physfn_vf_bars[i].size;
> +        bars[i].guest_addr = bars[i].addr;

We don't want to leak the host address to domUs, i.e. you might consider doing
something like:
    bars[i].guest_addr = is_hardware_domain(d) ? bars[i].addr : 0;

> +        bars[i].size = physfn_vf_bars[i].size;
> +        bars[i].type = physfn_vf_bars[i].type;
> +        bars[i].prefetchable = physfn_vf_bars[i].prefetchable;
> +    }
> +
> +    return 0;
> +}
> +
> +static int map_vfs(const struct pci_dev *pf_pdev, uint16_t cmd)
> +{
> +    struct pci_dev *vf_pdev;
> +    int rc;
> +
> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
> +
> +    list_for_each_entry(vf_pdev, &pf_pdev->vf_list, vf_list)
> +    {
> +        rc = vpci_modify_bars(vf_pdev, cmd, false);
> +        if ( rc )
> +        {
> +            gprintk(XENLOG_ERR, "failed to %s VF %pp: %d\n",
> +                    (cmd & PCI_COMMAND_MEMORY) ? "map" : "unmap",
> +                    &vf_pdev->sbdf, rc);
> +            return rc;
> +        }
> +
> +        vf_pdev->vpci->header.guest_cmd &= ~PCI_COMMAND_MEMORY;
> +        vf_pdev->vpci->header.guest_cmd |= (cmd & PCI_COMMAND_MEMORY);
> +    }
> +
> +    return 0;
> +}
> +
> +static int size_vf_bars(const struct pci_dev *pf_pdev, unsigned int sriov_pos,
> +                        uint64_t *vf_rlen)
> +{
> +    struct vpci_bar *bars;
> +    unsigned int i;
> +    int rc = 0;
> +
> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
> +    ASSERT(!pf_pdev->info.is_virtfn);
> +    ASSERT(pf_pdev->vpci->sriov);
> +
> +    /* Read BARs for VFs out of PF's SR-IOV extended capability. */
> +    bars = pf_pdev->vpci->sriov->vf_bars;
> +    /* Set the BARs addresses and size. */
> +    for ( i = 0; i < PCI_SRIOV_NUM_BARS; i += rc )
> +    {
> +        unsigned int idx = sriov_pos + PCI_SRIOV_BAR + i * 4;
> +        uint32_t bar;
> +        uint64_t addr, size;
> +
> +        bar = pci_conf_read32(pf_pdev->sbdf, idx);
> +
> +        rc = pci_size_mem_bar(pf_pdev->sbdf, idx, &addr, &size,
> +                              PCI_BAR_VF |
> +                              ((i == PCI_SRIOV_NUM_BARS - 1) ? PCI_BAR_LAST
> +                                                             : 0));
> +
> +        /*
> +         * Update vf_rlen on the PF. According to the spec the size of
> +         * the BARs can change if the system page size register is
> +         * modified, so always update rlen when enabling VFs.
> +         */
> +        vf_rlen[i] = size;
> +
> +        if ( !size )
> +        {
> +            bars[i].type = VPCI_BAR_EMPTY;
> +            continue;
> +        }
> +
> +        bars[i].addr = addr;
> +        bars[i].guest_addr = addr;
> +        bars[i].size = size;
> +        bars[i].prefetchable = bar & PCI_BASE_ADDRESS_MEM_PREFETCH;
> +
> +        switch ( rc )
> +        {
> +        case 1:
> +            bars[i].type = VPCI_BAR_MEM32;
> +            break;
> +
> +        case 2:
> +            bars[i].type = VPCI_BAR_MEM64_LO;
> +            bars[i + 1].type = VPCI_BAR_MEM64_HI;
> +            break;
> +
> +        default:
> +            ASSERT_UNREACHABLE();
> +        }
> +    }
> +
> +    rc = rc > 0 ? 0 : rc;
> +
> +    return rc;
> +}
> +
> +static void cf_check control_write(const struct pci_dev *pdev, unsigned int reg,
> +                                   uint32_t val, void *data)
> +{
> +    unsigned int sriov_pos = reg - PCI_SRIOV_CTRL;
> +    struct vpci_sriov *sriov = pdev->vpci->sriov;
> +    uint16_t control = pci_conf_read16(pdev->sbdf, reg);
> +    bool mem_enabled = control & PCI_SRIOV_CTRL_MSE;
> +    bool new_mem_enabled = val & PCI_SRIOV_CTRL_MSE;
> +    bool enabled = control & PCI_SRIOV_CTRL_VFE;
> +    bool new_enabled = val & PCI_SRIOV_CTRL_VFE;
> +    int rc;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    if ( new_enabled == enabled && new_mem_enabled == mem_enabled )
> +    {
> +        pci_conf_write16(pdev->sbdf, reg, val);
> +        return;
> +    }
> +
> +    if ( mem_enabled && !new_mem_enabled )
> +        map_vfs(pdev, 0);
> +
> +    if ( !enabled && new_enabled )
> +    {
> +        size_vf_bars(pdev, sriov_pos, (uint64_t *)data);
> +
> +        /*
> +         * Only update the number of active VFs when enabling, when
> +         * disabling use the cached value in order to always remove the same
> +         * number of VFs that were active.
> +         */
> +        sriov->num_vfs = pci_conf_read16(pdev->sbdf,
> +                                         sriov_pos + PCI_SRIOV_NUM_VF);
> +    }
> +
> +    if ( !mem_enabled && new_mem_enabled )
> +    {
> +        rc = map_vfs(pdev, PCI_COMMAND_MEMORY);
> +
> +        if ( rc )
> +            map_vfs(pdev, 0);
> +    }
> +
> +    pci_conf_write16(pdev->sbdf, reg, val);
> +}
> +
> +int vpci_vf_init_header(struct pci_dev *vf_pdev)
> +{
> +    const struct pci_dev *pf_pdev;
> +    unsigned int sriov_pos;
> +    int rc = 0;
> +    uint16_t ctrl;
> +
> +    ASSERT(rw_is_write_locked(&vf_pdev->domain->pci_lock));
> +
> +    if ( !vf_pdev->info.is_virtfn )
> +        return 0;
> +
> +    pf_pdev = vf_pdev->pf_pdev;
> +    ASSERT(pf_pdev);
> +
> +    rc = vf_init_bars(vf_pdev);
> +    if ( rc )
> +        return rc;
> +
> +    sriov_pos = pci_find_ext_capability(pf_pdev, PCI_EXT_CAP_ID_SRIOV);
> +    ctrl = pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
> +
> +    if ( (pf_pdev->domain == vf_pdev->domain) && (ctrl & PCI_SRIOV_CTRL_MSE) )
> +    {
> +        rc = vpci_modify_bars(vf_pdev, PCI_COMMAND_MEMORY, false);
> +        if ( rc )
> +            return rc;
> +
> +        vf_pdev->vpci->header.guest_cmd |= PCI_COMMAND_MEMORY;
> +    }
> +
> +    return rc;
> +}
> +
> +static int cf_check init_sriov(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> +
> +    if ( !pos )
> +        return 0;
> +
> +    if ( xsm_resource_setup_pci(XSM_PRIV, pdev->sbdf.bdf) )
> +    {
> +        printk(XENLOG_ERR
> +               "%pp: SR-IOV configuration unsupported for unpriv %pd\n",
> +               &pdev->sbdf, pdev->domain);
> +        return -EACCES;
> +    }
> +
> +    pdev->vpci->sriov = xzalloc(struct vpci_sriov);

Don't we prefer xvzalloc now? If so, changing this should be paired with a
corresponding XVFREE in the cleanup handler.

> +    if ( !pdev->vpci->sriov )
> +        return -ENOMEM;
> +
> +    /*
> +     * We need to modify vf_rlen in control_write but we can't do it cleanly
> +     * from pdev because write callback only accepts const pdev. Moving vf_rlen
> +     * inside of struct vpci_sriov is also not possible because it is used
> +     * before vpci init. So pass it here as additional data to not require
> +     * dropping const in control_write.
> +     */
> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, control_write,
> +                             pos + PCI_SRIOV_CTRL, 2, &pdev->physfn.vf_rlen);
> +}
> +
> +static int cf_check cleanup_sriov(const struct pci_dev *pdev, bool hide)
> +{
> +    unsigned int pos;
> +    int rc;
> +
> +    if ( !pdev->vpci->sriov )
> +        return 0;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +    ASSERT(list_empty(&pdev->vf_list));
> +
> +    if ( !hide )
> +    {
> +        XFREE(pdev->vpci->sriov);
> +        return 0;
> +    }
> +
> +    pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> +    rc = vpci_remove_registers(pdev->vpci, pos + PCI_SRIOV_CTRL, 2);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "%pd %pp: fail to remove SRIOV handlers rc=%d\n",
> +                pdev->domain, &pdev->sbdf, rc);
> +        ASSERT_UNREACHABLE();
> +        return rc;
> +    }
> +    XFREE(pdev->vpci->sriov);
> +
> +    /*
> +     * Unprivileged domains have a deny by default register access policy, no
> +     * need to add any further handlers for them.
> +     */
> +    if ( !is_hardware_domain(pdev->domain) )
> +        return 0;
> +
> +    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, NULL,
> +                           pos + PCI_SRIOV_CTRL, 2, NULL);
> +    if ( rc )
> +        printk(XENLOG_ERR "%pd %pp: fail to add SRIOV ctrl handler rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);
> +
> +    return rc;
> +}
> +
> +REGISTER_VPCI_EXTCAP(SRIOV, init_sriov, cleanup_sriov);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index e34f7abe6d..fc8a943abe 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -84,7 +84,6 @@ struct vpci {
>           * upon to know whether BARs are mapped into the guest p2m.
>           */
>          bool bars_mapped      : 1;
> -        /* FIXME: currently there's no support for SR-IOV. */
>      } header;
>  
>      /* MSI data. */
> @@ -145,6 +144,12 @@ struct vpci {
>          unsigned int nbars:3;
>      } rebar;
>  
> +    struct vpci_sriov {
> +        /* PF only */
> +        struct vpci_bar vf_bars[PCI_SRIOV_NUM_BARS];
> +        uint16_t num_vfs;
> +    } *sriov;
> +
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>      /* Guest SBDF of the device. */
>  #define INVALID_GUEST_SBDF ((pci_sbdf_t){ .sbdf = ~0U })


