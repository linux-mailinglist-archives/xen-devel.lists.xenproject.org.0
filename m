Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKhiNdi6HGp7RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87AC6182A8
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323476.1589246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxN-0007gS-Ln; Sun, 31 May 2026 22:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323476.1589246; Sun, 31 May 2026 22:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxN-0007bX-7J; Sun, 31 May 2026 22:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1323476;
 Sun, 31 May 2026 22:48:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxL-0007Dh-By
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxK-00BFyL-Op
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba9e-5cb7-0a2a0a5109dd-0a2a4508c056-20
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:30 +0200
Received: from [52.101.228.92]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbabb-63b5-0a2a45080019-3465e45c1533-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:30 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:27 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:27 +0000
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
 b=VWhCYBYjgDVRfsLv0+tiBm0H9tHExWCyoDv6ruTxAv8pAC0N4QFE0YhnstNzdJ/Hd6qjsuLwFe4NczQ4s8UT2uzEvy9ebN14uk2yNEK739jh0xSWiV0LAEj0EvaG/HBgSN1TqgKmb+rRhUiWvc34I3JgV3V8QaiSfhia3w94RbYyWvRmf2d7F86CTBJ8VqNndDprk1JNVIE9z1hAY2mbdOhi0HS1GWxye0+MwgQjzscnofpoI/Hve8voaL9CDvZKDmj3nemPJyXcs8RKdL+pkTJOwK4zl5gTV82zC9dXnUEjTF8FEnEbTZJb+0B2HuvPlGPJjWxnw2bJWN74JFBAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJizAY35JSMvsjR4vL6kswffWmnRdXb3uawGnTqPjSg=;
 b=QUTXXRKiFkddXpWcQwdOKqo9JbyE9cylHW/TWG31XgiOn7pAh6YXHYNQAUKTmE1PaDGSwFVvWVpAmXrB5WKdTCmDnDHR3vgEvB5QMdno091nPisDbI2XN8yFJuMukRnIP1min5tY774ZfH2hElUebS/DBpd8EMDe9/QP5JJPIWDAUotLlJFoQukvqC6uR83C/aL6QSu+WdRpx2bBr78UhpMZvWFhI8tAzH6HU2zoYJWJ5QewBMe2+AFU3vfa8fcF4dRlsL2lHjP8MdK55tBbuxLzNEsGaSVfVGLZQaYZcDcuuNjw58WJX3HbxYddkC2x3mqJdwTTEK5+QUgarJ3HCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJizAY35JSMvsjR4vL6kswffWmnRdXb3uawGnTqPjSg=;
 b=LAM03Iq1gMOE6CuP85ATtm/z2gQBmNdichVJVLolgVsGn4mddds10aoKyL3V1gc7TcyGoELM2wd6AVLL67HPgWgHvSC+d36jkoZFKzmJhOEsC54ZIqlwD7hrbzQpyHfdwLedCQxodvkIQCFkcd5wg+P2OI0y8E7kKWAY2Boybdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 14/24] tools/libxl: Add 'numa-node-id' property to DomU CPU nodes
Date: Mon,  1 Jun 2026 07:47:44 +0900
Message-ID: <20260531224755.9481-15-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::17) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: d62d177b-6f2e-4205-680c-08debf66bad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lHvFDjGkktSbTxOgcUdcUwwR0pLpakSx35u59TAfgS1VfChjXEmikLxsJ1WcgStDKu7dYl8Gz+aQ+emKy5qLuuI+kVoCBZF/936Owk8vnq5lzvKYcF4DUWJ9YQY7z4fs7BxiBTYy22ulzElMT8kvyWbAM26KDLSbdvbyDNXPYcT43exnTDAO3Rg5NgABDJa6FfTYxg09RUia+HxrM/hHfYemqrJop3716JFuWuB/s9j0qIf6DkIxedaitG/W6hmFzFh2tAAt5vmnR/hvEh/U/XlNy/hVT5COUSyff3+Hw/7TKv6UThAoYVgtfaHBX6soT/D9GU+TGFbEES7LfMtslI/V9t0EtQjXPvDo08YzSEUqZl0lB/WE4iHnChKR+H+SlMKTK1kWG16tnzSIFSBx62mF3JsYaaKGl5OxpAwtN2st5iPMlOsqtubQPJVSGlMs/jAW4DPvzeMcH2RwKFrFXZD1CZzm3E1CN2pgMnA2nS5V0Ay2sgbxq+fsbzA0XVLZyjKZFr/FxVlEdjtx84enttB/zcU0xQboA7U+FGwUQ9Ge++tOGvDyqDXdmf1tP7GAqmi30N/kPAhY+3pG9qESp7qQkXqUGlTt9ccIsA2ibBawLlRrbwtJ800oUocMJgS35J4LPFGUJ7MfpgFwnWEmBVp7+2cuLJsSzYG+YOcU16Az1FLeM0mT2VqZ82FEvBxL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tbtC/78mxTjYO9BfRi/paVtKhsa1VNOmW3wseRd8sGM4MDsGkgGKVzEv+t7k?=
 =?us-ascii?Q?Mepn6qMkFgFYa2+PymEPzBjVaxwJ002pFedJ4qv1NkbQHwnqs32HyOEL31RU?=
 =?us-ascii?Q?T2QlXOtEgPWd0iI9HmzZ0CoznsjIstlPuJd5gvfwWQ9FThpynEiJ4REe+kIn?=
 =?us-ascii?Q?7XLiGgaSaepzQUW0pvOEIEVPFLHtadHatEUCdbxN0zv7ZMcu+5SgrcQrdrh6?=
 =?us-ascii?Q?wmISLIYBFI+ZOSl9qqR6cBeOccasLGIMt2lVm+wzIqijG8/LbihlZR5vXZ6x?=
 =?us-ascii?Q?NriXx/5/DaDqIwBNKdkNzFRaX4xh+R8JKrm16IloCXi7OmvqyUqf9Dtpm075?=
 =?us-ascii?Q?HXhiqHHwjEM8/P1p6Ee3eDmBp8LP183gtx13Tj4P+tDfeiTDYseEFgkbZ/5D?=
 =?us-ascii?Q?BHUQNCXCjQDQwUghJU9fbH9Mu10TQxJuWpw/uaNcbazebrkfuYsFSldm/yk5?=
 =?us-ascii?Q?xR01snf622woNbFULZF9XJTq5aW5rnKmzYz2XIshX0AG+Hqjg/LEU8f53rxu?=
 =?us-ascii?Q?SIyB4IOaNxV6lWIgnKqX3SvkYEGMbL4E5fgMafkyIBEk2fqxtIjU0J4DVJPB?=
 =?us-ascii?Q?pUF1KD2Wu/zmw2tTZXgTEK2Otdr2k1pkCoDdXknRNNBeNkswcb/inU0BYNLS?=
 =?us-ascii?Q?vSwEIL/1qiSl88QHsrqK3ttCUjmF8sVFSn8sn8aPJFTH4p/YmrkT3P9pJBvF?=
 =?us-ascii?Q?I7RQhh2bNkRFK2lnKzszYO1NNwz+h9QE2xAfWLNGC9JOvzKWYqDS2PkeS/SR?=
 =?us-ascii?Q?X5u/DlVZulz/bxj78UDY9/zffRS3Fk0Klc5loS3/AFRu6kF4W7wp/y7nyc0O?=
 =?us-ascii?Q?bN/ECWRG2E1O+vSIAIiiT9zJ87s83vmR+Io2X47iPL7VNUKkUNhovGcO0wAf?=
 =?us-ascii?Q?L+Ok5yMfls8lP+ZXNxbxzn3H29PYzov1WB+GlvNxqFdQZJBH9kNe7Jaemuba?=
 =?us-ascii?Q?8cg+O+HwVQyWBh5EGMHzbp67T39jh3OfLvxg/5OWNSVmrJZzJMxDS1TWfXPw?=
 =?us-ascii?Q?LfTLHu+NrE1PMIYUXkHLR7C9d9TAjaJk54igysPW8IwcznZc4afw5zO+Fvrm?=
 =?us-ascii?Q?hNp6HPBKMEOwhUk7WmmtvADeDMlljbbNQVJt6NtlbxPfmza2cXcl/iRw8G6H?=
 =?us-ascii?Q?eu+5jqdkrPQWVWJnYCg4v20vgHUhugSdcpQOFZhyGet+6RwgaXnlSJmBW/vu?=
 =?us-ascii?Q?kIMGxd2eC+b/xrdjpWUa58AN9VS/OsA/j+zhtP4uxPbUgnXgj/C/D77dHcUP?=
 =?us-ascii?Q?KnYgMkXFakY6Od36LwIjqfCZhnzOW/X5NTmHV2FiujosyszK0Lu4TP9CWHTv?=
 =?us-ascii?Q?4cdQYe6y9rNfWVOxyDkFmeM/vsZp0+VOduGZsfdlRzQINvIUFTBmdFAlgVNV?=
 =?us-ascii?Q?NhBubJrrSV8vmTGcKoQOmEqQQcs+OCtw4LIKctfAIkDzZK6cLNGN4FkCNubX?=
 =?us-ascii?Q?jtE8/YvWJmlmka2MbSzhFRTpQIZVfZSC5i9BTLLcDyYSkJQa8Nc+0sM3mFoZ?=
 =?us-ascii?Q?jVID2CQP8g0W4pg2CI3idm6uGHtXb+0Uj1KGw7QpQtfsEVvNZWQpZp9I+4Ye?=
 =?us-ascii?Q?nX9XLz32n70wWcK1Kopwfhmv3sXG6bhnXs8Y3+nO2or57vM9cLNKwl67r71t?=
 =?us-ascii?Q?e+ZeDlVQvfGqqz4T8/3wUI84eEomF3CgskHIHKDti90S/tgcuAw1TaIhFBPe?=
 =?us-ascii?Q?dcGtyyiQJzSJeZ3Bq7r7JhssuWBtV3FIdohSRZ3rYOohiwsmATx2j3s0Fylo?=
 =?us-ascii?Q?CMAYVwRRrBwaB0WFUqoMVgk+lsh4we6OYy12tU/j0FMJOaqBuszpdpXdci8W?=
X-MS-Exchange-AntiSpam-MessageData-1: qyig9pLEGm8ZkA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d62d177b-6f2e-4205-680c-08debf66bad0
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:27.5697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHKeD0SxjfdPZVoU4YFCg7P4eINz4FufPI6N23CdoS7H+xF649sNm3MERTBWnREvKEwLzMXkj8mS5cT7BF+MjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c1860d/1780267710-BDF6ADB1-CB423CD9/0/0
X-purgate-type: clean
X-purgate-size: 2298
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
X-Rspamd-Queue-Id: D87AC6182A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the 'numa-node-id' property to the cpu nodes in the Device
Tree passed to DomU. This information is retrieved from the
virtual NUMA configuration in the xl domain configuration file.
---
 tools/libs/light/libxl_arm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 6eae33cdd2..4b0ed99229 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -571,7 +571,8 @@ static int make_chosen_node(libxl__gc *gc, void *fdt, bool ramdisk,
     return 0;
 }
 
-static int make_cpus_node(libxl__gc *gc, void *fdt, int nr_cpus,
+static int make_cpus_node(libxl__gc *gc, void *fdt,
+                          const libxl_domain_build_info *b_info,
                           const struct arch_info *ainfo)
 {
     int res, i;
@@ -586,7 +587,7 @@ static int make_cpus_node(libxl__gc *gc, void *fdt, int nr_cpus,
     res = fdt_property_cell(fdt, "#size-cells", 0);
     if (res) return res;
 
-    for (i = 0; i < nr_cpus; i++) {
+    for (i = 0; i < b_info->max_vcpus; i++) {
         const char *name;
 
         mpidr_aff = libxl__compute_mpdir(i);
@@ -607,6 +608,17 @@ static int make_cpus_node(libxl__gc *gc, void *fdt, int nr_cpus,
         res = fdt_property_regs(gc, fdt, 1, 0, 1, mpidr_aff);
         if (res) return res;
 
+        if (b_info->num_vnuma_nodes) {
+            unsigned int vnode;
+            for (vnode = 0; vnode < b_info->num_vnuma_nodes; vnode++) {
+                if (libxl_bitmap_test(&b_info->vnuma_nodes[vnode].vcpus, i)) {
+                    res = fdt_property_u32(fdt, "numa-node-id", vnode);
+                    if (res) return res;
+                    break;
+                }
+            }
+        }
+
         res = fdt_end_node(fdt);
         if (res) return res;
     }
@@ -1390,7 +1402,7 @@ next_resize:
 
         FDT( make_root_properties(gc, vers, fdt) );
         FDT( make_chosen_node(gc, fdt, !!dom->modules[0].blob, state, info) );
-        FDT( make_cpus_node(gc, fdt, info->max_vcpus, ainfo) );
+        FDT( make_cpus_node(gc, fdt, info, ainfo) );
         FDT( make_psci_node(gc, fdt) );
 
         FDT( make_memory_nodes(gc, fdt, info, dom) );
-- 
2.43.0


