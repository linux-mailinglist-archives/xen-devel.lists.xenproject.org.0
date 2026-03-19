Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG6/BuPDu2n1ngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:37:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890612C8CBE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:37:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256864.1551337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39oV-0002HY-DI; Thu, 19 Mar 2026 09:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256864.1551337; Thu, 19 Mar 2026 09:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39oV-0002F9-AK; Thu, 19 Mar 2026 09:37:11 +0000
Received: by outflank-mailman (input) for mailman id 1256864;
 Thu, 19 Mar 2026 09:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYGS=BT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1w39oU-0002F1-Ce
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 09:37:10 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 306dfb54-2377-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 10:37:07 +0100 (CET)
Received: from CH5P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::27)
 by DM4PR12MB7718.namprd12.prod.outlook.com (2603:10b6:8:102::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 09:36:59 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::f1) by CH5P220CA0013.outlook.office365.com
 (2603:10b6:610:1ef::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 09:36:59 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 09:36:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 19 Mar
 2026 04:36:58 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Mar
 2026 04:36:58 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Mar 2026 04:36:56 -0500
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
X-Inumbo-ID: 306dfb54-2377-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=viZPlW/XobJXW8cgzKAfnuPU+zmw1e3tEaYyqcsjv/LqR9p+qUy1fESvMNlnpl4sLsqhgSnB9txPjQePurMophsj/SjyA1G5WJ73NQ+taO8YUMgNNnBKrTe6euNxDDt99UgSCacBOtrpXyuJXNkuScU/AU+r/TvAw3XKMOwwt1xI6xBHLhAv9RnNSdNqPIihf6su9dTUYGSWBitx9n7RsYJu+qKfiPjnFiYeJwzR3ShVHmCDo2JfLcqtoqwC0fcEcFHyf4TfGqe756Ad8TavNEqaNt4uYufZiTqf5MZ3PPQZNEUKyIVcLv7gMbwsJ36mV/MpXtRIqKhcHDrLwveZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3+CPDj/zvZBVn5VzefgLdkIRIc/tCMUgZoQ0BF9v6A=;
 b=wSHJn16mPyVxQttzq1eSvoUc5oN/qA3618QYJyr011AwQL2RlTTFnxq9vJtXbhK7OgyGCxaEeAOeAH378dnnbXRLd9LIg99UPrJUO67UqvnqC3bK7IedGbgonfs/uE3BHAL9qF6F2IZz9lHCvUXHERQS5FGcx98qqPMpSsYy8ePUSi+VbuGFb/fBpJXjpe+uIVi0m8mnwpl5XHTQJDUUQxTHh0nBkB2TJgBc12uzfWPaRRSNgXj5FMINir+Rgn+1HmeFu00CLNrXcaUM6pCZK9uIA1f6eiY/bUFaTQqIWgi6F1JUTvkK9R9KNtXdnpxvQn6CRbZWqehYaeWD2lZSbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3+CPDj/zvZBVn5VzefgLdkIRIc/tCMUgZoQ0BF9v6A=;
 b=vLEu+a1fopxwH/YXUy9NXRrZunRdxpQWr5XUQEWXeGqifjqx27+F/3IJ3xo8oFj0rAUPydkslog5bVyLF4H/vEuYBLpYy+HNu8TIaOO4RyJOBoZqfRp4ywzZyyqgrvi3ziIVY3jPag1Hj94Eu2X7OSHAwCbzmQKarUmbcv2//Gw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <04017286-885e-4e81-9e89-f012ee608287@amd.com>
Date: Thu, 19 Mar 2026 10:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1765533584.git.mykola_kvach@epam.com>
 <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|DM4PR12MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfc5c89-73b4-4634-2654-08de859b1179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RIVxS/kGXKum3gTn0a9bT6Ugj4JyxTSgwkUhlo6QpnAmcVLIk6sPPjP0mdftxGBQsYl7dFCmSOSw+ZHr2towTShnx/trOF3YSF/N+LihZqB27MMg/II+2gezADvlq6lc7dvkOd+TStuy5QLLx/j45mY/5fH74rrpbTcr+hl//pUceMu/eVDj3Qd+v5+AT1XvFLj/7IR5gsRYdKGoontk9IuZnstoe09ppij05AlxrrEvF03EU5/MaKTEARDqLGVHEDrgfK9+8GpnE1dIuNuCx1GI24ixVi4E0BMzJXcVonYPvInHlQeYxz0yLVum3XIm6lTxsXvdmtp/80xS0ZT6qIZ6NvPK4YxEwniL/CxwtwYwBpwp5xuH3/nOLrBRdum7l1pnjgZKOTCpXbY/J1ktdSkhf1SaG4R9t7xA2nXk4NfKagFHu4B8YuRRp3fPoaIu+6P1JKvQuqGCWy998ffrC9K/KR4qHiO7hBJ47qgYKOLUg/ZrjYCRONfPZaeAtnjgDJz/IJBAX9CrsO2/a0k/Uhz+C5UNmv3kzL0HkOunAUBPs7x53FysvkhIHCrhfSUlbksd0asMRU4E0wQK41d3qZnyNP8ne1HYelRtZ3kpbpc0m+5spVbljdTfooV8fI+Eof6Co4rv4iXgYSt+FMx3HByr9MY2aEOW2M4d+NWTA3D1z+hfLD+1/W2bNBeE5BY0fZJMiFqLFsvn1XuAGsZAj3NGgahBnRZXLIgTOCWfO8EIwx+ZgKUUkcu52DHc1I4OWgcCn712VcG8B2J4b8WnTQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nk4L1enaqM9fie+9r5q7yMZ4JNSdoVXQGvagPKaI0F9a3Mj2jnaUu5lRajr4tlmUj9nPQtxwjYorowlyaLwTvAaCFol8BEjdvGoH6TDkZuTUDukX1wyEIYPwQMJbBq9+fKYZq+fzNFGM5I/2WsoR5+oT8jVSvb/bXyFR7D+/Mss7uxhPmccQlSqydS1L6mbXpj1rkPxaSHIonwXQ8aZvrzW3qfdBlIfo1bL/b8XHMfjKnsYGhM7TSTw/6j/SI6lCwGWBih3bkYTxdmO87fRu+b8K5YvkAbGksklCzexXygdWTirH5Iiz4e5KpwfOWl/fB9yHu3lanxfP8AonFG29NULho+9J9y5Szj+tPoQ+dmf/eh2ayCrTNbYyh0fytRosxEnPv25M1A1JD6c2u0pmHDgSMz1DW7zJ41v6vfpvPKWFiKtsorY2ay+2u1Hs4AEB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:36:59.2226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfc5c89-73b4-4634-2654-08de859b1179
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7718
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email]
X-Rspamd-Queue-Id: 890612C8CBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 12/12/2025 14:18, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
> allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND call
> (both 32-bit and 64-bit variants).
> 
> Implementation details:
> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> - Trap and handle SYSTEM_SUSPEND in vPSCI
> - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
>   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
>   in hwdom_shutdown() via domain_shutdown
> - Require all secondary VCPUs of the calling domain to be offline before
>   suspend, as mandated by the PSCI specification
> 
> The arch_domain_resume() function is an architecture-specific hook that is
> invoked during domain resume to perform any necessary setup or restoration
> steps required by the platform. arch_domain_resume() stays int to propagate
> errno-style detail into common logging; preserving the integer keeps the
> reason visible and leaves room for future arch-specific failures or richer
> handling.
> 
> The new vpsci_vcpu_up_prepare() helper is called on the resume path to set up
> the vCPU context (such as entry point, some system regs and context ID) before
> resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of common
> code and avoids intrusive changes to the generic resume flow.
> 
> Usage:
> 
> For Linux-based guests, suspend can be initiated with:
>     echo mem > /sys/power/state
> or via:
>     systemctl suspend
> 
> Resuming the guest is performed from control domain using:
>       xl resume <domain>
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V16:
> - Refactor error handling in domain_resume: move logging to generic code,
>   use explicit return code checking.
> - Make context clearing conditional on success in arch_domain_resume.
> - The 'int' return type is retained for arch_domain_resume for consistency
>   with other arch hooks and to allow for specific negative error codes.
> ---
>  xen/arch/arm/domain.c                 |  39 +++++++++
>  xen/arch/arm/include/asm/domain.h     |   2 +
>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>  xen/arch/arm/include/asm/psci.h       |   2 +
>  xen/arch/arm/include/asm/suspend.h    |  27 ++++++
>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
>  xen/common/domain.c                   |  10 +++
>  xen/include/xen/suspend.h             |  25 ++++++
>  9 files changed, 205 insertions(+), 22 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/suspend.h
>  create mode 100644 xen/include/xen/suspend.h
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 47973f99d9..f903e7d4f0 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -12,6 +12,8 @@
>  #include <xen/softirq.h>
>  #include <xen/wait.h>
>  
> +#include <public/sched.h>
> +
>  #include <asm/arm64/sve.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> @@ -24,10 +26,12 @@
>  #include <asm/platform.h>
>  #include <asm/procinfo.h>
>  #include <asm/regs.h>
> +#include <asm/suspend.h>
>  #include <asm/firmware/sci.h>
>  #include <asm/tee/tee.h>
>  #include <asm/vfp.h>
>  #include <asm/vgic.h>
> +#include <asm/vpsci.h>
>  #include <asm/vtimer.h>
>  
>  #include "vpci.h"
> @@ -851,6 +855,41 @@ void arch_domain_creation_finished(struct domain *d)
>      p2m_domain_creation_finished(d);
>  }
>  
> +int arch_domain_resume(struct domain *d)
> +{
> +    int rc;
> +    struct resume_info *ctx = &d->arch.resume_ctx;
> +
> +    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
> +    {
> +        dprintk(XENLOG_WARNING,
> +                "%pd: Invalid domain state for resume: is_shutting_down=%u, shutdown_code=%u\n",
> +                d, d->is_shutting_down, d->shutdown_code);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * It is still possible to call domain_shutdown() with a suspend reason
> +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_shutdown.
> +     * In these cases, the resume context will be empty.
> +     * This is not expected to cause any issues, so we just notify about the
> +     * situation and return without error, allowing the existing logic to
> +     * proceed as expected.
> +     */
> +    if ( !ctx->wake_cpu )
> +    {
> +        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was not provided\n",
> +                d);
> +        return 0;
> +    }
> +
> +    rc = vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
> +    if ( !rc )
> +        memset(ctx, 0, sizeof(*ctx));
> +
> +    return rc;
> +}
> +
>  static int is_guest_pv32_psr(uint32_t psr)
>  {
>      switch (psr & PSR_MODE_MASK)
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 758ad807e4..66b1246892 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -5,6 +5,7 @@
>  #include <xen/timer.h>
>  #include <asm/page.h>
>  #include <asm/p2m.h>
> +#include <asm/suspend.h>
>  #include <asm/vfp.h>
>  #include <asm/mmio.h>
>  #include <asm/gic.h>
> @@ -126,6 +127,7 @@ struct arch_domain
>      void *sci_data;
>  #endif
>  
> +    struct resume_info resume_ctx;
>  }  __cacheline_aligned;
>  
>  struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
> index effd25b69e..8dfcac7e3b 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_reset")
>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>  PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
>  
>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
>  
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
> index 4780972621..48a93e6b79 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
>  
>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
>  
>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
> new file mode 100644
> index 0000000000..313d03ea59
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ARM_SUSPEND_H
> +#define ARM_SUSPEND_H
> +
> +struct domain;
> +struct vcpu;
> +
> +struct resume_info {
> +    register_t ep;
> +    register_t cid;
> +    struct vcpu *wake_cpu;
> +};
> +
> +int arch_domain_resume(struct domain *d);
> +
> +#endif /* ARM_SUSPEND_H */
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
> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
> index 0cca5e6830..d790ab3715 100644
> --- a/xen/arch/arm/include/asm/vpsci.h
> +++ b/xen/arch/arm/include/asm/vpsci.h
> @@ -23,12 +23,15 @@
>  #include <asm/psci.h>
>  
>  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
> -#define VPSCI_NR_FUNCS  12
> +#define VPSCI_NR_FUNCS  14
>  
>  /* Functions handle PSCI calls from the guests */
>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
>  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
>  
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                          register_t context_id);
> +
>  #endif /* __ASM_VPSCI_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 7ba9ccd94b..c4d616ec68 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -10,32 +10,16 @@
>  
>  #include <public/sched.h>
>  
> -static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
> -                            register_t context_id)
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                          register_t context_id)
>  {
> -    struct vcpu *v;
> -    struct domain *d = current->domain;
> -    struct vcpu_guest_context *ctxt;
>      int rc;
> +    struct domain *d = v->domain;
>      bool is_thumb = entry_point & 1;
> -    register_t vcpuid;
> -
> -    vcpuid = vaffinity_to_vcpuid(target_cpu);
> -
> -    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
> -        return PSCI_INVALID_PARAMETERS;
> -
> -    /* THUMB set is not allowed with 64-bit domain */
> -    if ( is_64bit_domain(d) && is_thumb )
> -        return PSCI_INVALID_ADDRESS;
> -
> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> -        return PSCI_ALREADY_ON;
> +    struct vcpu_guest_context *ctxt;
>  
>      if ( (ctxt = alloc_vcpu_guest_context()) == NULL )
> -        return PSCI_DENIED;
> -
> -    vgic_clear_pending_irqs(v);
> +        return -ENOMEM;
>  
>      memset(ctxt, 0, sizeof(*ctxt));
>      ctxt->user_regs.pc64 = (u64) entry_point;
> @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>      free_vcpu_guest_context(ctxt);
>  
>      if ( rc < 0 )
> +        return rc;
> +
> +    return 0;
> +}
> +
> +static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
> +                            register_t context_id)
> +{
> +    struct vcpu *v;
> +    struct domain *d = current->domain;
> +    int rc;
> +    bool is_thumb = entry_point & 1;
> +    register_t vcpuid;
> +
> +    vcpuid = vaffinity_to_vcpuid(target_cpu);
> +
> +    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
> +        return PSCI_INVALID_PARAMETERS;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> +        return PSCI_ALREADY_ON;
> +
> +    rc = vpsci_vcpu_up_prepare(v, entry_point, context_id);
> +    if ( rc )
>          return PSCI_DENIED;
>  
> +    vgic_clear_pending_irqs(v);
>      vcpu_wake(v);
>  
>      return PSCI_SUCCESS;
> @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
>      domain_shutdown(d,SHUTDOWN_reboot);
>  }
>  
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
> +{
> +    int32_t rc;
> +    struct vcpu *v;
> +    struct domain *d = current->domain;
> +    bool is_thumb = epoint & 1;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    domain_lock(d);
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v != current && is_vcpu_online(v) )
> +        {
> +            domain_unlock(d);
> +            return PSCI_DENIED;
> +        }
> +    }
> +    domain_unlock(d);
> +
> +    rc = domain_shutdown(d, SHUTDOWN_suspend);
There is a theoretical race between this and ...
> +    if ( rc )
> +        return PSCI_DENIED;
> +
> +    d->arch.resume_ctx.ep = epoint;
> +    d->arch.resume_ctx.cid = cid;
> +    d->arch.resume_ctx.wake_cpu = current;
setting up resume context. It is practically impossible but still we could move
setting up the context before domain_shutdown and clearing it on failure to be
race free. The race is about small window between domain_shutdown releasing the
shutdown_lock and other CPU calling domain_resume, taking the lock and running
arch_domain_resume before resume_ctx has been populated.

~Michal


