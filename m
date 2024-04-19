Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434838AA792
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 06:14:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708712.1107775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfde-0000NH-8s; Fri, 19 Apr 2024 04:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708712.1107775; Fri, 19 Apr 2024 04:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfde-0000Kb-54; Fri, 19 Apr 2024 04:14:14 +0000
Received: by outflank-mailman (input) for mailman id 708712;
 Fri, 19 Apr 2024 04:14:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1xH=LY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rxfdc-0000KV-WA
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 04:14:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 458fb5b9-fe03-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 06:14:10 +0200 (CEST)
Received: from CH3P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::25)
 by CH3PR12MB8482.namprd12.prod.outlook.com (2603:10b6:610:15b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Fri, 19 Apr
 2024 04:14:08 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::be) by CH3P220CA0027.outlook.office365.com
 (2603:10b6:610:1e8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26 via Frontend
 Transport; Fri, 19 Apr 2024 04:14:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 04:14:07 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 23:14:05 -0500
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
X-Inumbo-ID: 458fb5b9-fe03-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WC3SPS44gpm7Dc02rTYiXcQ1dNITpncxMSLjRc8oiwFByCnBCyXP9PdKqMVQF6wXXVTOvW7SqiY53yBRoxUl/xFLrj51RJsAmFjF0f724vdu4rV7Wb/GRAwnAA4O+xCUT1yhAUrY3Xn5ALc0O1oRE4vjC++J83dfYjbfaASLjgc1hPfXMNLTFgNQtELdYAK24n/2RsiCA1JXwZ15/KwP4Sb/1dOtItsbT8gELO3HPbeeQ4xCsp3Y2vrErOtDvPAkZ94ECJbupocODuQzUcoNnLSgmtrIEHrcn1WbKpNpZSIi9cpD+/18+z+rEWgtfWBElMTygd6SOQLsLKC8ecip9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj8YD64Ph6IwvRJJqtUYhZIQZnosoF6qgGzX78HNrMA=;
 b=CP8pIPy66ZWI0B3BFcY4zt/0Ufvid5S8B2mFZNpLqjDRpdTRN3BswXR9KlM+6tP+S71B4aikzrDjybTQ7k5UuVqYa8b7EtxoP4sVYxK9QPOt6pKBf93fZryTRxz6KJWepavGur3oo2NJaDyg+i7KOfcgeiJOGw+rGIdn6LsQdLBLV9gkngf7gaWBFx+otol5VxwWNurGB1R+wawn/Sj9tLXkgmLwSMazF2i0D7NIgnVDK4OA18XZ8jBj+R0pLjxnhBtwR08A3XjVR6g2gucsuMLdSl9PxSX+0YwQPbp3NbiDpjKFYsZjYQk/ECQ9ey8y+cuG6zwc/yo4VEJlUQcIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj8YD64Ph6IwvRJJqtUYhZIQZnosoF6qgGzX78HNrMA=;
 b=RsFZ7ZlqjTtxL74LHRsspdpiZldZyomG0JVKzdXaFCZyIpi3M6s49Sae161zK6z9qsLmNQY8UmxVTKqtuAAxmlz2FnsjUNq1nhq3ALVPogWVC1xMEjH8ILeAnEYyQtflvhI011kUn2TgWXkpshour7+UbvO6snQn66IUTE+nrXA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <qemu-devel@nongnu.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>
Subject: [RFC QEMU PATCH v6 0/1] Support device passthrough when dom0 is PVH on Xen
Date: Fri, 19 Apr 2024 12:13:50 +0800
Message-ID: <20240419041351.633856-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|CH3PR12MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd63812-992c-442e-5245-08dc6027284c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6TOIrRuO1jIbFcaZSCKph0h3rkUYigLTp1GFUhGMt/LPzAcS3HtN4qqmcPb9ZZx0B+6eBj+3HTKd2oHnx0TfJIUkv7nLSDFB/OKK11ztyiPbnWyYRoWMVOoMkvMgGJ/47p0PCIF7XBmQMwc3rmqRsm2hgz4YYI2NgyVXo/JcA+Zgqr8NICh+AWzqIl9sgK71GjkdkHiEjXOOdBltPngJ9hrgSOivdcpvVqETUIkTC09u7GOs7WCUEzNcrgdq3WueFrYlxiVo0ipvwriqz+fw8g1OXyDsXRx+bBPutLuLLKLxMaECUTR9BKZ9wvFFkuXEQKsjdbZQ17QrDJ4P37zaCNwaAGsxmjwYU8MK1JF+p9OvAiMRlLmk6SF8kWCj4x58gvZveftBvIUij8pHqoR5uwlvkPCK1Hlt5t7ysgHp2lxn1BiGTuldKf1+xmUkx5XMTpNS31OZ6yOg7t55bBkMs2Dr86pO8M2XW7HNZE00Yz1xna65/1Lx8gi7hb6eq52EC4uAYUtFjLmn8I6ei9DfEY3Fai6Hf6IEvv7BIMdidNFEg1kVPM1oQD2hbmhojzKdRwFOV5Xr7feewhmd1X5xGx+m4q8jcSvOT1UWfeKQbs75W8vg4SiS9chVHluSR7n9JBQ6ezhqJjBOEp3XodGFN+oIOiPRvgdZn48wTkInnvMNHUIWesUVm5YG0LJ7R10wRVdQQHRcVXei1qLqrafGvkK8Inszo26JZHiGl/snSpK2wuAdNu8wMD2JbQQW6vpo
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 04:14:07.5224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd63812-992c-442e-5245-08dc6027284c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8482

Hi All,
This is v6 series to support passthrough on Xen when dom0 is PVH.
v5->v6 changes:
* Due to changes in the implementation of obtaining gsi in the kernel and Xen. Change to use xc_physdev_gsi_from_irq, instead of gsi sysfs.

Best regards,
Jiqian Chen


v4->v5 changes:
* Add review by Stefano


v3->v4 changes:
* Add gsi into struct XenHostPCIDevice and use gsi number that read from gsi sysfs
  if it exists, if there is no gsi sysfs, still use irq.


v2->v3 changes:
* Du to changes in the implementation of the second patch on kernel side(that adds
  a new sysfs for gsi instead of a new syscall), so read gsi number from the sysfs of gsi.


Below is the description of v2 cover letter:
This patch is the v2 of the implementation of passthrough when dom0 is PVH on Xen.
Issues we encountered:
1. failed to map pirq for gsi
Problem: qemu will call xc_physdev_map_pirq() to map a passthrough device\u2019s gsi to pirq in
function xen_pt_realize(). But failed.

Reason: According to the implement of xc_physdev_map_pirq(), it needs gsi instead of irq,
but qemu pass irq to it and treat irq as gsi, it is got from file
/sys/bus/pci/devices/xxxx:xx:xx.x/irq in function xen_host_pci_device_get(). But actually
the gsi number is not equal with irq. On PVH dom0, when it allocates irq for a gsi in
function acpi_register_gsi_ioapic(), allocation is dynamic, and follow the principle of
applying first, distributing first. And if you debug the kernel codes
(see function __irq_alloc_descs), you will find the irq number is allocated from small to
large by order, but the applying gsi number is not, gsi 38 may come before gsi 28, that
causes gsi 38 get a smaller irq number than gsi 28, and then gsi != irq.

Solution: we can record the relation between gsi and irq, then when userspace(qemu) want
to use gsi, we can do a translation. The third patch of kernel(xen/privcmd: Add new syscall
to get gsi from irq) records all the relations in acpi_register_gsi_xen_pvh() when dom0
initialize pci devices, and provide a syscall for userspace to get the gsi from irq. The
third patch of xen(tools: Add new function to get gsi from irq) add a new function
xc_physdev_gsi_from_irq() to call the new syscall added on kernel side.
And then userspace can use that function to get gsi. Then xc_physdev_map_pirq() will success.

This v2 on qemu side is the same as the v1 
(qemu https://lore.kernel.org/xen-devel/20230312092244.451465-19-ray.huang@amd.com/), just call
xc_physdev_gsi_from_irq() to get gsi from irq.

Jiqian Chen (1):
  xen/pci: get gsi from irq for passthrough devices

 hw/xen/xen-host-pci-device.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.34.1


