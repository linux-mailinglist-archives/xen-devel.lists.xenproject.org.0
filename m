Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF838AA748
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 05:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708659.1107680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxf3P-0004PV-OM; Fri, 19 Apr 2024 03:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708659.1107680; Fri, 19 Apr 2024 03:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxf3P-0004Ju-Ks; Fri, 19 Apr 2024 03:36:47 +0000
Received: by outflank-mailman (input) for mailman id 708659;
 Fri, 19 Apr 2024 03:36:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1xH=LY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rxf3O-0004I0-0Q
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 03:36:46 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09baebce-fdfe-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 05:36:44 +0200 (CEST)
Received: from SJ0PR03CA0002.namprd03.prod.outlook.com (2603:10b6:a03:33a::7)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.42; Fri, 19 Apr
 2024 03:36:39 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::8e) by SJ0PR03CA0002.outlook.office365.com
 (2603:10b6:a03:33a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.30 via Frontend
 Transport; Fri, 19 Apr 2024 03:36:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 03:36:38 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 22:36:34 -0500
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
X-Inumbo-ID: 09baebce-fdfe-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGhYQ7NtwSCAaYKuU2crwI1YeLLWcdvol4nAUJp96+ERCTy5kwyYSxNXLjRUMdbgIfXAW3rWZQ4NmuUkDC1AAV0uKsT+j14aa5nxDI8Ljy2rBn85F1+45F7yV5jILAI9RcVuMz95w09bt5w/C90VDg+VjbtfvppDiGBHpGSsphfL1l3wveYFd7LOckCu5MmFXxjawt0ggN/ZEtaF3OcmMCpvPodkgwJuuEddbQTvvD7OI+sJXquGrpiraN1nN8c9URY26K8B61Dicrc1TdCGfJ2iqHzfuFRnB1A8WKmrvgEMCu2TJ5d5ayXp8bVVXjzgAJKh7DcnTdGxfKbMc1gxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fH+U2QOk6dVHLf7A7/6oScHHVZmq0WKT97i+j9mEzp4=;
 b=i85AjmCWy+M3ZEBepl2Nq59YXcoc6gV/Lj//+T0FFNE0Xzuzhu+rsIjefyHZiVq0Ru88xa1+Jh9QKK40fsnykJvFGzBedsAveFyEB4PiQABBlpdeQlb28OW4Id6HRtqBBw9uh/AhWG8JjPXdlMGypeR5gxB8SrKaOriIQYR/7PCSAeFclqFjm/slcsOQkFrF8JmcrnbHQN03LCxHoj8zFI3t0Y/taNDae9OfaI1SysMdcBhDxjt8j8YZNdX3iRXqDTY1qyqYTuGuNpe6Fg22qVVQ7+HP2ove3PwQCSs1VNEX328/5mjUo1bRKxkc0cVQBZk2QY0rg7Eai03+U3cxOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fH+U2QOk6dVHLf7A7/6oScHHVZmq0WKT97i+j9mEzp4=;
 b=pzkHItGWf7f3C8490mOg0PiK5ANdX4dsjwRE5p8S/R9iiTEDNSdKddyhHYyi1aqyiNW1qfQT5IwVhB2VQSj0FU1lZ9OFTb5gVIm5kNvd9xpH4is2CqmoQuCmc4ixYl8FrO9fgu8eWGe0M2T83kSX/wRAeP8kXkJ02XTf0rjNsAM=
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
Subject: [KERNEL PATCH v6 1/3] xen/pci: Add xen_reset_device_state function
Date: Fri, 19 Apr 2024 11:36:14 +0800
Message-ID: <20240419033616.607889-2-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: c12128c5-aabb-4469-36c3-08dc6021ebf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g+p0bmZwfrBJE13pko0I1HILECJfHpfFxqVPKqJYP3l4CqZDJBadK/5vmoCSRTRkXxA89wK43cRs53vxouxemLYkcIaCook43SVOklZZ1aO1g/tDJ+JxRcJTA8Q0wcFEaM77Wwca+IyNJIg92UuoMf419dKWDyYaJEBiBnsbuAPu1si0tmXYb+IG6a4M8C4MyDrK+M4DcH9yyoURlz9tZ2Qw0Qjq5UHTITrB4UNPBbC2fD31IDDZ/jiZGBozzCgpLnX7yaL6ynTC+di8VcIMYOeQozO3BauVRUM7mEzix8KzXOD6uLZqsYOUXgO2whialrH84E2Musup7xRvQ3Offsjctyu6EkcVBJ12OeVRlXKfp2NsLWeNkIIxUVCALaref/9kZw4lcR1fm0SwmE8UZxhnDRanj3/5NTKdhnTMvmDFPNXyV8QdukeV/7ObFOVLM1X7J9sySyRUsvqLMQnyn0TnRg/wWWfFxsQk4TsiGoR+nvK7cWqQWTVIl92ZLUrX3Cvmn6CKp3ZddXtW8n7qeaQgw4Z2cKzBY9WQCstDjExQ8rlo0EovJ4wQXKWOgnqbvxJmVV4qajXayXUrCqzChKeWKd+YIaS6PwBMcJBUYmB+Kyck5tN0mPfQ4CQMs/VALpvBMOJc/eFSLGikdihL1oTV1JoJI5VKiqHf5L+BrrfEX0xAqO9+rKdxLYHuhElHo7Tc2eHIWJuxxFWyk43I9fGV1HE8Dy4Q9hHgN4Oy5IJe/yzKVLf6sWoQjOemqu5y
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 03:36:38.6146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c12128c5-aabb-4469-36c3-08dc6021ebf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995

When device on dom0 side has been reset, the vpci on Xen side
won't get notification, so that the cached state in vpci is
all out of date with the real device state.
To solve that problem, add a new function to clear all vpci
device state when device is reset on dom0 side.

And call that function in pcistub_init_device. Because when
using "pci-assignable-add" to assign a passthrough device in
Xen, it will reset passthrough device and the vpci state will
out of date, and then device will fail to restore bar state.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 drivers/xen/pci.c                  | 12 ++++++++++++
 drivers/xen/xen-pciback/pci_stub.c | 18 +++++++++++++++---
 include/xen/interface/physdev.h    |  7 +++++++
 include/xen/pci.h                  |  6 ++++++
 4 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
index 72d4e3f193af..e9b30bc09139 100644
--- a/drivers/xen/pci.c
+++ b/drivers/xen/pci.c
@@ -177,6 +177,18 @@ static int xen_remove_device(struct device *dev)
 	return r;
 }
 
+int xen_reset_device_state(const struct pci_dev *dev)
+{
+	struct physdev_pci_device device = {
+		.seg = pci_domain_nr(dev->bus),
+		.bus = dev->bus->number,
+		.devfn = dev->devfn
+	};
+
+	return HYPERVISOR_physdev_op(PHYSDEVOP_pci_device_state_reset, &device);
+}
+EXPORT_SYMBOL_GPL(xen_reset_device_state);
+
 static int xen_pci_notifier(struct notifier_block *nb,
 			    unsigned long action, void *data)
 {
diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index e34b623e4b41..46c40ec8a18e 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -89,6 +89,16 @@ static struct pcistub_device *pcistub_device_alloc(struct pci_dev *dev)
 	return psdev;
 }
 
+static int pcistub_reset_device_state(struct pci_dev *dev)
+{
+	__pci_reset_function_locked(dev);
+
+	if (!xen_pv_domain())
+		return xen_reset_device_state(dev);
+	else
+		return 0;
+}
+
 /* Don't call this directly as it's called by pcistub_device_put */
 static void pcistub_device_release(struct kref *kref)
 {
@@ -107,7 +117,7 @@ static void pcistub_device_release(struct kref *kref)
 	/* Call the reset function which does not take lock as this
 	 * is called from "unbind" which takes a device_lock mutex.
 	 */
-	__pci_reset_function_locked(dev);
+	pcistub_reset_device_state(dev);
 	if (dev_data &&
 	    pci_load_and_free_saved_state(dev, &dev_data->pci_saved_state))
 		dev_info(&dev->dev, "Could not reload PCI state\n");
@@ -284,7 +294,7 @@ void pcistub_put_pci_dev(struct pci_dev *dev)
 	 * (so it's ready for the next domain)
 	 */
 	device_lock_assert(&dev->dev);
-	__pci_reset_function_locked(dev);
+	pcistub_reset_device_state(dev);
 
 	dev_data = pci_get_drvdata(dev);
 	ret = pci_load_saved_state(dev, dev_data->pci_saved_state);
@@ -420,7 +430,9 @@ static int pcistub_init_device(struct pci_dev *dev)
 		dev_err(&dev->dev, "Could not store PCI conf saved state!\n");
 	else {
 		dev_dbg(&dev->dev, "resetting (FLR, D3, etc) the device\n");
-		__pci_reset_function_locked(dev);
+		err = pcistub_reset_device_state(dev);
+		if (err)
+			goto config_release;
 		pci_restore_state(dev);
 	}
 	/* Now disable the device (this also ensures some private device
diff --git a/include/xen/interface/physdev.h b/include/xen/interface/physdev.h
index a237af867873..8609770e28f5 100644
--- a/include/xen/interface/physdev.h
+++ b/include/xen/interface/physdev.h
@@ -256,6 +256,13 @@ struct physdev_pci_device_add {
  */
 #define PHYSDEVOP_prepare_msix          30
 #define PHYSDEVOP_release_msix          31
+/*
+ * Notify the hypervisor that a PCI device has been reset, so that any
+ * internally cached state is regenerated.  Should be called after any
+ * device reset performed by the hardware domain.
+ */
+#define PHYSDEVOP_pci_device_state_reset     32
+
 struct physdev_pci_device {
     /* IN */
     uint16_t seg;
diff --git a/include/xen/pci.h b/include/xen/pci.h
index b8337cf85fd1..b2e2e856efd6 100644
--- a/include/xen/pci.h
+++ b/include/xen/pci.h
@@ -4,10 +4,16 @@
 #define __XEN_PCI_H__
 
 #if defined(CONFIG_XEN_DOM0)
+int xen_reset_device_state(const struct pci_dev *dev);
 int xen_find_device_domain_owner(struct pci_dev *dev);
 int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
 int xen_unregister_device_domain_owner(struct pci_dev *dev);
 #else
+static inline int xen_reset_device_state(const struct pci_dev *dev)
+{
+	return -1;
+}
+
 static inline int xen_find_device_domain_owner(struct pci_dev *dev)
 {
 	return -1;
-- 
2.34.1


