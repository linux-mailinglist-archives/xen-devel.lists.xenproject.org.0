Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92AA9D6539
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 22:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842003.1257476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEasT-0007Rh-A9; Fri, 22 Nov 2024 21:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842003.1257476; Fri, 22 Nov 2024 21:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEasT-0007Q2-6x; Fri, 22 Nov 2024 21:07:45 +0000
Received: by outflank-mailman (input) for mailman id 842003;
 Fri, 22 Nov 2024 21:07:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tm/o=SR=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tEasS-0006xA-FC
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 21:07:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f403:2614::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0226e3e-a915-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 22:07:42 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB9738.eurprd03.prod.outlook.com
 (2603:10a6:102:2ed::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 22 Nov
 2024 21:07:33 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 21:07:33 +0000
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
X-Inumbo-ID: d0226e3e-a915-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjI0IiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImQwMjI2ZTNlLWE5MTUtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzA5NjYyLjQyMjQzNiwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByzlH/mC/RxZMcA3Jn7WlK2C4XWE8REKDsqGHfRgSnr/0Po/17BWtfFqpY2BvucsxaDYL5jkUTE75MNQgeOb6wr4jiDSdk9hXPaQ5BX/CPOq95euYk3xIOOe/vS88vYFOFuXbesritFa1eEC2EX7B4Lozfm26dcaOvC60+VsHVJQW3mjY43VrdHjytMWXJSmJ4QBt5DW5OvNXcSXO9/FokxljoTmkaPe+I0lmHxHvoJre6gp6zz5oKsaH/a8J3r8UYyTWFVMkAXWPN4PcfIT6T8MoRWXxpxCbsdItu6q0vizdHW0La0Z1y5Ltiw8oeVjOURHbnYJTC8IExeDCtav/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKhc6MOCXjks3p+mF1Hok1MhyOqzBUachJYh4VSNAfA=;
 b=pzOchMNl+fLT32dCQV7r01lAII9BvuvkhjInQ/RNH5X/xrJRs3aB4lXVCWE/n4OaWoFdbIwu5pKWfjAPCRg4LRhNxdH1+DcoTmh3pxINE8k4RYcTSZa2vqXoUxUNkWnPbtUXBBXSpDGTTPcAJRxdkWWUgu1nctjMAnr8geautjgOtGmdhTK29moic0FmmTxkh9N/49yos88deeSdMRFGpiP2AMFWmLyA5bmSUrHYz7QJwML9Q4I4B72B5ZDiFxs+PKbTWhc7wkwzzjHbC9Zrqgmz36aqSa4ziq6msKF5CiCFHIxBjxA87gv8cUwMCl0x3CnCL2DGapZ4g5aV/mS3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKhc6MOCXjks3p+mF1Hok1MhyOqzBUachJYh4VSNAfA=;
 b=pt5H47fIUyJkZlZPkYguX3OnwuVCPvbRHPgulL39nx2yB/2tQrEmEx92hxjB3eEJ6bBNpiwi3BB/ZT+fAuK2GYdMCNfKCnIJNjDqkYsnz5rjHoC9XVGHyP/u1cWbLUnB17vxEAyT8FTGkGCeKVVjklEnLC/3yA0pxfM920Z8cAdjdnWZPcAJsCiFDqHoYeCKpuqFxZg4AboDPvHLYEczbX6xiWvc+rae41QTplfCbUKk+2HksElq5xEyVH4ZCNUCro6Uc2rkYB+pkjIy9tFm0EXU2N6Luu5w27oP+1u4RGuiBczL/77/pFpbahcUUf4qx3FX0H28ayH9P/63iJczpw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/3] xen: arm: enable stack protector feature
Thread-Topic: [PATCH 2/3] xen: arm: enable stack protector feature
Thread-Index: AQHbPSKKppr5gbUiFkmSWcjt2gLITQ==
Date: Fri, 22 Nov 2024 21:07:29 +0000
Message-ID: <20241122210719.2572072-3-volodymyr_babchuk@epam.com>
References: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB9738:EE_
x-ms-office365-filtering-correlation-id: 0ae32b17-3bee-4fa5-71ba-08dd0b39af41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+579lqAQJn6kfrGeZZuax79w41sh3ApDnHGJe3ih1gow+1IKiJy3sgXoer?=
 =?iso-8859-1?Q?EFdPAfetsNuDfx5B5/xoxgILkRvUgr5lzKkaZr58nG2AV3liptaBOh9w4S?=
 =?iso-8859-1?Q?emvuDzcdDWw//RgpaW6bIlEGAtTVJz8JetJAD0EXrUUpzAK27IBwBt38RG?=
 =?iso-8859-1?Q?W72K6lh3PYr17acSIsq2fKyBzBzLHl+vg+YeqYNz6ZZhdAJrUVI6cvL7mq?=
 =?iso-8859-1?Q?yfepkpzrtcg45VE+Sd1AygZlaMecLAaFMWmkoc72W1EC1IyFbC79R0kFV5?=
 =?iso-8859-1?Q?ZAwhsL+/vvXn4qpvnZY3aloxNK8WN+Y0UOMPFqtoRyQYASVCP8HIQe0n77?=
 =?iso-8859-1?Q?iN/WEbtT7al/YxGDIaODIyz7yTYRVGBVWSoGckMao00hPWUmac2YGpzwdR?=
 =?iso-8859-1?Q?7zhdA4O5wf8ojRZrjYHzPt70BxHa+cHuHphA5N749WWRuOl3uW4IYPSNuU?=
 =?iso-8859-1?Q?pM8l2+l3EqAeQQbhSqhZm/TMYTEjQsSvGQZ4l5W7cn9B2QwFaZT0sNx2QA?=
 =?iso-8859-1?Q?aUJ74tpC33OSiiVHyJOLEiJ2i2MPPy/laOreq/gxDubResRwEzFnx7C6BZ?=
 =?iso-8859-1?Q?PIPL/4lOpIJPhJrBwtIjPf/7u8o3fdtw/aBGvBc37QgZcC2fVMwbQjs75N?=
 =?iso-8859-1?Q?eK0b6xYhNSmkNAUw3I/LbIe8XyJ5FBHk7TL/9xLqZS0kyLJctSQX7hcBaM?=
 =?iso-8859-1?Q?wlC8TXoWT2E6AH5xDM+ewNIX5dJd8dY/dQUuJbqs1L1sxD8eic5nztonfb?=
 =?iso-8859-1?Q?IZQcWzjgrpVWUYXKUKciUP2LGmhZjHz4VJ7hsOHsFPNqJwjPV0eICwu1AN?=
 =?iso-8859-1?Q?60rsomAKE9cGC9gnx/wdAgysEC2SutqnMbxPR4oDUCWNFFAKQDqY5DrGlG?=
 =?iso-8859-1?Q?wi0YNboCyLrUeiJ6w2OOGmcExFFfMJteQ924iXf5Rysjivxh5pSyziQ+sc?=
 =?iso-8859-1?Q?+yrjgoGndRdjKYPpdcMRZaY+b8nq8PAVL/TLwQNN0cxlllf6dnxOaTs+Zm?=
 =?iso-8859-1?Q?DJ2/pg/Xno1bCn5gDJ8bzSo6FZ1Hk0vFx1YFzJ4Z5M6mxh9US75yRu7Zk9?=
 =?iso-8859-1?Q?V351HaOBvcc4PoUKVrYYy900dkSN8q9APbzIi86jpbWm3gtwOr++MJKVmJ?=
 =?iso-8859-1?Q?qAOf6jlDcgmaqHtysM1gxPp39tgfSjuv+prOdJ1PtKMoTUr7knUd8yqu7z?=
 =?iso-8859-1?Q?s81VII06J8MI1G90kEezS8DGw1A3MWZyvXuCB1nVhnt5Us7rY2Nbd7RD+y?=
 =?iso-8859-1?Q?jVXfzT9MX3n8VQu2eqeONua7aCTGmrny1wA8t/I+vEgKCH5QCEItVY4QmX?=
 =?iso-8859-1?Q?TgwHRGaLxqUUwVuZjU+ufuQWKZVRRKME2oL3nFN8m8yCKvpbvoSEN/tgeu?=
 =?iso-8859-1?Q?/m8S6/rwOr0e0hvKm3u9Tl77dJhtMIjSPAQT31l1Dh+9v5j7PS7BQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/+Tecr5i2su+bV/AdY0bINogBkte2JNwP1tioneadIsb8AnAlKUmqeR7z0?=
 =?iso-8859-1?Q?4aPheOU9L3yj31MUB5WIzVr5LFH1HqBoi98v+f+jqZFbKkJJlvwa7IwmWZ?=
 =?iso-8859-1?Q?ToL207uEoCDpGWVLnL81mXU1g7nhbGsnh8Trw7VEv6sWa2CCVv4umeq0T0?=
 =?iso-8859-1?Q?ZD4k03xv7Fjet9b/cSh7JIbahxGiuy04BIH+yjc9TA6A8aELBhj5dWRoAO?=
 =?iso-8859-1?Q?MWImesC1UoX7dah8bABP50+YCuvFN61zgGyP6cCmiMcLeNJyvUTomxFQhG?=
 =?iso-8859-1?Q?P7e+U5dAQ69jycjqFxolt+IllSp1FEvOjJ8a5VpdGgstSbg5CfrEu49rLE?=
 =?iso-8859-1?Q?HdZKfW4ARrpJQDtHQWfkgOO4hsaagswpjCyuW39fdEEPSAQU/CMfqD8BY3?=
 =?iso-8859-1?Q?OJofNhnI0DVWwwOTJVBX87eFD9RsGzWIGlS2ZcmSsIax+cDtZLJgAWZVSD?=
 =?iso-8859-1?Q?0Ny/rBPXMXd/U3F1G33By0SHw269WEDMY/L3aBifG0LerMvU+zKnSWJBYT?=
 =?iso-8859-1?Q?ZFlzpnuUwHh+/2fG/V35Zpx/1monOxeir7+R0rf/EMCX3tUR7p/SAH+gLe?=
 =?iso-8859-1?Q?y1x2gE4svTsLi3SiSxVsvOGDfV3d1jYT4+saPovM3ORfIFdb940RBI5cSw?=
 =?iso-8859-1?Q?uNQFB5erOS8WBwBwXoNVPkZxQ41f7btJcyOIk69scGJ4OFkISu3TYnT8ox?=
 =?iso-8859-1?Q?x/cWqPEhb6W0MfyjGd8yqG1LGxPtz3UYwrPcLtbsY66M6eRLo+Jau6PLtB?=
 =?iso-8859-1?Q?D5LRrotk1Pju87gvmZlRZ9RpZVRrKweZnzgycDCm0RgN8kAworcE67wA1/?=
 =?iso-8859-1?Q?YhtxIzkIZBK83ugAjAb2zRUpI0j6cy8Yv7JgXfNhUtklfJ3KJnpvlqkxaL?=
 =?iso-8859-1?Q?qtPtsHGkiq8Oqd7x+4JnuT/gVerveY31fzfUOyB9qm/kxEbUTty6ns5Zzf?=
 =?iso-8859-1?Q?97Cq1ESytUi8I9cuBVbz1MjXSv8qXW2BddPSso8Ohw8kQEL1ZExql0H7Yr?=
 =?iso-8859-1?Q?dqR4KP2u0DGWQvRTzw0Ig7fVmVwFccXf+8QXZUyyoyIXCNAqMTE78vDwiL?=
 =?iso-8859-1?Q?3hz6qo5NI9g7kERxOR/2JdpsPOp9NHOCpf85QXaKbFL+9fwFd7y5XDZ4EE?=
 =?iso-8859-1?Q?Xu+MAcs+FM2nnsxsPGAfrban13syx5jbEfrQxNxi05m2Q4ob7Cr/kMYywB?=
 =?iso-8859-1?Q?rBF7OAL4cDRipV5MXD8kZm/nFXOabJucKO5Zxt7NOEedljgulLIvfPJFz6?=
 =?iso-8859-1?Q?oi7LOoi3vvmH/NjhI1bpKxMxRzoim1hzcuymPKRLYcYGU4l43ha73oLrU/?=
 =?iso-8859-1?Q?/Sz4xLSDd7ZvRnUDxNRKwgssL65glqtMp4/TJ36+E7gYQ1r2HZl49YChg+?=
 =?iso-8859-1?Q?+LDyu1TIhBi/YNnbanZNX0tIstvP6a7d1wjUYLFuYFuuy4RxTz2nV3K71T?=
 =?iso-8859-1?Q?B1BMME54P/uU5GdnlGQDl1fpnmgizelprw8/ukrfFwAwcu4M7LJPs09k0e?=
 =?iso-8859-1?Q?iaxLHIyDkPMKxbOmy+5Iq/J2Whpdn90P1v/TxhTf6q8PkhMSi9WFeqom2l?=
 =?iso-8859-1?Q?7dq5shtD0MyJF+JsotuLs8cIkGKy4D0nWsZNFK6uz+v8qBvtSG76nB+3c8?=
 =?iso-8859-1?Q?guZoE40SJX+bPXO0CDFd7JdiyNfGXqjzwet+3VIAeV+I4F/LTIyGei2w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae32b17-3bee-4fa5-71ba-08dd0b39af41
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 21:07:29.9392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KMYuHsr6PE5ZEiu/DOeB5dDQSh190D8NrYXaktEnim0720bVzcySTr9s6Qj2Hb7DHt+64EoTnf4mzTZNWsusZIQUUnRzFWryflWdUh4mgm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9738

Enable previously added CONFIG_STACK_PROTECTOR feature for ARM
platform. Here we can call boot_stack_chk_guard_setup() in start_xen()
function, because it never returns, so stack protector code will not
be triggered because of changed canary.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/Kconfig | 1 +
 xen/arch/arm/setup.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 15b2e4a227..8fbb31bc07 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -17,6 +17,7 @@ config ARM
 	select HAS_PASSTHROUGH
 	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
+	select HAS_STACK_PROTECTOR
=20
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 71ebaa77ca..2bd3caf90b 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -13,6 +13,7 @@
 #include <xen/domain_page.h>
 #include <xen/grant_table.h>
 #include <xen/types.h>
+#include <xen/stack_protector.h>
 #include <xen/string.h>
 #include <xen/serial.h>
 #include <xen/sched.h>
@@ -341,6 +342,8 @@ void asmlinkage __init start_xen(unsigned long fdt_padd=
r)
      */
     system_state =3D SYS_STATE_boot;
=20
+    boot_stack_chk_guard_setup();
+
     if ( acpi_disabled )
     {
         printk("Booting using Device Tree\n");
--=20
2.47.0

