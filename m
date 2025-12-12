Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A91CCB7D9B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185120.1507396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuew-0005Yc-Ni; Fri, 12 Dec 2025 04:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185120.1507396; Fri, 12 Dec 2025 04:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuew-0005VN-J9; Fri, 12 Dec 2025 04:21:38 +0000
Received: by outflank-mailman (input) for mailman id 1185120;
 Fri, 12 Dec 2025 04:21:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuRM-0007SS-1B
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:36 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 131bd19d-d710-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:07:29 +0100 (CET)
Received: from MN2PR13CA0032.namprd13.prod.outlook.com (2603:10b6:208:160::45)
 by DS0PR12MB9273.namprd12.prod.outlook.com (2603:10b6:8:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 04:07:26 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:160:cafe::23) by MN2PR13CA0032.outlook.office365.com
 (2603:10b6:208:160::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Fri,
 12 Dec 2025 04:07:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:07:25 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:07:23 -0600
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
X-Inumbo-ID: 131bd19d-d710-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcMTWT6ISmCZi5Ug52edbR8PVxaoQG+2zw9cYTzyHjR8veFPvJy5MpRRVM0iPhdwPfeECrvf0R6eKrYWsvZOEPMtfc7eryWH1gvcJvz5gQKX+KVEn+bsMBuopalbSsRG25QPB/a9WC3G5JD1v35n8n9Xucf/yH9tFTZJePXquHf12RGhCEGqTX6aY3RnjKMXEIO4HJnC801JismKvTwv/ardH1t14o2cZ7On/1AKBIOoEfNx9XQhdaU/cfYgYHM+IcOaW3BUBj8j7GcTcsVF1LFEsBo3TOKbPo26qg6sZAW0XsZ/ORmkzM5unUptJiogzHAsinqEDHncH95Fvz/GtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odExyTV3fsgU5LF6NYJiZ8Pw/V9R8W68o6yrCIsvmNc=;
 b=waBsqy8Ct1czB8sbu2zV1pV/bxd3D7qYm0BRiVQFqmnbdJWDSMilQXUBdcplaSrhCdU3l9ts8JflBY3G0PeZ7g0cYM34DhctBXFaNG+wqV7/wmAzjFnoPqniodTJqQPtjDbIsoFJ68V2qcFrfe32zgDfwwxhr7/xBpEsCur1YEsPtB0aqunW6kgD2PWQFQr1GS1cvtDpWyrpsJPhZ9AaAh/1Uc5PlLB68tbcKW1xvzfG2+NbV8G4+4VkMezZ+uT53xalNQSqBBvbs6BWYCeNcR82lsNlx+xFNKDfo2EQyfavRNWGGbgZiPa8YWk0/lTOGavnt0WPdFf91rLzfPVN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odExyTV3fsgU5LF6NYJiZ8Pw/V9R8W68o6yrCIsvmNc=;
 b=pNS9YKdLcdiKV8qJ1RCDB00lPol9sS04W6aJGYSyKBua/Q5MgziXsQiXAexcWSYfPyRPykB3sfPI5pW7gq4AmVwBq4kfa2wos6YFOxadDzjPOGg7y8a+TX0/zXYaseiVbkIqLlGPhChjcLXrc2ZyAKd2zZ3fhwP0HARL32Db3j8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v5 23/24] xen/domctl: wrap common/domctl.c with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:02:08 +0800
Message-ID: <20251212040209.1970553-24-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|DS0PR12MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: a286bc90-480c-411f-d09c-08de3933f599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P4Ttmj+kvtCIrhUAdK4KFavOuDhm5MTMUzmBFdhIr0/t8mSuENMtaVacmNMV?=
 =?us-ascii?Q?DWhLN3yrwzP03DmNwuoNDFckHA/qOO7BKXTLpBJ8ydVk3jysK6lD4namwDPt?=
 =?us-ascii?Q?u3vk8UwjcQTROGFitkawFPtZFSOyAxOn7Fe0MMLtJchNIAVhQ5aQkbFwOqaI?=
 =?us-ascii?Q?fuYijCbhzgIBO0Mi6wJqFahX+7j8cpgGPmxvso4YTBe+AA8glmMIkfA82rV4?=
 =?us-ascii?Q?ULs+yOBrgFcgDGZCJSMs/iSOEbmZ0Wej2NBx1djET0Z0Y1p4yTGQHXAv13MY?=
 =?us-ascii?Q?0DU5uScu4c0IAVjIy91rVBYXkp3cOggz0eKGL2DoVlYQIc/azIaJObLnAuuY?=
 =?us-ascii?Q?VZsAx3Tos01PSYQNqmgW9zz1xGu7tKf86aN9i14mrIW6Uv3AmB0s4CmsjtCH?=
 =?us-ascii?Q?vil5S90Q/hk2BQz4t8R3TtywVQSSjMBxH4Jn4+EH+hF9BEjHSbzWHWmQaYCG?=
 =?us-ascii?Q?dhaPE0fTgCM/ek6J+iokCE+B7X8CJBIc1EbFQRtidYJVBHxw/ZHkTg+cYaUv?=
 =?us-ascii?Q?t8Hfc4htJb1khJs4zvLPZQWobq15mLBZ24jleEpFkX/gGpzkOuUGrsgjStEL?=
 =?us-ascii?Q?5NDkuJvHJT9JFKVHB1uTbU7Zz+iG+HbYkrbb+4zKWkn2ZTG7QUpvpTZczPiW?=
 =?us-ascii?Q?NuhXl74dFc4uOsnvH06DEgwbRotKgAWOs9NMgYtLy45sulycbfZhQHXfGZhG?=
 =?us-ascii?Q?rQrxQI5S1pSNWtON64fd83dy/zqEFT/4/ePAbHBhjXxrfoQE5xMKoyyIQbdz?=
 =?us-ascii?Q?wljDAO3CRAqp79Y71halTQsRLLBbxa919wMSouuz0zo24GWDwyhGvm/zw4Ng?=
 =?us-ascii?Q?Naa03izfoVmk+xdoXUY6SxkY27iKxEeictdQ48VrwAl/T7Z+1oFOI+Wn4wTe?=
 =?us-ascii?Q?O7uwgiMPkUNM5FA6sc4nptijBXmoSNh8h4qohOSo1U0s216u9dr+fYLbaeRx?=
 =?us-ascii?Q?2Rw/SN2DDxBDg0lhqvRcHTKoCAII7yo+H9P6MPxnMicL/Zy+apIU8d5TSasf?=
 =?us-ascii?Q?ykrEEIU3lqJY4lPIasroZ/pYsp8fLjX/o1P5gBs9fkP7l7zh5B0zQJzMxtOB?=
 =?us-ascii?Q?zNZgTj1wl0pW7mgCTxSDBy8u0PKlYSXUHLYKL1bPjTf6Sa/CWLlqtMEDApP+?=
 =?us-ascii?Q?u+WUBP6MYtI+b0GowqqPqDD9TSTO8xTb+BY6j+A1roy9k1c6fyFuOp8YPZMP?=
 =?us-ascii?Q?tPgh/AbWNvJOb/QUP6EYjQMXaL3EoYl6GZqUkuXQ80iecaEWV2naLWFCPjV+?=
 =?us-ascii?Q?0Nroj2qPQfHx2tU25SWHtOqzGtSw+DtBCQKMIaHB0909ue9XSoeko7ucnCtd?=
 =?us-ascii?Q?qzEIbkB0VbQXQrhhUfYiurn3uJFQUDZTnmPQimT3B8blCJ9JcooHIu64c048?=
 =?us-ascii?Q?a1Gh4ynsz/Y0n73XbWur3iS6EjR5eT9jYbSnhQhxJbuUMtlHdTPg1qGQIIkI?=
 =?us-ascii?Q?TbJAH2ELrHq5bmUqF7DBq5Q65LZJqKjr/DDWLgXR5nrmodR3LM5Krp82maz1?=
 =?us-ascii?Q?Qi5f+USm+a3YCsDZCl6jzt2Ug5mVnGKcLdbAGrw97RkBQElerakpKolHWUYZ?=
 =?us-ascii?Q?pEVgh9ROzVWpzho2QGw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:07:25.9387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a286bc90-480c-411f-d09c-08de3933f599
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9273

Wrap domctl hypercall def and domctl.o with CONFIG_MGMT_HYPERCALLS.
Make CONFIG_MGMT_HYPERCALLS optional and expand help message

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove stub in common/domctl.c
- combine the original commit of "xen/domctl: provide stub for
 domctl_lock_{acquire,release}"
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
v2 -> v3:
- add pitfall warnning in Kconfig help
---
v3 -> v4:
- refine help message
---
- change to "say Y" to keep consistent
- add back default y
---
 xen/common/Kconfig           | 16 ++++++++++++----
 xen/common/Makefile          |  2 +-
 xen/include/hypercall-defs.c |  6 ++++--
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 64023703ae..d59e108652 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -653,12 +653,20 @@ menu "Supported hypercall interfaces"
 	visible if EXPERT
 
 config MGMT_HYPERCALLS
-	def_bool y
+	bool "Enable privileged hypercalls for system management"
 	depends on !PV_SHIM_EXCLUSIVE
+	default y
 	help
-	  This option shall only be disabled on some dom0less systems, or
-	  PV shim on x86, to reduce Xen footprint via managing unnessary
-	  hypercalls, like sysctl, etc.
+	  Management hypercalls provide the means for dom0 to manage the
+	  overall Xen system and other domains, including sysctl, domctl, etc.
+	  In a dom0less or pv-shim build, they can be omitted to cut down
+	  on the Xen binary's size. However, this comes at the loss of
+	  significant runtime functionality.
+	  So be cautious to disable it, as admins will face missing a few basic
+	  hypercalls like listdomains, getdomaininfo, etc, hence leading to
+	  have an impact on device-passthrough and DM.
+
+	  Unless you know what you are doing, say Y.
 
 endmenu
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 4353ea59a4..9f59f141a8 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -71,7 +71,7 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 endif
 
 obj-$(CONFIG_COVERAGE) += coverage/
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index a08e80ed59..c9ee5de99e 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -199,9 +199,11 @@ sysctl(xen_sysctl_t *u_sysctl)
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
-#endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
+#endif
+#endif
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_HVM
@@ -282,10 +284,10 @@ sysctl                             do       do       do       do       do
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 paging_domctl_cont                 do       do       do       do       -
 #endif
-#endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
 #endif
+#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
-- 
2.34.1


