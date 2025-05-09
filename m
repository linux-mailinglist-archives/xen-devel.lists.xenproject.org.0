Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB0AAB0E30
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979879.1366376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgK-0004pm-82; Fri, 09 May 2025 09:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979879.1366376; Fri, 09 May 2025 09:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgK-0004mb-4v; Fri, 09 May 2025 09:06:12 +0000
Received: by outflank-mailman (input) for mailman id 979879;
 Fri, 09 May 2025 09:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDJgI-0004kr-Q9
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:06:10 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2415::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7d46c30-2cb4-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 11:06:08 +0200 (CEST)
Received: from BYAPR02CA0008.namprd02.prod.outlook.com (2603:10b6:a02:ee::21)
 by DS0PR12MB8814.namprd12.prod.outlook.com (2603:10b6:8:14e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 09:06:05 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::11) by BYAPR02CA0008.outlook.office365.com
 (2603:10b6:a02:ee::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Fri,
 9 May 2025 09:06:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:06:04 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:06:01 -0500
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
X-Inumbo-ID: d7d46c30-2cb4-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zl5LkB4KxWBeLENqY4BIWSY10rDPE2C1d3xO8QGQWqtuXoCaG9qA/HPVyajrp/TxcWYplTdJFNi9WzA2iMmGVUW62Kksl/5JQlwwu/g7RMiXiOtuIfr+zfZvLoaKjjoBA/12kC6SnJLFdUfSlz0SlO4z9v/EWDBd7KS1zAeJjIXheUP3QJHLlElwmXjWfmJlSYZuqOvoCnDl/mO5QsJZLKnyPH7oYMTM+RI3ogdYE3Q5bBxexzm8D5hmSBZvuob1SaHsnfVUZjZUG7HAIHAj5EET+sQl3JwY/GVoQx2nqmqy7WiMOVIfnkElf4M8KG5Ti19IK/T7Sx3ILPGAVSecdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQdXx3HTsPNm2JgJIQeGrl1G1KZnmDGgfP+bzS4sBUg=;
 b=G0m1gWq3zywiySYVPyaJP4vzdTgmqc9zx9jJXucruusK9HCYRVLP6fg8Y0fBQuLXFTDqWJwbV0v7x2vyfnZLXztB3xeDaA0KmnlkyKHe/xGH2TduvT924M9m3P21B3YmWp4l29a2xEcE3VOneWY6vVJfBdcpmP51UHObdzqAgHyivEB3XhOR35dL3z/BDV9dmvrB3xynjw0WCN0w0kpi31IHOrXStcaRDQPRuuQt89YwI+Zyv+1Nkh/x4KjHrEQPnuCSifosgcaPXIYvDVll+hC41/TrzjiqPGSYVyoNY7PXVE4Z54CXPqrvBONgLd1BqJIp2LcnDdVpAWUAMcslSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQdXx3HTsPNm2JgJIQeGrl1G1KZnmDGgfP+bzS4sBUg=;
 b=IF/vify+7pmic5h77JH6xo0lJEU3DsZTQmhM0SHZfVbNaIDgSzZwqga7CScs+g/In2lU4Xscq+0/6WPD6mlFhT+BIvjIXec0tcHdLxIie6GdpwRzHSlIaqnWY531g54/QOanOcsAuNTQJGWykZT9LU9VdasTmWPwbDomMjHZFD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 03/10] vpci/header: Emulate extended capability list for dom0
Date: Fri, 9 May 2025 17:05:35 +0800
Message-ID: <20250509090542.2199676-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|DS0PR12MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: 74841d00-2f72-4a1a-20ba-08dd8ed8ba83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXJLUlFPb20zNlI4SWhhZktWNXhxcy9WeVMwRVR0K3VwSFJ4ckFPNFlDeW5Z?=
 =?utf-8?B?c0xEK2J6TEpUbnBZMkxlWTBrSGZ1bERKZXArMnQ2aXBnU3ZTUTNLdThnQmxC?=
 =?utf-8?B?WUFzNHpGeS9jckdnL3dZbTVzbStoSFBRZmV3azhNQ2pDKzFxREQyKzVPOGRo?=
 =?utf-8?B?SitLczk3MjRKbHJ4YW54OGZZVDU4YnFhb1U4TmpGQnFSWUJud2phNWswT29y?=
 =?utf-8?B?eWZpZzZSeFM5blZDeWxqamdYT2kzNXA1eGxKaFEvODBtRCt4blpyQTU3YTVO?=
 =?utf-8?B?SXpRbkpoWHdqRVRKbXpxV1BYUS8zdy9aS0paWnEvRHRONjZNNmJGWEZEbXp4?=
 =?utf-8?B?d05DQTJOTHMxZG5Od3p3NSs3VE91R0Z4bFJyRUpRS3Bodit3OHBmWWdmSWtl?=
 =?utf-8?B?VkZub0lSZk5kTUFUWUJMSW5lVlhQMnZFVm1vUlUyYkhCdEwxNkRGVm13YUtF?=
 =?utf-8?B?TDZNVGlScVg2V0p2VnlnZllEZXZvYmFRYUJrZldXL2thQnU1aGtrTm1XYjFk?=
 =?utf-8?B?bkZXMmJtR29wQ0NUbzRnaTY5eGVsMmNoZzBwUTRTR3QwZHZ4VmtpSlFFdUlW?=
 =?utf-8?B?TlZZMGxkbTRIRWhWZ1hVUEJiYkhIRUIrd2JpbnlJV0RrOEQxcGJ4VGxFREhR?=
 =?utf-8?B?YVhDOElCS2JVYUQ1RkE0V1Qzc0V0a2hUR253cjlFamVZSVQyN0tydjkrWGYy?=
 =?utf-8?B?K3E3SGRzODZTaWdLYzRSc211S0VsRUlkWWVWOGwyYWM0d0puL0tnN0t5dlVC?=
 =?utf-8?B?alY0NWRQRHlKdERwNWNibjhrNktYL3pMYm5jRzdjSWsxdmYzQzk0WE05azll?=
 =?utf-8?B?NTl4bENHOGR1azBXcklyTnI5VUVka2RwVktjVWhyaU5jT0N0SHB1NWpsQmtu?=
 =?utf-8?B?MG81T1dKRUk1L1ZOZ0lLeGt2TEFBa2gwTmZGVjBGS3dGSjh3YUJUd2szZXFi?=
 =?utf-8?B?b3VjUzdHUGthTG5aL2JEeFVtWHV5SDQ1TWJwUCtTY3o5ZU5SdE0rRm9vaTFt?=
 =?utf-8?B?M3U3czlxWmFaNmlPc0xwaGpVTWVPS20wZTV2T1VkVHdyOFk1dmlPSmdHNmp1?=
 =?utf-8?B?Q0RUcjR0L0pQQTFrNlJDR1g4b1NHL0VNcXdXVzUzcWp1RmVQbWFIQU5TRTJS?=
 =?utf-8?B?Q3B2eVZzQVdEeUNzSkNpN0pIdXpOa1lyTVd4REVNeFAzMDdqcUhncmNwNWpH?=
 =?utf-8?B?c3RkUzJEMWdQLzE5dUIzbEVLeENaN0xJcHcxMnFxRGVvamcxamJtaE1lMS9T?=
 =?utf-8?B?a0JKSFZ6WWxKTy8wRG5SUjRyNFpRWFdTV3BiNmVOdlZ1QW0wRlZUNVlabzNh?=
 =?utf-8?B?dml2WTU3Mkp3cTh4T1ZzMXp4UVNjdEpieUd6WUhQK0xiYVRKR04wd3NNZzFO?=
 =?utf-8?B?V0tlczdCdGNpNmJBVGhwbWdtU2F1eDFNbm92UzZXVVFMak5kTFN2KzJIeUxP?=
 =?utf-8?B?TmpNLzFGT2dJb0YzUkQ0WU1sS254d1NOY1JaemVSSXpFY3M1STJDVjRLUGM5?=
 =?utf-8?B?ODI3eEZBamtjcTJSNC9BTHU3b0VsaDR5elU3WEZKajc0MUszNFNHeERrNGVm?=
 =?utf-8?B?UUlxeGxTaG9LVytIQStYOGVvNjR5akdSSnQra1VQME9vR0V6bGdtTUgrMnJa?=
 =?utf-8?B?bGR5M05zTUlBUDZ3N3ZTM3lPZ3FRK1M3WHNhdkxDVUdoWnNPYXRYRzBINDd6?=
 =?utf-8?B?ZGdqZUk1ai9QTTNmNUVZVHlDMVVsK05BT25xYVlLVVdSV21Sd2pTVEphTTlu?=
 =?utf-8?B?aEtDWHJVL3RqTVV1RHRWL3J1K3p2VkJFOVVEclRndlZHaE9Rd09MRWJUTk8y?=
 =?utf-8?B?TkdCQ3VQRm5iN1hKSmhDNnhHSnJXWUZ1ekN0dlFpQXRFUXREb2UrbnFrUzhq?=
 =?utf-8?B?YUxrREt5NlhVMjROMXFORmZOR0xleDRicEVwcGZVejFha2xrekdWUFdjVFZB?=
 =?utf-8?B?cDJ4alN4b2VCeGhPQVhzOXVoVTVDWmZnV1BsamxLU0FuR0VzMWpkSUFUMUJ0?=
 =?utf-8?B?OTNraHJkcmM4azlYdEpsQ0ZMSG5Denh6bHlaeFZ5Qk0rU0lmeExqNFFYUk0r?=
 =?utf-8?Q?s8lxgj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:06:04.8336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74841d00-2f72-4a1a-20ba-08dd8ed8ba83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8814

Add a new function to emulate extended capability list for dom0,
and call it in init_header(). So that it will be easy to hide a
extended capability whose initialization fails.

As for the extended capability list of domU, just move the logic
into above function and keep hiding it for domU.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v3->v4 changes:
* Add check "if ( !header )   return 0;" to avoid adding handler for
  device that has no extended capabilities.

v2->v3 changes:
* In vpci_init_ext_capability_list(), when domain is domU, directly return after adding a handler(hiding all extended capability for domU).
* In vpci_init_ext_capability_list(), change condition to be "while ( pos >= 0x100U && ttl-- )" instead of "while ( pos && ttl-- )".
* Add new function vpci_hw_write32, and pass it to extended capability handler for dom0.

v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c | 39 +++++++++++++++++++++++++++++++--------
 xen/drivers/vpci/vpci.c   |  6 ++++++
 xen/include/xen/vpci.h    |  2 ++
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index a06c518c506c..2915c801adeb 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -827,6 +827,34 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
                                                  PCI_STATUS_RSVDZ_MASK);
 }
 
+static int vpci_init_ext_capability_list(struct pci_dev *pdev)
+{
+    unsigned int pos = PCI_CFG_SPACE_SIZE, ttl = 480;
+
+    if ( !is_hardware_domain(pdev->domain) )
+        /* Extended capabilities read as zero, write ignore for guest */
+        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                 pos, 4, (void *)0);
+
+    while ( pos >= PCI_CFG_SPACE_SIZE && ttl-- )
+    {
+        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
+        int rc;
+
+        if ( !header )
+            return 0;
+
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
+                               pos, 4, (void *)(uintptr_t)header);
+        if ( rc )
+            return rc;
+
+        pos = PCI_EXT_CAP_NEXT(header);
+    }
+
+    return 0;
+}
+
 static int cf_check init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -879,14 +907,9 @@ static int cf_check init_header(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
-    if ( !is_hwdom )
-    {
-        /* Extended capabilities read as zero, write ignore */
-        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
-                               (void *)0);
-        if ( rc )
-            return rc;
-    }
+    rc = vpci_init_ext_capability_list(pdev);
+    if ( rc )
+        return rc;
 
     if ( pdev->ignore_bars )
         return 0;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index cf3326a966d0..2022b61ea7b6 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -238,6 +238,12 @@ void cf_check vpci_hw_write16(
     pci_conf_write16(pdev->sbdf, reg, val);
 }
 
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
+{
+    pci_conf_write32(pdev->sbdf, reg, val);
+}
+
 int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
                            vpci_write_t *write_handler, unsigned int offset,
                            unsigned int size, void *data, uint32_t ro_mask,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index fc8d5b470b0b..61d16cc8b897 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -80,6 +80,8 @@ void cf_check vpci_hw_write8(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 void cf_check vpci_hw_write16(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
-- 
2.34.1


