Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIfBMtu6HGp+RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861EA618309
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323491.1589274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxS-0000FO-FT; Sun, 31 May 2026 22:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323491.1589274; Sun, 31 May 2026 22:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxR-00007H-RB; Sun, 31 May 2026 22:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1323491;
 Sun, 31 May 2026 22:48:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxP-0008Ff-S5
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxP-00BFyL-82
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba9e-5cb7-0a2a0a5109dd-0a2a4508c056-32
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:35 +0200
Received: from [52.101.228.92]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbabb-63b5-0a2a45080019-3465e45c1533-8
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:34 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:33 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:33 +0000
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
 b=c6Q5mtityzBd7qYg2foubso2g4yc7t8YIdZFfKJuF2WOk/oYQyadIadSnb96FNNNc2u4+4laOpP1s4/BJKiQRZXvU2sbXKOc/wGygTSjAR1kev1cCn0MEPf1W5dzSI3glWSqpTUn2kEnboegPmSEehE1IpqJuwBwpxx5lsRfj/s3mFyzmOSPkNF9q441fYb7lTw65NkIeBu/eEDYFAurgt5vgsQoxPRn+dFLjW5O7/q0ZmmFhwWbWbdWivUJ5yt11TcCY2rim4TwN4jTL8hG1rFTmL8e/bEM3zJlcQRdJz+9sWNCmDMwuDaQlUjLvYFgv+yxurD7irL4hTHTiDFjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blu4oOd7tpGPVUBQPLctq+uqUO6TNkR+RChL3tWjD80=;
 b=Qh16dJHsz0wWcE0ZzY+1DmXKRyQMfbCG9QlZY0Dg6Os6CJ0IjHV+UQUlrdgn2JS0BhM6jVzRzifx6VEYSl14WDCLG4mbB+F8Vny2uepS8mO5u5bMVLUzgw5suG9Ez6MwJen87N39vda9odOgctHnSS9sGXDarzwujkyIjQPc/QOPl58qgMZM1UVxWLbRXOvvFVCp79Z05QVAJh+IV9+LsBZbAarbCyMGelB8pIgxsYUS8RUSzLzhCi/MWyti1fnmfYwnnFmhCAKsCL1SgnT0qoKjtkgu6FPRnw6kIdU0wWL0AmFT35XjuzwgXPfAFtrBsgVqo5H481FwZGFbggdQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blu4oOd7tpGPVUBQPLctq+uqUO6TNkR+RChL3tWjD80=;
 b=na/x5IqZvYaUXrQQRgowSu+s5ndA9SRjc3EOIJqqCk6QOJ6bQ7Xwyy1qtZjZO15iR6yOmjUnZupMH5MKzr2pnE69APRkCG3//4SxaKzlNBBCDGZZarw0GoI6rAig5D1170TeKJ4+LrCsTIOFjyetFbV+42ymdG6NtUJmGploE2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 17/24] xen/arm: Set Domain-0 node affinity from dom0_nodes option
Date: Mon,  1 Jun 2026 07:47:47 +0900
Message-ID: <20260531224755.9481-18-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:405:3::25) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: e609a69b-af85-4586-7c9f-08debf66be0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7dplkf+LJiv01GKxtVK3w7saMsXcJLX8P8xpRrz/lN/JfCWm/Fyx6SPWv9xO6dNLh/2Sj3gpbKCjhG112wU/jfnXG0pA05JPaZnxGDbB2VWh6Mm+o83PnwLlJgg4w7fHLBbDoUM1lEEkiqNhQLE+GVh9p+KSAqmVkZ5gzA2AB8O8h152fl8EhIbgl0e8A6y7xSp/f9HTVCYGhWx2kDffpFpgwdGnEBOezjMTwj4ydUbd+7UtoMVuzzHqSW9sq6/UAKau5+YTlEYWeCwstU9MIPTlgYow4rsKX8RHOTMyJVJZQfbEAgW6hZqIHeKUjMEI+9UO2/ea121lW3ojtQH3Uwoqulx5n1XZ/9ycyL070invM1bH76PBls0PkiPh/wpdYdyZHUJyNsL+EvWI+jIIcW9U7e/dGFi1c3KCTi1Ojeq2FnJMk8+IMcnCx/+62ziOxQf2KbXSTwbrERj17ri3ChYcQPXTeGcWaEVhwh4I1TU/f1y41KVP6CsorqWh/2vwj/JFKR4em04pwbrGdc9Hn/WdXJbBBKG1fEPTL8VJUvf7NrB2+mrOBznC2gISmV64pT0Ve4u5cvIIJeSvVC4Ai3QWIi8ybxKdVGP16/tnMcwgj++y3Elao6nMkRVs5/9hXbHvn2mSF7fGBv5VFxDOZCVW+6KOiGAfo7qHh56Hx/vrx7fpaVORECgrkH3QtPH+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y5foH1bkD5vNMmq+xnBBLa/hoHMUOW7ZdugNRiQWz3LlJBiJ0ErcFN6vhP5v?=
 =?us-ascii?Q?tIyyru4qlS4caakRQqGIBLh0742snkT7hIwX9H0fSP/Zc27hfufIgTgTyru2?=
 =?us-ascii?Q?/li+HzpJhjITP1qD5yn+ZzpquZ0apjj+1BhWMPqi5BYf5Ph3E8hBMLDFKhJu?=
 =?us-ascii?Q?el5DNzmARHOeKafOAq5Da3L6gxOFToQhU41uEczuqL//xxU36DJyIANygFld?=
 =?us-ascii?Q?ljGKdCefujg6HprpoXaSK5OkIjaZ9KgYj+8ZR5BqN0nAM76jocdwXxmTxaGH?=
 =?us-ascii?Q?dz3X9QD3B3FgKE/QawiW18PK+Ah9kO1Zg8SAerCSuFWwU8QAC00rm0Myh8YQ?=
 =?us-ascii?Q?pSFhT49l5MZg+X4sN50nlTxoTLBTcSNNpsAuk1Ri1nMXMx3r3V9g/rnAWyw9?=
 =?us-ascii?Q?wV9K9Q0seFMuz5zhmdwRr0jKyFSAJg6ll/9HdvuZzGnvY3V0n43KqUoqPaT/?=
 =?us-ascii?Q?6epyKPOqwmkkyGaySY5JL77RZ+RLkOOjlSUNbHAHD34XC96RwKEzcBR+PWDU?=
 =?us-ascii?Q?heLB9LW4r4S5QTOC84KgRcOJtqlzi1p7ZvUfU6ENA2MaRF9pa4hx0vHivNZb?=
 =?us-ascii?Q?Z5IOLTIrihf/I0rCY919khOQm4wFawp+qBK/eOkoxZSjB1hltqh+zjuaUPJX?=
 =?us-ascii?Q?ossgXftc2mZqFnp3S2PQR9oPUeyiRXDKHslbgf7jtP7DiK9PNZn5yVKXQSJ6?=
 =?us-ascii?Q?b/VSPP9ih2kGPIXV/jJ/FrcP9JTaryu3kRi8EoKO6bonjfFFzXWsd0K/IUXd?=
 =?us-ascii?Q?250ZBOq3FinEz0tlCYm+43qdh4nCliNRV/JudzluUtK73rRIZ2FSH1zGC+wp?=
 =?us-ascii?Q?Hd8hym2g26YbvIUAjhC9ibueqi1d+zyJt86lekrRfxh5pxosOFkQ6FeeQ8/N?=
 =?us-ascii?Q?BvuKzM/nogna1kV2dK2Vp97UFl+vVKAQfZDElfgcDqmcWoCDwvteD1YIoN6N?=
 =?us-ascii?Q?w8VxHprQat5AfqC6Z6YbV3FYMFZEUhWvPV8nIHJaMKPZwGuOmRe3BYe+Tsr3?=
 =?us-ascii?Q?Fbhn8yvF2XL3bzh8HfyffyxCTaq1h6wA76k1Bpq4jR1YfX40yIUYhD590pbt?=
 =?us-ascii?Q?dlQ+1VtD2Z4hU1kjgtU0YI7lc5CSnJHleX9dAB1Rb1ZlfShzD7FIRnV8GE/v?=
 =?us-ascii?Q?vwGOaEEZIOWrI0SE/sRU11Cx+t/F6bpwSmTbuWtmTZPSfhy/H3G5qRS8Hyxy?=
 =?us-ascii?Q?6yrgauhglIWRpquzwXK7O/eXgFTi0f3BVKjef1K8sgiAFxk5NZWheWqWZmvN?=
 =?us-ascii?Q?+stCXi46oC5N2mnYbMxrDd89PdMx8NzDxZhPeAD67Dl9yLIlScjwebih+uqc?=
 =?us-ascii?Q?Z7LWKvmPeD6JtTcBCyBNORopJI+U8824I0pR0gCOmFReyBTjvvHUl58Tui+8?=
 =?us-ascii?Q?CGOxA+WiaevK1D3QHz3yHtZ5SV0zA+/HeP5Cj5LVfEEGB65Qs9Hf9waeU2SZ?=
 =?us-ascii?Q?+YYBAzuB9rZaEikOILuN7HQTQcMzPi7JCeCd4QDViB5U9vxrLq13kwmB0F5j?=
 =?us-ascii?Q?UwrOv/O11Pc8EVMIWhuFLCnMwrvYPV7vDpv9BUpC6vKCZsxZtwQAyRXnayt8?=
 =?us-ascii?Q?SgH8oW6Tc/Rg3+3at08ABSiD6MZ1BgNTAtoj3vStnmQFIeNhfGdbbit2eLs/?=
 =?us-ascii?Q?+YEC8GJxmaiZwDQm00KQ9H5Q9BXkXYqYhiyX/DGWLsZ+7ACtqtrHEmV7BK6N?=
 =?us-ascii?Q?8UCZE8UjMjpITJN6y3VSY466SNrlOvK/0UYr0IIhfn0F05FSEN+0OGioIxYU?=
 =?us-ascii?Q?aZ019nSTIc7Hfa4LEvi2Ejyg0GAoXO+Z2ohU8nKO4Ee6QBafY2tdCEGTfR+O?=
X-MS-Exchange-AntiSpam-MessageData-1: E9WIAQlcVeMvAw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e609a69b-af85-4586-7c9f-08debf66be0c
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:32.9773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFndWUW8O5/K5CEwNnShd7ByTIxEJ3oaiLZwFBIzpZflF8IkLWz+bFNTZiU+ZebpuGgEgY4MphXef2A33FNa9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c1860d/1780267715-BC965DB1-8B909A34/0/0
X-purgate-type: clean
X-purgate-size: 1124
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 861EA618309
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Set Domain-0's node affinity to run on the NUMA nodes specified via the
'dom0_nodes' boot command line option. If the option is omitted, the
node affinity is configured to use all available NUMA nodes managed by
Xen. When Xen is built with CONFIG_NUMA disabled, the node affinity
falls back to using only NUMA node 0.
---
 xen/arch/arm/domain_build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f4187512b0..2518909ed0 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2027,6 +2027,13 @@ void __init create_dom0(void)
     if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
         panic("Error initializing LLC coloring for %pd (rc = %d)\n", dom0, rc);
 
+    nodes_and(dom0_nodes, dom0_nodes, node_online_map);
+    if ( nodes_empty(dom0_nodes) )
+        dom0_nodes = node_online_map;
+
+    dom0->node_affinity = dom0_nodes;
+    dom0->auto_node_affinity = false;
+
     if ( vcpu_create(dom0, 0) == NULL )
         panic("Error creating %pdv0\n", dom0);
 
-- 
2.43.0


