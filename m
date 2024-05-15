Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C58C6103
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 08:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721930.1125650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s78TM-0004JW-MY; Wed, 15 May 2024 06:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721930.1125650; Wed, 15 May 2024 06:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s78TM-0004Fu-J2; Wed, 15 May 2024 06:50:44 +0000
Received: by outflank-mailman (input) for mailman id 721930;
 Wed, 15 May 2024 06:50:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NNmL=MS=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s78TL-0003jj-7N
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 06:50:43 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71e2267f-1287-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 08:50:42 +0200 (CEST)
Received: from SJ0PR03CA0332.namprd03.prod.outlook.com (2603:10b6:a03:39c::7)
 by BY1PR12MB8445.namprd12.prod.outlook.com (2603:10b6:a03:523::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25; Wed, 15 May
 2024 06:50:36 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::df) by SJ0PR03CA0332.outlook.office365.com
 (2603:10b6:a03:39c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Wed, 15 May 2024 06:50:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Wed, 15 May 2024 06:50:35 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 01:50:32 -0500
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
X-Inumbo-ID: 71e2267f-1287-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9pgACrF4X3+B3IhRAwGmJgIO7E2pUB+fzIYbC+Vy5ayBTfssrnRoBl7R3nMCJvVLlkprYBrH2O7Z57K+vpW79gXqmaVld6E8/Jgc7LSooCjASdxNwfSWmje7jThUsygO7jm3c0kLfGZrxdeFp1Lp2Juo8sg5SuqKlXL4uJRTbaCDFvmGZDo1h8/TfsldloCIRDPsnkKXe1W5AOtXGOsn6yuA97nyFd56EdQ5OctnBsW6i++P2OOwbvTEuaYS/qTjQ8vxqbll7yS569Jg3jCccGhrG0JoO3Td3o6iCruJOCjhkXp2im23zEnK2XHet5GGVwB+gZwcb123gGXzlSJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcwYxAcPB960myYrq5oQXoH0v7z+ym1e/y8k8X4re90=;
 b=Z+OxDFAGL3gjw6O8jzWIpW/xP5mgPJYFpYWgnnTSoSyq8kDqsU3VUXQ06uwdOFT4n/km5aukoS2v4S6T8nNfGhm9bHzJCAMI15r9qG1MyHGYV2JpYNcuvwmPPfFT6T3heyEzpHoq0A8uYbnZyxpQwHjpjmNWpYka6wnbzv3xLlnpz+/8V4yLPPnyXARufQxUBiaaQAjaVngJHxy7EIQfpeX1YDaLO5lWu0ndLCSYSg5ZbzK+7rQ2aBYbR5ThAosKMaoy6MHH4CSAwbiZ/Yfi2y9XVBARbcLFRaDYfJvRjTyFLGCiYePbtHuBEfPYJp12UKmEPT+nmhJ3W0m3LpUVXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcwYxAcPB960myYrq5oQXoH0v7z+ym1e/y8k8X4re90=;
 b=PO8F082YiAagWvJtwAV/cpy5zj1sHwsqD18jMDH71aOTD5rr0pcWV6ZSoVW6JlQz/nCMsk5WNCwtnJ8wYmCSQQVZewmfYaaUDCavDRfMmH+6M/d1E1eV5pLkRiO5TRRRcA979bSn+vT9wFfr+iJONBTFxH4jz33WVpmd229O+1A=
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
Subject: [RFC KERNEL PATCH v7 2/2] xen/privcmd: Add new syscall to get gsi from dev
Date: Wed, 15 May 2024 14:50:11 +0800
Message-ID: <20240515065011.13797-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515065011.13797-1-Jiqian.Chen@amd.com>
References: <20240515065011.13797-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|BY1PR12MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 96522366-1522-4902-667c-08dc74ab52f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XkkMZld4FOxuVGYl6xJEg2UAyYjIZxxtmqkNByGES0zePyuHySd/olj6zrh5?=
 =?us-ascii?Q?mWwDjTWAvsfJd0yey3LfcOAUPszuNilq8laBnuEoz9IntpPa9c5FViO3TgXo?=
 =?us-ascii?Q?Ug1cvQdQXwOqlrya3grdypEvs2vyQxQ6EErfLu+/TCFk+2gvmU4youfphJsW?=
 =?us-ascii?Q?FR7BBxCCBdk7JVCb7NyEABphhki69XtxygOpUU3hap/uP/RTHYP/7Tjb7W3U?=
 =?us-ascii?Q?7W0292Lt7ZJNq+AAQDZli1CXLf5Ip6kvWdEnSzLRtKF2+vNjg+DYGxiNYILd?=
 =?us-ascii?Q?N57QupOw+yfDFRd89buUkNROMHYS7gPmuv6/HkFILXkFERWIbx3j/6rfPdbC?=
 =?us-ascii?Q?+KBMxUk/Ua+jdDznUtxPaAI83CI3oksatkvOnfWPEkH2YuHGTkGdMtfesouD?=
 =?us-ascii?Q?5HhiiPfzgCNjG3a09x9zrY5Fo/5QBIkrg3tvJNJNVQEDbse3YKmLjhc8JLN/?=
 =?us-ascii?Q?onJIKcidrvAYq1E2FHLvKOeTYdfL6UFlCafFDx23TiFeSuN5LyQdqXQ3vCs6?=
 =?us-ascii?Q?jzHzHYY4eYfeU/AjUP6EBlRTTbU73iWnMBaaY3ajIuvd7zPlGbg5CGZx3vUU?=
 =?us-ascii?Q?FM2VBDDJTXjcYuUtEVLAMBKvIuzJ8qDCPNpCWrS+GHV7bhIJcBLOeDd2bQlW?=
 =?us-ascii?Q?uwu44AYA3SWqv+isjZvZKt40f2LGc1qB8d1HOSBfIEq1WA/tB9U3JbrobDDl?=
 =?us-ascii?Q?iPB2EMBgRWciL3Cs3k562LMjZ3xd5aNVnMOF7m4CunoeGb41+LIBMPhWbYQm?=
 =?us-ascii?Q?ahTMYTgWMoFK08UHtwsumw7XJ6jjRiEf0oAGkxw7ZQD2z4yagteGaDFlGP/Z?=
 =?us-ascii?Q?4mXB0ReJhMzYcHtoZPToYDMmLv0L5CP80uUKpcSDh0JKoO9EgD5oCSd2MbLP?=
 =?us-ascii?Q?skOv7/uxTrBHFAwYHOgbfXq5JXiAsmpbDcU3bDqkqNWKAaeZo05uSPFuq1dh?=
 =?us-ascii?Q?G1nUWPlAIsgeYXZ62GowjERojQMrYHr3j8laH/pfIJlpVt0RlhnDaZuUghlz?=
 =?us-ascii?Q?xmh66V7+X9+divEFLVDN8CDv5FXSBmtVKzc0D3mu7WWoOC+ZJbJram+XokXj?=
 =?us-ascii?Q?Cx+zs1YTtNzKm3us+MTpJzr7ZpfypcwvSsUlwvrOrFtLcKlnvGk8AvVGF5eW?=
 =?us-ascii?Q?jv4ZdbWMw5bN7tT1Vk/2OXo13C3Q+IooYfnvVc91xUlcfcaSypeWftnAfmJY?=
 =?us-ascii?Q?WnGf86RwvsZ1nuul+okQNw72HkmwvawgUQXZeKUxeHAKFKECkg3rE8nwYw3M?=
 =?us-ascii?Q?4xzF5Aqzha5suO9UX6ojE4YgVI6JNnMANuKC3BS4qhCXbAB0g2s/CSQNjUSk?=
 =?us-ascii?Q?hxudPpEMk7gk50JxxaDOxiXew89kHFmb8deMBV9t1W+FFs3dmHPGBd5+xHvd?=
 =?us-ascii?Q?daH9YUUrzEIQN5mPLJIhg7NKZcxA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 06:50:35.7987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96522366-1522-4902-667c-08dc74ab52f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8445

In PVH dom0, it uses the linux local interrupt mechanism,
when it allocs irq for a gsi, it is dynamic, and follow
the principle of applying first, distributing first. And
the irq number is alloced from small to large, but the
applying gsi number is not, may gsi 38 comes before gsi 28,
it causes the irq number is not equal with the gsi number.
And when passthrough a device, QEMU will use device's gsi
number to do pirq mapping, but the gsi number is got from
file /sys/bus/pci/devices/<sbdf>/irq, irq!= gsi, so it will
fail when mapping.
And in current linux codes, there is no method to get gsi
for userspace.

For above purpose, record gsi of pcistub devices when init
pcistub and add a new syscall into privcmd to let userspace
can get gsi when they have a need.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 drivers/xen/privcmd.c              | 28 ++++++++++++++++++++++
 drivers/xen/xen-pciback/pci_stub.c | 38 +++++++++++++++++++++++++++---
 include/uapi/xen/privcmd.h         |  7 ++++++
 include/xen/acpi.h                 |  2 ++
 4 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 67dfa4778864..5953a03b5cb0 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -45,6 +45,9 @@
 #include <xen/page.h>
 #include <xen/xen-ops.h>
 #include <xen/balloon.h>
+#ifdef CONFIG_ACPI
+#include <xen/acpi.h>
+#endif
 
 #include "privcmd.h"
 
@@ -842,6 +845,27 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 	return rc;
 }
 
+static long privcmd_ioctl_gsi_from_dev(struct file *file, void __user *udata)
+{
+	struct privcmd_gsi_from_dev kdata;
+
+	if (copy_from_user(&kdata, udata, sizeof(kdata)))
+		return -EFAULT;
+
+#ifdef CONFIG_ACPI
+	kdata.gsi = pcistub_get_gsi_from_sbdf(kdata.sbdf);
+	if (kdata.gsi == -1)
+		return -EINVAL;
+#else
+	kdata.gsi = -1;
+#endif
+
+	if (copy_to_user(udata, &kdata, sizeof(kdata)))
+		return -EFAULT;
+
+	return 0;
+}
+
 #ifdef CONFIG_XEN_PRIVCMD_EVENTFD
 /* Irqfd support */
 static struct workqueue_struct *irqfd_cleanup_wq;
@@ -1529,6 +1553,10 @@ static long privcmd_ioctl(struct file *file,
 		ret = privcmd_ioctl_ioeventfd(file, udata);
 		break;
 
+	case IOCTL_PRIVCMD_GSI_FROM_DEV:
+		ret = privcmd_ioctl_gsi_from_dev(file, udata);
+		break;
+
 	default:
 		break;
 	}
diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index 2b90d832d0a7..4b62b4d377a9 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -56,6 +56,9 @@ struct pcistub_device {
 
 	struct pci_dev *dev;
 	struct xen_pcibk_device *pdev;/* non-NULL if struct pci_dev is in use */
+#ifdef CONFIG_ACPI
+	int gsi;
+#endif
 };
 
 /* Access to pcistub_devices & seized_devices lists and the initialize_devices
@@ -88,6 +91,9 @@ static struct pcistub_device *pcistub_device_alloc(struct pci_dev *dev)
 
 	kref_init(&psdev->kref);
 	spin_lock_init(&psdev->lock);
+#ifdef CONFIG_ACPI
+	psdev->gsi = -1;
+#endif
 
 	return psdev;
 }
@@ -220,6 +226,25 @@ static struct pci_dev *pcistub_device_get_pci_dev(struct xen_pcibk_device *pdev,
 	return pci_dev;
 }
 
+#ifdef CONFIG_ACPI
+int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
+{
+	struct pcistub_device *psdev;
+	int domain = sbdf >> 16;
+	int bus = (sbdf >> 8) & 0xff;
+	int slot = (sbdf >> 3) & 0x1f;
+	int func = sbdf & 0x7;
+
+	psdev = pcistub_device_find(domain, bus, slot, func);
+
+	if (!psdev)
+		return -1;
+
+	return psdev->gsi;
+}
+EXPORT_SYMBOL_GPL(pcistub_get_gsi_from_sbdf);
+#endif
+
 struct pci_dev *pcistub_get_pci_dev_by_slot(struct xen_pcibk_device *pdev,
 					    int domain, int bus,
 					    int slot, int func)
@@ -367,14 +392,20 @@ static int pcistub_match(struct pci_dev *dev)
 	return found;
 }
 
-static int pcistub_init_device(struct pci_dev *dev)
+static int pcistub_init_device(struct pcistub_device *psdev)
 {
 	struct xen_pcibk_dev_data *dev_data;
+	struct pci_dev *dev;
 #ifdef CONFIG_ACPI
 	int gsi, trigger, polarity;
 #endif
 	int err = 0;
 
+	if (!psdev)
+		return -EINVAL;
+
+	dev = psdev->dev;
+
 	dev_dbg(&dev->dev, "initializing...\n");
 
 	/* The PCI backend is not intended to be a module (or to work with
@@ -448,6 +479,7 @@ static int pcistub_init_device(struct pci_dev *dev)
 		dev_err(&dev->dev, "Fail to get gsi info!\n");
 		goto config_release;
 	}
+	psdev->gsi = gsi;
 
 	if (xen_initial_domain() && xen_pvh_domain()) {
 		err = xen_pvh_setup_gsi(gsi, trigger, polarity);
@@ -495,7 +527,7 @@ static int __init pcistub_init_devices_late(void)
 
 		spin_unlock_irqrestore(&pcistub_devices_lock, flags);
 
-		err = pcistub_init_device(psdev->dev);
+		err = pcistub_init_device(psdev);
 		if (err) {
 			dev_err(&psdev->dev->dev,
 				"error %d initializing device\n", err);
@@ -565,7 +597,7 @@ static int pcistub_seize(struct pci_dev *dev,
 		spin_unlock_irqrestore(&pcistub_devices_lock, flags);
 
 		/* don't want irqs disabled when calling pcistub_init_device */
-		err = pcistub_init_device(psdev->dev);
+		err = pcistub_init_device(psdev);
 
 		spin_lock_irqsave(&pcistub_devices_lock, flags);
 
diff --git a/include/uapi/xen/privcmd.h b/include/uapi/xen/privcmd.h
index 8b8c5d1420fe..220e7670a113 100644
--- a/include/uapi/xen/privcmd.h
+++ b/include/uapi/xen/privcmd.h
@@ -126,6 +126,11 @@ struct privcmd_ioeventfd {
 	__u8 pad[2];
 };
 
+struct privcmd_gsi_from_dev {
+	__u32 sbdf;
+	int gsi;
+};
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -157,5 +162,7 @@ struct privcmd_ioeventfd {
 	_IOW('P', 8, struct privcmd_irqfd)
 #define IOCTL_PRIVCMD_IOEVENTFD					\
 	_IOW('P', 9, struct privcmd_ioeventfd)
+#define IOCTL_PRIVCMD_GSI_FROM_DEV				\
+	_IOC(_IOC_NONE, 'P', 10, sizeof(struct privcmd_gsi_from_dev))
 
 #endif /* __LINUX_PUBLIC_PRIVCMD_H__ */
diff --git a/include/xen/acpi.h b/include/xen/acpi.h
index 9b50027113f3..0bf5f4884456 100644
--- a/include/xen/acpi.h
+++ b/include/xen/acpi.h
@@ -83,4 +83,6 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
 						  int *gsi_out,
 						  int *trigger_out,
 						  int *polarity_out);
+
+int pcistub_get_gsi_from_sbdf(unsigned int sbdf);
 #endif	/* _XEN_ACPI_H */
-- 
2.34.1


