Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1E88F83F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 07:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698813.1091006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjhZ-0004sb-2N; Thu, 28 Mar 2024 06:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698813.1091006; Thu, 28 Mar 2024 06:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjhY-0004qM-Vm; Thu, 28 Mar 2024 06:57:28 +0000
Received: by outflank-mailman (input) for mailman id 698813;
 Thu, 28 Mar 2024 06:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dwcp=LC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rpjhX-0004Yt-Jj
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 06:57:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f2f7652-ecd0-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 07:57:26 +0100 (CET)
Received: from BN0PR04CA0209.namprd04.prod.outlook.com (2603:10b6:408:e9::34)
 by CY8PR12MB7491.namprd12.prod.outlook.com (2603:10b6:930:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 06:57:23 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::89) by BN0PR04CA0209.outlook.office365.com
 (2603:10b6:408:e9::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 28 Mar 2024 06:57:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 06:57:23 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Mar
 2024 01:57:19 -0500
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
X-Inumbo-ID: 6f2f7652-ecd0-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8ZwyuesJuJVxj7aTbKoozNC3lLg7uvihA4ORfeEgRun6YVEmCm3zTZ2/xTQBMkuKvoEBcjxBsK3dEDIZAJhsml4rWfsJQsW7MQFxK1bYgja+U4XmaVGciqCygTkr5vaUnwVp8nVgZEVa7W8zPabK/gDq3nHUIrmj7GM4euO2oE8UrsbKQ5vKkvYsz+KHFiBWI1aGEFaUfnJS18JQtMnKmZ0I75YtU2CR4ztD2xXQj38+2n/jAfDvQn4JwEaRrgfLdZMgc/j++tiLU+NgrcPyvm8L5jOkzcYDlif44w0ShQUKnRTYvgv6y46f8tSMy6A8PvbnW4ulm+gQH1to9Kpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jf1xx5lV5VxtmOYsSVAPqZLI4ppEFbCrYV78JIY1Svg=;
 b=nRbk0dXJMw2/7C/g6NC8tvbDl8mcSd1/ijXJjLnAX09y/uhx3TK1/hTvkXXz4y/KEQi7s1SnFA5pvFPQGdTJ+P2VKIs2Jx3LPNdRXATkixJmCZt6XgvH3srHGe253ymFchwui3LVz5QngNP4K4XcyExA+Wv16NAd39dl1dXwETmBqEdn1blTiwP22Nl028Dobt71HRGz5NFgDr0cHEoA5OyvwKp47O72Aayr5S4dxuWIINMmFyt9B66/KbvezLTltrXAauabkfiH8N0XZ0uT33tnWAaCOghC+OLFswO5VQz5cHK+N32DwBPeDijD4SJb94jtUZw3MSVu5hLwuNoPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jf1xx5lV5VxtmOYsSVAPqZLI4ppEFbCrYV78JIY1Svg=;
 b=iwikHwlMNoNL9O5hYq9ycZC2a1D2nfU7zTXR+L7NIomMjp5arfI/e2wIShAPcRiviOZwsg0dUW+Rs7OHQvNIByOWywWQFVMnl5gvrZkreT3K5E0+ZfzHtWwl/FNbAa1lPRidayGWKaYdDgVhJUTyuvyC3q+giSRa3/4CT8KCRF4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC KERNEL PATCH v5 3/3] PCI/sysfs: Add gsi sysfs for pci_dev
Date: Thu, 28 Mar 2024 14:56:46 +0800
Message-ID: <20240328065646.354782-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328065646.354782-1-Jiqian.Chen@amd.com>
References: <20240328065646.354782-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|CY8PR12MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: c23643eb-95a2-491b-320b-08dc4ef451e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ok86Jtt3hNQ0yDEtPHNYn17A7VRXH+3a0mn3RMz56+N6/DwEA3d0AHHZUgzLxuawYnjjaMzmcxaiZdNDIa3eT14qFvfdOtw+HPKhmcbQnG9IJJsNlUHYJz2G6UFU+6wTbqPH/Zoj31OZeZseSW3zKZ9Zk6aZF0eLxlIfR/Q5xnT92ozB9DS2VLsR92a59sx3rRYb86MKkZYPDs422YGJPcj6L4bbTQLLE6q9JGma8ja3DWkyYFZxx5vrvPg+f8sFnOPPk+K1wiTPa3O8MIALyvRovy0B4L5gPyUS9tEITawGOXE4lbMDOZbBLe7GFqbi+vhv5dHwVgYEcmnJLlQj/1Q78utkH+ZvYOvGZswp0O7LBCINDgtTG/mJNk6iVexnbNvybzFLeZ8dZubft42+qKSX3R1gJT6femgaa1sTFzMHo4jsjecBN7BaZL+AS9n/1lwuFoGSPsbddpFAwzh0pH3vL/GBcRdyVM2GA+xyBTRFS3SDbiz2CA7fPt2J79+vh1iucrrAIoCNY/5gSGamGZjSYyiwYlHaqTqWKL1Pi+PMM7E8bFmlHe3AiadIwQG05ii9WLkgttJHtFUU4yVAXDGOKkA1Yz/k3MGn+qJLmMLeRKa1k38Jla8WZCjPjRmbAM1rAwlbC20s5Uds+i3wqEihVFTbkCpis76qK1YWkkFzn3+uBoQyGMIkL3Ta5zZMYwEDA5UKT0Y89aWZ4BNLZhJHhcCVhes6eGOR2bSFesOxJIESgvbrH2D/WzM3vVry
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 06:57:23.1933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c23643eb-95a2-491b-320b-08dc4ef451e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7491

There is a need for some scenarios to use gsi sysfs.
For example, when xen passthrough a device to dumU, it will
use gsi to map pirq, but currently userspace can't get gsi
number.
So, add gsi sysfs for that and for other potential scenarios.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
RFC: No feasible suggestions were obtained in the discussion of v4.
Discussions are still needed where/how to expose the gsi.
Looking forward to get more comments and suggestions from PCI/ACPI Maintainers.

---
 drivers/acpi/pci_irq.c  |  1 +
 drivers/pci/pci-sysfs.c | 11 +++++++++++
 include/linux/pci.h     |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
index 630fe0a34bc6..739a58755df2 100644
--- a/drivers/acpi/pci_irq.c
+++ b/drivers/acpi/pci_irq.c
@@ -449,6 +449,7 @@ int acpi_pci_irq_enable(struct pci_dev *dev)
 		kfree(entry);
 		return 0;
 	}
+	dev->gsi = gsi;
 
 	rc = acpi_register_gsi(&dev->dev, gsi, triggering, polarity);
 	if (rc < 0) {
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 2321fdfefd7d..c51df88d079e 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -71,6 +71,16 @@ static ssize_t irq_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(irq);
 
+static ssize_t gsi_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	return sysfs_emit(buf, "%u\n", pdev->gsi);
+}
+static DEVICE_ATTR_RO(gsi);
+
 static ssize_t broken_parity_status_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)
@@ -596,6 +606,7 @@ static struct attribute *pci_dev_attrs[] = {
 	&dev_attr_revision.attr,
 	&dev_attr_class.attr,
 	&dev_attr_irq.attr,
+	&dev_attr_gsi.attr,
 	&dev_attr_local_cpus.attr,
 	&dev_attr_local_cpulist.attr,
 	&dev_attr_modalias.attr,
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 7ab0d13672da..457043cfdfce 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -529,6 +529,8 @@ struct pci_dev {
 
 	/* These methods index pci_reset_fn_methods[] */
 	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
+
+	unsigned int	gsi;
 };
 
 static inline struct pci_dev *pci_physfn(struct pci_dev *dev)
-- 
2.34.1


