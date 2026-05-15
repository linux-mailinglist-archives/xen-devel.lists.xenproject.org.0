Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bNWpBGOcBmpOlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481635491BA
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309342.1580395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqj-0002QP-3B; Fri, 15 May 2026 04:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309342.1580395; Fri, 15 May 2026 04:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqi-0002Im-SD; Fri, 15 May 2026 04:08:32 +0000
Received: by outflank-mailman (input) for mailman id 1309342;
 Fri, 15 May 2026 04:08:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqg-0001oS-DD
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqf-00Bu3E-PF
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c0b-5cb7-0a2a0a5109dd-0a2a45038516-44
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:29 +0200
Received: from [52.101.228.127]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c3b-672d-0a2a45030019-3465e47fdc14-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:29 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB5257.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:24 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:24 +0000
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
 b=dwrqvmBDAGah25IIMw9ewVC5yN3vBgUvPIkc128r0TalWRUbl9pffDfXsuyCYzfpeX/zqgAQiCbh5mDAsOlp7KHtwlTdvffKiCqa4Y3n7Kp71Au5TctDJRKeVzsE09oSA2JfUvM72gL5wR2onnjms1rDPfym2ASSAZsbj/IjcJPNwI9ki4d9r/Y0DsbItfru3LFHz6n4nw0PUPXvmnKoOWHZv6oLZ4xyH40miA4EJHMt2gs3YE4bn+O1zXpvnhpBq5cI74epN7s3mcbV7lYTiJYhjMT2+A4PGuLqsuNhDEke5ucSIHQM6R8BeEIVt6xtsEy7j2QfmuDuWhIHJhGZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYkQKXdORTfgPSnkO/UtbvHd/o4UIhbIJXpGqu2bagU=;
 b=k/9lMGWoC73rjW6zdGZq+rF/7SvnCHuPibAES6D0nLhI0IDkp7SQw0l2S48qB8vBex7mLXRLUs1VTLE8uGMR2CjXg9Hhpfzo2TqLXSr6tqyXo5wPJl5QXTbKtWre79dRvnzmArc9xfSwoyJ0uuM8vyiMmJY6irKiZTAhCXvhkdiitoIo2ncaXSY5faCPkprr0vqekv0Yzz6MH1zb0J0G+47Q1IDSnKB0QGTIRPU9szlFM11c6fCQ6jGfuNGp+tnx4SUf9536X+HB+A/E2msfJgwpk4HYgh49vEKIh9silqmjQUKsuUx+xMb6nBMxo8QCCtwq+ZNClPIbcj8P2a/N+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYkQKXdORTfgPSnkO/UtbvHd/o4UIhbIJXpGqu2bagU=;
 b=ARSnsmLuAV/ruLlL2rdxogWgopJn/nSleD8uS9zYoVz410dzOtqbM0cil0X9+PXrTMCet5mKysZukOaYr18XKyE2dfu7RJPudWr0gcL2BRfDrD4/QRBO/MiJkzgrlNYUSeNoerm+sJ2Fd5LIGHFY3UNiKZCMpwn21ASSF8lhjKA=
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
Subject: [RFC PATCH v1 08/26] xen/arm/cca: add shared SRO helpers
Date: Fri, 15 May 2026 13:07:54 +0900
Message-ID: <20260515040812.983626-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:2::29) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: cf47f41a-6693-4a9c-ecbf-08deb2379c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AJmeJMXP0ESfV7X4ZXuVLgXoKJTKYnTOMcHnL/wKvE3h4QdsbOyYd0yFyQj8rdS0Pkj4zTn1yM5au5g/8/Ro5m9pA15NEX6RaDxLl1H1D8ueV8/ouKuLfyD9KXVIm5SYb0CEliI1YHPR9YsFHcrah/m4gBkxAMAxJyLI2ofVnRLvBPORbR0/OlswQGlAzFOjy14srbI6P8wZPm4FX+An2G9zb5N7Lkoe2BO9uiWXpmT0jTJyv8K0PJMUjoeDHtdBBK4YxXTumv4l2zXNdqccu/6IullRaOYvnGBwkrI0rFkst0YjPMF9rlbcCiIKMiR77Qupuelkt5WoTHPb1Y5dQXnM/mqa1d76QWdX7C3Ab3wBaBoWtFlerSZkLcCEXR2lGtIPk4p1cqvWf2smoiM5sccKJ2u/NZqzx+NjhDNMhsI2eTilnfzWQ2IgNznBtiOoy0nRYY/hDUyLf5VsmZYJApw0vi6m/n4D7f9NyMHXRfsLVug//dnqKrAOs6zQyXoL3C3ts0ri9t3ZFuoIV279zc2PQqpJPcF0qH3EA/1yFxmHf//9llPx+I6GjiEbW+9shFcpyqa2TIffzVVTxeFh8FMe1TGALZzXzqTRWZW5JuhU3XJe19jW+jGBpx0oew6x3i0R7Agra/ebt4lGPX0gOZPESEfemIGy1eMOVto4EEG+efNzuf0swZfWKOSYXjD0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GXuaqB2XzGcEuotCBjsoHPbpxnTn53LrdyjrmuLZ+y4F5gs0Vf5+RJV8y/hD?=
 =?us-ascii?Q?iAUzDlZdBWIlSCpql3T9KwAPBQpTvyE3EU3h4WJ6Pz+9Ch92BzoUabA7XRn9?=
 =?us-ascii?Q?BswELgamI/KAQEY2Jp1/0Wiv7kOweqckB/S3DevbMnbjZZ8MXAcuAd4LN+D2?=
 =?us-ascii?Q?25MTSIdhrcY5q4C1qnZfkhy+a0yPvKsz+6dxxnDW7OeNJ1sid7OoHxmpm0R1?=
 =?us-ascii?Q?/2kJBK9E3ILtJz4zeTAWrMPlDKVP/xnSKLn1zZvhn6P1cGPkCeATYLkLdnz7?=
 =?us-ascii?Q?r15i4gs/EUCmBAkqLKj3E67jem3g+zc5A7lYO8QC+tcHiJ+VgQo9Pa2ex04V?=
 =?us-ascii?Q?hNfI177UNssfA+mBLMG+9Q3yg7sLQR6zG14PP8jaMViuBFuJaIGZJvDbtGI/?=
 =?us-ascii?Q?PtAJ4E4GySUwYFkNsxrQraJJ/zn3eOTdaZgNLTVhRKnIs9V2QqWZxwKLUl4e?=
 =?us-ascii?Q?t/qJsEq0YnGCq/m49VGEwOaRkSbyw6DKj0+rTEGNr9LeYxu5AbuEMCe4GhOJ?=
 =?us-ascii?Q?vvm0GjrimQUFyoVT/GM/2XrYaOcrKv7QFTpO34U1C8n8wJEFcfhn/p5MRhnh?=
 =?us-ascii?Q?Au+WJCq2zd9J3utd7mjVTqmd5oFHca1bdQUk4Jr9+oSHvSABGi+eLitDXi88?=
 =?us-ascii?Q?2qUJM9sU8PYIjtCRV4vmF90RynN83OyNuq6zD+vKHSU6CLQIQUBhjPrEZnBQ?=
 =?us-ascii?Q?cvyyw9GCwbxOebc/hdVwEkRdi5xZQ5j4mOHotUbUxQQ75eWu7vqs7pJxOomv?=
 =?us-ascii?Q?4P65/kjbPjQydj/QaXHO3bkVdiYCfhkbsEHgTLg2h7nMDGaPxSA3/WfU4KsI?=
 =?us-ascii?Q?8rVpu7JDlYf/85gsWsHmlEuE+ii1G5cXOXzujmK17CcOiDRlHzZe18yMwxKU?=
 =?us-ascii?Q?GmfEpyCNKq5idFdfk1iaalBrLimDExMH+Pz8NSNdXIF1en/WYw9inMiKPB0W?=
 =?us-ascii?Q?Oiktyn3z5h/zWoxQDNLMcjzVhAdg3tC0+ZkeVyB6g5Wc9c7sHGouADWrcyou?=
 =?us-ascii?Q?udrsdChlypFwIW2nkXkyy2JCb2/AjZG1x+AxOm5cBoVkxBvVSSyfti4C51VG?=
 =?us-ascii?Q?/RBVs5eAMVuuUe7b2Fp9levddbeP7jK8dBvj1eA/FWqPFfsvFjV9/70yBtTZ?=
 =?us-ascii?Q?WBQyei/VybRUSVueUPO0r8710vZ/ojiFihyMjYVoTnEV+9HJsBjIfwGxrJ6p?=
 =?us-ascii?Q?7wImUoOCES/5Dp0OANgEMQRvfI1KvJwH0XA2cQYSLMuAOzGuHPXGZTW2cAX/?=
 =?us-ascii?Q?D+L88wbLLlJUjBOzaNO5EmFBxUl7Kx1Znj1Pjhpu+KBLSUTcSaXA6txwcOR2?=
 =?us-ascii?Q?kqZG03HPyfQXOxHHE0emL+Vb2N9MKPMIGKZzaH+cKrVcBPiXrYpgBG4MMP6V?=
 =?us-ascii?Q?/+bmhhq00lGQJT+aMF2gFoOgeYOAUfpekXBtP2ab9oH2+AoM2PBlNZW0i1Tc?=
 =?us-ascii?Q?9rsYfFNQJ3YUFSUqxZF7eq1wn7gC3APgk3MqqSVHcHC0ICNt9rVnIDit9M0q?=
 =?us-ascii?Q?yu4QjLrns37p52m8sniYMHGr0tLiPCf2hvY9+llSY9k0FM+MpYYDXk+QbmC7?=
 =?us-ascii?Q?LqtFedVc9nN1D248ximfd3zVi/RJOE+d+QhcC/ToprpmI8Sy55PD4+WnHWVT?=
 =?us-ascii?Q?MMO8SRkw2GJC21q+ZY8G0SAh1xgTdAm3hCNzqSJWYDg3ZRQqitKwqvmFgsEM?=
 =?us-ascii?Q?bRFnbJ7ltB4vke3qSfwvoszd5Vh1R9be6dcKFbNmytCwtZELxuFIWluRIsTB?=
 =?us-ascii?Q?b7rE6syq2u5lNA3EM1w7NnD6Rahms8RBd47leh8o0V/N9UuAEEKW?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: cf47f41a-6693-4a9c-ecbf-08deb2379c36
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:24.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdvj2mhceMc+0+Et9DPNXzp57Qw9xBk3Mf/sADh9u1/a9C6BxuqcigEEw8cxct1J0WIVj7kRkfBFFfxsaiaWtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5257
X-purgate-ID: tlsNG-33051d/1778818109-36746938-A2D52CEA/0/0
X-purgate-type: clean
X-purgate-size: 16120
X-Rspamd-Queue-Id: 481635491BA
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
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

Add the common loop for memory-transferring Stateful RMI Operations. It
keeps donate, reclaim and cancel handling out of each lifecycle caller.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/Makefile |   1 +
 xen/arch/arm/cca/sro.c    | 485 ++++++++++++++++++++++++++++++++++++++
 xen/arch/arm/cca/sro.h    |  25 ++
 3 files changed, 511 insertions(+)
 create mode 100644 xen/arch/arm/cca/sro.c
 create mode 100644 xen/arch/arm/cca/sro.h

diff --git a/xen/arch/arm/cca/Makefile b/xen/arch/arm/cca/Makefile
index 57c3986d5de8..bf6d9b58ebec 100644
--- a/xen/arch/arm/cca/Makefile
+++ b/xen/arch/arm/cca/Makefile
@@ -1,4 +1,5 @@
 obj-y += granule.o
 obj-y += realm.o
 obj-y += rmi.o
+obj-y += sro.o
 obj-y += state.o
diff --git a/xen/arch/arm/cca/sro.c b/xen/arch/arm/cca/sro.c
new file mode 100644
index 000000000000..d17810388398
--- /dev/null
+++ b/xen/arch/arm/cca/sro.c
@@ -0,0 +1,485 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/mm.h>
+#include <xen/xmalloc.h>
+
+#include <asm/cca.h>
+
+#include "rmi.h"
+#include "sro.h"
+
+static struct page_info *arm_cca_sro_alloc_page(void)
+{
+    struct page_info *pg;
+    void *va;
+
+    pg = alloc_domheap_page(NULL, 0);
+    if ( !pg )
+        return NULL;
+
+    va = map_domain_page(page_to_mfn(pg));
+    clear_page(va);
+    unmap_domain_page(va);
+
+    return pg;
+}
+
+static unsigned long arm_cca_sro_donate_req_count(unsigned long req)
+{
+    return arm_cca_rmi_field_get(req,
+                                 ARM_CCA_RMI_OP_DONATE_BLK_COUNT_SHIFT,
+                                 ARM_CCA_RMI_OP_DONATE_BLK_COUNT_WIDTH);
+}
+
+static uint64_t arm_cca_sro_addr_desc_4k(paddr_t pa)
+{
+    return ((uint64_t)ARM_CCA_RMI_PAGE_L3 <<
+            ARM_CCA_RMI_ADDR_DESC_4K_SZ_SHIFT) |
+           (1ULL << ARM_CCA_RMI_ADDR_DESC_4K_CNT_SHIFT) |
+           (((uint64_t)pa >> PAGE_SHIFT) <<
+            ARM_CCA_RMI_ADDR_DESC_4K_ADDR_SHIFT) |
+           ((uint64_t)ARM_CCA_RMI_OP_MEM_DELEGATED <<
+            ARM_CCA_RMI_ADDR_DESC_4K_ST_SHIFT);
+}
+
+static int
+arm_cca_sro_free_delegated_pages(const struct arm_cca_sro_mem_xfer *xfer,
+                                 struct page_info **pages,
+                                 unsigned int nr_pages)
+{
+    unsigned int i;
+    int rc = 0;
+
+    for ( i = 0; i < nr_pages; ++i )
+    {
+        if ( !pages[i] )
+            continue;
+
+        if ( arm_cca_undelegate_granule(page_to_maddr(pages[i])) != 0 )
+        {
+            page_list_add_tail(pages[i], xfer->abandoned_pages);
+            pages[i] = NULL;
+            rc = -EIO;
+            continue;
+        }
+
+        free_domheap_page(pages[i]);
+        pages[i] = NULL;
+    }
+
+    return rc;
+}
+
+static int
+arm_cca_sro_validate_donate_req(const struct arm_cca_sro_mem_xfer *xfer,
+                                unsigned long req, unsigned long *count)
+{
+    unsigned long blk_size, contig, state;
+
+    if ( !xfer || !xfer->pages || !xfer->nr_pages || !xfer->max_pages ||
+         !xfer->abandoned_pages )
+        return -EOPNOTSUPP;
+
+    blk_size = arm_cca_rmi_field_get(req,
+                                     ARM_CCA_RMI_OP_DONATE_BLK_SIZE_SHIFT,
+                                     ARM_CCA_RMI_OP_DONATE_BLK_SIZE_WIDTH);
+    contig = arm_cca_rmi_field_get(req,
+                                   ARM_CCA_RMI_OP_DONATE_MEM_CONTIG_SHIFT,
+                                   ARM_CCA_RMI_OP_DONATE_MEM_CONTIG_WIDTH);
+    state = arm_cca_rmi_field_get(req,
+                                  ARM_CCA_RMI_OP_DONATE_MEM_STATE_SHIFT,
+                                  ARM_CCA_RMI_OP_DONATE_MEM_STATE_WIDTH);
+    *count = arm_cca_sro_donate_req_count(req);
+
+    /*
+     * Xen donates 4KB, non-contiguous, already-delegated granules here
+     * because they can be allocated and tracked as individual pages.
+     */
+    if ( blk_size != ARM_CCA_RMI_PAGE_L3 ||
+         contig != ARM_CCA_RMI_OP_MEM_NON_CONTIG ||
+         state != ARM_CCA_RMI_OP_MEM_DELEGATED )
+        return -EOPNOTSUPP;
+
+    if ( *count == 0 )
+        return -EINVAL;
+
+    if ( *xfer->nr_pages > xfer->max_pages ||
+         *count > xfer->max_pages - *xfer->nr_pages )
+        return -E2BIG;
+
+    if ( *count > PAGE_SIZE / sizeof(uint64_t) )
+        return -E2BIG;
+
+    return 0;
+}
+
+static int arm_cca_sro_donate_pages(unsigned long handle,
+                                    unsigned long donate_req,
+                                    const struct arm_cca_sro_mem_xfer *xfer,
+                                    struct arm_smccc_res *res)
+{
+    struct page_info *list_pg = NULL;
+    struct page_info **pages = NULL;
+    uint64_t *list;
+    unsigned long count, consumed;
+    unsigned int i;
+    int cleanup_rc, rc;
+
+    rc = arm_cca_sro_validate_donate_req(xfer, donate_req, &count);
+    if ( rc != 0 )
+        return rc;
+
+    pages = xzalloc_array(struct page_info *, count);
+    if ( !pages )
+        return -ENOMEM;
+
+    list_pg = arm_cca_sro_alloc_page();
+    if ( !list_pg )
+    {
+        rc = -ENOMEM;
+        goto out;
+    }
+
+    list = map_domain_page(page_to_mfn(list_pg));
+
+    for ( i = 0; i < count; ++i )
+    {
+        pages[i] = arm_cca_sro_alloc_page();
+        if ( !pages[i] )
+        {
+            rc = -ENOMEM;
+            goto out_unmap;
+        }
+
+        rc = arm_cca_delegate_granule(page_to_maddr(pages[i]));
+        if ( rc != 0 )
+        {
+            free_domheap_page(pages[i]);
+            pages[i] = NULL;
+            goto out_unmap;
+        }
+
+        list[i] = arm_cca_sro_addr_desc_4k(page_to_maddr(pages[i]));
+    }
+
+    rc = arm_cca_rmi_op_mem_donate(handle, page_to_maddr(list_pg), count, res);
+    /*
+     * donated_count is valid regardless of the RMI status.
+     * See DEN0137 2.0-bet1 - B4.3.2.2 Donating memory to an SRO
+     */
+    consumed = res->a1;
+    if ( consumed > count )
+    {
+        rc = -EIO;
+        consumed = count;
+    }
+
+    for ( i = 0; i < consumed; ++i )
+    {
+        xfer->pages[*xfer->nr_pages] = pages[i];
+        (*xfer->nr_pages)++;
+        pages[i] = NULL;
+    }
+
+out_unmap:
+    unmap_domain_page(list);
+    free_domheap_page(list_pg);
+
+out:
+    cleanup_rc = arm_cca_sro_free_delegated_pages(xfer, pages, count);
+    if ( cleanup_rc != 0 )
+        rc = cleanup_rc;
+    xfree(pages);
+
+    return rc;
+}
+
+static int arm_cca_sro_continue(unsigned long handle,
+                                struct arm_smccc_res *res)
+{
+    return arm_cca_rmi_op_continue(handle, ARM_CCA_RMI_CONTINUE_KEEP_GOING,
+                                   res);
+}
+
+static bool arm_cca_sro_is_pending(const struct arm_smccc_res *res)
+{
+    uint64_t result = arm_cca_rmi_result(res);
+
+    return arm_cca_rmi_status_is(result, ARM_CCA_RMI_INCOMPLETE) ||
+           arm_cca_rmi_status_is(result, ARM_CCA_RMI_BUSY);
+}
+
+static int arm_cca_sro_reclaim_pages(unsigned long handle,
+                                     const struct arm_cca_sro_mem_xfer *xfer,
+                                     struct arm_smccc_res *res);
+
+static int
+arm_cca_sro_validate_reclaim_xfer(const struct arm_cca_sro_mem_xfer *xfer)
+{
+    if ( !xfer || !xfer->pages || !xfer->nr_pages || !xfer->abandoned_pages )
+        return -EOPNOTSUPP;
+
+    if ( *xfer->nr_pages == 0 )
+        return -EIO;
+
+    return 0;
+}
+
+static int arm_cca_sro_cancel(unsigned long handle,
+                              const struct arm_cca_sro_mem_xfer *xfer,
+                              struct arm_smccc_res *res)
+{
+    int rc = arm_cca_rmi_op_cancel(handle, res);
+
+    if ( rc != 0 && !arm_cca_sro_is_pending(res) )
+        return rc;
+
+    while ( arm_cca_sro_is_pending(res) )
+    {
+        unsigned long mem_req;
+
+        if ( arm_cca_rmi_status_is(arm_cca_rmi_result(res),
+                                   ARM_CCA_RMI_BUSY) )
+        {
+            rc = arm_cca_sro_continue(handle, res);
+            if ( rc < 0 )
+                return rc;
+            if ( !arm_cca_sro_is_pending(res) )
+                return rc;
+            continue;
+        }
+
+        mem_req = arm_cca_rmi_sro_mem_req(res->a0);
+
+        switch ( mem_req )
+        {
+        case ARM_CCA_RMI_OP_MEM_REQ_RECLAIM:
+            rc = arm_cca_sro_validate_reclaim_xfer(xfer);
+            if ( rc != 0 )
+                return rc;
+            rc = arm_cca_sro_reclaim_pages(handle, xfer, res);
+            break;
+
+        case ARM_CCA_RMI_OP_MEM_REQ_NONE:
+            rc = arm_cca_sro_continue(handle, res);
+            if ( rc < 0 )
+                return rc;
+            if ( !arm_cca_sro_is_pending(res) )
+                return rc;
+            break;
+
+        default:
+            return -EIO;
+        }
+
+        if ( rc < 0 )
+            return rc;
+    }
+
+    return rc;
+}
+
+int arm_cca_sro_complete_mem_transfer(int rc, struct arm_smccc_res *res,
+                                      const struct arm_cca_sro_mem_xfer *xfer)
+{
+    unsigned long handle;
+    bool can_cancel = false;
+
+    if ( rc != 0 && !arm_cca_sro_is_pending(res) )
+        return rc;
+
+    if ( !arm_cca_rmi_status_is(arm_cca_rmi_result(res),
+                                ARM_CCA_RMI_INCOMPLETE) )
+        return rc;
+
+    handle = res->a1;
+
+    while ( arm_cca_sro_is_pending(res) )
+    {
+        uint64_t result = arm_cca_rmi_result(res);
+        unsigned long mem_req;
+
+        if ( arm_cca_rmi_status_is(result, ARM_CCA_RMI_BUSY) )
+        {
+            rc = arm_cca_sro_continue(handle, res);
+        }
+        else
+        {
+            can_cancel = arm_cca_rmi_sro_can_cancel(result);
+            mem_req = arm_cca_rmi_sro_mem_req(result);
+
+            switch ( mem_req )
+            {
+            case ARM_CCA_RMI_OP_MEM_REQ_DONATE:
+                rc = arm_cca_sro_donate_pages(handle, res->a2, xfer, res);
+                /*
+                 * RMM records a failed donation through the SRO context.  The
+                 * Host must continue the SRO after an RMI_OP_MEM_DONATE error.
+                 *
+                 * See DEN0137 2.0-bet1 - B4.3.2.2
+                 */
+                if ( arm_cca_rmi_status_is_error(arm_cca_rmi_result(res)) )
+                    rc = arm_cca_sro_continue(handle, res);
+                break;
+
+            case ARM_CCA_RMI_OP_MEM_REQ_RECLAIM:
+                rc = arm_cca_sro_validate_reclaim_xfer(xfer);
+                if ( rc != 0 )
+                    break;
+
+                rc = arm_cca_sro_reclaim_pages(handle, xfer, res);
+                break;
+
+            case ARM_CCA_RMI_OP_MEM_REQ_NONE:
+                rc = arm_cca_sro_continue(handle, res);
+                break;
+
+            default:
+                rc = -EOPNOTSUPP;
+                break;
+            }
+        }
+
+        if ( rc < 0 )
+        {
+            int cancel_rc;
+
+            /*
+             * A final RMI_ERROR_* already ends the SRO.  CANCEL is only for
+             * a still-pending SRO which Xen can no longer drive.
+             */
+            if ( !arm_cca_sro_is_pending(res) )
+                break;
+
+            if ( !can_cancel )
+                break;
+
+            cancel_rc = arm_cca_sro_cancel(handle, xfer, res);
+            if ( cancel_rc != 0 )
+                rc = cancel_rc;
+            break;
+        }
+    }
+
+    return rc;
+}
+
+static int
+arm_cca_sro_forget_reclaimed_page(const struct arm_cca_sro_mem_xfer *xfer,
+                                  paddr_t pa)
+{
+    struct page_info **pages = xfer->pages;
+    unsigned int *nr_pages = xfer->nr_pages;
+    unsigned int i;
+
+    for ( i = 0; i < *nr_pages; ++i )
+    {
+        struct page_info *pg = pages[i];
+
+        if ( !pg || page_to_maddr(pg) != pa )
+            continue;
+
+        pages[i] = pages[*nr_pages - 1];
+        pages[*nr_pages - 1] = NULL;
+        (*nr_pages)--;
+
+        if ( arm_cca_undelegate_granule(pa) != 0 )
+        {
+            /*
+             * The RMM has returned the page.  Keep host undelegation failure
+             * out of the SRO state machine and retry it from relinquish.
+             */
+            page_list_add_tail(pg, xfer->abandoned_pages);
+            return 0;
+        }
+
+        free_domheap_page(pg);
+
+        return 0;
+    }
+
+    return -ENOENT;
+}
+
+static int
+arm_cca_sro_forget_reclaimed_desc(const struct arm_cca_sro_mem_xfer *xfer,
+                                  uint64_t desc)
+{
+    paddr_t pa = arm_cca_rmi_addr_desc_4k_pa(desc);
+    unsigned long count = arm_cca_rmi_addr_desc_4k_count(desc);
+    unsigned long size = arm_cca_rmi_addr_desc_4k_size(desc);
+    unsigned long state = arm_cca_rmi_addr_desc_4k_state(desc);
+    unsigned long i;
+
+    if ( size != ARM_CCA_RMI_PAGE_L3 ||
+         state != ARM_CCA_RMI_OP_MEM_DELEGATED ||
+         count == 0 )
+        return -EIO;
+
+    for ( i = 0; i < count; ++i )
+    {
+        int rc = arm_cca_sro_forget_reclaimed_page(xfer, pa);
+
+        if ( rc != 0 )
+            return rc;
+
+        pa += PAGE_SIZE;
+    }
+
+    return 0;
+}
+
+static int arm_cca_sro_reclaim_pages(unsigned long handle,
+                                     const struct arm_cca_sro_mem_xfer *xfer,
+                                     struct arm_smccc_res *res)
+{
+    struct page_info *list_pg;
+    uint64_t *list;
+    unsigned long max_descs = *xfer->nr_pages;
+    unsigned long nr_descs = 0;
+    unsigned int i;
+    int rc;
+
+    list_pg = alloc_domheap_page(NULL, 0);
+    if ( !list_pg )
+        return -ENOMEM;
+
+    list = map_domain_page(page_to_mfn(list_pg));
+    clear_page(list);
+
+    /*
+     * In the worst case each reclaimed page needs one address-list
+     * descriptor, so the tracked page count is a sufficient list capacity.
+     */
+    rc = arm_cca_rmi_op_mem_reclaim(handle, page_to_maddr(list_pg), max_descs,
+                                    res);
+
+    if ( arm_cca_rmi_status_is(arm_cca_rmi_result(res),
+                               ARM_CCA_RMI_INCOMPLETE) )
+    {
+        nr_descs = res->a1;
+        if ( nr_descs > max_descs )
+        {
+            nr_descs = max_descs;
+            rc = -EIO;
+        }
+    }
+
+    for ( i = 0; i < nr_descs; ++i )
+    {
+        int ret = arm_cca_sro_forget_reclaimed_desc(xfer, list[i]);
+
+        if ( ret != 0 )
+        {
+            rc = ret;
+            break;
+        }
+    }
+
+    unmap_domain_page(list);
+    free_domheap_page(list_pg);
+
+    return rc;
+}
diff --git a/xen/arch/arm/cca/sro.h b/xen/arch/arm/cca/sro.h
new file mode 100644
index 000000000000..71d26574fe7e
--- /dev/null
+++ b/xen/arch/arm/cca/sro.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef ARM_CCA_SRO_H
+#define ARM_CCA_SRO_H
+
+struct arm_smccc_res;
+struct page_list_head;
+struct page_info;
+
+struct arm_cca_sro_mem_xfer {
+    /*
+     * pages tracks pages accepted by the SRO and later returned by reclaim.
+     * max_pages is the capacity for accepted donations; zero disables
+     * donation.  abandoned_pages keeps delegated pages which still need
+     * host-side undelegation retry.
+     */
+    struct page_info **pages;
+    unsigned int *nr_pages;
+    unsigned int max_pages;
+    struct page_list_head *abandoned_pages;
+};
+
+int arm_cca_sro_complete_mem_transfer(int rc, struct arm_smccc_res *res,
+                                      const struct arm_cca_sro_mem_xfer *xfer);
+
+#endif /* ARM_CCA_SRO_H */
-- 
2.51.0


