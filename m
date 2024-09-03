Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53974969498
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788646.1198110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNbB-0003zH-10; Tue, 03 Sep 2024 07:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788646.1198110; Tue, 03 Sep 2024 07:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNbA-0003wf-TM; Tue, 03 Sep 2024 07:05:08 +0000
Received: by outflank-mailman (input) for mailman id 788646;
 Tue, 03 Sep 2024 07:05:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqql=QB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1slNb9-0003uZ-FH
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:05:07 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [2a01:111:f403:2416::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8367e07-69c2-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 09:05:05 +0200 (CEST)
Received: from CH0PR03CA0056.namprd03.prod.outlook.com (2603:10b6:610:b3::31)
 by LV8PR12MB9153.namprd12.prod.outlook.com (2603:10b6:408:185::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.22; Tue, 3 Sep
 2024 07:05:00 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::2c) by CH0PR03CA0056.outlook.office365.com
 (2603:10b6:610:b3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Tue, 3 Sep 2024 07:05:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 07:05:00 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 02:04:53 -0500
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
X-Inumbo-ID: d8367e07-69c2-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wq+FwHO5B00tFmHB3I6scnp4b8NszCVSAqOmLcft0SXfqM+MnnB1+OoYz7xv9ohqexDXgQpPc6NUAOXg619NELZgUOHo5ftWhTqpeC9Q/aLpNH5MeasDDLZXnIuxQzvaTnh+gcEediVmwWjTKO1GOnVV6hY6YdPYDHGZCcwi4LXX+V/4jmfBOJLrAsCs87M1R+Y9Vsa8FZbysZW3+fi5we5yGQtqu9AVffkhCEOHzwaX02Wgw81lbnYMzyXhnneLbrufZk5Kd+7F35+rKvwGG66oAFKo6TwiBAL7du+NuJiUH0fJgmxxdiFKagJBw1haDo98BpG1YEQb1GUgPbvjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuRWZLTbP/BXZlowQG7KxvDYA4onuBtf24AGZNOyO1w=;
 b=RI+TefKp9IZYMqBv2gD60U/uulU+guAkBSiP3h2dHf6LOUZlZxjdt27dAaMfwGMHcdu1JpzZ51MXgeBKVKWXGhGcZUSpSXoybdXayWKBAglfE+/YdlOWnotWIexKjP41apcJ3hmBqgQY7S7cthKTKQBSEtOeg3IV5ROwY2V5tIXqnfr0CMyxQWsULWVj4v3Izdl1irVfjn1fsARcRvzu78/LmTiwZgMOb0MURjm2GTgTbgGjK7OioPI2vQG5IhLMMVSOTfVJ64n0YFIdK/Y4l1J1CZ28ciUHcs581yt+MidD95Jmh2/JqYcxgrMTeoUJAf8r1AD/sPOYiBgJwrtqfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuRWZLTbP/BXZlowQG7KxvDYA4onuBtf24AGZNOyO1w=;
 b=nP/yY/66aDZTn0WTKWEPo5MJqrSKEPbpm62FbexdpKivlKubd1XTE9+R6nuL8v7CmcfvbhIyg8V9RaT3cXx5890N8Lj4+lICD2smK5Mu1DeSlbDjg3jAwHhUuG/4JrmJuzyAWkqY+C2cEHqZ5/z3B0DaAGTUSVBJqN2tGyLJW3s=
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
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v14 4/5] tools: Add new function to get gsi from dev
Date: Tue, 3 Sep 2024 15:04:23 +0800
Message-ID: <20240903070424.982218-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903070424.982218-1-Jiqian.Chen@amd.com>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|LV8PR12MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: ace9f769-eeac-4f6d-8fd9-08dccbe6ba05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FQ9qc8TdHcERbOEVWPX5yMP1j6ZpQ0q4aleWXeG2nAFa6hr4j5Gzx9FTpHEq?=
 =?us-ascii?Q?rJTW/pIIBjfcCBxjYc2EAner3i+9khVcgs2FYMNvYDY41YQ/+JRez3sJ6ve1?=
 =?us-ascii?Q?pm6lCwYhRkrO2aVsy2SoZbj/rpagZ1il832ppf+Sdqdci8/iVw8XpRUxEIsA?=
 =?us-ascii?Q?lHx5zfYE13OKCKR/fQwDMxXk5FTCJ929KSoaAfxEKs7ndQ/cBfnS0x0Zs+rU?=
 =?us-ascii?Q?hgIOxpAmPoXrxP+S0WCMo9kautb4QWdITu3rEiKgSkBlHqgS2bl1Qgij6zfK?=
 =?us-ascii?Q?DqhYg1axZ7BRPGszUok0ImsLFRhHV8UwlGkhoG2dJvnRa30e2RVNPlaM2wqk?=
 =?us-ascii?Q?yWT3ptNPQzxe6B3Cbw1AgF8HtASpjjNNSeF1EDXaub+Jf0BwCxaMCTNgg7EE?=
 =?us-ascii?Q?DcoL+87L2BFJ+JJYO5u0i+PaQ2LXkirr0U3Aa0eQS0X6jSe4Q8eQV29APGSx?=
 =?us-ascii?Q?iOxrfXvDerfdyOVuyOVjQCcum1CoF7ogporSOYiyCuTCyhWQeFY8ndGwbvGD?=
 =?us-ascii?Q?m00NaFUpFzziHAlNOG3cmrsVKP3twBmgdHKUIHWM7OXeqLdYrJ5LeZ7kymI8?=
 =?us-ascii?Q?mtht8XS8gJe1hr8lVNsu82j719VJhHQhuzTRaMpLQDt6t6tivwMQVHZ3DOBo?=
 =?us-ascii?Q?+I5kjBFq3tzsPuYeUwyV9FFZ+5gc6f5ONW9QUBKBCOKc09uwSYUYo26p+9zN?=
 =?us-ascii?Q?tE5USUNi9FO7jq4Dx5nsfv5Nd1DRyGXAYMqpVM1rFWlj0LGZfeKeN06A+YpG?=
 =?us-ascii?Q?t/VwqhcHKpErgxZv4rqaSl1JgNI0zJUj1wxYz7YwzMsy0TLlMWSf34S+xT6x?=
 =?us-ascii?Q?/ut5VQHCIxx1qs1PDNUmbHT2vy71bMQteJOTF1RaE6N6ppa/+zeK9C4g4IDj?=
 =?us-ascii?Q?wQDbUCA7qoCAvi3q/HSahgXGryHc87Wga2lPENtkZBYB+CqcVqkWMBibWzLu?=
 =?us-ascii?Q?sb2KXvuwpjgH4Pq2QWMNeQPy6Ub6s4gmgcPO7J8Zlq7gi6mn1xjiCxJyp2mO?=
 =?us-ascii?Q?Kv5YT79gVk3QQ+I2xw1QaH/qLJ796mdo7z+OQq5iU4Yqu/ZrHJjPd5JlAPOO?=
 =?us-ascii?Q?5s3eJyonX8dIy5BQohWepFY8MSnlwIn/SlHhzqJnVaHh1VAom5A/E8ugPq5w?=
 =?us-ascii?Q?NsLzTJUKbt0eoj067fWS0sNcRh6EZYkoZf++tW4BR8CEySv+0ypE1giHJzQc?=
 =?us-ascii?Q?ztDcXXkzBLFLUlaitaABfS8wL2bqFlh9fPVn6r2HdNcrAtr2RAeFr7hofPXC?=
 =?us-ascii?Q?4AOvmpwSeOU2fCjAjhGGK0s3zmz1TAVEBfdJ1orodZBDFEU+5bVxuJJsP4VJ?=
 =?us-ascii?Q?ywDcfv+fBocFBvfj/sC3DOvFmPMw+wTCCfsRb7qPq3ZX0d0KwwRvOOP3Mo2e?=
 =?us-ascii?Q?Byyuw1QmKVI9cslHYKd2wDEqwyr96ClRNg74hGMslUSfAdX3RJkaQsGRZhxL?=
 =?us-ascii?Q?vLsx07DrJr/+tothylVBo1K7Po1reH95?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:05:00.0642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ace9f769-eeac-4f6d-8fd9-08dccbe6ba05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9153

When passthrough a device to domU, QEMU and xl tools use its gsi
number to do pirq mapping, see QEMU code
xen_pt_realize->xc_physdev_map_pirq, and xl code
pci_add_dm_done->xc_physdev_map_pirq, but the gsi number is got
from file /sys/bus/pci/devices/<sbdf>/irq, that is wrong, because
irq is not equal with gsi, they are in different spaces, so pirq
mapping fails.

And in current codes, there is no method to get gsi for userspace.
For above purpose, add new function to get gsi, and the
corresponding ioctl is implemented on linux kernel side.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
---
RFC: it needs to wait for the corresponding third patch on linux kernel side to be merged.
https://lore.kernel.org/xen-devel/20240607075109.126277-4-Jiqian.Chen@amd.com/
---
v13->v14 changes:
No.

v12->v13 changes:
Rename the function xc_physdev_gsi_from_pcidev to xc_pcidev_get_gsi to avoid confusion with physdev namesapce.
Move the implementation of xc_pcidev_get_gsi into xc_linux.c.
Directly use xencall_fd(xch->xcall) in the function xc_pcidev_get_gsi instead of opening "privcmd".

v11->v12 changes:
Nothing.

v10->v11 changes:
Patch#4 of v10, directly open "/dev/xen/privcmd" in the function xc_physdev_gsi_from_dev instead of adding unnecessary functions to libxencall.
Change the type of gsi in the structure privcmd_gsi_from_dev from int to u32.

v9->v10 changes:
Extract the implementation of xc_physdev_gsi_from_dev to be a new patch.
---
 tools/include/xen-sys/Linux/privcmd.h |  7 +++++++
 tools/include/xenctrl.h               |  2 ++
 tools/libs/ctrl/xc_freebsd.c          |  6 ++++++
 tools/libs/ctrl/xc_linux.c            | 20 ++++++++++++++++++++
 tools/libs/ctrl/xc_minios.c           |  6 ++++++
 tools/libs/ctrl/xc_netbsd.c           |  6 ++++++
 tools/libs/ctrl/xc_solaris.c          |  6 ++++++
 7 files changed, 53 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index bc60e8fd55eb..607dfa2287bc 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
 	__u64 addr;
 } privcmd_mmap_resource_t;
 
+typedef struct privcmd_pcidev_get_gsi {
+	__u32 sbdf;
+	__u32 gsi;
+} privcmd_pcidev_get_gsi_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -114,6 +119,8 @@ typedef struct privcmd_mmap_resource {
 	_IOC(_IOC_NONE, 'P', 6, sizeof(domid_t))
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
+#define IOCTL_PRIVCMD_PCIDEV_GET_GSI			\
+	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_pcidev_get_gsi_t))
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2c4608c09ab0..924f9a35f790 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1642,6 +1642,8 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
                           uint32_t domid,
                           int pirq);
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf);
+
 /*
  *  LOGGING AND ERROR REPORTING
  */
diff --git a/tools/libs/ctrl/xc_freebsd.c b/tools/libs/ctrl/xc_freebsd.c
index 9dd48a3a08bb..9019fc663361 100644
--- a/tools/libs/ctrl/xc_freebsd.c
+++ b/tools/libs/ctrl/xc_freebsd.c
@@ -60,6 +60,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return ptr;
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_linux.c b/tools/libs/ctrl/xc_linux.c
index c67c71c08be3..92591e49a1c8 100644
--- a/tools/libs/ctrl/xc_linux.c
+++ b/tools/libs/ctrl/xc_linux.c
@@ -66,6 +66,26 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return ptr;
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    int ret;
+    privcmd_pcidev_get_gsi_t dev_gsi = {
+        .sbdf = sbdf,
+        .gsi = 0,
+    };
+
+    ret = ioctl(xencall_fd(xch->xcall),
+                IOCTL_PRIVCMD_PCIDEV_GET_GSI, &dev_gsi);
+
+    if (ret < 0) {
+        PERROR("Failed to get gsi from dev");
+    } else {
+        ret = dev_gsi.gsi;
+    }
+
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_minios.c b/tools/libs/ctrl/xc_minios.c
index 3dea7a78a576..462af827b33c 100644
--- a/tools/libs/ctrl/xc_minios.c
+++ b/tools/libs/ctrl/xc_minios.c
@@ -47,6 +47,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return memalign(alignment, size);
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_netbsd.c b/tools/libs/ctrl/xc_netbsd.c
index 31979937621e..1318d4d90608 100644
--- a/tools/libs/ctrl/xc_netbsd.c
+++ b/tools/libs/ctrl/xc_netbsd.c
@@ -63,6 +63,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return valloc(size);
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_solaris.c b/tools/libs/ctrl/xc_solaris.c
index 5128f3f0f490..049e28d55ccd 100644
--- a/tools/libs/ctrl/xc_solaris.c
+++ b/tools/libs/ctrl/xc_solaris.c
@@ -32,6 +32,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return memalign(alignment, size);
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


