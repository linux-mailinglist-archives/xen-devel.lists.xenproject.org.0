Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B414AD6C31
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012644.1391186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGQ-0001FV-QM; Thu, 12 Jun 2025 09:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012644.1391186; Thu, 12 Jun 2025 09:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGQ-0001DB-Ex; Thu, 12 Jun 2025 09:30:26 +0000
Received: by outflank-mailman (input) for mailman id 1012644;
 Thu, 12 Jun 2025 09:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwpW=Y3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uPeGO-0008FN-K2
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:30:24 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2415::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dce9f171-476f-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 11:30:23 +0200 (CEST)
Received: from MW2PR16CA0060.namprd16.prod.outlook.com (2603:10b6:907:1::37)
 by PH7PR12MB6561.namprd12.prod.outlook.com (2603:10b6:510:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Thu, 12 Jun
 2025 09:30:18 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::8) by MW2PR16CA0060.outlook.office365.com
 (2603:10b6:907:1::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 12 Jun 2025 09:30:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 09:30:18 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 04:30:16 -0500
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
X-Inumbo-ID: dce9f171-476f-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gduMruJjmwDbdrjQRBeqsBfhLf0VnLMTzkD9LqDq0Xx4BJC4+MdZvIe4h65RmVLweUOTCwVbUA0lCTaCPgqeIzbHHNu0fL8rhkeY6w90HBD2bQerSSL1Xl5oyGN5C/tqSBpkNxCyyr4dm3XOBlybru6uyQKjq5g30a7ybkPoXX0feDEmCGCTY1SSakG4QLoMPwo/vlTE4ktsfpLNKUBHR9ZPo0Jsux3Lm357OGGwQkTmXeXmZYPckwgVBEFxmQ59DoGOVESYwg8QpWrGIUTanu8KQVAfRm/EYoqctVNcqHPEbNH/szRPs1tI8fGye9TNuDZu/atqZKzmAernhuoPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF1q4U46xvoiaeVV4plSO6XloONzJt5pNCKauR4m3Ug=;
 b=HM4RMtoZCNZy1eKB3dldXQB4jikkKFhdbm7V9X3vBcbqJ+8LaRNRdVeH0FoKVyAMWG5rdg4/xdzN3Yy8G9ZOJCAAYL31v03IxyMqsHkel2H5JPCpeTRwrfwjbdKsjHBEgf1gsq+ghe7tJp8T15/Ry5Lb43gVEy3Ap6gpjXv2cGzyl2wuPKnbVcOA37Ye1dfwJmHj9cQO8lMU9Vy9bpiu7n7SLW/cq2I9FQtnFoDml5pEx5pZ7VffqA3B/366emGAc2PpM4h11OVnnshAEL7GmuyOqUjxJjnbF7aYCS/43/Q0b9VLbKcVbIRtt1dKPTaybCyib3SPUvRmhnOxQ801bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF1q4U46xvoiaeVV4plSO6XloONzJt5pNCKauR4m3Ug=;
 b=1x5AAT2Jc8vYzmfmP8jn4sfKoZq8Sw8cfAGq0xYq+gLIODhb6SHMyAmnsCrhvky4eqQHviv87ZPE1OlfatGBNT21P2JyRVKiUsLi2IFfImGvQrrTC9cofThxiU9nR26Gkc4e6WKzWfxtqTn4Pai37Sgeh09ISe+wd2TsMykKg4M=
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
Subject: [PATCH v6 8/8] vpci/msix: Free MSIX resources when init_msix() fails
Date: Thu, 12 Jun 2025 17:29:42 +0800
Message-ID: <20250612092942.1450344-9-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|PH7PR12MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: 429b3bdb-6d49-4a33-2796-08dda993bee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVkzN3M5bEF4NUNFRjBFL09Ja1k1Q3ZQcnY0L3VqYjFEVDQ5bUNzeU1peEw3?=
 =?utf-8?B?VjZyUGhnY2I4L0R2TUVXbHVyQmxhalBqMW1Fc2VSL1IyNEZZbHdSRitJTEkr?=
 =?utf-8?B?RkhYZ04ySnEwd1B2MURDY3Zqd1R2Ty9zQVVoYllTMXVKWk5Kd0NQaXlHdnk1?=
 =?utf-8?B?ZHVId3g3b1FsTjRlUzFhTUtNbzJtbXdPWmFFWGE4dWVqSXg4US9TWUxLdVNO?=
 =?utf-8?B?RHp5UGp6dzBGVU1CNmNaK2lncU1oNzY3U0dUaW9PeEE3Qkx0aHdJdFV6eEtM?=
 =?utf-8?B?Z1kvQWk5YjN2cG42eUN0Z1hrWWgzd0FKc1g0dUtOd3pQR1ZVMGxOS21YaDNq?=
 =?utf-8?B?aVBRSGRoS2FWZGtMMSs4ckcwS0N6ZVhuSFppZVg2WU16a3MxTzBVTTRSOHg1?=
 =?utf-8?B?NlIwWTJWcFd2UlUxZnk5ckJmV2o4eE5OY3p2dWltQ0ZiVTF6Kzh5RUcrZ3h1?=
 =?utf-8?B?MzQ0UE9lbjRZSldhZm44REFmQjdRUnpnRUQ3ZCtDVjgzSGphWW16Z1VrTWV0?=
 =?utf-8?B?VlNwWlRuQTcrWHFvdVFhQ1RtM3BIUWR6c2JaZzF4aHBBSk5ETmZnTkg5YTdz?=
 =?utf-8?B?MFEyU2FaWERxZUlXSTVxN0NiMVhnVHRlOTI1ckZlZUkvLytKc0s4WHgxOS9h?=
 =?utf-8?B?SW1mT1AxdW1GWGRxRld4YTZKbzdyd1hkdEJEY2JnR1I5WXBzcWJIMDdpYWJH?=
 =?utf-8?B?THRUMGJRRzZtYjFGMkQ5VGFGQUJ0bHVsa3NWSVBiaE03bml1dGl2VnFIMktq?=
 =?utf-8?B?N2N4aDgzTUJXTStCeGh6ZUUyVlcvN01QSXU4WC93MTFtWEtzdWdZYXZyVHIw?=
 =?utf-8?B?TVN5U3ZrVXpFSjRyVlJ6Z0ZPQXZOOUtHbWF2bFl1aXJJNFRDRnZ6dXVYVzlP?=
 =?utf-8?B?SENZODNkOGFYSXkxVHZBM1EydnVMd3NOZVBHbFFzSUd2TXhJOHJyU2NQK1o0?=
 =?utf-8?B?c1lmRG1FY25qVlRhVGZXc0djMjZ5RExCVk15VFhkZndXVGlJaFczTFpDL1hU?=
 =?utf-8?B?RkxuUmxQSkpmdTExOTNpbWFzRkxmVFlFb1FQeEp4MFBwekozRUNaVmkwTitU?=
 =?utf-8?B?dlFVV2xVaGhYZWN5R3ArQStLQ1FCOXQvQW8ydGFKVG5DUzZLdG9LamhnOUVK?=
 =?utf-8?B?ZEtadzJxVmRyZ2ROUlFJcjNkQzA2Nkk5RXB0dUFTLzRjUDlKOENBQjYrOU51?=
 =?utf-8?B?NzlKSkN3ckNwRkNsWVRjVnhUYi9FSTBhdGNLdU15RitWa1lNdDhnamN5UWR3?=
 =?utf-8?B?cGlGN0pGcmlzR2VlMitmVG5SdGROMnYrRWxsYTRCc0NpN3QyYXZ5ZG9HWmpK?=
 =?utf-8?B?WklFUW5McGkwVXpEMzVoUnAwQW9GR2hPZjdPYzROeEZ5dW5JUE5OR2NzRWxC?=
 =?utf-8?B?ZFlmTWJZaHlhT2w5Z1poYmhMRFN0cGhISGZnZGswc2dEM2lLQmVBN2xBSTNy?=
 =?utf-8?B?Y1pFT24wVFJ3dXRIUG5xQUhqMDk0cjVINndOTlBtUktqUVVQM0Zqa1d3TkNT?=
 =?utf-8?B?MnQ5VmJQWUFLcVQ1L2NPa1lXNXRueHZIK2JLQ3BBa1d6cDhwYUtzSkdFelJl?=
 =?utf-8?B?bHpRanJNTUlINjNReWVOQ2xRYmxpNC9tb1ZCZmYwUDRTbFJyZkRidDk2ODZm?=
 =?utf-8?B?VVc3WVVKQ0JsdHNmVStSVmc0MzZ0OXZmc3FNMWw4ckJXak16aFVDbWIvc2hy?=
 =?utf-8?B?U3pnSTBRWnVxUzVjaHd0dmNiNnpaYWtQTEdVRXZ1TmNEanVrcW95dUhBeXk2?=
 =?utf-8?B?SlRoaVRDdXJCd1o2TGpSUkZPMkRYTDVPanNMVHh1RnpjRTVkQVMzUERHRzQ1?=
 =?utf-8?B?Wld2TkI4REZmOXlUYkU2NVVrWVRGakIxSEZBaEx4b0NOZHdNM090aXpVQWxn?=
 =?utf-8?B?VDhkbDkxcCsvTjNOM1FMaHRPUUpNV0FmcGFlekJveW45Y3l3cnZXUTJFNjdm?=
 =?utf-8?B?V0xPUmtHN2lpYldhQUtJZzFjUStnSm83K0NkRU8xa2Z3d20zWFBBVFpqMlI1?=
 =?utf-8?B?MEtqcDc3eWwzZytNTkR2R3dNeEVhSVhPVE81bmlWTVdHZEJkeHNuc2N3Wkh3?=
 =?utf-8?Q?nYNKBz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:30:18.3233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 429b3bdb-6d49-4a33-2796-08dda993bee7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6561

When init_msix() fails, current logic return fail and free MSIX-related
resources in vpci_deassign_device(). But the previous new changes will
hide MSIX capability and return success, it can't reach
vpci_deassign_device() to remove resources if hiding success, so those
resources must be removed in cleanup function of MSIX.

To do that, implement cleanup function for MSIX.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v5->v6 changes:
* Change the logic to add dummy handler when !vpci->msix in cleanup_msix().

v4->v5 changes:
* Change definition "static void cleanup_msix" to "static int cf_check cleanup_msix" since cleanup hook is changed to be int.
* Add a read-only register for MSIX Control Register in the end of cleanup_msix().

v3->v4 changes:
* Change function name from fini_msix() to cleanup_msix().
* Change to use XFREE to free vpci->msix.
* In cleanup function, change the sequence of check and remove action according to init_msix().

v2->v3 changes:
* Remove unnecessary clean operations in fini_msix().

v1->v2 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msix.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 674815ead025..da293e7494fd 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -655,6 +655,33 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
+static int cf_check cleanup_msix(struct pci_dev *pdev)
+{
+    int rc;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msix_pos = pdev->msix_pos;
+
+    if ( !msix_pos )
+        return 0;
+
+    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
+    if ( rc )
+        return rc;
+
+    if ( vpci->msix )
+    {
+        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
+            if ( vpci->msix->table[i] )
+                iounmap(vpci->msix->table[i]);
+
+        list_del(&vpci->msix->next);
+        XFREE(vpci->msix);
+    }
+
+    return vpci_add_register(pdev->vpci, vpci_hw_read16, NULL,
+                             msix_control_reg(msix_pos), 2, NULL);
+}
+
 static int cf_check init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
@@ -709,7 +736,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
 
     return rc;
 }
-REGISTER_VPCI_CAP(PCI_CAP_ID_MSIX, init_msix, NULL);
+REGISTER_VPCI_CAP(PCI_CAP_ID_MSIX, init_msix, cleanup_msix);
 
 /*
  * Local variables:
-- 
2.34.1


