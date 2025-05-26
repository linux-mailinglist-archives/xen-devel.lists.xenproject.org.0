Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A6AC3D35
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 11:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997354.1378327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPr-0006OO-8w; Mon, 26 May 2025 09:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997354.1378327; Mon, 26 May 2025 09:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPr-0006Iu-1O; Mon, 26 May 2025 09:46:43 +0000
Received: by outflank-mailman (input) for mailman id 997354;
 Mon, 26 May 2025 09:46:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qdiq=YK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uJUPp-0003hH-6E
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 09:46:41 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2009::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 527b233b-3a16-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 11:46:40 +0200 (CEST)
Received: from BL0PR0102CA0027.prod.exchangelabs.com (2603:10b6:207:18::40) by
 CH1PPF931B95D07.namprd12.prod.outlook.com (2603:10b6:61f:fc00::619)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 26 May
 2025 09:46:35 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::93) by BL0PR0102CA0027.outlook.office365.com
 (2603:10b6:207:18::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 09:46:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 09:46:35 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 04:46:33 -0500
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
X-Inumbo-ID: 527b233b-3a16-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmgZEmrcDTqPmcvlYDCxSSxtBFhRAegAkgVpuX/L5WS4ELCI0XrwZIaf0rwq+VuXN/s/6lqD1WPwSVIaN/NadlXTelZjnufctCfnEOke1FogHrkUUPN5fb1+yvICX8oRYyTQ93pevc+chm0Ox88EWEoGsHjxJrkHVdhpP9C5lPhM638aQQmpYY9JNx0iD4L4QI6vx+MbiH1945+3xaUBuSVbn+D5Gsm0+lJlubi0a974E8qYfzDP5JL65X0j26pF4FocM8FP+idywfkvdezz4npKhlSoSSGY4H5GVJUwXLfD2GhW0h9RHbeMNss35DHXP58yepAb2pJQoS5eHxtvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUJWfL2DY49Egk7Lf4LkxsuGcBQxC7mWhWoHagyWnjk=;
 b=vi0Dvoe3iBTq/IDVPnLD1SnB/dLAq2BJDZrWKsZVjHs51XJx/k9cXwl6ubItncVjgwoJ/EEQH5u3ns89vfVFirQpyw/lncID0Z/guxBFIb4ftSrXgWy2O+TVbvsBkZjPrxVE0g+tEWIKDJxrJBDraA5h1rb+l5kX0/6IlGSRzDHGpld7UBYREwJGksVe4MQjqBbdZJTygBkvVXqAzvCs4VV0uksskMZfZZbmWGMoJK/8DOl8lNleDpWmTOTcnVV4Muao9r7ZJh0MgZgrfXDqG6lMhgptEy27i11kqo4rv6voGHFSSplXYZbWzdCjNCzsn9X1zZ0pV/ZLbixMZdv/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUJWfL2DY49Egk7Lf4LkxsuGcBQxC7mWhWoHagyWnjk=;
 b=X3E/pPG1QHTm+p7JgW5sT2Av3IxCBrRkdDTsqTCVAcykp7K1OML2EymjVs5dvmNrimdA54BHEjb8Jky2RP0fV3uh7keEZEH/ata7fnnr01EgB7Lotq1ZeokK6L7I5An1RXh0ZHbeUph8P+0dWRfpnA1gIs4ZyIDjCKDBFbgF/7o=
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
Subject: [PATCH v5 10/10] vpci/msix: Free MSIX resources when init_msix() fails
Date: Mon, 26 May 2025 17:45:59 +0800
Message-ID: <20250526094559.140423-11-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526094559.140423-1-Jiqian.Chen@amd.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|CH1PPF931B95D07:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a88e34-37e9-45b7-4b49-08dd9c3a3409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REk2bHFEWURVZmRYd1FYWkVrTFJuVzdqWGpMOEF4N2QwZHZtRXdDc1ZvVVpG?=
 =?utf-8?B?S2RvMW1LemtuNDVPRUQ2ZWUraUk0V2VRTlY5bm50U1RRVkRKNWNXOFBNaHo4?=
 =?utf-8?B?bjMrYi9BRG9VWDJWaE1Ba3VhM1N2VGpCZllqcGlWWWNDa3ZScENuUi9SRjhB?=
 =?utf-8?B?ZnhEZzJHVWcxbWk4S0tuNlFKMHZ3MGdDZHE5S3dCNWgwaWVVM3RWOWtFd0o0?=
 =?utf-8?B?c212WjJYTmpuTVEvc1pqY2tKR21FaElycE5xNUF3UHcwcEFGcjNsMk5CV0t2?=
 =?utf-8?B?MVBEMkRPaXJZRDZVTVNzbkJ3bm1LdnJYUGdXV25nMkFQUzlIdWJnVEhjZXJu?=
 =?utf-8?B?czl6eGdlY21EZldOTU9iUzNUV2RUTnBnc1hXcUNuUjZ1UkxCemtucjdRU29y?=
 =?utf-8?B?bG5IMndha3plMzdDK2ZZZUpoM1BjWTBEbjNUdUNWcys0bkVDS2RWYmpieEZ1?=
 =?utf-8?B?TkhaSEVteno1OU9xbk9uekVkVklvQVVVbWhzL28zdUk0ZmVtb1FJRnpEN0VZ?=
 =?utf-8?B?eW5DUGQ5NHFSZ2F1QllmamxJMlk4T204M1N5cFczeUluZ09wRmpmN2tXUElz?=
 =?utf-8?B?MllSSUE2OEY1eWpKWTBHaWFZbnpqQ21qR2JmS0dQUFlsN3RZSnpDRGJucHNz?=
 =?utf-8?B?UzFnQi9tVkRiWERVbDJTSTNMV29mdndubWowNVcwRGh0SnhpRmpzV1ZYa2RV?=
 =?utf-8?B?eitSdGU0eWw5TFRpdVp1Y1ljdWtMZi9jUHc5UVcxR29zcjVnNWRtemZkNmNn?=
 =?utf-8?B?d1k5TDNUK1IwaGhiWkpIRkJMSEx6bVJwa01yaEFZUmk2QTJyVXdlMW5EUm1S?=
 =?utf-8?B?QjZKWXd0QXhmQnM4MDl0ekVKVlpoV1pqS3RtcU9HK3E4U2V3QVRHaVNDODNM?=
 =?utf-8?B?UDVKQWJoaXZrNUp2eUd6ZDdQbmFVSGhVcHJQQml0WHVkUEw0QlgwVFI2NDEv?=
 =?utf-8?B?RmVJOVZya1dyb0M2aXRZbHRtd2VJN3Vlb3pQLzNnL3JFdS9EUEhWMm1KWm1z?=
 =?utf-8?B?dUVMRXptSzl6UHM3cVV2RSsvQTZPYzNMNVAyUzZ6QWZvN1VzUEZDV1AvZHBF?=
 =?utf-8?B?eis3bnBZZ3RPdHNXbC9RZmZxU3RRQTczd1VZSlFudFk5ais1d1QvQ29PQ3VZ?=
 =?utf-8?B?V0dxazkvUHdsWW9YM1FtYnp2amVIeDlJMnpCQUhmYUY5UW4wTnFiRjdqa2hU?=
 =?utf-8?B?c2tRL2llRUZISDJCT1ZhcitlQVpLTEFKZjAzc2pqZStmdGZUT3pkZDRHVlBq?=
 =?utf-8?B?VHFqRFJ1UGxjN29PRDNvYkNhWU1PckZONU90TnVYRnFmN2xPeFJxdEJuTklv?=
 =?utf-8?B?YXgzR2t6YlAzQTEzY0t4cmY4aTJMN0lGSTFPNThGZjZja1BYcTRKMEVjUm5V?=
 =?utf-8?B?TFdxazNxVlh3ei9PTU4yemQxVVppZitKWkgxZTFWc3lhZDhtMlpSay9LKzBq?=
 =?utf-8?B?OG5DZ3RVbHFIaTFESWlaYUlrNXFSZVd6dmJmaEtLZGNmT2F3S0RhdGQ0RVNr?=
 =?utf-8?B?VDd3czUxb2duakZrS2ZDak1xQnJCcTZIM2EzcFJaeWhGcWxLQytBbkdWamRT?=
 =?utf-8?B?U2xaTDVsc2NTQkhIZTNzYjNCRmoxZ2pRK1VUYkVtaHoxQmpJQWdZb29VU2hR?=
 =?utf-8?B?Uk1jSG8vWDAvT29TZnZRY09pTHBMQkgvVWEyaGF4TFZmY1hIL3dBUGg3eGt3?=
 =?utf-8?B?Ui9IT0w1bDdQbmtWVGsySnorUXlmKzlzY01TYjZWUjIzY2w5TnI3NXZwSXV1?=
 =?utf-8?B?TlJMK1ZHTC9ENjhienBjS1FBYkIvUmxRODBZOWxoMGtVNHlqSVlaa1ZsWW9n?=
 =?utf-8?B?NEV6cXZ0WDh2SmVoSlhxTGpLVmw4RDZkaEhoYVg2V1g5YW1QQ3J5R2hjUHhX?=
 =?utf-8?B?ak9zS0U4S0JCTTI1Smd4WjdPeXh4bGd4SmhIT1A4ay9rS2h4SWlWYlZ6ZXdL?=
 =?utf-8?B?VWJmRGdWTEl4OFJ5YmJ2UjNWdTNCRGZnQkpEekRtMmxhcDJkdzZLbEhqYkdE?=
 =?utf-8?B?cnMxNlZOSU5MVzFMR3hPR0I2aExia1VqOGZ3WnlrcDBPUGZ4NGk5MUdweHFW?=
 =?utf-8?Q?d7djrV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:46:35.1103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a88e34-37e9-45b7-4b49-08dd9c3a3409
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF931B95D07

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
index 674815ead025..cf79320d3b6f 100644
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
+    if ( !vpci->msix )
+        return 0;
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
+        if ( vpci->msix->table[i] )
+            iounmap(vpci->msix->table[i]);
+
+    list_del(&vpci->msix->next);
+    XFREE(vpci->msix);
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


