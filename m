Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656F1B093A2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 19:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047198.1417657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSmS-0002xw-Lg; Thu, 17 Jul 2025 17:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047198.1417657; Thu, 17 Jul 2025 17:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSmS-0002vK-I0; Thu, 17 Jul 2025 17:52:28 +0000
Received: by outflank-mailman (input) for mailman id 1047198;
 Thu, 17 Jul 2025 17:52:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDmn=Z6=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucSmR-0002fm-KS
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 17:52:27 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2416::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c76fd1a1-6336-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 19:52:18 +0200 (CEST)
Received: from BY5PR13CA0014.namprd13.prod.outlook.com (2603:10b6:a03:180::27)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Thu, 17 Jul
 2025 17:52:14 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::26) by BY5PR13CA0014.outlook.office365.com
 (2603:10b6:a03:180::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.12 via Frontend Transport; Thu,
 17 Jul 2025 17:52:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 17:52:13 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 12:52:10 -0500
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
X-Inumbo-ID: c76fd1a1-6336-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNmUGjYNmsGqNjA9pSbzQPRpBywEQBjr0ZbGy0fftkuJ6c3T5Eg/1TQyK+dhO1L/MAbAoOHKi9W80/gjHBxQzcHD31P8lSVC9Da9LqmpDHyeSyLRBwKvfAXZzTl7xHL6KPs6HYJ4y9SuYockhmBEfy6nFyhnGLdu1oCZgDkU58uM7f2QgokYaivPVQfKqVkrLJNtEY2c+dnr0/LNBhiD8DV+obzijNoNVsaCKq/h6g1bTQFC+Fq252sIod8HCuxaj3k6DcgTExDGLjGZkBxDDOwPNZX6Axx3xwIxfsBNKRaB4f+gqFZTS84fOYuiUuL+zgQnpk4yQTDdPgjCW5CETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K39k6RuvWWJkMEIkdG6HzIGtOxXf/lCeRD5qU5gOaxk=;
 b=R+B2DnLNxtsgu5iBrssf178neKdcRmKyHixpARkA07UvAcRkQA4ftMk5ljvWBRdgDQk2HvVze02BNeu416zs8jr2E5O5QzuFwyfV41uWXjxEbZiB0Yh6saX5KC2PMnHWJ4I4A5SU8DY8hej05hGrwLUlmjH4K92hmtxnszrwMbrK98mYVpaagA6Xyw0Dylc3VvQpDegHJDBAH51Rvsa02RpYVfMouYLbu+x2/HIFk3EpVGisFaJKGV6m8JuZ61ocnTmxLVOyLnxr4gEM+swkvODSg4jnra5HZXZ79romGeW4S1I3D1YRBl78YkZcF9SvB4LXUtRDbafcYlMzWzjj7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K39k6RuvWWJkMEIkdG6HzIGtOxXf/lCeRD5qU5gOaxk=;
 b=bIOP+RMOnok083hE/+BRWpsLN6P4HCNzLBvG7+eYj5O2rVltn/Bn4Aw6crIv4LN+jgvLCo4NyIeI2fXyiyYGWLlEyBsqKACvUIq0wHW3Zv8fODH64RsUSpWw5zcBZUaPHyM+HA1foD6Sh9LsRvIp4YAMEN9WCIkaZPhC72gnXjA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 2/2] x86: generalise vcpu0 creation for a domain
Date: Thu, 17 Jul 2025 19:51:27 +0200
Message-ID: <20250717175128.462996-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717175128.462996-1-alejandro.garciavallejo@amd.com>
References: <20250717175128.462996-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ce3fdc-bd98-494e-a782-08ddc55aa978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iMhYWA1Dt+J7FzMt8R7RjFgSQG+sca6jR+aGAQswKc7u25gf1IdxuUs564j2?=
 =?us-ascii?Q?NnDnvu0AdaWP1lHZGwM7Y4vOsWM4U9msZt1rgbWTmdFGLB3vSaQ1oudfAgbN?=
 =?us-ascii?Q?323B3yv94zty04mDGK3X1nutIWrtVWrjmB+M3Vpv6aHx1mKwzblW/NdeE6wE?=
 =?us-ascii?Q?zreG6MRJwWTzHH792YiU4Z0e60P7sv6yIjL6iiMOuWKtxo0vStQ8+qBrFdnu?=
 =?us-ascii?Q?aE4TL+B614K6K9G5JYV0WGsMqfEieUXlTfOeZFC4iHkuez6fmy3pTqzgTdcg?=
 =?us-ascii?Q?0Q2pgfv+ou1OVlcFk19FPwOTU5maJ617qDARqw6gKSTZ9FPTLFCRF4QtjrCr?=
 =?us-ascii?Q?l9IftCSxt1Sfjrxe1n+0nlczhhiq/STYtvvQmgCfp5bsVtxmZ3ijRq+WZCDt?=
 =?us-ascii?Q?eYHXwWA1DRCvOf9vrij0J6lDK6fhWJMqY8ekJ/xAUvo4oqte8wTOij9olNu0?=
 =?us-ascii?Q?YSynD/R+YLiNsMzVp2iGcrjNT12ACBxPdaIMuIrmU3Axw3Vfe3Z1vVGBXqXp?=
 =?us-ascii?Q?NDv4OIUysDhHkCFSHbosX2GShvScdq+eQ6gJ7+yDlmPjOlJt5JjwxqEeOGpP?=
 =?us-ascii?Q?SsF+xNcBpd4RhqEXXIuAraU8FsYccAms3+3gdvpfZXbN8oQHYVVmlVjTu7gU?=
 =?us-ascii?Q?hPkp9JbaIZMz2o0WV1Qhv+SkuOfEG6xMmbDtO4IyVmo/HoBsVcA3VrZvDkOj?=
 =?us-ascii?Q?3INkLQ/jawAH4ayUEv9NTwUoli4YaTwyj8Bv2K4TmDbrhOyvyIpjIB+Nj/f7?=
 =?us-ascii?Q?HpTXBaWG9u3sNHDK/+UJo8DocLP25MMY+Sz1t1130FbQ7sjzdmhFxykBNfZs?=
 =?us-ascii?Q?EG8IXDoYjXasC3uQulphtz1I37UIEGcXf4FIUa58QfAvHlxDcaoCrtXOqAzD?=
 =?us-ascii?Q?7bOCOSKPqpt6VuHkpgj/W8lEGKSNbmI652ZfXYyqcZOmkzMMBG50xCoRhpF1?=
 =?us-ascii?Q?J8TF04PHJR7i7LzIZWrAN794MDw0aJpuK/czLwY13Vn6VRErS3OCdRyBMmV5?=
 =?us-ascii?Q?o1dDQxh4CKmDHZabn88i2B83okp4bnZFSThN1RfAhupKtjNuTj8c59X2zbga?=
 =?us-ascii?Q?SrhxTaC4Ps/91XDqAALBNGwGxPmB/J55S8T2tkkvJFx3l7zmPddsoZ+1z9Gc?=
 =?us-ascii?Q?UUMG6pfD8pxoZfP2NuHAwaaVuYFslDAwh47bibZDe8RZD69E9CNMD3o8v8lr?=
 =?us-ascii?Q?PtinUp20gw9VnnD8RMla4pBrxUJPU4I7PdE/RedNjtGSLRuL11xAZPLIqdl2?=
 =?us-ascii?Q?y0IdLtyesXlcczNUZ0qF6koo4s050nR3BqCvSS/LF7FHW69pUYiJGGlytpT8?=
 =?us-ascii?Q?36m8Dbn5xjRz6joSaMTzbxjQr+fq41wh9i/3ZTt6/vOqsDF1KG5WY9P1miww?=
 =?us-ascii?Q?ceM7+5O3ae8vaBQ/8NU6r8aRc5dIIjC8SOwfxM6hzEWxREsOtOMMkoMjBUbY?=
 =?us-ascii?Q?4A/fuRdCPt44UUiJcB89md7V05BZt1OmPT78EJJUpHAhS6YP3xJ3EF5BpJ+a?=
 =?us-ascii?Q?y0zcSahDyk5PxfI4p4n0KkVUXc9EUjShNLzj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 17:52:13.6124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ce3fdc-bd98-494e-a782-08ddc55aa978
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442

Make alloc_dom0_vcpu0() viable as a general vcpu0 allocator. Keep
behaviour on any hwdom/ctldom identical to that dom0 used to have, and
make non-dom0 have auto node affinity.

Rename the function to alloc_dom_vcpu0() to reflect this change in
scope, and move the prototype to asm/domain.h from xen/domain.h as it's
only used in x86.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/dom0_build.c             | 12 ++++++++----
 xen/arch/x86/include/asm/dom0_build.h |  5 +++++
 xen/arch/x86/setup.c                  |  6 ++++--
 xen/include/xen/domain.h              |  1 -
 4 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4..dfae7f888f 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -254,12 +254,16 @@ unsigned int __init dom0_max_vcpus(void)
     return max_vcpus;
 }
 
-struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
+struct vcpu *__init alloc_dom_vcpu0(struct domain *d)
 {
-    dom0->node_affinity = dom0_nodes;
-    dom0->auto_node_affinity = !dom0_nr_pxms;
+    d->auto_node_affinity = true;
+    if ( is_hardware_domain(d) || is_control_domain(d) )
+    {
+        d->node_affinity = dom0_nodes;
+        d->auto_node_affinity = !dom0_nr_pxms;
+    }
 
-    return vcpu_create(dom0, 0);
+    return vcpu_create(d, 0);
 }
 
 #ifdef CONFIG_SHADOW_PAGING
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index ff021c24af..46bfd111f2 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -23,6 +23,11 @@ unsigned long dom0_paging_pages(const struct domain *d,
 void dom0_update_physmap(bool compat, unsigned long pfn,
                          unsigned long mfn, unsigned long vphysmap_s);
 
+/* general domain construction */
+
+/* Create the first vCPU of a domain. Sets up node affinity as a side effect */
+struct vcpu *alloc_dom_vcpu0(struct domain *d);
+
 #endif	/* _DOM0_BUILD_H_ */
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c6890669b9..77a8ca60c3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -37,6 +37,7 @@
 #include <asm/bzimage.h>
 #include <asm/cpu-policy.h>
 #include <asm/desc.h>
+#include <asm/dom0_build.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
 #include <asm/genapic.h>
@@ -1054,9 +1055,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
+    bd->d = d;
+
     init_dom0_cpuid_policy(d);
 
-    if ( alloc_dom0_vcpu0(d) == NULL )
+    if ( alloc_dom_vcpu0(d) == NULL )
         panic("Error creating %pdv0\n", d);
 
     cmdline_size = domain_cmdline_size(bi, bd);
@@ -1093,7 +1096,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         bd->cmdline = cmdline;
     }
 
-    bd->d = d;
     if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615..bf1fc6227f 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -24,7 +24,6 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id);
 
 unsigned int dom0_max_vcpus(void);
 int parse_arch_dom0_param(const char *s, const char *e);
-struct vcpu *alloc_dom0_vcpu0(struct domain *dom0);
 
 int vcpu_reset(struct vcpu *v);
 int vcpu_up(struct vcpu *v);
-- 
2.43.0


