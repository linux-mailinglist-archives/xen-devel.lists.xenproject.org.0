Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPz1AD9AEmpFxAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA6B5C0E90
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318192.1586601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIs-0003z8-CQ; Sun, 24 May 2026 00:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318192.1586601; Sun, 24 May 2026 00:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIs-0003u2-6n; Sun, 24 May 2026 00:02:50 +0000
Received: by outflank-mailman (input) for mailman id 1318192;
 Sun, 24 May 2026 00:02:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIr-0003lY-21
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIq-005yAt-EQ
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12400e-2eae-0a2a0a5409dd-0a2a4504c06e-14
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:48 +0200
Received: from [52.101.125.123]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124025-1dec-0a2a45040019-34657d7b4fb1-4
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:48 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:46 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:46 +0000
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
 b=AIwgvm+HuR4Cd2Mw/PMBpucPRRP3NxA3EmWrR8iy23g40dUBPFeC1Fo0yGjdryhRA8FsBQdaPsGgb+DbkJXpXnIJiPyMtu9/ZbzVz+P9pBTyiYbqC0+hBEFKcigN7d3I3s3/y7/toiAE2+TCCA74kB48nQ5S18eIJqeJx4eyHlxKTjmmDFYJ03LGXhw2+4NI5JX35P65Bk/wF2lDKfaHK4Y2dwgUrH9qqO8MYoOGWSP6X1WHygx5PHKtm/1kJ/+WD9JQWAnUl3MDS8TzsUAhI08A/dxmoHXPFfFddM7AY9/NJ/yiiWFg/zM0AObFGQ4G8JhKng6lrFE7JQvzU8tRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lteRRVaFbxsp6aSXOgwn6Y3jyynAQKzJoiRSSUgWbfU=;
 b=Fv/tb9g4bUJwBEvsTky7hFOpx6rmXt7DIvKDp0q0cxQ9FbEI7J4VYxVYnoxAbTqqhV8Y1Ix6xHEAqBgVDzxQCxiTiSP84+iyYPUj+kTkubEASI8vuwO0+nMdiZVBkX7nXoAn93N0HWPVWO8d4tpbEzsDx8zoj611sFEtmO+OPsfcSohxWt0GES9BmSOYndetAkvtjb46KaSVVFS0OzRrs3G5obEbRzr7GXZTN1R7ExGIZ+tbATzKHqkXhYnq0+9iqz8ejgqkqfInpfmubPJuPySG8sYKJnwX9Qw7ZGml340lFFGt5t0tFCd1NtgCbM5F+JDR0+YZEn920sw3quR2bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lteRRVaFbxsp6aSXOgwn6Y3jyynAQKzJoiRSSUgWbfU=;
 b=UFrMhAy2wtt+bjVxqPhkasR3TM2VDxP8kE9euMhgCQyFyCZQYv6xcLO2730ZVlLZMqC8PeixDSRx9spV0+2NJ8xNCeo25U2ak4PmjImzJicqKms5V3JFW22KOg1UCsKPna+lJ83+dm4dm9RxEyT5+tewkJksO5rz7bnF9amL9zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH 09/21] xen/common: Allow building ARM32 Xen with CONFIG_NUMA
Date: Sun, 24 May 2026 09:01:57 +0900
Message-ID: <20260524000209.292370-10-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::18) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4dab05-7202-450e-0112-08deb927c8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	XlFNwlij2X52VmUknMN4fHD9liWJ2Wb5hNR8PxRKMigxXx4nz/4ojjkWwZ5Pdiv+QXs/tJg+YAF3RXPzMistqHYZPHttTaLgPp/qQ7oqN+mtwYWI5NphX61UX00eM5QLDKAadr7LchjX7+zgmVXmwzGcdE/BI8HZfD3xQ7FQoDjAzlxi22IzXxR6oAcOrjExcKKmfdtBdLt8s3b41aMRqxzdtellNbxE1DUhKMDfvEhpTy9FIvtX5c24MFiONoP4/d5WwvXEqy2yeQ97ORiNXl3Btz92z0pTFhoM7EAHoznuyvOR90QDjL1dYt4HiJy3k5Fmn0c0XV5/WmPDWM6nlzoDLbDEgeTS4ugcAJ1Yb1GQLSjAuTnrHZppyzRjhtPyg8wvjuaixLFZh2WKHcKCPXIP7g1Za1/cgHMFHuO4oxQeaU2wqYx/PbrTW5uV9aApyi1FOtMyC5Cz16BGQxPV3m8pZN23+mKlt3hjjpgDbPfZ8tAUHK9dfh21UECw4R1y0HF+5Cs300qEKGsJ93Au3fRCWbn4H/E79VMdhOPSdS7ay/7UF3avD5yN2ou/DVXVzhCPkwpH21cB1k1vRZK7aiAf5iuCRKDy3xN9MjzupVTSHnFcRttuM60SCVMbR6H5uRVyKrBzryaueRblR9Q8TyLPsvyDMaoAHUZue5JkNcwA0ZC2yAfZ2S2tgUKicz+i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?28Rml+BLw73pZpVmEIqNEUrvCTKMGeHMfz0H6H4knpu92qiAB79xGT1aRUXC?=
 =?us-ascii?Q?50qXlJPCHGyr0OsvY3fZZiBHSjOPEwxlyCHf7wlPUFTx9M+0iE7Xy+GBzC66?=
 =?us-ascii?Q?XLj/GEOonq6sNLyYgXk/xDBEmTLQT2stx72hhi35RALYkTWWl/ocm2+vNRJf?=
 =?us-ascii?Q?uKkkCqBRCmQGIQpRkSxKYWT74aJwPPVzKeQBIbVRLu20Ju+qLefMOfsbGAaA?=
 =?us-ascii?Q?64/dueJYmyI+/+H/HlFFTMAMD9ch2lsyLEZ34ptPkWMUwkNQPEh/cvUaTDsS?=
 =?us-ascii?Q?DsvOXQeU9ba/pMu8S0JtrpV5LKKxVh5nWdm/pJwxb1q327n/Zc10GqiexDbm?=
 =?us-ascii?Q?3xW2+x/gmEM0Dyp8Jt3qSOTBM83gk3M7TSXA7c61HeYrjx4Z/cjsJxbtCVi8?=
 =?us-ascii?Q?+qtQAleiBi+GmpD7dG41o1vmZHXj/wxSkbEQRZbxkMIe9bq558Qq1MJEeWox?=
 =?us-ascii?Q?Ekgn0jNOJ7GF7izjiMH5vHKxmZwhe/NZp8MTwTwWCeurGBZ7RPUX1BBZVIDh?=
 =?us-ascii?Q?RSnKzVH3WuDfuAZBoltEOMMI7xVg/R1UDIiADFSiS1Co8tsn3xxHG0qpcKDl?=
 =?us-ascii?Q?rTxzQ+elwrgqXasZF791Aa/sopyV4PWugz/X/e1Eoa2zbRJP8Z+F8RO5P3/q?=
 =?us-ascii?Q?vLmIlWOznH9TSpBEGaTX34B+W9xm5beofMhDgAsF7yyBu6rgdwclJ4NU60ry?=
 =?us-ascii?Q?P6sEifOxyi/zc1NsFztrvJQaIhI3bZjxCMCi60R7PvYWW03x8aXyQqGInZzj?=
 =?us-ascii?Q?nZH5smfVS6gf9tiAep+1tk2zC8Oxq8hsO6GKMtJLxv7fc99URcZj0M/o6Th3?=
 =?us-ascii?Q?qX27a9AAZFSe8Ijjwnw913OZrzUNM+4cQAlPLz3hOlaOIPf5GSmstUw3tTwG?=
 =?us-ascii?Q?M8q8GhxqAP228gT7MAkCtpPIi4f9763gvQMq73gTR0QRRUvX/NuR02BPttxI?=
 =?us-ascii?Q?1tNYNUvdyaOps7MNFhmTYBWzPsjdby3/D3AJDRjFJ2X2aowfvw+4lUYXFRvZ?=
 =?us-ascii?Q?sStsPnRz8uAc3EkiLrXOcn5M3JHLwdUzNeJlLEtnUXXk5RfKbQCFflTXkkz9?=
 =?us-ascii?Q?UqdVhZHRCbdrefiZqGwEegU6pcLp1XS98A2zJzknTGggX/GrjwTlBR7xwv1L?=
 =?us-ascii?Q?6fDDbLbCGspguyfXfxxsNEMqC8ls6Hk8XCvY+ghq38W4F1vOrLtQxFHvPY4W?=
 =?us-ascii?Q?hSXjerirL+GTtMIJOCNIaHlwDQGm5pjF+2ccPLL7NZUcm9GLO1TUodpJ0dk2?=
 =?us-ascii?Q?nhxdGm6AxMK83GtTHT1RUSYnJp4KaiXi5Czuk4qFCvX0YeG6N6HtcQWZl/6l?=
 =?us-ascii?Q?sYR0K2LStQ/btwIYksVYn2ji+xbKsS843+B2oeabbCLVSP4Ex8VaHS6DrRo3?=
 =?us-ascii?Q?Wioax3hXKHYo2f6z0JIuZiK4OaLaSysW2kG121/lF9qjn95T3HJ9h9X328GC?=
 =?us-ascii?Q?vwHiavH48qNrLxzvaqVU9E/whB1K7ot3ONqE6FhKmN1xcVa8ezIliS9d8GUn?=
 =?us-ascii?Q?ydbwB7BJqMwgq9mwaMGeZLvdhBcd91VP3fSmvgRoHXOuK1Wh9A9cw7/IQWwp?=
 =?us-ascii?Q?qOYbl4PNbGKGTWo6ALtcVAN7ptVCzndL0IC84vfCOhiF2Ay4pT9xoWvMPbgF?=
 =?us-ascii?Q?ZqXOLmh5VBBxNwEm3g6mcjaAE2LwuRvafFQjVbH/++ucpA256ywo2Iu66fs9?=
 =?us-ascii?Q?x0bVReEJBbKhV6L+SEOqiRAyh1PYx2wExoPrsGmWuQn13PnH/Aoa1pP7MfNI?=
 =?us-ascii?Q?/2URIUca169dLChs8Wdyb6QLbfOKFkJtixbeF5I2/rc3NKKJF32ztUkSUwXL?=
X-MS-Exchange-AntiSpam-MessageData-1: dTDiTBEuxtcxog==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4dab05-7202-450e-0112-08deb927c8f9
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:46.0675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8oqDAbKISIpll46OFIKZcHlRQF5VYW8Oj09TRQCyhMh+YmJ/S0kdun3NWt564wvRHpN+6XVQLW68NS2RO0FpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-ebf023/1779580968-4237F3FF-D8D774DC/0/0
X-purgate-type: clean
X-purgate-size: 765
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AFA6B5C0E90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow ARM32 Xen to be built with NUMA configurations.
---
 xen/common/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/numa.c b/xen/common/numa.c
index ad75955a16..81121e571e 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -431,7 +431,7 @@ static int __init allocate_cachealigned_memnodemap(void)
     if ( !memnodemap )
         panic("Unable to map the NUMA node map. Retry with numa=off");
     size <<= PAGE_SHIFT;
-    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
+    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %"PRIpaddr" - %"PRIpaddr"\n",
            mfn_to_maddr(mfn), mfn_to_maddr(mfn) + size);
     memnodemapsize = size / sizeof(*memnodemap);
 
-- 
2.43.0


