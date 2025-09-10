Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72690B50FE5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117741.1463858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFXC-0008R3-Ac; Wed, 10 Sep 2025 07:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117741.1463858; Wed, 10 Sep 2025 07:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFXC-0008Oc-0q; Wed, 10 Sep 2025 07:46:30 +0000
Received: by outflank-mailman (input) for mailman id 1117741;
 Wed, 10 Sep 2025 07:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQw-0005yt-7q
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:40:02 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20629.outbound.protection.outlook.com
 [2a01:111:f403:2408::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58eb3ce0-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:39:57 +0200 (CEST)
Received: from SA1P222CA0037.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::18)
 by SJ5PPF01781787B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::986) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:49 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::8d) by SA1P222CA0037.outlook.office365.com
 (2603:10b6:806:2d0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:48 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:47 -0700
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
X-Inumbo-ID: 58eb3ce0-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jk+GyVe5CV2zvlAw75YQ9sj2jIF/qmqWkKSxL6tXt3I5wjcw4fILKXx92n5Y2NMLAOPfQ1BF4Zywd+oNYXV4IUOmu2a5y5W4rxZ999tSkOqSJD/YAUm5ztPft6j9QFiQwQuq/eObybmlEX1UqUHTUb0r78tJsO+/WOVXAbnJZ8IOgAunol5Oiu8HQ56DhtfcgCnuj4RfM2nW3zKjQxCf1z1Cw1H+7CaA2aw3k6VBxZNDB+BQmhM1Y2vdm7NOP4xqlUHgbkdsvbjjyqr8rhl7SY8tvvjP8cF9qzkxzU8Da3ij82Rjc+T53ZRiLVO/rPhnpSj8bvfYgXzVUQRs8EsSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtXIKsaoo6fvEkspM37p5TMDLQUd1SnKg2qpc54XTls=;
 b=RSALfKEfzfT4e0SZMThSybXWSBtQcLMdoUk6HQiuLxPii1cwPOvyNljmqquNVwf7abN/4lQjhcawWEOKoXNCnUwXaKdM4nAbfC73/lNs1BljdtN9I7sceFJ+9Vh3Iqvc4l+mHN0vTUJ6o69ESxiiUD8HtP1RxwReR0W8f1pepcbaKZ+hIgV0xygnyCdQKSzfqKLbkEicaVa9Q4+wkldPfp3y+zM3SCzHqrZuqNjPEPL/Ih7o9/UD/RxS7Entk24z8nUfO+/z840Ahu60WGK81RCQcjPbrLtWklShkXc3iUlfIMg+zVY9ATYwo4FQalCAfd/Iu8ivxMzf8pNoe6Y6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtXIKsaoo6fvEkspM37p5TMDLQUd1SnKg2qpc54XTls=;
 b=QhLBv6JqYKJCMCoCEHkhS3GDU6YczdmQTcVAadYSbauCBGKdUkMp6p9NvPCZXZPs6AqXLi9nJPShJy+em2Pz6w/uZqsIyTOqNy6yzVPP8decrfQej6bYbrUBwOVGwSC6lLHafT36Sq9oOgUVsudAau/1q8sZLuk+h5zJ2R0emSQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:19 +0800
Message-ID: <20250910073827.3622177-19-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e943df5-406f-4760-a8aa-08ddf03d388d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9jZHMu8Ju168MCTHwrbORcohN5rYy2Iv+ZnZC6Rj1NWCc8UCM0Qua1GjjdCf?=
 =?us-ascii?Q?L9qQuLpfJHvYBXiX9SXFcWWk4498Lu1zEGzs9pOu0apuGF2WqOzOuKbhP61a?=
 =?us-ascii?Q?53sGo2vZFzQupgW56Qk7EYsXzI4wROZyjb2mZAPZq11+eqzGiqNt+kCXz7ep?=
 =?us-ascii?Q?Dv3dh1wTWcsV4g/l9UB4pup6BGjfKLf4v25w7FySupZgDC2Y8Cg2G4113ltk?=
 =?us-ascii?Q?t7PUgo0RW1psbkPu0Q2iBdPoe4uuFP/tdGKoZC/fMF2drFlZW0YSHvd1g0XA?=
 =?us-ascii?Q?oYbSWalIRYCQ2myF1dL6wvePysC5gyIoWOJBdYL9pU+Re/JllEYb5weHnOaq?=
 =?us-ascii?Q?3vgSopUrjCNZBEt1QyEbUdiVUE09tysAMKMXwGdM2hv2zdzmz83Oj0A6GG/L?=
 =?us-ascii?Q?zFhw1jb0Gc0wOvgG0PYCV1scuKF32XreGk2rVMRVQvIutn63oaC2mD96bQ2K?=
 =?us-ascii?Q?tmlRedzY9fiWl4EfRVorobPLRfAdF+BhJLnWBMLbS2TLUrWdO6QjEXeMtDma?=
 =?us-ascii?Q?NHpM1l9Quk0kio0Qdshdr1U3AHg8jcoZGuFaJ/nwQn7j91pm9n5R1kEiSAx6?=
 =?us-ascii?Q?B6jsUq+/ehJQ5iWGN3j/5z3MD3lB98tJabbkiZZ/E35r4kpgFQbL1CFK9LjN?=
 =?us-ascii?Q?bySHT7mN+cSpiVlIgkpNJYvh8FWAvRMKjCtrmHKuR7zyuSarxtogm367fRel?=
 =?us-ascii?Q?/8QBp9lzAC2vp/AUFSODqAa9MIm6w1nnAthQdrdTtBFTG/LWmgLiGHFw6kn+?=
 =?us-ascii?Q?i9NCdW1zP3lcy51cxKrHfDOAEUo0qdJR1sf+No/VJG3ogNWCSz+vCoIvSi2P?=
 =?us-ascii?Q?L8D53ryNJ+Ip+1zw44sJ0JL/bz3gI1/zbl3sdUd9br87eol2Dad7p3/q3S9z?=
 =?us-ascii?Q?SGNWrE2xM8d3ZvXQhWccw0NjoLqF5Fuu2G9/1P7N4tUa05nxXryvOnA9r6O4?=
 =?us-ascii?Q?jAcmnaDp4Z20EDeHvfNalHEdF1mDj54lnID8mH4bQoVofgV5UQJsaLhXZBw9?=
 =?us-ascii?Q?InwgXdnbvLVGBT5ksA65um9+8ODqFmDugDPuJnuJjkQYCHr+7wfBd7ZbFMre?=
 =?us-ascii?Q?6wAnMJavOqb1C1NliuiBx8E+9WDbca+T6pP+k1+0PmgeSIjgZ8sY/0kxHSEK?=
 =?us-ascii?Q?zg9f8hiR3kGxvnBLfAPzClN8D0KJmzs8HkZ8zIaY8TWOcEwg145fy6edqnYP?=
 =?us-ascii?Q?/8MCXQAzmovFpl0Zt/BODjel8+sij+e24g7rCv5SJnsheXTg3B4eoXBhSWvg?=
 =?us-ascii?Q?ZjWWSEn9wkC8kIW5L1USNMysNNHCOxX/IHrvXVM+P5A4Tx2OjNf1qmIlmK3W?=
 =?us-ascii?Q?iapgqY5IvHd2q4tuMCcfBc4E+H36hbGyThXdcai6JNKFvrVvGODk2DGZV8mf?=
 =?us-ascii?Q?77QwjhOYyXjJhCy9fDK/NXGbJBibjEngrwvTuEGE8yZCwWYhCCuxS5HUqJPe?=
 =?us-ascii?Q?/+85whZryOCeZnI1D8M64rasVORhufA0vShR1W692TpGy537kq7j37UvgiUq?=
 =?us-ascii?Q?JCrFiVNxvtvP28nTWG7+5fkCnL2lHQdz7eIR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:48.8238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e943df5-406f-4760-a8aa-08ddf03d388d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B

Function xsm_getdomaininfo() is only invoked in XEN_DOMCTL_getdomaininfo
domctl-op, and it shall be wrapped with CONFIG_MGMT_HYPERCALLS

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
 xen/include/xsm/xsm.h | 6 +++++-
 xen/xsm/dummy.c       | 2 +-
 xen/xsm/flask/hooks.c | 4 ++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 678cb0f346..2a107b2cde 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -55,8 +55,8 @@ struct xsm_ops {
     void (*security_domaininfo)(struct domain *d,
                                 struct xen_domctl_getdomaininfo *info);
     int (*domain_create)(struct domain *d, uint32_t ssidref);
-    int (*getdomaininfo)(struct domain *d);
 #ifdef CONFIG_MGMT_HYPERCALLS
+    int (*getdomaininfo)(struct domain *d);
     int (*domctl_scheduler_op)(struct domain *d, int op);
     int (*sysctl_scheduler_op)(int op);
     int (*set_target)(struct domain *d, struct domain *e);
@@ -234,7 +234,11 @@ static inline int xsm_domain_create(
 
 static inline int xsm_getdomaininfo(xsm_default_t def, struct domain *d)
 {
+#ifdef CONFIG_MGMT_HYPERCALLS
     return alternative_call(xsm_ops.getdomaininfo, d);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index f6986dd2bb..7c4e6176aa 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -17,8 +17,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .set_system_active             = xsm_set_system_active,
     .security_domaininfo           = xsm_security_domaininfo,
     .domain_create                 = xsm_domain_create,
-    .getdomaininfo                 = xsm_getdomaininfo,
 #ifdef CONFIG_MGMT_HYPERCALLS
+    .getdomaininfo                 = xsm_getdomaininfo,
     .domctl_scheduler_op           = xsm_domctl_scheduler_op,
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
     .set_target                    = xsm_set_target,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index ed4e466302..7392e95e55 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -604,12 +604,12 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_getdomaininfo(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__GETDOMAININFO);
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
 {
     switch ( op )
@@ -1889,8 +1889,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .set_system_active = flask_set_system_active,
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
-    .getdomaininfo = flask_getdomaininfo,
 #ifdef CONFIG_MGMT_HYPERCALLS
+    .getdomaininfo = flask_getdomaininfo,
     .domctl_scheduler_op = flask_domctl_scheduler_op,
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
     .set_target = flask_set_target,
-- 
2.34.1


