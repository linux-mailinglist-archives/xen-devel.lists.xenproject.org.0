Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAFFA7103C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 06:54:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927006.1329828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhq-0000Mm-BT; Wed, 26 Mar 2025 05:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927006.1329828; Wed, 26 Mar 2025 05:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhq-0000Ki-6p; Wed, 26 Mar 2025 05:53:38 +0000
Received: by outflank-mailman (input) for mailman id 927006;
 Wed, 26 Mar 2025 05:53:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJho-0008HQ-SP
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:36 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:2418::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7270994-0a06-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 06:53:34 +0100 (CET)
Received: from MW3PR05CA0019.namprd05.prod.outlook.com (2603:10b6:303:2b::24)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 05:53:29 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::d9) by MW3PR05CA0019.outlook.office365.com
 (2603:10b6:303:2b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:53:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:28 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:26 -0500
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
X-Inumbo-ID: a7270994-0a06-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6RJkjj80fe9vGlg5fR66z8snJlGldUSrp1oB2As54p1RjLUG2gP3IJQQZWyX0ZT6wvYmY+fxKccZ1CsGJlKjTcqgLt8FGg+XNjIF6rEBIoPgA1mvZW5T13cdPkR7XPDw5LkdJguSOVOVTfzzWTED95WiWxCxqjgZifYBQ9pjrU1o3Hs3KPr0PBmGj5MuH+7sfKNNvJcl/eYvEozFeafG+vvSAmfCxMHA8FWqbuVpBEATCflLhWwU0HoBe+wg2Ji0ouZDYiTUhTOiaCTZ1DljHv6Q99cx6EoHPtJ/mcTu9DDh1TwSEIKlfFnuQE3ZPCxVlE/kMIeJWE6drCMMpY32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4xNZXrhTcdkcGwpvYSHOTxYRp0+w+gxCGXPeSW9dQ4=;
 b=Wy+WVr7qpDRxRghEep/7C3Z6wEZikUfIgUmL36QDaLfb6Cl4eP3kMFVJTDQXKnclMURdw3CWAv30X7JjrpAsPYmS/u1pE1BMXW0b1xMx+b3ItDO9iCthPXeSVUiZ0tao5LGnE/E36ukWGYptOlwxDXjeZwF2oVRb9mIjztLC3Vz+UuQrJSGakqq+CXryHQR2RjwH81HtShXayHCXpMLoJF71gM74SbOzUIDlUoN8ViiubCZFZubgH5YpdZVUHI24rmNCv7Vo+Ovon2e9KrdMhKg8aY3k9ETeYR4SwopGr4AB8S5hi3FzwI6AgPtNp0I8MANGOyq8GNroJW0L9JiAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4xNZXrhTcdkcGwpvYSHOTxYRp0+w+gxCGXPeSW9dQ4=;
 b=lYG9ZSw/cvT/OMKIEQ5Om1eH70Epp4ekRpTyrv64Uc62xH9eeEfBLB+QkdVwzMrHWQ49Sx0DT1fhBL5OZUDuurk+WJMAYg5EFh6MHsDiUYQnOIi1P0FdZVjpbhN5KiPVsUfY0pBu3m2IUgT/rQHbnVw4RvNp6/sz+lpy7JNoyLc=
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
Subject: [PATCH v2 03/19] xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
Date: Wed, 26 Mar 2025 13:50:37 +0800
Message-ID: <20250326055053.3313146-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|SA0PR12MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d222f16-09bb-4271-0542-08dd6c2a8864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?djRObBKjJJnG/sK/4yp2eXMQmZVmYvNslMEte3tGEFL4svEIUp5R8AbsbzBo?=
 =?us-ascii?Q?OvWJLq2YaXGKHiH9T67OBhAPxCFtU/8ygmbHx7sLaoao6K+5gkNnUtSr3W9M?=
 =?us-ascii?Q?GWfyBFbTnHhXu6sjANwlEU+qI0MXGhj7Pu77lgq5/GPQDGTVux+wzbKCHLsw?=
 =?us-ascii?Q?//QmiCT2UjCwOH9cbNMzfzq1MvgId9fNv/vI9xufdhxm3FWYwZrX8jMe0d1W?=
 =?us-ascii?Q?BPc+wf/X8R4DlWZnyB4rQ2+hWXeZp13nSNefqBpTPSEZaVHk9uDEsI0oiKiR?=
 =?us-ascii?Q?K5+z/VS03Ool+YGuYFdbt/0dQXsDXusS4ma3mTtldzyEwZ/S/1pvDCKOUnNd?=
 =?us-ascii?Q?m6bTqzEkZLHagDc5Fs7dqQNBsVPiJEgyNf+1+W7/HcvJAnyReKqP593ZmQLz?=
 =?us-ascii?Q?99hhkn7H5osVbPq3mtp3FCm7Utg2WWab3QGNw4m4QpYFGvlgn1ao1DFLszFY?=
 =?us-ascii?Q?h8zO89BFJCwEyFdUpvvSE6Unq7bGQUjkFGT4MaoOxBY0X3QyMxiIdXdUm+nv?=
 =?us-ascii?Q?XCot7HmS/gkMR2sBCq8drBklp3AXJ7ToE1B6v8PViEMz63DEIXQlhy4lsK9j?=
 =?us-ascii?Q?BvtFmkHpF95LZDmQlwzgm5B1/MQRTVA+72UL2RNxOYBeDVeS+59QspsmFLid?=
 =?us-ascii?Q?MCW9xfzk1f6oEUqRf3mgq4euJAVd9XDavKTXZjvaTTUXWSv2QjcBDa5Q7NND?=
 =?us-ascii?Q?yQOswex0T4GoTWa4fAE68xiY8qV8cEhd26WFggY7F03WL92+0z+oLT9PAdR3?=
 =?us-ascii?Q?6osrh+RFJbWVbTddy3x+mTvY9k7oWev5YuOu39sdpK7CU3kg5Wni8lOfVH/Q?=
 =?us-ascii?Q?htEYey8pP8iEzQ/qyShmuBCyz8lMmSmmN263amtr6/Y5JdX3oSP/qE9NqC+C?=
 =?us-ascii?Q?9Bzi+2bn71uWVkZ4dBYT7L3SXLOj6yO44bFht9W0xAdzxyY5Dbb/cZRSrHPw?=
 =?us-ascii?Q?hrATUqiP4CynBBqUd2rHY/R8y71/erW7WtwQC6GzXbFimB0/pmHStQw8rA8I?=
 =?us-ascii?Q?/i6GLXstIHyhbJXszouDGb2oW0/KPjKl9pfUXr4pGwNmt7IGJzAeSdn5ce5C?=
 =?us-ascii?Q?2gmEr4AV93JMTaqBWl5c8GP03YVYy+4QbCc8mrfNkkV621zrQYMksZh62Afy?=
 =?us-ascii?Q?1+F9+6SkQu8Kluz3ktf8slJnO6d7CbZZqqi30wJ11AxBxMabWL+Ij9PSy5DL?=
 =?us-ascii?Q?2CyxTp8cjvsSV0eTrzFEY76pm/nCDeu6S7zxdeHF2fAnrGTSNk275Lw7Q3QB?=
 =?us-ascii?Q?IfToc6sA+PkRU/6H1F7gjl5+qZp1N/UwBNdouO6l57fPxMNKXkivDYSVnDKT?=
 =?us-ascii?Q?fXeZqNciCmeRQ4vICcogM/l/Lez9Y7pwadSwanFbFqaevButPWcYBPciHIMa?=
 =?us-ascii?Q?JS+2Rpx0sdaJ9XdddZQ2vwuASfC07RyegMK/y65h8GpXHAmpyMNFmnf4G+6e?=
 =?us-ascii?Q?k3JV3SGjGhYJSbiT7MPYU3qKRQaxYggPpL6/uiU53SM3cAD+uLACmrd7VvuA?=
 =?us-ascii?Q?hUpUvaT+xZH6zSU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:28.7911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d222f16-09bb-4271-0542-08dd6c2a8864
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494

As function xsm_sysctl() is solely invoked in sysctl.c, we need to
wrap around it with CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2
- remove unnecessary redundancy in dummy handler
- re-place #ifdef into function body
---
 xen/include/xsm/xsm.h | 4 ++++
 xen/xsm/dummy.c       | 2 ++
 xen/xsm/flask/hooks.c | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 24acc16125..22e2429f52 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -261,7 +261,11 @@ static inline int xsm_domctl(xsm_default_t def, struct domain *d,
 
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
+#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.sysctl, cmd);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 93fbfc43cc..93a0665ecc 100644
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
index 6a53487ea4..befe9336ee 100644
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


