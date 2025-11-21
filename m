Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEE0C77BF5
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:48:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168289.1494350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLsp-0004bd-Iz; Fri, 21 Nov 2025 07:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168289.1494350; Fri, 21 Nov 2025 07:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLsp-0004YL-Fr; Fri, 21 Nov 2025 07:48:43 +0000
Received: by outflank-mailman (input) for mailman id 1168289;
 Fri, 21 Nov 2025 07:48:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMLso-0004J2-RM
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:48:42 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fbaa28d-c6ae-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 08:48:41 +0100 (CET)
Received: from MW4PR03CA0025.namprd03.prod.outlook.com (2603:10b6:303:8f::30)
 by SA3PR12MB9090.namprd12.prod.outlook.com (2603:10b6:806:397::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 07:48:36 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::73) by MW4PR03CA0025.outlook.office365.com
 (2603:10b6:303:8f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 07:48:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 07:48:36 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 20 Nov 2025 23:48:34 -0800
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
X-Inumbo-ID: 7fbaa28d-c6ae-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDpnBDmob7LF2Lo0F6y2+G+qd/NnCDIJFqCKHDlYONpN6Dbwc3KsfIBtBJgI1EJ19uqVRHC1Hl4Mc/N6UGDoAsZG0QlRlkrL0c5XgrB30Zq05dbN+cqxR/HAv+iIETWLr4QG3jrBRB4aVKsuOGQXVSD+XrZPRoX4gD4I5vPVJ/KS1LEFZIec/HmTcIbqq3/nij5+pcJD/3mp8mfeiuGht4DynLBsafi/zky3pDxACAKx+rdpmi7Ksn3vg8VX1TzT7T+altkzXsG6hkfgv186CASdR09EHPl3cHC1B2lvxq1cdWem93qnZZuynzLKkLGvOUQoSoH1zpy+YA9csX3Qnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iM1EasxDmaVLEKtogRwBM88i4Ro0GcHMHCOrhVn/OfY=;
 b=OTZa9HwiBZKbr/7qbjmlwIyGv4CoYONAAPSiBLHLKHX6n2Ukzr6J6e6yl+hsMlxEZ7vR00H7wPeAQ4f0zHf7xJpLiS4D3752aDL2KYrWnfG92jfPvpU6QtubcTS0SoTX/2nh1e1D5sr5zIUV9S0DSqbO37wGdQlwnkl1DnbqPEL7q8S9Y63fShLFM122LbbAF9wjj8qtnrv7yGBU5Paj/GR6sqN4ZuZjvl7qVdCozKiIQNIeR1SXaBBiGGOc2pA/VULvpOycOg7+I+oqRZS1t29kw7io0X2vfFf9nq0G8yuAZygE7g7K4WBbE+7cqA7pOIXEgR0+3VxW7RbypKMSYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iM1EasxDmaVLEKtogRwBM88i4Ro0GcHMHCOrhVn/OfY=;
 b=b8x7gmdyDoTuD+OZGm0Axa0sKuaZTa6u9/IFb20ycUZ4rjmrX8hGBsBsPXJ7Jh4nP8Z+0ERgOISSnjUEPTUZlDSxnW1589s2cDg0ayV7//Ot97FpYJPe2ZfRNoc38OLvoQA2OlN7cwBD+8Kbv5D/AVkvUpLeiKy5WL7oytMXojU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/7] xen/xsm: wrap xsm_vm_event_control() with CONFIG_VM_EVENT
Date: Fri, 21 Nov 2025 15:47:58 +0800
Message-ID: <20251121074803.312568-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121074803.312568-1-Penny.Zheng@amd.com>
References: <20251121074803.312568-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|SA3PR12MB9090:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f42e25-e323-4556-1dc6-08de28d260dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J9SLH9u7psDLoOgjD9Iukx3xCWYVfVZlAsyf4thFpQGgxAebCNGuZIx35CsS?=
 =?us-ascii?Q?aNUkEyTB/QdXsJkf+FvC7HQegKrYqwTL9/rQcxbYuI5SY77WwMJ+3DIdOfXr?=
 =?us-ascii?Q?ULsv2lwPQ5UPbOO5u+Q4Km1K0+gfaYSAvaVRvmtdw7Pf/TevCYKUlHyYyKif?=
 =?us-ascii?Q?rE7lP0bVjvfEApicwtzQ2nxT+BMiNQEjUgtukuti1Xb0KP8BzoSxn9dnQGIM?=
 =?us-ascii?Q?Hs/BN5pZybxHRMePFkcjKYSkIrMMHlt5euNRckFYp4aSYKkRsAzxSLm2otlu?=
 =?us-ascii?Q?mU8vCTpjhnzm6YMGWI3j8rDaBqY1LJrq9a9rUw68bLc/BPVN2T3sxLcvlHPu?=
 =?us-ascii?Q?LRMqeluOqNyqvtQYkEDMd4Lk5d28PpKofApG2qaiJ0tafeckB7z19u3PJc/E?=
 =?us-ascii?Q?9lD4On3WFvZW9wI59SFLDUncQHrteCHAaNd95ByUZn6JTepZ3ujjLLnH1KVN?=
 =?us-ascii?Q?j63gJhZqgJZbDY8TlsHMMZCEbIxsvsSakEPBJmwoikxQIPyKQz1Rz8KK06EP?=
 =?us-ascii?Q?25ud3xcds2/XWdSRGswgzg9+IEvXB+r8b/sZGQV4VSBrWyclKoHSKnfzwu7E?=
 =?us-ascii?Q?iN8z98/laDWrbpxMw1Y2HWdPi1r95Ad927crjC5JJWoZfydjmNnLjnzw3SJt?=
 =?us-ascii?Q?AcDEUu6J41Bz8IV3TiM94i5IhfmCLYA+TxRTQB6NghDJ3YBncI04OnZAjWL/?=
 =?us-ascii?Q?0EqERf/N6XmnBeBGY0IKC2WMctas+jSmBLw+0qKif8FFDLtgPUX9Bt08bZ/8?=
 =?us-ascii?Q?X/ku8CGYCTtzvWGj99lKLGOmiAd1aioXkAjI03zNRb3BIlfciegoOC0KJeeO?=
 =?us-ascii?Q?H2vzw31+rYmSnYla6PqHa+k2OlADCE6076JH7wq+RP6bLdjMFQoo3Hl2v9ma?=
 =?us-ascii?Q?aZQqhC6POV9cca0fViSnnoaJp5l/eH2+EkLEJxRtMimzDxrtnBdNFBxvRqmH?=
 =?us-ascii?Q?8jplwf2y1mD2FCCvoLV2vwHCeTTwgk8w3vTBhdmbv/xK1QSyH8oZTck2tbHj?=
 =?us-ascii?Q?fWo5oNGmdU1eSRecLLAzOoQ/bewSAqvJ9qIHPsnRlz5YFiM1lYpG8pfYFEyn?=
 =?us-ascii?Q?g3mTKbYYEQFSOroZEvtSrY/a+mtrk4mAeE1YPJjiYgDgmzyzS+N+fueHIEvP?=
 =?us-ascii?Q?BsD7tKVdI86mBCgS3+n3JNo612I7FrPny1FVi63ibcTZjXnb0yLgzLFpm8Uv?=
 =?us-ascii?Q?bLdtFpeME4kBybFxuOJe6nH0dBo6SCndP9GG4N45lXxSZNkqfzmip8KTZrHo?=
 =?us-ascii?Q?1Zmi4IsuuAB1r6BhPuVDmPFpD9Wn6PPLWMM5dUAWVyAf8cIOOf9I4PpVH/WW?=
 =?us-ascii?Q?ruMvOf8sMbalq7Z8hCCjeLP0OVfC+fD+jAfDHY4yos/YUfMbcS1vmnqvkEol?=
 =?us-ascii?Q?9k+fCl98+KmV95ibqh28tjLfZa/Fgd9Ues0Z4y97VsADG3nf6ING/SO2vdIi?=
 =?us-ascii?Q?5Fzuno2YN87FqMtCzKNMXqYBdfpg3/xxisx4mPK8jUl4srTDT4VX1B425EWr?=
 =?us-ascii?Q?1f65y91NCfHqZXXyLkq+Or1NXyJZz2DIMhym2eW/CDc/2PElVWjqbDctyp0/?=
 =?us-ascii?Q?1Qi7nBOLLfcTphzWGxM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 07:48:36.5207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f42e25-e323-4556-1dc6-08de28d260dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9090

Function xsm_vm_event_control() is only invoked under CONFIG_VM_EVENT, so
it shall be wrapped with it, otherwiae it will become unreachable when
VM_EVENT=n and hence violating Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
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


