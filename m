Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3C95477D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778489.1188546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seupA-0002CS-AA; Fri, 16 Aug 2024 11:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778489.1188546; Fri, 16 Aug 2024 11:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seupA-00028z-6h; Fri, 16 Aug 2024 11:08:52 +0000
Received: by outflank-mailman (input) for mailman id 778489;
 Fri, 16 Aug 2024 11:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uc/1=PP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1seup8-0001dU-8m
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:08:50 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060b.outbound.protection.outlook.com
 [2a01:111:f403:240a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e939a468-5bbf-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 13:08:49 +0200 (CEST)
Received: from BL1PR13CA0026.namprd13.prod.outlook.com (2603:10b6:208:256::31)
 by CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 16 Aug
 2024 11:08:44 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:256:cafe::c8) by BL1PR13CA0026.outlook.office365.com
 (2603:10b6:208:256::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.10 via Frontend
 Transport; Fri, 16 Aug 2024 11:08:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Fri, 16 Aug 2024 11:08:44 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 06:08:41 -0500
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
X-Inumbo-ID: e939a468-5bbf-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TimHHGckCdCnqkPOd+819TWZqyRgz7zp7zDGwKU5wBLivYHtBKKsV7U4ouN5FjvBH4vbofwUaQCkKi8ny86RDbn9Kn2l7R2y//LjfjJj9ZIqYRk77lczXGfXjAADQ1ogQtr2fCwOPSZ3r+vHZrs57MQUBQJRXiMxIq0XL+VffsG7crMvm/ZK2KJ/rss+P9/rEtd7hbl4PbzMZfVcvi00dVa4gttshVyeNzHLpAVE7gtyv/lK4jaefbMW4wlGvASka+GnqMSf201lRPezokQn8BI2jDiSOzwdVSh2WxBmQjibt5OWOEemjVWuWubDJqOuyM8ltYfm2/iQSG/lEfuVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2Kh0oS3w0hJmzs1gUO8zu7HPWkBa8kExEr9EreyX/M=;
 b=AB+a08wkhc8qgNm41yZh6TtKM3qLjTNd/jFsSz6kS1CWbMBilgwGQtfhS/rNFxba4N9oFEpX4Ptzyn49Peqrk4FocgbSzBRKq1CCFmNWy94yZpw3SeRMx3c9RGHFZkwcZ4fbehCKWVv+LnWNu4YLtuVBba9ieD30B7aPKTaetztkbms3RdAPXCBjya7n46nKwwToNCMK4vZs1YQlUe70t6cWWwmGgIkp6a1n2/lnkXq7NPS8rR/4bqfsZ0rMDe2BgaJsNoS4r6Je9WHJggYAyzqBSFDkjBXE8f1d6vHfYKbKqW8DSTY1DRb+eyODrkQyU9D4jplcKVjtcUP979hduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2Kh0oS3w0hJmzs1gUO8zu7HPWkBa8kExEr9EreyX/M=;
 b=x8FDEDL0oYUF5xAVSjUa/RSWgbFLpJz42koa7I5sxQXhyobQszPc39kkQE1oB+3MBlev+q6D65mEcZEUerNJzt21j+zDLOQ/Zk+QFM0/OAt7OiBirVLcx0IGTFA/C+IBT7ScpCpR9YLwgiAyQVXDUknyL1Jf6qnEoD6KpTO3S8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v13 2/6] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Date: Fri, 16 Aug 2024 19:08:16 +0800
Message-ID: <20240816110820.75672-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816110820.75672-1-Jiqian.Chen@amd.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c187cd-78f4-4756-c9bb-08dcbde3cb5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tu3Jm9nEg3LtFbx8a/fOOLx2jKTNmqAzAPM60wO4wrmvwKi1yv2Nx/yoUiIa?=
 =?us-ascii?Q?sC1qw+4G3TtxlwgRD3XJ/6rKEDf9JshQhCrgn5OmJROz+/pRMYsHuqbcrqk9?=
 =?us-ascii?Q?EHjF8Cl4fH82C6MD7iSqkQlBADJfBEGsq61+rc4Xeccm5fz76yzPSVev40q9?=
 =?us-ascii?Q?CfjbbyvpIZ5ITs1J/iyy97WToMVmu9dp/UkW3AsYWwam1DH3aof8AxdlOeCL?=
 =?us-ascii?Q?hjPNBVE7gNf/NlH+9jAiyqxH2v0IoGizuEMXVpTHFoAcMyW3hR0w+htPTcaG?=
 =?us-ascii?Q?wVWWzFV/eQohYMWlExGMRz5RdN3JAOa3vNJWFzSbCoHU6MzHmWRDRMKAuWIJ?=
 =?us-ascii?Q?cOquZswRPoiCv7WprsA59njBsgXOQx6Acsle30q+KvLjNRHvgapkSwnfHIDg?=
 =?us-ascii?Q?cteSFSd87cCoIj7o656H/sMjiH13kE3ewmBVbYygPxJzZ+NaElB1lNPwoo6e?=
 =?us-ascii?Q?96YrLWrErYLqy+RVggiJrau4pDj+c/pcahMQVihU1nYCQqWTcfn3UGqOV2Vt?=
 =?us-ascii?Q?sM6Xf3ItRMGM1Bv5hw4Bh65AeInlgerwxPafNKlevodtuGcMwMHdAs+f6Hy+?=
 =?us-ascii?Q?/ENmXA0iByiyxVvduV0cnZeil+i5xLA5tv8ZA5upq8KeV9Ltx11/J1FS+dBq?=
 =?us-ascii?Q?DpVaayA9KXnSuIXbbXw7A/GtoqtI25UVHrCYdppoIu/YC3+sFptwlxKhAtWk?=
 =?us-ascii?Q?q5xkTuf1RHGhXufSFuA3pb3E8THjRauOZN1WfLU4FLAqxdMcsG4Q2pDaO1KK?=
 =?us-ascii?Q?lssplSnN/ZvtigDnkwqm61TuuxQ4floBmKLKecM0YqQpU7ko57Dhr2xKSf5w?=
 =?us-ascii?Q?qUzaq8XRnE9nhA32Aytr6QEVokVfpXSjPua35FEQjqDcJHtL/eN1p7HVDOJW?=
 =?us-ascii?Q?eao2A6L1w/X5ASgTtpBtrj1yjkX55jHdFRbEk6hsgQ5Tcm/CZzhShKSUiCk5?=
 =?us-ascii?Q?E7RKmr6B+pA8aEjul8NcCke6mbDGGZjvWCIlZ2z6eBBxt/BSjk/GOfMDCW1H?=
 =?us-ascii?Q?x9No7ukbB6atdBH8cNcieH3UZl16BXAJcoGoN98kq821yV59nLzBPhcBDs2l?=
 =?us-ascii?Q?N9wCvH4SkGezF3m91CbGUNruTW+7P/63ZDpoaaBMFmaTVpd3u+i+F6HOGzxR?=
 =?us-ascii?Q?DqoZ4kILHNcQIep+2P1tfzpFK9i8HRzg8cvYlmhe/Oi0bmVdOGa/Ztr/oWPM?=
 =?us-ascii?Q?Lx7qW/kkMcF7T1Pxh/StJHoCYKwohejAruqgH+J7uAybedzQX2bUcw8jl+v9?=
 =?us-ascii?Q?XRby+uG9FVYRPocPA2+YBcTQvdwyABdUCcCbwwa1LYRdbl/ZsUjXsh4gdBH9?=
 =?us-ascii?Q?12JGB3xTu9u3R3KKrO4QxzYDAx0MvpGyhuzZZTfCqA9r42tOomZsqvL/Ba3l?=
 =?us-ascii?Q?9r9IzKzCKxjbtmED/IETdAxDUF7GpVyBD/aqjyiBB/YaEPrKhPO08VslpAiF?=
 =?us-ascii?Q?myR8dcYXwITmkbpoe6FVCn8Q4DgceFzM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 11:08:44.5937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c187cd-78f4-4756-c9bb-08dcbde3cb5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552

If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
a passthrough device by using gsi, see qemu code
xen_pt_realize->xc_physdev_map_pirq and libxl code
pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
is not allowed because currd is PVH dom0 and PVH has no
X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.

So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
iPHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
So that the interrupt of a passthrough device can be successfully
mapped to pirq for domU with a notion of PIRQ when dom0 is PVH.

To exposing the functionality to wider than (presently) necessary
audience(like PVH domU), so it doesn't add any futher restrictions.
And there already are some senarios for domains without
X86_EMU_USE_PIRQ to use these functions.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
v12->v13 changes:
Removed the PHYSDEVOP_(un)map_pirq restriction check for pvh domU and added a corresponding description in the commit message.

v11->v12 changes:
Avoid using return, set error code instead when (un)map is not allowed.

v10->v11 changes:
Delete the judgment of "d==currd", so that we can prevent physdev_(un)map_pirq from being executed when domU has no pirq, instead of just preventing self-mapping.
And modify the description of the commit message accordingly.

v9->v10 changes:
Indent the comments above PHYSDEVOP_map_pirq according to the code style.

v8->v9 changes:
Add a comment above PHYSDEVOP_map_pirq to describe why need this hypercall.
Change "!is_pv_domain(d)" to "is_hvm_domain(d)", and "map.domid == DOMID_SELF" to "d == current->domian".

v7->v8 changes:
Add the domid check(domid == DOMID_SELF) to prevent self map when guest doesn't use pirq.
That check was missed in the previous version.

v6->v7 changes:
Nothing.

v5->v6 changes:
Nothing.

v4->v5 changes:
Move the check of self map_pirq to physdev.c, and change to check if the caller has PIRQ flag, and just break for PHYSDEVOP_(un)map_pirq in hvm_physdev_op.

v3->v4 changes:
add check to prevent PVH self map.

v2->v3 changes:
Du to changes in the implementation of the second patch on kernel side(that it will do setup_gsi and map_pirq when assigning a device to passthrough), add PHYSDEVOP_setup_gsi for PVH dom0, and we need to support self mapping.
---
 xen/arch/x86/hvm/hypercall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 68815b03eb25..0b7fc060b4e2 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -73,6 +73,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-- 
2.34.1


