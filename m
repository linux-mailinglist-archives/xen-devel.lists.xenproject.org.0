Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43583824F01
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 08:10:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661986.1031894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeLI-0003Ex-SN; Fri, 05 Jan 2024 07:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661986.1031894; Fri, 05 Jan 2024 07:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeLI-0003CC-Oh; Fri, 05 Jan 2024 07:10:08 +0000
Received: by outflank-mailman (input) for mailman id 661986;
 Fri, 05 Jan 2024 07:10:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI+5=IP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rLeLH-0000zs-6J
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 07:10:07 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73a1e0ba-ab99-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 08:10:06 +0100 (CET)
Received: from PH8PR02CA0014.namprd02.prod.outlook.com (2603:10b6:510:2d0::6)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 07:10:03 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::ba) by PH8PR02CA0014.outlook.office365.com
 (2603:10b6:510:2d0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16 via Frontend
 Transport; Fri, 5 Jan 2024 07:10:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:10:02 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:09:58 -0600
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
X-Inumbo-ID: 73a1e0ba-ab99-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3C+oTNhuBwj3rsR7miV3w+HLziQBdXp4DsiuaYVP7tsvlX9uIiusqVowmM6aUiu2bHvTbBmcc3b181styYKoEtu5pBgTYh8o8foJtOi0AKqygIEFIAR577QBmNDLV2Gg7EFXEUDNoFPQCCI+NVWbJvU0z2Td4fs7ioj7w267i+zNzxni0Bep59lP80SmcM1IrJNtPoNiudmWCpLSlL3uX00jjkBlhM8+1iRYFEpOEc6yRr7cZ5HPAKnHqxgT4CYKredrb4Lui9WC7X9kUWU/wC0c483cDTwOk0UXUKSKOytuPd/cr8OTa08WHVeNxroMJ4ZssWOhFmLN39rXRegrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUq05x2O7uEZgBZIRC0Zh7w0rJnudKOWKK8/cz1mH6c=;
 b=d3I75IWvfiL4DdrWIWW63HxL89rCgfmVm27OyVIJi4QB81cnJgJgY2Hh6HMuCPKVu1gCbop/EU6oiq9+75hzVRJUiU9Qpizsjk1Y6FwnSuELrwJ5Eo7AteFS2Wj1BKvdk7stxt1eCHPvWDj07LYDDp8I/i7TEtb8CNosRbztH0ej2CkKnAkbOjkKOPFEsLaCnkj1OgaMB7q/ox5hK+hgtqxnMyqSylLGyp/mP9Pt04cKoa/fsG3tY9QzqfhEJn2nPDPMtfulP3gMNpuqneGzoAZgMKNLvinXT5XhhOgqwDSkI1aZYVgGrRGucKqdZ6ZktwY8U3kf8PYZhW1BoxO5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUq05x2O7uEZgBZIRC0Zh7w0rJnudKOWKK8/cz1mH6c=;
 b=JGCakPB634yiCJzhF7Y8rbzZjptLPnYwqdehwNeeDahBs5qkDbNZm3Ceyjr7Sk3PnyevQNIb66bl+3fUQePeEh1YtV+Ci1Ob17gdYxlp2t8afdCYsizlVF4bPByESSTFFQkXFy6TSNYcbG4U+Tc0SCVa34mVmK7AbcH+haPTRhk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v4 5/5] libxl: Use gsi instead of irq for mapping pirq
Date: Fri, 5 Jan 2024 15:09:20 +0800
Message-ID: <20240105070920.350113-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105070920.350113-1-Jiqian.Chen@amd.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d409d16-f7fe-4b58-e408-08dc0dbd566d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	36h4mVC2Nan1+C+2eYJ7p9MNUGORmlQ9ywT07P0INSXpHhWEI8a/6DKMIiHfvMm3EdtKtiLgBqy2K0QiEWkQDLqAcuPZm1xQ+YOIt31bXfG9Z+WFfT4GfxXbHBpxQOhQJ0/POt5zwRcCAN0sdeQ0fil51h2V0vnbgBOqwEqEa+9wydC7+WxLo/WJeQcHq1v4vEpHlmNTp/GmJIgmlROLvRfG07azK/BdlFRWSau5TTEEnD2Qiwq+lP1uz0VhGHOccj5i/JL814YCvnD20A2kmLb3qQ6oaY3FMa+5xWrM7X3YSYnX6BJh+KpEBhfq2sXn56n3gHLSdeE76Xj3eUCR3CxbzQDPBblmeTDqZRAmRabIyD7MVHHrnwJ3sFXVlVeRZyYWu8oMCgDDX4bTO4ciAy2Lu1WMXxgfsQKzi5ET9xGvTC9LrsxMav8cpSzQVG2m9bCAo8p8ygQIusX4hC6AVBoruzphakJ482p6nb+31bnLKLWBoGO69gHVbgZrWFSlsn7vjmK37Ihki6f7j7h0mwcKUyQpfEHSF6zzLgwKhFKM7FpsH8boXZNTC+GOz8fP63R6K3dbYTIO/qU6mD4CFWC60s/EiewSgOaAr/hC2UhmYhMxDYDeTdehOi7kTJEtDsDDp1brczGa1TH/Vlogq/1zvXOvsMxozL6aR4QoCNYbwVZyNKWWW1b+/uk7x5Z9YZ2WGL1WO+BArQwse3zt5AExFGiRSVuVvj8KWr2OJ7TZWnil+Ctsi8JxyBEzlfRmhmKk2jw+cY1gZURCExqXxQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(82740400003)(6916009)(70586007)(86362001)(36860700001)(356005)(47076005)(81166007)(70206006)(16526019)(6666004)(26005)(2616005)(1076003)(7696005)(426003)(336012)(5660300002)(7416002)(2906002)(36756003)(478600001)(83380400001)(54906003)(316002)(8936002)(8676002)(4326008)(40460700003)(40480700001)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:10:02.9165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d409d16-f7fe-4b58-e408-08dc0dbd566d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275

In PVH dom0, it uses the linux local interrupt mechanism,
when it allocs irq for a gsi, it is dynamic, and follow
the principle of applying first, distributing first. And
the irq number is alloced from small to large, but the
applying gsi number is not, may gsi 38 comes before gsi
28, that causes the irq number is not equal with the gsi
number. And when passthrough a device, xl wants to use
gsi to map pirq, see pci_add_dm_done->xc_physdev_map_pirq,
but the gsi number is got from file
/sys/bus/pci/devices/<sbdf>/irq in current code, so it
will fail when mapping.

So, use real gsi number read from gsi sysfs.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 tools/libs/light/libxl_pci.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index e1341d1e9850..ab51dc099725 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1479,8 +1479,14 @@ static void pci_add_dm_done(libxl__egc *egc,
     fclose(f);
     if (!pci_supp_legacy_irq())
         goto out_no_irq;
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
                                 pci->bus, pci->dev, pci->func);
+
+    if (access(sysfs_path, F_OK) != 0) {
+        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                                pci->bus, pci->dev, pci->func);
+    }
+
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
         LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
@@ -2231,9 +2237,14 @@ skip_bar:
     if (!pci_supp_legacy_irq())
         goto skip_legacy_irq;
 
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
                            pci->bus, pci->dev, pci->func);
 
+    if (access(sysfs_path, F_OK) != 0) {
+        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                           pci->bus, pci->dev, pci->func);
+    }
+
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
         LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
-- 
2.34.1


