Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F6EA5D4EE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:07:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909669.1316584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDN6-0007Me-7U; Wed, 12 Mar 2025 04:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909669.1316584; Wed, 12 Mar 2025 04:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDN6-0007J6-33; Wed, 12 Mar 2025 04:07:08 +0000
Received: by outflank-mailman (input) for mailman id 909669;
 Wed, 12 Mar 2025 04:07:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDN4-0007Fd-SH
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:06 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2407::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75301f12-fef7-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 05:07:05 +0100 (CET)
Received: from BN0PR02CA0017.namprd02.prod.outlook.com (2603:10b6:408:e4::22)
 by SA1PR12MB6702.namprd12.prod.outlook.com (2603:10b6:806:252::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:01 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::3d) by BN0PR02CA0017.outlook.office365.com
 (2603:10b6:408:e4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Wed,
 12 Mar 2025 04:07:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:00 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:06:57 -0500
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
X-Inumbo-ID: 75301f12-fef7-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNK9fj2GSoUKbulpzdaO0jpRR/vfgZtLigm/oQiRwNHHPuXxk87hL4CVGdEYEVdZLPfx7UtuIrEBX64XNC0qJbQhJWea3f9yf7xN3xAEwqsZzdV2zwLmQE3Gc+tpGEj97bybPB1NknpzKEbZOTE5FRf2G0cbwB6Sh6qpP/fGWRtmFTsFWSUQEIthSoGieJo6cLKdKWk9IvvoCHsKWvQrNL/oqDS+B1ldYVrWKeaEJl6+D6fMt9CwzQXLUsNN6iVLfsRUGQeMCUdh9beRMvCM72y73AaUXg3ELNLneKpNmdbmfj5lEVkIz9Cqlbay7Jf2dc2YNh/LzoZ596l+LxjoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNZ6mxJPEktxyT1PTUMdc+Ph6uJ6rlUxizi8pvIjKXg=;
 b=EOyZ4ZJj9hxEOmwXIIFjExSVU/USBdmbG7ElXBlFb24TF+Y/rCgb55vj58bLKXA8DLkxBtxI9HVtYupYj07z0oxosePYzAJ4wAMVVRluYHZR/dvNy6kMO3b60yTf1IQmaNYQsiLOjIlVL4dzM1TFC409PdMOeU91ajiA+nOaUuqdUae3AolUoE0V2bA0mbGvP2becXvaji1w0CevcZDjC5frD+JS5rP9vyTG3y8k4nRMlLDt/ESxCK3CRYw5YmZ1lz+FPo6Uapt7zRIpIy6Je5DQ566/Duh7XgRtl2cvqvN9bF6OC4Gl8X4IKoHMrJIVovcREzfzwPpMrU8jodyL8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNZ6mxJPEktxyT1PTUMdc+Ph6uJ6rlUxizi8pvIjKXg=;
 b=KAPmM09Bxy5O31t0rGbpPPg2i81tjjbyhVGthHXjy7SGKe/2Rj37ezF+ekHu5rhf67MM0akI0sPN5zC3qpHnast7QcmQ/S9s3giwFI/T6mz+jbdXjXKa5evq4hOvt/ILekyKuAaraTH2JCUkqyNEqvX1NsMpG1W1tQJYuznKA1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v1 02/19] xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
Date: Wed, 12 Mar 2025 12:06:15 +0800
Message-ID: <20250312040632.2853485-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|SA1PR12MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f80e15-a626-4a0c-eb4e-08dd611b56ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nAU2EQI5nYAxq0IZO3WgTArcIJ4ME8GmCzc9WjdqOH45ZDO/iu7nro4FJb1x?=
 =?us-ascii?Q?yIXaGnkj6s4HAd9AmlAY2bdVMQd/kT2K7bjXctiRHkVlRc3Hxo01sVRL6bkK?=
 =?us-ascii?Q?FWH/Zhqg/wiG9IpkNcDGhVMYn43V2cRR6HyySO1aDX+IJt2+YUvMfl+Vcpet?=
 =?us-ascii?Q?6dP2r141V5asY9SLfdxm6714SZ9kMuTCIFpr9tpgGxJl4F2Nf06DMBNP/VG8?=
 =?us-ascii?Q?YSKPyY51zy97gXiWI4zR1Fsr19DVULinpS5+2sJz3JkQYohao+93giN1b93q?=
 =?us-ascii?Q?2pX/LOnWqxHg75PJXxubwkRFSRFLpHNRbdQ7MUhcSEaVO+vvaAu8nKf1KWXM?=
 =?us-ascii?Q?kQwniAozqwpoNSucrbEcOsv731waJl1ENn4VJ7Uvc4dGUCw/lWObjhh6aCDR?=
 =?us-ascii?Q?an+pnvaxenqZY205r0jejbz6vpDiEW4zhKs5qkja/ybSuZgG5vUnLX7QVC5R?=
 =?us-ascii?Q?SKiw0xmFE3KTITfOh+0vqW0pxTl5oYMKyslPwaxM0wDd3BhMceSkpLkZAYxb?=
 =?us-ascii?Q?AaWesNl3G1e9rlzeqcepoDpkK3VDKE3RqNvqlZr8bcQ9VMQIQ7inwSMzYG9A?=
 =?us-ascii?Q?edrKVJzme+/2DnHpIBLTV/0NX+JIsulhOg14R+83Wx+RCA+XyIkVsllyl9FH?=
 =?us-ascii?Q?0pTeAxERrdYnU/X4EstKJzO401U25hwjoeq9Qo0NECyIwfvJZIcGgT5/hRvl?=
 =?us-ascii?Q?AgtI2P+nnMGqXQNqFje7Z6qMR1OWRjYZG0NB1CKXXdR/kYoima0Z5+qVazvW?=
 =?us-ascii?Q?Lbp2yIU7JfT2iy25wo7DwEhoylyKfOtNagtWTaIloXXp9AJj/gbfnf6ESMYL?=
 =?us-ascii?Q?09HyJreTrzmmEbLSUnr4U/ASYh6MdTV0ugvwdw+q14Kl8xoBM+Jh/BdNnY+H?=
 =?us-ascii?Q?8+9z1fwNRUl5/qJ5Qzi/oa9EytkuIZW/8HAaXklpw2lzrQ6pCRx2/m1O4dLN?=
 =?us-ascii?Q?K7qa2YOkiPUBIYqEZryds1Rb8erkfv9heYTRTm/L+ivNi/eWbNWgabiqVm0c?=
 =?us-ascii?Q?xi+adS2BKVz4n6VqJHg3GJMN4xGYV0lIWosh02Fh8OGDDwb94vpVyEHTUmRu?=
 =?us-ascii?Q?DZnc4Uf/DVBX8mMDTpx1pLyd7vz2MoZu9DACnwlGMOlunxDXQ9QEaiUYT3Cv?=
 =?us-ascii?Q?+ekH8v6SvJy0EeMNX2T7Q8i79GhTThzEeHlchnVsP/HepJTqY3sigkK2kyr4?=
 =?us-ascii?Q?cKxsNck/WdWHvUJ+qeJwXhPpYYZbLF+TVm+J5qzGbLK1es9TP0S9M4TPXPC4?=
 =?us-ascii?Q?l50PEgedVQso+UVlzrJBdrThh0lzbX/8spIuYSZJEIxebEYOpbYX/qkQGAgd?=
 =?us-ascii?Q?0a3KKt2pMcYCdQ21OoolQ20TCFc3s4WgfvLgJf+E1XU0iJoS0Ml+EKu685O7?=
 =?us-ascii?Q?EzDJSuDNZv5KLOuZmmyE75R51rOdHT6O8xIcB9qu5UZWGMQlP1hfLY/guNwX?=
 =?us-ascii?Q?wJuEoZFxMlcv38/06idbz+HD3LDEx5mlFBBOSgZJgAV/cAtvtqsWFRR12xtP?=
 =?us-ascii?Q?/7aiVUYrgCRYwio=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:00.4422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f80e15-a626-4a0c-eb4e-08dd611b56ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6702

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/include/xsm/dummy.h | 7 +++++++
 xen/include/xsm/xsm.h   | 9 +++++++++
 xen/xsm/dummy.c         | 2 ++
 xen/xsm/flask/hooks.c   | 4 ++++
 4 files changed, 22 insertions(+)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index a8d06de6b0..afc54a0b2f 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -180,11 +180,18 @@ static XSM_INLINE int cf_check xsm_domctl(
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
+#else
+static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 
 static XSM_INLINE int cf_check xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 8c33b055fc..276507b515 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -60,7 +60,9 @@ struct xsm_ops {
     int (*sysctl_scheduler_op)(int op);
     int (*set_target)(struct domain *d, struct domain *e);
     int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
+#ifdef CONFIG_SYSCTL
     int (*sysctl)(int cmd);
+#endif
     int (*readconsole)(uint32_t clear);
 
     int (*evtchn_unbound)(struct domain *d, struct evtchn *chn, domid_t id2);
@@ -259,10 +261,17 @@ static inline int xsm_domctl(xsm_default_t def, struct domain *d,
     return alternative_call(xsm_ops.domctl, d, cmd, ssidref);
 }
 
+#ifdef CONFIG_SYSCTL
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
     return alternative_call(xsm_ops.sysctl, cmd);
 }
+#else
+static inline int xsm_sysctl(xsm_default_t def, int cmd)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index ce6fbdc6c5..0a5fc06bbf 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -22,7 +22,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
     .set_target                    = xsm_set_target,
     .domctl                        = xsm_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl                        = xsm_sysctl,
+#endif
     .readconsole                   = xsm_readconsole,
 
     .evtchn_unbound                = xsm_evtchn_unbound,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 389707a164..7c5e7f5879 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -856,6 +856,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static int cf_check flask_sysctl(int cmd)
 {
     switch ( cmd )
@@ -933,6 +934,7 @@ static int cf_check flask_sysctl(int cmd)
         return avc_unknown_permission("sysctl", cmd);
     }
 }
+#endif
 
 static int cf_check flask_readconsole(uint32_t clear)
 {
@@ -1884,7 +1886,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
     .set_target = flask_set_target,
     .domctl = flask_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl = flask_sysctl,
+#endif
     .readconsole = flask_readconsole,
 
     .evtchn_unbound = flask_evtchn_unbound,
-- 
2.34.1


