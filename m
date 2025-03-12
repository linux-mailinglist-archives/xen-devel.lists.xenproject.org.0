Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A53A5D4FE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:10:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909732.1316654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQQ-0004B1-LY; Wed, 12 Mar 2025 04:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909732.1316654; Wed, 12 Mar 2025 04:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQQ-00047j-HG; Wed, 12 Mar 2025 04:10:34 +0000
Received: by outflank-mailman (input) for mailman id 909732;
 Wed, 12 Mar 2025 04:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNT-0006o2-75
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2412::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 836ad4be-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:29 +0100 (CET)
Received: from BN9PR03CA0682.namprd03.prod.outlook.com (2603:10b6:408:10e::27)
 by LV8PR12MB9691.namprd12.prod.outlook.com (2603:10b6:408:295::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:23 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::f6) by BN9PR03CA0682.outlook.office365.com
 (2603:10b6:408:10e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 12 Mar 2025 04:07:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:23 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:20 -0500
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
X-Inumbo-ID: 836ad4be-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdfbVYZ36h95D6hcBPFiCMeJafIiaRN7AF+VmXXx2qc7/S3WPpi93cvbqb05zLZ6j7GddcyESYrIQb3Z+KTjSv9pkp6gDuVwQVjmgjjmrub6TzYTGtKTr0aFzDRR0Hh+LjA6Aov0lTPz6b3sDyPcPfkLpxtWoPfPtQkpcGAOS2Sqz05ZaOLeK0W6SEu3Jce0i4HS3ZuCaG60rRF1cmmqNi9Dmpmvl5CjfXOj3aeg3cfg0h/NdHHIQREYr8AS1AOFwa7R3weBTpZte4j5JdQfUSDdXz2nEkJVWAC3O/NK9lA10ofov84bwEZuGE11O+nECu8bjlHGQFMweb+6M1C8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9zemyVNubW8PfgWJd3Mg81LIUFsZ0rkITRTvoNrtMQ=;
 b=FUu0OsENIwGKCMIKmn2o+xt7Y9Sm+xy5fozo8zRu4q7E2gfCl5BjE+X8lHSksYN9oixmfkDxsybnOavnhlx8NllGQaPeaA8EKj/EcmJygg9UN3/BbCzr0yAh6gwOPzAn9x3V/DNcgOjAeDoyzzINrJ7eczcXHpSTOrbVAmT1z1o95Uzy1D/cxBwywZ9rezIdxv6UWMCTk7cVDe4vVHFxTYagcLAdNbQba1xv1RTvZLR3NAfVGMhILJV5NlGEUXRXoMeXerKCUl1aRFnbzEzj8UEBgxEmjzUb5zBR8926FY/ABBjs6fNMo+So3KlrQ0cSwaFR56fRFVtPaJ/u4nOVuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9zemyVNubW8PfgWJd3Mg81LIUFsZ0rkITRTvoNrtMQ=;
 b=KvB9Hw0O886ZfWbX4+YVmU38MrkY1z0tzY6xmiF2oLsDMJm6rLPDj6oAKk6rzCqg54/5rhuO4ft0ui4PkaKv2G9Lx2T04Sw1tm551cz3ChJ7CysX9AnWyfM/ZhsDX1i4GU02j6J1CZUUXHIhPUZCAVJOXPO4ozzEU9zGKMThVNU=
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
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 10/19] xen/page: fix return type of online_page()
Date: Wed, 12 Mar 2025 12:06:23 +0800
Message-ID: <20250312040632.2853485-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|LV8PR12MB9691:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd23513-25dc-4ab8-ddb5-08dd611b6486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YqwuKirBPBZaATopkJ+ZEnjf9oMwSTeZucyp1Vsv8oZUYeZXBHdm4vUu/R+0?=
 =?us-ascii?Q?B14KbrOJXXPVX4tvJ9sapj++CB754+vUmQfjy4NqC623bpbXVX3gZRDlLDli?=
 =?us-ascii?Q?3R6+D8s4wKmMX6mNwFwGiJhiuLaNzW4SoJkFNXCdwHyiVsClSj/cKBadcSbU?=
 =?us-ascii?Q?NcQQ0mg+bTl0v6e8ptnhLvOhpO/EzmIU5mgjNO9+pw+/XMQpzq8z1++h70yS?=
 =?us-ascii?Q?Hg70arNbswCoGSnHjTYFoO8B2lnTItKGltwZmG2G/YAz7P0EBy1fkUn59AvC?=
 =?us-ascii?Q?gOmjySaddV9G0l82J4mJd48xbyBHLB/cSMuHyDfuRbOjb5XKjlZjg8QMLY6U?=
 =?us-ascii?Q?1Mdh99mA9KENw/0eh/GVRjM8BeCFEqtp4mOP9GWLGv3qRgaZAWMJGvb1wHTp?=
 =?us-ascii?Q?vRTMKKcvAWy2L1Dliv8u8+idFD8l6KXtNQanLdyytaw5kCnbl8GBUUjnsi4p?=
 =?us-ascii?Q?zrTMP7McKchAlDYXihbHruxttif1f+1atE0UrNf2JDNNoNBwvD8a98bF9obD?=
 =?us-ascii?Q?4sBxUqzEPIua4Mv5S0XpIvrC6gJ0hO3w4idwf3Hlx8nzzXnUQ94fTc9WQqmZ?=
 =?us-ascii?Q?dbNZ2ylGiG+dTUz87n7uS6ffwWVd0/AKNbFAaZXz6iYcSZhLnKKTem0Y4x4a?=
 =?us-ascii?Q?UWj61AdjNgyE/l1pTjHNGCDTfB5wmNjMAhWXscKPM1KEWr6dehF5tu6ZEtsd?=
 =?us-ascii?Q?CGSdzlDusF+bcersT0FOl387tAFOlrfaI0SV5S3kav6wx8DGplBjKlyBDHxt?=
 =?us-ascii?Q?HCit0zA08NtMX1mSimvxPWB3JO/bMFOE973EoEgPIxIZlX0/nSAZ0U1E0li5?=
 =?us-ascii?Q?n0UKIb9fteDMPvegDPCt6QR7ouoJC/9MdKdOmdS2gQzsWi0JXqeVDkyICn8m?=
 =?us-ascii?Q?S5kl2IAyyPAfGDK3iAuz6DC6ud/2G0TpmFANBkhpZjqNt4Seh5WBOuX+n+sx?=
 =?us-ascii?Q?NMPnNNdwnwSaQbxP5BaUzInrj3lSc+TR/HLAmB2CoGs5tVPrAD1/OeNt2MmX?=
 =?us-ascii?Q?is4towF+vzYGINFDy3HKr9xg/wXsYZM9l9ymH+k8O+8mQ0/bXougRtLMb9u5?=
 =?us-ascii?Q?9cUj0Tz543sV/rHO94hbsa7aoaevKjx0yBhUuIr9vuRyZiZciz7jTrWqErdj?=
 =?us-ascii?Q?tk6uaJdtyxcDn9pZnrTBFtO8aeaHSZuJaSRIFp6cA5itOHEDJ/NAGS6LMmzg?=
 =?us-ascii?Q?dDm/uLQinrL4CMXQhh7ZFcOsRNPYuG2uB/pR7YsTGjk8nQBpHHTKCe6vlu3m?=
 =?us-ascii?Q?Vg+n6VSU3g8QvAqfRsz2wFsOzNzM9kCfI31/WyhUlV2RraI0snIfoXjNthLz?=
 =?us-ascii?Q?CR9EOZKRV5UEcQRlQJv3awhSe+n7FrPX4EZo03MwRQRCVNlHNPj20nXSNJqE?=
 =?us-ascii?Q?TO915W6ykBw8ptqSn1NUcxwAdkNvKO6NZSdqqHdwmkYpZAwVgW2u3XEotAkt?=
 =?us-ascii?Q?IavhtwUow1UdN0J5MFy1zjlPPihdRCyzpmIsVtoalRRxmJrp0WGVn7wyxGml?=
 =?us-ascii?Q?k+yUohMj6eUmmC8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:23.4581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd23513-25dc-4ab8-ddb5-08dd611b6486
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9691

This commit fixes return type of online_page(), which shall be int
to include correct error value.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/page_alloc.c | 2 +-
 xen/include/xen/mm.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1bf070c8c5..b5ec4bda7d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1764,7 +1764,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
  *   The caller should make sure end_pfn <= max_page,
  *   if not, expand_pages() should be called prior to online_page().
  */
-unsigned int online_page(mfn_t mfn, uint32_t *status)
+int online_page(mfn_t mfn, uint32_t *status)
 {
     unsigned long x, nx, y;
     struct page_info *pg;
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 16f733281a..ae1c48a615 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -144,7 +144,7 @@ unsigned long avail_domheap_pages(void);
 unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
-unsigned int online_page(mfn_t mfn, uint32_t *status);
+int online_page(mfn_t mfn, uint32_t *status);
 int offline_page(mfn_t mfn, int broken, uint32_t *status);
 int query_page_offline(mfn_t mfn, uint32_t *status);
 
-- 
2.34.1


