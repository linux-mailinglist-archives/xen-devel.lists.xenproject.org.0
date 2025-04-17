Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E83A91D1F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 15:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957693.1350754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Ord-0007kI-91; Thu, 17 Apr 2025 13:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957693.1350754; Thu, 17 Apr 2025 13:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Ord-0007hX-52; Thu, 17 Apr 2025 13:01:09 +0000
Received: by outflank-mailman (input) for mailman id 957693;
 Thu, 17 Apr 2025 13:01:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5Orb-0007hR-6l
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 13:01:07 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f403:2406::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04fd7a64-1b8c-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 15:01:05 +0200 (CEST)
Received: from BL1PR13CA0352.namprd13.prod.outlook.com (2603:10b6:208:2c6::27)
 by PH7PR12MB9203.namprd12.prod.outlook.com (2603:10b6:510:2f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 13:00:58 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:2c6:cafe::6f) by BL1PR13CA0352.outlook.office365.com
 (2603:10b6:208:2c6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 13:00:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Thu, 17 Apr 2025 13:00:57 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 08:00:55 -0500
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
X-Inumbo-ID: 04fd7a64-1b8c-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJwHJTRutwRwboa7I0EHCg9bZaEk+PSP8WWUse1gWcDCfug7pql/ZlO4JHbe0ouNGHGIFfDLaWRu41udz9Rzr+maEtPmlr8Gh4ONOObNAGgGrMu/HTvT3916ctHId3varO1QMI7VMhhPV6fSQevc0pJpG4d9a06FN/EdjCXezlsjoiQUI8qN6z0sg6bDsZ37e9yQCfOCDndjnX0+DYlEFCMMQthUzghluc226dgSluBcnsnm1cI3yFBz+ZYDgwyUditfDATkhHff9mLVDahsQIDr7NorKvgIohdxpK3sc9KRTorShKtDsh5lr/PVKyz/55lMopigMcOvOya6RnD7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Crf3pxy2usI2F5z3TBbHoZOroFJKskXGiBfs0101reY=;
 b=BcYgAv9QS5eeAV1FnZX83tQvdPcUVCLPSgVyd9C4L3lkTdggtLoJIATblEE+LfdAO861p2DgKRIxITXr2aHm73SUyWByjOwMXqt8WhgJypWyTSppTpxI0U6mp8pLCcrV7bPjecbuQarQBUDljnjxw/eV/ffbEf7zfw1jkyyCx+8mnflRMaMf+la/PO8Y/TQoU5dtxZ73vw5FFOUqSp9082rKrUloWhy/Tf1bAypxUunP34/61nAuF3+TR3hqDsVhh2xg8iZQI2MCCMRpif+eIbZI34R73L+gCWOfM825hgxk5ivRHIf3VC7Bp99fcWUS8RidcZJo85QY1V1X+4l3fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Crf3pxy2usI2F5z3TBbHoZOroFJKskXGiBfs0101reY=;
 b=YUpdF3IPuTxbiupAdjOxDxDkEBEtwXeLbUTpmQRoKfumlwfSL8g+EdndHdRYvHgzzWD0b9zOpFzL+5xmlrTvwyf0T5ABolQIUE7E4Zjp+1S8Vv2aGoENCjMW66m+jw2CT0vKJYO9aRR5H3RiQwvQXYwK9WYX+0RMKmFc1zfnT/I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Apr 2025 14:00:54 +0100
Message-ID: <D98XLQ2KCBXH.VTDV58F7F34A@amd.com>
Subject: Re: [PATCH v4 00/13] Hyperlaunch device tree for dom0
From: Alejandro Vallejo <agarciav@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
In-Reply-To: <20250417124844.11143-1-agarciav@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|PH7PR12MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: 0743d193-6a39-43de-f4ac-08dd7dafe522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2FhWG5WeHJ5STQzMGJvK1hra09YTll5dDRQLzlneGFveGRtVDhzWkxoZWFm?=
 =?utf-8?B?ZVE2MFJMTzdYd1ZlbFo0a1BsdU4vT090VXhsMHRtekU0TjZJcDljRFNMazJI?=
 =?utf-8?B?d29Wb1JUd1BqMHNEZ0phaXBma09qYzlKUVlIUXZhYW0rK05WbUZpVjBuT0dO?=
 =?utf-8?B?ampleHQzMnZFc1ErNlh5RzhwR2FLcURybnY5eXg5THlxQnlVc1RJSVBpZmVQ?=
 =?utf-8?B?N1NCN2ExMXNSMVFpbXpxelZobGo3V2p0YXhncVRPTW1RYmQ5R3p2bm1qbnI5?=
 =?utf-8?B?TTlORElXNHI0V3EvVEpFa3ZrSWdIRWorWnpYbkY5SlV2b3QxMWFGMUZFMWgz?=
 =?utf-8?B?ek1VZWsycnd1aXRpNCtuY1VLOVd2MkYxWWMraStraGMrR1BQUzE2TWovQ2tS?=
 =?utf-8?B?U1NxZEZ1eEdNcHZIME5uMUlQd2l6bkNYSlhaTkFVTCtvS3Z1NWErTWcxenE3?=
 =?utf-8?B?Qkx2L3l5L3FVWW1LSHNPZTdSRE5pRVdwaXF4QTdxWEhMaVJ6c2dwR2IzK3Uw?=
 =?utf-8?B?L1lGQ0Urc2ZhQmxQdUtMWlNtU0paT0FwRUY1QmtxbjVuSUpISlIyWGxRK0NY?=
 =?utf-8?B?N1BoNExXd0NNVy81UGowMFNZZENRc3FoaXBnNTlLL2dUZmtsYTJtQjRRR1Fk?=
 =?utf-8?B?WVA5ZS9BWG5iTUwrbjA3dUdUeWhaSTZPd3BoNGdQKzFsbzg3QmVSaUFBbnBr?=
 =?utf-8?B?SHBWdmlxWGExTWVRSTVPeWRBeWQyTCtEelR5alBDUEZHSC9HalA1RjRWN0hL?=
 =?utf-8?B?WjZYZlZjSjFveDM1RGJLMW1kN25raHZhNG1uMUp1cU9ha1FOa3hnS1VLRllF?=
 =?utf-8?B?WWpOaFpwd213dkNkQWM0WXJVZm0vSWFDb2ZtODFscysvTGFhOTdzUEpQdUFx?=
 =?utf-8?B?blE5Z1RZNWdJbzRaK0J3cmxleEF5czFINkhHUUdoVTUvSWh5QmtDdHFNR1pF?=
 =?utf-8?B?a1BJVnNibGhRR0ExT1J2OTlVT0NpSXBITWRscDRPeHJ5bm9Gc082TFVJMk5i?=
 =?utf-8?B?U00wdSs1YTQ3RzRMcVRJRW0wSUMvejg2emhVSVl2RWgvRUVpZFd5OXBQZzl2?=
 =?utf-8?B?dEF3R2VLQ29RQXZRWUxseHNySTNXcGlqditncDh4aWo3dVF3dmI4QXhxbms0?=
 =?utf-8?B?UmdTb29IdXZJTFJjRnpBam41ZWpDT0lxSWFmemtsU2F4UkpETk9QcUtESUV1?=
 =?utf-8?B?WHlaYzlFL3JJRmVQOUp2V3dramN2Z1l3M1hMVit3RTJkNkJhT1AzY044d1c2?=
 =?utf-8?B?bGg4cnFzSmlvTUk5OWd4YnE2WXRNaGl0c0FPZzJUdXo1cTZRNWt3RGRXM3Fk?=
 =?utf-8?B?ZHM3c2F6MmhsdDlLS3dRR05pbUFHbWxrT2gvelRxVlVpNGJuVDlYdWlJMDVB?=
 =?utf-8?B?bE52cDc3eGxBRjdKMnpxelU2YTN5T2o3ZWRoMkF5R0hCYW9acWE2Zy9NNWtV?=
 =?utf-8?B?SjJ6ZDBCYVU3ZVExTXVhWWFZSnA5UXlmMlUrNDI0a0hkYzhBNFlKd2RtVktV?=
 =?utf-8?B?bzB0TEt6b29FdERVdmZvZEh5aEhrWDU2VURVUkxQa1cwaXJabHI4YW5Pck9D?=
 =?utf-8?B?cGwyeGRLeTZpUjF0S3FpbElxVHliZmdpaW0rUHd1L0NHdlB6Y296UFJBWVVp?=
 =?utf-8?B?MzBEV2ZjY2p5M0pSYmlYckpEZExCTUJGNUlrQ2NueWVNNGxOankxdWQvMStx?=
 =?utf-8?B?bnV0TGFsclYwUmFYMzV0QTlHa2NiMUlUNVNNMkZ1cG5XRFFBend6Y0hNZUdP?=
 =?utf-8?B?VERvbytKNnFzbUdhUEptVTZrdm85d3lKZU9FYkZQQTl1U3h5ZlYzSkNkcXhZ?=
 =?utf-8?B?VTlBY0ZuRWhuUE5PMzhvUkxHaFFobTE1dTVQcXU2dGFxRFExWU8wVnFSdDlo?=
 =?utf-8?B?NjFpcWg0aGRFVkJDbWgyelRYcytMbm1Wb2tXM0ZaUW5hck1wZWVIMmtYZVl5?=
 =?utf-8?B?UGhTaVNpWXhreWhWNFVMZ3VtNjdDcGFCbDlyMjhwY0Eyd3pwbWM5T1lRQVBY?=
 =?utf-8?Q?uKtI1nxBiLSDuJ/7QjJNYuGb/+4SJM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:00:57.3067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0743d193-6a39-43de-f4ac-08dd7dafe522
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9203

On Thu Apr 17, 2025 at 1:48 PM BST, Alejandro Vallejo wrote:
> Hi,
>
> Here's a new version. Took a while to integrate all the feedback, but
> here it is.
>
> v4 pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipeli=
nes/1772300721
>
> v3: https://lore.kernel.org/xen-devel/20250408160802.49870-1-agarciav@amd=
.com/
> v2: https://lore.kernel.org/xen-devel/20241226165740.29812-1-dpsmith@aper=
tussolutions.com/
> v1: https://lore.kernel.org/xen-devel/20241123182044.30687-1-dpsmith@aper=
tussolutions.com/
>
> Cheers,
> Alejandro
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D Original cover letter:
>
> The Hyperlaunch device tree for dom0 series is the second split out for t=
he
> introduction of the Hyperlaunch domain builder logic. These changes focus=
 on
> introducing the ability to express a domain configuration that is then us=
ed to
> populate the struct boot_domain structure for dom0. This ability to expre=
ss a
> domain configuration provides the next step towards a general domain buil=
der.
>
> The splitting of Hyperlaunch into a set of series are twofold, to reduce =
the
> effort in reviewing a much larger series, and to reduce the effort in han=
dling
> the knock-on effects to the construction logic from requested review chan=
ges.
>
> Alejandro Vallejo (1):
>   x86/hyperlaunch: Add helpers to locate multiboot modules
>
> Daniel P. Smith (12):
>   x86/boot: add cmdline to struct boot_domain
>   kconfig: introduce domain builder config options
>   common/hyperlaunch: introduce the domain builder
>   x86/hyperlaunch: initial support for hyperlaunch device tree
>   x86/hyperlaunch: locate dom0 kernel with hyperlaunch
>   x86/hyperlaunch: obtain cmdline from device tree
>   x86/hyperlaunch: locate dom0 initrd with hyperlaunch
>   x86/hyperlaunch: add domain id parsing to domain config
>   x86/hyperlaunch: specify dom0 mode with device tree
>   x86/hyperlaunch: add memory parsing to domain config
>   x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
>   x86/hyperlaunch: add capabilities to boot domain
>
>  xen/arch/x86/Kconfig                   |   1 +
>  xen/arch/x86/dom0_build.c              |  11 +
>  xen/arch/x86/hvm/dom0_build.c          |  31 +-
>  xen/arch/x86/include/asm/boot-domain.h |  17 +
>  xen/arch/x86/include/asm/bootinfo.h    |  10 +-
>  xen/arch/x86/pv/dom0_build.c           |   4 +-
>  xen/arch/x86/setup.c                   |  91 +++--
>  xen/common/Kconfig                     |   5 +
>  xen/common/Makefile                    |   1 +
>  xen/common/domain-builder/Kconfig      |  18 +
>  xen/common/domain-builder/Makefile     |   2 +
>  xen/common/domain-builder/core.c       | 110 ++++++
>  xen/common/domain-builder/fdt.c        | 488 +++++++++++++++++++++++++
>  xen/common/domain-builder/fdt.h        |  39 ++
>  xen/include/xen/domain-builder.h       |  13 +
>  xen/include/xen/libfdt/libfdt-xen.h    |  44 +++
>  16 files changed, 839 insertions(+), 46 deletions(-)
>  create mode 100644 xen/common/domain-builder/Kconfig
>  create mode 100644 xen/common/domain-builder/Makefile
>  create mode 100644 xen/common/domain-builder/core.c
>  create mode 100644 xen/common/domain-builder/fdt.c
>  create mode 100644 xen/common/domain-builder/fdt.h
>  create mode 100644 xen/include/xen/domain-builder.h

Bah, I just noticed after sending. The commit messages of the last 10
patches are meant to be common/hyperlaunch. Or just hyperlaunch.

It _is_ effectively still x86-only, but it's living under common.

Cheers,
Alejandro

