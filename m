Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8B9A94C84
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960849.1352591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVS-0007uj-Az; Mon, 21 Apr 2025 06:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960849.1352591; Mon, 21 Apr 2025 06:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVR-0007l3-Vv; Mon, 21 Apr 2025 06:19:49 +0000
Received: by outflank-mailman (input) for mailman id 960849;
 Mon, 21 Apr 2025 06:19:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVQ-00057v-Rq
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:48 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2413::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f9304f6-1e78-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 08:19:48 +0200 (CEST)
Received: from MW4PR04CA0386.namprd04.prod.outlook.com (2603:10b6:303:81::31)
 by SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Mon, 21 Apr
 2025 06:19:44 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:303:81:cafe::2d) by MW4PR04CA0386.outlook.office365.com
 (2603:10b6:303:81::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 06:19:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:43 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:40 -0500
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
X-Inumbo-ID: 9f9304f6-1e78-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/tnlSbusmgWhh1SHg1Ib4v7DTB74/8FhjbjZu25kKt+iiNctGfZKG+1oiTSO4f2o/fRZxIm4kv6/AA79jXQqn6zVEFXEHu3czFnxwA9kkn3g8HaYH84ReneGdoJOssXyHpnBDsVvsdEcZ2SyIBSC3OXsJD4OuTCFamUiuotJ1J0m+FVLEjMUb6YR6YvO0Ji94uaMYxcH68UlIV/vibwwC8hIVsocWQ80YEWzCz2jVQ53U+YMjKmgKmmAwQUG7OqkjXsEaos57bW804AzZ9+HbynKSxHvP4VyKXyzs0PC1p/xCuWJ1+6U0B20YA40SDSMeqmqwBzaLWq2NzbmxJtEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxL1V2Itz6NoD7DRvN+OfCh1LknThOBHHwX8mxG5dWI=;
 b=v+fw5O0ly+TDb0jEyKNIfn7GI3fp74td4Nyk1At33M4QvvYCcRPdR0OKZtCRhF0wslTtTDjwPth/A0JoSMwjoUfMiyxxh3Ve6uEirBQelGZrwAwDC8QLevR7HArIN0IBYZssdNap6NxphFjJCnMit/KhJUyO9pgTN7+So+SyalPXk/DJxc12l03QdmzJ4GBooXDBQ553eC5D/B6I0IqqLYz6UnxuJTcCKfXq4iKsmULo54m3gsV+uWisxFmeH1hcgqS+6UxLWjykHcREvq5WwOVY762u8xdS80lMZhsR2JKMQfhjYqqhV+KL8aYwJQ9Vch5OO7VwrKMV9zCTXfDNQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxL1V2Itz6NoD7DRvN+OfCh1LknThOBHHwX8mxG5dWI=;
 b=HKfuiDvf5oxhIBUs4XbhvMcf0mE4mmKfcTyOHSf/F8qTrG96JoRfwwWDvwnMVAWTz0X5afGBXwLfwjYnW3DxJqLikRoYHg+XPUXotOBvkbNl5N+MRj0WEELuzA+VjVd//p+ScAZSn96GnWSopbTAhnqJY3M9kNW0L04gC2cyvvs=
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
Subject: [PATCH v3 11/11] vpci/msix: Add function to clean MSIX resources
Date: Mon, 21 Apr 2025 14:19:03 +0800
Message-ID: <20250421061903.1542652-12-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|SN7PR12MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: ee384c0c-4627-419a-521a-08dd809c81a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2NPcnB0QWZrbGFLNXQzeTcxOTdlNkI2dThEcm1qbE9BU1cyRG9USzRrblRy?=
 =?utf-8?B?bGNISnBMWEduN1FHa1BLUm8rdUlJVFB4dk5nVFNFZEpTZzVqa1pQUXNmQnZZ?=
 =?utf-8?B?dVptclpiQ2pKakVIZWVsUG54MGlBazY4T2hMMnhJS2pVSkt1Q3pmSWNGRWJX?=
 =?utf-8?B?RnF5QUp2aUNKUmE4cGVqU2g4TEdDa3ErbVlxY09seXBkcGxkUkN4dWt3ZXY1?=
 =?utf-8?B?VnpTMnlxSEc1YmpJQmNFVmR0VkswV05yRWs5R0k5aFNJV1hVdW5idXprNWtG?=
 =?utf-8?B?YWEwK0Fjb3M3TmU4WXBOaE9kTnBMOSsvQWlkY3c0U204NHRsL2pzMXdSUys2?=
 =?utf-8?B?RkdHaXN6SFlUc2xXNHlZblVFYUk1QW5HMzNtVE0zWldRajBUVnY0TmlRVzIy?=
 =?utf-8?B?dDU5eVA1QnBPUS9Odldkd1BmbTJDaDhxZWpHS0RNTzJEVUVFR2xBS0ZSbUNr?=
 =?utf-8?B?QzBjYTgxM0cvbnRrS3NoeEpCMFdld0ttajMyUWRuQVkvNVRCM0tNZ21TR1Ix?=
 =?utf-8?B?YUxSWUlRZmxpUzdxTHV2Y1BwWjNDd21PWkVwVjVDUFh6N1RJa3VzSmZ1MStu?=
 =?utf-8?B?aWdoOEs4ZHJLSEZWQlJ1cEpuYlZBQUpkMHVZZlhxeEUyUmZpWklMR2RLbUdM?=
 =?utf-8?B?NmNJdFZxbXl3bjlNSzh3a1lWa0UwcDNKMWpiL0FPU2lFRDVjSlVvZldHNkRa?=
 =?utf-8?B?MzlmNndScTQybWtIN01iZHkrVnZ1bXhRZ1NCMHRLZzdvZlFMUFhyTjVNRlZI?=
 =?utf-8?B?cnAxVkloQ2U3OUoxSzcxVitNNTBvd1Z1d2Q1b0lOdFU4TlJlNEVFNHlJS21o?=
 =?utf-8?B?ZmxDejVtd3lvTC9UelV6SDZycFRlRVhFd2o1ZE9hWmxOVFZWNDE5SEZ2c1V2?=
 =?utf-8?B?ZTkrNXBTUlRjVy90S0NMZUMzY1NJZUs0K1ExVS9IcmRuUkdaWVJTMGY0V0o3?=
 =?utf-8?B?SnRkbjhrb3hBeTRhWEJaMVNrNXZ4K1FNaXZtYTFSNUVNVnUxZjVQYVkvMWwz?=
 =?utf-8?B?MmwzVE9FaFlKMVZLazVBS08va0xjbTl4SVo1R280WWFRTHU1Y3FPVWxjaUR5?=
 =?utf-8?B?K21QejZtaEg4TERpZmxEK1ZFMHcvbjNHRW9WV2hyM1J3dHJnQTZwU3JFbGF0?=
 =?utf-8?B?S0ZUNUk1RGU2bUpnTUJ1dk1kbDFnN09tNFVSU1BDR2FNV1h1K0RFbVdsMTNS?=
 =?utf-8?B?TnBpdXNQVkFaVG55REFlVm5YaGZjOWlHNnd6M3BOZWM3a3NCOEtWOHpPYW5E?=
 =?utf-8?B?alh6YkhyOGh2VlgwS1hVaFFHZDB4LzVUN2lyM3gyODlqS1R5Ulg2VHhGNXgw?=
 =?utf-8?B?aTd0WWRHaXhpVU9oZWlsWkFiTDhTdE9hdXVRNnoxc2FySUY3eHhhZitOdEVj?=
 =?utf-8?B?S2o2dUhiV0tsK2tadHJ6L0RvcUJaSHVsY0lIN3NKSGZOU1dFek5WUW5NSEor?=
 =?utf-8?B?c0NQRUJuT25tNnZuYW9lWDB5Z0Z5L1VFVyt2NitwMUh4bFZhYy9nckE1S1Ex?=
 =?utf-8?B?aTFxeGFNMFNDZFB4RUp4ZFEzbnFIVHdjVnpLdDVvWHM3RjlvVFJjNXVESCtZ?=
 =?utf-8?B?Zzg3TkVQRjY2SWhiY2NudWpRTUtRQTYySGtBYms4Qjh1TkhaTGVnald1QUZY?=
 =?utf-8?B?L1BTb1ZPWWVheXZSVzBtZVNwQlhwRzJoU0JJQkFab00xNkUrUWVJSzc3NFUv?=
 =?utf-8?B?Ui9JanM0OWhRZjR0RFFiVC9BSmkwL1RTTVNyanpMblZpQm93ZUY0d2hDNUw3?=
 =?utf-8?B?ZzdsMDJZMXRNUnZRNGNrdFZ0VjEzSHNSZHBYSEg5Nzg5bzRYbndOamYxbmtK?=
 =?utf-8?B?RjBJNWFYbVJUeWwxV2ZLWEZtMlFINWlkQ1BSdUR0Qlh4LzExNjBVakdSQWhr?=
 =?utf-8?B?cXdXTjlnbEt2SUQ3cVVIYzRRWkl4Q01ldWFNOHdWVXdReWU0WkpueGxCcU1u?=
 =?utf-8?B?T3dlT0k0dnpEM0NxdFZMb3NXSDU3YzIzZGhXZDJ3dWYyMC9xL0xZNTk0TExj?=
 =?utf-8?B?QVhMSDdodndFbnRWRTM1TE5COUs2ZjFtOW96WXYrWHl2V0RCYUdybmI5U1pG?=
 =?utf-8?Q?keOb9w?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:43.3551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee384c0c-4627-419a-521a-08dd809c81a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839

When init_msix() fails, it needs to clean all MSIX resources.
So, add a new function to do that.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v2->v3 changes:
* Remove unnecessary clean operations in fini_msix().

v1->v2 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msix.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 0228ffd9fda9..e322c260f6bc 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -703,6 +703,25 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
+static void fini_msix(struct pci_dev *pdev)
+{
+    struct vpci *vpci = pdev->vpci;
+    unsigned int msix_pos = pdev->msix_pos;
+
+    if ( !msix_pos || !vpci->msix )
+        return;
+
+    list_del(&vpci->msix->next);
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
+        if ( vpci->msix->table[i] )
+            iounmap(vpci->msix->table[i]);
+
+    vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
+    xfree(vpci->msix);
+    vpci->msix = NULL;
+}
+
 static int cf_check init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
@@ -757,7 +776,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
 
     return rc;
 }
-REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix, NULL);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix, fini_msix);
 
 /*
  * Local variables:
-- 
2.34.1


