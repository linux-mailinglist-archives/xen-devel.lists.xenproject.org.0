Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKSUDAbEwWkHWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CED2FE8F2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259667.1553106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7Z-0002oO-Kl; Mon, 23 Mar 2026 22:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259667.1553106; Mon, 23 Mar 2026 22:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7Y-0002hn-IP; Mon, 23 Mar 2026 22:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1259667;
 Mon, 23 Mar 2026 22:51:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8gh=BX=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1w4o7W-0007Yi-Jk
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:38 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021085.outbound.protection.outlook.com [52.101.70.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8f3cdc2-270a-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 23:51:36 +0100 (CET)
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB9699.eurprd03.prod.outlook.com (2603:10a6:20b:61d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:32 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:32 +0000
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
X-Inumbo-ID: d8f3cdc2-270a-11f1-b166-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rH04L9CRWdMVHwpjqG17UlUIcOixRr7rdbXgwV1Nk2YssN/Ai4Jx8YSqYR4csOFtkD7GNFnPF0ZJ3p2je0bwtR2J3UWleh0dkrZceB6185WAwnamM4iOVBOERLep3p+kYZHwwQ+4kelAFr8VpLIQzzFSJm3YDsyROwKeqxR4i36QYYPVhfRV6Rx7oMY2QjSRpWtp9Bmggg0upfFE8F66taVYi/IE1F/rxwI8rKh5LOdVs3y+tNY/Fi6N7GrG1WLgm3ybDIMZ6ERY5BkMcFQEifCgspeEmY65f7psjIu5BHqAYZtTwEPewFP4ovRuTb8owpdjMwAgRsOuCanS4NAxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8OQdvq9aXg/4SxgH4QegjDDNYf5k8N/mwCJ7C6pqRo=;
 b=AI5ZF28drovbKyuh+BjMxF4VUBHkTXpTTO81YuaUNuSUU/wASW8a48QR2WztYefBbwK0qfL77sNYzvisnKiifUqoV8ZOKea7fJNCPrheWZmBe0WYV0Hu7B4RVMfOkGgPJRNi51qb5VzH4kyhL0rdRIjVuKZm8tjRKYNzp0hRZLpLf3cir87fQwq6GJ0auT9R8y/0msXG+9AVZknYGbqYWKI52BJeKzifWH/tSXU2ZSNjNie4AbVURXI/nY1pKPJ9CsGnFzSRTYD3td1LSxlM/Rrp/BQp0iJC71AMwDy1Gkjrmej1WQoX+zTX87alQFvWvJ7jA6HktDds2QPb1XKvNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8OQdvq9aXg/4SxgH4QegjDDNYf5k8N/mwCJ7C6pqRo=;
 b=YJzAFpmhznNViMAAQaMR/okEgJeIzdFvkeKUnpRlxRosR+on6M0Ymaq4zDvIFVeOEIfNuC0Hj7N+/CLaYCPeGzurpp3w/K5oaP3z1Q5LE844GFv7OoAJWP0Gk9arnVqmZ2mFmWJx1FI1MYiKCLTQ69wTirYtvbGlbq2/UrOBRiY45wdIp54PBvUMdQxxZ2SbEngpdTH7+PdwVSsZD+06WouPg2pEsXXh7XezBH15f8lv4cvswZS2qBI54VvPaYFuTN8/uGYymSQVWYecwzIqVp23Fmn5oqks7a5A7angzdWveP6zH6aEbY09vP0vjKfQCnkyCx7NLqGeU7PW0gE50w==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v2 15/23] xen/arm: vsmmuv3: Emulated SMMUv3 device tree node
 for dom0less
Thread-Topic: [PATCH v2 15/23] xen/arm: vsmmuv3: Emulated SMMUv3 device tree
 node for dom0less
Thread-Index: AQHcuxeYUjdtCN8FC0S6jBGuUI2eMg==
Date: Mon, 23 Mar 2026 22:51:32 +0000
Message-ID:
 <ec46f7d27f944b8c39275ee6fb8aad3bf1431e75.1774305918.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB9699:EE_
x-ms-office365-filtering-correlation-id: f15c7b54-96e5-43e3-c970-08de892eba96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 PmcKM9KUx/vUiQaIarUlrkryABOJpLVhl3YbmuVI1v9kqgmaKvzO/ioWgN+O7ON2frO8x1pTxgCVdYyqHQs/LjVr8bQRIvxur1GFn1wwl/UWD9DHpb0mrRmo2WHTPInFnc5vdlTz2hbFLjNqG+F/Wa4oMElGFCFLJxIdGPSO88ysUk3AeP9eEh6bF2xBQ26FLmWe5ggFXrTz0sHEbToSxgspoCBtabwC+DwV3IgW5XDiOGwQEfSKLHXDx1i2dVKhW+TKM6Nx1eBrBDlY+Cf7KzZhHzA5C6DB6jHqk8cDLsTEki5Gyu4/1rNteL41vbGHSA5DkAMCPU2SxlaR1qIT16DrhY8UgyhgwKurCQeklxoYwAeFVGQbu94opEzPJ3ACAUfx6KFWgeOtrhWtEeRPHwFAsr9Hpks7gd2Mo5RFe8A0kJAalxSUgp8HuruYgsfxQ6oA16kKm9h1e8VRXXRQFf5uGETMKMniVCpAaKt8tuUcGGpY7T5VkMKgwyL9+ZIFyFMeuQ+PPNlCSkbR/ZLYLFWefQdKD+Bq1pb3O3+ocDV99gAoxM7f9abnp11PUldT2Qsm3m5TKbBMkgP+BWZL2TUS60B8XiT6hqVH93KOgiYmyt27voYUbdPmuzqwz2vLH+h0dprL7yI/eYLpMxfITBoIq6AjuNtDZ/HjEzCWGOkK52xFVVeDDViKNZH8+U7cr7DBMUadHoRenVjZHS/QghZRDfVcAVYEk1y/LLPC3fgznIiat6f5+7nknALpBdo3hPvJYWWzntQ6dL7rEr+OJVYSWM1TOCExHoXx3BFLxxE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qEjunqKXohbQDhlWgPBqDSq455zmrqqeQb5HKMWFNFzDOS4+IZV26TYKrG?=
 =?iso-8859-1?Q?PyuCg6umrhq87MTPhoN/OI2EnM4ouwDCzNOoStE6Ctj8J4o2kwtbpahKNB?=
 =?iso-8859-1?Q?CRxAFyFu/B5U8UPkK+aaVMFq8w3eILRGOm9aJdfbcfRMnOgW93r1WyD1fJ?=
 =?iso-8859-1?Q?iYIrzv9MhVOY/Qx8I/Cepal9xea/FYtjPD2rd5mprOomllm8FSgmGC/Ndb?=
 =?iso-8859-1?Q?XtZi7GrlzE9Uw1VS0m06lW9ZV8mwAKUGs1AFVGonVPlpHn00qpzFNlKvsw?=
 =?iso-8859-1?Q?mnenOcBqD0iGSuCaSqJBsL9knJY+NRW5ZHtFn7IcwK7PIZpjapuKHGIZfa?=
 =?iso-8859-1?Q?BFy76PjNAFQwGsIG5GhwP8yMF2o8E/Exlnb3mEqTNCuiribBF7g4OtleAC?=
 =?iso-8859-1?Q?wYbWikeUgaPn5YusF3YOnmoGtjVURTbdKY1N7GBBqVE8I/IdNOkXI7ngVi?=
 =?iso-8859-1?Q?7YlhcLYAHJa0Ze1sVLbt64L2YU2nBPvMhlacKxUwxOFTMrlyG4Tb11fUh0?=
 =?iso-8859-1?Q?4JKxOkIb7Y2QWi1UibGMWDu+7jdjgltm6n7jfuRtHdrsrI6GEoPKKzPtS8?=
 =?iso-8859-1?Q?Qm3mAdpzCHsS7Ez3MYzQN4q8MnX2N8NYYkY2Zlft3Ppf9jKstqL3ILMMtA?=
 =?iso-8859-1?Q?9rXz0hZHWvFreuAD0hq+2dEgcbiM3MjJx0h+ewtG8HwkqyBxbpN4wx8fed?=
 =?iso-8859-1?Q?lxIdo/96AFtIswPmG4Y5K2N6wbFQc7RjVLf0DrN3NzGSiIobWcYoWp3Ivu?=
 =?iso-8859-1?Q?QwzbqnR7z9v64KdJihdfERlAmro6lHvJuXglb+Jy8yQaV7LQhKfgbOnQCS?=
 =?iso-8859-1?Q?oEd+Xmwp9xSR/Cq+6gmXTHXdDbvGy/eXYHyWgMWAO4zdtDuI/hCIp79692?=
 =?iso-8859-1?Q?+1dG4N8ygrqqaZaWUxgTCIsxMc/FKc7S2/xc3txghgyUPmvQRUOISUQBil?=
 =?iso-8859-1?Q?AvPB1+l9MOCHcWoPi5n907BIiQByH+EibWRFO91/mgXcSvDl/w7vt0owLy?=
 =?iso-8859-1?Q?rCJgqw3VI8wkA8MO/EcUQAK3kEZg+Ae81Yt1UuXR6pakOQU9RGJKiNzTXR?=
 =?iso-8859-1?Q?d6dxoJwrNP1LQwQ5vqoIDmXYN9zRWT2cmMdYBWyQtmkdHAqumELgn7YdzP?=
 =?iso-8859-1?Q?3wKjDtXpQety1ZBXxfD5Bz0lZG/rbz45g/HdI0GnflzakswOicIHPUuEPf?=
 =?iso-8859-1?Q?Bap6wo30qhYuCtmAP/lEVTsKogKDoDVcvuSGClqbrRSuSkN72lWsiliA+t?=
 =?iso-8859-1?Q?KXU/mMa3AU5dYuaqnR1fGSpZhDotsr8Z6y7wsrOmK99BEHX9nMlBywgzZb?=
 =?iso-8859-1?Q?7djYJ6/+wcalHHpwnLrvnpJpsY+cyLeAV+qrei2N+S0MM/92zXe0fP47mm?=
 =?iso-8859-1?Q?GJS7UA/xTx4lelHGj/OG+XuUkJMfWrJUgqsOWCST8ZLz4E0etawRXsb0r8?=
 =?iso-8859-1?Q?2THz1nUPnzJRW8ZnNAmzoRvVPuxyLOJ7qqQJY8LQ7GUmqBsozEZrgt0fum?=
 =?iso-8859-1?Q?VlAjVg6U91QQUd7HD/xcmO04ppt36HUP7jFnwNEwdjMOnKvSBsaffl9OGP?=
 =?iso-8859-1?Q?lT2hOKIH4OYGq8PKJ6OIDz12gfO9OPe1IY25jZO5srEMNP54E6/+mP4mg5?=
 =?iso-8859-1?Q?auTbMcsdwOA2F+1LFtfB+XcgBHuiS2aqIyXXrYdZO/qVwGKwOEQiuq7PAG?=
 =?iso-8859-1?Q?fpymBCx2wPlinOaZylmwO36lgoV6A3BwfQm+otfQpFodDT12FvC08AX8SK?=
 =?iso-8859-1?Q?p5zFH1EcL9lqsQsS/+AkBx/Wx+e8NYTt3JegChzmfG+1pSGnINBD+irXKt?=
 =?iso-8859-1?Q?g6bZhC+HiQuMC5eHU/bzP5Fd/JA9HbE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15c7b54-96e5-43e3-c970-08de892eba96
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:32.5081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qqc61BcMJbVZ7paCIjM0wkp85bcAH0ieMTJXvCZ+M7fM/nwf+4t5bXA/KepKpzmBa/gw/M4m4KNTt0EjJhG9lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9699
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D5CED2FE8F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

XEN will create an Emulated SMMUv3 device tree node in the device tree
to enable the dom0less domains to discover the virtual SMMUv3 during
boot. Emulated SMMUv3 device tree node will only be created when cmdline
option vsmmuv3 is enabled.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/dom0less-build.c         | 53 +++++++++++++++++++++++++++
 xen/include/public/device_tree_defs.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 067835e5d0..a48edb9568 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -218,10 +218,63 @@ static int __init make_vpl011_uart_node(struct kernel=
_info *kinfo)
 }
 #endif
=20
+#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
+static int __init make_vsmmuv3_node(const struct kernel_info *kinfo)
+{
+    int res;
+    char buf[24];
+    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    __be32 *cells;
+    void *fdt =3D kinfo->fdt;
+
+    snprintf(buf, sizeof(buf), "iommu@%llx", GUEST_VSMMUV3_BASE);
+
+    res =3D fdt_begin_node(fdt, buf);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "compatible", "arm,smmu-v3");
+    if ( res )
+        return res;
+
+    /* Create reg property */
+    cells =3D &reg[0];
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_C=
ELLS,
+                       GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
+    res =3D fdt_property(fdt, "reg", reg,
+                       (GUEST_ROOT_ADDRESS_CELLS +
+                       GUEST_ROOT_SIZE_CELLS) * sizeof(*reg));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_VSMMUV3);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "#iommu-cells", 1);
+    if ( res )
+        return res;
+
+    res =3D fdt_end_node(fdt);
+
+    return res;
+}
+#endif
+
 int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     int ret;
=20
+
+#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
+    if ( is_viommu_enabled() )
+    {
+        ret =3D make_vsmmuv3_node(kinfo);
+        if ( ret )
+            return -EINVAL;
+    }
+#endif
+
     ret =3D make_psci_node(kinfo->fdt);
     if ( ret )
         return -EINVAL;
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/dev=
ice_tree_defs.h
index 9e80d0499d..7846a0425c 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -14,6 +14,7 @@
  */
 #define GUEST_PHANDLE_GIC (65000)
 #define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
+#define GUEST_PHANDLE_VSMMUV3 (GUEST_PHANDLE_IOMMU + 1)
=20
 #define GUEST_ROOT_ADDRESS_CELLS 2
 #define GUEST_ROOT_SIZE_CELLS 2
--=20
2.43.0

