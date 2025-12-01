Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA420C980FB
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 16:34:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175817.1500432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ5un-0005c5-1e; Mon, 01 Dec 2025 15:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175817.1500432; Mon, 01 Dec 2025 15:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ5um-0005Zm-V2; Mon, 01 Dec 2025 15:34:12 +0000
Received: by outflank-mailman (input) for mailman id 1175817;
 Mon, 01 Dec 2025 15:34:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSEW=6H=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vQ5ul-0005Zb-7J
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 15:34:11 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cb11e9d-cecb-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 16:34:08 +0100 (CET)
Received: from BY5PR16CA0030.namprd16.prod.outlook.com (2603:10b6:a03:1a0::43)
 by PH8PR12MB6795.namprd12.prod.outlook.com (2603:10b6:510:1c6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:33:57 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::d4) by BY5PR16CA0030.outlook.office365.com
 (2603:10b6:a03:1a0::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 15:33:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 15:33:57 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 09:33:35 -0600
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
X-Inumbo-ID: 2cb11e9d-cecb-11f0-9d19-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGUb7wYJCupUaogX6ehOPMDYc3792cyI9wwgYljL1cLsK8CAaAB/QeBXaXR81DRbI6D0gbl9bHOm9bp1xUXH1m7KraRBP5x7gM2FTxaoWOnlOjwqCvjLvgzEW+4tgOmerDDfJ9aWVe7NNQDweQH2XifXEJU7cSIATDLt6o8P91LVr96Lvlk9CQAzKJWUb4IFRhK/T80PWdGhQGbNz+8H3aWbM2tIyVlCOPcrBgGqHJtikiXqbtZJJ5unnayxXBn1wjVTkYEMdoyn8Ac9vsS3Q44phKQxWaXWN7EKBbDb5xTALbBqLrfUh1mZ5iaNTiRD/AbSzzkf6xvoK91gHVSVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgjZe9wQQsYzCqmXtBpweMGHnOj6z7vqE8VdzpVNkAA=;
 b=bxqJQfHZsXd7vk+O3GPDce4o0nexhSGsIG9jsiJP0W9vj2rZ0pReC/mU6+a6Lap9mWwXPIYdHvQ/pGYlCZcY8T08eNtgWVrAGU3jJ6QdeZ3ZwpHa6frAwpNQoJYwU8GZbB8vdx0Vdwja2v/DUaTT/enhXZK5qBS2A4G0naI4JdSb46ezwOsgDOhnaV+nBXf+rI5MyTDg7Uor+Perfs8CWAlVZ1916F24faaXsL7qSMJz4RNf903QFR8K898F/F5sXckdKOLWWEp46dppLdhgn3XEn96YxFjhYGWpoK37XnTvCNL8dPUAJvsRh8LkHXkPAYUkXrrte5m/7a5eB8m4ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgjZe9wQQsYzCqmXtBpweMGHnOj6z7vqE8VdzpVNkAA=;
 b=ed2jU5GzQ/HY+R7R6c7uLqApo8ByamIjC/PDgbKzJABDt5rTOewpLFMz5Q9tr2WLkAjrrWNqDZOzigW2WTL7DjS24CneuHJharxFg40wny4Wuw6FPcbdt4JW7EI3veUecgc8R8QD8h59jiC3UpP0oKSNlxsFKwWHckyJZi7/HCY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 1 Dec 2025 16:33:33 +0100
Message-ID: <DEMZMSXSLKT1.1MWK08XUVJTJ2@amd.com>
CC: Jan Beulich <JBeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/svm: Drop svmdebug.c
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
 <20251128201937.1294742-3-andrew.cooper3@citrix.com>
In-Reply-To: <20251128201937.1294742-3-andrew.cooper3@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|PH8PR12MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d35ec3-5323-4bbc-5e48-08de30ef0b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SytiWkZ1ZjVYdmxDWnNYSEJqRGNEYjRDbTg0dmhFRlRhL3RqVjNwY0dSOFMr?=
 =?utf-8?B?OFJqZWxkb2EybDRFNmltSkJXNVBXajZiRnlRdnpmMVN5TzNYVW52L1FFYnNX?=
 =?utf-8?B?S3I2TkFCWGE0Q2cwVEhRZmdqbFJnTHl3elJuWGdrOWFYb2dZMkJLV1FZejMx?=
 =?utf-8?B?empnQXhlcmROVHduMDdOTU5LL09PVUJMK1hvVEFHNHhIWHlNcHlpVDB2clFK?=
 =?utf-8?B?bElETDVCRllWMnlrN2lNNXhleHNNZmNWdzB3a1FrOWo3R2JNVzNQTTN0WHVU?=
 =?utf-8?B?aGs2UWFsVWJoRkN2c0dsVHZ5alphNWV3OStIMVF3aVJuUkcwRWR4MUJueC9x?=
 =?utf-8?B?WCsyU1JqV0lvUytKRm9nVU94dkJjZ28rZXR4R1p2aVg1WSt6WE9IV3djQy9u?=
 =?utf-8?B?WG9oYzhYVklGdTZaRTJsR1cvSWZ0TGNrVUd3WmVrWGRNbDFMcmZ1eW5rUGhR?=
 =?utf-8?B?c0pKK1lRUy9rRUhtQ3pSK1BsSkhRVS9pVFZ2N01HNGFhRkpzSDYyUGpLamp5?=
 =?utf-8?B?RDF2NFJFM2pGZFovOUhnVVFibDdlbmpsZTM2UzFxOHBKeGEzZEcwUWhqOWRW?=
 =?utf-8?B?alljcW1GNU95OTFNUkVDZ3NCZTJMZ3BxY1VFVTBQc29EbjVBUHRFTjZrSlhh?=
 =?utf-8?B?SEFBSkJPbkFodEVRNytFTXRaeGFnREF4WWl0cFo4eHZDd1NLK0dvbjZab0N3?=
 =?utf-8?B?TSt2YVIwTitPZjFnQXpXYndNVXFHN0ZjT3VEV2xwK21uYnVRUlJjSkRzb2xx?=
 =?utf-8?B?MEVEZVdtb1pWTGpDSnZQc3lqckxVZVN1N2tsbU9lKysrV3Z4SGwySkFvSTMz?=
 =?utf-8?B?bmh1K1VCOHhtNnlMM0FiSko0QTZ4dHNsSU81eG1BY1ZXRytqNERSYmJXUTVY?=
 =?utf-8?B?b3M4S3FLaEZUQmxzZEdRd1lvNkVXU3M3RVkrejlFMTZoRW9WYllrdjltdkxE?=
 =?utf-8?B?a29HS1hCYUwzaktTREZtUS96VXh6TmhzSmlWQkJmc3hRWWVEaEpvalQvdSsw?=
 =?utf-8?B?UGRXb2lzMEszTGhLVDZBOUhiVkZxblk3Ty8yNnhUd1FOa01yLyt3UHdSYWhX?=
 =?utf-8?B?dlFTdHZISnJyZnlvdXU0V3hXOVhQNTVqQ2hFZk94UnY2YXhXeEZMQTZkeHoz?=
 =?utf-8?B?ZDNlblFhcTJWVG1qU1JmbFNWWjN3NTdtelVhTnZTTkZzUzBXY0JWaWxSMktl?=
 =?utf-8?B?TGEzVUkxVENvVyttbGROd1phSHlIempOMERTZmlHYWNSd215YWx1b0k3dU5V?=
 =?utf-8?B?YUVBVDFjWEk2ZHVpZHVlZnAvWnVPYkUwOEdNR0tyTEZ5cWFKVmNCWllrbm5v?=
 =?utf-8?B?VWpJcEpNcW5LNHMrYnBnVTNEbjkzVzNhOFJjOHA4bVEyUnhSZlEwMjFFVWEz?=
 =?utf-8?B?TWl2d3RlOURMTlpONUxzSzRhSWYvRXFOQzhQOGdYSlpjZWV2UlNvRWFHcGF0?=
 =?utf-8?B?V1Z1U3hBeTRaR2t0UzJrVC9Vei9Tc01RY1FwbGJEUzUyNHIwYnZ2Qko2d2Js?=
 =?utf-8?B?M0VaUDVmNmNLN1lzSFVsRkVGTnZlR2xEMmcxMnRCU1BUeUxkMC9FTVBhakc3?=
 =?utf-8?B?bGtMVjhFZUw1RCtEc01XSXE2QXRBY2twTis4YVhJVlcxRllubllMSDRJMzVv?=
 =?utf-8?B?RmpjV2I1UlNwSEt5TnpRcWprSGIyS0svVXZNVnhxQytRTENtTnBZa2Jpb0ZR?=
 =?utf-8?B?ak1IL1VVMnJVRk1QSnpWS2hMcGk3S1YvNWdST1pSV3dSdWpXRVBiUjFKVUNa?=
 =?utf-8?B?cE85QWM4Z0xJbFQwaDZvUFFZYU1kUG5yUW1GMndqZndlUGNNZng5MmhGRmFG?=
 =?utf-8?B?OUwwbEZCOTA3c3p5MFZkdktRaTlFNWl6YmJDM2ZDd3VoS0FtcDFzNGlsaDVE?=
 =?utf-8?B?b3MzRUl1RklvcUx4ZFFVYTlPWkp0QkJhRkVDUWg2U1JPM0NWWDNNTm1VbHd5?=
 =?utf-8?B?NmlLRlRVczBKdlBSZXJnYlJtNUZmTXl2OWFrQm4yN0JoQjN1d3JScGNLQW9W?=
 =?utf-8?B?OEkveWVBUUxvdG4rdDVzdno5aHVESGtaa09SMGpYeGF2bCt5Z0FhZlMxOHhG?=
 =?utf-8?B?a1JrN0dzYnBRa0MrSjFPbHhBTDl2aGlWUDBXVGpoczU0aDNsSHJpUWhncDBP?=
 =?utf-8?Q?4txg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 15:33:57.5944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d35ec3-5323-4bbc-5e48-08de30ef0b40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6795

Hi,

On Fri Nov 28, 2025 at 9:19 PM CET, Andrew Cooper wrote:
> Everything here is really VMCB functionality, so merge it into vmcb.c.  M=
ove
> the declarations from the global svmdebug.h to the logical vmcb.h.
>
> No functional change.

Not functional, but there's a single instance of style adjustment on move..=
.

>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/Makefile               |   1 -
>  xen/arch/x86/hvm/svm/nestedsvm.c            |   1 -
>  xen/arch/x86/hvm/svm/svmdebug.c             | 181 --------------------
>  xen/arch/x86/hvm/svm/vmcb.c                 | 159 +++++++++++++++++
>  xen/arch/x86/hvm/svm/vmcb.h                 |   3 +
>  xen/arch/x86/include/asm/hvm/svm/svmdebug.h |   3 -
>  6 files changed, 162 insertions(+), 186 deletions(-)
>  delete mode 100644 xen/arch/x86/hvm/svm/svmdebug.c
>
> diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefil=
e
> index 760d2954da83..8a072cafd572 100644
> --- a/xen/arch/x86/hvm/svm/Makefile
> +++ b/xen/arch/x86/hvm/svm/Makefile
> @@ -4,5 +4,4 @@ obj-bin-y +=3D entry.o
>  obj-y +=3D intr.o
>  obj-y +=3D nestedsvm.o
>  obj-y +=3D svm.o
> -obj-y +=3D svmdebug.o
>  obj-y +=3D vmcb.o
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nest=
edsvm.c
> index 191466755148..63ed6c86b775 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -9,7 +9,6 @@
>  #include <asm/hvm/svm/svm.h>
>  #include <asm/hvm/svm/vmcb.h>
>  #include <asm/hvm/nestedhvm.h>
> -#include <asm/hvm/svm/svmdebug.h>
>  #include <asm/paging.h> /* paging_mode_hap */
>  #include <asm/event.h> /* for local_event_delivery_(en|dis)able */
>  #include <asm/p2m.h> /* p2m_get_pagetable, p2m_get_nestedp2m */
> diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmde=
bug.c
> deleted file mode 100644
> index bdb9ea3583ee..000000000000
> --- a/xen/arch/x86/hvm/svm/svmdebug.c
> +++ /dev/null
> @@ -1,181 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * svmdebug.c: debug functions
> - * Copyright (c) 2011, Advanced Micro Devices, Inc.
> - *
> - */
> -
> -#include <xen/sched.h>
> -#include <asm/processor.h>
> -#include <asm/msr-index.h>
> -#include <asm/hvm/svm/svmdebug.h>
> -
> -#include "vmcb.h"
> -
> -static void svm_dump_sel(const char *name, const struct segment_register=
 *s)
> -{
> -    printk("%s: %04x %04x %08x %016"PRIx64"\n",
> -           name, s->sel, s->attr, s->limit, s->base);
> -}
> -
> -void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
> -{
> -    struct vcpu *curr =3D current;
> -
> -    /*
> -     * If we are dumping the VMCB currently in context, some guest state=
 may
> -     * still be cached in hardware.  Retrieve it.
> -     */
> -    if ( vmcb =3D=3D curr->arch.hvm.svm.vmcb )
> -        svm_sync_vmcb(curr, vmcb_in_sync);
> -
> -    printk("Dumping guest's current state at %s...\n", from);
> -    printk("Size of VMCB =3D %zu, paddr =3D %"PRIpaddr", vaddr =3D %p\n"=
,
> -           sizeof(struct vmcb_struct), virt_to_maddr(vmcb), vmcb);
> -
> -    printk("cr_intercepts =3D %#x dr_intercepts =3D %#x "
> -           "exception_intercepts =3D %#x\n",
> -           vmcb_get_cr_intercepts(vmcb), vmcb_get_dr_intercepts(vmcb),
> -           vmcb_get_exception_intercepts(vmcb));
> -    printk("general1_intercepts =3D %#x general2_intercepts =3D %#x\n",
> -           vmcb_get_general1_intercepts(vmcb), vmcb_get_general2_interce=
pts(vmcb));
> -    printk("iopm_base_pa =3D %#"PRIx64" msrpm_base_pa =3D %#"PRIx64" tsc=
_offset =3D %#"PRIx64"\n",
> -           vmcb_get_iopm_base_pa(vmcb), vmcb_get_msrpm_base_pa(vmcb),
> -           vmcb_get_tsc_offset(vmcb));
> -    printk("tlb_control =3D %#x vintr =3D %#"PRIx64" int_stat =3D %#"PRI=
x64"\n",
> -           vmcb->tlb_control, vmcb_get_vintr(vmcb).bytes,
> -           vmcb->int_stat.raw);
> -    printk("event_inj %016"PRIx64", valid? %d, ec? %d, type %u, vector %=
#x\n",
> -           vmcb->event_inj.raw, vmcb->event_inj.v,
> -           vmcb->event_inj.ev, vmcb->event_inj.type,
> -           vmcb->event_inj.vector);
> -    printk("exitcode =3D %#"PRIx64" exit_int_info =3D %#"PRIx64"\n",
> -           vmcb->exitcode, vmcb->exit_int_info.raw);
> -    printk("exitinfo1 =3D %#"PRIx64" exitinfo2 =3D %#"PRIx64"\n",
> -           vmcb->exitinfo1, vmcb->exitinfo2);
> -    printk("asid =3D %#x np_ctrl =3D %#"PRIx64":%s%s%s\n",
> -           vmcb_get_asid(vmcb), vmcb_get_np_ctrl(vmcb),
> -           vmcb_get_np(vmcb)     ? " NP"     : "",
> -           vmcb_get_sev(vmcb)    ? " SEV"    : "",
> -           vmcb_get_sev_es(vmcb) ? " SEV_ES" : "");
> -    printk("virtual vmload/vmsave =3D %d, virt_ext =3D %#"PRIx64"\n",
> -           vmcb->virt_ext.fields.vloadsave_enable, vmcb->virt_ext.bytes)=
;
> -    printk("cpl =3D %d efer =3D %#"PRIx64" star =3D %#"PRIx64" lstar =3D=
 %#"PRIx64"\n",
> -           vmcb_get_cpl(vmcb), vmcb_get_efer(vmcb), vmcb->star, vmcb->ls=
tar);
> -    printk("CR0 =3D 0x%016"PRIx64" CR2 =3D 0x%016"PRIx64"\n",
> -           vmcb_get_cr0(vmcb), vmcb_get_cr2(vmcb));
> -    printk("CR3 =3D 0x%016"PRIx64" CR4 =3D 0x%016"PRIx64"\n",
> -           vmcb_get_cr3(vmcb), vmcb_get_cr4(vmcb));
> -    printk("RSP =3D 0x%016"PRIx64"  RIP =3D 0x%016"PRIx64"\n",
> -           vmcb->rsp, vmcb->rip);
> -    printk("RAX =3D 0x%016"PRIx64"  RFLAGS=3D0x%016"PRIx64"\n",
> -           vmcb->rax, vmcb->rflags);
> -    printk("DR6 =3D 0x%016"PRIx64", DR7 =3D 0x%016"PRIx64"\n",
> -           vmcb_get_dr6(vmcb), vmcb_get_dr7(vmcb));
> -    printk("CSTAR =3D 0x%016"PRIx64" SFMask =3D 0x%016"PRIx64"\n",
> -           vmcb->cstar, vmcb->sfmask);
> -    printk("KernGSBase =3D 0x%016"PRIx64" PAT =3D 0x%016"PRIx64"\n",
> -           vmcb->kerngsbase, vmcb_get_g_pat(vmcb));
> -    printk("SSP =3D 0x%016"PRIx64" S_CET =3D 0x%016"PRIx64" ISST =3D 0x%=
016"PRIx64"\n",
> -           vmcb->_ssp, vmcb->_msr_s_cet, vmcb->_msr_isst);
> -    printk("H_CR3 =3D 0x%016"PRIx64" CleanBits =3D %#x\n",
> -           vmcb_get_h_cr3(vmcb), vmcb->cleanbits.raw);
> -
> -    /* print out all the selectors */
> -    printk("       sel attr  limit   base\n");
> -    svm_dump_sel("  CS", &vmcb->cs);
> -    svm_dump_sel("  DS", &vmcb->ds);
> -    svm_dump_sel("  SS", &vmcb->ss);
> -    svm_dump_sel("  ES", &vmcb->es);
> -    svm_dump_sel("  FS", &vmcb->fs);
> -    svm_dump_sel("  GS", &vmcb->gs);
> -    svm_dump_sel("GDTR", &vmcb->gdtr);
> -    svm_dump_sel("LDTR", &vmcb->ldtr);
> -    svm_dump_sel("IDTR", &vmcb->idtr);
> -    svm_dump_sel("  TR", &vmcb->tr);
> -}
> -
> -bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
> -                      const struct vcpu *v, bool verbose)
> -{
> -    bool ret =3D false; /* ok */
> -    unsigned long cr0 =3D vmcb_get_cr0(vmcb);
> -    unsigned long cr3 =3D vmcb_get_cr3(vmcb);
> -    unsigned long cr4 =3D vmcb_get_cr4(vmcb);
> -    unsigned long valid;
> -    uint64_t efer =3D vmcb_get_efer(vmcb);
> -
> -#define PRINTF(fmt, args...) do { \
> -    if ( !verbose ) return true; \
> -    ret =3D true; \
> -    printk(XENLOG_GUEST "%pv[%s]: " fmt, v, from, ## args); \
> -} while (0)
> -
> -    if ( !(efer & EFER_SVME) )
> -        PRINTF("EFER: SVME bit not set (%#"PRIx64")\n", efer);
> -
> -    if ( !(cr0 & X86_CR0_CD) && (cr0 & X86_CR0_NW) )
> -        PRINTF("CR0: CD bit is zero and NW bit set (%#"PRIx64")\n", cr0)=
;
> -
> -    if ( cr0 >> 32 )
> -        PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
> -
> -    if ( (cr0 & X86_CR0_PG) &&
> -         ((cr3 & 7) ||
> -          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0))=
 ||
> -          ((efer & EFER_LMA) &&
> -           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
> -        PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
> -
> -    valid =3D hvm_cr4_guest_valid_bits(v->domain);
> -    if ( cr4 & ~valid )
> -        PRINTF("CR4: invalid value %#lx (valid %#lx, rejected %#lx)\n",
> -               cr4, valid, cr4 & ~valid);
> -
> -    if ( vmcb_get_dr6(vmcb) >> 32 )
> -        PRINTF("DR6: bits [63:32] are not zero (%#"PRIx64")\n",
> -               vmcb_get_dr6(vmcb));
> -
> -    if ( vmcb_get_dr7(vmcb) >> 32 )
> -        PRINTF("DR7: bits [63:32] are not zero (%#"PRIx64")\n",
> -               vmcb_get_dr7(vmcb));
> -
> -    if ( efer & ~EFER_KNOWN_MASK )
> -        PRINTF("EFER: unknown bits are not zero (%#"PRIx64")\n", efer);
> -
> -    if ( hvm_efer_valid(v, efer, -1) )
> -        PRINTF("EFER: %s (%"PRIx64")\n", hvm_efer_valid(v, efer, -1), ef=
er);
> -
> -    if ( (efer & EFER_LME) && (cr0 & X86_CR0_PG) )
> -    {
> -        if ( !(cr4 & X86_CR4_PAE) )
> -            PRINTF("EFER_LME and CR0.PG are both set and CR4.PAE is zero=
\n");
> -        if ( !(cr0 & X86_CR0_PE) )
> -            PRINTF("EFER_LME and CR0.PG are both set and CR0.PE is zero\=
n");
> -    }
> -
> -    if ( (efer & EFER_LME) && (cr0 & X86_CR0_PG) && (cr4 & X86_CR4_PAE) =
&&
> -         vmcb->cs.l && vmcb->cs.db )
> -        PRINTF("EFER_LME, CR0.PG, CR4.PAE, CS.L and CS.D are all non-zer=
o\n");
> -
> -    if ( !(vmcb_get_general2_intercepts(vmcb) & GENERAL2_INTERCEPT_VMRUN=
) )
> -        PRINTF("GENERAL2_INTERCEPT: VMRUN intercept bit is clear (%#"PRI=
x32")\n",
> -               vmcb_get_general2_intercepts(vmcb));
> -
> -    if ( vmcb->event_inj.resvd1 )
> -        PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
> -               vmcb->event_inj.raw);
> -
> -#undef PRINTF
> -    return ret;
> -}
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * tab-width: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index 44fa76bf0228..b1a79d515143 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -228,6 +228,165 @@ void svm_destroy_vmcb(struct vcpu *v)
>      svm->vmcb =3D NULL;
>  }
> =20
> +static void svm_dump_sel(const char *name, const struct segment_register=
 *s)
> +{
> +    printk("%s: %04x %04x %08x %016"PRIx64"\n",
> +           name, s->sel, s->attr, s->limit, s->base);
> +}
> +
> +void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
> +{
> +    struct vcpu *curr =3D current;
> +
> +    /*
> +     * If we are dumping the VMCB currently in context, some guest state=
 may
> +     * still be cached in hardware.  Retrieve it.
> +     */
> +    if ( vmcb =3D=3D curr->arch.hvm.svm.vmcb )
> +        svm_sync_vmcb(curr, vmcb_in_sync);
> +
> +    printk("Dumping guest's current state at %s...\n", from);
> +    printk("Size of VMCB =3D %zu, paddr =3D %"PRIpaddr", vaddr =3D %p\n"=
,
> +           sizeof(struct vmcb_struct), virt_to_maddr(vmcb), vmcb);
> +
> +    printk("cr_intercepts =3D %#x dr_intercepts =3D %#x "
> +           "exception_intercepts =3D %#x\n",
> +           vmcb_get_cr_intercepts(vmcb), vmcb_get_dr_intercepts(vmcb),
> +           vmcb_get_exception_intercepts(vmcb));
> +    printk("general1_intercepts =3D %#x general2_intercepts =3D %#x\n",
> +           vmcb_get_general1_intercepts(vmcb), vmcb_get_general2_interce=
pts(vmcb));
> +    printk("iopm_base_pa =3D %#"PRIx64" msrpm_base_pa =3D %#"PRIx64" tsc=
_offset =3D %#"PRIx64"\n",
> +           vmcb_get_iopm_base_pa(vmcb), vmcb_get_msrpm_base_pa(vmcb),
> +           vmcb_get_tsc_offset(vmcb));
> +    printk("tlb_control =3D %#x vintr =3D %#"PRIx64" int_stat =3D %#"PRI=
x64"\n",
> +           vmcb->tlb_control, vmcb_get_vintr(vmcb).bytes,
> +           vmcb->int_stat.raw);
> +    printk("event_inj %016"PRIx64", valid? %d, ec? %d, type %u, vector %=
#x\n",
> +           vmcb->event_inj.raw, vmcb->event_inj.v,
> +           vmcb->event_inj.ev, vmcb->event_inj.type,
> +           vmcb->event_inj.vector);
> +    printk("exitcode =3D %#"PRIx64" exit_int_info =3D %#"PRIx64"\n",
> +           vmcb->exitcode, vmcb->exit_int_info.raw);
> +    printk("exitinfo1 =3D %#"PRIx64" exitinfo2 =3D %#"PRIx64"\n",
> +           vmcb->exitinfo1, vmcb->exitinfo2);
> +    printk("asid =3D %#x np_ctrl =3D %#"PRIx64":%s%s%s\n",
> +           vmcb_get_asid(vmcb), vmcb_get_np_ctrl(vmcb),
> +           vmcb_get_np(vmcb)     ? " NP"     : "",
> +           vmcb_get_sev(vmcb)    ? " SEV"    : "",
> +           vmcb_get_sev_es(vmcb) ? " SEV_ES" : "");
> +    printk("virtual vmload/vmsave =3D %d, virt_ext =3D %#"PRIx64"\n",
> +           vmcb->virt_ext.fields.vloadsave_enable, vmcb->virt_ext.bytes)=
;
> +    printk("cpl =3D %d efer =3D %#"PRIx64" star =3D %#"PRIx64" lstar =3D=
 %#"PRIx64"\n",
> +           vmcb_get_cpl(vmcb), vmcb_get_efer(vmcb), vmcb->star, vmcb->ls=
tar);
> +    printk("CR0 =3D 0x%016"PRIx64" CR2 =3D 0x%016"PRIx64"\n",
> +           vmcb_get_cr0(vmcb), vmcb_get_cr2(vmcb));
> +    printk("CR3 =3D 0x%016"PRIx64" CR4 =3D 0x%016"PRIx64"\n",
> +           vmcb_get_cr3(vmcb), vmcb_get_cr4(vmcb));
> +    printk("RSP =3D 0x%016"PRIx64"  RIP =3D 0x%016"PRIx64"\n",
> +           vmcb->rsp, vmcb->rip);
> +    printk("RAX =3D 0x%016"PRIx64"  RFLAGS=3D0x%016"PRIx64"\n",
> +           vmcb->rax, vmcb->rflags);
> +    printk("DR6 =3D 0x%016"PRIx64", DR7 =3D 0x%016"PRIx64"\n",
> +           vmcb_get_dr6(vmcb), vmcb_get_dr7(vmcb));
> +    printk("CSTAR =3D 0x%016"PRIx64" SFMask =3D 0x%016"PRIx64"\n",
> +           vmcb->cstar, vmcb->sfmask);
> +    printk("KernGSBase =3D 0x%016"PRIx64" PAT =3D 0x%016"PRIx64"\n",
> +           vmcb->kerngsbase, vmcb_get_g_pat(vmcb));
> +    printk("SSP =3D 0x%016"PRIx64" S_CET =3D 0x%016"PRIx64" ISST =3D 0x%=
016"PRIx64"\n",
> +           vmcb->_ssp, vmcb->_msr_s_cet, vmcb->_msr_isst);
> +    printk("H_CR3 =3D 0x%016"PRIx64" CleanBits =3D %#x\n",
> +           vmcb_get_h_cr3(vmcb), vmcb->cleanbits.raw);
> +
> +    /* print out all the selectors */
> +    printk("       sel attr  limit   base\n");
> +    svm_dump_sel("  CS", &vmcb->cs);
> +    svm_dump_sel("  DS", &vmcb->ds);
> +    svm_dump_sel("  SS", &vmcb->ss);
> +    svm_dump_sel("  ES", &vmcb->es);
> +    svm_dump_sel("  FS", &vmcb->fs);
> +    svm_dump_sel("  GS", &vmcb->gs);
> +    svm_dump_sel("GDTR", &vmcb->gdtr);
> +    svm_dump_sel("LDTR", &vmcb->ldtr);
> +    svm_dump_sel("IDTR", &vmcb->idtr);
> +    svm_dump_sel("  TR", &vmcb->tr);
> +}
> +
> +bool svm_vmcb_isvalid(
> +    const char *from, const struct vmcb_struct *vmcb, const struct vcpu =
*v,
> +    bool verbose)

... here, which is probably unintentional. If intentional it's worth mentio=
ning
in the commit message and worth keeping in sync with the form in the protot=
ype.

I personally prefer the former style rather than this one, FWIW.

Cheers,
Alejandro

