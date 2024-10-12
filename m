Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B999B232
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2024 10:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817546.1231514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szXlB-0006hU-PE; Sat, 12 Oct 2024 08:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817546.1231514; Sat, 12 Oct 2024 08:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szXlB-0006fQ-MV; Sat, 12 Oct 2024 08:46:01 +0000
Received: by outflank-mailman (input) for mailman id 817546;
 Sat, 12 Oct 2024 08:46:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A068=RI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1szXl9-0006fK-Vj
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2024 08:45:59 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2413::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65987451-8876-11ef-99a2-01e77a169b0f;
 Sat, 12 Oct 2024 10:45:57 +0200 (CEST)
Received: from BL1P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::13)
 by LV8PR12MB9207.namprd12.prod.outlook.com (2603:10b6:408:187::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Sat, 12 Oct
 2024 08:45:52 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::87) by BL1P221CA0025.outlook.office365.com
 (2603:10b6:208:2c5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Sat, 12 Oct 2024 08:45:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Sat, 12 Oct 2024 08:45:52 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 12 Oct
 2024 03:45:49 -0500
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
X-Inumbo-ID: 65987451-8876-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLG0CGloQvmW6SPVavu1bsw0UWIMORg6qM7rhSVMZTsBetSp4cMS93KK2Lv2UOh4m7lMYR7Zh8mGirejVDWAzuc49aiIk4thkIy37Dlmh92BDyOKocqP9FvLiTWs2vpKm6DESUhNIusPj2I90wwdHkeTnk2+WZ8iONvORYES2VN44s3CY9gRifnrvv9rO1clBKRrWLAIolKXxgC3mybRQcGApkwFT5/D3/kI92z++K2tdWtyZtAM4HfXGYycrpJ5qFis7slrVIEpB1ZX2+e7/5QiqkMJ+SfkIdM3bCZC+TNDxAeypfch4VvZf6caKz6C7BvLHmRB5hWxlk868/2ulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UT/oYS1Wwv3bjSDXYguTDvUQXv68sE1Cv4Nd/unyHw0=;
 b=oMWDbvFvyqZs0VCHakKeIT2BZ7nCn8XTgTFpUiyv+mmzqWZU1lIH2iUpp7Zfrs9GpJpmjYsjhW3DEqdvqowRqReusHQ91CcZYiP2ZPZdI3zu2+7bBHD6ryuZEtJsG8x9UOnnMpv3VKVmFFDSfQl/N8ohSanHXXu8yIca5tFxIW6tvV+IDdfCfHwDhOTwn+Ebkr/IYT+XF7laXd8c1Ud0AJqVyG7iq8HFc4Q6lgU1KSYZ7iXimOvakDTV3jNfpZd6zJswYyyCt6N/CaLjf2NNsGyJEsxIAArFkEItpaluqFKKYjpADaD8YOOlj/bSl+Wp7WCKTcUCZo3tT4k6c4g0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UT/oYS1Wwv3bjSDXYguTDvUQXv68sE1Cv4Nd/unyHw0=;
 b=vudtW7dhWj41ppa7/TDo0A+23jGtRedq2hI3IDMkshBcBkORNFT2Pb3UIx9LprJou18k5KCyuxfdTuvJ78XsM4lcjHYS3rYxjv4QtjUES35mVmSuDOmGtLHeIMZZ6T45dV+S1i1e2njLGDWM/jVyfitoTh81RQIaJiXp+DPYL6M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [PATCH v4] xen: Remove dependency between pciback and privcmd
Date: Sat, 12 Oct 2024 16:45:37 +0800
Message-ID: <20241012084537.1543059-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|LV8PR12MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ac18ba-d928-411b-cbc6-08dcea9a474d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cS9ORHR2ampUOXJ4UEFVZGo3M3hGRWtTMzdoRWlEUzZXaFdMa0NGQ2ZONHdq?=
 =?utf-8?B?Ylh3d09yMWdRTHBZNDhhM0pwbEFZVk1kWlk2V0JiMXZqNDNQakdxUkNlcEdK?=
 =?utf-8?B?K3BESXZGZXZZQUExZ2hWNzZZai9LcnlsWGd0UW5jYWxYaTdaRExpS2x4WTQ5?=
 =?utf-8?B?V1I0NTM3U2hFUGtOQVNJaUF3UkF3V2tMZE9GdVpBOUZGRDR5K1FvSUt4NXN4?=
 =?utf-8?B?YWpMOUNnS3c1YldNTnZtbGl5V214Qy9uRE9qUVcrVzZJRXFRUEN1bm9kVDRy?=
 =?utf-8?B?ZWlHV2xJSVp4a0w1ZytPTkF3b0lmUU5sYVVnbk9tOURYMGNIUkUzRXZBeWlm?=
 =?utf-8?B?SzhENmRzYzFrTVYvNHpFT0ZJRU1uTGZxN1BJOUthMmpESzhrYmtTOW9lSFdR?=
 =?utf-8?B?TEJicWVMcEZmMW9CLzVETittRDNqazVDUlQ4eXpyUzIzUkNyUjhQUTNCWTgw?=
 =?utf-8?B?U01tUUxKak1XNW54V0dKRHpHeXZjSUx1cEp6REZxY0MybmVOMDJxaDdnbHk2?=
 =?utf-8?B?bDRsR1NzOTE5Tyt3akFuMjI4K3NJSzgrZzd5NGVpbXFsUjJYZ3MwN2NuZnd3?=
 =?utf-8?B?RURPSGNVMG1tUHQ2WUxZRzROeSs3RnpmT0N2UE1wS0h5TFZReTBkZVVyWlRt?=
 =?utf-8?B?UHhRQ1lsTHk3RmNUWGxRZlhUQmdjRVZSYk4yczlicmZsTGFNNUNGRFcvYm80?=
 =?utf-8?B?a1hxQXhnT015RE5UdWxwNDZHVS9ZellQcnJsRnNiRjkvSG9Wcmk0Z0RtT2lq?=
 =?utf-8?B?ek5tQmp6Ujhoek51UmhRRXIwMDdiTFE4TWRqTUhkdWs1Tm0vWTZ1bU9YazM5?=
 =?utf-8?B?UUpSV0lNQlZFMEFKb0MyYWxpaXE0amZhcjFQRkk4VW5lTmRzeEJBWjFHVTZ4?=
 =?utf-8?B?VEl2aGI0UmlINjJrSk5Ra0taZWExeUV1SVZuYXBEZXdlQVVGeU5sK0k5RE01?=
 =?utf-8?B?Rms3NmtENkNrUTJFaEY3VFFsQjNVWXh0L01PcXpsODRuOVYyMnI5QXU4Z1E4?=
 =?utf-8?B?ZHpXRDUxdHhVRmlGNzN2bmU3T2QzMmZNMWxBWEpSdVFqaEJYS3hiRUxGcXAy?=
 =?utf-8?B?THRqcXVFbWJ1QkNqYS9mOGdFVERwQnhuaFl6NmplaGFwYVBnMnJPZG5WRUdn?=
 =?utf-8?B?djE5RlhjczFuSDczWXNFMjRTTjBNNDhLSE9FMHEyYUc0bFlsbDAzQlZoWFho?=
 =?utf-8?B?NUVDeDNMOC9JUVlQSmpqQjRMQ0JyT2NHM2F1NmVNb1QycnBtSEhnQ2c3OGxa?=
 =?utf-8?B?bkZBbGdMeFJOcXY0L1hpcVRyOExyeVlEdVlZMkFEZ01Zd0NKQ0xINFVsRGV1?=
 =?utf-8?B?THRMcGpDK21YNnRqZzFZeHU5eWdlMHV2cU1Ic2FFcytZYWdpZTUyaGc0MzRT?=
 =?utf-8?B?Mm8ra2JhTUF1ZmRzQ1FDV1RzVTRjWWMrRUljNnFaeUNKeUUybUplTVp6SklI?=
 =?utf-8?B?elZvK2llUDFsY0FXMDBNTE9YYjErZWNNMjVDRU9jMThIRk1xZmRiL0NjZ2k4?=
 =?utf-8?B?STlBRkxGeWdPeTBPUmR1VHpKTjByZ2J6ZEhOWnhGeE8vV1dNVThHNWh0Q0FS?=
 =?utf-8?B?Q3F0YkNHSUUvZEZSTjNWRUEybnhRb2prMmNHUUovZ3BBMWpiUEtUL0s3Sk9M?=
 =?utf-8?B?TUovN2FHWm84b3RSYzhZbWlpOXNqZC8xNGkzUXlIVkxXSURCYWZ2ajZvbHpn?=
 =?utf-8?B?czFOb282SEwxY2g3MlZFRWFpaUlzYko5dllDKzVMRjJIeUhld3FSeDlpcXJR?=
 =?utf-8?B?dXJWV2dVRGk0ZmF2cm0wT1ErMytoQkw2T24yeFVOcDNuVXVWWEJxaWh4dmRj?=
 =?utf-8?B?dzdvSFZGOHhEc2F6VGxFZERYbldIMUkzY3dVTWY4RExwejl1aHdEdENzNHZh?=
 =?utf-8?Q?j/2j/Fit1lGEa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 08:45:52.1286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ac18ba-d928-411b-cbc6-08dcea9a474d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9207

Commit 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
adds a weak reverse dependency to the config XEN_PRIVCMD definition, that
dependency causes xen-privcmd can't be loaded on domU, because dependent
xen-pciback isn't always be loaded successfully on domU.

To solve above problem, remove that dependency, and do not call
pcistub_get_gsi_from_sbdf() directly, instead add a hook in
drivers/xen/apci.c, xen-pciback register the real call function, then in
privcmd_ioctl_pcidev_get_gsi call that hook.

Fixes: 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
v3->v4 changes:
Added stubs for xen_acpi_register_get_gsi_func and xen_acpi_get_gsi_from_sbdf when "!CONFIG_XEN_DOM0" in acpi.h to fix 32-bit x86 build error.

v2->v3 changes:
Added rwlock get_gsi_from_sbdf_lock to avoid races.
Called xen_acpi_register_get_gsi_func to register function in xen_pcibk_init and set NULL to hook in xen_pcibk_cleanup when unloading.

v1->v2 changes:
Added hook xen_acpi_get_gsi_from_sbdf.
Changed pcistub_get_gsi_from_sbdf to static and pciback register it as the real hook function.
---
 drivers/xen/Kconfig                |  1 -
 drivers/xen/acpi.c                 | 24 ++++++++++++++++++++++++
 drivers/xen/privcmd.c              |  6 ++----
 drivers/xen/xen-pciback/pci_stub.c | 11 +++++++++--
 include/xen/acpi.h                 | 14 +++++++++-----
 5 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 72ddee4c1544..f7d6f47971fd 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -261,7 +261,6 @@ config XEN_SCSI_BACKEND
 config XEN_PRIVCMD
 	tristate "Xen hypercall passthrough driver"
 	depends on XEN
-	imply XEN_PCIDEV_BACKEND
 	default m
 	help
 	  The hypercall passthrough driver allows privileged user programs to
diff --git a/drivers/xen/acpi.c b/drivers/xen/acpi.c
index 9e2096524fbc..d2ee605c5ca1 100644
--- a/drivers/xen/acpi.c
+++ b/drivers/xen/acpi.c
@@ -125,3 +125,27 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xen_acpi_get_gsi_info);
+
+static get_gsi_from_sbdf_t get_gsi_from_sbdf;
+static DEFINE_RWLOCK(get_gsi_from_sbdf_lock);
+
+void xen_acpi_register_get_gsi_func(get_gsi_from_sbdf_t func)
+{
+	write_lock(&get_gsi_from_sbdf_lock);
+	get_gsi_from_sbdf = func;
+	write_unlock(&get_gsi_from_sbdf_lock);
+}
+EXPORT_SYMBOL_GPL(xen_acpi_register_get_gsi_func);
+
+int xen_acpi_get_gsi_from_sbdf(u32 sbdf)
+{
+	int ret = -EOPNOTSUPP;
+
+	read_lock(&get_gsi_from_sbdf_lock);
+	if (get_gsi_from_sbdf)
+		ret = get_gsi_from_sbdf(sbdf);
+	read_unlock(&get_gsi_from_sbdf_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xen_acpi_get_gsi_from_sbdf);
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 3273cb8c2a66..4f75bc876454 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -850,15 +850,13 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 static long privcmd_ioctl_pcidev_get_gsi(struct file *file, void __user *udata)
 {
 #if defined(CONFIG_XEN_ACPI)
-	int rc = -EINVAL;
+	int rc;
 	struct privcmd_pcidev_get_gsi kdata;
 
 	if (copy_from_user(&kdata, udata, sizeof(kdata)))
 		return -EFAULT;
 
-	if (IS_REACHABLE(CONFIG_XEN_PCIDEV_BACKEND))
-		rc = pcistub_get_gsi_from_sbdf(kdata.sbdf);
-
+	rc = xen_acpi_get_gsi_from_sbdf(kdata.sbdf);
 	if (rc < 0)
 		return rc;
 
diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index 2f3da5ac62cd..b616b7768c3b 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -227,7 +227,7 @@ static struct pci_dev *pcistub_device_get_pci_dev(struct xen_pcibk_device *pdev,
 }
 
 #ifdef CONFIG_XEN_ACPI
-int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
+static int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
 {
 	struct pcistub_device *psdev;
 	int domain = (sbdf >> 16) & 0xffff;
@@ -242,7 +242,6 @@ int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
 
 	return psdev->gsi;
 }
-EXPORT_SYMBOL_GPL(pcistub_get_gsi_from_sbdf);
 #endif
 
 struct pci_dev *pcistub_get_pci_dev_by_slot(struct xen_pcibk_device *pdev,
@@ -1757,11 +1756,19 @@ static int __init xen_pcibk_init(void)
 		bus_register_notifier(&pci_bus_type, &pci_stub_nb);
 #endif
 
+#ifdef CONFIG_XEN_ACPI
+	xen_acpi_register_get_gsi_func(pcistub_get_gsi_from_sbdf);
+#endif
+
 	return err;
 }
 
 static void __exit xen_pcibk_cleanup(void)
 {
+#ifdef CONFIG_XEN_ACPI
+	xen_acpi_register_get_gsi_func(NULL);
+#endif
+
 #ifdef CONFIG_PCI_IOV
 	bus_unregister_notifier(&pci_bus_type, &pci_stub_nb);
 #endif
diff --git a/include/xen/acpi.h b/include/xen/acpi.h
index daa96a22d257..c66a8461612e 100644
--- a/include/xen/acpi.h
+++ b/include/xen/acpi.h
@@ -35,6 +35,8 @@
 
 #include <linux/types.h>
 
+typedef int (*get_gsi_from_sbdf_t)(u32 sbdf);
+
 #ifdef CONFIG_XEN_DOM0
 #include <asm/xen/hypervisor.h>
 #include <xen/xen.h>
@@ -72,6 +74,8 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
 						  int *gsi_out,
 						  int *trigger_out,
 						  int *polarity_out);
+void xen_acpi_register_get_gsi_func(get_gsi_from_sbdf_t func);
+int xen_acpi_get_gsi_from_sbdf(u32 sbdf);
 #else
 static inline void xen_acpi_sleep_register(void)
 {
@@ -89,12 +93,12 @@ static inline int xen_acpi_get_gsi_info(struct pci_dev *dev,
 {
 	return -1;
 }
-#endif
 
-#ifdef CONFIG_XEN_PCI_STUB
-int pcistub_get_gsi_from_sbdf(unsigned int sbdf);
-#else
-static inline int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
+static inline void xen_acpi_register_get_gsi_func(get_gsi_from_sbdf_t func)
+{
+}
+
+static inline int xen_acpi_get_gsi_from_sbdf(u32 sbdf)
 {
 	return -1;
 }
-- 
2.34.1


