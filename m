Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8F8AA747
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 05:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708660.1107688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxf3Q-0004bC-6d; Fri, 19 Apr 2024 03:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708660.1107688; Fri, 19 Apr 2024 03:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxf3Q-0004V7-3x; Fri, 19 Apr 2024 03:36:48 +0000
Received: by outflank-mailman (input) for mailman id 708660;
 Fri, 19 Apr 2024 03:36:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1xH=LY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rxf3P-0004I0-0S
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 03:36:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e88::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0af98d29-fdfe-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 05:36:45 +0200 (CEST)
Received: from SJ0PR03CA0090.namprd03.prod.outlook.com (2603:10b6:a03:331::35)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.55; Fri, 19 Apr
 2024 03:36:42 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::b0) by SJ0PR03CA0090.outlook.office365.com
 (2603:10b6:a03:331::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.30 via Frontend
 Transport; Fri, 19 Apr 2024 03:36:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 03:36:41 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 22:36:37 -0500
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
X-Inumbo-ID: 0af98d29-fdfe-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2LaaC7xLoswDGmBTsAUwTT7FgR/hITuePD86oXWancbxg/CrSDRJX1lpHdGhWbMGoIPSQSl9HrQqUmDZdKHtnPAdtYJzL4qJkhGyUTrjemd1XoJMiqmsMoTP5bPCgI7bjLQuh2fGnK0rA6PnqAxWJhW/JBh26C9I/xuKmVpmyDKLc5eh/+xHa7yi7xHFmzyXt3RzzMvC0YsF0RUP0ptQJGhCyn6uTUIbT/e1/iW+Zul7olC9k3z9t0vnhTM58MaQmbuayHFcsX6zuHNqzIdFUaysgQJHYfKU4BUelFHUo4DADvw7eq/koljkc1Lm93dpJmoWOnkDAaBPAZV7R9TbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRBHDqPoVZS88OuDyH4d1T2swxIHcPAdP/Hn8UiTaGA=;
 b=mnAof2NHq5021KwI06GO4N+vuUHNhZxVjN5PHBtgVFo5+DNnB8EzyQSKHTG6Ga+YtcJSNvVB7JAW0/9JD7gMQQVLdibe/S80xXj9lBRNpf0Fz8B7n5UQwXn9YQyKYr63z6oQ5JzqNcvAaW3gybjcMP9CIGok03COMqzpXBAtaauxtP6lzezn3S9O0eoBa+styPAhYgv9AFh5lXJAnbNz1eDTp9q0F5tE/6gkCimH/RfTqNH7PoSB+uahSFvPuUMzIHynZc+a+zKUjxvAFwQQGqZk+ErGs9NpS9WW5StZf5hFkSw8xbnJtJtoa/f19EClMUIR12dUVdmMRLLtpeh1RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRBHDqPoVZS88OuDyH4d1T2swxIHcPAdP/Hn8UiTaGA=;
 b=T2SQFhKlD1NYa5RWitLYVYnit9B+3hjQNDUrNykAWKmpdToYLLs9K/VSfxYEqFzUj/H2DyjyYxMkob/cGaCGsbFzPJ7qcDoXnab2C0Qom3hCqCnaJmxsuMaQ08jKkguE/RoANdHtGj3VMNf+VR+VgV6fs5idEFq6Kuu3gG7vU6U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC KERNEL PATCH v6 2/3] xen/pvh: Setup gsi for passthrough device
Date: Fri, 19 Apr 2024 11:36:15 +0800
Message-ID: <20240419033616.607889-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419033616.607889-1-Jiqian.Chen@amd.com>
References: <20240419033616.607889-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|IA1PR12MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: b801c304-3894-4251-ca35-08dc6021ed95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3gD2kv+Ka5xTX50F1sprXoF3r0R/SRbwokZpFEfL6rkL3tmw6y3DQ2+soJzjQySIwgs8PFmNjeEXOzSj0siFE1bASZi3gy3jEeRp9Qhc0WVTNW6lpdnk8XGFYd+Gpp0FCi87LMerlvPbhffEfzdhmY+16oENa1uhnXOb/4+ifR+DOxEqE4GF3rdADk6J4McklJTrDobbp0llW8T8g6KybYFVwl7nTCkZ36zKn2/FhO6tal2H8EKvlmQlc4Gb8B6/mhcRfT/K8Bj1zBXhTQaITc6Rmki5qkvdmYFM87zIJFNdJeWLWRcVb9myFmC30wwohmvm12dqODb6x1QyUm6eeHeUE1vHmA4t7ErQ71Ix+dRQnYWPXbhzp/30avIwZcvX+vtYOfGL0vsvZnkzxnI/RZf+RWz8xeft0z/pSrrmrCXwf9Vl36SwPxiTOP3ZMR9o3HFYqqcGqh/k2cKWpr9y63c6koBspewIwx/JDPxxt72wTiwiat43IGMbkgg5emcpz5FTUlqf9L6p1iiHuX/AxZ+80iZIPDKom74jSyzj97PypcizT9onpXDmVYyeDdN5NlONx5fuShWeb3Q6u//gDiPf21TWxNEI+FSdPywdlPFvlBRl/+Plbwi5yJNkOUJvwczBbUnNi8TJp9ea1PCL/9fobjm19nvvGn8MkRLePbohl5fWY+Lss6UD9fjEH/Ycr1e5QxRZpoZ+APAyP6+UidBHVWhXZG+iGHnh3QZqeQuClADHBqS+LZGJhGKoF4id
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 03:36:41.4253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b801c304-3894-4251-ca35-08dc6021ed95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601

In PVH dom0, the gsis don't get registered, but the gsi of
a passthrough device must be configured for it to be able to be
mapped into a domU.

When assign a device to passthrough, proactively setup the gsi
of the device during that process.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 arch/x86/xen/enlighten_pvh.c       | 92 ++++++++++++++++++++++++++++++
 drivers/acpi/pci_irq.c             |  2 +-
 drivers/xen/xen-pciback/pci_stub.c |  8 +++
 include/linux/acpi.h               |  1 +
 include/xen/acpi.h                 |  6 ++
 5 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index c28f073c1df5..12be665b27d8 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -2,6 +2,7 @@
 #include <linux/acpi.h>
 #include <linux/export.h>
 #include <linux/mm.h>
+#include <linux/pci.h>
 
 #include <xen/hvc-console.h>
 
@@ -26,6 +27,97 @@
 bool __ro_after_init xen_pvh;
 EXPORT_SYMBOL_GPL(xen_pvh);
 
+typedef struct gsi_info {
+	int gsi;
+	int trigger;
+	int polarity;
+} gsi_info_t;
+
+struct acpi_prt_entry {
+	struct acpi_pci_id	id;
+	u8			pin;
+	acpi_handle		link;
+	u32			index;		/* GSI, or link _CRS index */
+};
+
+static int xen_pvh_get_gsi_info(struct pci_dev *dev,
+								gsi_info_t *gsi_info)
+{
+	int gsi;
+	u8 pin;
+	struct acpi_prt_entry *entry;
+	int trigger = ACPI_LEVEL_SENSITIVE;
+	int polarity = acpi_irq_model == ACPI_IRQ_MODEL_GIC ?
+				      ACPI_ACTIVE_HIGH : ACPI_ACTIVE_LOW;
+
+	if (!dev || !gsi_info)
+		return -EINVAL;
+
+	pin = dev->pin;
+	if (!pin)
+		return -EINVAL;
+
+	entry = acpi_pci_irq_lookup(dev, pin);
+	if (entry) {
+		if (entry->link)
+			gsi = acpi_pci_link_allocate_irq(entry->link,
+							 entry->index,
+							 &trigger, &polarity,
+							 NULL);
+		else
+			gsi = entry->index;
+	} else
+		gsi = -1;
+
+	if (gsi < 0)
+		return -EINVAL;
+
+	gsi_info->gsi = gsi;
+	gsi_info->trigger = trigger;
+	gsi_info->polarity = polarity;
+
+	return 0;
+}
+
+static int xen_pvh_setup_gsi(gsi_info_t *gsi_info)
+{
+	struct physdev_setup_gsi setup_gsi;
+
+	if (!gsi_info)
+		return -EINVAL;
+
+	setup_gsi.gsi = gsi_info->gsi;
+	setup_gsi.triggering = (gsi_info->trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
+	setup_gsi.polarity = (gsi_info->polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
+
+	return HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
+}
+
+int xen_pvh_passthrough_gsi(struct pci_dev *dev)
+{
+	int ret;
+	gsi_info_t gsi_info;
+
+	if (!dev)
+		return -EINVAL;
+
+	ret = xen_pvh_get_gsi_info(dev, &gsi_info);
+	if (ret) {
+		xen_raw_printk("Fail to get gsi info!\n");
+		return ret;
+	}
+
+	ret = xen_pvh_setup_gsi(&gsi_info);
+	if (ret == -EEXIST) {
+		xen_raw_printk("Already setup the GSI :%d\n", gsi_info.gsi);
+		ret = 0;
+	} else if (ret)
+		xen_raw_printk("Fail to setup GSI (%d)!\n", gsi_info.gsi);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xen_pvh_passthrough_gsi);
+
 void __init xen_pvh_init(struct boot_params *boot_params)
 {
 	u32 msr;
diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
index ff30ceca2203..630fe0a34bc6 100644
--- a/drivers/acpi/pci_irq.c
+++ b/drivers/acpi/pci_irq.c
@@ -288,7 +288,7 @@ static int acpi_reroute_boot_interrupt(struct pci_dev *dev,
 }
 #endif /* CONFIG_X86_IO_APIC */
 
-static struct acpi_prt_entry *acpi_pci_irq_lookup(struct pci_dev *dev, int pin)
+struct acpi_prt_entry *acpi_pci_irq_lookup(struct pci_dev *dev, int pin)
 {
 	struct acpi_prt_entry *entry = NULL;
 	struct pci_dev *bridge;
diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index 46c40ec8a18e..22d4380d2b04 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -20,6 +20,7 @@
 #include <linux/atomic.h>
 #include <xen/events.h>
 #include <xen/pci.h>
+#include <xen/acpi.h>
 #include <xen/xen.h>
 #include <asm/xen/hypervisor.h>
 #include <xen/interface/physdev.h>
@@ -435,6 +436,13 @@ static int pcistub_init_device(struct pci_dev *dev)
 			goto config_release;
 		pci_restore_state(dev);
 	}
+
+	if (xen_initial_domain() && xen_pvh_domain()) {
+		err = xen_pvh_passthrough_gsi(dev);
+		if (err)
+			goto config_release;
+	}
+
 	/* Now disable the device (this also ensures some private device
 	 * data is setup before we export)
 	 */
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index b7165e52b3c6..08f1e316bf27 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -361,6 +361,7 @@ void acpi_unregister_gsi (u32 gsi);
 
 struct pci_dev;
 
+struct acpi_prt_entry *acpi_pci_irq_lookup(struct pci_dev *dev, int pin);
 int acpi_pci_irq_enable (struct pci_dev *dev);
 void acpi_penalize_isa_irq(int irq, int active);
 bool acpi_isa_irq_available(int irq);
diff --git a/include/xen/acpi.h b/include/xen/acpi.h
index b1e11863144d..17c4d37f1e60 100644
--- a/include/xen/acpi.h
+++ b/include/xen/acpi.h
@@ -67,10 +67,16 @@ static inline void xen_acpi_sleep_register(void)
 		acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
 	}
 }
+int xen_pvh_passthrough_gsi(struct pci_dev *dev);
 #else
 static inline void xen_acpi_sleep_register(void)
 {
 }
+
+static inline int xen_pvh_passthrough_gsi(struct pci_dev *dev)
+{
+	return -1;
+}
 #endif
 
 #endif	/* _XEN_ACPI_H */
-- 
2.34.1


