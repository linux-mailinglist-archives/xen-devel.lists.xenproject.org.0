Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LakK/zV5WnWoQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 09:30:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F030F427C1F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 09:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285428.1566463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEj4q-0005aR-PC; Mon, 20 Apr 2026 07:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285428.1566463; Mon, 20 Apr 2026 07:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEj4q-0005YD-MJ; Mon, 20 Apr 2026 07:29:52 +0000
Received: by outflank-mailman (input) for mailman id 1285428;
 Mon, 20 Apr 2026 07:29:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEj4p-0005Y7-Pc
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 07:29:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEj4o-00GP9O-Rp
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 09:29:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e5d5ee-2eae-0a2a0a5409dd-0a2a450ac0c2-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:29:50 +0200
Received: from [40.93.201.60]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e5d5ed-56b3-0a2a450a0019-285dc93ce221-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:29:50 +0200
Received: from BN9PR03CA0118.namprd03.prod.outlook.com (2603:10b6:408:fd::33)
 by DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.15; Mon, 20 Apr 2026 07:29:44 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::d9) by BN9PR03CA0118.outlook.office365.com
 (2603:10b6:408:fd::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 07:29:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 07:29:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 20 Apr
 2026 02:29:44 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Apr
 2026 02:29:43 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 02:29:42 -0500
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
 b=E56Vt33SnUFM8KCgyHA1/0pLTE4a3SPRaGataScMOTUsY2CFUK7NTXr6LV2t3nInXhLPNdKf87XUQNbFyg3g5y4Is2RMBYbHd2vaU+3N9eRcOjRXhjcDN1Yde51mfbW8ZrraMZjZTZJjPE7b4ewpt5bOPogR+O6BTHtheUBfvkNNYviG9Pwz85DTDSkdZUT/y1OKyQuClGUCCGZUfHz2ZZRwdJd35SjhXWQiXuuDml688a/8qCnGrOAoGbzzA+8R6c+uErxQ0gxjM+PS+DgyVDmoe/hJIlMghy48kdbUCpay/dByS8JNwd6HQ2ayvlAs39mx7RQA/2n34PJ0f1yXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEGRxzNeGZqB8YZt0n2/T7bjh3hrYyF/Nm/QHv0KEOE=;
 b=d5MKmtiWslx23YHFZPwapGYdcGmT2ijkGvpjRO9vbcRVaJ7H93dOzvVMvk8OK5Q/PzsmSm6tezBuKiZzuhC+l7NLs9TI3r8COBdOkdB+Tcyfv5TsOoADRyNIJ7s+/92ufZPExIER5heYnk35qFCQJg3vw4XYNiciILnVzcDoXSy3SllYCeJcx49iQ2XkoflZqJKahigQ4YJ+aTbNtC6rwzJchNC/lxtqqw/pNkHzVmAoRyBefkHq3tKlCdL6HY+FtCfxt69NqmldrQ2ju6vAeAc6UQVIAYHV/akUcCC626Kvfi/cDrTxKtIbpbBimDnxS0Jl6F5MHGS93M+uWnnaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEGRxzNeGZqB8YZt0n2/T7bjh3hrYyF/Nm/QHv0KEOE=;
 b=vCw4nFK+j4L4XpPYZ+qIOmrrfat51uPdwH1PqJ4clqfPbdgv3eUG6889RaaV2UrKhLALeBzdV4ks7RTnDpIo/fMiuYsFY/7YZbvFh48FclmETvID/WL5BD/fKDLyw/GHgKLx/3dJQFiloRJ3xdT+tqo0rKRJdxytP6yr9OZaSEA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b97cbb48-5bd9-4887-bb1e-24b7f001e5a5@amd.com>
Date: Mon, 20 Apr 2026 09:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/dom0less: pass kernel_info struct instead of
 fdt to make_cpus_node()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
 <a897d880738f5b3be2d6fc5ec2b6cab1fd8b9dc4.1776340422.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a897d880738f5b3be2d6fc5ec2b6cab1fd8b9dc4.1776340422.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|DM3PR12MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: 24bc89bd-01e6-4bb4-36a6-08de9eae97f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2q9Hggy6ssTC/4mDNkNtcsAHSxCDEJ0U5gjOSA9ic6v3SfqRhrEr6L4eq5aEPvt6PUjvJYq+UnPlWHCKvaKJ+bvSp43n7ldQ1UEu0wawssquB2J2wKH5lJ5Z1sU5k0aTxa3DxsRonFfyJXMIyhKTm/3avGiUfKjABPZ3weK4t9F3Ybprgs5EpyC5roNZlCyqXS1A3CJBZsWX7o90FVCkTUN2Ehuh5tDr7+1GGxD0EuaVmPpVAi+ddTzFGubwH/Kw721YIlEd++KGZBnSR3Y7RIBv4/rM0GK1P8kVYIu5ovul9NZ/1y8jZk4udUwBpT63vTHh+V7arvYlNzqDRLt+cI/yyldA3+7N3rOGqVjmkG8wNXKkntELDdRtl+/BOWE/93bk1KveVofg1M9xH2j+Rz5Or4Yq3uXqvEiIPKquL/PlKDsrvAL2y2scA2XlsC0iKJX8JRWSiGvlWg8x7JfZMgduxU4Am+rj6UukBgCst/2C5wcMNW3Bm1vpqHmH0cQP1Nr/TDctu416FpCd18MYFZBpCWes+geXLH++sitJavApIqYFNoskPAkq/jprYLyQZ195odptZFPcNhYo8Sj7JwxrZlJPTp1SEqWrKOAt6NmiL/dsYFwypzD8CUlyddckkdgTs1isOJA5hkbGeBfcxBoZUNx/IALQH6NKNIF5WeDlFJR3jNiQplP0TblRxat7qKctXxpfkA8dvpvxCnTzfwV7CtAL38ZoM4KPT1TXtADnZDbmSEh3fx5Tni+6ssiHkrEXk+lURRiZF7dDToWavQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PBO32GGPdqKiYc16vhuXRMRCkIl0R2LTqnCjG7yvd4tf/ZZkWBHJXTMqyxD4JKKyr41y1qlSXeL9AycDStMgoGU8Kp0fNWSlKh8wNQDy0ISR5Ojqpwcgld++TK9y2RtxzAOad/cuPhbOlE+naaojlEqfe4eZFyA9EnCznywU8b1wilOmDioi50alr9DgbIQ8LTLD2i/YnwO5Xu2j80q7nSSQApROpL0ojdMlbjrfVdsn43aWqiulxkw8pBIRQCrM98jI2UJFGBZRMl0c6Yj52iojGNw3fdqac+bRIfw7JwCAbUW1u0egcuK7S1PyY5op9dxSj4NJFqkknp0RLy0oxjWGj/WJCejXyFaOE1V+QJoA4yMA64dr9nCfLVJudy80AjgLsGI1kLikU7X3w3lmtu+IV4baqldCwU4YOMgifzybOFlI9HE7m4PXS2iwW1tN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 07:29:44.3658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bc89bd-01e6-4bb4-36a6-08de9eae97f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9416
X-purgate-ID: tlsNG-4011c0/1776670190-4596E8B7-C1DE077D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1455
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: F030F427C1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 16/04/2026 16:20, Oleksii Kurochko wrote:
> There are two reasons of this change:
> 1. Align prototype with what other make_*_node() are passed.
> 2. A follow-up RISC-V patch will call get_next_free_phandle() inside
>    make_cpus_node(), requiring mutable access to kinfo->free_phandle.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/arm/domain_build.c             | 5 +++--
>  xen/common/device-tree/dom0less-build.c | 2 +-
>  xen/include/xen/fdt-domain-build.h      | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 60a7cbf915a5..6740da3d324b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1164,7 +1164,7 @@ int __init make_psci_node(void *fdt)
>      return res;
>  }
>  
> -int __init make_cpus_node(const struct domain *d, void *fdt)
> +int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
>  {
>      int res;
>      const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
> @@ -1178,6 +1178,7 @@ int __init make_cpus_node(const struct domain *d, void *fdt)
>      /* Keep the compiler happy with -Og */
>      bool clock_valid = false;
>      uint64_t mpidr_aff;
> +    void *fdt = kinfo;
You're assigning kinfo to fdt pointer which is a bug.
Instead, you should do:
void *fdt = kinfo->fdt

~Michal


