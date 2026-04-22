Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFQ5Fkr76GlNSgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 18:46:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1E448D39
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 18:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290906.1570354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFahi-0006cw-5M; Wed, 22 Apr 2026 16:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290906.1570354; Wed, 22 Apr 2026 16:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFahi-0006Zr-1V; Wed, 22 Apr 2026 16:45:34 +0000
Received: by outflank-mailman (input) for mailman id 1290906;
 Wed, 22 Apr 2026 16:45:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Edgar.Iglesias@amd.com>) id 1wFahg-0006WO-Gb
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:45:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFahf-00FUdH-Tk
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 18:45:31 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 69e8fb1c-2eae-0a2a0a5409dd-0a2a4505dcc6-10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 18:45:31 +0200
Received: from [40.107.209.15]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 69e8fb2a-aaa8-0a2a45050019-286bd10fe491-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 18:45:31 +0200
Received: from PH8PR12MB6771.namprd12.prod.outlook.com (2603:10b6:510:1c6::6)
 by PH8PR12MB7231.namprd12.prod.outlook.com (2603:10b6:510:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 16:45:26 +0000
Received: from PH8PR12MB6771.namprd12.prod.outlook.com
 ([fe80::6536:1008:9f96:f3eb]) by PH8PR12MB6771.namprd12.prod.outlook.com
 ([fe80::6536:1008:9f96:f3eb%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 16:45:26 +0000
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
 b=JNgelDCm9qID5tDiUkEXq5qJDj4H+6aHBLztkQSierCi9AALe+7orKgEG59e9j7GBawoCUYu77mKoL6HyTWxIQXMze69FBow2a6yD/ChVX1oxYz5S+8u92MWOk/tyM4BCUDBDaWWjOR9oPLXMGgw3j9falpmKFKHApji6ZE6fekjmfoP89rRV+kNI+s1NjUuOcg4eGqi6xXLXjobawFfZxWLaSDNHcune0JBZjuWZxorAo59ZfGn6zoCg4YzqRby8KlRq2fgetALYS4YyYQDy6yiPnaUBkPe0DV67yib1DEkqrNmnpTSMwsTDJbNwNjynSUfuqlTB/RCBq/uT9obXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1L0cHhYhKWukItgG6Pv/iZnhnVGXxoiCqOifSqAFSQ=;
 b=GrSB39WrvxWtA/jSGuqRgBO4VBmJpnyESRFQQiYxozJ3tke5CYLnkfv4fDKbSk4HzEao+vpAimzhaNs6eC1r9ODkC5SBzzaC3Ga9t6C65blUheEDDGci1Tiqm48FtL8LTur2aeHGH8lpSNRdlij+4KkETFLGUE1/2NiFKoJhe7DzcNCiZ7rk/yXQ2FAH0ns7m13U9rwOiwqUDGy/P4TSs7f0phTvwtWXf4ACGX3s8TbCD02dFifzs6L0BD+pQRlCWnGVFyVLw/ai7ntVLXdQdXhrCMggVPG4ZXso9DCbNqh+Oa6nA6zpcfEXZaxU8VaJ34xxmw5erHn8IBDFAU7mzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1L0cHhYhKWukItgG6Pv/iZnhnVGXxoiCqOifSqAFSQ=;
 b=CpUNWeHU7fnyWAdxLH+ZU4lf26Lp6SDgsbsgBlBDbkLM8XasyJxKQKcBMZu7zaIaN1BOaxZeBgaaoEmiJk5kHYvIcwtJ0rdElRm4uCkZzzpLI2cIWjPsMoXRz48Rza7DTtPtDssBwWFYDX67XL0MuNveWBfHMRjDwLJEY9dYXXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 1/1] arm64/insn: Avoid undefined behaviour in branch offset decode
Date: Wed, 22 Apr 2026 18:45:06 +0200
Message-ID: <20260422164506.2234095-2-edgar.iglesias@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422164506.2234095-1-edgar.iglesias@amd.com>
References: <20260422164506.2234095-1-edgar.iglesias@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0069.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::9) To PH8PR12MB6771.namprd12.prod.outlook.com
 (2603:10b6:510:1c6::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6771:EE_|PH8PR12MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: 26160dec-af7b-4d6d-b262-08dea08e8ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i7Rt8H65KhBaBpoD2I40a12R3Fkm7vSsVaq9ajKPzpTgKccO707ZL1FranQSxvESvrT33Xozigj+1e6fxbV8rFkieED9fTRHXpbRW1GMSKjkKaFhWZsf45FLXm0YnW/bVcn18K3rP8OL8aV2BZc2Cx+zA2AkdL14vrnB8KmoIP8M+NU3RQqjtACMNfd71/+hgFdq2T3GULr66e+JaHtRX+BtvmQUgok8gI9id/XHFv89oqZMdCbE8XMurLNyZMUxmQ0FxH3ZvynWi+28A/b2XA7eqm04Y4iGHNQFaUztgmGblBly6d9K82uOrTZcoDMg3JC0CSBMUw/UvRmW0iHqg4weHZ22sC0/qSZge6I7siSPpnJVq41EYwPzoUBdGi6xqnyiHEX9+ZTrnkSrqfz4zZ8Hq3ywtgGZ0+iCbwMJ5H9SJVImcMDHk03YU9JumB9lPkGFjLQy2q/Y1F1gUv9Ljl9V4Bfl7K6PB83y3rAeWpkWbErVY6MNQtWLh3wSUvRX0qaJmMoDnMKz7fuE87cRdFb1isNUjF0Od175iaSp/3gzUcySsN4MkUZl2rJveDOgABm4mZDvVb4IQmJYaTdC5die3FnEM2EYVNHDZdvNUdHPiJXyRaLdvA7BeUI1vdJrU4MwI5euEZt5XzKuoDruM0q1NTSstysJl/hh1Mihwq9HoQomYBdHzqr4QcUVi7Src+g8Lv+9P2R0yMUyZgQ5dR13cYqk/kTXfJKyOrjAlP0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6771.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jnNUzmfjhXkNmD0iAMIW3qKg2Bt+JnwriejaI7NIHycmwtMim+h7q2OWuaBE?=
 =?us-ascii?Q?aLJTgEzvlV0zvoW6WxCNmsbOjuYmzNyMC6kvU9vf7rKbMjYBulsDfWNQeRNO?=
 =?us-ascii?Q?DEMAMcBabXIXFHw9Y6vu8qmJZcrP89qcUaAU0r8JoWvpkrVEdV0JPDVfFidy?=
 =?us-ascii?Q?fHEf6YTWObXTaAylpQgP8k8awknvTeeBzjEaL1B4QRKQQLjKSzn3JbbJ7xeD?=
 =?us-ascii?Q?9rwa6tqeLoIIqVCFhINe++cZTkTnAG6AXAlSgcYQjHC9P/owsEzu3O+Nbt2B?=
 =?us-ascii?Q?mdQ4qW39671YH8QtTBH7iJ4uKBJLncXEoKyhB1yOjQnC5MiO92W1zt9MUULw?=
 =?us-ascii?Q?932hlAE9MMsehkhPG45/LDPNHFk2d/EakP9DrqS2qKYRXedFe28sAfnSmzMV?=
 =?us-ascii?Q?r0EiqvoStpjhm8gEiuPPxd3ZOqFE7UVGaDDpNHsU/u3AYKBuJT3m4Fj6NM6T?=
 =?us-ascii?Q?qejqIpU3Yh67zMV3qTkiw+eMeGVvBHaK9mCouenDtELyyt/V6ui9OXJRaZxe?=
 =?us-ascii?Q?IlS0a8gAExquwBlLar4dPn2aVxtRO7kRo8WAO7BQYG7Pz3cRz58MxcXU9TID?=
 =?us-ascii?Q?Kn3PUFoJKcO+rl54jgUmNrpBOmM4zhc6BrscHtX/8H5oSIM8c2dM+UjQTOwD?=
 =?us-ascii?Q?cieXsrQdEuhLW+gc7IlLV2XlaXpm+3MUIGz1kv0D9pO4ASuw3LOi3qRdffuI?=
 =?us-ascii?Q?icnpXd3we6a1cZGM2jC5Ok3dqwHZReOAsJwgWU0+059pLXDmYO1rwCfos9HW?=
 =?us-ascii?Q?YqioMrjzd2zXh6OHQ6/UqmSmAj8LjvH/rVrNPNz8tOjPStLjVUzn65KJwIP9?=
 =?us-ascii?Q?CziEILbXuTGjp5ldAq+Z1IXk4kDdIlaHTn3DR+BPHQCUMn6slDZ9hs9h9xFP?=
 =?us-ascii?Q?/fXDXWtPdqflUa9ZvdFftTP1mz84t/MfeRowrjbOYczUHlmd4arFPT/HdvVy?=
 =?us-ascii?Q?ReF8onePrbOlNvbMr11VBoCz7RRhhGoKZ8z00wxXQBCN87pTbNQk2j9lQsEJ?=
 =?us-ascii?Q?9wHzByl3KkfS3nVlgweLv+0trFH+IMOQG2drfC4biW3+hPu7FcMLnKNtRYkn?=
 =?us-ascii?Q?MZapwnSJd2a1r/OL7jTVILygIDGou4IqNdNxsewTxIGBK1QyTUn+Rs+qZTNz?=
 =?us-ascii?Q?PNijnWnM27SNVprbJn2Z6oyGRPEBdPGrjvfz3w6ags/VdZdHi7/cy/lyBypt?=
 =?us-ascii?Q?SIo6PHYxthaitJYB0vzYvg4ymT5vG0Xn89cGBjoTujljeQnJEBJWytr6Zhit?=
 =?us-ascii?Q?3eqdw8QKnlPCJU1iyi9tu00hm3BzPZ3vKGJ4V5ZpBy3Xnu3bR+xnHxpBdVht?=
 =?us-ascii?Q?nHqwrPC8OIp6jmEHB9JDMHCCtL87+p7HX48+cE1WrxJsiXvo7zAiu4ORfzYI?=
 =?us-ascii?Q?pyLpNW+q/qpQsU31Zn10hRWWIAhS1tSNbOXXJxeDK//teVaY7Y5qXgXFHbXJ?=
 =?us-ascii?Q?cRxif5LXXmW1aw0i7hR34MCKVjV+nQEgcWd3e6FczUG+BcrNR1KfScyCheq/?=
 =?us-ascii?Q?vtvmyLA7ALGKG6gzcgMA7qVBHDW+1WI+dFju/seVrWwSlvoxxyPKEplzzB4Y?=
 =?us-ascii?Q?Ro1bJRaPkoQP/Rbl48xtY80MTiyeMYKZBneLbTnamCvjK4Itn7RagUutVced?=
 =?us-ascii?Q?7ifvtZuJu3Iioz45agfhf5ZOWUyeCfSDUhRuRzFHxWPRYwkrMaPTnC3dAmK7?=
 =?us-ascii?Q?w8kj9XVrnmgBUAaV8f3RPkbLnOjxogYoGadOAD/IHnD+QqF1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26160dec-af7b-4d6d-b262-08dea08e8ddf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6771.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 16:45:26.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3b97cvISfc9wthMQFvsmnjd0sGUNH3ZOZuXNJyNAtx4ypmMsrik3fJIHg0DWe/4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7231
X-purgate-ID: tlsNG-c201ff/1776876331-E336C443-AA7481D5/0/0
X-purgate-type: clean
X-purgate-size: 1520
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:edgar.iglesias@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 08E1E448D39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Branch offset decoding sign-extends the immediate by shifting it left into
bit 31 and back. Perform the left shift in uint32_t and cast to int32_t
only for the final right shift to avoid UBSAN failures on negative offsets.

Fixes: 6dbf3f0e3074 ("xen/arm: arm64: Add helpers to decode and encode branch instructions")
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/arm64/insn.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/insn.c b/xen/arch/arm/arm64/insn.c
index 81f7914610..6b97a84ba7 100644
--- a/xen/arch/arm/arm64/insn.c
+++ b/xen/arch/arm/arm64/insn.c
@@ -225,22 +225,22 @@ u32 __kprobes aarch64_insn_gen_nop(void)
  */
 int32_t aarch64_get_branch_offset(uint32_t insn)
 {
-	int32_t imm;
+	uint32_t imm;
 
 	if (aarch64_insn_is_b(insn) || aarch64_insn_is_bl(insn)) {
 		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_26, insn);
-		return (imm << 6) >> 4;
+		return (int32_t)(imm << 6) >> 4;
 	}
 
 	if (aarch64_insn_is_cbz(insn) || aarch64_insn_is_cbnz(insn) ||
 	    aarch64_insn_is_bcond(insn)) {
 		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_19, insn);
-		return (imm << 13) >> 11;
+		return (int32_t)(imm << 13) >> 11;
 	}
 
 	if (aarch64_insn_is_tbz(insn) || aarch64_insn_is_tbnz(insn)) {
 		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_14, insn);
-		return (imm << 18) >> 16;
+		return (int32_t)(imm << 18) >> 16;
 	}
 
 	/* Unhandled instruction */
-- 
2.43.0


