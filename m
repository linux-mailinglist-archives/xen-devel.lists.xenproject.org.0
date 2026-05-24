Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN75Nj5AEmpCxAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F65C0E8C
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318205.1586641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJ2-0005iZ-2Q; Sun, 24 May 2026 00:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318205.1586641; Sun, 24 May 2026 00:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJ1-0005c4-Rn; Sun, 24 May 2026 00:02:59 +0000
Received: by outflank-mailman (input) for mailman id 1318205;
 Sun, 24 May 2026 00:02:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwJ0-0005J0-2N
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIz-005yCJ-EP
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124027-e002-0a2a0a5209dd-0a2a45028cbc-12
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:57 +0200
Received: from [52.101.125.123]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12402e-af86-0a2a45020019-34657d7bfa90-4
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:57 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:55 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:55 +0000
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
 b=WjaVTkjGtDCM4cyk1wUS4zep+gOWn5jb87nPJI0aYuFJX0kV5dlCy6HZL5J8yKl2RQQvdk3szsBU5EBp+lUlY2zLuYBbQahLkwG8uTZqmon/2kLjkQam2KGJ/zeCRMQtRRdt/FsevNw+96n0EFWT0yD3AlrYjw1YFGh0DzSRv5EkVdvuj+j+2geXJ6vvfLQyLNZUFaBEJEA2vp5wAxUqd5jas5Plu1VJ/Rx+0XhPPaksC3jrkj6B+3eDw16Wuc0WnIOcb9nSDWcvKuXJrkWP48A2xI3ZCDoieLV70NqeoPDyC1sKTqWmXiEt4ajSmKnbIj0t8dPq/BMV34Fq4yjtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0S1ZqEU1iZpAsWT1zego46VY83uaoXXJ+aqFDfCXlC4=;
 b=hda81wSSR2XKn/b57SIwcYHNSVANGxALEsPS9hGrjUe6H/pfUqOlbQ9fs+VCi+wHNio/j6mQXQlXpzEtBPcLiXgYEPC24LnsvF/WnD2c3USaxeHN/mHJrh3YrlF52EPQO+j8b61ZPBYpEHxppNMuapZ1tNeLGfFoXGqHXQVdh4yHPNibmecKToA8nVfaKQIUMcFGrXsez8mo4Vf9BfE33WfQgZSBqvFaNxsYo3fSyRn21nQOmLtqY6aaTWA7bDy25C4trTHCbGnr5Cxvy4c+GTezCx6mzepBWGCs9j4ZwTDAXGrVEBolgFsiWbzGINfhiaNHGm2aEZGQHca7l3iGWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S1ZqEU1iZpAsWT1zego46VY83uaoXXJ+aqFDfCXlC4=;
 b=PuL7RHBHx+ZJhJyH2giH1vGxr82otAm+F2ab9JvjbY+Dci2A4ICqn6itLOCklezthvZR+H4v7PSHsBBP/Hj2pNce5MbwKtbqvg3hdaVf+NCiyDCAJMRA5hFjLtRRuO4p4kbPFzmvIzn/7sFEkoWd6B7KIXZvmTbaTToMP1t4fFg=
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
Subject: [PATCH 13/21] xen/arm: Introduce dom0_nodes boot command option
Date: Sun, 24 May 2026 09:02:01 +0900
Message-ID: <20260524000209.292370-14-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::6) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bbae734-fd43-4695-d7ef-08deb927ce68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	uvLhSOSYzjFmc1nmw6ifXTugRCpBxLnaS0/5e6gRSOXarbAPJcbEdMEwwV1najZjnLpM37fkja6d+0vKiW5PqUrQgkSif0E+MhA43Z+CUi42MqUltJZcAigeZbO4dL/qs8w4k9Wh+Tb6Gi0YHPqfj2wxWnmt7XRY+AZYo94px6eYop/fHXAmdV9W0HzCaUqgq0ZT1HcfuzdT/iS/ggl2LiBRcoqfw+xpam6Ev4+ZFVV9Ml5eUuChDvaM9T/JDqYwyBENwTpsd/6DvN5KBp9sCULHGjCwV5uuUlyDh+qgM66BnbRKb1PYCmo4xc8Ioq0PL6u1ZuzEy21XjZKFRLwVfWauZJ+L5/KwrwLPn6co9LAzdpXYYPozgiQPg9yOfsoa6xeoY6CZfyZ+kbze0ecmNYSjc1AP/d+Q94PKu+3ahAtY4PZH7oPoRAh8BwSY2q3/oth84TPOCGarTD+ZerwcVUXO931SnBBdR10Hz2B9+v6P5QMO2d9xpsFStDDp5YdDBa+znI7ZPP7CuP8X1AA11uCcWir9I6uAkam9G/QY936IT7cgiaJVsT/j/Wqs5G6JtJLnDPdrFNUgxbURx0aOBddAv4OhHkHcSXjwhY75gSmB8PN+7fSqdcxS/pWc9AuJ1QcEKWGJVIJzKQ1ApDfqTxQvcfFbgbznj1afa4JrTa77RAftStdSV+Bhnfcs4Ii0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QgDnZVR7ApYcQnlZrIHkZZ0F+6wwPCegMj/5zFaxVgkqFXn0SEb/kZQqZ4yQ?=
 =?us-ascii?Q?o78kN116Qy2lXR63JBAPQcvuJh8GFk8GZrqUR2XPH4AQuGAIzpWaCE3H9uly?=
 =?us-ascii?Q?07/G8Ly3l3WiZ/Mhpz6AnViB9Mtl4TymAHH58v/VR/SYSuRKMmADxnc/TI8a?=
 =?us-ascii?Q?9M1Y1aQVuhfBzNSCjVdMxx9u4NRsTWcR8IJ0niEz+MDq/kn8hJh2D2/0lQ3Y?=
 =?us-ascii?Q?fn7twDgp705xHfYp8oi/dOJ5qx8Mc6kUqAZ50BDKscOdcZEGOxHsC0iNTQVE?=
 =?us-ascii?Q?tEetFg+ZDUmg+sIdE1aM36Y2DO178U0hNUZZe4a2jogmfNEDpks9EprmZ+B6?=
 =?us-ascii?Q?oarVsaDXCrE4iPCGys1wZc8oJV11h0fk3y4iiYr4ekrNXa4rvIuh1EFaJDtA?=
 =?us-ascii?Q?g63D3tFvsMz88Lv9LQKmrC9AQFKywVXsBb96csF7SmXwMZ5OOQatFRxeaX+b?=
 =?us-ascii?Q?9U2twPOFhhTBZQWTlnbWUrQ6oaCWELd3LfBQ9pBH81JDyr8P/lafGOCbmZGl?=
 =?us-ascii?Q?c6WjLD1dl0nwbBCHx1bY5bwpLogqAd6XZGNpR14un2fk8HQf/fUG2SwprFXC?=
 =?us-ascii?Q?8xsKs/EkYb9d2TSnxxDfw3kCn7Nl8GU4c2EpIG9Khsuj+5LNMgNJn0dunTJ+?=
 =?us-ascii?Q?aOFG5qkiUfWzVWlDvBJASOjmBeXj8jcjEiFwhsNlL3+4L2l1yelot7KnUDI4?=
 =?us-ascii?Q?+pxzdeZp2CXEqHSllptTFJHJ3/o4ADIGfngj7lCcoe24k/D4YVFYuDYKZnaU?=
 =?us-ascii?Q?mj1Zy0QISmNPyKx22ZHyLJnXdaj8dy0/fo80t/C5FNj8P3DDXtnvgLqtJ5FL?=
 =?us-ascii?Q?94+BIfzBHGFOuVHmaYkpuQw1gHwsikod9Vyl63mwOq5hYOZ4rcYgmN69NRfD?=
 =?us-ascii?Q?LY9I5unVlVpGui61C40IwxtUkzauxIBhqh3q69FuawR9+FEOT/yiYWdgOUuV?=
 =?us-ascii?Q?aiRJ+AA/rHFViCYBsMzSQPqZhW42kla5NXYUu4gnhsnIypCm9CWMngCf0IIN?=
 =?us-ascii?Q?5nWBcrxVxcu5+mTpHYPXbV6y2bAf7+/gazIz3eO7Rlzzo79uWH6ervcJDiNK?=
 =?us-ascii?Q?lYc6ep4owEkf85AI+fhnXQ4TEXVZ5iFv02UJmQbjAGr3yEP8ZJV8p1/08P4H?=
 =?us-ascii?Q?Sc2ixKXpXqZ6IAny99f0HG6JZpfRCTwFTY8NGpCypuAlS7N6FyV3Xq4nUtdn?=
 =?us-ascii?Q?T7HodHdWV2dvKgTeeIHki1IZTjvKGC9JJerDB0sXNDEBvQFUcvp8m1JHvGG1?=
 =?us-ascii?Q?UY5RYgeIGDRY8X1g4xHI00fGW4IrzCoSe1OuUGn6SBnCts+t//gqvBZ+weJ9?=
 =?us-ascii?Q?WyUmaY9RN8CuGwzARbVGbsdThqUNgw9sLG8ChaeJOhJfWFc1Ov4bPh1I1GjH?=
 =?us-ascii?Q?BIXUtRmaLPu29AXJP4STFrs6eL1SSg4/DkYwB5WKo3tgntKTfxcu0aw4EdoZ?=
 =?us-ascii?Q?gGeTAok6mFT+cjaEGnELcki0HVvvHJqW2AxoxVnyX9OaFQ7mCmT0fOcEGbrT?=
 =?us-ascii?Q?ECuF0ukU0Bi3Vtj/a3dfr8pD9iZdSz3BoxsdtiksdVFwGm3PoJxmSelvTHZU?=
 =?us-ascii?Q?mCjbj72rv1bddLMOnhvp4GIcMsjIMAqRq3F/9/a392d41NbL23gXcNd4//cU?=
 =?us-ascii?Q?yZp1zRZKuI/GpPXVrQDYq9xxIazNsn7wuVP49thkExhlcWJJcUwouZESwCBK?=
 =?us-ascii?Q?UjKeMARqjF+/PZzR1vgvTXQFmWxRomD1r96XDt8bUSxDpzh83Rsh68kTyaUo?=
 =?us-ascii?Q?r4KCRiUdNiRqXqnH6Ujclk6B44zqNtqS8A8MHLadvewwzpNFU1034/WXdQS6?=
X-MS-Exchange-AntiSpam-MessageData-1: meCNeP+f2g+jqQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbae734-fd43-4695-d7ef-08deb927ce68
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:55.1715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26hgt7+lVK9DIh6RDyqqdw597vNA+ph6oa84XcWc2DSFHAiw1omibO7RKhqsxB3U9sZLBuEz66G2+CXO7LKkeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-720697/1779580977-81772161-83771ADC/0/0
X-purgate-type: clean
X-purgate-size: 2009
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 908F65C0E8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow ARM Xen to accept the 'dom0_nodes' command line option.
The syntax and format of the parameters are identical to the x86
implementation. The logic that actually functions based on this
argument will be provided in a follow-up patch.
---
 xen/arch/arm/domain_build.c | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1efddc60ef..f4187512b0 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -37,6 +37,7 @@
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
 #include <xen/event.h>
+#include <xen/ctype.h>
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
@@ -66,6 +67,48 @@ static int __init parse_dom0_mem(const char *s)
 }
 custom_param("dom0_mem", parse_dom0_mem);
 
+static nodemask_t __initdata dom0_nodes;
+bool __initdata dom0_affinity_relaxed;
+
+#ifdef CONFIG_NUMA
+
+static int __init cf_check parse_dom0_nodes(const char *s)
+{
+    const char *ss;
+    int rc = 0;
+    unsigned int nid;
+
+    do {
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        if ( isdigit(*s) )
+        {
+            const char *endp;
+
+            if ( (nid = simple_strtoul(s, &endp, 0), endp != ss) )
+                rc = -EINVAL;
+            else if ( nid >= MAX_NUMNODES )
+                rc = -E2BIG;
+            else
+                node_set(nid, dom0_nodes);
+        }
+        else if ( !cmdline_strcmp(s, "relaxed") )
+            dom0_affinity_relaxed = true;
+        else if ( !cmdline_strcmp(s, "strict") )
+            dom0_affinity_relaxed = false;
+        else
+            rc = -EINVAL;
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+custom_param("dom0_nodes", parse_dom0_nodes);
+#endif /* CONFIG_NUMA */
+
 int __init parse_arch_dom0_param(const char *s, const char *e)
 {
     long long val;
-- 
2.43.0


