Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IawL9u6HGp+RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A424618306
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323517.1589328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxd-00037m-P9; Sun, 31 May 2026 22:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323517.1589328; Sun, 31 May 2026 22:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxd-0002uW-78; Sun, 31 May 2026 22:48:49 +0000
Received: by outflank-mailman (input) for mailman id 1323517;
 Sun, 31 May 2026 22:48:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxa-0002dW-SZ
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxa-00Fm16-9M
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:46 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba94-e002-0a2a0a5209dd-0a2a45059030-40
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:46 +0200
Received: from [40.107.74.72]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbac9-aaa8-0a2a45050019-286b4a488211-5
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:46 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:44 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:44 +0000
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
 b=vp3Xi3Z9sJgaxeHqtC0xyNEuwdq8qStvMvGRDJ915w5mEbZMsKR7d6AxhmdvTA8C4KxEi2Hxr+8Q1L6KdCKgQ1S4j2QNWXcU5d33v1jRkae+ungc4q9Cf3K/MIY3kBnlQMcFDts05VBBrpP25eh/ueQaz46yZM9YFbVg2l/KenPy2LvvDRLh/54KkYlYRPQ4hDwWinyDNs1R+ts1t1Yv6g5R32wA8jWUOB0AJMaLaOS6nVeMvinSEvuhGQPPdUxbQJLp4s0FDggBjDyumLzGH3o9a6SOlyfpHoVkGC5rlVhGk+ud5KPBTzEL2HMec2CNmWN8smEy6IK22EzerOAoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QuO5xKA+OIjYqQ6fhQKlx60t+usshVfR/LPkpUASg8=;
 b=JeDzHJ2lbKaDYe4W4q0rFTl2pA5nQi+nghna+uIwB0lpbCPOKy+XTQwo6C9WFSIW+ux2brURbSJf+iHSKPhkTvSHnsxuYfeNlxtvq11VAavP5kedBtcvotJlFxrOPyA3En3d1ybBfdOjZ1rQ9NXupOs3HPXVlluEt+KlDFJA6l29aZBeyRLRn112colY9/2A+C8f3ThWkOT0+915TII3TGiC8czg2kezpcv7QXquGpHeqlO+aZi0Yate6Jx33cyznAyodCDk4/Pa3dg986Z1he6+M/JcD/qQ461HH7IlAmtBh9Qn/0tjF0chkx04qDyiTAHqb467wdI1+0Pxjao/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QuO5xKA+OIjYqQ6fhQKlx60t+usshVfR/LPkpUASg8=;
 b=wbciOWzfwifwa5XOyreGKIe9018F88af4WsV3MaA8c8q0e5OLHneGJIgbbkTKwU16IjunYoGR9qXN7ZmyT/q9ShmTAS1AQgEOFTLGyTvuoSlczOO7kkh165e8VrXS7YxJnT0u7zhv5yO6mABx+c1uOEXxkeXQKrROxi/uBO89Jc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 23/24] xen/arm: Use dedicated function for Static SHM Device Tree creation
Date: Mon,  1 Jun 2026 07:47:53 +0900
Message-ID: <20260531224755.9481-24-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:405:379::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: cb660076-0a7b-4a80-3b1d-08debf66c4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	X56eCUsDMDlkksp+/n0hpvle4d7x+JK4wADV6pAViumoJJHgT/rrnjcrfUbALctDWm52WV04XfzG4AKtItrN9GzSMuFnrnk1cmhhG97yH5r4wnjnIPxtcp2tY+dGc057gYpi/yM2YijLpAPu2aZInQv/TLVmTsdXOp1tGgH5Z9w+auVw+HoYbq8N0gy5urAysOgiYypi7rJ11Cnxms344ipv68OBJ+CZm0quKHAtZgaUZujOyY3A8RpPlA+xOPtuNHmPZ6pYofI4+NL6PG1y/A1lLPt9vAREYLF5I4a2FwEbQfVrNG9cvpf4dDb0olaeuJrJwrRW6Sx/WDQeaCP09zgu5NqVqulIO5aKLnaKirusP3dJAfR57Pc+Bds49spYNbnL5CB9AfMcWCH1XYKn3kwuLwA3h/IANZHPrGljDRlugiFAif0CzlVivAkzaPgzLxoZRSELQRTXok59PlN6oj/L+SUFUaVrZepJVGDDXOp8XWfqXi/hSjfdYELGz4On3zAXnnhQcuqlDhfzz62s/GRDB0vUR9wcxKPlWL0Du+hTAciPDrf92BEASYThRVXlI17qAnivcSUEh44nz5G4zvvyE9RlJOUAHp9jzf3u07JB0OqZHNKzzrA5mgpQbxQ1JrLjPc+QO0zAhGgKD70QWUr2IKPbEYCLEQ+fuNgagXaTr13jhhF9z8ZRQhLbuo9q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r4fc/RWf0I1k/6uxjKEbtJjkWVhkIgQ39q12SWwpGrnc6/g0J9fDxI1k40t3?=
 =?us-ascii?Q?ascf3vfBy4BxvobWlTJP2UpaAkcS9CuPamxv+fLh0d9UAOISJ7vFTU+R9mQ4?=
 =?us-ascii?Q?Tm7nBnruDelwrm8f3w/14LcAGmM1RrA2qrApYCZYhBlNz9uTi3KfvxJOI/Nt?=
 =?us-ascii?Q?FZ0iSEQG4BjS6EKutj3y/BOpyHV89YRJgnmwi0CjXBs7EgNlyuvuh9nCd4BB?=
 =?us-ascii?Q?7R8Ao0CaBJtUjlc5nFmbQ9ViSPir+c+/WWAlkxyVMhmwHwB5TIzLEi9YQYcx?=
 =?us-ascii?Q?ltIyLM+jC8w4l32XAf7gWBRk0ni8RLTbf0D/fGs0NSTFOVeMcLoY1v91zyrD?=
 =?us-ascii?Q?c13LxQ7oB5MXbNNMqxUWG+IcWQ+v0QUg3kdv+NvH5+CqEno6RS0zdXnT5xmg?=
 =?us-ascii?Q?id//Vx8XCRevid1OCpu0Rz0YeT+Mo6cgzFqzHwAaCiylJIfnAxjWt0A6gs/U?=
 =?us-ascii?Q?dc/CRQi/n/x4ApCuZzxhilpKKnn0qqwqaGK+zjotHLDCTHxmpXIBaoNzzp9b?=
 =?us-ascii?Q?kkdfBLEjlkaA7GD7w28c9Dxw/8QKXBx8FLXtw9hvBkjTqQON3eNdtlZqm3bx?=
 =?us-ascii?Q?VaYZ8TrEByirUaD9jY55P/S5Q1L28cdwwSXDheREsd2NdIFP+n2Jx4Kkv2HT?=
 =?us-ascii?Q?L1cxi8yUoLFSWGQCol+YxN2DMnskZUsvBTN2w0hZCZDtUp+d4Ks3ZcvAFe6+?=
 =?us-ascii?Q?Ec3l65JW8oJAE+7a22P07Mrg8m9+2avpYr3tFEW3GYaZs0CoNCMAjcc4eK9y?=
 =?us-ascii?Q?YDfbjzWTYG5tCoIvds6XSDbSzaTMcEp7lkL++92U1Ir994zxPlgF16K9tDDa?=
 =?us-ascii?Q?g3uhI1YSKhocARgvRqOzEejDczP0MvPmp+hffKEdBnmaV0C8uqLzmIM/T2Id?=
 =?us-ascii?Q?Ow2UhymqQSFYqecLpms+WhRyow9P2OlITTw3IWd9rA8vSROajoqQDGhlkSrR?=
 =?us-ascii?Q?vVyKhfJ2MyX35bGNGXbk0FuI3Ai57mTRarCk/1ErPQyD/buaMdCOmQm3ZAQ7?=
 =?us-ascii?Q?NzPKNpJikY6TObKXMSiruAvAytrTjaLTJOyZaTfii4HKAOMrpgR9i7t+9oK3?=
 =?us-ascii?Q?Q7P+j4q8abfpYUCXKZU071LE7Gjrlf+Dkmt9C8PzNHQ7Sgl7sBxPWtkR/t7h?=
 =?us-ascii?Q?+nCvafZ2BAHKZ/WQkGBOIgEhsRq7AuRx+pvx2gjumN/c16bc5qTcvyJammMu?=
 =?us-ascii?Q?VXtb5PG2gqY1K5hJvi/4H1XAGeo/VAHNPeQNqh04RhnH/jnnbB7UjPK3V1bU?=
 =?us-ascii?Q?f6+djHGYWlY6tXzVJ8UHsF9NlzzSRmTzkgrl9dJmclkCPboaM2LrwlpUD3jS?=
 =?us-ascii?Q?OEFWHNQoIvfr/q9ei6zBDqGpqZqwx/0FMHjqkLHj2xrgRLCqJWyB8kakTMla?=
 =?us-ascii?Q?jnbwNr60seSCZUeaPZdcj7ErSbmimpTlL4hSIOXNm9ZFbTWAuda6+UXC66lS?=
 =?us-ascii?Q?8D1c1TKAPMXZjEY7jnqtBkqITGVpWrNcEYnNOGK2R9mQTa2rPHl9pMHJBAvN?=
 =?us-ascii?Q?rE//kJOBNLz+XoR1amv+9z1hXFyl+DbapRkEeRvshDEmw4zG6UdTfzFSIfr4?=
 =?us-ascii?Q?Qd9upTxen3DJZkjzmy6Ttepn7n6KnI9bDelCHTieefXxUzXW0LUs0NNa3RnN?=
 =?us-ascii?Q?c97X7JxpX44SAzCl6SsWDccjWPjj8vNyeYPHXNJCr4AVs+IrK9YtBDPsztt2?=
 =?us-ascii?Q?DeMFzb9M1BINZBCdc3IaGVldJSqJghBhF0wDvdBxA0uOGl6D1AAlp2ImmZJv?=
 =?us-ascii?Q?ajXLuWE4VluWW9uCPKgYsCpGI76n4xQmpbsqKSdFnHGj5sqUZKHzp39e0sdv?=
X-MS-Exchange-AntiSpam-MessageData-1: oYA1rPtRy+k0NQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: cb660076-0a7b-4a80-3b1d-08debf66c4c5
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:44.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EkPQpLCjCNxzIiyNsKUUHvx8SPHNzA+D9TjcedoyaP1DlF8IW1VMO3eGQ6aL71uQU5O4To6rFt3pNZc7t64gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c201ff/1780267726-D9573443-59CCDCD9/0/0
X-purgate-type: clean
X-purgate-size: 2876
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7A424618306
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
index 29b09e3da6..497789ee1c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1807,6 +1807,12 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
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


