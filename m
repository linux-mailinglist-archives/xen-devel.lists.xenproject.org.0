Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F24BBE32F
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 15:41:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138204.1473964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5lSH-00050n-Uo; Mon, 06 Oct 2025 13:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138204.1473964; Mon, 06 Oct 2025 13:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5lSH-0004z3-Ru; Mon, 06 Oct 2025 13:40:45 +0000
Received: by outflank-mailman (input) for mailman id 1138204;
 Mon, 06 Oct 2025 13:40:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hel7=4P=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v5lSG-0004yx-Do
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 13:40:44 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cdbff30-a2ba-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 15:40:42 +0200 (CEST)
Received: from SJ0PR03CA0154.namprd03.prod.outlook.com (2603:10b6:a03:338::9)
 by BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Mon, 6 Oct
 2025 13:40:32 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::de) by SJ0PR03CA0154.outlook.office365.com
 (2603:10b6:a03:338::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 13:40:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 13:40:31 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 06:40:30 -0700
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
X-Inumbo-ID: 0cdbff30-a2ba-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flKvJk+iP2XYbel/OYoxMkBzhhZk6r1JOdOOxJgQZHjKBIV8//84wJkODNilIKmFdOk5d2TzfoUiD+bEdxKcDUr7sUylhkYnwp1Xww781OTfIwf1eFQWk61Oemhr4dbPb9aHwEfWLN4hyGKUDX7O2YJ7k4PRoesVaTP7GNSXmRGJdc8gS9wq3n4Id8ivrkwtGh/WOGcoVVF/5FNp4YWf84ATlwgjR6GkuW7IzS07SsmKkUPhJT46l/Gbj9DHzIv0gmxPgc19QudUeMOenLDngsBhbhrFECB8r+xASCwZepLiQTgpT8/B4GsR8vXseDBoVYEGHMJs/+d4GyqvVZFLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WH4wumm8VOAqyXhODEDDbRFRTTUPS1bG1vk/VfEPiTU=;
 b=PQ2kgEwmaf1BNP0ZfmexQO3J3Yl5H+PXJbu074t/oLS+W55xC8tppCbpE2BHG8imJoCMvTgNFeRTkkXmo7ERkegplxgqPlRkP5blpbUl0uq9a5Qo/6r2SIh5/NqdjkevY40H/SkM3VCzLpmFvVY3hvbO2k8baNSnmaKRa2v0DuRhcT4fDFqxvajD5R6k7J9QRPEUrKpNo/a7e/Y4X/rsR8bBhYxNLsvioohYg52MWsXTTKc+tJ9at7qt/nUKdzSSBWCjcnsddN5oR/cJjvApna/KsVpUjHEOEBUqVrh37zo/gLXwb2rqFQhg0U5CrcJKCcAMhLVsGSSkkHFklb/PYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WH4wumm8VOAqyXhODEDDbRFRTTUPS1bG1vk/VfEPiTU=;
 b=jkHN16NiOFDojlvzp6g7eJnx9OmxBao9xJYgY1sm4BlIaWjiNE8Ho04CB5BPSS8XMWEePoKLD+fahqaxMbVEs7oPRUuPo5hH7CZk/++di+Zp7sMsUVvfSXgEn/EVeZ2UcX8V74jyYPU5hDhn4z+ih+0MJl0fh0C0yDmcBP9d+Os=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 6 Oct 2025 15:40:28 +0200
Message-ID: <DDBA5Q0Y4TRG.312ER64SBMO4Z@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [XTF PATCH v3 2/3] x86: Allow exiting QEMU in TCG/QEMU
X-Mailer: aerc 0.20.1
References: <20251006102743.3907-1-alejandro.garciavallejo@amd.com>
 <20251006102743.3907-3-alejandro.garciavallejo@amd.com>
In-Reply-To: <20251006102743.3907-3-alejandro.garciavallejo@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|BL1PR12MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc6ec06-ef6c-4016-3d9a-08de04ddeb3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1BITjhrQlFHOW81UXFZMU44RXYzZjc5aktLRnR5TmRNRnU3VG54RUVIb3BJ?=
 =?utf-8?B?MDhSVzQrdWFnQjdlNCs5WndQRzgzb1FnRVlPOFFTTENOLzQ2cE94cEFqeWh4?=
 =?utf-8?B?VUsxRGE3RnE2TFQxQm1jQjhnQUxtd0c2ajZ1QWhZQzlIVjVFTFdIbjYrK2Vs?=
 =?utf-8?B?bGd1b3pWMlVnZXEvelh2MGl2c0dDSGZHR3MzeFBVTldlY0gvbUszdmVwUERZ?=
 =?utf-8?B?c0NUbWh5TnlYYzgvU3BBNnhrSVI0T3lCdHJhOXVqRUtubFJyRlZDZjZWQkMv?=
 =?utf-8?B?SDRiRXA2aHkyL1E0SzV5bThDYlVtVFUvVytMQXZORWVkL2N0RnUzVHZBM0gx?=
 =?utf-8?B?dXYrUlZ0ZGdyS1lTakR5blZEVk9nbXcwR3ZXejlxdnB0aGRoT0tjdFVQZ0dm?=
 =?utf-8?B?OXQyaTM1amhzZmRVNXJYZ0RxZ080cHdvVWJydjd3bzd6MHo2dXZRdUw1MDZG?=
 =?utf-8?B?dmtxOGlUbVdwTUo0YTQ1TWRVampxWTZMM3c5dXV1UzluSytmc3BNTGNoTldC?=
 =?utf-8?B?SW5Kc1dHd2lTSWowYmtWWHFQVXloUGJwenlqK2IwQUZnUFIrOXlZcy8xa2Ez?=
 =?utf-8?B?eHRPQjdFdnREYkpEVFF4WUZyY2x5VEowVzJBZWN6QkM1OGUwZXMwMTNXd3Nv?=
 =?utf-8?B?NmVNM21wQnJYUlJLa0tQOGVOcVVuVDBUajZlZEpiNWhZNTl4TlFXZWtGVldI?=
 =?utf-8?B?V3VTWitoUVkwQ083TmlLWGxJVmNtZDhZemFoK0hwRHJtRHRLZ29qdkM0Risw?=
 =?utf-8?B?aGJicGh3NVhpMDluZlErK0xlT3pEeXRUbjIrRFFGY0RTUmlHci9tUEh4L0pP?=
 =?utf-8?B?SGdhTVNpUDdqRlRGQ25TaWRQbzNDM3BQTU4vTXZka1ZsendvMUZQeXVHUHg1?=
 =?utf-8?B?NUpGbWJkenVLSitPUWhPMTNCVHJONGpDWjV2LzBwS0FDRURiOG05WWErVUFz?=
 =?utf-8?B?M2QwUmc2NnE1dU8xVzJhV05CZ2ZLUEJBWTM5Q3J5eFNKRUhqeWFvL3UwdHdR?=
 =?utf-8?B?WmRSNEU5R01Bd0lKOEhtbExodyt5cnBvbTM2VUNvUDZvQ3VaaFYrQmp0L1l0?=
 =?utf-8?B?UTZiZ0t4RCtwMVdQUkdTT3B2Nll4NWMrOU1YbSswS2VWYS9KUnVJSTdxZC8y?=
 =?utf-8?B?bFlMMUhTQUdNcEcxVHkrL2RsZUdOTzVpMkVxbHo3Uy8ydmRNemNjTHRZVklh?=
 =?utf-8?B?Zk5KaUh0U2JLQVdLZElEakFYY2F2VFNUZlpkYWx1Y0pTM1A3MmhVRm9KTHVr?=
 =?utf-8?B?WFhla2dzNUY2ZHVGMGpDOGNsaHJDYjFNWk5ydWNDbUpSSnFMbm1VSjJNcFRo?=
 =?utf-8?B?dnFJQTJQRzFVeitPeUF2bnhtekU4MzlXRkVNdWFad2hGUnRiQTV4S1pxQ1JI?=
 =?utf-8?B?M0QwMUMxaHllWEF5M0RLSzk3WkhsK2p2VmQ1S0xFMmI0UGEyWFduNGRGYnpa?=
 =?utf-8?B?TktsTE11c0xsMFBEYjE3NXF6bXpvVkdjM0VpcXcxM2hhb0owclY4ZzdGWm01?=
 =?utf-8?B?bFdrVVB4WDBjWWpnQTNCaXdLSWNwby9mQmpQUnkzUGpWc01jOTVnaTNOVTVL?=
 =?utf-8?B?N3ZWcXpNalJZRVhSUGg0aG92U2d0SEJzSmhyd1ZNeG9Ha09XekIxVVdoTm5S?=
 =?utf-8?B?MlVtc081ckk2RnJJUzVWWGRRdG53by9WeHJoVWRJTXZFc1h4T2gzT21Sa3FQ?=
 =?utf-8?B?YnZTMkoyTE5HVVJQN0xqWGJOWC9GeG1JcHU0cHZsUWZOSXE5akpVTlV6bUxD?=
 =?utf-8?B?aGlINlIwMHlhU00xbFVZYTRteTBYSDFURUY0UTlybTZRS3BMbmNPY2xtbkhx?=
 =?utf-8?B?YlpFSmg0enkrTzMzMkxXTVFVM1YvK0ZmK1BmM0tBQ2MxZWlYSE9lc1R3V3RG?=
 =?utf-8?B?YjBzZnR3RFRTQXJsSG4wZXI4aDVkYkJ6TjRka0FvcUlLNnBhQkd4ZFZRUG1K?=
 =?utf-8?B?ZG9QOHFhWXdiNFF1R0EvYWhyNXJWY0NFbWZBWlR3NDVIUFJKR3gxUXhQZ1h5?=
 =?utf-8?B?b1dNNCtqU1ViMmJTNHpKMXpKMmpxSEFva1o4MWRxMkRDd2hES3Q0YWlqU0hM?=
 =?utf-8?B?eVR3TnFRUklBWW82QUxOUC9rMUJ3WFJlMEZ1NmU2QzdDb25pVDNqM1dYVkE2?=
 =?utf-8?Q?3gMw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:40:31.2589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc6ec06-ef6c-4016-3d9a-08de04ddeb3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5969

On Mon Oct 6, 2025 at 12:25 PM CEST, Alejandro Vallejo wrote:
> If QEMU has a debug isa-debug-exit device, we can simply write to it
> to exit rather than spinning after a failed hypercall.
>
> There's nothing to signal its existence, so it's a best-effort write
> after a shutdown attempt via hypercall.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> v3:
>   * Moved arch_shutdown() from HVM/PV folders to arch/x86/traps.c
>     There's nothing terribly specific about it.
>   * Gated calling hypercall_shutdown() on cpu_has_xen being set
> ---
>  arch/x86/traps.c        | 15 +++++++++++++++
>  common/lib.c            |  2 +-
>  common/report.c         |  8 +++++---
>  include/xtf/framework.h |  3 +++
>  4 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/traps.c b/arch/x86/traps.c
> index 1f82752..b530719 100644
> --- a/arch/x86/traps.c
> +++ b/arch/x86/traps.c
> @@ -80,6 +80,21 @@ void __weak do_evtchn(struct cpu_regs *regs)
>      panic("Unhandled evtchn upcall\n");
>  }

Bah. Missing "#include <xtf/hypercall.h>"

Otherwise works as intended.

Cheers,
Alejandro

