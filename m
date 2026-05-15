Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBJlJgydBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB54754922E
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309427.1580495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjtr-00016a-Jm; Fri, 15 May 2026 04:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309427.1580495; Fri, 15 May 2026 04:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjtr-00012Z-Al; Fri, 15 May 2026 04:11:47 +0000
Received: by outflank-mailman (input) for mailman id 1309427;
 Fri, 15 May 2026 04:11:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjtp-0000cR-HX
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:11:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjto-0052Iz-To
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:11:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069cda-e002-0a2a0a5209dd-0a2a4505a2ee-16
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:11:44 +0200
Received: from [52.101.125.85]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c47-aaa8-0a2a45050019-34657d55753b-6
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:44 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3682.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 04:08:38 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:37 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efameixzV3YdFN2nHjhRRAOH5H4xfgb4WQ2AoAJyKC8q+1m3ptBVkOzjD03zgtJznD7jKMZ9yaVgnaaBbN4ah9KUqWIgnojfG+y/KkxmRbIYy5Q6rOFhcU+rjNI4qipvdq3CxKJZHEFFt6CzaSWwXKzUAXwQxz9wjh5qlD4o7tGKf9VnemBU+XkpTjqWOutxJBTM3QIVhXH+b0UfxpQT6PCKdA/Zg1rbA1EdlfOQlsQMR8JFEZ/TTSBuvkY1ovIynAFzaerlsxV1p+HAJwCX19TK/vwaeQehie4dHTNbNn6/7svmn1Ha0SyUawXsOpYG+L9eQiwNRlfXuU824v0FJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZt2u209lxJwRTGsQreVWEB2rCTZ+thSoguR7zx4+Mw=;
 b=jXRttVjpvxTyf219O4xrYBUfZ8lHl3Fx/rPnFhwDV1E9lEWfPp2jvwGX5JYmDiZoHQesjUtSl9O+Ebq1HUTot+BI5fPeBrPhZEuytmtrW3lzUhIgfAQEcY1k3SLngQuqswdZdMr56+ql2/0dLvE+Lc04GYcM9/z8ncrTBw9U9kGTyrvJ9c/gd3/0TCVk5v5YgsyLsMzwLc4rjF+yCiWdfDlF6J1MJzt1nftVA1hROjKw/1yirbNWPh6nQaO8YbqEFR5ivpN2qpETEeP4C6Gk85LyPUXrUdZmjsE0Lu2E1/0Mc37XuPk5f219xoxdywhGacPqqrfNiPnaSATcINYN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZt2u209lxJwRTGsQreVWEB2rCTZ+thSoguR7zx4+Mw=;
 b=ZFCmTGG3gO6wGvuT9WMaeIGF9mjaYPRDTeMxxg04l1qk2i7qD6fQ9BBgMnGcsEgu9oCWoHDrE65jBemd4ZoxP2mYIkfwhq7Xkj5d5a4kQ7JO8iCwOd9nbO+1zhmXkloYmeRxqsrQQ1pxRrkpqNF4tiDCEwmbLmcTpXGJBGJoGaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v1 22/26] xen/arm/cca: add Realm REC enter path
Date: Fri, 15 May 2026 13:08:08 +0900
Message-ID: <20260515040812.983626-23-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0236.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3682:EE_
X-MS-Office365-Filtering-Correlation-Id: 29718a0d-624e-42b4-f1dd-08deb237a2d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|56012099003|3023799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bopRT44LQqsNg23U5FdXaQZRE3fQ0y9lcr4G8M9Qo5yMUreTLmRDGEkISUkEh759PBRplMBq50aSkaH9fmI/kn1qZnG9ZM6yX2Fy/cs7a/4qPWUOdBdQUJzxWvFj76Gw9ijiKTYAh+bFa3SVxm8J8qegxdRcR32Ejkc5l/6VRLS1cIimru19K7vr+TGGonvCFtgmdvfbQ6J1Ys2dthrRKpuQ35i5i74ZpqsRDNpsr+JeU4lyIc63PQ5M0L/ZYUkvtJvqwvaecfBSaSl9z9QUJUuAtlsOyMOo0+PY9+mQjwOIjpW4NBODBOn77WtuoTIN+vujcJZE7N43oGHdUGYCcf02Fd3+Vur3ekhV+ZXHuDNyZ3k1sJjhmehnl4mhHDS4oKXFBUOMr6fd3U+pCyFXmOMSJU7S2cd0kHDoKq3ldllT8igJu0W7rayErXG8mXW2KCVe2TyB3tA5WcQmfVr/HfYQkw7I0vnoaHbblZsXsvXex5HS9ASEb2PcJRzUTH4OUYbsoNEv9Ipe8J3Z+t4rCAqXaHvwkIuexyTeWMlafxb8JuxuVEyabsSpXTyfwnZvjhYETNnPBxuMBRh3s+g155FgGgp+shRshOOIYrajQ3bdEZA5wNtcY6kEqZ13VS31gouvm+C7FVib9VZW4e0PCIj6F0iHaXF5VuY7I0EdndVCnGTaFCVIRzPBAEwoVzRf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(56012099003)(3023799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9ckVzyc2dNMCdWnehXYETIQ4hV0gd8waLorXzy0YL2tzZH1Zz0VI4CJgEtu2?=
 =?us-ascii?Q?CJ3lLUaakIcSvgMw7UA3Ld8nERzeU6UQF9ywQiy5Zpn8rVsCcrZIcQFN7BSO?=
 =?us-ascii?Q?qhxq9avg3XG9RvxzQQkF8KmzH9vYcAt2k4ytB+5rf1JOLzBrnIo877Vvwy3I?=
 =?us-ascii?Q?X+NM5zceFXXip8Qz6bX4WRl2/fr+qqJpvimF+/eHLK3GKBj6lrQiqJy4o0oW?=
 =?us-ascii?Q?zVqjCMEaKIOK13KXecuCgAHTkiP04YAw9IgZ4cnhW09FET7CEVCqcjSMwXzG?=
 =?us-ascii?Q?orzsZUkSC7nF89ecMkNPqAOIIIXr7dXaGvSsZI/km+H98DN8dfcCx1EZdV8g?=
 =?us-ascii?Q?uMg/IuC38T24si1mBAGVJ1Rb75Ip2lF19ZYvY5xaZpYdjMWBNOmT0J1Gnx2H?=
 =?us-ascii?Q?jlNxE10gDSQtCjiZUN5urjkbOsmeBUrfcNeN60q8Aqxhu2QZ39R210DrkeT3?=
 =?us-ascii?Q?fpA/inI4dgvltDmf+C/3vbPmayBHGUJ+MZD0G9q19oLNVA0huBx3XOKR0qto?=
 =?us-ascii?Q?UGZ67OHe98FhllWHXRUFBDsYtdCFJdaXiTZZdw4pISFn2utyqROYBmkRL3yI?=
 =?us-ascii?Q?WAzauwzDukKFONcXkPVaGlvCKGVyGxbrMOxD5kOC6B0zKrteSpUiBg+R3dyA?=
 =?us-ascii?Q?XsYT8lCn4dDa36omsVvZue/j5+kYSUxl+rmLZuk06tgaz8J2bBY96ztN1w0P?=
 =?us-ascii?Q?4Ju1GoLvo7vkwyDuTceGK4NVIMc/+FAJrIky8rsG3UYs5WohOeZTcj8Oi+H+?=
 =?us-ascii?Q?RAKR4E/WqMTiWMlIUohpCB1WJ7LrTw2o2gEgUvIKRWL5e+qOgRRhKL0Akl5h?=
 =?us-ascii?Q?Tg+HlyiyGO5c2UxMQjL3UGTkZUkdwA1N5KLU2ecjltua9AwyOsH8zRAnFx9A?=
 =?us-ascii?Q?2+v3bc+3rbqcr8myh818C13tE+B+zUfICbOJlspRddbbNUYlNTZVYJlS7dBA?=
 =?us-ascii?Q?LuBn0FYZy/RAYSEUOcUI9C+ViikaipaDF4jgYTsWuU8H2stR2G31dFZABont?=
 =?us-ascii?Q?QroMwpMd5KypvzfZjHCoE+IYHDNClVJA1B8K4+3JBYi8afNc0zRRP15qb+ZG?=
 =?us-ascii?Q?sT0IVDQ8MRVvGMiQYHNfpZUDzN8sG3e6ej1Pibzz2mL4oD8pD7Uqy2saPEOy?=
 =?us-ascii?Q?w9VVBGQIAUDRC7HxabVCnklVz4mWgc5DeoeHEYcNdaCgyzczzSTCTfg40yuZ?=
 =?us-ascii?Q?LCBrE89vSssGLXwWRSW+zTdFHD8lFCsd/fqrVFZVGhvCFcgtsRLMW6PaueBO?=
 =?us-ascii?Q?X0sPFHqzvxfthdAwPHB/8J7QwIj6KsBnBhB6ry/PtcZ71daZYH7VG5RwtMGW?=
 =?us-ascii?Q?x03fjlxAW24/MmCADhzQZV+hHsz8Q7NSI9Akl7Ph7tjOdraJihjGyvKyzbcX?=
 =?us-ascii?Q?6P8kLgta4qcOBH3cGfeI1pg1FRStMCnuWIbC6Dsx0TqI6owkAHh0sA+1ojFj?=
 =?us-ascii?Q?TKzJfUmBxSl1bg+JjLqfLvAap70nqS+Vpzd6MIXRF/HX6KshgWgLwc4oku/M?=
 =?us-ascii?Q?6KW9GR8j01xR3EbSLe3rWCwppG+3GGS9FEDvramNmMf7PhV7VRMuSCORoCuP?=
 =?us-ascii?Q?H5E8okzNPr/nzGskMVbOD5CaeOYLxkO/rkvuLjici6SBarSVSRLTOxJd4HrS?=
 =?us-ascii?Q?ADbPhvRE2CvdD9mHyGWKm/Q3AaZK6gZjBmjDlA8HWAjzFIY+AqowCwJ5GpuB?=
 =?us-ascii?Q?P8RttjDNBkLGTpm9Z18p8ppDBcwtEmYi53/eVCjnTqbwkUOtVwZk6+2CuKqx?=
 =?us-ascii?Q?cc2F+i/8+fTjvIis4HVp+v2uAhB+FX2+n00Z7h0YR/yjcwW8kdHD?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 29718a0d-624e-42b4-f1dd-08deb237a2d1
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:35.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKmsCdjKJ8vpx90DBOIOfW/OxaAq3UQvlUw2NLGvjh6rHLTKZIyrdWhNugOgiihwwfqFGLUjPgn2q8Qxv135Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3682
X-purgate-ID: tlsNG-c201ff/1778818124-E0C65443-40950EE5/0/0
X-purgate-type: clean
X-purgate-size: 25164
X-Rspamd-Queue-Id: CB54754922E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim,hsr.ec:url];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Add the RMI_REC_ENTER loop for Realm vCPUs. Handle host events,
vGIC/timer sync, WFI/WFE, MMIO and PSCI exits.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/rec.c               | 672 +++++++++++++++++++++++++++
 xen/arch/arm/domain.c                |   4 +
 xen/arch/arm/include/asm/arm64/hsr.h |   1 +
 xen/arch/arm/include/asm/hsr.h       |   4 +
 4 files changed, 681 insertions(+)

diff --git a/xen/arch/arm/cca/rec.c b/xen/arch/arm/cca/rec.c
index 8314a7a45d95..efff7fa48745 100644
--- a/xen/arch/arm/cca/rec.c
+++ b/xen/arch/arm/cca/rec.c
@@ -1,14 +1,56 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Dedicated Realm REC execution path for Xen/Arm.
+ *
+ * Key points:
+ * - The Realm executes under RMM. When it accesses emulated devices, the RMM
+ *   causes a REC exit and provides ESR/FAR/HPFAR plus exit metadata in the REC
+ *   exit buffer. With RMI v2.0, vGIC LR state is exchanged through the real
+ *   ICH registers rather than REC run-buffer fields (unlike RMI v1.x).
+ * - Xen bridges such exits into the existing Arm MMIO emulation backend
+ *   (try_handle_mmio_regops), which already services vGIC and other emulated
+ *   devices for non-Realm guests. The emulation reads the guest GPRs and may
+ *   return a value to the guest. We propagate that value back to the RMM on
+ *   the next REC enter using the RMI REC_ENTER flags/gpr0 contract.
+ * - Around REC enter/exit, Xen synchronizes the vGIC directly with the ICH
+ *   registers and feeds the REC exit timer snapshot into Realm-specific
+ *   timer state.
+ */
 
+#include <xen/bug.h>
+#include <xen/errno.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
 #include <xen/timer.h>
 #include <xen/xmalloc.h>
 
 #include <asm/cca.h>
+#include <asm/current.h>
+#include <asm/domain.h>
+#include <asm/event.h>
+#include <asm/gic.h>
+#include <asm/gic_v3_defs.h>
+#include <asm/hsr.h>
+#include <asm/mm.h>
+#include <asm/mmio.h>
+#include <asm/p2m.h>
+#include <asm/processor.h>
+#include <asm/psci.h>
+#include <asm/sysregs.h>
+#include <asm/system.h>
 #include <asm/time.h>
 #include <asm/vgic.h>
 
+#include <public/sched.h>
+
+#include "rmi.h"
+
+struct arm_cca_mmio_ctxt {
+    const struct arm_cca_rmi_rec_exit *exit;
+    register_t result;
+};
+
 struct arm_cca_timer {
     struct vcpu *v;
     unsigned int irq;
@@ -23,6 +65,13 @@ struct arm_cca_vcpu_timers {
     struct timer wfx;
 };
 
+/*
+ * Keep Realm guests on the GICv3 sysreg CPU interface. This vGIC path has no
+ * IRQ/FIQ bypass, so ICC_SRE_EL1 is exposed as a fixed SRE|DFB|DIB value.
+ */
+#define ARM_CCA_ICC_SRE_EL1_VALUE \
+    (GICC_SRE_EL2_SRE | GICC_SRE_EL2_DFB | GICC_SRE_EL2_DIB)
+
 static void arm_cca_timer_update_irq(struct arm_cca_timer *timer)
 {
     register_t ctl = timer->ctl;
@@ -88,3 +137,626 @@ void arm_cca_vcpu_timer_destroy(struct vcpu *v)
     kill_timer(&timers->wfx);
     XFREE(v->arch.cca.timers);
 }
+
+static void arm_cca_timer_program(struct arm_cca_timer *timer)
+{
+    s_time_t expires;
+
+    migrate_timer(&timer->timer, timer->v->processor);
+
+    if ( timer->ctl & CNTx_CTL_ENABLE )
+    {
+        expires = (timer->cval > boot_count)
+                  ? ticks_to_ns(timer->cval - boot_count)
+                  : 0;
+        set_timer(&timer->timer, expires);
+    }
+    else
+        stop_timer(&timer->timer);
+}
+
+static void arm_cca_timer_sync(struct arm_cca_timer *timer,
+                               register_t ctl, uint64_t cval)
+{
+    timer->ctl = ctl;
+    timer->cval = cval;
+
+    arm_cca_timer_program(timer);
+    arm_cca_timer_update_irq(timer);
+}
+
+static register_t arm_cca_mmio_read_reg(void *ctxt, int reg)
+{
+    struct arm_cca_mmio_ctxt *mmio = ctxt;
+
+    /*
+     * This callback is used only when Xen's MMIO core emulates a write and
+     * asks for the store data.  For a Realm emulatable Data Abort, the RMM ABI
+     * does not provide a full guest GPR file indexed by ESR_EL2.ISS.SRT.
+     * Instead, the write data is provided in run.exit.gprs[0].
+     *
+     * For an emulated read, arm_cca_mmio_write_reg() below captures the value
+     * produced by the device model and arm_cca_set_mmio_result() returns it to
+     * the RMM in run.enter.gprs[0].  The RMM then writes it back to the
+     * faulting guest register selected by ESR_EL2.ISS.SRT.
+     */
+    return mmio->exit->gprs[0];
+}
+
+static void arm_cca_mmio_write_reg(void *ctxt, int reg, register_t value)
+{
+    struct arm_cca_mmio_ctxt *mmio = ctxt;
+
+    mmio->result = value;
+}
+
+static const struct mmio_regops arm_cca_mmio_regops = {
+    .read = arm_cca_mmio_read_reg,
+    .write = arm_cca_mmio_write_reg,
+};
+
+static void check_for_pcpu_work(void)
+{
+    ASSERT(!local_irq_is_enabled());
+
+    while ( softirq_pending(smp_processor_id()) )
+    {
+        local_irq_enable();
+        do_softirq();
+        local_irq_disable();
+    }
+}
+
+static void arm_cca_service_host_events(void)
+{
+    ASSERT(!local_irq_is_enabled());
+
+    local_irq_enable();
+    local_irq_disable();
+    check_for_pcpu_work();
+}
+
+static void arm_cca_check_for_vcpu_work(struct vcpu *v)
+{
+    if ( likely(!v->arch.need_flush_to_ram) )
+        return;
+
+    check_for_pcpu_work();
+
+    local_irq_enable();
+    p2m_flush_vm(v);
+    local_irq_disable();
+}
+
+static void noreturn arm_cca_wait_forever(struct vcpu *v)
+{
+    for ( ; ; )
+    {
+        /* Scheduler helpers expect local IRQs enabled when taking locks */
+        local_irq_enable();
+        vcpu_block();
+        local_irq_disable();
+        arm_cca_service_host_events();
+    }
+}
+
+static void arm_cca_wait_until_online(struct vcpu *v)
+{
+    while ( test_bit(_VPF_down, &v->pause_flags) )
+    {
+        /* Scheduler helpers expect local IRQs enabled when taking locks */
+        local_irq_enable();
+        vcpu_block();
+        local_irq_disable();
+        arm_cca_service_host_events();
+    }
+}
+
+static bool arm_cca_wfxt_expired(register_t timeout)
+{
+    return (int64_t)(get_cycles() - timeout) >= 0;
+}
+
+static void arm_cca_wait_until_wfxt_timeout(struct vcpu *v,
+                                            register_t timeout)
+{
+    s_time_t expires;
+
+    ASSERT(!local_irq_is_enabled());
+
+    if ( arm_cca_wfxt_expired(timeout) )
+        return;
+
+    expires = (timeout > boot_count) ? ticks_to_ns(timeout - boot_count) : 0;
+
+    set_bit(_VPF_blocked, &v->pause_flags);
+    smp_mb__after_atomic();
+
+    arch_vcpu_block(v);
+
+    if ( local_events_need_delivery_nomask() || arm_cca_wfxt_expired(timeout) )
+    {
+        clear_bit(_VPF_blocked, &v->pause_flags);
+        return;
+    }
+
+    migrate_timer(&v->arch.cca.timers->wfx, v->processor);
+    set_timer(&v->arch.cca.timers->wfx, expires);
+
+    raise_softirq(SCHEDULE_SOFTIRQ);
+
+    /* Let the scheduler softirq run while the WFxT timer can unblock us. */
+    local_irq_enable();
+    local_irq_disable();
+
+    stop_timer(&v->arch.cca.timers->wfx);
+    arm_cca_service_host_events();
+}
+
+static void noreturn arm_cca_domain_crash(struct vcpu *v)
+{
+    domain_crash(v->domain);
+    arm_cca_wait_forever(v);
+}
+
+/* DEN0137 2.0-bet1 - D1.6.1 Interrupt flow. */
+static void arm_cca_prepare_rec_enter(struct arm_cca_rmi_rec_run *run,
+                                      unsigned long entry_flags,
+                                      const register_t *entry_gprs)
+{
+    register_t hcr;
+
+    memset(&run->enter, 0, sizeof(run->enter));
+    run->enter.flags = entry_flags;
+    memcpy(run->enter.gprs, entry_gprs, sizeof(run->enter.gprs));
+
+    /*
+     * RMI v2.0 removes the run-buffer GIC fields. The RMM validates and
+     * consumes the real ICH_LR<n>_EL2 state left by the Host, so flush Xen's
+     * vGIC model directly into hardware before REC_ENTER.
+     */
+    vgic_sync_to_lrs();
+
+    /*
+     * DEN0137 A6.1 requires ICH_HCR_EL2.En to be clear on REC exit. Re-enable
+     * the virtual CPU interface for the next Realm entry while preserving the
+     * rest of the GIC CPU interface state carried in ICH_HCR_EL2.
+     */
+    hcr = READ_SYSREG(ICH_HCR_EL2);
+    WRITE_SYSREG(hcr | GICH_HCR_EN, ICH_HCR_EL2);
+    isb();
+}
+
+/* DEN0137 2.0-bet1 - D1.6.1 Interrupt flow. */
+static void arm_cca_sync_vgic_exit(struct vcpu *v)
+{
+    /*
+     * In RMI v2.0 the RMM leaves the GIC owner Plane state in the hardware
+     * ICH registers on REC exit. Consume it directly through Xen's generic
+     * vGIC LR sync path.
+     */
+    isb();
+    vgic_sync_from_lrs(v);
+}
+
+/*
+ * DEN0137 2.0-bet1 - D1.6.2 Timer interrupt delivery flow.
+ * Keep the REC exit timer snapshot in Realm-specific state.  The normal
+ * v->arch.{phys,virt}_timer state is tied to non-Realm EL1 context switch
+ * save/restore and must not be overwritten with RMM-owned timer state.
+ */
+static void arm_cca_sync_rec_exit(struct vcpu *v,
+                                  const struct arm_cca_rmi_rec_exit *exit)
+{
+    arm_cca_sync_vgic_exit(v);
+    arm_cca_timer_sync(&v->arch.cca.timers->phys,
+                       exit->cntp_ctl, exit->cntp_cval);
+    arm_cca_timer_sync(&v->arch.cca.timers->virt,
+                       exit->cntv_ctl, exit->cntv_cval);
+}
+
+static paddr_t arm_cca_mmio_lookup_gpa(paddr_t ipa)
+{
+    /*
+     * Realm creation currently sets RmiRealmParams::s2sz to p2m_ipa_bits.
+     * Use the Realm's own s2sz here if that becomes per-domain later.
+     */
+    unsigned int ipa_bits = p2m_ipa_bits;
+    paddr_t mask;
+    paddr_t prot_bit;
+
+    if ( ipa_bits == 0 || ipa_bits > sizeof(paddr_t) * 8 )
+        return ipa;
+
+    mask = GENMASK_ULL(ipa_bits - 1, 0);
+
+    ipa &= mask;
+
+    /*
+     * DEN0137 2.0-bet1 - A5.2.1 Realm IPA space and D2.1 Realm shared
+     * memory protocol description.
+     *
+     * RMM reports the IPA which caused the REC exit.  In Realm IPA
+     * space, bit[s2sz - 1] is the protection attribute; if it is set,
+     * the access is to the Unprotected alias.  Xen's MMIO handlers are
+     * registered against the ordinary guest physical address, so use the
+     * lower alias as the lookup key rather than retrying after failure.
+     */
+    prot_bit = (paddr_t)1 << (ipa_bits - 1);
+    if ( ipa & prot_bit )
+    {
+        ipa &= ~prot_bit;
+    }
+
+    return ipa;
+}
+
+static void arm_cca_set_mmio_result(unsigned long *entry_flags,
+                                    register_t *entry_gprs,
+                                    register_t value)
+{
+    *entry_flags |= ARM_CCA_RMI_REC_ENTER_FLAG_EMUL_MMIO;
+    entry_gprs[0] = value;
+}
+
+static void arm_cca_request_sea(unsigned long *entry_flags,
+                                register_t *entry_gprs)
+{
+    *entry_flags |= ARM_CCA_RMI_REC_ENTER_FLAG_INJECT_SEA;
+    entry_gprs[0] = 0;
+}
+
+static bool
+arm_cca_rec_enter_failed_after_shutdown(const struct vcpu *v,
+                                        const struct arm_smccc_res *res)
+{
+    return v->domain->is_shutting_down &&
+           arm_cca_rmi_status_is(arm_cca_rmi_result(res),
+                                 ARM_CCA_RMI_ERROR_REALM);
+}
+
+/* DEN0137 2.0-bet1 - D1.3.4 MMIO emulation flow. */
+static void arm_cca_handle_mmio(struct vcpu *v,
+                                const struct arm_cca_rmi_rec_exit *exit,
+                                unsigned long *entry_flags,
+                                register_t *entry_gprs)
+{
+    union hsr hsr = { .bits = exit->esr };
+    paddr_t raw_gpa = ((paddr_t)(exit->hpfar & HPFAR_MASK) << (12 - 4)) |
+                      (exit->far & ~PAGE_MASK);
+    mmio_info_t info = {
+        .dabt = hsr.dabt,
+        .gpa = raw_gpa,
+    };
+    struct arm_cca_mmio_ctxt ctxt = {
+        .exit = exit,
+        .result = 0,
+    };
+    enum io_state state;
+
+    if ( !hsr.dabt.valid )
+    {
+        gprintk(XENLOG_INFO,
+                "ARM CCA: MMIO abort without valid syndrome esr=%#lx far=%#llx hpfar=%#llx\n",
+                exit->esr,
+                (unsigned long long)exit->far,
+                (unsigned long long)exit->hpfar);
+        arm_cca_request_sea(entry_flags, entry_gprs);
+        return;
+    }
+
+    info.dabt_instr.state = INSTR_VALID;
+    info.gpa = arm_cca_mmio_lookup_gpa(raw_gpa);
+
+    state = try_handle_mmio_regops(v, &info, &arm_cca_mmio_regops, &ctxt);
+
+    if ( state == IO_HANDLED )
+    {
+        arm_cca_set_mmio_result(entry_flags, entry_gprs, ctxt.result);
+    }
+    else
+    {
+        gprintk(XENLOG_INFO,
+                "ARM CCA: MMIO emulation failed state=%d raw_gpa=%#llx gpa=%#llx esr=%#lx\n",
+                state,
+                (unsigned long long)raw_gpa,
+                (unsigned long long)info.gpa,
+                exit->esr);
+        arm_cca_request_sea(entry_flags, entry_gprs);
+    }
+}
+
+/*
+ * DEN0137 2.0-bet1 - D1.4.1 PSCI_CPU_ON flow.
+ * Xen reuses the same completion hook for related PSCI exits.
+ */
+static void
+arm_cca_handle_psci_complete(struct vcpu *v,
+                             const struct arm_cca_rmi_rec_exit *exit)
+{
+    unsigned int target = vaffinity_to_vcpuid(exit->gprs[1]);
+    struct vcpu *target_vcpu;
+    struct arm_smccc_res res;
+    bool wake = false;
+    int rc;
+
+    if ( target >= v->domain->max_vcpus )
+    {
+        gprintk(XENLOG_ERR, "ARM CCA: invalid PSCI target vCPU %u\n",
+                target);
+        arm_cca_domain_crash(v);
+    }
+
+    target_vcpu = v->domain->vcpu[target];
+    if ( target_vcpu == NULL || target_vcpu->arch.cca.rec == INVALID_PADDR )
+    {
+        gprintk(XENLOG_ERR,
+                "ARM CCA: missing target REC for PSCI target vCPU %u\n",
+                target);
+        arm_cca_domain_crash(v);
+    }
+
+    rc = arm_cca_rmi_psci_complete(v->arch.cca.rec, target_vcpu->arch.cca.rec,
+                                   PSCI_SUCCESS, &res);
+    if ( rc != 0 )
+    {
+        gprintk(XENLOG_ERR,
+                "ARM CCA: RMI_PSCI_COMPLETE failed status=%#x data=%#lx\n",
+                arm_cca_rmi_status_code(arm_cca_rmi_result(&res)),
+                (unsigned long)arm_cca_rmi_result_data(
+                    arm_cca_rmi_result(&res)));
+        arm_cca_domain_crash(v);
+    }
+
+    if ( exit->gprs[0] == PSCI_0_2_FN32_CPU_ON ||
+         exit->gprs[0] == PSCI_0_2_FN64_CPU_ON )
+    {
+        wake = test_and_clear_bit(_VPF_down, &target_vcpu->pause_flags);
+        if ( wake )
+            vcpu_wake(target_vcpu);
+    }
+}
+
+static void arm_cca_handle_psci_exit(struct vcpu *v,
+                                     const struct arm_cca_rmi_rec_exit *exit)
+{
+    switch ( exit->gprs[0] )
+    {
+    case PSCI_0_2_FN32_CPU_SUSPEND:
+    case PSCI_0_2_FN64_CPU_SUSPEND:
+        /* Scheduler helpers expect local IRQs enabled when taking locks */
+        local_irq_enable();
+        vcpu_block_unless_event_pending(v);
+        local_irq_disable();
+        arm_cca_service_host_events();
+        break;
+
+    case PSCI_0_2_FN32_CPU_OFF:
+        if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
+            vcpu_sleep_nosync(v);
+        arm_cca_wait_until_online(v);
+        break;
+
+    case PSCI_0_2_FN32_CPU_ON:
+    case PSCI_0_2_FN64_CPU_ON:
+    case PSCI_0_2_FN32_AFFINITY_INFO:
+    case PSCI_0_2_FN64_AFFINITY_INFO:
+        arm_cca_handle_psci_complete(v, exit);
+        break;
+
+    case PSCI_0_2_FN32_SYSTEM_OFF:
+        domain_shutdown(v->domain, SHUTDOWN_poweroff);
+        arm_cca_wait_forever(v);
+
+    case PSCI_0_2_FN32_SYSTEM_RESET:
+        domain_shutdown(v->domain, SHUTDOWN_reboot);
+        arm_cca_wait_forever(v);
+
+    default:
+        gprintk(XENLOG_ERR,
+                "ARM CCA: unsupported PSCI exit fid=%#lx\n",
+                exit->gprs[0]);
+        arm_cca_domain_crash(v);
+    }
+}
+
+
+/*
+ * DEN0137 2.0-bet1 - D1.3.3 REC exit due to Data Abort fault flow.
+ */
+static void arm_cca_handle_sync_exit(struct vcpu *v,
+                                     const struct arm_cca_rmi_rec_exit *exit,
+                                     unsigned long *entry_flags,
+                                     register_t *entry_gprs)
+{
+    union hsr hsr = { .bits = exit->esr };
+
+    switch ( hsr.ec )
+    {
+    case HSR_EC_WFI_WFE:
+        /*
+         * DEN0137 2.0-bet1 - A4.3.4.1 REC exit due to WFI or WFE.
+         * WFET/WFIT exits provide the timeout value in rec_exit.gprs[0].
+         * Treat a non-zero timeout as authoritative because the same section
+         * only guarantees ESR.ISS.TI for this exit class.
+         */
+        if ( (hsr.bits & HSR_WFI_WFE_WFXT) || exit->gprs[0] )
+        {
+            arm_cca_wait_until_wfxt_timeout(v, exit->gprs[0]);
+            break;
+        }
+
+        /* Scheduler helpers expect local IRQs enabled when taking locks */
+        local_irq_enable();
+        if ( hsr.bits & HSR_WFI_WFE_WFE )
+            vcpu_yield();
+        else
+            vcpu_block_unless_event_pending(v);
+
+        local_irq_disable();
+        arm_cca_service_host_events();
+        break;
+
+    case HSR_EC_DATA_ABORT_LOWER_EL:
+        /* vGIC MMIO paths expect local IRQs enabled for spin_lock_irq */
+        local_irq_enable();
+        arm_cca_handle_mmio(v, exit, entry_flags, entry_gprs);
+        local_irq_disable();
+        break;
+
+    default:
+        gprintk(XENLOG_ERR,
+                "ARM CCA: unsupported REC sync exit ec=%#x esr=%#lx\n",
+                hsr.ec, exit->esr);
+        arm_cca_domain_crash(v);
+    }
+}
+
+/* DEN0137 2.0-bet1 - D1.3.1 Realm entry and exit flow. */
+void noreturn arm_cca_vcpu_run(struct vcpu *v)
+{
+    struct arm_cca_rmi_rec_run *run;
+    struct arm_smccc_res res;
+    unsigned long entry_flags;
+    register_t entry_gprs[ARM_CCA_RMI_REC_NR_GPRS];
+    int rc;
+
+    ASSERT(v == current);
+    ASSERT(!is_idle_vcpu(v));
+
+    if ( !is_vcpu_realm(v) )
+    {
+        gprintk(XENLOG_ERR,
+                "ARM CCA: entered Realm run loop for non-Realm vCPU\n");
+        arm_cca_domain_crash(v);
+    }
+
+    if ( v->domain->arch.vgic.version != GIC_V3 )
+    {
+        gprintk(XENLOG_ERR,
+                "ARM CCA: only GICv3 Realms are supported\n");
+        arm_cca_domain_crash(v);
+    }
+
+    if ( v->arch.cca.run == NULL || v->arch.cca.timers == NULL ||
+         v->arch.cca.run_pa == INVALID_PADDR )
+    {
+        gprintk(XENLOG_ERR,
+                "ARM CCA: REC runtime state is not bound\n");
+        arm_cca_domain_crash(v);
+    }
+
+    if ( v->arch.cca.rec == INVALID_PADDR )
+    {
+        gprintk(XENLOG_ERR, "ARM CCA: REC is not bound\n");
+        arm_cca_domain_crash(v);
+    }
+
+    run = v->arch.cca.run;
+    entry_flags = ARM_CCA_RMI_REC_ENTER_FLAG_TRAP_WFI |
+                  ARM_CCA_RMI_REC_ENTER_FLAG_TRAP_WFE;
+    memset(entry_gprs, 0, sizeof(entry_gprs));
+
+    local_irq_disable();
+    for ( ; ; )
+    {
+        arm_cca_check_for_vcpu_work(v);
+        arm_cca_service_host_events();
+
+        arm_cca_prepare_rec_enter(run, entry_flags, entry_gprs);
+        entry_flags = ARM_CCA_RMI_REC_ENTER_FLAG_TRAP_WFI |
+                      ARM_CCA_RMI_REC_ENTER_FLAG_TRAP_WFE;
+        memset(entry_gprs, 0, sizeof(entry_gprs));
+        rc = arm_cca_rmi_rec_enter(v->arch.cca.rec, v->arch.cca.run_pa, &res);
+        if ( rc != 0 )
+        {
+            if ( arm_cca_rec_enter_failed_after_shutdown(v, &res) )
+            {
+                gprintk(XENLOG_INFO,
+                        "ARM CCA: Realm domain is shutting down; "
+                        "stopping vCPU\n");
+                arm_cca_wait_forever(v);
+            }
+
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: RMI_REC_ENTER failed status=%#x data=%#lx\n",
+                    arm_cca_rmi_status_code(arm_cca_rmi_result(&res)),
+                    (unsigned long)arm_cca_rmi_result_data(
+                        arm_cca_rmi_result(&res)));
+            arm_cca_domain_crash(v);
+        }
+
+        arm_cca_sync_rec_exit(v, &run->exit);
+
+        switch ( run->exit.exit_reason )
+        {
+        case ARM_CCA_RMI_EXIT_IRQ:
+        case ARM_CCA_RMI_EXIT_FIQ:
+            arm_cca_service_host_events();
+            break;
+
+        case ARM_CCA_RMI_EXIT_PSCI:
+            arm_cca_handle_psci_exit(v, &run->exit);
+            break;
+
+        case ARM_CCA_RMI_EXIT_RIPAS_CHANGE:
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: RIPAS change exits are unsupported\n");
+            arm_cca_domain_crash(v);
+
+        case ARM_CCA_RMI_EXIT_SYNC:
+            arm_cca_handle_sync_exit(v, &run->exit, &entry_flags,
+                                     entry_gprs);
+            break;
+
+        case ARM_CCA_RMI_EXIT_HOST_CALL:
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: Host call exits are unsupported (imm=%#x)\n",
+                    (unsigned int)run->exit.imm);
+            arm_cca_domain_crash(v);
+
+        case ARM_CCA_RMI_EXIT_SERROR:
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: SError exit from Realm REC\n");
+            arm_cca_domain_crash(v);
+
+        case ARM_CCA_RMI_EXIT_S2AP_CHANGE:
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: S2AP change exits are unsupported "
+                    "range=%#lx-%#lx\n",
+                    (unsigned long)run->exit.s2ap_base,
+                    (unsigned long)run->exit.s2ap_top);
+            arm_cca_domain_crash(v);
+
+        case ARM_CCA_RMI_EXIT_VDEV_REQUEST:
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: VDEV request exits are unsupported "
+                    "id=%#lx:%#lx\n",
+                    (unsigned long)run->exit.vdev_id_1,
+                    (unsigned long)run->exit.vdev_id_2);
+            arm_cca_domain_crash(v);
+
+        case ARM_CCA_RMI_EXIT_VDEV_VALIDATE_MAPPING:
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: VDEV mapping validation exits are unsupported "
+                    "range=%#lx-%#lx pa=%#lx\n",
+                    (unsigned long)run->exit.dev_mem_base,
+                    (unsigned long)run->exit.dev_mem_top,
+                    (unsigned long)run->exit.dev_mem_pa);
+            arm_cca_domain_crash(v);
+
+        case ARM_CCA_RMI_EXIT_VSMMU_COMMAND:
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: VSMMU command exits are unsupported "
+                    "vsmmu=%#lx\n",
+                    (unsigned long)run->exit.vsmmu);
+            arm_cca_domain_crash(v);
+
+        default:
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: unknown REC exit reason %#x\n",
+                    (unsigned int)run->exit.exit_reason);
+            arm_cca_domain_crash(v);
+        }
+    }
+}
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index d2ee90248a44..c8330e7c969c 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -302,6 +302,10 @@ static void noreturn continue_new_vcpu(struct vcpu *prev)
 
     if ( is_idle_vcpu(current) )
         reset_stack_and_jump(idle_loop);
+#ifdef CONFIG_ARM_CCA
+    else if ( is_vcpu_realm(current) )
+        arm_cca_vcpu_run(current);
+#endif
     else if ( is_32bit_domain(current->domain) )
         /* check_wakeup_from_wait(); */
         reset_stack_and_jump(return_to_new_vcpu32);
diff --git a/xen/arch/arm/include/asm/arm64/hsr.h b/xen/arch/arm/include/asm/arm64/hsr.h
index 1495ccddeab6..7cdddd6ae903 100644
--- a/xen/arch/arm/include/asm/arm64/hsr.h
+++ b/xen/arch/arm/include/asm/arm64/hsr.h
@@ -86,6 +86,7 @@
 #define HSR_SYSREG_PMINTENCLR_EL1 HSR_SYSREG(3,0,c9,c14,2)
 #define HSR_SYSREG_MAIR_EL1       HSR_SYSREG(3,0,c10,c2,0)
 #define HSR_SYSREG_AMAIR_EL1      HSR_SYSREG(3,0,c10,c3,0)
+#define HSR_SYSREG_ICC_DIR_EL1    HSR_SYSREG(3,0,c12,c11,1)
 #define HSR_SYSREG_ICC_SGI1R_EL1  HSR_SYSREG(3,0,c12,c11,5)
 #define HSR_SYSREG_ICC_ASGI1R_EL1 HSR_SYSREG(3,1,c12,c11,6)
 #define HSR_SYSREG_ICC_SGI0R_EL1  HSR_SYSREG(3,2,c12,c11,7)
diff --git a/xen/arch/arm/include/asm/hsr.h b/xen/arch/arm/include/asm/hsr.h
index 9b91b28c48e3..29a91bf866f1 100644
--- a/xen/arch/arm/include/asm/hsr.h
+++ b/xen/arch/arm/include/asm/hsr.h
@@ -168,6 +168,10 @@ union hsr {
 #endif
 };
 
+/* HSR.EC == HSR_EC_WFI_WFE */
+#define HSR_WFI_WFE_WFE    (_AC(1, UL) << 0)
+#define HSR_WFI_WFE_WFXT   (_AC(1, UL) << 1)
+
 /* HSR.EC == HSR_CP{15,14,10}_32 */
 #define HSR_CP32_OP2_MASK (0x000e0000)
 #define HSR_CP32_OP2_SHIFT (17)
-- 
2.51.0


