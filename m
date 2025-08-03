Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D5AB19352
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068406.1432478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMg-0004oh-Sr; Sun, 03 Aug 2025 09:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068406.1432478; Sun, 03 Aug 2025 09:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMg-0004l4-F7; Sun, 03 Aug 2025 09:50:50 +0000
Received: by outflank-mailman (input) for mailman id 1068406;
 Sun, 03 Aug 2025 09:50:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKt-0005K3-23
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:59 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2414::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 132a664d-704f-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:58 +0200 (CEST)
Received: from MW4P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::33)
 by DM6PR12MB4450.namprd12.prod.outlook.com (2603:10b6:5:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.19; Sun, 3 Aug
 2025 09:48:50 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::d1) by MW4P222CA0028.outlook.office365.com
 (2603:10b6:303:114::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Sun,
 3 Aug 2025 09:48:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:49 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:46 -0500
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
X-Inumbo-ID: 132a664d-704f-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJCCcFQKtd/M/hJJOBghEGzWqpyMhumLwgPSb8bOiQqNBCf956s/B9msExdCfTmiDNCHmRplEx2YjOmtnp1rxv9+8BYtRKQnjb550NXhDSOXjkkTFEjO1aLIA++yQx9iXsmmhK954RbbNneuKd+JtYnp2dRBxU7IuRvqmDUjFQ9ZFMZ2KvnBSH2YvkMcdX4CP5RcccYJiCxzYQuNYHVrURBEa4BgkL1j98cIwo/sdC2Yl9l5lVOj+qMyAv56OfKfYklgkQROSAKKE6f5Td8M8NJQlum3j5JzYTQ9DSVhjvCMGb2C5JKB/FVAkOlezD6NSZXS+ogPi7JmVeNgdP2TgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+h9q/PP5jXzGM6xOoOoRa7u5M0CRIcPBia1p5+URbJg=;
 b=yi4WVS/GYmwmQNBViuG0HGPCmVfhgQmk8pdq1JjReF+GVPUceU/4HdWmxPP91d6WqfacCVOgk0oSPN2oncPwdSb161BHXFlNoL90s+pgi9Wg9gQZwWqgLpd7eAVEILNOJS1MJd+/PyT5TKeHi1mX893MCROTcMqVN6LItdmqh+fIQ8FElODxBPbLLrNeCASUpUWGQl4lAmc17pRODfPRVK+Oj6xpWU9op5JBdlYxr6GUtrjQimR+kqdYoz6ND+9NEqYEVWv1v0hkX2fqY3YcwgDeJJSzrMTMfLd44LqkpE0ppiNlzlc43UTeo/uERR8EsEf9ZbA4nPeM66tkC+8rWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h9q/PP5jXzGM6xOoOoRa7u5M0CRIcPBia1p5+URbJg=;
 b=5j7NdK7wf1te6WduJC2jw/jhtfMkWjHSdB4KJjuviE5T4FhMLRK/YBptyIoPybeZqk7+rs5Dd/QQXMGMiGyBdAtd4Otn4OWoONmCPzxlDqEqg/7rTrS1d5dOFwvEMi3UIs8KsDcJXOV0o73gCxs06w5iLs0HLjynI8RDdWqbDsw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v1 17/25] xen: add stub for XEN_DOMCTL_getdomaininfo
Date: Sun, 3 Aug 2025 17:47:30 +0800
Message-ID: <20250803094738.3625269-18-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|DM6PR12MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f44547e-348b-4287-c7b3-08ddd272f2e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hH3cN1bSLziJoOeZlSoapnFhBCJAAfYoBmsa75u+PvFVvPIwWfHwWrY0Fx6a?=
 =?us-ascii?Q?0Gt3+cjJrLgUKo6PzGKuwOoT0vv1+lXvWLc22vDenJY0wWryV4Sa8+PHZzZT?=
 =?us-ascii?Q?m+XvEf42FB/u2sV6lQ90asbNHu3YKHVb2R1jtqb3wmUgZPK+URRu52S32Cpg?=
 =?us-ascii?Q?SmLK8iYHQf1nelhQJaAC68QqrnvHvQ9/gj+yz+EsmhIUGXQfS1okIHTwjjxi?=
 =?us-ascii?Q?64+fhf1gjdtmPgsgu4z0jbpbk0N+Fd5l5csAg2EhgcOnifX0DTrJp5PqQxTM?=
 =?us-ascii?Q?St9IscFq9TEjR/sj8vmdSJCzkJcxF26ntV2q8aSSmaBhu/d17NppclvMO9Gl?=
 =?us-ascii?Q?AiYa4h78GRu4LHcSbKb24kSsfK6db7tHksgfmIeihrSNtcnpk4T1BZgk36X9?=
 =?us-ascii?Q?YHbevkd2fsZ4KlglRJhcjraxExJoyP7PYu1cQGexP7PHJza/RzFw6O8op4Xk?=
 =?us-ascii?Q?t2nuAY/PosjH5Loi1RgjJld/avD2TVMhnNEtWZ4UpS7nMXXAmZ76LOLGHbGP?=
 =?us-ascii?Q?tJ3mOPDjTOiUAsKPuWsCdEecx3MqzaIJvsFm1TeHCxktfqAhwJ7OmwimK8NU?=
 =?us-ascii?Q?3iBvwc2/WF8mhgnTJ3tqf+jpYW05X/MVP5ff+R9ffR3Hh1iBd1boybZ8RrzS?=
 =?us-ascii?Q?BXQj3mKPpD1bRTA5xkiGfWMlnw1giHDn99fI8O17yDAo8w1LUtdbT2H2TUxT?=
 =?us-ascii?Q?L5mzK+nlRyHtVcctwdGOGHW9nOQLEsi1vvQzWPn63MKFRPj5cgl4ximP6Iwe?=
 =?us-ascii?Q?s4aG6GDNAw11qf8/JjUZ+vGwC5K85Tf0P5TgJH4XCCiH6zFuiBjbew/6ERez?=
 =?us-ascii?Q?2JjEzsQKRGF/w0Oquhjl+dmQpJm2NiMfBh7miCozwv5rmvb4oHQL8lD5fOnS?=
 =?us-ascii?Q?9tGpUFlgRdoV6MlO4BjQBf22wBcqk7sl0SlYN5/IL/FPkUuSxfL2nprTOgmL?=
 =?us-ascii?Q?UajJcdl0dUX3A4UejA6D5tRtP4/zjj7cr+BdoL8g27rt1jAmvvaZa187zu8T?=
 =?us-ascii?Q?NoTDQbkMEus0yw2HokfDU4gq4/AlmFztxK939tKiUeYwWXIL45qmy9QGrK6V?=
 =?us-ascii?Q?x5BbS8LkABPQm6iXLbBe5YKNKf4LISNlX1jRpmtW/vWcyo/U3Imc8g1TnVcC?=
 =?us-ascii?Q?iuX4chB1dk8a1eQe4V1HWNHKIplI+UQteRUpinz/kRYCbaBiB7hS2Lwjto3f?=
 =?us-ascii?Q?jeIkLpyi9SA1kRzC6uspxhIPlmuifnaQci1aYWrvIBCWOSCf/JKUcKRky3w/?=
 =?us-ascii?Q?gF3mZBIv7IAdlKi2Ts8Nh/SwQLUxV/XkVbGCErkLZvRvJ2ZAXnyUJxAS11me?=
 =?us-ascii?Q?/muW+O3rWJyJQks0lGYs8suJkXD9jTxO9LiarGx9d/arxTxtvyCsFWLuNH82?=
 =?us-ascii?Q?I7nE4UeIXOY+799lWyUNsJ2sk5ENU8nXTu4fY96RO4udcbLMdIwDVmh4lQqZ?=
 =?us-ascii?Q?sK5yOuXurK/g1iqPv5gaXcvF9Prtfm98P+eV0vC/d1JU2KFlb0RooSGj8Aql?=
 =?us-ascii?Q?mbKnkLyGzqwgZZbH1r/lQzNHyfNPSNzwO1Ls?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:49.8566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f44547e-348b-4287-c7b3-08ddd272f2e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4450

Function getdomaininfo() is designed for XEN_DOMCTL_getdomaininfo domctl-op
to get per-domain info in userspace, so it shall be guarded with CONFIG_DOMCTL.
We need to provide stub for getdomaininfo(), as it still could be invoked
by XEN_SYSCTL_getdomaininfolist sysctl-op when CONFIG_DOMCTL=n.
The same logic goes for xsm_getdomaininfo() too.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/include/xen/domain.h | 5 +++++
 xen/include/xsm/xsm.h    | 6 +++++-
 xen/xsm/dummy.c          | 2 +-
 xen/xsm/flask/hooks.c    | 4 ++--
 4 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index b45ac91760..55befdb256 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -31,8 +31,13 @@ int vcpu_up(struct vcpu *v);
 
 void setup_system_domains(void);
 
+#ifdef CONFIG_DOMCTL
 struct xen_domctl_getdomaininfo;
 void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info);
+#else
+static inline void getdomaininfo(struct domain *d,
+                                 struct xen_domctl_getdomaininfo *info) {}
+#endif /* CONFIG_DOMCTL */
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info);
 
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 55f8d0903e..db98496869 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -55,8 +55,8 @@ struct xsm_ops {
     void (*security_domaininfo)(struct domain *d,
                                 struct xen_domctl_getdomaininfo *info);
     int (*domain_create)(struct domain *d, uint32_t ssidref);
-    int (*getdomaininfo)(struct domain *d);
 #ifdef CONFIG_DOMCTL
+    int (*getdomaininfo)(struct domain *d);
     int (*domctl_scheduler_op)(struct domain *d, int op);
 #endif
 #ifdef CONFIG_SYSCTL
@@ -240,7 +240,11 @@ static inline int xsm_domain_create(
 
 static inline int xsm_getdomaininfo(xsm_default_t def, struct domain *d)
 {
+#ifdef CONFIG_DOMCTL
     return alternative_call(xsm_ops.getdomaininfo, d);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index cd5358dd1e..b7eb061e9b 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -17,8 +17,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .set_system_active             = xsm_set_system_active,
     .security_domaininfo           = xsm_security_domaininfo,
     .domain_create                 = xsm_domain_create,
-    .getdomaininfo                 = xsm_getdomaininfo,
 #ifdef CONFIG_DOMCTL
+    .getdomaininfo                 = xsm_getdomaininfo,
     .domctl_scheduler_op           = xsm_domctl_scheduler_op,
 #endif
 #ifdef CONFIG_SYSCTL
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 2975d2906f..9f829aa53b 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -604,12 +604,12 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
     return rc;
 }
 
+#ifdef CONFIG_DOMCTL
 static int cf_check flask_getdomaininfo(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__GETDOMAININFO);
 }
 
-#ifdef CONFIG_DOMCTL
 static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
 {
     switch ( op )
@@ -1895,8 +1895,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .set_system_active = flask_set_system_active,
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
-    .getdomaininfo = flask_getdomaininfo,
 #ifdef CONFIG_DOMCTL
+    .getdomaininfo = flask_getdomaininfo,
     .domctl_scheduler_op = flask_domctl_scheduler_op,
 #endif
 #ifdef CONFIG_SYSCTL
-- 
2.34.1


