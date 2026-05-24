Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC3hJExAEmpCxAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4025C0EEF
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318253.1586702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJJ-0000ag-PX; Sun, 24 May 2026 00:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318253.1586702; Sun, 24 May 2026 00:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJJ-0000U0-J4; Sun, 24 May 2026 00:03:17 +0000
Received: by outflank-mailman (input) for mailman id 1318253;
 Sun, 24 May 2026 00:03:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwJH-0000Bz-E8
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:03:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwJG-00BC9e-Qv
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:03:14 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124008-e002-0a2a0a5209dd-0a2a4503cd2c-24
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:14 +0200
Received: from [52.101.125.93]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12403f-672d-0a2a45030019-34657d5d2f13-4
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:14 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB7274.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:439::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Sun, 24 May
 2026 00:03:12 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:03:12 +0000
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
 b=fm55Sird5tDdAO1dIPvaBSKgYY5VEkXytGLmdosGj137DdK6s0u0jCTY8MMVCZUYBJAm0YwBELH8cWim/yUIM5I6PvI1klkmXXuS6azH1KF3UTpxbIMPlMLlsLKu1IuVFWf1L2FmAT9GqF71dJH4gHWa28iIkUV7buM+q5HE9lY+JEBnQW+p5CHntdh/MUFEY9HrajzI3QDKaua1TmLt2Wj9rFOooyTKytihCs/Sj+xaU0oy8kAuKXbc9vjnhO7p8fCiQKwGfSNxDu96GJ7DzW5t382l7W0z/TTXxKT88CnLyp69/C8eGcT+wFBsjYHzxGYZz++LtznEhRnYoL6BXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIMyeMl9qEVCA5sGzBca+pRibnJkXfuBoWxVr4f1TOY=;
 b=Cq1NCCG35u0VI4Q7BpRlGaSjr+eesPp2IY9LE+L8o00lVTCfvwWK3QNp0aMBnRXeXyjhRq+bxQQhF4ZDDYYANs53B+SMUi5EZYWKWK87aK6glI5l51T9bDaQpISFtlNB6Xrw7gAKNn5kis87cIZT0ULH/bWVH0HvTv6vSNvOO4DyyXFWpkDYZpUDVjAI2geURlNurJ5cbAkpscUxHzsIF9najcclg9v9IPKvbAPTAuacxqpivt5DwzV/0hKpicuY1N2WTbE9l4xd3cS8eKfirkBHX6qp7ZfQiV7d4YsGUurTsnarvhi79Y0payc9yreWdWt8ONSAZ0nLyw8xLKDmkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIMyeMl9qEVCA5sGzBca+pRibnJkXfuBoWxVr4f1TOY=;
 b=AyUyAm3Xshs3rj134WDmYes0a8bkF0UDjRzkZPGBQMC0ySGMu1URw7Ddi08HUUvJww77Yd/3u8gNFJR/6b9iem4jqfStptKX0LMPoRoNlz8ygdvDnbnvlCzj391V2+tvhGyAFDyLNYCuXpzHarRUJIE5LxJj1rzQrF+ri77L0To=
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
Subject: [PATCH 20/21] xen/arm: Use dedicated function for Static SHM Device Tree creation
Date: Sun, 24 May 2026 09:02:08 +0900
Message-ID: <20260524000209.292370-21-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0184.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a2ea70-035d-47a2-bba6-08deb927d873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nC6ByCnNz0rNYETjdlIZst3TBQsiXbjtbTWJ+6Qty+fPJohNH3sm+/h/TOXx3lEd0A+6nWRuAmu+5KTVplE9krEDHD63oYmb0LhyQDDsTXkyVf4m4LeMlmCx8uls/AuW4Se4/L+E7be/BOoaOP+tAzquWBXMiZdJzkzcj06EicrEnt2Q0GVvwwKneGmW7jywdm737xjKm6m752sOdus9v9JItuW8DdFEpITlNRrlwMitXPNrbkZOE7PYdzaU2FSe67ylOHlFVBsArMW5hoLX+dOfjNoRfj4rmosyxIYhJqTZerUeJs/G9BDIHP05DVCZ7bZAKZLEYa4uXHpxr+RaMpKFKuAwv2/fyF4iw14awV0Vi9PS1q6NpObFYqC0zbFOHIPln7w3Df1Cb09aqmfFmNkGLYrfe8qzhG2AgwP1raFfsPg1MjwND/mxdRwdae4x1JpVyFBwrUtuKkJex5V7JpG8KnG760LdkxN7sPCMpeQbwj+qwJ0c+9a9E1A9g8z5KULJ2ht8ioFQLsKiFTrVTJwQn/gNbavoxDbgnh2xTNEGVRrkmQ56LU60bLeh/SX2iwevGQAwKGpw3nU3zUfexSVFVA+1TvQ1WmQ1a8tkIzTJ5aB3lBiX78zb77b4j4lkqyjU+cHZPebPizXcjs/g1vrtdG+IiYvMQ4UgANjrR2tY1GOjzoKSZNqNSM8DSpnw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CpFwt2NbQcqjUwIJlzFmBsIwXeYmWlPW5+c1WCZcm/KCsHSs9ylGucWwoIQc?=
 =?us-ascii?Q?TrvWybxe3HJy0okl61nk8uKDD2kDz2cI3xC1/aIEB6uuz34Q6UmT+Iq9KH8a?=
 =?us-ascii?Q?S9lMopVn0amct09KeVA7C192Ue3tfpqJSxIAe+mqt3sj7F2zu1Nvp18NxOYM?=
 =?us-ascii?Q?GdGmBtIQJtFtizDaGtXQgCij3BCWl/btojsqefV82NSV7af6LV9Ho7OERnFQ?=
 =?us-ascii?Q?lzEKw6ThThrFl4u4TDNFLZh28TS1vIEmMewhxcXVqLsTsm1hZGj1zL7oBFRR?=
 =?us-ascii?Q?FNJ9by5w2p65k+vISQdJ2zz/CTTfc6K7fegFK7TYx7Sf6UG2anPrrVCylyIu?=
 =?us-ascii?Q?gm33lgsTFm1+EUOZaQEmj/9cX8/+x+SeS2cOLB9ERLVQBPEZIQqyVUl+GDM6?=
 =?us-ascii?Q?rW+ronI5jEJkwc5wwBaY/yumU551hIIVgCEnvkw4xYlvcLNZJgDT56lKAplc?=
 =?us-ascii?Q?Y4YiNxGI4NijjcBWPsPsduIWwq893kH14na/cUSe2aEJ9PghmcYYAdO9Zq8y?=
 =?us-ascii?Q?65XKTPZYJSv3IVqY4ihFtpxXpUOvskSNk/Gs7taNZTVuLiwqjSjLIIOlWW9Q?=
 =?us-ascii?Q?BbMNgPZoLNnrAdWA+307Iv/HoAo5OoAj6ij1g1Z/14UwH91C2Aax8P6VcKO8?=
 =?us-ascii?Q?kuiTtI1fWLzo3bYYi1E7Ef6DRou8tEnOjlKsX0T5he1vj3B/A/19rbz55pC+?=
 =?us-ascii?Q?g6H+rpX/oBXAMELXpEa/9o3NHFGftp4qjcFUxaIGQcYtHpPmzF30mhLL+JPo?=
 =?us-ascii?Q?JA2agNVdfCwQNuBaKeTclB8rXJDaWbjd2Okw1zEPao7BveoHYfmABU/h1nN9?=
 =?us-ascii?Q?ckTMAKts5wHZ9znTM2lZFFlabaNplVjEnVVisNL+wBooDykhq60cAdg1nQQT?=
 =?us-ascii?Q?9iT9Ivir86J2ZjwVL12v9FBj7g0GSRdBnhpsYlGERghWP6KOdhG9WZq3nR0i?=
 =?us-ascii?Q?/+X7o9AI6yAofLLfqDmOcwgIezebD2z/3f5RFFoVdTVxHWjP+togmUuyb1qx?=
 =?us-ascii?Q?5lArlgHWozwbr/8ANZl5qo7dZ9c7Klsf92KK1MbLihXk28MuFI2mb6V37zDD?=
 =?us-ascii?Q?W/e18vNQBAwbRttc3aRVSNV37wCHVcBa627zkosUrSJiuN4Y4k/+ep0DePd+?=
 =?us-ascii?Q?GH+14Fgllnha9ioyxUCwP56uROOwYd/KRAEHgOIzsrJGoqkcFampkSwhbqRJ?=
 =?us-ascii?Q?iLzjv9/eY5/FbnmpzR53ehdl6CboTRsnF77RVethHaKp1KkXYEvuaMdbd78f?=
 =?us-ascii?Q?Ak30kFco3/31MCE0aBoYB5KHzyqmgo+Bj6H9cuaL9audzVu/SeseNuEDJXpd?=
 =?us-ascii?Q?vG8n5euuJrXrL/yYssIRDcpMxoIaEKg78oa0dfnyCWXrlYYQO1jj1IU2eRdh?=
 =?us-ascii?Q?pwW3uiEyKQS/oIW2lgbnNKaSJZH9uhrrpQNdPUHZ2H+iHRHCfqAGBBTDx400?=
 =?us-ascii?Q?9g64rLpoIWTzVspKANvY50Cx5tbQpLvhOBOhA0SbQrlTsgkEBozquNkJnO8h?=
 =?us-ascii?Q?Mj6rmG70o9tCvzxvflWfcdmChrxvMiO9M4hz072PtiH1jP5Cq1H86lNbUXiX?=
 =?us-ascii?Q?sp7jI49AwwMWu9nGmtr8pTld97+7jNA8w4MNWDAXEWAhsZq0TZn/7/ZMtY9w?=
 =?us-ascii?Q?bFYe7Hu5w2xcLWxpHFK1VJRp69u0wJB9+ggUXyG1BBT6QUBIOYQIRapp1RJS?=
 =?us-ascii?Q?hX7QoxeyG2E1dwtz3uKNAU7g55C7UMgn2ZnuMvVopG1TziVazA0Py8/wBXyR?=
 =?us-ascii?Q?b/8HwP4S7TFqZ8wXlD5GTDY5IjfSGu/sjDNoegDhsrLo6cRGolC+HvK1lfMJ?=
X-MS-Exchange-AntiSpam-MessageData-1: m+lsLOKVo5ZKMw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a2ea70-035d-47a2-bba6-08deb927d873
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:03:12.0244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lw5YKvLPe27+6+LIsF9LQB2JsgZPfPuZxELn3+wyFBArvj33chJfyCIs0pkqZyCPpLZRVEr7CwXgn460++bGwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7274
X-purgate-ID: tlsNG-33051d/1779580994-3997D938-BD096FCE/0/0
X-purgate-type: clean
X-purgate-size: 2876
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
X-Rspamd-Queue-Id: 4B4025C0EEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a dedicated function to create Static SHM Device Tree nodes instead
of reusing the generic memory node function.

Since the memory banks managing Static SHM repurpose the 'type' field
for a different purpose via a union, separating this creation logic
keeps the implementation clean and significantly improves maintainability.
---
 xen/arch/arm/domain_build.c           |  6 ++++++
 xen/common/device-tree/domain-build.c | 21 +++++++++++++++++++++
 xen/include/xen/fdt-domain-build.h    |  2 ++
 3 files changed, 29 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7960dcd33a..1cd66c9911 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1805,6 +1805,12 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         if ( res )
             return res;
 
+#ifdef CONFIG_STATIC_SHM
+        res = make_raw_memory_node(kinfo, addrcells, sizecells, kernel_info_get_shm_mem_const(kinfo));
+        if ( res )
+            return res;
+#endif /* CONFIG_STATIC_SHM */
+
         res = make_distance_map_node(d, kinfo->fdt);
         if ( res )
             return res;
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 61e2e50062..f846ca0471 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -565,6 +565,27 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
     return res;
 }
 
+int __init make_raw_memory_node(const struct kernel_info *kinfo, int addrcells,
+                            int sizecells, const struct membanks *mem)
+{
+    unsigned int i;
+    int res = 0;
+
+    if ( mem->nr_banks == 0 )
+        return 0;
+
+    dt_dprintk("Create raw memory nodes\n");
+
+    for ( i = 0 ; i < mem->nr_banks; i++ )
+    {
+        res = make_memory_sibling_node(kinfo, addrcells, sizecells, &mem->bank[i]);
+        if ( res )
+            return res;
+    }
+
+    return res;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 671486c1c8..6a809f3f86 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -31,6 +31,8 @@ int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
                          int addrcells, int sizecells);
 int make_memory_node(const struct kernel_info *kinfo, int addrcells,
                      int sizecells, const struct membanks *mem);
+int make_raw_memory_node(const struct kernel_info *kinfo, int addrcells,
+                         int sizecells, const struct membanks *mem);
 int make_timer_node(const struct kernel_info *kinfo);
 
 static inline int get_allocation_size(paddr_t size)
-- 
2.43.0


