Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E27F720C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:50:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640520.998876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TlS-0007lY-4n; Fri, 24 Nov 2023 10:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640520.998876; Fri, 24 Nov 2023 10:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TlS-0007j8-1s; Fri, 24 Nov 2023 10:50:26 +0000
Received: by outflank-mailman (input) for mailman id 640520;
 Fri, 24 Nov 2023 10:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibx+=HF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r6TlQ-0007hc-PB
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:50:24 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eab::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43f43043-8ab7-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:50:23 +0100 (CET)
Received: from BN8PR16CA0015.namprd16.prod.outlook.com (2603:10b6:408:4c::28)
 by SN7PR12MB8772.namprd12.prod.outlook.com (2603:10b6:806:341::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 10:50:18 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:408:4c:cafe::3b) by BN8PR16CA0015.outlook.office365.com
 (2603:10b6:408:4c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Fri, 24 Nov 2023 10:50:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 10:50:18 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 04:50:11 -0600
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
X-Inumbo-ID: 43f43043-8ab7-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cpr5IbPSY2RSWUNokyAII/N2q95sxgH6scVeaERWAAAhhUqFBVwHKOBW8mh6nHI1uIoYskLIfDsRIlCvZzLnVNh1Bj5LIy9bHE7/iAaM9MXcvywiKgIHz8C1xHDGkg+sOJQndUk9VDkdGUudNljslXBpzaVJ0sTy9/JkgNx/0xFQoNY7Z8FZ93cTAXGl+E7bPoyDT0PddHzfIFFj4blwHB8aRUf1k/taUZkVndxevGMD+WjIusQmIG2MVUewx8k5OkFczkDiN5GJ3wmOcg068wcPFl/xbePzbeHDNhUnEq4CH+jVHn1l14wewT+knNXR2XYQD2YYL3r0mJvW5tNMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wv22leIEJJc+0yjOTOAesiSy6M3ZYkPZ25c7c7AQ4Mk=;
 b=DK/iYw7Fugl4pkB9XmP9Id2/vUv9QmnaqFXYmH6InbAG44mg9URS+6RscADaPRNlAOV16e9qmrz5jkpuLIdtDb0ZPzRzHzEbpu1zyDTqDJzZsuSZOsE34cNlDE5v3WDRMxGrmtH/DsApO2/o57cciZ8+GXi+wGUvqzB16ctUOqajFYFf18fTQ57T9hom8zS5NvJo76LrlkGJVOZQkFu7V3GjIck+TEAe5W3PlPnfhwIbtcp+U2B4adQfd7YJz+SaWkg/wqMVgyM+b3Rdi/cUd8UjEj2bI2HsG+KrpnWPH5dCsFLHXojRbML1HzpPSlaX8bARa7L49waOqf70BYOeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wv22leIEJJc+0yjOTOAesiSy6M3ZYkPZ25c7c7AQ4Mk=;
 b=HAT3paoILeZfgHmejRC0RoNj6wtuF+ONp3CNaXL/PmndYeRY8xH/uQnBfPSh0IQNIhIft1CZenbJp5YeeQNe8NmuM7rSd08izgZ921VB9YSMivNm4NAOOBuU80CcK+0oJBQJG4UafVp0wOOqCvPO/g7+KhjFlJx2nX6ms/gGHr0=
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
	<Julia.Zhang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [RFC QEMU PATCH v2 0/1] Support device passthrough when dom0 is PVH on Xen
Date: Fri, 24 Nov 2023 18:49:50 +0800
Message-ID: <20231124104951.3263782-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SN7PR12MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd8d302-9aa3-480e-10c8-08dbecdb2609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sS2ORGqAhWpmlc2KsOCvNTjB6mfIfoI+8amm/MGNaAoCYUakVQ/ZQBW96b3SodJUtFjc6WEQJgd82P+Z1rK33stYN8aC8MDpOa+mt9bI3RPiksji/s3NX8iCANxROuiVnN7M71iF8wOjjg7sBR4uFLwYabw4S+VwWZ3I6rVg6d4Y+exVTREtqvfdzCd1r6P6fu0UyZSoIRROFmB4NaepeYEljKc5fZT/PB0Y6UU8OJas6isqy8QwDreqZR+8V+t2LtiWBzLdDTaR0Oyd7rv6xBQZA/t91/ZOr4pcJooCDk7jQRK7A1+uuHj0gdjom1jcPoMhVe2YAks3b4ZnvmLWmcp2hMH0WzRKT+Ir6PwWxmTIscOw/8x7apboHItuwhXhhR9oNk1SdbOjcN1RnQDK7orJ68Y0MqdS2+1syblwX19Gr7wU1p+uOI0oDWmi84TJMFSBoi4ddPBvEHwSvxfZh8ZhQl61HPeTYb4nw1geegtKK+hfFN8XptRC/fGYzBdNc7O6DkHVAFF0xsNdiJ0qYSasfGcLmGegpAAGF9MtxZG9muzCcedwZ8KILY9azGMckxGZ4c4PPGEHote5GVObtocbqSxXUZt/ne8T0VnUxXD7g+MUsTxHX1svEi0ier70yauu5vU03YvT352SPmpjifryFvmppoB6tQEinLEcdTqXvdblt7o4AXbmvFUj/69LjTuxi4d/OVNKYcboYADSicx1xfsLfctEaa9N80pn3XL1w/kJfgha80AfHaI5RihE4Ag87HiY/q2sNsaFL7xPFO4PmkPaNWIXbNj0U4rakNw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(36840700001)(46966006)(40470700004)(40460700003)(966005)(356005)(81166007)(82740400003)(7696005)(478600001)(8936002)(8676002)(4326008)(41300700001)(86362001)(70206006)(54906003)(316002)(70586007)(110136005)(1076003)(16526019)(26005)(2616005)(426003)(336012)(83380400001)(47076005)(6666004)(36860700001)(36756003)(2906002)(5660300002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 10:50:18.2553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd8d302-9aa3-480e-10c8-08dbecdb2609
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8772

Hi All,

This patch is the v2 of the implementation of passthrough when dom0 is PVH on Xen.

Issues we encountered:
1. failed to map pirq for gsi
Problem: qemu will call xc_physdev_map_pirq() to map a passthrough device’s gsi to pirq in function
xen_pt_realize(). But failed.

Reason: According to the implement of xc_physdev_map_pirq(), it needs gsi instead of irq, but qemu
pass irq to it and treat irq as gsi, it is got from file /sys/bus/pci/devices/xxxx:xx:xx.x/irq in
function xen_host_pci_device_get(). But actually the gsi number is not equal with irq. On PVH dom0,
when it allocates irq for a gsi in function acpi_register_gsi_ioapic(), allocation is dynamic, and
follow the principle of applying first, distributing first. And if you debug the kernel codes(see
function __irq_alloc_descs), you will find the irq number is allocated from small to large by order,
but the applying gsi number is not, gsi 38 may come before gsi 28, that causes gsi 38 get a smaller
irq number than gsi 28, and then gsi != irq.

Solution: we can record the relation between gsi and irq, then when userspace(qemu) want to use gsi,
we can do a translation. The third patch of kernel(xen/privcmd: Add new syscall to get gsi from irq)
records all the relations in acpi_register_gsi_xen_pvh() when dom0 initialize pci devices, and provide
a syscall for userspace to get the gsi from irq. The third patch of xen(tools: Add new function to get
gsi from irq) add a new function xc_physdev_gsi_from_irq() to call the new syscall added on kernel side.
And then userspace can use that function to get gsi. Then xc_physdev_map_pirq() will success.

This v2 on qemu side is the same as the v1 (
qemu https://lore.kernel.org/xen-devel/20230312092244.451465-19-ray.huang@amd.com/), just call
xc_physdev_gsi_from_irq() to get gsi from irq.

v2 on kernel side:
https://lore.kernel.org/lkml/20231124103123.3263471-1-Jiqian.Chen@amd.com/T/#t

v2 on Xen side:
https://lore.kernel.org/xen-devel/20231124104136.3263722-1-Jiqian.Chen@amd.com/T/#t

Jiqian Chen (1):
  xen/pci: get gsi from irq for passthrough devices

 hw/xen/xen-host-pci-device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1


