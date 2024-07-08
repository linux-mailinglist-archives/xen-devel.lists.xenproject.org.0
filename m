Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12F892A15B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 13:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755304.1163642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmkr-0004pB-MU; Mon, 08 Jul 2024 11:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755304.1163642; Mon, 08 Jul 2024 11:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmkr-0004n0-Ji; Mon, 08 Jul 2024 11:42:01 +0000
Received: by outflank-mailman (input) for mailman id 755304;
 Mon, 08 Jul 2024 11:42:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQmkq-00042h-9a
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 11:42:00 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:200a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14c06e82-3d1f-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 13:41:58 +0200 (CEST)
Received: from BN9PR03CA0784.namprd03.prod.outlook.com (2603:10b6:408:13f::9)
 by PH0PR12MB7888.namprd12.prod.outlook.com (2603:10b6:510:28b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 11:41:52 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:13f:cafe::5f) by BN9PR03CA0784.outlook.office365.com
 (2603:10b6:408:13f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Mon, 8 Jul 2024 11:41:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 11:41:51 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 06:41:47 -0500
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
X-Inumbo-ID: 14c06e82-3d1f-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kf6GrPl2eL5LWJxBR+ApYMf7KS4Sv39mS17uxD5ldjtr6UwVThX62/FEewnX/po35cTmfQbppc5+SL2xxFHTdz+7YhY/mk+p5ogRy41Kga+yD5M0B+4R2ild4kgByhJIBmHVjImxmy8GtkValMUwGmSUaxLeyId3a6KOWtIeadJoW+cgEymqjKIpCt/9HFt7a+g97Grliuve3AXm9Y5zecnB9XWWzCyt5iJ1WP8HJr5HR7N5EvNOlBELvhVX8DXeNL623LwFhkO3VZlF51OdG41OCfcetoGL6yncJ68bEsDJ12zYMGUBxZMt3HVgLEGjm4eoMd4n7yG+JEnS9VgK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHHPfEU7Tj3wFWabDhvJJiTUzdQGCtYEiTn+now2Hu8=;
 b=egX97bG05FPNnK+goiF0xgLwN9ZUOjP0UKNwF2ZXCAOphpRJQ8J5GM0e+oSS5g4j/zYO/SFqMc5dGHiXPb4O7EZVg41x+Hk2wmszL+SpFbckkzoHWOs613Xkgr1LHVp84WVL/i1jRx7a9+eMbOIbdr1Fc0PxP1HDbV+tPUJdpx2+JS5B8LjecOWoI1EU92ZwdmJW0ZIxekz+uxf0eWU562EMUgGLgLq2az2467Vge+APXuVvpiiH2413ulGC5YP3An+5kIVFFmj48gdjI2XcRc5Sl1FwPHPw4jasdnVDJZaywcqB5KC28jWETFeIT3r9CFrbLYxS267ALCyQPc1Y1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHHPfEU7Tj3wFWabDhvJJiTUzdQGCtYEiTn+now2Hu8=;
 b=bcB0yuKzUDYrtIxhNXSHk4d31fHy04dg19o1oSGTEVevFUYWX4wPhCvIsmv25H92bf5IeYEbOaboaiwGF1ecrQSsC20jsJLgu5w7G4uI57NMRAZ4kEWrHSa7kNcbmB6YapazqjJMJWT7JNCM6WGAS03geBs+2wSOTLQshOKyA/0=
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
Subject: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Date: Mon, 8 Jul 2024 19:41:19 +0800
Message-ID: <20240708114124.407797-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708114124.407797-1-Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|PH0PR12MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: b3592a91-5eb1-4bcd-97f5-08dc9f42f545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aNFVr3j6gTwSBsLAPTQl2+bKvo9vjxJKgNEFuxlsBO2Z2OCNUnzdO4Th+ROW?=
 =?us-ascii?Q?XRQwvZ7SiPMAGXvBAOYUsGCFEPC3o89Od4hUlLi5h8EE0uCIb5aXAA0dAJpK?=
 =?us-ascii?Q?5C4AKWKY3KGP5PfMJU2Ewdg9A0uFrTUwOsCmEyOH5iKcDCoV1NT+g7/o6s9r?=
 =?us-ascii?Q?pM1oDaBbaYhefkGBP5vYndtLhPXIFzAZsDHEMro4B8v4YthAmPL7j1H30Hqg?=
 =?us-ascii?Q?9+caVWTziind6Tgnp5++U/zgtPIGeFC9qZDSvVQ3j8rR/oAFpX5o3ckpQIMG?=
 =?us-ascii?Q?arclB0aCgcM8MnZ/RnJgqNlERCosTfhJMBjIhBID4JGMnWglbBuu2Y+9+5QX?=
 =?us-ascii?Q?A68lPnZH432UzQQYcjAALLtA+JWK7KYaHcDMEUbKFTug0MAHuMuk5iRMx/D3?=
 =?us-ascii?Q?tlAQgQJJ0JXlZDCRtgIItY9sskHtDy+Y84NdsVLCULuH4ZsQqZjIAhUV116U?=
 =?us-ascii?Q?6W6szlD2CNvbazeC8C4XmqdvdhYpIqzBeuNOcDxObSWsVuYjGXLaAz8Tvsmf?=
 =?us-ascii?Q?/h/xKRmzg8mxVMhSCk0/1Gvoll9lcT256dHpPkdjyqkwK+5ACVwBnwvs/ugC?=
 =?us-ascii?Q?IwAJPV2+/TLYcUJVzCMJcCNJLDiYWqf+DdMH4Aj2cv+UbA6uFIzeGyJ157tC?=
 =?us-ascii?Q?BB9rrUgdNoA4p/PJXyOM9WS6qNkZawFV2kUFZMwXJOWor06nG6R8RvlPCgQs?=
 =?us-ascii?Q?rijsmR7j9G0a5JeQsdNB1gb2I1YcB3kGR27ZdKPBHEVfmrkx5dmLg84IxQkm?=
 =?us-ascii?Q?PfE1HFw/yA5yE9pGRFU+zqyukb4hD5Xy7i1saoQLsAO45CJc3dO2yciXHjMi?=
 =?us-ascii?Q?oBbxZu1cq1FbPnDEQaP6hXFQp8m41TMrIkaXMT9fkdX+Qw99Alwse/a6rKUi?=
 =?us-ascii?Q?cCPQctrm6j53u+yxiW8ETT0eRhXp+4VxQtgtiS7pPg4tky2/La8OQrtIw/u2?=
 =?us-ascii?Q?gI+LCSRTjE1EjouGwXH447i/dIM0nFhIv+crt8PNTFZqoyv7bLTA7wFwd4AF?=
 =?us-ascii?Q?HT2OYwZZwZbatJebL4HGYHVEmL9SIygWeOqwtRL5aLSTJur0kYBdQ+mieCLp?=
 =?us-ascii?Q?02dzkVHrVeP0NYS6B0kt3L+FXNOGdxprsw7c8hesyT2SD9WphuLj+zD3tU6Q?=
 =?us-ascii?Q?TDnLaN1lQPVP5Tpd8BDsrTHonDJ6U+dLEvgYU3Rs3+ipCkyt8GutLU82XQsL?=
 =?us-ascii?Q?f3mjleqkR8ffWcB93O/b7bbg2OkxtQWq9KEaSBic45sLsvp5mQoyE9QlW9Kg?=
 =?us-ascii?Q?Uh+CvoFz38GXODpR21IIPBi5sZ0rvaOHMDp79lVE+3FQwH3pgtMWjLgbz1jw?=
 =?us-ascii?Q?ISpWrFNGJ9BHxugEm3MBld7WVo9QcpB89lb7kVOkTqOh1dvcKCc2Cv3FHKAY?=
 =?us-ascii?Q?ol/9M3obukw2FVsq2Fc+fY2oVc84rRFoVO2dFxhUh8NMPNWNBfe5JBRr9481?=
 =?us-ascii?Q?M5L9nA0njblpqR/JSNDX2BQu/gXKULyV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 11:41:51.0779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3592a91-5eb1-4bcd-97f5-08dc9f42f545
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7888

If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
a passthrough device by using gsi, see qemu code
xen_pt_realize->xc_physdev_map_pirq and libxl code
pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
is not allowed because currd is PVH dom0 and PVH has no
X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.

So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
And add a new check to prevent (un)map when the subject domain
doesn't have a notion of PIRQ.

So that the interrupt of a passthrough device can be
successfully mapped to pirq for domU with a notion of PIRQ
when dom0 is PVH

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/hvm/hypercall.c |  6 ++++++
 xen/arch/x86/physdev.c       | 12 ++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 0fab670a4871..03ada3c880bd 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -71,8 +71,14 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     switch ( cmd )
     {
+        /*
+        * Only being permitted for management of other domains.
+        * Further restrictions are enforced in do_physdev_op.
+        */
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index d6dd622952a9..9f30a8c63a06 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -323,7 +323,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( !d )
             break;
 
-        ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
+        /* Only mapping when the subject domain has a notion of PIRQ */
+        if ( !is_hvm_domain(d) || has_pirq(d) )
+            ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
+        else
+            ret = -EOPNOTSUPP;
 
         rcu_unlock_domain(d);
 
@@ -346,7 +350,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( !d )
             break;
 
-        ret = physdev_unmap_pirq(d, unmap.pirq);
+        /* Only unmapping when the subject domain has a notion of PIRQ */
+        if ( !is_hvm_domain(d) || has_pirq(d) )
+            ret = physdev_unmap_pirq(d, unmap.pirq);
+        else
+            ret = -EOPNOTSUPP;
 
         rcu_unlock_domain(d);
 
-- 
2.34.1


