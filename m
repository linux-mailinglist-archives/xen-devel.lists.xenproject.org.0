Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9N+KF7Mls2kMSwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F26C2797EC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253006.1549445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mtD-0007oL-AB; Thu, 12 Mar 2026 20:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253006.1549445; Thu, 12 Mar 2026 20:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mtD-0007kd-5T; Thu, 12 Mar 2026 20:44:15 +0000
Received: by outflank-mailman (input) for mailman id 1253006;
 Thu, 12 Mar 2026 20:44:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBWs=BM=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w0mtB-0006Bj-PA
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 20:44:13 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39ec5d5d-1e54-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 21:44:13 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH0PR03MB6979.namprd03.prod.outlook.com (2603:10b6:510:169::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 20:44:10 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 20:44:10 +0000
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
X-Inumbo-ID: 39ec5d5d-1e54-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwG5oXut7vqbXe8pKmroMCzc2RJRkWXAi0FWwK8tcLl/qL4gzhhcPomh+vMVZuU9YRNjof6IRH1mRdpU7igwScVhGc6ls+Rm5YKjiAKy1xWiX0nujIN3Q306xyQIFfAjgNTjDPTAztI3w1RzVPoQDRJ2MpLTvJTUoiTJwIHZHL6UPCROEyohQsEfzChUHDH3d5GrHVSxuQLbL/aMB2BxWIPRONC0IjqDTsPnGJMaKvEwUX8t/alKsBMaMqrbMh96zPCyrXfyYb3E/pezUQrXLMhyQxmR7SlMcfEPwpd4Y+RKivSJQm2tBmS0BTvrY+Pd9tnovOgI/8KSSXS1mqNacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0o9ybYsubF19k60JOis6AlLc6jRcwgP3O3U/ssKhw4=;
 b=uinerQgjhulfa+OEa6ETFDEJPvfwyZy0CtX4wWA048lZVIUhdJIotVcbgKJtrYCetBMKFM+jldkXajsM+Ve9LcSDfcuEyxGvQ5qPcZNml+Gtm3WM3dS40TJzP/J4tc28qu7qyNh9y0OtmyplM4w/rVoOeCWukZAoWc8CC4NLX0AWG/JZ/BYuD5b/ioxmSafEc0OqnOda5PuNbBPhdw0ZV3oEH8kZmPV6Np8m+OAzLLQOXqdY6gt2syRmwHSEuCzk//Dcl1HhZk4HXf9BDUPZBCeYExcXsS6twOxSju4BIIAT5nogySi0nbo97ppXOZFQt/sD2+P7nj2+IDGpP6HJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0o9ybYsubF19k60JOis6AlLc6jRcwgP3O3U/ssKhw4=;
 b=y+HjgRKIjBB3dUFd5PB9yN757Q2AYaY9kuIb6kIp3A+8CKk/oxwIEVxKx/0gOdapDca7W8PAPPlkjMf68LAkCuno1EfJLzZ+4ricXWk9tJsHSVcerpfemyWAru6BiXL/nhrx4Jik+kl5mR9nuFOakW34qMkzBXyBgsTKxL4Nu+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v2 5/7] x86: Remove x86 prefixed names from x86/cpu/ files
Date: Thu, 12 Mar 2026 20:43:37 +0000
Message-ID: <20260312204339.740403-6-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260312204339.740403-1-kevin.lampis@citrix.com>
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::11) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH0PR03MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3b4f0c-1591-4fbb-f92c-08de80781cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	34l+ql4KHgVLMDMiqPXKo0oyvVGpL+bCXc6jcScFCyoPQWdrHuf4HLaddNAuuQ6FUXr44wHgFUhi5ibgB6U8BoGBaGcVMFQunc1Rx4hX6tgcQS068LVrsSam/o0M79RZ3BSBojR/4BXSwUGrt4PEy0/kZzSD7D43MRj6DQFQB+56rPjZ5o0oMZNy17QBKl6RtCh2LZIVVaYh1p/M+UnfyMUKG0nhS4TRWmBR87VOkSGf4SbACTes8D4ABEYzOYsIvyYVMMyqN5PB5o048Xw1jVfRQzZc8BRurPEND+atB1LQj4f4dK3b/st8Q6gUJhG9n6d/PYTh5wAoSuGg6d1yuP2YwQaQey/8z7PPoha304sCDmx1imb5fAvj5MDViGHU3a2nupg4IUYjgdP3Wbm0PStbCV8O4DQrjIg+OuyCxR5pHJlUpjV6XAKkoTvoGZCyy4Wh65VRGjV12K1KGCqdqOw5HddYphm5klwAjn/xwDkDXtYHi6Wipw5OARBh4S95rVnwLREfF1crr9Gz6/wkB1Pu6CE1XmMZGDQzIRLvjk4wifkWISZJGM8d2Z3ZywOsR1mU5IzaQdg9fxE7EpOb6PlzjBklBxW0/lThE/rm7XB2Jf3kZp43evYXtp0DDmug7fvbOePCeYGfv35p1u7FzPWMal2QRbkuzJtAJ/UgUw1Epm9zZe2AmyTJtjOawS+NbccKVdzhN6qoVCpvdFkb1hr+nQc7A0Mt3y/UbPzipTo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P8fNO/MINTdSdgkyGvrqrhQahlb9MG08lsQf9WCIOl0vLnNl6rcbrWk5WprI?=
 =?us-ascii?Q?OClFl8CDZA18J0wvcPd4VqlExrHU17Et/LLvYBaAcXcvFj0nYMV0IxXtZ265?=
 =?us-ascii?Q?vrkiHg1ycVw8LO5Auh7cYOwkTgH9/Gie3Fiepv65ileAUMzWHBvVQ8c/Ik5w?=
 =?us-ascii?Q?4CWjKp1tSsJkk/2PhSPS7Lm/JBTXkXFwlIpPdqtekwSAYBRiC+T9hFf+F7aY?=
 =?us-ascii?Q?LKb/0Aw33YSYyA08r7vDRUBCIjSkquCTsck3iiASgLfHIwUcDwzqYUjS70/U?=
 =?us-ascii?Q?o4k5aNhki1peiSc7LEG6LS+9RvpKngLbR1T+c03K87Wbl4Axe9WjxdUpSjgb?=
 =?us-ascii?Q?FArp6a1y565y7xvL064Rbc38yJrmtyQquGOQRyzDUocnC27vz+ovArPuB9aC?=
 =?us-ascii?Q?8fXXcT+TfRjg4DfNmJ5MEYjnB5FCNSztsW5Ro/sjaDe5tN1IgmT8F67M2BXx?=
 =?us-ascii?Q?7LEC+CN6GtraitXXWYZr6jSA8WBYRkRWspxt2UOUHYgUigb25Ij3Z2IFEqQo?=
 =?us-ascii?Q?XIn+Pc04R5+7GvpS9fc8KkEq1YsR0vhZko3QiuIvAkND+D5P8ByQ6NrQAc7e?=
 =?us-ascii?Q?j7dEGuziojMJvgcz351lHTrA35XPvP1KGN7uIFfU+EYoG8mitOdFWzkuL+IY?=
 =?us-ascii?Q?NAEV6vB7j7Bx3KISUzD/plm2+CEGWXJSB8+KDOKoxC8FDnudl2nmqC51GUFI?=
 =?us-ascii?Q?zqZLfEsCG6PqPs+V/9rzKNUsq27X5n3fUMoDfqDZ/9o/A0/dobaBriaLTzDz?=
 =?us-ascii?Q?OYaREx7XXLbgDgH1g0x0Oenp6TGqWFcBbaW+BTZ8W5UoN7YrAfFlQMG2nnNl?=
 =?us-ascii?Q?u4lzWxClKSBOLZuT4a6ARb83UASh1RygUxjAjETY84t8MgWQLPe3zRRuILu0?=
 =?us-ascii?Q?tBXsQ13lIWJsSUGoLgX/Gp69MQugP2gQhry4+S6b2JqGCZS0/DCfMo7wJXIX?=
 =?us-ascii?Q?1JP1Y1q3sqSy2Fw+4pn5B4XGdvZ60jyH6hKpuKBNegB+4OuMeqY6TP8Ch2Wm?=
 =?us-ascii?Q?8AGBcLCKP5MCtaNC0JhEj1gsl7/PQaMoONOWukvMOVZxUTun4Vy007J/Ylt2?=
 =?us-ascii?Q?9ETWe8QEqT1vcqFTqRKWr7jy/Zxvq2tgVZZ7NJRFf2Ut06IhBBFurY6CWZK0?=
 =?us-ascii?Q?+Qpu5Ftkt04sH12ktu8jlr7vgp4Hu82WvAlVU362gLbpyedD+E0xutAkEVE5?=
 =?us-ascii?Q?kIKh6wmbqbVKg4fCVIyfXvamTDGGKeiWEDoZOIaX9f1RoNnMrw3yawFt+vi6?=
 =?us-ascii?Q?5cvaJ3Q+z5JEHAJbDYLR03p3aW9krKRLokPyzFwB/bEZ2DA3O+VwHJD1OMBh?=
 =?us-ascii?Q?U6YMGBeSUcZhhsQYHx8mkqjQBxG5Q9d6fy0wFJ2E4wKC+soAI66ZpOnqG+De?=
 =?us-ascii?Q?85q+r1LWIlsbA1s2euJFEq140nW1M1yNgcDqv4lmrkCB3MgSWe/mutXHCpgd?=
 =?us-ascii?Q?ZhJSUdGtoTOAoN6TMcOIIUaX0c8AChxJ5z2SqLMGjN8SJWIwCRTzsz1e4O7+?=
 =?us-ascii?Q?9bc8xwh+TBMudfqZDNBcUzfio4KUmMUsOTI++sb5qPboQjt38A2hw23zbedI?=
 =?us-ascii?Q?F3eGuIxdC+zySaS9G8JidqXPOjnR/FsPPG1OY+scU/N9Uue8Ug2qhc2+iq6K?=
 =?us-ascii?Q?fXLDzdNDUwnBwHWD040VSj+cfI2UH9LYw9kXA7ecOVMMXZobeX+iv1TBXSfx?=
 =?us-ascii?Q?v37qyWbmiBfoOgeYHSu+jApTmdKOzJv7wys1ADZHCaNA4Z/iBzwNRuHuNgVQ?=
 =?us-ascii?Q?tf/UXC3QSw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3b4f0c-1591-4fbb-f92c-08de80781cc1
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:44:10.1132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKzbMzWF+yQ4WduBdhHupxlD54RuCX4hJjRi1w65mJIN7D+SJMH0mcGjifPrAvrLXL6Ja66ZR93fZGrQGWfGdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6979
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,current_cpu_data.family:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9F26C2797EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

This work is part of making Xen safe for Intel family 18/19.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Switch uint8_t to unsigned int in vpmu_arch_initialise()
- Switch int to unsigned int in vpmu_init()
- Remove XXX comments
---
 xen/arch/x86/cpu/centaur.c         | 4 ++--
 xen/arch/x86/cpu/hygon.c           | 4 ++--
 xen/arch/x86/cpu/intel_cacheinfo.c | 6 +++---
 xen/arch/x86/cpu/mtrr/generic.c    | 6 +++---
 xen/arch/x86/cpu/mwait-idle.c      | 4 ++--
 xen/arch/x86/cpu/vpmu.c            | 4 ++--
 xen/arch/x86/cpu/vpmu_amd.c        | 6 +++---
 xen/arch/x86/cpu/vpmu_intel.c      | 4 ++--
 8 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu/centaur.c b/xen/arch/x86/cpu/centaur.c
index d2e7c8ec99..9123b05dc1 100644
--- a/xen/arch/x86/cpu/centaur.c
+++ b/xen/arch/x86/cpu/centaur.c
@@ -41,7 +41,7 @@ static void init_c3(struct cpuinfo_x86 *c)
 		}
 	}
 
-	if (c->x86 == 0x6 && c->x86_model >= 0xf) {
+	if (c->family == 0x6 && c->model >= 0xf) {
 		c->x86_cache_alignment = c->x86_clflush_size * 2;
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 	}
@@ -52,7 +52,7 @@ static void init_c3(struct cpuinfo_x86 *c)
 
 static void cf_check init_centaur(struct cpuinfo_x86 *c)
 {
-	if (c->x86 == 6)
+	if (c->family == 6)
 		init_c3(c);
 }
 
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index b99d83ed4d..7a9fc25d31 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -41,12 +41,12 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
 
 	/* Probe for NSCB on Zen2 CPUs when not virtualised */
 	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
-	    c->x86 == 0x18)
+	    c->family == 0x18)
 		detect_zen2_null_seg_behaviour();
 
 	/*
 	 * TODO: Check heuristic safety with Hygon first
-	if (c->x86 == 0x18)
+	if (c->family == 0x18)
 		amd_init_spectral_chicken();
 	 */
 
diff --git a/xen/arch/x86/cpu/intel_cacheinfo.c b/xen/arch/x86/cpu/intel_cacheinfo.c
index e88faa7545..a81d0764fb 100644
--- a/xen/arch/x86/cpu/intel_cacheinfo.c
+++ b/xen/arch/x86/cpu/intel_cacheinfo.c
@@ -168,15 +168,15 @@ void init_intel_cacheinfo(struct cpuinfo_x86 *c)
 	 * Don't use cpuid2 if cpuid4 is supported. For P4, we use cpuid2 for
 	 * trace cache
 	 */
-	if ((num_cache_leaves == 0 || c->x86 == 15) && c->cpuid_level > 1 &&
-	    c->x86_vendor != X86_VENDOR_SHANGHAI)
+	if ((num_cache_leaves == 0 || c->family == 15) && c->cpuid_level > 1 &&
+	    c->vendor != X86_VENDOR_SHANGHAI)
 	{
 		/* supports eax=2  call */
 		unsigned int i, j, n, regs[4];
 		unsigned char *dp = (unsigned char *)regs;
 		int only_trace = 0;
 
-		if (num_cache_leaves != 0 && c->x86 == 15)
+		if (num_cache_leaves != 0 && c->family == 15)
 			only_trace = 1;
 
 		/* Number of times to iterate */
diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index c587e9140e..190be7f1b4 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -218,9 +218,9 @@ static void __init print_mtrr_state(const char *level)
 			printk("%s  %u disabled\n", level, i);
 	}
 
-	if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-	     boot_cpu_data.x86 >= 0xf) ||
-	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
+	if ((boot_cpu_data.vendor == X86_VENDOR_AMD &&
+	     boot_cpu_data.family >= 0xf) ||
+	     boot_cpu_data.vendor == X86_VENDOR_HYGON) {
 		uint64_t syscfg, tom2;
 
 		rdmsrl(MSR_K8_SYSCFG, syscfg);
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 5962ec1db9..6776eeb9ac 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1637,7 +1637,7 @@ static int __init mwait_idle_probe(void)
 		lapic_timer_reliable_states = LAPIC_TIMER_ALWAYS_RELIABLE;
 
 	pr_debug(PREFIX "v" MWAIT_IDLE_VERSION " model %#x\n",
-		 boot_cpu_data.x86_model);
+		 boot_cpu_data.model);
 
 	pr_debug(PREFIX "lapic_timer_reliable_states %#x\n",
 		 lapic_timer_reliable_states);
@@ -1816,7 +1816,7 @@ bool __init mwait_pc10_supported(void)
 {
 	unsigned int ecx, edx, dummy;
 
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+	if (boot_cpu_data.vendor != X86_VENDOR_INTEL ||
 	    !cpu_has_monitor ||
 	    boot_cpu_data.cpuid_level < CPUID_MWAIT_LEAF)
 		return false;
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index c28192ea26..470f5ec98d 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -398,7 +398,7 @@ int vpmu_load(struct vcpu *v, bool from_guest)
 static int vpmu_arch_initialise(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
-    uint8_t vendor = current_cpu_data.x86_vendor;
+    unsigned int vendor = current_cpu_data.vendor;
     int ret;
 
     BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
@@ -815,7 +815,7 @@ static struct notifier_block cpu_nfb = {
 
 static int __init cf_check vpmu_init(void)
 {
-    int vendor = current_cpu_data.x86_vendor;
+    unsigned int vendor = current_cpu_data.vendor;
     const struct arch_vpmu_ops *ops = NULL;
 
     if ( !opt_vpmu_enabled )
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index d1f6bd5495..943a0f4ebe 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -532,7 +532,7 @@ static const struct arch_vpmu_ops *__init common_init(void)
     if ( !num_counters )
     {
         printk(XENLOG_WARNING "VPMU: Unsupported CPU family %#x\n",
-               current_cpu_data.x86);
+               current_cpu_data.family);
         return ERR_PTR(-EINVAL);
     }
 
@@ -557,7 +557,7 @@ static const struct arch_vpmu_ops *__init common_init(void)
 
 const struct arch_vpmu_ops *__init amd_vpmu_init(void)
 {
-    switch ( current_cpu_data.x86 )
+    switch ( current_cpu_data.family )
     {
     case 0x15:
     case 0x17:
@@ -585,7 +585,7 @@ const struct arch_vpmu_ops *__init amd_vpmu_init(void)
 
 const struct arch_vpmu_ops *__init hygon_vpmu_init(void)
 {
-    switch ( current_cpu_data.x86 )
+    switch ( current_cpu_data.family )
     {
     case 0x18:
         num_counters = F15H_NUM_COUNTERS;
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 1e3b06ef8e..ed9f62b936 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -917,7 +917,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
         return ERR_PTR(-EINVAL);
     }
 
-    if ( current_cpu_data.x86 != 6 )
+    if ( current_cpu_data.family != 6 )
     {
         printk(XENLOG_WARNING "VPMU: only family 6 is supported\n");
         return ERR_PTR(-EINVAL);
@@ -958,7 +958,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
               sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt;
 
     /* TODO: It's clearly incorrect for this to quirk all Intel Fam6 CPUs. */
-    pmc_quirk = current_cpu_data.x86 == 6;
+    pmc_quirk = current_cpu_data.family == 6;
 
     if ( sizeof(struct xen_pmu_data) + sizeof(uint64_t) * fixed_pmc_cnt +
          sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt > PAGE_SIZE )
-- 
2.51.1


