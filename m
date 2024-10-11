Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70824999B3F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 05:44:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816609.1230745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sz6Yr-00063k-Jy; Fri, 11 Oct 2024 03:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816609.1230745; Fri, 11 Oct 2024 03:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sz6Yr-00061Q-GX; Fri, 11 Oct 2024 03:43:29 +0000
Received: by outflank-mailman (input) for mailman id 816609;
 Fri, 11 Oct 2024 03:43:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UIMz=RH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sz6Yq-00061K-3W
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 03:43:28 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7aa5132-8782-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 05:43:25 +0200 (CEST)
Received: from CH0PR03CA0443.namprd03.prod.outlook.com (2603:10b6:610:10e::7)
 by IA1PR12MB7758.namprd12.prod.outlook.com (2603:10b6:208:421::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 03:43:18 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::21) by CH0PR03CA0443.outlook.office365.com
 (2603:10b6:610:10e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.19 via Frontend
 Transport; Fri, 11 Oct 2024 03:43:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 03:43:18 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 22:43:04 -0500
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
X-Inumbo-ID: f7aa5132-8782-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSe+T7++mE4K20kGV7/PirfusTiyt1t0dq/MTVkjf42zH640DRbLAEvtlLgxl54p7Rzmm6ufDamXOtb/dQHuRPf1xQhUaIITlBcRKK/HU0qLOG4/WphvkQX1SGALFqa8QYJXvlOHGusHRoO77w5pkfctjBytbYUw79uJN2/OHQXNFFkoyYuDigUTAD5NORtWkiUhP5mtikua6cGwoLVkBt2Z621DwUqmG3wSPYDblPrVtxQXCyd6njtmSGKqL4ssxcn0Td5GabkmlFEmFZ0qvHt+jYyLb+WsVX2CHnszRGA9OvX4C+msd8AM4YgsXo3X42KbBssG8y8n04MkLFDlTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbssvUUNfLLC/N8Xv5TE+/4RqyMpP1CBaOeHLooKg4Y=;
 b=q+GG9aRPtZGrRA9ZJyXlgYP1Gm0TGKzQOSnrjjceNECB8TkxCUOrvItEixZ76/0obg6dWsiIg2JCxND06rV4hnGOUEqy+KsKfj+SU4XV13RI0xe1Ll6yckxydRI0ycCtYz34naZ9CeqboWtzzFjZtnNuxjqVwfKAUedU8tVJbatnrPrXYzaFbUPjlj2q0bHjGN884eIsIk0TChMrC1YvGcbQ5Xc98/B0dcc2iyXf/GqgyxfZVMkYyJV1l173Q3fmYTwMIFY2OQIiJ6JlmzauDA3i3AzXYJw0TIYKxXYt3GQIGxzcUZtGV+6iCRGRzUfCAOU+28AZflKT4C4rVmARRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbssvUUNfLLC/N8Xv5TE+/4RqyMpP1CBaOeHLooKg4Y=;
 b=S1MYGpsKb/bJO3nPvEjhcyeLziARDffRCOJ4C+9n3DBfJB/aqqBbvFLyLp/3LV9m9OD5/zRGH364h+HMhrkyl44YmXLjmIV4QCcgh7ImRLst1ZOcNDFWpGQmBXvktFJBiG66ZFrNqj95a6EZOnIUOzAE46zAJiRyHx67L9pfJZc=
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
Subject: [PATCH v3] xen: Remove dependency between pciback and privcmd
Date: Fri, 11 Oct 2024 11:42:27 +0800
Message-ID: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|IA1PR12MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 644d0b3d-81bf-4d68-c85f-08dce9a6d872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWpTT0J4VFJPSlF4Q01GcUZwU1UwZzZueFN0ekgxenJYeStkdE1EZEZrNkE2?=
 =?utf-8?B?OFZkT1FGZ3JKZjMvWWNiZWoxQWdhY2NOSlR6RUt4ZUtOQTNieG5pdCtNR0pt?=
 =?utf-8?B?YmlEajc3bGlWYllnc1htaDNYR3FUaVVWUGx6Wm82S1hqQzBoVUR1Z2MxS0o2?=
 =?utf-8?B?ellKV0pMV1hqcmR0S0xweFN1Z244NHpoa1k0ZVlQaTdpZHJ6RjlVaDcvYVBq?=
 =?utf-8?B?NmFTQTk2akUxdzZSZnZxRzJmdnhUWHBWTlptbm1aaXE0aXZKbnVNdlQzcE5o?=
 =?utf-8?B?eXdnN0daSDNla0lHRkI5SGpnQy80eVEvNW1yODhuQjRMVXoyYUpmMlJXbDZn?=
 =?utf-8?B?ZEMzZEVrTjdveGR4Rk84K2ZJcDljTXVtVXhod09vM2Jld2ZQSFdsWGFxOUlj?=
 =?utf-8?B?SnZwV1lBR1lmcFRROWw4VVJ6UUtMaVRyZmJzQnBjNFdsT3ZienVXTjgxVEx2?=
 =?utf-8?B?WTdMZVhCZ0lLSE5UZnJEbW5ITVkvbUtlYTJsNzFhWDJIOUpHWHNDKzlML05Z?=
 =?utf-8?B?R3ZscWpWZjd4aDdzQVZpSU8xYWprMUt0Qk1qYkNKQXRPL0FGU0dvYzNQcmw0?=
 =?utf-8?B?RHd4YlJsV0N2T3pnN0d2YWQvV1hnMTFJREZWWTcydTh2UlRtUkZVVGN2Wjlv?=
 =?utf-8?B?eXdUS09FNjg4WVpEM2NhTGZHNTNlNXhabWxPYktMTS90N1pIbDVaVFJCcUVw?=
 =?utf-8?B?bE1QNWFNQnNBMVA3WG82VmRWNXhQaEdqSHJuL2JyRGU0eWJOWThQdTJZaEVO?=
 =?utf-8?B?ZnFpWXRhUUd2alNWM0NDU0JSZkpCTU9LdVVPZWorb3RDUHN5bDVab3VsVEc4?=
 =?utf-8?B?TXBRdjBObDJDNEZSTWdxdVY0djJISEZDdFoveERhQnBMVmFZMmFXVnRLUlk5?=
 =?utf-8?B?Um1wQkhaSmJHUXFrZXJEWE5Bb094SjdRMFZaWkpTV3lVeS9IMDRNcmN6Wlk4?=
 =?utf-8?B?d2t5TFpXVGtocDRZN3dIeE9Qa0ViTVpQcmNTN1gzOFNuWExpMDlmbFJML2ZF?=
 =?utf-8?B?OFVwVG5OcVJiM1pxd2d3bHhJTmVDelBNK1F5Z1NSblp3VDZ2azc0SjY1MXdS?=
 =?utf-8?B?VG5mOFlaZExPaFZsalhPUVRnelJDcytSVFZZVnkxZ3lHUjcybXFOWSs5SHJN?=
 =?utf-8?B?THJRejZXcWF3ZFdpK3VRUlJMazdyVlBGUEVwME5QbmtOblVPS0FjczZMODU4?=
 =?utf-8?B?b0RKejVFeUdNeEhiUXZ2czRZUUZjajNhUEt1MWZIa3duU2tncWxaNU1BSHUz?=
 =?utf-8?B?eXJBQlZXVWs1NC85NkJDZUdXcjZZazRKcUdqZ3VXVXVva3pjU3ZJMUs3T0lE?=
 =?utf-8?B?NmVnUlBVWTlDM3lpTmNIS0M0SG9wQzEyK0grazdBdGZZQTgydklERDNST01y?=
 =?utf-8?B?NW9OV2MwN2RZbGhHNGdJVmptNFJmZjRyUGhucWd1b0VTV1VxWFF2bXp2RGxx?=
 =?utf-8?B?RkVNN2NDQVAzV3I5SnJYM29lQnArNXM5VkFhWUljZk1RcTBKKzZvZjNCM2Qy?=
 =?utf-8?B?cUgwY1Y0SjVJbVVMbEdIbDNPbFlrdkdaQ0lCeDQ1YXd0THBDUXNDbTM3YTdx?=
 =?utf-8?B?OWJZYnhtN3JxcmZpMDNIbVVzTC9FdmR2dk05VXZBNkhmYjZZSjRiblYvdUhk?=
 =?utf-8?B?UGNJaVVJVC9sdkJMSU8ydjJ4MFhYVE9GVHcrOUcvRUlTTzlUdnVLcnVzZDJ2?=
 =?utf-8?B?VVZPRzU5enFYbkRjazlLa0xQOGZVdm4zcERld0IxMGpLNjFHZHR4bnRNSWpv?=
 =?utf-8?B?Wk5lTXBrMmNrQlV6VzJDeGl4ZUlXYWRNWTg1elR6dGtRYnVoL3UxOVFIbTd6?=
 =?utf-8?B?a2poNjNXaXlMelpTN3F1UVlsSS9TRWYremwyUGJRZUFKU3RoL2lpVDF2U3pV?=
 =?utf-8?Q?U4s1cc1Nibmlg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 03:43:18.3293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 644d0b3d-81bf-4d68-c85f-08dce9a6d872
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7758

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
 include/xen/acpi.h                 | 12 ++++--------
 5 files changed, 39 insertions(+), 15 deletions(-)

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
index daa96a22d257..8cb081c633cc 100644
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
+int xen_acpi_get_gsi_from_sbdf(u32 sbdf);
 
 #endif	/* _XEN_ACPI_H */
-- 
2.34.1


