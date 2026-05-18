Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ct1KuGfCmp14QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 07:13:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B9D565EB5
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 07:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311445.1581572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOqHK-0000EX-RP; Mon, 18 May 2026 05:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311445.1581572; Mon, 18 May 2026 05:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOqHK-0000Cm-OF; Mon, 18 May 2026 05:12:34 +0000
Received: by outflank-mailman (input) for mailman id 1311445;
 Mon, 18 May 2026 05:12:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wOqHI-0000Cg-TA
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 05:12:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOqHI-007Wd3-8t
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 07:12:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0a9fb1-e002-0a2a0a5209dd-0a2a450b905a-4
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 07:12:31 +0200
Received: from [40.93.194.54]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0a9fbd-212f-0a2a450b0019-285dc236bbd3-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 07:12:31 +0200
Received: from BN9PR03CA0196.namprd03.prod.outlook.com (2603:10b6:408:f9::21)
 by CY3PR12MB9703.namprd12.prod.outlook.com (2603:10b6:930:102::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 05:12:24 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::4f) by BN9PR03CA0196.outlook.office365.com
 (2603:10b6:408:f9::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 05:12:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Mon, 18 May 2026 05:12:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 18 May
 2026 00:12:23 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 May
 2026 00:12:23 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 18 May 2026 00:12:22 -0500
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
 b=f1/pgSgVi33lbm2q20ZBn0Q5R/OItl5VSThoiccxzllPOPelURe7ZtMhq15LLpZPeQJCVtbnJPjME4JbkzyPsrUrZdQyAoHsNSCXyib8ThrKLqfek8nYytJ2ZomqZkcDqypRbGOX/p1bK72Y5NQnHdgN9bBIrKKAT0kI93/sodNG/JKOKfawyEmSA7WtycuRhlnviPPQf+iLfyCvVxdntIsuCPQodb4XeLT3un8TVWEOuZx/4FZusapaBxX6hgkHCMLtYOAxS7yv1rzGOhQC6kE0eiC3PmxreCREKDge2b3EnediC8onT3YWVm1ez3Zo8B0+yXP08sRfZlOM03dwug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nv5iQWa/xWVYAN35Lws2CuxZeo7Snq0MAjiQRnR2FGo=;
 b=ie8NoO7ec6/2G7QAxhV3x4fz1TA7lNi0JBucWsmzTjYVIxVI7xVTKOFcRKItGrd2JS4xc4MHu1w2Ff/CrawTYDKbAYKXX8rjwgM/hyWpjGSWajR/2CoLhV4MsCMbBERnlC2pRw4nURIdiJ0VgxK1+sRx/dCHEbkupNI77aFhyK08G8QShqSwwsrbUuLS4c3VX/6GQP2nCNsOnh80i/c+hNhdbGuVx8FeyNADLRDin7Gl4R3XGtAJZdkbra8ImUDsLEbuoncD8VZV2OBQ2ytzM8QHge2ee0wkS8aA2RAWd2O/Mfh6WNyOhwmBLW5QyW7JX/D9ZY+I0t1s7vNJ+3PQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nv5iQWa/xWVYAN35Lws2CuxZeo7Snq0MAjiQRnR2FGo=;
 b=msOFFbxGwWCwe1AEhh/uNyOR6MzNdwhibRZazaFVeYogncx9EKIcqhjlWkS3wFucGfUVCgiJaNxLWfUyYXaTWxPWSf+rBM4DBPWGvJz0CEc9hZ5saoeFxTbhmwFMAH0rpdYZ0nWG38mou6rCp354lpxHBWhFvSgYOO21UgrAQ4k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <2ef09a6a-f78f-47a5-8ffb-cd03cb51fc1b@amd.com>
Date: Mon, 18 May 2026 07:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mmu: Fix PT_PT table descriptor value and comment
To: =?UTF-8?Q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>
References: <20260517194443.59134-1-gabi.qs.mail@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260517194443.59134-1-gabi.qs.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|CY3PR12MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: 48917d7f-47e0-4f31-1469-08deb49c0bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	vUh2Ua6J9RjmWmsMk4aKujvC6ihB6y5u5NaMrL54tKab714W0VoDwvlQFXGulut9RafPJDhiB1Z5NpWf1HnybfLUoGYJWaC68UgkUPCvEOUoD9ggW16ZGQDLD/wSpiF2mJTDOm17Ucu38R5O1On/XIKJpj7gw3L1MtCvmI7KKx+cIobeAVmuqARTtThmlHwco5kdn+4xWu3PtgEqyhqmR7s9FIHYukDJGEic77lJczdi1T6My8vE6Xg6M0e1Mr7TF9oCEi/47/QqCYNxH8rGAFoTPpqRvEEZ2J9rNKEw7Ue/Dvi2y3Pv9ScoxkwXA3oQvD9k6wEKmI1bzSN/5epUSkIZ/xFKkuHNyjlJyEAsBXNDUN+RLzEujnfSOYXSd129GIcgZv9pbCtxYqh3GFFsdV66SQCWfTEy6M7fTHwcmKboL+VTy4omz1hj52r9SuxU466enpY2wUtw23t38EzjfWNLC6fWErbmhVpSX5xnL9X5a0NBUQkWJCEfOeijcU0xP229nebaQsQGQCqzBZbxSMc2W76BR35+h08jpbJrklpw+y20I6ff8R7QFxPmSYXUv3PfL0QLbmjfsPjQSLvTiE3h8NWFhC0j6aXgqbOMwt5wILz1Tmp7KE+JyByCAUX3DMIt7FbEpWyMJNK7wFxL19ZkJ5lf/LVTamqJ7RlDrIeIBVhScEr3HlUzC0oevLrcxgUpY4GIO3RjfvyrFwwhFWYEqxWvD8EJoYvqo0wXY1g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xyy0fbfAG5EqoF/3y14X+RXi9A/rCDL7VoWBS7UCb+nLzD3CrlACyEPH5qBGNPHq9AtRAhgJY8i2sf504ELHf3vNfqWLwuT3IsOgc+QjAkv5Vw/ymvePngaCfvucP+aoT4aNWXKzsE6tMwdJKuigdDiTEI/IF2SaNaqMqHiGUtPZkm6tpX4P1ipXc+8THYxYSazqONwb+SWATjpk9r8p1SUI03jqtPcK3wV6FcSfGO5eZ/xSkwFZBnoE9uwXWYiVj3Y86+yNQNuNvgASLqRttNLAINrky2ql9eJSLzJGkKraoybO3oqFwqORqB+evJwEKZMSmJWMEle3Kee++vfKJioshYYwApItce+Ve5gz0aLrGBrIu1YXptvaWUcNIEa5BBHvkDJ6fROmJ56SPeA+0kSlDH6ZoV654Xqv0JuWKcO63ge6w6C7pvgWM8pkd9Ke
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 05:12:23.8459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48917d7f-47e0-4f31-1469-08deb49c0bca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9703
X-purgate-ID: tlsNG-42698a/1779081151-19D6FF3B-C18C3A41/0/0
X-purgate-type: clean
X-purgate-size: 2286
X-Rspamd-Queue-Id: 10B9D565EB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gabi.qs.mail@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:gabiqsmail@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 17-May-26 21:44, Gabriel Quintáns Souto wrote:
> PT_PT is used to create table descriptors in create_table_entry_from_paddr.
> The previous value (0xf7f) and comment incorrectly included attribute fields
> (nG, SH, AP, NS, ATTR) that only exist in block/page descriptors, not in
> table descriptors.
> 
> Per the ARMv8-A Architecture Reference Manual (DDI0487, Section D8.3.1),
> table descriptors only define:
>   - Bits [63:12]: Next-level table address
>   - Bit [11]: Ignored
>   - Bit [10]: AF (Access Flag, ARMv8.1+)
>   - Bits [9:2]: Ignored or reserved for extensions
>   - Bit [1]: Descriptor type (1 = Table)
>   - Bit [0]: Valid bit (1 = Valid)
> 
> Update to 0x743 with only the relevant bits set:
>   - Bit [10]: AF (Access Flag, ARMv8.1+)
>   - Bits [9:8]: Reserved/extension bits
>   - Bit [6]: SKL (ARMv9)
>   - Bits [5:2]: Cleared (ignored by hardware)
>   - Bit [1]: Table descriptor type
>   - Bit [0]: Valid
> 
> Compile-tested and boot-tested in QEMU ARM64 (virt machine, cortex-a57).
> 
> Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
> ---
>  xen/arch/arm/arm64/mmu/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index d14780ad19..c3cb262e88 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -8,7 +8,7 @@
>  #include <asm/page.h>
>  #include <asm/early_printk.h>
>  
> -#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
> +#define PT_PT     0x743 /* AF=1 RES=11 SKL=1 IGN=0000 T=1 P=1 */
Looking at ARMv8A ARM M.a, figure D8-12 bits [11:2] of a VMSAv8-64 table
descriptor are IGNORED by hardware (see xen/arch/arm/include/asm/lpae.h as
well). The change therefore has no functional effect on ARMv8-A hardware Xen
runs on.

The arm32 head.S has the identical misleading definition and comment;
the ARMv7 LPAE table-descriptor format shares the "ignored in table
entries" property. After this patch the two siblings diverge. Update
arm32 to match, or leave both alone.

If the goal is "only relevant bits set", the minimum is 0x3 (T=1 P=1).
0x403 if you want AF as future-proofing for FEAT_HAFT (ARMv9 I believe).

~Michal


