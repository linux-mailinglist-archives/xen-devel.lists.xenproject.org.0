Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKmlChXm5WlkpAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 10:38:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF52428426
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 10:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285529.1566536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEk9C-0001mY-A5; Mon, 20 Apr 2026 08:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285529.1566536; Mon, 20 Apr 2026 08:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEk9C-0001ja-6l; Mon, 20 Apr 2026 08:38:26 +0000
Received: by outflank-mailman (input) for mailman id 1285529;
 Mon, 20 Apr 2026 08:38:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wEk9A-0001jU-Fz
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 08:38:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEk99-00CO6y-SM
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 10:38:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e5e5ff-5cb7-0a2a0a5109dd-0a2a450cd236-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 10:38:23 +0200
Received: from [52.101.62.3]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e5e5fd-62f1-0a2a450c0019-34653e032ae4-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 10:38:23 +0200
Received: from BL1PR13CA0061.namprd13.prod.outlook.com (2603:10b6:208:2b8::6)
 by MW4PR12MB7264.namprd12.prod.outlook.com (2603:10b6:303:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 08:38:18 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::88) by BL1PR13CA0061.outlook.office365.com
 (2603:10b6:208:2b8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 08:38:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 08:38:18 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 03:38:17 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 03:38:16 -0500
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
 b=RDiRExe6KOIVQPzeiPjuVqZaMqjMZaSx4BquvTp07X5tD3PA8A5nZHbow0Y2vz7ttpDCRTEaTY9dfnizRgnEyXgvrC6YuqldkAOUN2BS8BZK32bwqbrHIr7cXnnp8+Qj+3K+KquPtTwHC9lRmdr1RYogaUhq6GEZPzdf6oSnpJumE1K8q4olj7TbTXF//YwLfmuB0hQwdRm9Nd8zW0UXcbLsyvQXNZDVDEfvIVPepaRSLj9zTzyILrPbRqtKt+v3X/INXKDqpAuNEk8+05RNbm/0ReDgbO2LaPf38c7HaqblCtU7itjH8g6FJaYAuKf5Xm/7ZXFwEkiNDklASOZQ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTfvdDCuCL1Q5XMGpRUHxrM/YnMeI6OVKCctNVHcjf8=;
 b=FVbiN0ODmeHdY2PMMHOuqQZy7XMQVorCZwHSMhYBKdWY9mNIfRPeb2iTPdegZB6MQcHsyRRpVSf1QMesnhV7wqcNIKJkXLKtqAqhe79dMh3PQ0uUcTVhb30dAJlWHCJH18Bj3Np8IDeui8woNmsZ8vWHbIhL4q+epcdq/eGFUHJWrrI/1HP6yBVREe9ppB/GM4Fqq6KBo1PLUTrsVR1kVfHk18VcKod9vx1AYNLnkhVU7bFPIii2Jd4RsSZDWL4hK7R5ixGN3uACuQDmzU10lNMdtSGJIUoyrTlV0rINR7QbXaZm8Zrlen6yCfBEvarQiYE0XD61Euk9rkvneU2BdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTfvdDCuCL1Q5XMGpRUHxrM/YnMeI6OVKCctNVHcjf8=;
 b=rBbTa7S2a9vYAmp5WCmv7mus/SS0kGxhuZryjxaeObyf40j16ju/18DkwtdhjbPm6t+7z0WisI8y7JOZPWcKTs1r9tA7hSWrq7J2hdzWUeGrW1rtftFTVt3W1YP1C7KnyORqEnScPjPgI2oUQ/RDkaAYc7CKfb/ypTxp6o+1VTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c30e0162-aea4-41fe-a077-cb7c6e6b4d33@amd.com>
Date: Mon, 20 Apr 2026 10:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: gic-v2: disable interrupt bypass on CPU shutdown
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <459cf46204e86ed3a2ffd79ae649b1a2051f5204.1775812563.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <459cf46204e86ed3a2ffd79ae649b1a2051f5204.1775812563.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|MW4PR12MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 1beb2688-3f32-4537-3918-08de9eb82be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	U7+4oM2FxHntrTOTJUu9FSyeS0rWeGhfay1SMOFUpYJC3HgUhlSwV2BX4bRybnLClu6LSCV5Lo2pJp4QDgrS0xJo6lkXc1KZ6+L0QiAYwdUXORlCuJOM2i6B6sX/XRqwR2TEEIXNiUMYUzZxmfZOul0Ocjv84PDDLO6pDj5Z4WIJ3piIUn6DCewUcZ+gOq3PPoeIMcRn20xT55J/3d24gaymZ9s42F5pSWSfa47oxJlrRw+QeOpzPdYIgJRQRsdvpJoonZqPXPhwaKxR2L4XKC8jDR/vCXL+QZ4IZWKXVeG+/xiZ9FFE8DIM710CVVgpJE+IV4OgQKGHNZbaocFeYl6NvehVA/QkJ8grIn4+MLNnOTtUC/P+1vYM4rvVFyY/pWqWLc2IixSLmVj7y7Yh36CjmXjdCZh5G2sw5ywVhPTrS+xdy8zMcKMjxZzgsJ44Cm/tt8qp1XWHH5q5h7Rhj4Cj9ggWLNQOJx5duMa+qwd2C0hfVz1IdI8BS252BQ8dtHar2edYNrEWTKMHpCFZ8RF/xcFEPW+v3eN/0na92LqhKCATulnRT2X/+aBhWowBmAy43VCWsn4saFf1QtbsHukVwWSi2qH1PoH0mmjMlGjxcD9qQiHUzHhtaM0MzV84xop4pKU67GWEEAPHz+1RbT2oX6xBn1QKbDyEXfVqpzfipxrIEtxoqQ30vv5D5v+2CtHbxgH9+0MdrrOISEqpRglznkMgd+EjAYPgkjjIDBAtYF/GseYZFEvE6AJWohYj5a5oV/g2ayPIom8kmETbLQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	90ZKEa/NJh+CM33XnE66POzD1uha+Qhq+LPvOfn7cu/q7erccb1VYmCEm6EAD/Bu7RWGaVZ+1ggPb8rI6rMc/YaI5yfYLQR0ItZnhpybkYn3EXTBD6upaeWJtW5CWrPC3FLUB1tW4wCYDULpIk1scCRLirW3HmoNxMN8HrQ++HJsJd2JkFclPBtdyLYLD7q9O0goDivJ6vVp+3zbFTxcKLt9jBD5wyvSioK5UI3z2WmRDX0wCtXeafT7i/g87upwR7Dou2LV02VE/9sy7vS5HD0v8GiqPwt0ujWTRZ//+ykkZKnIC3Dy4/ZE4Dw4ofjLLBWlwMNHJtNnOxiZoNUVa2LkLu+i+qmYA1qPXF6V70m5jn7XGErZdgc7XenZVGgyNPtlo/Na5NuGWXs42LHxPTWH8eF2vLs2CmU8SkTYr58wuDbjVM2sYLVr6ghjehRn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 08:38:18.0118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beb2688-3f32-4537-3918-08de9eb82be0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7264
X-purgate-ID: tlsNG-d25034/1776674303-6D161CF5-3CC8634D/0/0
X-purgate-type: clean
X-purgate-size: 1429
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email]
X-Rspamd-Queue-Id: 8CF52428426
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hmm, this landed in my junk folder.

On 10/04/2026 11:36, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The GICv2 CPU shutdown path currently writes 0 to GICC_CTLR.
> 
> Per IHI0048B.b section 2.3.1, clearing IRQBypDisGrp{0,1} and
> FIQBypDisGrp{0,1} selects bypass rather than deasserted interrupt
> outputs when the CPU interface stops driving them. Tables 2-2 and 2-3
> show that a zeroed GICC_CTLR can fall back to the legacy IRQ/FIQ inputs
> instead of fully disabling the interface.
> 
> Fix this by reading GICC_CTLR, setting the bypass-disable bits, and
> clearing both group-enable bits before writing the value back. Keep the
> existing GICC_CTL_ENABLE definition for the init path and use a separate
> mask for the shutdown-side group-enable handling.
IIUC we don't need to worry about not setting the bypass-disable bits in cpu
init (we only set group 0 and EOI) because they are relevant only when the bit 0
is disabled i.e. the path this patch changes?

> 
> Section 2.3.2 also states that wakeup event signals remain available
> even when both GIC interrupt signaling and interrupt bypass are
> disabled, so disabling bypass does not break the power-management use
> case, i.e. suspend modes.
> 
> Fixes: 5e40a1b4351e ("arm: SMP CPU shutdown")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


