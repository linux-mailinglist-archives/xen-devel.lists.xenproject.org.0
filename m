Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388847F720D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:50:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640521.998885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TlV-00083r-Dd; Fri, 24 Nov 2023 10:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640521.998885; Fri, 24 Nov 2023 10:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TlV-00080P-Ah; Fri, 24 Nov 2023 10:50:29 +0000
Received: by outflank-mailman (input) for mailman id 640521;
 Fri, 24 Nov 2023 10:50:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibx+=HF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r6TlT-0007zI-HQ
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:50:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45a069aa-8ab7-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:50:25 +0100 (CET)
Received: from BN8PR16CA0014.namprd16.prod.outlook.com (2603:10b6:408:4c::27)
 by PH7PR12MB5711.namprd12.prod.outlook.com (2603:10b6:510:1e2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 10:50:19 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:408:4c:cafe::d) by BN8PR16CA0014.outlook.office365.com
 (2603:10b6:408:4c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Fri, 24 Nov 2023 10:50:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 10:50:19 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 04:50:15 -0600
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
X-Inumbo-ID: 45a069aa-8ab7-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnEyl2FgJ/V3hgFoB0Tbqtn0+/sGKFKLn2XWuQgPVFud4gZ0NfhX3OBDDMK9LN28Qbf4pDb9pubswKR6C7jSygtwnpf5j2RngYm4QUvVXIsFCe7p2TH5BYX8RZ329Yrjc/ICIVuW6kWk78+Icz+cGrpcsUDP/comCGASXhS2RnnFharABFa9AsEu1dCM3iYb83HEHEYlGmMFneAcnZ8MTZye/4eaVU8d9axgOrbEK75RPnvLqbx5IdY8jp9P7sRmb+urc0smYQ2iahPDY6c4Kl9/OUbyxYiIB9rlublRT572fZG6jNKhVqIYn5t2gK2n8cZfijz+Ni6z3bWaN/OgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKyGINHRoWX/kzEUupQXPi7BRjW+7wniSgf5HCNyhN4=;
 b=TCYOsSGAzL9yeRHr/cymVHFlMnG2/vme563Sa0it6/BPPouRWhs0WMzE2B9WzcyDz6w2h6rlDHS8zPuvwpsTQpznPLuZXyp91ZKFQYjaufLLtD+JnOImJxRTivTkfNld1qapvcsW0Zt1UCY8S9WjFZLBJnghckJmIed00At+b8huPcFqOhybOHGE/LDhDfa59wfH8aw/w85GktRUJkJcITNlXEm2Cal9FF42hQE2Stz1pV7Qug48P51d6Tw5fx4nPtFD3PPYrZnLMevJXdrmo1Uqv3ZWxWIAELV9Eza56vwSRtyWvCsUOqM+wPMO+E6vvCu0Knsa2cmuiBNBfwWTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKyGINHRoWX/kzEUupQXPi7BRjW+7wniSgf5HCNyhN4=;
 b=DeqmDflkX5I8tA7hPUNtQsavErV4D/UccNyiGTfShjq1TrtFDb/7pSZkrL7F6UWFxx0IIpu+b+ZLR66F2oOje3EsXsSnQBtO0zl2yKlEF6Pamxq7kIRdduQyWEWotV0G8fSW+1XLmvSMCIzbM2e03jRlMvxVafFYj9FEYLHabGc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>, <qemu-devel@nongnu.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Alex Deucher <Alexander.Deucher@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang
	<Julia.Zhang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC QEMU PATCH v2 1/1] xen/pci: get gsi from irq for passthrough devices
Date: Fri, 24 Nov 2023 18:49:51 +0800
Message-ID: <20231124104951.3263782-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124104951.3263782-1-Jiqian.Chen@amd.com>
References: <20231124104951.3263782-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|PH7PR12MB5711:EE_
X-MS-Office365-Filtering-Correlation-Id: b99d2e1b-84f9-4de9-bbba-08dbecdb2695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z3DuUdFh1k6EjLQJSkthrL3x1U9qR/zkH8hun3xTj9nfpKSmQGkNL5E0vh9DPswATidiYU5gjCuBDF/cdu2ajrof7DIKqQTfcqZ1JbqY52lf6XKILrZoI+H6OBmosJ00E64bRwcy8X0goGZg8p5XqL1ggRAFZp7YB/6S0q9IzIvqXsaPkBVHwV2alVZTnkhUK3sFKaMANOxk82zvkdpkQcOO0qCoxC4/dtvtu8yw/28y8Me1Z9p8ZA88S4u9hzAFI5fpq55iajdbOlxqnM6RZlR4O+k9xsPPvg2okctVVi62IyYgXystBeNnKPH3AtvP9dSL4Dq4CUHaJPeAnD6D/Isomp2h95UmHil6SQhtYAD03EC65/doukz2itZb/9iTXhEXe7UIageTokUj/O6ZBhyU4HVGhzxmc+RLvjZhzSZXM6sof7MmsRmC4fdRRtH8wcgk9seD57Zh7hl3nyYUZjYf/yx0bCa96P/H+swJYx9r5dX+vM/NzrA9wN8PrAoWWYVhnFkFsqgtw4irKarbj/YUCP5rpbrPqWkknCAcjCijktLdvYi4Br7I0FFR74PE1t3tCNsh2TE/VWELd+L82ELIwI5wmZIs2EwxmEuI/GpAYDx8NZ004sUAmzXDdOGb8UQLgI/P0UFAIqXgaxWZHTVHTY13J/V1z06fRDB8o9bXdrOaA8H4DgZ7UfvsLXZHvAXtnx2Tq5+dBeKzY3vnjRRBzrT2jBe+djayMUrantDRzg2MI5rMwSDAi6HKTx7YuzdD7HB2qYfIdp9Zf4OCtg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(36840700001)(40470700004)(46966006)(2906002)(36860700001)(5660300002)(40460700003)(47076005)(36756003)(86362001)(41300700001)(81166007)(70586007)(82740400003)(40480700001)(356005)(26005)(1076003)(70206006)(16526019)(2616005)(336012)(110136005)(54906003)(316002)(7696005)(6666004)(478600001)(4326008)(83380400001)(8676002)(8936002)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 10:50:19.1772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b99d2e1b-84f9-4de9-bbba-08dbecdb2695
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5711

In PVH dom0, it uses the linux local interrupt mechanism,
when it allocs irq for a gsi, it is dynamic, and follow
the principle of applying first, distributing first. And
if you debug the kernel codes, you will find the irq
number is alloced from small to large, but the applying
gsi number is not, may gsi 38 comes before gsi 28, that
causes the irq number is not equal with the gsi number.
And when we passthrough a device, QEMU will use its gsi
number to do mapping actions, see xen_pt_realize->
xc_physdev_map_pirq, but the gsi number is got from file
/sys/bus/pci/devices/xxxx:xx:xx.x/irq in current code,
that is irq not gsi, so it will fail when mapping.

For above reason, on Xen side, we add a new function to
translate irq to gsi. And at here, we call that function
to get the correct gsi number.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 hw/xen/xen-host-pci-device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index 8c6e9a1716..00218f9080 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -10,6 +10,7 @@
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "xen-host-pci-device.h"
+#include "hw/xen/xen_native.h"
 
 #define XEN_HOST_PCI_MAX_EXT_CAP \
     ((PCIE_CONFIG_SPACE_SIZE - PCI_CONFIG_SPACE_SIZE) / (PCI_CAP_SIZEOF + 4))
@@ -368,7 +369,7 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     if (*errp) {
         goto error;
     }
-    d->irq = v;
+    d->irq = xc_physdev_gsi_from_irq(xen_xc, v);
 
     xen_host_pci_get_hex_value(d, "class", &v, errp);
     if (*errp) {
-- 
2.34.1


