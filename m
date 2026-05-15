Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMb5HzmdBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DECC0549252
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309486.1580531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjub-0003xD-Vi; Fri, 15 May 2026 04:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309486.1580531; Fri, 15 May 2026 04:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjub-0003w3-SK; Fri, 15 May 2026 04:12:33 +0000
Received: by outflank-mailman (input) for mailman id 1309486;
 Fri, 15 May 2026 04:12:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjua-0003vI-Ig
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:12:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjuZ-000yVE-VJ
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:12:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069d26-bab6-0a2a0a5309dd-0a2a4504b2a4-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:12:31 +0200
Received: from [52.101.125.129]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c35-1dec-0a2a45040019-34657d8136d2-8
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:31 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:27 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:27 +0000
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
 b=HqMeKL6+t5HTfD1sFnJcQa1xL8qOZZ4tMOVV/GkOhttW0nhD7i6sh2z94Gy9GTuGYTHQkcCCPyECQo/vLDUN2ivUliB56axWIPsPAVL43Az1E6ox5pHVu7hBC58OoUhk3oIuzla6ofmTRxpc5T6JJqYl0i3elVFXebLc/u9cpLPvwMZMZ+Ie1502kfjJjzkQd50GnBI8k9hZ8EHXeqIGIypZJ3QmnIvA4IoAO46HcN0rXSj1DOTpM9EDWQsTs9d/b3g+Y1sGwuDxBPl+HsFZ5BDju+B3QV72AG5vVhjpjShu47PiG8LiZ36MPgiss3BFW+S6UJqtlUiZ7S130uMvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bHYT6atPOeZOv2k1L5q3pwz1qEMb9cMvUWztfWVSOo=;
 b=f6oC0cn/u8yXC7n94q+pGMj7xn5ahLQ9biNhMhxNZArow95r2utq6Ne5iZvRTN7kIItFDK5h/F2bDFTbM5wEgvHXL/fAb/JH52/ILCWzbQh7SzmtSXdGaL0ULUiy0bjXD/ORILAev2K84bAAYd6Jl3DCo/3lOPXHl1fQvJG8XyvdS0EWnYV2OmmxPiyZ0PFSXI3rrWIyfln4XzSJDcRuT+4lr21oF9gyndrYXWJomuhxwPX9fnn3d02sh2UEdzXrFfXXOknRPidfwDJ9QwYrVECv0n5P/Zfini5v0AAlQo1WxQXsU9/V7Kp8LWjG/EFnxeBelZF8aC3nt0PhNWn4aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bHYT6atPOeZOv2k1L5q3pwz1qEMb9cMvUWztfWVSOo=;
 b=hLmhABq9j/HWqdKJEUFbENp19Y+sPhbunK5U33Ao+1C5Oi0yj+GaWe5xgsuMgDpQteuqL0pbq9rCBMVUlo3Ta4VAsl81TXIa7AWDwT/7EUhbflKv4+aC+MnHaLeXETwc4dbVu0oBclUCJiE7wtoxf0xw0dws/3aUpHmmEk493fA=
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
Subject: [RFC PATCH v1 11/26] xen/arm/cca: terminate and destroy Realms on relinquish
Date: Fri, 15 May 2026 13:07:57 +0900
Message-ID: <20260515040812.983626-12-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a94171-427a-45da-6252-08deb2379dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	sKcxBNa+IElQZkLoN1w9kxi7M7X+Sm3J/j1xx0ZgnkKIvKBg+cOLFhV3bnjyyemrCaalhWBitQNhfP83JlTqxRNSCjLZiPJT69LpgQ1ZnQmupz0whS5lE6E1BOgS8OkJk0q0JIhmisvlwNKhxcbWmqSVs79u6uwV0618M1WLt+3+FGFeqoYYFMCEO4Gj7UHFJlqDa+11U9/d4GABsANmcKNsPkeV65RmqQqhPyCJ8ZcXcnZdNDo+PlWmCTiu99rp62OUug5a7O2J2l54ZQHsiEoTjJZ9yCjE1TBJ9vvBRNNA+A3F8QZuKWJa41RyiZcsQ/Jo4NKV02gkwCHGka3NBafAdnCBBnu5eaHhjPFQF6/cHyB6ps5aSwwtK42gVReHBXVyphUUAgJmN3soNFDxaw8JDw+TWmaH6+yY1VQXmVxYECTD+HS056RGSxg/bB+xDRX8EgvTIEzvfkgLd69DPXGsMNlf+Qhv7mY6QpaD0ncovvzWqRv15ZRUplkv4OzcvI3EdjbEBF/lNLP98EEcxpI23oto1xKBZm7Vun5l2YJh5CyF3/Jfni492dqrQ6csTi5FoVPV3qeLP0s3sHnzK3IXG3cIcx7PxHQg5qwoPH9dVh8PzenFou8RGav6vtG2t5bwO9BG5B7JIpSXPtGnFTb8pRFcVD7LVDl/4qEku9EEPRvaff3O7LcrfbNa/T7U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4aLGh8c08GG9sqvk6nK3dALLX8eAdb6MOjwGMWZ0oxMZZ/oPKXNQ1peVJdSe?=
 =?us-ascii?Q?t6YbJy2/fschhDfAMzoH6CBbL7X38EKmuJeJI/31iRrKvH0uI8uojMKxfT/2?=
 =?us-ascii?Q?0E9JnEEZV4Lr3622+fetNOopscTpWscUYAr53qh9eHGNNs04JMDp/XBSYpiC?=
 =?us-ascii?Q?HsqAhL+2Obf76T8BheF639Ji9Ukq0qf6BAGKE7F0Xpc0kyABIIqA8XdP7wHU?=
 =?us-ascii?Q?sFBmT3NHAB5DnZN0+lIpAquk+ap1eZUqGdgby9B0HQucQc0NA1LllRnHfxJv?=
 =?us-ascii?Q?KBCYCjjjWE3eD5AoC1xNRV3/dptR+siBIQl9VNziOoOk8UxEJlw+0dNSeT9I?=
 =?us-ascii?Q?38QA3hM4CJ/W5dongYNzJ5BEQaqChB4O+QeS01dChd4O2qXmj83eEznwlNlc?=
 =?us-ascii?Q?XObCzFFCqztencr63dbw7DDxAV6qYasw//PsFKleTeE8OoMvfkXvNqFePC6x?=
 =?us-ascii?Q?shIps13Q5LaFjYDHkdysfbZaXZArepoXxJ7ZsJqrCIE7ScCbK8PcJqupyDyH?=
 =?us-ascii?Q?a6LR6p6lkJpZ3dIR0B/YO1AeGDDxX2rzUuMW4dqwnMHXnb5z72DxKdpLimn4?=
 =?us-ascii?Q?NhhizXqO9Uu2rzzcPiUWlis8zsOASJiN0NZ7d80ttW4B/dIV/IucLDrpCfpD?=
 =?us-ascii?Q?XDgwFoP84pRUxuRk/mXV6r5kttvNhvHp6k0jC4UBdZ0vyAyOVf/Y75EPQBrK?=
 =?us-ascii?Q?iCbRlvRG17K4ddjQV5KuFagS0Z6Iqeaf0AvT5nBIhQGmvPHAiMMt06vPbdHg?=
 =?us-ascii?Q?9Ox3CFh7aPN4vqiCYtHBZreTeWpOzE4M9YpELrB7ja4wd2EH4In6WwO+Bdiy?=
 =?us-ascii?Q?VoFM0Z+Lo4pFCa4tYtTepd04L300GtQ80/GPJmHhebGT9fGC8osKxajMm0qu?=
 =?us-ascii?Q?a8d7KksS+SCfkuAVVnEQjIcUR93A3TQuOPhWlE6XxCF5PShgNDt28nUd2Wuh?=
 =?us-ascii?Q?gVEUsKE2M2JAVVx38fSHeEi2VAKmK/MjllvtrL+OZZWXbq16Il4siRvClbS2?=
 =?us-ascii?Q?7/5UOTY2Nbv/2ZTPFHUnCyGMYH0n3URIv3WH3gB/RAVUnO4S+jo/iTmZgcfF?=
 =?us-ascii?Q?OkAuTx8fadtR3bkGNqOQucMfLNrJdWuZ4AbcOOr3IulgNrCT8YBEIbFSV4mw?=
 =?us-ascii?Q?70ghr7ZmouHWQOfi1Mdusl8yV5YZh91yx6D4fEYbcBV/AmsbdRiUS5ZP7aSh?=
 =?us-ascii?Q?2S8RkBBAT9w843h493Zm3qHtEOI8c0L3cvw8pa6A1KT+bU9qHLmV0Kiyp7Qx?=
 =?us-ascii?Q?DH0LtwIa8R9zJ1CtcFc1/aI+etOAegGImxm9woz5fsCWgVo2P3WCWUSkjRcS?=
 =?us-ascii?Q?c7G9Qu7dPn0oDDbrA55Lo++85KHFuNelBdphuy40MqD7LYdxIKs5I2fEUT+5?=
 =?us-ascii?Q?0YQhNVbYg284mHzhOVIbzn1Vno1yYrLIeSy1cE7TBPJyNCzTuz77BrBEL4po?=
 =?us-ascii?Q?d7s+C11rsi++wknhYyHAtyUlUX20mpRw0aryQpfCgCWp77SOb06L556odmqH?=
 =?us-ascii?Q?ih1IAol7dXSLhX8fl6nV3r1RXYUuvzVEi5+JwKvZ3KHHZ9KFVv2T8zDwKzsr?=
 =?us-ascii?Q?YzGcatvO+g5HiepOR5+Kta7o9EAcEYKh+DE1yZTNMe0lxWfatIdxZJFyoNrE?=
 =?us-ascii?Q?9UIX0OOJtqs2duUnYQCHknNQBk6lfmv7cy/zTKITGNGSmvjMbSKdKCUojVk7?=
 =?us-ascii?Q?m61S+d9zDNpSmwSprJINSZEsJKgBLZvnn/rEz8N2N7/ySZAq5qTDnXYVcBjX?=
 =?us-ascii?Q?4aBg+p5kRLNxv3LEHADxzJyMvqX3eviyjLKzDGAXYqXGsd0WR1vU?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a94171-427a-45da-6252-08deb2379dce
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:27.4348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtQLDF3yIgbqPF/G2Nbpy/4tWTwnS6UOo7oVrDn5Iva/TAdrNjkS59nPAwXKlqpqR34q+HFPWF5o8M8u+TJZmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-ebf023/1778818111-297793FF-5BFD5979/0/0
X-purgate-type: clean
X-purgate-size: 5190
X-Rspamd-Queue-Id: DECC0549252
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
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

Run Realm termination and destruction from the relinquish path. Keep the
metadata until RMM ownership has really ended.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/state.c       | 119 ++++++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/cca.h |   3 +
 2 files changed, 121 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/cca/state.c b/xen/arch/arm/cca/state.c
index 3646948eb11c..e58e261265f3 100644
--- a/xen/arch/arm/cca/state.c
+++ b/xen/arch/arm/cca/state.c
@@ -3,10 +3,12 @@
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
+#include <xen/xmalloc.h>
 
 #include <asm/cca.h>
 
 #include "rmi.h"
+#include "sro.h"
 
 static void arm_cca_reset_domain_state(struct domain *d)
 {
@@ -24,6 +26,7 @@ static void arm_cca_reset_domain_state(struct domain *d)
     d->arch.cca.nr_rtts = 0;
     d->arch.cca.data_pages = NULL;
     d->arch.cca.nr_data_pages = 0;
+    d->arch.cca.realm_terminate_done = false;
 
     for ( i = 0; i < ARRAY_SIZE(d->arch.cca.realm_sro_pages); ++i )
         d->arch.cca.realm_sro_pages[i] = NULL;
@@ -48,8 +51,20 @@ void arm_cca_domain_init(struct domain *d)
     arm_cca_reset_domain_state(d);
 }
 
+static void arm_cca_domain_free_metadata(struct domain *d)
+{
+    xfree(d->arch.cca.data_pages);
+    xfree(d->arch.cca.rtts);
+}
+
+/*
+ * RMI teardown is returnable and runs from
+ * arm_cca_domain_relinquish_resources().  The final domain hook only releases
+ * metadata if an earlier setup path left it behind.
+ */
 void arm_cca_domain_destroy(struct domain *d)
 {
+    arm_cca_domain_free_metadata(d);
     arm_cca_reset_domain_state(d);
 }
 
@@ -71,9 +86,111 @@ static int arm_cca_relinquish_abandoned_pages(struct domain *d)
     return 0;
 }
 
+static int arm_cca_rmi_realm_destroy_complete(struct domain *d)
+{
+    struct arm_cca_sro_mem_xfer xfer = {
+        .pages = d->arch.cca.realm_sro_pages,
+        .nr_pages = &d->arch.cca.nr_realm_sro_pages,
+        .abandoned_pages = &d->arch.cca.abandoned_pages,
+    };
+    struct arm_smccc_res res;
+    int rc;
+
+    rc = arm_cca_rmi_realm_destroy(d->arch.cca.rd, &res);
+    rc = arm_cca_sro_complete_mem_transfer(rc, &res, &xfer);
+    if ( rc == 0 && d->arch.cca.nr_realm_sro_pages != 0 )
+        rc = -EIO;
+
+    return rc;
+}
+
+static int arm_cca_terminate_realm(struct domain *d)
+{
+    struct arm_smccc_res res;
+    int rc;
+
+    if ( d->arch.cca.rd == INVALID_PADDR || d->arch.cca.realm_terminate_done )
+        return 0;
+
+    /*
+     * DEN0137 2.0-bet1 - D1.2.5 starts Realm destruction by terminating the
+     * Realm.  Remember success because later host-side undelegation may fail
+     * and force a retry.
+     */
+    rc = arm_cca_rmi_realm_terminate(d->arch.cca.rd, &res);
+    if ( rc != 0 )
+        return rc;
+
+    d->arch.cca.realm_terminate_done = true;
+
+    return 0;
+}
+
+static int arm_cca_destroy_realm(struct domain *d)
+{
+    int rc;
+
+    if ( d->arch.cca.rd != INVALID_PADDR )
+    {
+        rc = arm_cca_rmi_realm_destroy_complete(d);
+        if ( rc != 0 )
+            return rc;
+
+        d->arch.cca.rd = INVALID_PADDR;
+        d->arch.cca.realm_active = false;
+    }
+
+    if ( d->arch.cca.rtt_root_page )
+    {
+        rc = arm_cca_undelegate_granule(
+            page_to_maddr(d->arch.cca.rtt_root_page));
+        if ( rc != 0 )
+            return rc;
+
+        free_domheap_page(d->arch.cca.rtt_root_page);
+        d->arch.cca.rtt_root_page = NULL;
+    }
+
+    if ( d->arch.cca.rd_page )
+    {
+        rc = arm_cca_undelegate_granule(page_to_maddr(d->arch.cca.rd_page));
+        if ( rc != 0 )
+            return rc;
+
+        free_domheap_page(d->arch.cca.rd_page);
+        d->arch.cca.rd_page = NULL;
+    }
+
+    return 0;
+}
+
+/*
+ * DEN0137 2.0-bet1 - D1.2.5 Realm destruction flow.
+ *
+ * RMI teardown runs in the returnable relinquish path so Xen can retry
+ * incomplete destruction and avoid resource leaks.  Realm-associated objects
+ * can be destroyed in any order.
+ */
 int arm_cca_domain_relinquish_resources(struct domain *d)
 {
-    return arm_cca_relinquish_abandoned_pages(d);
+    int rc;
+
+    rc = arm_cca_terminate_realm(d);
+    if ( rc != 0 )
+        return rc;
+
+    rc = arm_cca_destroy_realm(d);
+    if ( rc != 0 )
+        return rc;
+
+    rc = arm_cca_relinquish_abandoned_pages(d);
+    if ( rc != 0 )
+        return rc;
+
+    arm_cca_domain_free_metadata(d);
+    arm_cca_reset_domain_state(d);
+
+    return 0;
 }
 
 void arm_cca_vcpu_init(struct vcpu *v)
diff --git a/xen/arch/arm/include/asm/cca.h b/xen/arch/arm/include/asm/cca.h
index 9b53c80b5bba..b135dd176751 100644
--- a/xen/arch/arm/include/asm/cca.h
+++ b/xen/arch/arm/include/asm/cca.h
@@ -66,6 +66,9 @@ struct arm_cca_domain_state {
 
     struct arm_cca_data_page_record *data_pages;
     unsigned long nr_data_pages;
+
+    /* Realm destruction state for domain_relinquish_resources(). */
+    bool realm_terminate_done;
 };
 
 struct arm_cca_vcpu_state {
-- 
2.51.0


