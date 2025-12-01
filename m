Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D800DC98149
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 16:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175834.1500444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ60Y-0007F0-Qa; Mon, 01 Dec 2025 15:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175834.1500444; Mon, 01 Dec 2025 15:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ60Y-0007C2-N1; Mon, 01 Dec 2025 15:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1175834;
 Mon, 01 Dec 2025 15:40:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSEW=6H=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vQ60W-00077M-TK
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 15:40:08 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00c28e4b-cecc-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 16:40:04 +0100 (CET)
Received: from BYAPR02CA0042.namprd02.prod.outlook.com (2603:10b6:a03:54::19)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:39:56 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:54:cafe::f0) by BYAPR02CA0042.outlook.office365.com
 (2603:10b6:a03:54::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 15:40:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.0 via Frontend Transport; Mon, 1 Dec 2025 15:39:56 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 09:39:54 -0600
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
X-Inumbo-ID: 00c28e4b-cecc-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtMoir4tKUxy90QJbmisxFRCUdr0nqcL+ShoiHcU8Zt28hPjYPXMBK6V2ixUEtlQFhxDhksSW6AKUs2oVip8Axg5W+F8Vq7jm7+GzLEDs32oI6pZZpGKQRH+Y1hXiIRkiTsBPS6ubdKRrdvw2t7zwPFyBnKNojrmz+shV9FW/lx2VcrNb3T1SSO0PEEbQ6icikgZfOgJfKONC37pvDQyXPBV2nJBBnlHpys/YK2JlX46xzGyUa2gaevYezRQ5F3fIyT1uO1J4Yn3SBqxJG/MMjUFPcieR48s9whUCGBqpwbqLG5kxc5XHbvAXPX8+C9vHawaSjTyWt5qbCpOxRdmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sar9cuNbW5/wix3CLG33GCKNcehMGre7ZojghHkxWpM=;
 b=TDuMDMO2fL1anc0gDf3cvQz8wq7iUkwhqZhKOcd+zH5OpPv4yvwFNk8Qbv0Q9sSJp4FdGlO0gEDjh5e1itbVALg6IUffgnbSxXZdyW18B4BqL38Ui0sbk5IvdaYEhCYXJvhyg3yGNqIbv4NMzdBQstlneb9h8DLi8sAWG2HD/1NbyTaNp4fycyj96bhDv63Qd/weOZbz8DqRjoNqWTSsXpHxR8g98mZnjlgPnWayIeFitZXYUQpud+V4l4tfxaj7wvtcjG1+tUMzQBw1I2IisnyhpjpkB8Zys/TqgPIEzIwdmlCF9Hu0ZxDcWkI/xtS8ty/l8m9xWeELm1+ob3oNbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sar9cuNbW5/wix3CLG33GCKNcehMGre7ZojghHkxWpM=;
 b=jkzB+79/rKXgHcixrGVa+sKpbOcfbsOie1DTAwHsVytxCTlVqnk/RJNSSU70T6+aUWPe6Km7X959+XEjQBw3d0MHtfpWTcQR++XsotSReNWBaJ+bnihP+ZHXdlIcC5NC2cXJNCk8ewXZO1GgOcfNrCdSPGeLLqf/YQSUZ1KEjug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 1 Dec 2025 16:39:52 +0100
Message-ID: <DEMZRNCQPXI1.2YAGC4KJQ67RM@amd.com>
CC: Jan Beulich <JBeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH 3/3] x86/svm: Drop svmdebug.h
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
 <20251128201937.1294742-4-andrew.cooper3@citrix.com>
In-Reply-To: <20251128201937.1294742-4-andrew.cooper3@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: e4cc2e83-e364-4f51-67c6-08de30efe131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2hmbERiamNwOVJiSmNIQjUxam82TExaQndXV2NyclU1em1wWHNnWWt5eCth?=
 =?utf-8?B?WnlZLzJWZXRpSW9rWlU1WmpzMnpTN1FKa2FwQlF2S1dvTFBTSE5WbGhpYjQ2?=
 =?utf-8?B?WVdMcVdBc3lQZ1RGYU90ZGZnbXpHa3VPaWh4UUk5TXJlSUFCTzUxYlRYSTJ2?=
 =?utf-8?B?elV5bUdzODJFTVhEd0l4RXAxVlJWMWRoajROR1RYZSs1Ti94RnRMU2ZEemhn?=
 =?utf-8?B?cXdoTkY0WCtRM3lxUDY4czlOQVhXSFZnWVphSXJIalZDNUZMZC9OQkwwYnpB?=
 =?utf-8?B?Z3RaeE16MVFrNG5QN3ROcFE0dW93azc3akxPNFpYZEk2U1A2bmlrcWpzQk9P?=
 =?utf-8?B?OFpySk0wcG1lY3VsRHlvMTc5WDNveU4wTEhNSXh0NUhMSzZXR3ZwRkJaZmJT?=
 =?utf-8?B?em5JNExxTGt0Vmo1aWVlVlQwWXNHc2pySTNxMkxudDF0V05zQXVibVBYRUN0?=
 =?utf-8?B?cEJSMk95OFA3UEU1enB0STVKbVRxaXhTeUY3ZEQ0MGZnbmZkZUN5cHh6NHNP?=
 =?utf-8?B?ZWF5QkV3ejFhVUlKSDFnR0dzUU1NTS9PWHc0d3NkeFNGYkFNcENMRVpzcEJh?=
 =?utf-8?B?ODZFNmpQOXk3citudm1QMVBGVnViNXZjaHRwOE5kWkNNTDV1NHBmYk9pc3p3?=
 =?utf-8?B?ck9nWnBLUkZWbDFkQjZCenhvZ0dneHNKUFhQWHVrUkcrelJYRkRBTVJHZUIz?=
 =?utf-8?B?aWpEa1JVZTFmbFY3NzFGanZHU2FaazBZOE5pSkI4MS9iTjRXaG1wNjFKeElO?=
 =?utf-8?B?Rjc0SU9lcm9jZ1p3MG1tRCtqTTVUb2g3akhja1lVSnNCOTJUQ2hTNG1sdlM3?=
 =?utf-8?B?NEJWV29uamdPMys5c2MvdnRWYm9DOGl1R3BrL2ZMOWtodkIxSnJKMUhxdU5Q?=
 =?utf-8?B?V2xPWmw3K2Q2M000OEgvT3FwZEVMZ0M0RlZsQVhscExXY1BDd2NBZ3crNktQ?=
 =?utf-8?B?ZUpkNDVjNWV0YVR0SU9WazJMM1lsc0k3bmdxNUZxUjJsQmpKd2RQOHFudWVW?=
 =?utf-8?B?clNYVnRPMkpUN1drd3dQMVFPQ0lTR3ozUlY2ZjZOVGFpWjRJVjRTdVNRVHRK?=
 =?utf-8?B?SlgvM25oeHVtc1N3Y1VHNFRZT2RlcVYwOWFITHplOWRSc0d5VklvNXB6UEsr?=
 =?utf-8?B?SDBjcURuZFBxaEtkSWx5dTFhY3E0Y2Nyc3pIQ0N2MjZZaUE2eWkzS1BCVGJ6?=
 =?utf-8?B?RU4ycFg0TFRmMk5lWmdYaWhiakhIeGMyS0IyWC9GV3l4ZTg0MWFJOGU1Rk9P?=
 =?utf-8?B?bHhlK1dKS3BJVGh4dmFuRUZNcXZVcHlEK1RGU25UN1RneTdtWkFEOHd1RU9s?=
 =?utf-8?B?NXBVbkhZU1Jkem1hRkRWYWtuTndHU25Zc0g2ZkltTnd4K2RDTlhvWlFlWU10?=
 =?utf-8?B?aTcwYTQyYXQzbFpZbkZtMzZMUENkcmgxRWFMR2s0bTVPM1hFSTgrOEZlK0xi?=
 =?utf-8?B?eVJEdzBTZTBOQ05IaDRBTy93bnUvV2Z4U2RHY3ZwYzdLejlFZ0xRVkE2S2w4?=
 =?utf-8?B?dU9QeEg0N0ZhKyt2MDNObldKa2tLY3FYamZFNDFLZVkzVGNHQ1laaVVQTC9w?=
 =?utf-8?B?eENiSzV6bFpLUVV0MVFzRGVrWEN6aFNJaHZiNXVjcytaWmZCOEdBYTVUNFEv?=
 =?utf-8?B?c0Z5U1lCZjRKTFpJYXc1K21kLzF3NG5nM0JiZmdxN2NxZ0I5cENKNW9HQW9n?=
 =?utf-8?B?SFQ5NDFndmdGZUpVd3FQZk8yV2NwVy9CVSttZFZjYlBBbWZOUUNTZTc1cHU2?=
 =?utf-8?B?d05SbE8wVExUcnF6NHcvMk1VOWFYZHVNUFowcnR1RVhMbnlqamxlTUZLVUlE?=
 =?utf-8?B?dU9jL1k3YW9kQkdUQ0VVNGhTK3dqN3RmMHE4cW04MVg5TExnc3d3SVlJR21K?=
 =?utf-8?B?Sy9LZUdweHFlcG1wR3lLWGVmS05XanNGYVJDVzE1dkwrL0szdlJhQThmb3Jl?=
 =?utf-8?B?Mkt2TmJoMjNKMzg4cHB5ZC84MDQrbWJDRUY5QUlSODMyZU9FZEJmbFN0MnVw?=
 =?utf-8?B?c0dxNkIxUGxPY3FmdWpDWWFaNkdIaGFBbmVXd1FiYU5xbDZ6R0dwTFBic1I1?=
 =?utf-8?B?ZzNTSEZiTGJPVXBrN2dIR2pqYkVlTWk0ZzYrQ0NkOUdPQXZjOW9sZzZZT016?=
 =?utf-8?Q?r5us=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 15:39:56.5525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cc2e83-e364-4f51-67c6-08de30efe131
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941

On Fri Nov 28, 2025 at 9:19 PM CET, Andrew Cooper wrote:
> svmdebug.h now only contains the declaration for svm_sync_vmcb(), despite=
 the
> function being implemented in svm.c.  Move the declaration into svm.h
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/svm.c                  |  1 -
>  xen/arch/x86/hvm/svm/svm.h                  | 17 +++++++++++++++++
>  xen/arch/x86/hvm/svm/vmcb.c                 |  2 +-
>  xen/arch/x86/include/asm/hvm/svm/svmdebug.h | 16 ----------------
>  xen/arch/x86/include/asm/hvm/svm/vmcb.h     | 15 ---------------
>  5 files changed, 18 insertions(+), 33 deletions(-)
>  delete mode 100644 xen/arch/x86/include/asm/hvm/svm/svmdebug.h
>
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 14b3a427e642..15d45cbb57c5 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -27,7 +27,6 @@
>  #include <asm/hvm/nestedhvm.h>
>  #include <asm/hvm/support.h>
>  #include <asm/hvm/svm/svm.h>
> -#include <asm/hvm/svm/svmdebug.h>
>  #include <asm/hvm/svm/vmcb.h>
>  #include <asm/i387.h>
>  #include <asm/idt.h>
> diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
> index f5b0312d2dcf..cfa411ad5ae1 100644
> --- a/xen/arch/x86/hvm/svm/svm.h
> +++ b/xen/arch/x86/hvm/svm/svm.h
> @@ -78,6 +78,23 @@ unsigned int svm_get_task_switch_insn_len(void);
>  #define _NPT_PFEC_in_gpt       33
>  #define NPT_PFEC_in_gpt        (1UL<<_NPT_PFEC_in_gpt)
> =20
> +/*
> + * VMRUN doesn't switch fs/gs/tr/ldtr and SHADOWGS/SYSCALL/SYSENTER stat=
e.
> + * Therefore, guest state is in the hardware registers when servicing a
> + * VMExit.
> + *
> + * Immediately after a VMExit, the vmcb is stale, and needs to be brough=
t
> + * into sync by VMSAVE.  If state in the vmcb is modified, a VMLOAD is
> + * needed before the following VMRUN.
> + */
> +enum vmcb_sync_state {
> +    vmcb_in_sync,
> +    vmcb_needs_vmsave,    /* VMCB out of sync (VMSAVE needed)? */
> +    vmcb_needs_vmload,    /* VMCB dirty (VMLOAD needed)? */

extra comma on move, but this is better, IMO.

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Cheers,
Alejandro

