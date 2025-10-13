Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D869BD28E2
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141981.1476196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlK-00032l-JZ; Mon, 13 Oct 2025 10:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141981.1476196; Mon, 13 Oct 2025 10:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlK-00031t-EZ; Mon, 13 Oct 2025 10:26:42 +0000
Received: by outflank-mailman (input) for mailman id 1141981;
 Mon, 13 Oct 2025 10:26:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fck-0004Rd-Rn
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:50 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de160eba-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:49 +0200 (CEST)
Received: from MN2PR11CA0024.namprd11.prod.outlook.com (2603:10b6:208:23b::29)
 by IA1PR12MB7495.namprd12.prod.outlook.com (2603:10b6:208:419::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:45 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:23b:cafe::d3) by MN2PR11CA0024.outlook.office365.com
 (2603:10b6:208:23b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:17:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:44 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:42 -0700
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
X-Inumbo-ID: de160eba-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ0m0b7/D/JbRmHeWJboF5hPDt/lqGtRAJFEIxCSYWcDbEvE1xkWIqH3KegcZkTJlQ/nFzOp6om8qQCCcWf61TbjZ9hfqqnFLRAGbx9EF1VvqJhQI10EeTVjENRwPYkdWsiGrBkU16klUxYskZFyHQbVzX40rQ9XkMr7/OBPjdKVwbn8YuFdJ46/Agu1ARuYLjeRx9FtFz1+9qexfaql/c2UXfFDJUt0l+LD/LPASLwMn547J0riMZififgQHeGxH5EWKn89aS0mr5dZLPHEz8DSqhl42BOC6n1lsfoytRTe4Z+bfnuEdCttb1qRWYLrhMYPt6gFUksSIK+OzWp+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3Cmxthn8zKCI7zPLmf0c0nfCoguIWJcBZmYje0buDI=;
 b=R9Jjit4voB4/fCqRqmj+QMd3Vnd4D2DDqqnqiMtTX5vCRlBcHBKVcGhdJPiKM9/I9th21csTcwhz33a7qyWTQbgiwwBZoXjEuilsRg0aT68woqdqOx2PzXhfgylnmv9ZMVhDduCZL9ehbvKfgPADBBx6eJit/cyl9AH8FUL2jsOh5pUyQdndhKMIuoFu3VDUMz6cKRzZ0ezme594os3pIRRRpnV1RGT4JjYPmcI0R6jyAVVtl2zcyUnKRbIDIys4Jcr1ulWUFqlQwzeOFI6U6dFWQeIu/B3cFEMaq8+JuM80Os+lHZVcl8psb5l4Cfmotjop8WoSMpqQLpgNUTkGqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3Cmxthn8zKCI7zPLmf0c0nfCoguIWJcBZmYje0buDI=;
 b=IdTqfm6/aJW18KY2B+qIlZxaWUXkuj0jQnyrwwqaHwyWajM5k3+PpkB1xjycndzG1tnVMeqAlzeysR5MzcfPfea31Pi/kLEh1IYVeI+Pdo/LsavfQP6IKSwOCwRWmv0sk7Uf6bsM+5i6EvhAi7wz86F7ozMn1mcY8GAM5AbLwEY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 27/28] xen/domctl: make HVM_PARAM_IDENT_PT conditional upon CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:39 +0800
Message-ID: <20251013101540.3502842-28-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|IA1PR12MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4911fd-f188-471f-5ffd-08de0a41c044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/ALbZrAfOY4509IcK/qZqfVKmKZtEm1OCHL2/ctDcsL7YA7jv1LJSrjNRhEQ?=
 =?us-ascii?Q?+vE9s64QOoAJMkmvCkHralusEgildP4i9SFsrwG0a9Uo5BnKJHnLgWIkI4Hi?=
 =?us-ascii?Q?7TePGcuZwc8liQ7a8fl1gTdr7mSwwSP3xRwNcGdd97s8KbyhbsXWrEhTLtUr?=
 =?us-ascii?Q?l6DVfDoCQTlJDx1H3mjOug3ATomDarBCUA8BuUgCkghdMfbqeezrz49HNx1E?=
 =?us-ascii?Q?B2sGTOiCb7h7vZAcUvtPmgPzwqCMUcEA6YNOdR9Xn3aD3aLfoBswzXkdgcAZ?=
 =?us-ascii?Q?t03cikj9NiryN6f+Q43U0PmjUU4kDzZHY/5TpJQNOpbi604Qbl9xZoV8JzWb?=
 =?us-ascii?Q?ZT6qvg6/h3B8H6ccGp6jpVA5fDTC1k8xTqmy70sslPXuNMfyItkEi78fLiAU?=
 =?us-ascii?Q?RxyDQDNQwDegXhapdOd3DqgyPnSSjkpBEB9ZzR6VzEqxBUStUXgNbH8wkO8q?=
 =?us-ascii?Q?5wkCnw5IAkA53mgnk2GDax3EPsWhR6ZrFXdS+G6Znb3Tc6uGjcRSVHI6l/Px?=
 =?us-ascii?Q?beqkOxP91Y2BubzM40b9EupofxuTfRiDna2Ok0Mts/XaKPMuC+Ed67gAz9yG?=
 =?us-ascii?Q?YxT7/sYpaWJ59iagcb4B4nQkDp3HWhy9UsYhApyXlepF25hh/edfvUqBUyDp?=
 =?us-ascii?Q?vzWEcLcFkG8b7TZQ5Xz0+0Jiefw1mr2ejbGubDJ1b+V76i8AwFY+tdc4Fx5S?=
 =?us-ascii?Q?PicgRETp1Mpos1CZqOVw5Ee/GYgTJv2Mu4Prybyd8MBFFFGIWGteeGMk+fX2?=
 =?us-ascii?Q?8Cyqux2XypZbB7zFkhTDfzC1gHiP5rOhqn2eFOUHASVTcs+rop9dfHmDqUa5?=
 =?us-ascii?Q?JIPTQ0CX4seTcPbeuuj9HDa0/WVCE8MBdryuLGUswKIMjMumW0kovM1nQFV7?=
 =?us-ascii?Q?D6HEWKj0AdIq+Vq9ccv/zjvtExzYLCkkPFgriwrXNfI5fWsg5FyyHemEpvu5?=
 =?us-ascii?Q?VJoVPQ63V5qnrPFnycdr/jmtd628amOQsxZ+rFe04LN0hL99wK7Elh0jg4TC?=
 =?us-ascii?Q?1B2Cm6QA+f4kTnqlh4mMMoVCmZvvGaTjFrCJisK6M2WReJaxpPlYQWvhKDrW?=
 =?us-ascii?Q?BM08+XgHvuNaOTLEH48+d7jPt9AjF7jDVM8xX2rORD266XYJxHflf0fqX95+?=
 =?us-ascii?Q?AYc16ymtEomcGiHeJSX8XumMY1czqsYyfihkT6EHd7WrX2HSLNcKxo62hESQ?=
 =?us-ascii?Q?MZV7ljCUTZpoRE7zny7cz55sACHasC4LqTH1OeBH9pUEfbtZ9Dp5w2PYpLto?=
 =?us-ascii?Q?sJaHTlcIznpQmadRccMYR7gUmyPx3hX7VxpaPEJ/8lWoBBvlO4hLj/gYWgx8?=
 =?us-ascii?Q?fVjkg7AzQqH/4AvTzDfe9DRvs8UiUHBJ4FuyXGjzB2CzzFlDliNwzUt/Hbk1?=
 =?us-ascii?Q?tzNF40FVrhb2ucJOcD9nJ6lzFxbmSSObCq9nrXhgyS5z2Nn8NaJ0FFmwOUpk?=
 =?us-ascii?Q?QGCstZLTBEpqLR/OpkBKDnxFm4du7Yqh5WfCyL8RERjbpSLsxm9DwgmzsBpP?=
 =?us-ascii?Q?HFmeBKcEcylpceZ5TD93DqhZz10k9c1aqk0uWwdT4mysF1XXxWBUtNs0OuNu?=
 =?us-ascii?Q?8qP6R+8AksINHZqSx2U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:44.7623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4911fd-f188-471f-5ffd-08de0a41c044
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7495

Helper domctl_lock_{acquire,release} is domctl_lock, which HVM_PARAM_IDENT_PT
uses to ensure synchronization and hence being a toolstack-only operation.
So we shall make HVM_PARAM_IDENT_PT conditional upon CONFIG_MGMT_HYPERCALLS,
returning -EOPNOTSUPP when MGMT_HYPERCALLS=n.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 xen/arch/x86/hvm/hvm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e77b0c03ed..e7d630af95 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4281,7 +4281,6 @@ static int hvm_allow_set_param(struct domain *d,
 static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
 {
     struct domain *curr_d = current->domain;
-    struct vcpu *v;
     int rc;
 
     rc = hvm_allow_set_param(d, index, value);
@@ -4307,6 +4306,10 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
             rc = -EINVAL;
         break;
     case HVM_PARAM_IDENT_PT:
+    {
+#ifdef CONFIG_MGMT_HYPERCALLS
+        struct vcpu *v;
+
         /*
          * Only actually required for VT-x lacking unrestricted_guest
          * capabilities.  Short circuit the pause if possible.
@@ -4334,7 +4337,11 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
         domain_unpause(d);
 
         domctl_lock_release();
+#else
+        rc = -EOPNOTSUPP;
+#endif /* CONFIG_MGMT_HYPERCALLS */
         break;
+    }
     case HVM_PARAM_DM_DOMAIN:
         /* The only value this should ever be set to is DOMID_SELF */
         if ( value != DOMID_SELF )
-- 
2.34.1


