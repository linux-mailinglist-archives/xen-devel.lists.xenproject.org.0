Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C993B1ACF4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 05:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069927.1433639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8gG-0001lV-Sg; Tue, 05 Aug 2025 03:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069927.1433639; Tue, 05 Aug 2025 03:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8gG-0001iO-OY; Tue, 05 Aug 2025 03:49:40 +0000
Received: by outflank-mailman (input) for mailman id 1069927;
 Tue, 05 Aug 2025 03:49:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSY8=2R=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uj8gE-0001CQ-Bq
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 03:49:38 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2414::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33d5b923-71af-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 05:49:36 +0200 (CEST)
Received: from CH0PR04CA0058.namprd04.prod.outlook.com (2603:10b6:610:77::33)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 03:49:29 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::d5) by CH0PR04CA0058.outlook.office365.com
 (2603:10b6:610:77::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 03:49:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 03:49:29 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 22:49:26 -0500
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
X-Inumbo-ID: 33d5b923-71af-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6ACMIboQsBgAHQvjEcLiR4h1EyOmuRdMryC1wDKc+Kuu6UhQwXU2U5m03CM3MrtiduOSawAnD7SR3dzyddFTSAqcFET4Vab6/MOLv/mrbcgGgYFH6Yn4U5Q15Y7aEVDKToG+l4A1amRFQDJoJ2auYEF1j0mKY4F2oGc0yUxAydqYOujhRHwO2gM6qkT1icXLrwGU+ghxe6QgY7iEhe8RjX6XW4SIyRM4quBMKgacx86uJZNv2TitpQDfnzumgmt/IFP9p7rc6P6ez6whDR3XTaHxo0Y81J3Cad+8BzZYaKXt0G3yq3DHjanLIh7/THDXGlAYkdWrsZkVpCq5lA8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZ6v18K9cJB5wFL8mBfFs9Yzg0CEIpTPfdJbjTkhztw=;
 b=QrJLF5GfEPKmfpCBTmx9KrFbHH2HD7ctLryB8QZq8oclv3Kue6J/63zujOtQcJqcXnFXMasZrSNj221/F1Y54wQukcAqxSb2FGifTZmQzZ6tXCd/kgxx6JcJhYePP5CECcaCb4bBV+oLQML9Ry05702V9Q2I0xBfW/nYHYo+OrZCJYNRR/ITLKLZcqSyZG6v7zVQus+DtfFvg+dz9HX3uP4GDyvv4rNrbLdY4Q+OiMym6h5dVVKXnSBmbMTlqJ+8iEx/qAV8nKvCR1BbvvyJYIPAB/mkSCVm70QX97w3laVG/1QWOGqM/j4coE4fduHaDkfVHQtSPQZ2JNUMjcW/CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZ6v18K9cJB5wFL8mBfFs9Yzg0CEIpTPfdJbjTkhztw=;
 b=DXc9MjBso1N41ZHYbDuN7qrtSxosjDuyzu2aPsVt/mssUJYXqD5C0N78HizK2qt0gzdHkd0gk3bkPZqdkuCMrS20hBuxEcdEMkTW6hFWJrzqwVwrExRyjRBikAkx1/qnwg7P0Ys6vyx9NAw8V+I7p3l737Z/1wbCO8gunA8OXQM=
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
Subject: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix() fails
Date: Tue, 5 Aug 2025 11:49:06 +0800
Message-ID: <20250805034906.1014212-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: ddcd4363-4ae3-4df1-a19c-08ddd3d314e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDJtdm5ETDk1NHNnK25XdkVHZmx2cmdIeUNDamxoNmVhMU1xdHR2VHdQQThJ?=
 =?utf-8?B?TmZXam85RU90ZmlKTWh5Q2p1dEhpU1BqKzdicXBlTzd0Rm5nYkxVYXlFU3Rh?=
 =?utf-8?B?R1ZXQ2FVVVRlY2d2UkxGaU9PK1RrNVlXdWFpcmdweWtmaTZac05YWFNJMVFY?=
 =?utf-8?B?OGFtTFhXUFFGM051VG1zVUVBNmo1ZnJWd0ZVYVFNajdIN3FDb3M1ZWR6NEpS?=
 =?utf-8?B?aExqa1pTalltVDI2NEJuaE1xVTN5c1BFNGFhblVVWHpZUDl6NnpsN3hjWllI?=
 =?utf-8?B?ekdDRFIxM1dnbVJTaVlVbXluajVCZ2Vmc1ZIWTQ4SGtTVjVSSlZqOW9vdDlY?=
 =?utf-8?B?MlJFZUFWZHN1NndRbTVKV2NaVFdtaDhtVXlHZWMyY0htQ212VmdMWko4Nmc4?=
 =?utf-8?B?REFCRjBhTHZ5dkhrMHlYd3VPcXVkYzNic05SVUN1MzFwSkpOVE5nZDRQeWQ4?=
 =?utf-8?B?c3VVNGtGdEhUNm56emRxMW0vNFpRalE5T1JaemRWenV2RDBpTXJlR2lhdXRm?=
 =?utf-8?B?WHMrY0JkRmx5NiszQktGSlpUc0E5QW5IN0s5eXk0cERMclVNbC9xaHJsclZn?=
 =?utf-8?B?U1BPNExXdXVkSjNWZ3VjeTZVb09pVGFwTmFud0g1OWpXSHd3bFJ2bXJpZlVZ?=
 =?utf-8?B?YlNRSEpBR2N5ZU5HcGtrUitzaUUxeGdZcnlnRFVFczNFNjdiRUY1MC9Kd0Yx?=
 =?utf-8?B?UHNqVS9Oc0pBRkFDelNGNVF0SkduSWpVc1cyNDR0Ni8rdXkyUlVkdHRuVEho?=
 =?utf-8?B?RWpOaHJEOWxpYWZCNnpFdnk4OG14bFBtSkpuMFE2TzZDbGlCY2d6dmc2anlQ?=
 =?utf-8?B?NTNEeXF0K1dlSVRiYUQxa1FNVTc5SnJSWE5oTnBEZU5ZbGJSZ1VBV0I0Mmd0?=
 =?utf-8?B?ZTB4cW1UR1orTE5RTFFVVGpHd1NJWWZNdTJFOGk2S1ZNaXhEemE2eWl2c2lM?=
 =?utf-8?B?dm1nNm1tSWtGM3FtOHp6TjJGZC9IRTlHdnpneStWWkhSTVZsK1NsSFZhNlI0?=
 =?utf-8?B?MWdTZkp3UHErT0FzOWpwcHhjWjZ3ZmV6VWNTaEZkVXlhOWpkaGhYeEh6eWVP?=
 =?utf-8?B?ODlWczd0aTRqbXRQZEFOMDlOVlkwNFlUbFhpNDdQUllpeUUyUVh3Z29QOVNm?=
 =?utf-8?B?bVM0R3ZoTzdFUSt4WHRvSmo4Q0Z0a1VsS0w5eG4zYUF3OGhwTFUwVmk5OVRJ?=
 =?utf-8?B?WXo1b2lzQ0Nmd0p0bHBkU1g2ajJocjVJUFdkcC8yd1lMOVZaL3MvNkhZUC9z?=
 =?utf-8?B?SW1vQ25qQk51eXJzUjg3dk1NN216WjMyUGhoc254SGlUUEszNU1CQ0xva1lW?=
 =?utf-8?B?eWU2UHpIaVhZWStBV29JbHI5MVo5YkpOeDRnNi8xTlZzOHFqRFhoU09hRmNp?=
 =?utf-8?B?ZW94VktadSswbHdqUW9yRFV0RkVtYlR1eTBEOVpnMGRDNTQ5ZU0xU2VPOHpC?=
 =?utf-8?B?Njh0UG9mTVl0eWYyUUk5cXdOZlF6RUZmOTlFZFlOa2ZXRXVQaENya1owQXhU?=
 =?utf-8?B?ZlQ4MVU5MTA2dmJYNGtWSGY4RE4zS0NEQlRIYzBDMXJtamJ4aTgrdlNRTVoz?=
 =?utf-8?B?L21jM2tNQU5RN1ZEZlpXdTdkWG5xS0szZ2Q1SWtROHpRZnlNLzc2dlBwdVVG?=
 =?utf-8?B?RU5TMVFRdXUzRmN5YzBuY0ZQZjlqT2RYMEpxTGFnSTJNUTRiRnBLOTJzazA0?=
 =?utf-8?B?RkRQVm5BRVdPL0pxWFA1dkxvMUsyMHowZmJIUnI2MlZEMUI2SUIrNm9IcS92?=
 =?utf-8?B?ckRtVjlFYXRyWEdEaHlDa2lQTFB4Z29HT2FkS1BSZld0VjNIY0hWWjk2K2R1?=
 =?utf-8?B?SU9UL2dhc0JJeHVjcnZWd2ZzRVJFRXF3ZmVwbExBT1VjZjBTQzRJdHUxNlpZ?=
 =?utf-8?B?eGdITWtoaDVwWHBLNWZ1TnYzNWFOVlhQazc1bW8zMUp5cDJzZVJUVDA4WmZq?=
 =?utf-8?B?MGsrcU9YZWFHVnVaT3pIRjhibEdicGpxTENVcWNjRDNoOUdRRURYOTNhN3dK?=
 =?utf-8?B?YnZSd2I0N0h2MW1lTjJxMzEzeW10N3pvaWpXajdXL200ZUNTWjEwdG5MZDdv?=
 =?utf-8?Q?nV6dyS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:49:29.8274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddcd4363-4ae3-4df1-a19c-08ddd3d314e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652

When MSI-X initialization fails vPCI will hide the capability, but
remove of handlers and data won't be performed until the device is
deassigned.  Introduce a MSI-X cleanup hook that will be called when
initialization fails to cleanup MSI-X related hooks and free it's
associated data.

As all supported capabilities have been switched to use the cleanup
hooks call those from vpci_deassign_device() instead of open-code the
capability specific cleanup in there.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v9->v10 changes:
* Call all cleanup hook in vpci_deassign_device() instead of cleanup_msix().

v8->v9 changes:
* Modify commit message.
* Call cleanup_msix() in vpci_deassign_device() to remove the open-code to cleanup msix datas.
* In cleanup_msix(), move "list_del(&vpci->msix->next);" above for loop of iounmap msix tables.

v7->v8 changes:
* Given the code in vpci_remove_registers() an error in the removal of
  registers would likely imply memory corruption, at which point it's
  best to fully disable the device. So, Rollback the last two modifications of v7.

v6->v7 changes:
* Change the pointer parameter of cleanup_msix() to be const.
* When vpci_remove_registers() in cleanup_msix() fails, not to return
  directly, instead try to free msix and re-add ctrl handler.
* Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msix in
  init_msix() since we need that every handler realize that msix is NULL
  when msix is freed but handlers are still in there.

v5->v6 changes:
* Change the logic to add dummy handler when !vpci->msix in cleanup_msix().

v4->v5 changes:
* Change definition "static void cleanup_msix" to "static int cf_check cleanup_msix"
  since cleanup hook is changed to be int.
* Add a read-only register for MSIX Control Register in the end of cleanup_msix().

v3->v4 changes:
* Change function name from fini_msix() to cleanup_msix().
* Change to use XFREE to free vpci->msix.
* In cleanup function, change the sequence of check and remove action according to
  init_msix().

v2->v3 changes:
* Remove unnecessary clean operations in fini_msix().

v1->v2 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msix.c | 44 ++++++++++++++++++++++++++++++++++++++++-
 xen/drivers/vpci/vpci.c | 30 +++++++++++++++++++---------
 2 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 54a5070733aa..3aa271445d12 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
+static int cf_check cleanup_msix(const struct pci_dev *pdev)
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
+    {
+        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+        ASSERT_UNREACHABLE();
+        return rc;
+    }
+
+    if ( vpci->msix )
+    {
+        list_del(&vpci->msix->next);
+        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
+            if ( vpci->msix->table[i] )
+                iounmap(vpci->msix->table[i]);
+
+        XFREE(vpci->msix);
+    }
+
+    /*
+     * The driver may not traverse the capability list and think device
+     * supports MSIX by default. So here let the control register of MSIX
+     * be Read-Only is to ensure MSIX disabled.
+     */
+    rc = vpci_add_register(vpci, vpci_hw_read16, NULL,
+                           msix_control_reg(msix_pos), 2, NULL);
+    if ( rc )
+        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+
+    return rc;
+}
+
 static int cf_check init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
@@ -710,7 +752,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
      */
     return vpci_make_msix_hole(pdev);
 }
-REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
+REGISTER_VPCI_CAP(MSIX, init_msix, cleanup_msix);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 91d40be5bc4c..ebc4fdcd2600 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -321,6 +321,27 @@ void vpci_deassign_device(struct pci_dev *pdev)
                     &pdev->domain->vpci_dev_assigned_map);
 #endif
 
+    for ( i = 0; i < NUM_VPCI_INIT; i++ )
+    {
+        const vpci_capability_t *capability = &__start_vpci_array[i];
+        const unsigned int cap = capability->id;
+        unsigned int pos = 0;
+
+        if ( !capability->is_ext )
+            pos = pci_find_cap_offset(pdev->sbdf, cap);
+        else if ( is_hardware_domain(pdev->domain) )
+            pos = pci_find_ext_capability(pdev->sbdf, cap);
+
+        if ( pos && capability->cleanup )
+        {
+            int rc = capability->cleanup(pdev);
+            if ( rc )
+                printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
+                       pdev->domain, &pdev->sbdf,
+                       capability->is_ext ? "extended" : "legacy", cap, rc);
+        }
+    }
+
     spin_lock(&pdev->vpci->lock);
     while ( !list_empty(&pdev->vpci->handlers) )
     {
@@ -332,19 +353,10 @@ void vpci_deassign_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
-    if ( pdev->vpci->msix )
-    {
-        list_del(&pdev->vpci->msix->next);
-        for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->table); i++ )
-            if ( pdev->vpci->msix->table[i] )
-                iounmap(pdev->vpci->msix->table[i]);
-    }
 
     for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
         rangeset_destroy(pdev->vpci->header.bars[i].mem);
 
-    xfree(pdev->vpci->msix);
-    xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
     pdev->vpci = NULL;
 }
-- 
2.34.1


