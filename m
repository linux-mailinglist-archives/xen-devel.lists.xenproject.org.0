Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E45997E9F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 10:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815632.1229625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syo5Q-0000dr-97; Thu, 10 Oct 2024 07:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815632.1229625; Thu, 10 Oct 2024 07:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syo5Q-0000az-63; Thu, 10 Oct 2024 07:59:52 +0000
Received: by outflank-mailman (input) for mailman id 815632;
 Thu, 10 Oct 2024 07:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1fZv=RG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1syo5O-0000as-Ed
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 07:59:50 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:2418::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb0d512-86dd-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 09:59:49 +0200 (CEST)
Received: from CH2PR18CA0050.namprd18.prod.outlook.com (2603:10b6:610:55::30)
 by MW4PR12MB6998.namprd12.prod.outlook.com (2603:10b6:303:20a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 07:59:43 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::41) by CH2PR18CA0050.outlook.office365.com
 (2603:10b6:610:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Thu, 10 Oct 2024 07:59:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 07:59:43 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 02:59:40 -0500
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
X-Inumbo-ID: 9eb0d512-86dd-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X02xCPqO76J3dnJa00uPbt2H078yKMZ498JBIi7w21W0BGr506YHMfT2rEImp111fjjuUdfa6QOMmugCOwc62s0/i6Vf27uEqhSrOa3k7i6itJLPy7YVRrgrss8se1Raq6nFPO7+7uelrQs8mBMz1CU3HOx9wfJO3HxcQMjZCXG8hmjwoeEwXV1bhLH8rB7Mv6iltKOKGhr+KO9bDOPXP3e//yZIJX1aDMz6IDTlIIQA+QN5fbjkESRtaERy1LobffhzmlQ2xM5VeWyb00ky1CGl7B8MNjECFl80/kofkRK2OuuMPRdCkR30hDs0B0qJFqAodCbNMEAmjFnSO8u2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gdCt5Jv6hMT61z14pdBUVE0kmhGMgvijH9MaPD7Tdk=;
 b=W668X+LXXORDxzzT7rDhcFJQfZ+1cKu5/p4oje9GmWoEoySuloLnVhtvB/jBz1pGd55/PrDap9gnA/2r0jIPtw8b4TBM/Jf2smlSNdDj5+sZg0HL71p+wZvrOt/yPrRy5Z+0c36gL2cgyM62Fgf5GnqcsiZ0DysmkzttlEQm+AxbW8wz2VyR9spqlo7GZElViI0EIE25VHNVVcgI5Th6r3+G2d1nuwAKwp6uop26bADcM70DMa0s4cA/jjEGTgB4ZO7pZTtoYVYbJDQ6f2x/LQKLFGRd8itI7R+Uc5mMLpwP4omUomQB2f7f69vnKn9rgveE8YPq0nmXHMmKIh3mfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gdCt5Jv6hMT61z14pdBUVE0kmhGMgvijH9MaPD7Tdk=;
 b=Nnbu2QIlnxrjktxYX1KNn4JkyWBy+FtSzA0X+A7Iw4E11zoYTzCM9Kldlzx0iNI9qRVwR5d3iCkMjhgedlLzalo5HU4GA/TNFNDQBN++r/x3uOxNpixKNN1TpoDyULrJ2WFqwUsyYa0HvQGscKpvjg/Joq0DLujqr4c2cDS1/SI=
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
Subject: [PATCH v2] xen: Remove dependency between pciback and privcmd
Date: Thu, 10 Oct 2024 15:58:48 +0800
Message-ID: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|MW4PR12MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: d211a721-9c7e-464c-b061-08dce9018024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHp5dzMyOVNqOWtFWEdLZXNNU056bTI0QzJoY09YWmEyb05Sbk85QVFST2xG?=
 =?utf-8?B?eGdpL01QYmhMZ3owUWFCUDdnOHNkSFM1OEwrOW5Vb1VwamxjVTBCT0FGVXdN?=
 =?utf-8?B?elorM2twa2tvblVQY09vbzNsNWsrTEtUMG1Ga2ltQkI0YWRuR0Uya2dFbUE4?=
 =?utf-8?B?ZmRqbDl6RVJ1cDBERDRSRUF2cUx3MVMxNXFlM0loNUtMYk8vNDBpY1FDY1hK?=
 =?utf-8?B?Y1RDUi9SVmpxcEpCcnRvVUU2OVRkVTdxam95djYxVGdaZUQ3TWh6K01VbzQv?=
 =?utf-8?B?TkVGNTgrcWtsWGhGbVROUy9saG1XS3BUNzZ0SysvN3dLS2dkTlRFYnNUVy8r?=
 =?utf-8?B?S2VUaGxWR3RHVlBhbXVEaS9VbVJFRFNoMEQ5SncyVWljdlVvNFBDTWhxWUgz?=
 =?utf-8?B?WFRVMTYwVkFQWTJ5b0UvUmZVd2p1V0RocTI1YmlEY1VQbU9pa0Z3ckhQNi9P?=
 =?utf-8?B?QnpsMHBEaFpzWXlmS1VGa3RiWHVBVW55djlXMTdjUTJvRi81VjdzVWU5b1Bi?=
 =?utf-8?B?ZmRVa0Y2TXByYWp4M1pPQ0dCbVpqZE9uQ3JWZ25rWVFhdkxaeGcwY3BzWU5s?=
 =?utf-8?B?UGxxSE9HMFVVbUY2N1hUR2p2N2tleGxwakdUMStBL1k1YmlVL3VSaXJtWWZW?=
 =?utf-8?B?UUdCWk5uQXJwejhuL0hpQWJYWkNBc2piZXlvV3RCdTBMdFMwZHNWZHRvb2k1?=
 =?utf-8?B?TndUZVpWY0RUeks0bU04ZlU3WTJWZFNUQVhnWlp2alJVYytnWTVXcEIyNFZH?=
 =?utf-8?B?aE5lRDFHU3FGTHNhMmY2ZlQyZ25tRGdMakM3MExuYm9vM1p3Y3BqYklKT2VS?=
 =?utf-8?B?Y3JNaktFcXZzUGl1ZHV6NjFneStNTDhlcldPc3I0MXVZSTlUa3hsQzdIVUNL?=
 =?utf-8?B?VmU3K0xlTktlMUlwL2ZBTEMzRVJpUSsxWXZSSHFPR3Q1RndjVGtwM0NRalUv?=
 =?utf-8?B?emxVaVZOdDUvbHVjN29Tblk4MFIyUTQvZGs0V0N5OTlGQVZ0OGNEazNRY2tY?=
 =?utf-8?B?R2F3eExaWWFMWU4rQUhXU1NMR2R2Skg0cXBZaVorZnlaOGxjcGttTzgzeFUv?=
 =?utf-8?B?Qkhua1JKNUVhT29aT1NWYmZWY1Bma1UvdkFZTmFJRWZ6QjdWREhuNHpwZG1j?=
 =?utf-8?B?aHVDK0NUaGdpSi9VK1lVZjZaQnpCVGl4OGRjRUpXSXladURJTVFQVlNmVlBj?=
 =?utf-8?B?K0NDMlp6K2pKV2RHL0g2Qmw0YXhEdFBWUlM0MXBwVXR0TXVhVmdHbVR4a1N2?=
 =?utf-8?B?Y3FGK2I5R2RlRSttYjc1WnlwVENHQnVpcHM0SWF6Uzdld3hkaXZSRmVSS21U?=
 =?utf-8?B?UkJDeFlwam5ONnJzYXFIbm5SckpySEJpLzNSUTJoQXR1aTlzWWJHR25UalBj?=
 =?utf-8?B?NktOaVFObzRJNVZXSTBNNnVycXdJcjF0dHd1akI2Z3dOYkhydDRncVd2TGRV?=
 =?utf-8?B?c1VmNTl5OEZPcHJQRmR6Z0ZzYUxKWVRhQTJwOU01elBqem4rdTQ2ZCs0Ni9F?=
 =?utf-8?B?b0ptckd2NDZWQ1BBZ1EzK3ZVak8rMjdMSzAzTzVnZ1pPU0NYVVlzc29sZFVC?=
 =?utf-8?B?NkZGY0FTVmhNTSs4aDdsM0FDQ0tBUU05djJnTG14azBMVTNwNVdIVkdGeXJl?=
 =?utf-8?B?LzJBWGxDbXkzdVNFM1daM1NRUDdYTkQ4NmRJOTF3UlAvdlF2LzEwMmdCRTFX?=
 =?utf-8?B?bGdvREszZUdBVnd2T3AyZ29ZOCs1Y2dMd1JuM04xSzY5TG9wWmV3TVRIZ0p3?=
 =?utf-8?B?R0M5SUJIejR5elgvLzFBMW40R1JHK0wrN2ZPUVF6dXovTWRFQVVSSFI5RDRs?=
 =?utf-8?B?TnFpOXhhbHZCeWRRVDNXOCttbkFtTjdzMytwRkhVa0dqYUQrQ3V0VnNwL1Zo?=
 =?utf-8?Q?bcn519/9FjniD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 07:59:43.2801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d211a721-9c7e-464c-b061-08dce9018024
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6998

Commit 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
adds a weak reverse dependency to the config XEN_PRIVCMD definition, that
dependency causes xen-privcmd can't be loaded on domU, because
dependent xen-pciback is always not be loaded successfully on domU.

To solve above problem, remove that dependency, and do not call
pcistub_get_gsi_from_sbdf() directly, instead add a hook in
drivers/xen/apci.c, xen-pciback register the real call function, then in
privcmd_ioctl_pcidev_get_gsi call that hook.

Fixes: 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
v1->v2 changes:
Added hook xen_acpi_get_gsi_from_sbdf.
Changed pcistub_get_gsi_from_sbdf to static and pciback register it as the real hook function.
---
 drivers/xen/Kconfig                |  1 -
 drivers/xen/acpi.c                 | 17 +++++++++++++++++
 drivers/xen/privcmd.c              |  6 ++----
 drivers/xen/xen-pciback/pci_stub.c |  4 ++--
 include/xen/acpi.h                 | 12 ++++--------
 5 files changed, 25 insertions(+), 15 deletions(-)

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
index 9e2096524fbc..0bff2f3a87d2 100644
--- a/drivers/xen/acpi.c
+++ b/drivers/xen/acpi.c
@@ -125,3 +125,20 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xen_acpi_get_gsi_info);
+
+get_gsi_from_sbdf_t get_gsi_from_sbdf = NULL;
+
+void xen_acpi_register_get_gsi_func(get_gsi_from_sbdf_t func)
+{
+	get_gsi_from_sbdf = func;
+}
+EXPORT_SYMBOL_GPL(xen_acpi_register_get_gsi_func);
+
+int xen_acpi_get_gsi_from_sbdf(u32 sbdf)
+{
+	if (get_gsi_from_sbdf)
+		return get_gsi_from_sbdf(sbdf);
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(xen_acpi_get_gsi_from_sbdf);
\ No newline at end of file
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
index 2f3da5ac62cd..900e6199eec7 100644
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
@@ -484,6 +483,7 @@ static int pcistub_init_device(struct pcistub_device *psdev)
 		if (err)
 			goto config_release;
 		psdev->gsi = gsi;
+		xen_acpi_register_get_gsi_func(pcistub_get_gsi_from_sbdf);
 	}
 #endif
 
diff --git a/include/xen/acpi.h b/include/xen/acpi.h
index daa96a22d257..ef4f70e4a557 100644
--- a/include/xen/acpi.h
+++ b/include/xen/acpi.h
@@ -91,13 +91,9 @@ static inline int xen_acpi_get_gsi_info(struct pci_dev *dev,
 }
 #endif
 
-#ifdef CONFIG_XEN_PCI_STUB
-int pcistub_get_gsi_from_sbdf(unsigned int sbdf);
-#else
-static inline int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
-{
-	return -1;
-}
-#endif
+typedef int (*get_gsi_from_sbdf_t)(u32 sbdf);
+
+void xen_acpi_register_get_gsi_func(get_gsi_from_sbdf_t func);
+int xen_acpi_get_gsi_from_sbdf(unsigned int sbdf);
 
 #endif	/* _XEN_ACPI_H */
-- 
2.34.1


