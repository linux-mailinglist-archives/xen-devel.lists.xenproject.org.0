Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3857BD28EC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142000.1476245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlW-0004ZK-Ip; Mon, 13 Oct 2025 10:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142000.1476245; Mon, 13 Oct 2025 10:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlW-0004QD-Ac; Mon, 13 Oct 2025 10:26:54 +0000
Received: by outflank-mailman (input) for mailman id 1142000;
 Mon, 13 Oct 2025 10:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fc7-0004Hi-TF
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:11 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6644dca-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:17:09 +0200 (CEST)
Received: from BN9PR03CA0499.namprd03.prod.outlook.com (2603:10b6:408:130::24)
 by DM4PR12MB5721.namprd12.prod.outlook.com (2603:10b6:8:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:02 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:130:cafe::41) by BN9PR03CA0499.outlook.office365.com
 (2603:10b6:408:130::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:17:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:01 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:16:58 -0700
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
X-Inumbo-ID: c6644dca-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vd5LtCI4DsYdnZFZTS78mNPd4pPxKRMnHM+1EXJCB7uBXcxaOFmlo0rfi5LmcbBxPc2s02jRyxpF5jXXZ54xvy2mJ2W+OYpC+XewMXjRmw/d79jk4+KJNbTs2JKr8R0lMhCdJlPiBrIHGvCwBe6inQyKAw0PEBTQWjaqwaQYLKNTdBl5hIXw0aD8pvXw8jgCcIti5EwEIXekNxwr70ZZ7HzEokwIiRqhFAzpFe79U1ZfU4bMSAMiSwPnIUWbEInqWFF3nS2oeg9/KTd1ZgRwozq+aqtaRxD7TEfxeLOuoMY7W1lkiogWk3yf08MKq1OdWNtECIe8huczXPNZwLaRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiVfy+8J6MhVdjDVcDOUDk8nZiMCRgJp1Xtsq49ycA0=;
 b=pIx3f6fa/GsIynN3++oOkc/k4rOZdgD0oY81DFFyxAvkDhGAFVZmU3CIEr66/N5/Ziy8YVFfE4FWpvc6nLuOpxeSCOZ7xh1mlVwLuH5P/mrGzq3I1YHdnOG+sUX6EimC7UR8L8rT11q1NKQuOCIofjiPeZEkRSP/CuCdMWvrBZeKZcpndlntnD4UMdPoGGjPc2avDSG8xmrbVzihEjPWBD/JzlGWItekOm2eN7AS5opOolXaz/TKsYCM/Itk7rmyFy4UBnS7TLcPc9vQOkVou06aQsDa8Cpp6Rh6mj2y2cgOD2v2OKPYJUTqC4Z/eJW45j5bvuKyT67o2oec1kcaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiVfy+8J6MhVdjDVcDOUDk8nZiMCRgJp1Xtsq49ycA0=;
 b=ko6ZnFXvjlf57oAJX3zM8yGeaQ++CBzNQVInUtHZBTIuYzjD9KCfTvj3ssrV452FhaEA+fdIYCoKhuBfDhjCaueO73CZoWRSK6tPHbXIfGWlklPMgio66XexALCdkcMVh2fU4OiNgMBJw+OIZ2x8nFwqPAkOAqxXZLooNx3MFq4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 12/28] xen/domctl: wrap domain_pause_by_systemcontroller() with MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:24 +0800
Message-ID: <20251013101540.3502842-13-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|DM4PR12MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ebc24f-ace3-4aa6-b215-08de0a41a6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J+9uzx17TqsbjGZeBeHXXbTFDjPmBNsPfzCjSs8bgkK4GLRiJK82Zc39rKOE?=
 =?us-ascii?Q?qB/JGY/Gsr31ScFfJgSvbtpRqVQh2XTjTDEvwsa45NvDf3YIdTPAT0fBiJMK?=
 =?us-ascii?Q?6RSLATv/dEqnDro7C6m1/9Sod21gWKRCvidloeEKlRLDKEFgTRwvoEPF9n7Y?=
 =?us-ascii?Q?NPVPLTlEJvbrVDEH0B6jRoay6ZjB0gd4wo11bBzEdZ5FVrctvxvKGyJAGSKn?=
 =?us-ascii?Q?I5g7bqoIO5kBAtj7MbJD4JKbqi2t2wLYHHJ9zXVVFuB9JhAxD58Nk4pgy7IQ?=
 =?us-ascii?Q?I5T23PAfVg3PAigMIe6k1eLy0+wa6SpWDanZRAulWflBXhXIEa++MnEgMSeC?=
 =?us-ascii?Q?2Yjh49b9rUgH1d35ExBWQyjatqZcNTencYBJOpxZ11cPf/NUj2e5qx0B62ll?=
 =?us-ascii?Q?7aAjf8NSszfCSxpzk7qg2TSinz6p0Go1gCMV2PNZf+5XbHW2g9lxJ1DyHGRr?=
 =?us-ascii?Q?uQOF9e07qS+pePlUYdBh7gKbvNn96MZDclcGkksUIuFPVsharrnfTLw5ubsy?=
 =?us-ascii?Q?RhSRGzHyA+e9XYJD+mFMbeOCaTZErb/GYeVQVeOGZyx+ufCxM6uPJj1vpOKr?=
 =?us-ascii?Q?0ZFwJ1gJu3KvLMrtdrDOqORFeaYnFOzTfXZQICophLFyZzqbrU7jnd6ldzI7?=
 =?us-ascii?Q?2HvIEcUwscVavJec+xjDVkVJS2LZ3jXXcU1UbMbsOYa9pBRcb9lLEGVDFpJ/?=
 =?us-ascii?Q?vZD/wy+3c/l7ZntUq3ZZGmxCBaipPG19Ff5bWkvZXB3XXvu38EQV1GjfyygD?=
 =?us-ascii?Q?R1gcxXKab3cEYxn/dWb2UoFc0h4EFNwQx457g0HySrPPt7c4ad/e9MemP7ix?=
 =?us-ascii?Q?s6nJ6xJWejFqncCtVF8G1Kruc6keRrAYWp5Y2QcVNRusMPPUAN8dDNYpP4SK?=
 =?us-ascii?Q?wS5Bf7rclaDAIRViRXzSLVIxn4Dn8wdrM6u5jSCk4F1RVq9qRgu8miZnY27M?=
 =?us-ascii?Q?mtUzEOJd0OsDjEolldYuQz5FKnNwuqas2065SSkvbWJiNr6OGq4Ow966yXLZ?=
 =?us-ascii?Q?+QbzFR6I2+mh1Ao69Nn9y8J1RV/ARoonKhDsRhT1cLgLlYNxWqYbBrdfeNhh?=
 =?us-ascii?Q?tYhNcZb2AKHCuKeJ2iNbiMkPbK4VABGl4txvBo9kuY5bczR/2j301mDGwMD+?=
 =?us-ascii?Q?sTOujKEPzYL+3ifG2u5gXcuQxTHn/OIp1+Ogiz/x7OmSbmW1C2djutC2hx6Z?=
 =?us-ascii?Q?VbUbKxVB0JVUTxvxj389nfbLd4tptixrA2ZC7Kks3nvcWhrNVbS1XSIkZB1A?=
 =?us-ascii?Q?YvpdZ/fkI4HZHiqwd/lPtOKCuU6LZM7F1V7mEosHN5NiO2Co3glcFbaGUizF?=
 =?us-ascii?Q?+hv599kE5vYiEa/YHKNS8Ku5YjC1wBtxKJs73HWr9hH/qiMwIZpJfCCh8EtY?=
 =?us-ascii?Q?zXlOydiXSbDu5FoQyicEVAvnfnncHyt4iXBv/Q6CC3XAqnPwHJeRRFkzU0zE?=
 =?us-ascii?Q?ebGpxlxKKphojlWA97eu4/HF5E4vWizm3TrajikhgmMCsI30TWi9GMZbcCc6?=
 =?us-ascii?Q?Cz56fBcbDDzxeBxvTz8xrFk34rsFp0SEaNu+ZtJFpZV88jK0gvM7UDw52/Pb?=
 =?us-ascii?Q?yHhPAMGgSV/O1nY3bBA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:01.9030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ebc24f-ace3-4aa6-b215-08de0a41a6b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5721

Function domain_pause_by_systemcontroller() is responsible for
XEN_DOMCTL_pausedomain domctl-op, and shall be wrapped around with
CONFIG_MGMT_HYPERCALLS. Otherwiae it will become unreachable when
MGMT_HYPERCALLS=n and hence violating Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- provide transient wrapping around XEN_DOMCTL_pausedomain-case
---
v2 -> v3:
- remove transient wrapping around XEN_DOMCTL_pausedomain-case
- address "violating Misra rule 2.1" in commit message
---
 xen/common/domain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 775c339285..976172c7d3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1606,10 +1606,12 @@ static int _domain_pause_by_systemcontroller(struct domain *d, bool sync)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_pause_by_systemcontroller(struct domain *d)
 {
     return _domain_pause_by_systemcontroller(d, true /* sync */);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int domain_pause_by_systemcontroller_nosync(struct domain *d)
 {
-- 
2.34.1


