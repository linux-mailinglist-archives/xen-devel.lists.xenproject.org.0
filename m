Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id o4rkMdi6HGqRRwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC16182A4
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323478.1589251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxO-0007je-26; Sun, 31 May 2026 22:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323478.1589251; Sun, 31 May 2026 22:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxN-0007fx-Ls; Sun, 31 May 2026 22:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1323478;
 Sun, 31 May 2026 22:48:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxM-0007Tq-LR
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxM-00BFyL-2D
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:32 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba9e-5cb7-0a2a0a5109dd-0a2a4508c056-24
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:32 +0200
Received: from [52.101.228.92]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbabb-63b5-0a2a45080019-3465e45c1533-5
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:31 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:24 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:24 +0000
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
 b=GhzpwkBhKvbFzTNhACp5SEuTeee9C7hhyt/3Ppih9lX8sSezcpXvsz0P6oPiLU0T4KmwxFtIEZD72SYGwmYBmB6il6wZYL7FB0ZahEZGodg9ZGNsvoaA0n9S6Ln5U9mSrsoJB1KNlyWzAY5GqSnui+8C+YZJyu6xITzMlyB+4Zj10V+dsWiESJTJ+LXqmZPpdtL7xkrQ5jkfChPYFkV1ErgiQ6tR5VjimBuRvkLXu0PM3a0YYuNLb+1bcwa2nWOdJodaOmBE345wXQXAI1WfqI71nxGydUuANzVeECnBYI9XzOSf+MSiFdEbOcf99/kPQ2DEOC8FssG1fazmrdIysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1fpEhty/L0qcXw9KcXU8OLmSzP52ezRWu7E5NXmfus=;
 b=dHb2LgQS8Gni1HzEbE4mUDHK8TrYvJ4ecp4bjGk6dPowI2xTIMF6+X1RD7Hitg8WQyhMI2PzOfX98wEtxk/1BdViS3hMNf1hp0xz068vOJMdC4xpWSYT4G8INjxS16B4Du6M47nls3nQFmHnINNE4oNJ6Y019I6Am9GfQMSi8tfmkZhSdtzeA5fICcOp23qjaKf4FHn5mAWadPBHtr2MX6peTwZBffTc+E/3vMxLkHy0wJi/xeTa9shZccgjLjWDTlO2zSuFdtfQub24RvztO7Dua4J8A/CTK1qxhfnEEU7E0nrJmX94/YhiUP6c5p/4a7aIP4kY9YJBwiNrnndLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1fpEhty/L0qcXw9KcXU8OLmSzP52ezRWu7E5NXmfus=;
 b=rKPGCe1sb7nEtR+McraBYzKZr0kBnkds7LDGPt8t/AEUKQuRzfviWmsSnegJla4gOs8imR2W7Mqa9YKZ2tPdLr6GLGAew1vbLODeUhSurxE3s1q5usREu427Uk6xex24S6JmL6dOOjEIqEqYgYhpikIUIR2GPjZCXcSzZOWoK7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 12/24] tools/libs/guest: Allocate vNUMA memory from associated pNUMA nodes
Date: Mon,  1 Jun 2026 07:47:42 +0900
Message-ID: <20260531224755.9481-13-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::12) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4fca19-caef-4e56-1eb1-08debf66b8bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VUPKfffV0InkQ2UIAVIe8T+rDD3Wj9GgynshFFk3rO8JQRWR1Sx7embUR3x33h8bTVvlAxn/2/6wFrr+wOJLjf2McKnktJTLfvRtxWn4wITnuIh0lkn2JDJ0bZIztWVngmKQt4pEuB46rH4Yj2UBkFJPQx35t8L/v4Wz8+ZJSdxCqt8OdF+i3vjW9AFmGvLt5gYXBykoqa4i3lTrxZE+LDLqAJSQR2MYR8fittMOk/yAkOfO9RhU6p969bg1E0zA8FjL9guY2nFpp9liSL1O430UlDHR5TmPdIIuziy3cVBb9eK3W+AAqrXw73uDpDQZgHtlOwnE5ssLhYBnK2Zbp232xpu31RCrAo4gtQh/baTRKoPai+baLZK3XQxA/86e8d6I2DI/HPMCNXBwleR2yV9I4cxmnFF1vGvgBaBrIsN5O846pdg0aPclqeXqufSGGxLjqBox7ircR7qRgT24zTeSvVzDS5YaFS+2ncMWHq/f5CiHy7yqNByk9SUhXhiz+Ur00M4TMEO5LvDTemiV6/EkI8HW0wJSnx0kkFvh9tf4iV0ZsU5XPf1w+E7VQYg9mIw0FjXseszDlEZtc7IOcoluEs3BKbi870Kq9MtXN0IPQUXqe5yI6vN2aYVTbfSZXrJctHe2rgO3XNyGmimhH8azmnZDMGGtVzoJ+MqNSExH2HvGTdYFD8vZUIF1LHJH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XWMi24sZE91OrLqwAda0Vldz8WN9DnR4sX+Z/blioztWshUkKxeIpGtq1LuX?=
 =?us-ascii?Q?Y1z3jfOsGzR+mb0V31FmG6EgelyjrNZVbqfbxQX3KTCmCl2Svl6XKvrjm+rK?=
 =?us-ascii?Q?2Vzae9kyFigOUBV8JqhM/qW8DCx8iIWv8G3Z8rqGi5ZQsHDVLTlh68z70LX4?=
 =?us-ascii?Q?62Q8SPljvVIwY/zRhY37vOkyks0Xin4E1cOv9RgxOp8ZyJ6lSEJvZNG+st7f?=
 =?us-ascii?Q?VjwZMIQcFtvKO5CcVt2w6VLIJA5+CYbBKP9KAwZ8fn2bgeldlCVN8P0Lb6BX?=
 =?us-ascii?Q?W/19Bq+nN3mjMEJdz35cuGm6jjp/uZZAnVGtfmJbDZopQEvwwnbwSva4RANT?=
 =?us-ascii?Q?2gVsyPRx0JJs6f6dxxTFuy1kO3IyqNpzEX42QWyr6XeP6CEoLfJcIMx7fdGy?=
 =?us-ascii?Q?ZWKaDVupqpgiAjvx6vetUrYXpls9c2WfSXsAsx4qLSU2MPNNYBpm54soI4A4?=
 =?us-ascii?Q?4FkbpLTJBzxa+2Bqxk8AL3/DhlelOdK2eoqxcJtG/r1fjG7FKvMs6XO4yJK3?=
 =?us-ascii?Q?TLByvYNPyXBM5i9lfAdT4b0JMe6WNsO1sCTAViDjZi2acATrnY0W9T6RWYZD?=
 =?us-ascii?Q?ZSAKk1YK9Ey0yfVD9dLIp/SbrePLIgLYLyEEShQQL1t6n3Y2S+W+UxuymZvM?=
 =?us-ascii?Q?q97LPjATaj7cQ0r3SCeiq6fa7tKIZtOnCYA46cstqwz3gD2DGwJ1nRARR5wF?=
 =?us-ascii?Q?HnDhrfRd6QLNLKoaDH+B4b7fKQuIXsbGL7/ioBHOI7BFEJuEDLH0aayvM+J+?=
 =?us-ascii?Q?T/3cjX6cn+Tgb1roEDfY48SXsqedzRL9hIaZLHxDns1wT4evUhOAQ9RVnnjW?=
 =?us-ascii?Q?qJB13mWe3ESHKA00zxofNWFR4yIAFLlGwwjgSl/oKeIpsDk/E2rh+FPnLMcv?=
 =?us-ascii?Q?VcTpwG6GZjVVUjERUHPU9xqNanFePxa/VomgQbtXK6uH9aYaIs5LEI3iun56?=
 =?us-ascii?Q?jMZfEYi69os1zJoZJdoi0LfLei5BSxHS9yGiiQ8h7vWtPTmvpOSJ2c6JJh4+?=
 =?us-ascii?Q?XcuWWE2ovLWDR7oEp8VX0Wo0XRtmMcMOoYUcqivyH3E69kDHPbEnfOFUZKvF?=
 =?us-ascii?Q?Lkvj8YzZX+KmkWLtn1WumGqop4vfokoWRqQt97yZ2M95I1hcP/LyMGlTXhUk?=
 =?us-ascii?Q?B9p2Gyo4GTjsq5VZSOBeDe83jsp5Un8dHCminsB/5zd4lsxu4ZVo5GY044gr?=
 =?us-ascii?Q?oe69J2eTPS+22d47SM9d545lJDs+mQGLFbYmQcdbSYh8F/LPIpVZnb/Owy0Y?=
 =?us-ascii?Q?lwym7L8dUvEh9rFCg3+WSxKcLrubfkan05jjWp0BWxZ0T27nN0fZQsAx96oE?=
 =?us-ascii?Q?WKnC2UwDHZxYQeRLYcEgxQ3PS2fPgS+/+yur8VfBTEaTQoXCig/ICy44MqYj?=
 =?us-ascii?Q?hDxjJ5oD1JCR6UETxwXekQdd/jEdbQCfJvxJ1a2z9KVnJz7ODvRmdxwuV+R8?=
 =?us-ascii?Q?856pQtxIU8DHzmu7buL22U8uzKp+plVkYULS28ejOTlGo0K/iqM503/uDv4/?=
 =?us-ascii?Q?NXydER79mVnCw6hTIj9fDxxybahbqonBTMu01PlkmcmBlXQxoSKjMMiIXfkQ?=
 =?us-ascii?Q?ky7qNNL+EHXtA8uSTYJK9+W32dG5wShm2s8c8z9hWQwuyAgvNlijIkUD5dRt?=
 =?us-ascii?Q?fIrgxyvNM+2qUcnCP/OtPwUMZUM+ck2jFgJFFumt2vuerIdhvlj6E4zNyZBo?=
 =?us-ascii?Q?l7Qhyjmr9VJtcal5bUtlmnz2pPf7DEr+ZOK0H4gvlpeRJaFfxZCrLk1RUYAh?=
 =?us-ascii?Q?6qE0ExjLuwTLTTduOKEOYnYGIzAewvdqtCirQlakS4cBGkOR+Bh7h34ks27e?=
X-MS-Exchange-AntiSpam-MessageData-1: bSk9cEScBah0cw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4fca19-caef-4e56-1eb1-08debf66b8bf
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:24.0787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gbzln7Sm0ZiTZuUcTuvY5WDOh1t267EYITLxLDcA0/2doDGmQ2iEQQcpaRxrQrWUHmor8k5tTWU7Z/KSN2kwFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c1860d/1780267712-BE776DB1-9FC8536B/0/0
X-purgate-type: clean
X-purgate-size: 5735
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C5BC16182A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allocate memory for domU vNUMA nodes from the physical NUMA
nodes specified in the domU configuration file.
---
 tools/libs/guest/xg_dom_arm.c | 62 +++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 13 deletions(-)

diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index c8d0918506..6beab17e48 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -236,7 +236,7 @@ static int set_mode(xc_interface *xch, uint32_t domid, const char *guest_type)
  */
 static int populate_one_size(struct xc_dom_image *dom, int pfn_shift,
                              xen_pfn_t base_pfn, xen_pfn_t *nr_pfns,
-                             xen_pfn_t *extents)
+                             xen_pfn_t *extents, unsigned int memflags)
 {
     /* The mask for this level */
     const uint64_t mask = ((uint64_t)1<<(pfn_shift))-1;
@@ -274,7 +274,7 @@ static int populate_one_size(struct xc_dom_image *dom, int pfn_shift,
         extents[i] = base_pfn + (i<<pfn_shift);
 
     nr = xc_domain_populate_physmap(dom->xch, dom->guest_domid, count,
-                                    pfn_shift, 0, extents);
+                                    pfn_shift, memflags, extents);
     if ( nr <= 0 ) return nr;
     DOMPRINTF("%s: populated %#x/%#x entries with shift %d",
               __FUNCTION__, nr, count, pfn_shift);
@@ -285,10 +285,12 @@ static int populate_one_size(struct xc_dom_image *dom, int pfn_shift,
 }
 
 static int populate_guest_memory(struct xc_dom_image *dom,
-                                 xen_pfn_t base_pfn, xen_pfn_t nr_pfns)
+                                 xen_pfn_t base_pfn, xen_pfn_t nr_pfns,
+                                 unsigned int nid)
 {
     int rc = 0;
     xen_pfn_t allocsz, pfn, *extents;
+    unsigned int memflags = 0U;
 
     extents = calloc(1024*1024,sizeof(xen_pfn_t));
     if ( extents == NULL )
@@ -303,6 +305,16 @@ static int populate_guest_memory(struct xc_dom_image *dom,
               (uint64_t)(base_pfn + nr_pfns) << XC_PAGE_SHIFT,
               (uint64_t)nr_pfns >> (20-XC_PAGE_SHIFT));
 
+    if ( dom->nr_vmemranges > 0 )
+    {
+        memflags = XENMEMF_exact_node(dom->vnode_to_pnode[nid]);
+
+        DOMPRINTF("%s:     on pNODE%u for vNODE%u",
+              __FUNCTION__,
+              dom->vnode_to_pnode[nid],
+              nid);
+    }
+
     for ( pfn = 0; pfn < nr_pfns; pfn += allocsz )
     {
         allocsz = min_t(int, 1024*1024, nr_pfns - pfn);
@@ -312,7 +324,7 @@ static int populate_guest_memory(struct xc_dom_image *dom,
         {
             allocsz = 1;
             rc = populate_one_size(dom, PFN_4K_SHIFT,
-                                   base_pfn + pfn, &allocsz, extents);
+                                   base_pfn + pfn, &allocsz, extents, memflags);
             if (rc < 0) break;
             if (rc > 0) continue;
             /* Failed to allocate a single page? */
@@ -321,22 +333,22 @@ static int populate_guest_memory(struct xc_dom_image *dom,
 #endif
 
         rc = populate_one_size(dom, PFN_512G_SHIFT,
-                               base_pfn + pfn, &allocsz, extents);
+                               base_pfn + pfn, &allocsz, extents, memflags);
         if ( rc < 0 ) break;
         if ( rc > 0 ) continue;
 
         rc = populate_one_size(dom, PFN_1G_SHIFT,
-                               base_pfn + pfn, &allocsz, extents);
+                               base_pfn + pfn, &allocsz, extents, memflags);
         if ( rc < 0 ) break;
         if ( rc > 0 ) continue;
 
         rc = populate_one_size(dom, PFN_2M_SHIFT,
-                               base_pfn + pfn, &allocsz, extents);
+                               base_pfn + pfn, &allocsz, extents, memflags);
         if ( rc < 0 ) break;
         if ( rc > 0 ) continue;
 
         rc = populate_one_size(dom, PFN_4K_SHIFT,
-                               base_pfn + pfn, &allocsz, extents);
+                               base_pfn + pfn, &allocsz, extents, memflags);
         if ( rc < 0 ) break;
         if ( rc == 0 )
         {
@@ -415,12 +427,36 @@ static int meminit(struct xc_dom_image *dom)
     assert(ramsize == 0); /* Too much RAM is rejected above */
 
     /* setup initial p2m and allocate guest memory */
-    for ( i = 0; i < GUEST_RAM_BANKS && dom->rambank_size[i]; i++ )
+    if ( dom->nr_vmemranges > 0 )
     {
-        if ((rc = populate_guest_memory(dom,
-                                        bankbase[i] >> XC_PAGE_SHIFT,
-                                        dom->rambank_size[i])))
-            return rc;
+        ramsize = (uint64_t)dom->total_pages << XC_PAGE_SHIFT;
+
+        for ( i = 0; i < dom->nr_vmemranges; i++ )
+        {
+            ramsize -= dom->vmemranges[i].end - dom->vmemranges[i].start;
+        }
+
+        assert(ramsize == 0);
+
+        for ( i = 0; i < dom->nr_vmemranges; i++ )
+        {
+            if ((rc = populate_guest_memory(dom,
+                    dom->vmemranges[i].start  >> XC_PAGE_SHIFT,
+                    (dom->vmemranges[i].end - dom->vmemranges[i].start) >> XC_PAGE_SHIFT,
+                    dom->vmemranges[i].nid)))
+                return rc;
+        }
+    }
+    else
+    {
+        for ( i = 0; i < GUEST_RAM_BANKS && dom->rambank_size[i]; i++ )
+        {
+            if ((rc = populate_guest_memory(dom,
+                                            bankbase[i] >> XC_PAGE_SHIFT,
+                                            dom->rambank_size[i],
+                                            0U)))
+                return rc;
+        }
     }
 
     /*
-- 
2.43.0


