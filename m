Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7FFB1185A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057177.1425153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBj8-0001ov-KO; Fri, 25 Jul 2025 06:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057177.1425153; Fri, 25 Jul 2025 06:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBj8-0001in-FO; Fri, 25 Jul 2025 06:16:18 +0000
Received: by outflank-mailman (input) for mailman id 1057177;
 Fri, 25 Jul 2025 06:16:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBj6-0007jJ-Hk
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd63c72f-691e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:16:14 +0200 (CEST)
Received: from BYAPR07CA0074.namprd07.prod.outlook.com (2603:10b6:a03:12b::15)
 by DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 06:16:10 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:12b:cafe::be) by BYAPR07CA0074.outlook.office365.com
 (2603:10b6:a03:12b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 06:16:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:16:09 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:16:08 -0500
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
X-Inumbo-ID: dd63c72f-691e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVLjwwftEnazKV01iaK+b3u3eOM1NbB0omHhnaS+dxgb9zZEnDUWooIeSp8l1zH9zY98ZtP/RScsy5i4rrucRdW1EC3nzK6G+tiv0eYH5e6bUzj0dojgJe6dcTCgbqOGPtL/EfxXkl3qXNxca8pgy9O8DUT5mwZi9z2O3JDN2ZIfl52QCvqvk96qdrWsMG1YcAYimCcr6BHc1xlMhSeoMECN0k2a038q0iz9tNNZ7Ib1iKV8utI9VTpBvWh57omKD2242FHnSyK2nfBV6KTsuyCefAR5w58h330GQxgwllKwsAI6B7wNeGVyKjtmhQOkg9VlkyScqetrruKm43iK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F98DbrCPzxPK79XAUFK/eQkwXwDe7WqaiOZQ7Ae3QKA=;
 b=Qi2S8+YH6BdcA3FIOgW5Yuj6TU4EW6CnABCIcACybvMu90UGdfRQCQD75AuFnDBIm8FybnCFHPru1prpfZE9H9Fa3Cvt+1WUouiINyvC4KzyGEWYG8NyKyw1bsolTwq9H/TX8vG/7LFBCUKCr/gprdiKbbSnSxV3Dmn+3FCPJ1az/6ZgvzvxS515MZVoVMYHGEAe6ysIq9O59vIxkURNgESETS4l2lbJRmZUgdkZIw4tkSkJHL0zTQ9p06r5CmdGo/bLzHHAShNM/Zwkr/AfMPtJKG3/xs4YCj7AF3EpPfbFWfqFIbTR0n2qr/JLWx2mMqQwVu2fZnFSIKEERiALSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F98DbrCPzxPK79XAUFK/eQkwXwDe7WqaiOZQ7Ae3QKA=;
 b=Kuw/99TemT7via9+WZ+pzfOCGay++3oSQ4I9O0gJ3zJqETNrDgaMm7KuCCXcyprEmOP8gxuyxC+Ci/i1RLWhagGO6Krh39b8oelOx8vqMGc9M6bl5qmaw5kTA3KXB/jFh2d+a2p9Iia5e39VuZZ8AIrLTywRl3GmSodBEzeCFeI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 08/11] xen/xsm: Wrap around xsm_resource_(un)plug_core
Date: Fri, 25 Jul 2025 14:15:27 +0800
Message-ID: <20250725061530.309953-9-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DS0PR12MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d12f66-e22e-405c-c0c1-08ddcb42bf95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LaJU3L46ZUQLocAU2AznFBws80NhB/bWgto6aL+IOb3giEyBRasUvvcFryW2?=
 =?us-ascii?Q?TtOyyxMZw04Ox3qqmfPDFv4pyzQyLaoN+pzENH8GLz4ELE9lf/2LiDRs1UFX?=
 =?us-ascii?Q?b/IeQ8tviHeECgjK3TjSvL0hxH6/G761lIPgHQRFaQH2ftkFri1ldM1CPIR2?=
 =?us-ascii?Q?I+ZK49Wy+YL/QW8xo69hXt/i148b0eSGJe1wJUww/NMlorrlXU/rL37QELR0?=
 =?us-ascii?Q?yaDvMPnl89PPaTNr4c2PSxljyejLVIiy4/1k2IfSSd3RfoekpwKKsXkq8H6K?=
 =?us-ascii?Q?edToclA/aytVwTKaqoAZLnJj2au3NfLUMNfQpZfsYMXoqQvGnv/dzgT0lEAs?=
 =?us-ascii?Q?zFdE48bXW5Q84mMGce0RbtDY/jCGWh1CyA9espk1x8xZhOSJS5kLRUGQBkkz?=
 =?us-ascii?Q?JL79nwyylMtgJcSsCSX3233mzMPIEEh+kL2UfhDwcMZHreNU7n3i+86cPING?=
 =?us-ascii?Q?Ik13Ne8ZSbametrfFk05euV9nrKSopPF0YLuUq+7GUw2ZA/wIMBObC6LH5xY?=
 =?us-ascii?Q?fzjIRaqcA9vq0DAjKj+CE/1WZf6jvcI1wXIbO0nZWulAHxh8snxNROF06lVM?=
 =?us-ascii?Q?CzDiW+EmU9soTUPJ8jVsXraPzTE8ctcTA9MucsJ7xMK+muwZp4kevaJRY53M?=
 =?us-ascii?Q?VUkDvJ1nApVHsMfLe22HsIvCaRYUqdtE3v+c0oqtAq2P8hV52j1/hABAbUdN?=
 =?us-ascii?Q?6JDwwkVLDYDI8BWBqGIWk1KrN5UWCYZ15W/ekM93ispk/qMMBAbzCtnnF9WG?=
 =?us-ascii?Q?gQ/E6f+yxjw9khPCRZh44PLarlFIlbCMqQdER9HlBNEnETXXV9UEYa0S2VKo?=
 =?us-ascii?Q?2dHL/NB6eI2jfUvVZ1J6i5JfN1n6ePJWYknIW0AOfanweCFnjkc3ObaBMf6o?=
 =?us-ascii?Q?eI2cr67KLH/Fj1piT+P8FhkKgsOGErIsWgQYj/9fdS1Rxk1iLzk01FMbX2pY?=
 =?us-ascii?Q?sHcsOvj9dRo2sJtrlPy1rhL348owzXEYjwpgJ/Zvz9mIPItAFRbGTG09bB9s?=
 =?us-ascii?Q?vO6VSoTZV0c6by0IzlpsMRdNrg+PG5jvyss3etbDpMgd4UV0Sef/GPBBR/bB?=
 =?us-ascii?Q?P+mDA1snY1n6/kSOb9IwORtNsi4v9i8EkNQGP1xj9LhUHfa0BCQHP6W8aMaQ?=
 =?us-ascii?Q?/MXfa+W+eBPVVFDfnAMWPY96h9r6QVmaifmVqIWVO71K2UeEXtaG2yZjUrT1?=
 =?us-ascii?Q?HMbeqWrqyCR7e76QITcgTGcxOLk5h5lmIf/hfTBChsmDM1U6HBp7NJPWdaNX?=
 =?us-ascii?Q?jSgUyrZZFvJtbI0BGqtWLuczQbz4fbqcHQDnuF8uLCiK6iDxzhf20HP3gQ1j?=
 =?us-ascii?Q?20k2sJ4u0dBFXmGMRGxhIV/9aT8UAirR2ovXwPYdsMuHkuPMckT705Gj+uLt?=
 =?us-ascii?Q?TMfrvuX6GjYOHveosGLr8LvB/y9+NAkywbneQqEN4rmMGm7AbxAUx75OPRyJ?=
 =?us-ascii?Q?Mmy/q/DQ1lLb/44Jk0bYUSP3fLL5/60/ljA+ARKSK6blO07CZB3opScVXypG?=
 =?us-ascii?Q?BpxshMBa6HourY13XRfnSp8np3Shf3UOi+cb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:16:09.7678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d12f66-e22e-405c-c0c1-08ddcb42bf95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772

Since xsm_resource_plug_core and xsm_resource_unplug_core are only
used for arch/x86/platform_hypercall.c and arch/sysctl.c, so wrap
around them with CONFIG_SYSCTL and CONFIG_PLATFORM_OP.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
---
 xen/include/xsm/xsm.h | 8 ++++++++
 xen/xsm/dummy.c       | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index bc0a0776c895..546a1aa57e37 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -577,12 +577,20 @@ static inline int xsm_resource_unplug_pci(
 
 static inline int xsm_resource_plug_core(xsm_default_t def)
 {
+#if defined(CONFIG_SYSCTL) || defined(CONFIG_PLATFORM_OP)
     return alternative_call(xsm_ops.resource_plug_core);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_resource_unplug_core(xsm_default_t def)
 {
+#if defined(CONFIG_SYSCTL) || defined(CONFIG_PLATFORM_OP)
     return alternative_call(xsm_ops.resource_unplug_core);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_resource_setup_pci(
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index d9f4d3ee12b1..ab6eb2149376 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -90,8 +90,10 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .deassign_dtdevice             = xsm_deassign_dtdevice,
 #endif
 
+#if defined(CONFIG_SYSCTL) || defined(CONFIG_PLATFORM_OP)
     .resource_plug_core            = xsm_resource_plug_core,
     .resource_unplug_core          = xsm_resource_unplug_core,
+#endif
     .resource_plug_pci             = xsm_resource_plug_pci,
     .resource_unplug_pci           = xsm_resource_unplug_pci,
     .resource_setup_pci            = xsm_resource_setup_pci,
-- 
2.34.1


