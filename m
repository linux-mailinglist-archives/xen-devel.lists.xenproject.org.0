Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N9NAu3VwmnmmgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD531AAFA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261268.1554392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MW-0007EN-Vc; Tue, 24 Mar 2026 18:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261268.1554392; Tue, 24 Mar 2026 18:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MW-0007CB-QG; Tue, 24 Mar 2026 18:20:20 +0000
Received: by outflank-mailman (input) for mailman id 1261268;
 Tue, 24 Mar 2026 18:20:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w56MU-00077i-W6
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:20:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w56MU-00DbE3-Bg
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:20:18 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5d4-e002-0a2a0a5209dd-0a2a450591ec-28
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:18 +0100
Received: from [40.107.201.47]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5e1-5aeb-0a2a45050019-286bc92fd719-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:18 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH4PR03MB7771.namprd03.prod.outlook.com (2603:10b6:610:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:20:15 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:20:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/WoQcFDNLDlIOhIQxswMBY0hmWly9RhYJrWa6lJNVlwHMT3Ksl2WZThfXUkujRGK4AnS2MKRrDXTMhRSVIcbr2oAXdF0koeADNhwDFa4RJMhsdmjRlwCTYAK+q+dS6Tk6klATQ4txzEM7oY6T0X+bkgPqg6p5ZON8m4vFxE/5otN2k4Ml3bx3pVTytqEkNsodBBBjpP2425NeFSgimqDB6h8eeecjIt1q6V+nBifZlC8NY9/LsWfsrWXXY0uEtVZrhkUTkKGaqObsP9xHpHNCLTzMM+1ZH9ZDGeUWcYV2BYnKRzrZKwM+tHT6OY1pB4sBwSvexaW+H7iqm5Ik3noA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiBWs19smFfQj7jl5l/sB8BHje6+rBSArMs7K4Ftg74=;
 b=ES4HuuPRzI7nEM42ZEY2W0Kw/+tl0qqj6jwlKOKpGRGu9zTwMch4DZkuRj4dpMka5c/Me6Xtx94Ka0s6H9QmxYpMDT8NWN8bOSFivlq9UjXzqqLe9orN1bGbn/+f3h36dPqOOgoNhVIlTYNlRE99XpbYRBqgxF/D2IUQrZb88+Jq9YqkX93Z7JhAINT1PZl+4avkQwjCBYFkIljIsuZv3Va7XW5Ymq/fQpQH/491JaS9OZJSgoz2Kd3UiGc4w7ueBORbnhkm9DbW4fEACReI4V2gPVYsPrcMLfKSoSugYP0+CMsF/LxxyVUW/i3q5QhUG5cUw0P/bf3Z1iZfgx9oZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiBWs19smFfQj7jl5l/sB8BHje6+rBSArMs7K4Ftg74=;
 b=l1OBzMsiwt66qW8lL/GDGjlm+RfxjuNgeXTxQtdrdwAwjnJdCUwrAILJcKEPsbB2JNvwbi2tDNzm3vKIgxasRkn8hvqxNDYd5y4fzUOdYSs3MMqKtp4t9PpDmDekmj2OZrpvNjQFExeUvBQxc4qnvmOL5ep0QqHCjv/pZAKVgtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 8/9] x86/xstate: Stop tracking nonlazy xstate use
Date: Tue, 24 Mar 2026 18:19:36 +0000
Message-ID: <20260324181937.2465574-9-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0605.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::7) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH4PR03MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 30775e5e-b4c7-4494-8da3-08de89d1ff16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FyNcE6wnPIzCufqH8Q+pni52f8TTa3J/Q0ODvzgPsrtOy8dZWhl1g1VA9zHqn+dN3rYINLcwBGK+xUSG//2GOxipkYvZdkMqwxrOM8hZG723bFMd1kup7Vj5G94B+BKwE2qFkI+qQ3Jig4RyTivoe7WvoX0Xmaqc9OO349zTB3B42GVVQrt7xAq4vQH7cPBH8vmFSZAgkmDtViOJGcMpxTLDiJvER9UA0AFKwcCMH+T2GPhudz21ez5zqZnA5zJDYo9Tzbs7XPGVIhPdN2DStPBRZp+BUuvkLLINXRWsioSKAvFZw7KfwH+qGr6dSRrKTn6NFsw/IdfVMsw/+YVx2cjH65xz4AocWdkkb8y0l/4tHS/a/M+CjUuAwcAu6jLVPP7r9rAyOTCIaa09WwkpeF43h3RrmOMQYP/hbZJaDFiET253ka9p9QSYRlxxRJwDxu/JDa/e4I9xQQm+dLBdEzozn8C8os8Jixis/7HlhueAobczEAYzIUVC1H/8IGvGqArKQewab5L2E6aHpN7BYC5Ub3Hbui58yrAdpe3avl0tVYC9bm9yqhfwi71IQ31wUJ1dQox0D2wgfmoSjd1C0IriAw0eBP2rUsM67Jg4jkN9EgkvZq/ar/91lRRfBOFX68HNiGA0DIkQhFSyzDXKKyZMjDm2COJxHBFrvB6fVGpDfGahT7HU1Ddv3iFI8QzfS3edGMhQHjdA4HfHVDyGhCcCKOwopYJHcP6LLfxgGmM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QiY5Q/CGdxN9CkMS/fGPnmPFj9AlZN8VBY2ia47Blh3A3qUeM5kKh9Clwjfl?=
 =?us-ascii?Q?+byCTXbGW5GDA1YvLPx/MjWg7EhHo4SjypKcmd0pptcPdZcRfV5uqNYOV0iS?=
 =?us-ascii?Q?3DDTW1H0ONpEmRKRgzLnK1cOUhBrKV7vvjW3xEW3RiF5+ALthaO5MIE8Ru2Y?=
 =?us-ascii?Q?ep76rU0hGnbfXlPSaIg5wAuf7bc24xVniPFyjFFXC5vUcif0QQNChkdGhTqr?=
 =?us-ascii?Q?A0L/pCXd5lZkq/NOHdPZN8OgYV53WU3FI/jYefscK3SGxpM/ASLPDdUkT62N?=
 =?us-ascii?Q?c9RP8KEhS1Skfx8snxTzpAqkGSROU2lm9KVh6l86EPZnQdTFJoR8cn2EtA4c?=
 =?us-ascii?Q?avVlak0eICjWRz/sBb6KGdzlGX5bScj66DKvHeo4IcPVRzhxtyz++/dUAGzT?=
 =?us-ascii?Q?BpPvPX1Hm6pZjWKShvdvla6duIxmB+U5mxLQ5WCNQSS+nhU9bIVusWCFZpok?=
 =?us-ascii?Q?pcoXUjlz7ZdYA9N5PT0chINSf6g3rh75r5d6iryywCidcWXvknGNBCeiloMN?=
 =?us-ascii?Q?zz/BLnbZDDvbE+1/9Cd5YcGy6SO591UtrBakXm4H2L9UANvxyDwYr3m9kV3n?=
 =?us-ascii?Q?lYJVhLnzPmX3x6a15f0VoMuJLDOEqFF1faTo8tk7qwc+lIC/b4bhBfUosqjr?=
 =?us-ascii?Q?mO1NTBdturLwUHTifycrbnvXY8CY4Y01uypq3EKhAKbd/8fixUJ4KsNdKSPG?=
 =?us-ascii?Q?aPhhkupXqESQZ7Xpww2GfTI6nIVz2eF8G4vJecVflQKReGvVaoyqJagRtzZG?=
 =?us-ascii?Q?qppGFCSFHfeQaySNob95qSUyrkmFaBuid8NGjqGqyy5Fc6GBEXXfBA8Q0b6f?=
 =?us-ascii?Q?72S+MObDM2kfFWgR0njA6cp/9Tcqudt2BeOxF4VNG87jc5seLoXX1FR/VuyM?=
 =?us-ascii?Q?YFxHHJp2WBCrCuTTIj0Ewp/Ma+xNION7SgscNesgBS6NuOL+3FDR3X6IaZBx?=
 =?us-ascii?Q?8lnk3+rsCxhjJ8k9zg5N6FdqiiiV9wposwGK3wfSOWl+MchoYG+Eh1A3flSO?=
 =?us-ascii?Q?ybRlLjd41jyXsXO89kvvaEaDjbAVSoHSBpCIChnbZJAVekIk3/ZvO02pORdC?=
 =?us-ascii?Q?bGAmpuobA8L6hTH6v1Xj/ZKtshz1BI7SkslzCPmowv51DMBilRoE557h8cll?=
 =?us-ascii?Q?T2/nzonaElbG0ORMLXqx9YTwlDQddduQOcGQ4pKhpDVV3kZV24qQaT72w3Fi?=
 =?us-ascii?Q?RT9fZzHhcBESBv2OBjh61eoZGBxjurj+7MOyFDcykwGc6cJJ3W7ue7lACCix?=
 =?us-ascii?Q?wD6ZFuuQQe+tr/ceQS44A9auonsfEklHuwxq5B8aIezQ/psIFZxkBHQB9VJn?=
 =?us-ascii?Q?DN1uYJ8VpMkRfj6XMNGleTTKdN9hfw42Psy+pHn4Bc8CiQz081R2fvS5eLFj?=
 =?us-ascii?Q?DPxJZO8okV8S7J+HrTroyGSrIHjLA41yk4ic775mdugSSHxsgtRX9FmYiGX+?=
 =?us-ascii?Q?+h90DbEkloMuQBZJzOMQ7oxMHRJNle4kePWYWKGyx5oOAFAfNM7dKC/jyRXp?=
 =?us-ascii?Q?jjc3y1BLbX7ZSPdcChLlZMH/kSsNgnw6CrpONGdL3wCAOxpQshoAaWb3uMeR?=
 =?us-ascii?Q?/N46pMfP3HM7cddHKgp/avQ5Y6g2ntrFlg5UUDQkTiCEGUgUwU58Wgnfx5JU?=
 =?us-ascii?Q?5ul4TqaKNLBp1WsGREBF+lHJaBXHf1Ndfduqk2za1qlNRJw3bkMkiFwXJ1Jw?=
 =?us-ascii?Q?iZ6sik+qlIBKg3OYz8oaCAxdFu3xZOGXJLraKKE1ugFJYsJ9t5QvARSPR/Ga?=
 =?us-ascii?Q?onhN73tChFAmK1J7h/KtmbpMR1jVp9c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30775e5e-b4c7-4494-8da3-08de89d1ff16
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:20:15.4615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLxn13DSBBsldjgZ9V/8FlIaK5SEePyRnXrKmPrZz5HS9KYKvOzRsk3s+yqvXmobXoK+MBC3oC4ZBqWRBBZXj0LIjUeH39v63FIbSmjHhBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7771
X-purgate-ID: tlsNG-c201ff/1774376418-2368D488-17EFF41D/0/0
X-purgate-type: clean
X-purgate-size: 4855
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B1DD531AAFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the removal of lazy FPU, the full state is always restored on context
switch so stop tracking whether nonlazy xstate is used.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Unchanged in v2

 xen/arch/x86/domctl.c             |  1 -
 xen/arch/x86/hvm/hvm.c            |  1 -
 xen/arch/x86/i387.c               | 12 +-----------
 xen/arch/x86/include/asm/domain.h |  3 ---
 xen/arch/x86/include/asm/xstate.h |  6 ++----
 xen/arch/x86/xstate.c             |  3 ---
 6 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index d9b08182ac1d..a9fbb2d405b7 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1013,7 +1013,6 @@ long arch_do_domctl(
 
                 v->arch.xcr0 = _xcr0;
                 v->arch.xcr0_accum = _xcr0_accum;
-                v->arch.nonlazy_xstate_used = _xcr0_accum & XSTATE_NONLAZY;
                 compress_xsave_states(v, _xsave_area,
                                       evc->size - PV_XSAVE_HDR_SIZE);
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d4ba82845146..0e7b66d726ae 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1383,7 +1383,6 @@ static int cf_check hvm_load_cpu_xsave_states(
 
     v->arch.xcr0 = ctxt->xcr0;
     v->arch.xcr0_accum = ctxt->xcr0_accum;
-    v->arch.nonlazy_xstate_used = ctxt->xcr0_accum & XSTATE_NONLAZY;
     compress_xsave_states(v, &ctxt->save_area,
                           size - offsetof(struct hvm_hw_cpu_xsave, save_area));
 
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 5e893a2aab94..9acaaf4673df 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -108,25 +108,18 @@ static inline void fpu_fxrstor(struct vcpu *v)
 /*      FPU Save Functions     */
 /*******************************/
 
-static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
-{
-    return v->arch.nonlazy_xstate_used ? XSTATE_ALL : XSTATE_LAZY;
-}
-
 /* Save x87 extended state */
 static inline void fpu_xsave(struct vcpu *v)
 {
     bool ok;
-    uint64_t mask = vcpu_xsave_mask(v);
 
-    ASSERT(mask);
     /*
      * XCR0 normally represents what guest OS set. In case of Xen itself,
      * we set the accumulated feature mask before doing save/restore.
      */
     ok = set_xcr0(v->arch.xcr0_accum | XSTATE_FP_SSE);
     ASSERT(ok);
-    xsave(v, mask);
+    xsave(v, XSTATE_ALL);
     ok = set_xcr0(v->arch.xcr0 ?: XSTATE_FP_SSE);
     ASSERT(ok);
 }
@@ -202,9 +195,6 @@ void vcpu_restore_fpu(struct vcpu *v)
  */
 static bool _vcpu_save_fpu(struct vcpu *v)
 {
-    if ( !v->arch.nonlazy_xstate_used )
-        return false;
-
     ASSERT(!is_idle_vcpu(v));
 
     /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index bd7b02085ef8..385a6666dafa 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -667,9 +667,6 @@ struct arch_vcpu
      * it explicitly enables it via xcr0.
      */
     uint64_t xcr0_accum;
-    /* This variable determines whether nonlazy extended state has been used,
-     * and thus should be saved/restored. */
-    bool nonlazy_xstate_used;
 
     struct vmce vmce;
 
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index ca38c43ec1c3..c96d75e38b25 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -33,12 +33,10 @@ extern uint32_t mxcsr_mask;
 #define XSTATE_FP_SSE  (X86_XCR0_X87 | X86_XCR0_SSE)
 #define XCNTXT_MASK    (X86_XCR0_X87 | X86_XCR0_SSE | X86_XCR0_YMM | \
                         X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM | \
-                        XSTATE_NONLAZY)
+                        X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU | \
+                        X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA)
 
 #define XSTATE_ALL     (~(1ULL << 63))
-#define XSTATE_NONLAZY (X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU | \
-                        X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA)
-#define XSTATE_LAZY    (XSTATE_ALL & ~XSTATE_NONLAZY)
 #define XSTATE_XSAVES_ONLY         0
 #define XSTATE_COMPACTION_ENABLED  (1ULL << 63)
 
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 11d390cac985..658f372b8c51 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -991,9 +991,6 @@ int handle_xsetbv(u32 index, u64 new_bv)
     curr->arch.xcr0 = new_bv;
     curr->arch.xcr0_accum |= new_bv;
 
-    if ( new_bv & XSTATE_NONLAZY )
-        curr->arch.nonlazy_xstate_used = 1;
-
     mask &= ~XSTATE_FP_SSE;
     if ( mask )
     {
-- 
2.53.0


