Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51ACB7D46
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184930.1507274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuR5-0003VH-8O; Fri, 12 Dec 2025 04:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184930.1507274; Fri, 12 Dec 2025 04:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuR5-0003Sn-48; Fri, 12 Dec 2025 04:07:19 +0000
Received: by outflank-mailman (input) for mailman id 1184930;
 Fri, 12 Dec 2025 04:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQv-0007Dl-HN
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:09 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0694f9dc-d710-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:07:08 +0100 (CET)
Received: from BL6PEPF00013E03.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:1b) by DS0PR12MB7581.namprd12.prod.outlook.com
 (2603:10b6:8:13d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 04:07:05 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2a01:111:f403:f901::7) by BL6PEPF00013E03.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Fri,
 12 Dec 2025 04:07:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:07:04 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:07:00 -0600
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
X-Inumbo-ID: 0694f9dc-d710-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ+qB7M/0kWyDnqtMp+52AMOynrx+ou5I1Zrye/gf3TSsbMZxigs5fz9koZ0zHFZo3Bq7X03OjSOLAbF/9eVNtvyI3u3vwBbGyarFOZxZtR210i0HoLZWnDRnALl07qWI4c0RosbtVIFnbNrGQgC91zt1Sb2LR4w7aX4OQg86V+G+E5NImj9lrZPamNN0CnE9aEB/bH6rsZs45IPaZBthhMwxwQqxGPERfiO9Hh2T963+5ICZ8Lrv5BuAYGWfNja1A5B78HgDn0FWigwmGU1BnnjGcZ8fEUXhhWrH73TvRA+XV/NJH/xP1ftsKY1YttL+PT1RWHqCJdviXK3yWy0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaFTmwwa+bCWw5fIRu939ZdZxVXEUY/bAtUkbevuahw=;
 b=wtHiJYXoADm4R7IdCDEJYLlTmYiw2xUAMcRhVJ9DBLDwO2/AS+lXO2rzIpQmk4a/iITXzsJLuyHoMoF2WLikBzTSZhfdtjZJpyX9Wijw31baYwWis+FK4K4kx6HsRIWGfLKdnFUcIJvGvKH0Jb24MH4Tt/RiujWkXsu8hqn40Y5CgteBs4LTlvyr/OB/RqcZZKQdWUDWhMJD+eqRsrMUp43KYcJcGKD4GnEvH56PbgbHSjumuPMr7IXAZcPZzMnDV+gQPTFdjbyeaEEVSaPwUPMxZUwD31TeZR+vn9FTX90O2IMgzg0Rpw1y1C7UOPNbCKvjQIE6EoYL8uG/ihF0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaFTmwwa+bCWw5fIRu939ZdZxVXEUY/bAtUkbevuahw=;
 b=4jHXxCbanqOsIC7IqIEYm/3iayFMDKZDB0WfdhFF0RnQsg3RJoK1pUgkDqexMNlnRBqjMQVlncRPHdxbyXsXysjUHwtajzKpTTXCVf1N4zx3RaI08uLY2twz6B5tOwMVzyGLeUwCh8JbYxRrx911HxRBaOyA50BBO82lwbb90PE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v5 14/24] xen/domctl: wrap xsm_set_target() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:01:59 +0800
Message-ID: <20251212040209.1970553-15-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ab0564-45bc-4511-0d69-08de3933e90d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iiNG/nOgPcMeRolsMbGR+XbiDHx/ywyWcVxO4YBwi+hHf/0AEXyiEvDxA/l8?=
 =?us-ascii?Q?g42hb0UPIkvcjFnprJetbFj5QJCl9nCK8x9k4Ygn0sUCIjCUn0whCZM4Jn0x?=
 =?us-ascii?Q?w8zoMfTNoMpRCZ2XJvvr+K52sZ4vkg9ebl0QJZAhyGpqLcJpn5XiqoUcPXss?=
 =?us-ascii?Q?j3OfN01Wc8xriCk6C+ja03UTCd8UNl4NZif+CfPvFkka0vSVK41T1aUum7Nv?=
 =?us-ascii?Q?3SHB4c107khKBukiewkG8ltWs5yt0irNGSSsixr7bSur+Ipl2/IIpPoAXUcv?=
 =?us-ascii?Q?tYwSY3EX9jAvV1AgPIp1UU8Z7KbAyTmtbrRzG/wO2Sk5UDStRCQAFF1Z88ia?=
 =?us-ascii?Q?a+ECMbLPrEiIG8t69d8Jbf4RdNFwBwsgz/g/b192zAedcFS78qpjFv2208+L?=
 =?us-ascii?Q?Pmn3y8FPdlmLoOt/PuMnBmzNu+1MAnAabKqZla3FD7pIzcusYM4FIt5aNLoj?=
 =?us-ascii?Q?OI+MolcZYB5FpKnP8ttRtLLTm7ZOOB55J8zg8dgYEY/s4fMLCc8VInBW3j4+?=
 =?us-ascii?Q?s2gdmE/gqYjb8FTMBFrUq5j7+k265czLo7te9S/n/3NRRzdDuXziCPxx+kj8?=
 =?us-ascii?Q?Byd7mCmPj6kCaBQvPyz/frESWohOasf3xS2/wpo8t3NxqKfzDBRKCaeHGmkg?=
 =?us-ascii?Q?1pUxyyYnvTI8DWZlE7zwjgpvj/eE18o+8AWqq3ZeKhlmdMmUXSH0AhhJoRc5?=
 =?us-ascii?Q?XbtJgsOT9kThPTU1miuoSdJxmgXs2SOCkqA7JdguSysa8PJyK4ZSwLVnLwjJ?=
 =?us-ascii?Q?D12kRFOiYT8w43pVovgOnpiphEnnSdA+GfN8AargJYVY4PONFH2lmhneqYhg?=
 =?us-ascii?Q?CnnlhyRmn5dEUWl60+zkyMkEybN0JmiZEDtxwGQSz9LyFndqGx4zfP3dTh/U?=
 =?us-ascii?Q?nNA2aRjaxj7I4NAJILEyz+e0CpD5R6muh3N8oe3Ma7l6nZeNHRVGfMgwljd9?=
 =?us-ascii?Q?90KvITKCs/pycLMg1xRXcmoiRGtC82Fsogsfi5J5JQFXO2aAO8TydvGJwayO?=
 =?us-ascii?Q?MoQslAxQ/Dl4iTyQcWP2B/1un6Dgv/Sv3AGQ9FKWsZDeAj3TrZFj6i0t8aTg?=
 =?us-ascii?Q?N3CLNz+iOUfrImFMMWFOsfyT4R8KauQc/9vIed7keATpPvniH3T5S4KgjIiv?=
 =?us-ascii?Q?bA3jQVjWii/9p0/ttql4VO8VSiVUrbY0k/ZBo79Oe9lqETkk69Cl0vZzP8TM?=
 =?us-ascii?Q?Sj1Dvx1goA7ljGwNEpfi7JeSleYi2CT/E+Z1GOdzCRmmoUvfn+fr3SIdas0H?=
 =?us-ascii?Q?rjxwnbthh/HGulEsPTNvTpP8C28RlLFU+SKAet3jSS2hnym5I0P7sl6HQVu/?=
 =?us-ascii?Q?neYcWZez6P+UOuIDC0PCKANvzvYcAEjzgD/1L+556smsjr+dP34nJCXU0++S?=
 =?us-ascii?Q?rT+TiOobtD6yz5ihBzBr3qtK+CFRVvGMfgliu9jJ9VPGmFSQPVuV34QsIYfz?=
 =?us-ascii?Q?UQz9Mte5T7MG3UPbdDm4+nTf3au4lgEiXzTbCg6CIpMuzIQLyDhwzUEArMq5?=
 =?us-ascii?Q?FGa5rMM4kh43Q0hWz1vzOdSlGsoPXIg+UpAMW+Lwx8TolncgWSJp31vVVDMz?=
 =?us-ascii?Q?0QtSayxMxkX91/fk3DQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:07:04.8831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ab0564-45bc-4511-0d69-08de3933e90d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581

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
index 535de82f62..92291ac9e5 100644
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
index 786cfd7ac4..b76eb22429 100644
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
@@ -257,11 +257,13 @@ static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
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
index b216894579..f6986dd2bb 100644
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
index d480009142..9c1298697c 100644
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


