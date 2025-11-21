Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EC5C78156
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 10:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168461.1494470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNFv-0007uJ-OQ; Fri, 21 Nov 2025 09:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168461.1494470; Fri, 21 Nov 2025 09:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNFv-0007sn-KK; Fri, 21 Nov 2025 09:16:39 +0000
Received: by outflank-mailman (input) for mailman id 1168461;
 Fri, 21 Nov 2025 09:16:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMNFu-0007sJ-2W
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 09:16:38 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6bc7344-c6ba-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 10:16:36 +0100 (CET)
Received: from CH5P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::7)
 by SJ5PPFA5F0E981D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 09:16:31 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::b5) by CH5P220CA0001.outlook.office365.com
 (2603:10b6:610:1ef::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 09:16:29 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 09:16:30 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 01:16:28 -0800
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
X-Inumbo-ID: c6bc7344-c6ba-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i74ImbfUFrDae8HiMDDKQ5RdhsmSUdOm6CjQpJgGON4fti7e12VTNiP1KurXqCJqc2QAKxUZ7rJTFjOm8YSJJ3Vh5xFsmjxaCd7/gy7iVWwq+kyi/wOtAg19mpHyYbUkhquecqkcv3wq1IxK++86YNUQtUUyAwtmdsQ/uophSqxkKnYCGvH5AmPneN3oBNTc3uA3OTaJmENKjwNyVZALwvcVO0wunKOqVV2bht1RftHW629XUxjeiLqUDxy7K+iEu4lwm4AbmZ32jBDkBXAPRn5qjqSg04t4/bBb48qEaSB7wrGoVYmkX1IuLB7MITc+WoEzV8jPOmBqzT8dASNyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M55NVdiPFs+EjZRblVeJtPpm5AeHmt05murvZXdVUI4=;
 b=AqxMTKEkoAqipXqvi5NBI90XKTYPDoa4nbgDBPGIBrMpOZXrmxxWOKw82XieQ4gzaLxzXC1vjFnt8yfmO/urqB1ev4cS06SdHAMyP5gOloHJ6HZC8MEWpD0SUBfN2Dg01e0XPa6C7JePPkaEJmUHxqeBTGgF8lCOREg1SFMWkkyZhnNRt+fRL9jkD4jAMppeSefWqYgLA7zQCiuB3k49ZMwKneoxc1LzOSem+lekk3bN7rQ8Q3hKwAV1rr7gMzmyQL7KGCuv055G3A+L5VJ2rMHDHy0usC6P+Z8REw/2OBirwvcRssJtgbWCB1nqp6V4XGSLs2LPJwkQJVN2y5ZFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M55NVdiPFs+EjZRblVeJtPpm5AeHmt05murvZXdVUI4=;
 b=YQdQCjIbhd6IrkVVL4WXREA4rEK1BniAHjjRFYcrYwLB+Qe8cc5fsfpqIfIw9ZbxHXFzHHxKMOfo52euaHDHvfZOFEaQQ0J3pSZfiR/HcWz3Liewk8mtY8FsaEe7cyUr1nXhOw3haqvgY+Svk4z4dMrxoq82dvfN4Q6Dtkp9DJs=
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
Subject: [PATCH v3 2/7] xen/xsm: wrap xsm_vm_event_control() with CONFIG_VM_EVENT
Date: Fri, 21 Nov 2025 17:15:49 +0800
Message-ID: <20251121091554.1003315-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121091554.1003315-1-Penny.Zheng@amd.com>
References: <20251121091554.1003315-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|SJ5PPFA5F0E981D:EE_
X-MS-Office365-Filtering-Correlation-Id: 930e84bd-c470-4d06-e0f5-08de28dea87c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nNxuwRtiy8abW9M1dsG7KkWGF3/VvkjVSGXW4lrsaxH3IsYYyY/2MHSF8W6L?=
 =?us-ascii?Q?9BcTmkNABz3iNgna5K+mQ6bMJWTuD+PuwbREYE1x3Fiuihf5R4X8Qi+CFG8r?=
 =?us-ascii?Q?/rFV3FdpO3mK2fL1i5VJGW5agmKnsNw/gNUYrA3vFnSUoKFEoVt5yvxI/bCC?=
 =?us-ascii?Q?q+eJaAK0lbilwns4Wc+2b6BLqBELBLKWUqS6O7dZtMUerLVQtZ2l37bCIEti?=
 =?us-ascii?Q?meWhi3TdAzHIcrE7Ca4lHtWMQyk0tdhU/FfvLEdqHs1AJkyvHCoWpd4gYChF?=
 =?us-ascii?Q?3GFT1+DuBNfvUYMR5z6FVMWZo+7UPBf5vM5Zv2Hb/wbaZa0B/FLBzyFxWigd?=
 =?us-ascii?Q?sFqmocrHHeCL8HeT56KjZrY9DuHS6sTUqxvEdgMyFxpso1PuNGOFDrGIR8mh?=
 =?us-ascii?Q?Ybj5KFnpdVxFw9HUQzDWupUtFHtLhs2rA+SmUaZRP32+2PdgVv9nc1t15Uh7?=
 =?us-ascii?Q?tEse66agGp3Iv8Wy84NSDIauP5wSUqGjii27TGYeFj/LCRSMPHdz4bQKORll?=
 =?us-ascii?Q?kYzSj3Ek88UfKZYXx4C8SbB2I9PTRUDRZaZszM/FaqXOv6uhZSFry3lEp9hJ?=
 =?us-ascii?Q?HMGnmAXDBQlf4Y5kn3O/268KsstmHSNflN0wG/uCY14t2AYWZAsiTCe5RUKA?=
 =?us-ascii?Q?I8hccIfA0wXw1QsKX+Wj/QJWZNmaNOlVqrwbJntojFSeyFQl5vcby1xSvKUz?=
 =?us-ascii?Q?sbGhf6gNUFgFjucND1zjYnDyrwHzxKq9ZSlKm8d/b9Wmkgms9ya2ie8mAgw3?=
 =?us-ascii?Q?f4lXD2ge4mRZJxPt5gyrHF1cVYp9+Q8ewv7LF+OCbVtNvnm2iXXQDBZdm3F2?=
 =?us-ascii?Q?4YUVydAq1WVgZFhwzblIiZJgbPoDfiTpwvxstoKU3WQGApxl8RhuccUKYVat?=
 =?us-ascii?Q?Wh+H9DzT7POtmWJN/sd4Au9Zq890hUTEmVYKFswIEHoZwUpbjec5EhFtKgny?=
 =?us-ascii?Q?nnwx/LdXSf5doBqjMg+2KI4hE+kRguTq+vJHrWWAmfSexoAjp0WAf/HxD04z?=
 =?us-ascii?Q?yn5kv0Y0uHJASY8EhH16iXeCaiKWqTTzDyx2UhxO4KylboRAC+qHfeKsnOs3?=
 =?us-ascii?Q?MfPTkB0+H0nftvRNaQv9kd0ju/EeUKPY/GYwc99jiBLsyLLKALZqtZ4M3CjD?=
 =?us-ascii?Q?EFxs12h9qK/isoDYP9dFDfDxsSfjipD8Lxe+KBNQjJkExfMcL7hImMnPsXsV?=
 =?us-ascii?Q?tQqO0ueYCzkkNE0XWl3kB5Z4jb9JpILNPGn297K0iFiYRB2PeRdj0oT21tL9?=
 =?us-ascii?Q?BaQuOO/itdjEDJvZ+EPcBpQY8Omq+ZlEnuusO/6Fb8kYXoUtylG7/9NKndpr?=
 =?us-ascii?Q?ge7gddwqlOArW02o6yLegowUK9ZRDWHNHXb4GtdHFKlwMzEputuwK2PJwNYc?=
 =?us-ascii?Q?ImINp0/SBRP1zC7avS7NsYWZHFrZr/G+gyfTBfUSGpxlo521l0PuAjPFvulu?=
 =?us-ascii?Q?SHgpXJmcW++s2RHJkNw8V/dew45lYqzV+FRWmHOFQa3IOIqxTb459crwBaPS?=
 =?us-ascii?Q?4pdIz7Dkac+q+7TFPvuOnzcEj1HhHQNiSD037BT6A2I/Sdk03bg03hLATkCd?=
 =?us-ascii?Q?ms5FfLORV9VnN/2HAxE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 09:16:30.7003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 930e84bd-c470-4d06-e0f5-08de28dea87c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA5F0E981D

Function xsm_vm_event_control() is only invoked under CONFIG_VM_EVENT, so
it shall be wrapped with it, otherwiae it will become unreachable when
VM_EVENT=n and hence violating Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v3:
- new commit
---
 xen/include/xsm/dummy.h | 2 +-
 xen/include/xsm/xsm.h   | 4 ++--
 xen/xsm/dummy.c         | 2 +-
 xen/xsm/flask/hooks.c   | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 12792c3a43..e801dbcdba 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -640,6 +640,7 @@ static XSM_INLINE int cf_check xsm_hvm_altp2mhvm_op(
     }
 }
 
+#ifdef CONFIG_VM_EVENT
 static XSM_INLINE int cf_check xsm_vm_event_control(
     XSM_DEFAULT_ARG struct domain *d, int mode, int op)
 {
@@ -647,7 +648,6 @@ static XSM_INLINE int cf_check xsm_vm_event_control(
     return xsm_default_action(action, current->domain, d);
 }
 
-#ifdef CONFIG_VM_EVENT
 static XSM_INLINE int cf_check xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 9a23d2827c..d9e5c831f3 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -155,9 +155,9 @@ struct xsm_ops {
     int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
     int (*get_vnumainfo)(struct domain *d);
 
+#ifdef CONFIG_VM_EVENT
     int (*vm_event_control)(struct domain *d, int mode, int op);
 
-#ifdef CONFIG_VM_EVENT
     int (*mem_access)(struct domain *d);
 #endif
 
@@ -649,13 +649,13 @@ static inline int xsm_get_vnumainfo(xsm_default_t def, struct domain *d)
     return alternative_call(xsm_ops.get_vnumainfo, d);
 }
 
+#ifdef CONFIG_VM_EVENT
 static inline int xsm_vm_event_control(
     xsm_default_t def, struct domain *d, int mode, int op)
 {
     return alternative_call(xsm_ops.vm_event_control, d, mode, op);
 }
 
-#ifdef CONFIG_VM_EVENT
 static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
 {
     return alternative_call(xsm_ops.mem_access, d);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 8b7e01b506..96dc82ac2e 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -115,9 +115,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .remove_from_physmap           = xsm_remove_from_physmap,
     .map_gmfn_foreign              = xsm_map_gmfn_foreign,
 
+#ifdef CONFIG_VM_EVENT
     .vm_event_control              = xsm_vm_event_control,
 
-#ifdef CONFIG_VM_EVENT
     .mem_access                    = xsm_mem_access,
 #endif
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b0308e1b26..9f3915617c 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1365,12 +1365,12 @@ static int cf_check flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint
     return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM_OP);
 }
 
+#ifdef CONFIG_VM_EVENT
 static int cf_check flask_vm_event_control(struct domain *d, int mode, int op)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__VM_EVENT);
 }
 
-#ifdef CONFIG_VM_EVENT
 static int cf_check flask_mem_access(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_ACCESS);
@@ -1967,9 +1967,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .do_xsm_op = do_flask_op,
     .get_vnumainfo = flask_get_vnumainfo,
 
+#ifdef CONFIG_VM_EVENT
     .vm_event_control = flask_vm_event_control,
 
-#ifdef CONFIG_VM_EVENT
     .mem_access = flask_mem_access,
 #endif
 
-- 
2.34.1


