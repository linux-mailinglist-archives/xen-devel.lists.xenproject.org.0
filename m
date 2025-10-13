Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93747BD2906
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142052.1476325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Flm-0008Dw-Ty; Mon, 13 Oct 2025 10:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142052.1476325; Mon, 13 Oct 2025 10:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Flm-00088d-Nc; Mon, 13 Oct 2025 10:27:10 +0000
Received: by outflank-mailman (input) for mailman id 1142052;
 Mon, 13 Oct 2025 10:27:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FcU-0004Hi-IE
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:34 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d57c1ca8-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:17:33 +0200 (CEST)
Received: from BN9PR03CA0377.namprd03.prod.outlook.com (2603:10b6:408:f7::22)
 by SN7PR12MB6741.namprd12.prod.outlook.com (2603:10b6:806:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:29 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::ec) by BN9PR03CA0377.outlook.office365.com
 (2603:10b6:408:f7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 10:17:29 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:29 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:26 -0700
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
X-Inumbo-ID: d57c1ca8-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxndN7jmqCNh7N6AVpDN5wg1hpwjBMJTmZp1FHsmlC2cj8u+VMMkNDCj0+0vl5zZQwZEpm2aomgFHWUoE62ZJUd3EuLpbDIFz8HXInkC7KvDETPri7KbwKqulexzJV7zLu2+OK/YRDhc5MQtRgZSw7ziXUGYe+ubyS4VJyMtJL9/Y0hmzKpMR/Gm+okydg3RyOc0ZkvN3xmTyu5KYe3rhbd48iQfqeOKexK4UwCjuHnVy7B7tri5AInbxDkE3s71iR3YycozjuVgMq5cmrJb3LkYBrdpN9t7feKIwc43QAGHJGhTwlaQHP4B8Mfz5yX5b7yuQyoiJcucloOyMRjyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwm19MfQLFYMEaHpF+50GvvhGNeqkRUXQdYfCrb3X5E=;
 b=ETfUd4d4qDSnH9P4ykkb21/skvieCxFY6gJyGoub6uVGF9KWGhyxbh1yMvlBmz74nsvqnwlek6naXMJAkw+/+U6IZBeSYorKAsVFE9PmfsWf8mCcPQsiUB74v5SPKmLpnMi3lIBYqAPrQewmIcl22nWHpMiXmW9pUbSvEGGW6qw7G1MSkH3J4KQyCviLEPt5ML/nSMc97UaZsX5lMn8T4BScqPNiunRMteMsVgffKYiCdgkrobq3IwuMeGBBSrVusqCeGI6asgbXb3IvKlYBmcHLkHJBSHJXKGKClMefNAWjPfhsiGi8UEhlnfYCk777F59ZdlKuwAbEIY9oDHtrRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwm19MfQLFYMEaHpF+50GvvhGNeqkRUXQdYfCrb3X5E=;
 b=LR5eixKyfGBQA4rVyswr6x7jkT7CNdnAHv8djdCdBLDBb++OlbxV6mkcYi36fCy6RR86lvTTSn4MDvAAyytOSEwhSVk5nLzXaNKAYibdKudk3kTlHYhNOVbTCZwxWYWL9prikT/25iU38ylDkPZvwO7WinWpkvaNbkBFFVIRiJ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 21/28] xen/domctl: wrap xsm_set_target() with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:33 +0800
Message-ID: <20251013101540.3502842-22-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|SN7PR12MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b38ad51-f0b4-4753-a505-08de0a41b73c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RplrwFe7MqOkNlUVFwcHdXkUXb/vCWqKh2RGErXr/qf0cpyERyE3VF/TqsUE?=
 =?us-ascii?Q?CFn99CTQUKDvcFIB6fWZCAqzvOVw4kEcoH04gvijbJ5ICyd3SFXaV0n/tWgx?=
 =?us-ascii?Q?YvEpyuiK0gNlGTS1h9sek+GzY1MXvAeiIOgc/Q6ViiwoNqUiV8JJ+RigGvLN?=
 =?us-ascii?Q?Osu0EP0Vy45un4w5oSQbmz+kYOAX9iivP6I4A/NAlbOWK4hh2WWoCE5e4hAS?=
 =?us-ascii?Q?3yCnx/0biXvl/cLxIfPADuBwtKkpMOuQ2HZ/AermS5ZsTrF8EQTHYnny9Ea7?=
 =?us-ascii?Q?XqWsZEq8zFEEMqfDJXQZE8dz9b3fkMX+ZcMLuWgQkd/4jRZZ0jI/VekOGYpU?=
 =?us-ascii?Q?pqb3Pwb9Prj2JY+AAr94BUGrhgeaYfjZk+8e+Vb3q739B35iRAGuYjhN99cp?=
 =?us-ascii?Q?DJf2xQm04RKPRCFx6a1c1OG3PbDvXPsfVizkE8GtcHDEg3xhE+BTzNjw2Jia?=
 =?us-ascii?Q?H1n/YMy1UMsYqD+5StjjuMxgTyPyAjDVi7UCRQGJ4y8606tExrXQQSe67c1W?=
 =?us-ascii?Q?hrwiQHXlT8oGdOBJPBDESZVGMyfV/q1EItpe98gqrT4Acv89YjNSz1doFpOI?=
 =?us-ascii?Q?aii4lJuw8StudfxvXcw0JAHruNoE3DgjrGBwN+leBohzedve5jnY2jfjHueg?=
 =?us-ascii?Q?BO1W4hyW3iQX11xCuzweFgVeHRFAxm3HsLo3anzCXbXPhxSMnISHLzwlBjK2?=
 =?us-ascii?Q?zfcjVrHK2Slx/0xlpJZ+j5fE76jlasynhi5gzLS9iuJbBP7r0s6BS/MBvtSY?=
 =?us-ascii?Q?jdjl0/Fp5Dr3ZF2/rDJYRWsoC6umzAXegSJxTxsSqKDIllOOIjlEBvGtFmfX?=
 =?us-ascii?Q?AFt9Y6EfjTOUMp/ZJJAE4KaclFa2upQO/tnl9CeeM0O9h0Cg2b9n2qMlZQew?=
 =?us-ascii?Q?rFSnTxuGGuM4vMVy/CbaCkd9OgHMmDtNuGvrV9NumUqHG4v3dXt8RAg7V4jc?=
 =?us-ascii?Q?7lgMyGmRahwtu+INDenwp4uBvAHAhA+k/qtvxRtU10fP4jLQWvnoxR95fPg9?=
 =?us-ascii?Q?HThZRgIkTVatPhinE1scaS81ysZrH1OpYzIrz1PDtcYNSkPTjqN0qMZMf3/W?=
 =?us-ascii?Q?DZb1RfwX0nof2LAcmhs2270qawOzmxqnBrbqX0URps9QzmUQOzZgY0DxEA/y?=
 =?us-ascii?Q?OqwJQJ5ZInIKtgkxGXANPfZEsR2EBE9RTxGjNOJWX1tmiAGnQYnRySRpBZ5B?=
 =?us-ascii?Q?JI82rOk34TLtQkVo8zfQUkr2GIn4LmJcgug+5VLLW1Xrnp9aW6Y9GTjR+jxe?=
 =?us-ascii?Q?dCCzuXCfTw7zNEhFE4021qKgoPV0voyIm4RyURMK1kpcEFwYwHFd/Ucfjduu?=
 =?us-ascii?Q?hF8Cf3AKuf6AznI8523HMRnVPMyiYOvT19Qx1OIj/ARpcfUIkyB3z+btxuYc?=
 =?us-ascii?Q?o9XIm6NO/8+YCQcHrHkG8k4aGedRhEgzDjTlL/fTV44Sk1ceaBDguSGzTKJJ?=
 =?us-ascii?Q?kBrT3F0V98YHP+RVz4Ix83mIuAkqDIRokidvXb6fkQdRJOl7gL67RBs0d5CK?=
 =?us-ascii?Q?Ko254iBThfcJ7bi+U54Tajh5CngsiXXPwpcjdSwaRFxISYgXpfUJQEbgCxkG?=
 =?us-ascii?Q?jOU6Dc9LXDEMBhIJv1w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:29.6114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b38ad51-f0b4-4753-a505-08de0a41b73c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6741

Function xsm_set_target() is only invoked under XEN_DOMCTL_set_target
domctl-op, and shall be wrapped with CONFIG_MGMT_HYPERCALLS. Otherwise
it will become unreachable codes when MGMT_HYPERCALLS=n, and hence violating
Misra 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
v2 -> v3
- wrap the whole inline function xsm_set_target()
- add missing wrapping in xsm/dummy.h
- address "violating Misra rule 2.1" in commit message
---
 xen/include/xsm/dummy.h | 2 ++
 xen/include/xsm/xsm.h   | 4 +++-
 xen/xsm/dummy.c         | 2 +-
 xen/xsm/flask/hooks.c   | 4 ++--
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index a5deb8a975..a598d74f1f 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -158,12 +158,14 @@ static XSM_INLINE int cf_check xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
 }
 #endif /* CONFIG_MGMT_HYPERCALLS */
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static XSM_INLINE int cf_check xsm_set_target(
     XSM_DEFAULT_ARG struct domain *d, struct domain *e)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static XSM_INLINE int cf_check xsm_domctl(
     XSM_DEFAULT_ARG struct domain *d, unsigned int cmd, uint32_t ssidref)
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index ee43002fdb..154a4b8a92 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -59,8 +59,8 @@ struct xsm_ops {
 #ifdef CONFIG_MGMT_HYPERCALLS
     int (*domctl_scheduler_op)(struct domain *d, int op);
     int (*sysctl_scheduler_op)(int op);
-#endif
     int (*set_target)(struct domain *d, struct domain *e);
+#endif
     int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
 #ifdef CONFIG_MGMT_HYPERCALLS
     int (*sysctl)(int cmd);
@@ -255,11 +255,13 @@ static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
 }
 #endif
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_set_target(
     xsm_default_t def, struct domain *d, struct domain *e)
 {
     return alternative_call(xsm_ops.set_target, d, e);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static inline int xsm_domctl(xsm_default_t def, struct domain *d,
                              unsigned int cmd, uint32_t ssidref)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 7cf00ce37e..9774bb3bdb 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -21,8 +21,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
 #ifdef CONFIG_MGMT_HYPERCALLS
     .domctl_scheduler_op           = xsm_domctl_scheduler_op,
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
-#endif
     .set_target                    = xsm_set_target,
+#endif
     .domctl                        = xsm_domctl,
 #ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl                        = xsm_sysctl,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index ca07585450..9b63c516e6 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -641,7 +641,6 @@ static int cf_check flask_sysctl_scheduler_op(int op)
         return avc_unknown_permission("sysctl_scheduler_op", op);
     }
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check flask_set_target(struct domain *d, struct domain *t)
 {
@@ -666,6 +665,7 @@ static int cf_check flask_set_target(struct domain *d, struct domain *t)
                                  &dsec->target_sid);
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
                                  uint32_t ssidref)
@@ -1888,8 +1888,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
 #ifdef CONFIG_MGMT_HYPERCALLS
     .domctl_scheduler_op = flask_domctl_scheduler_op,
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
-#endif
     .set_target = flask_set_target,
+#endif
     .domctl = flask_domctl,
 #ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl = flask_sysctl,
-- 
2.34.1


