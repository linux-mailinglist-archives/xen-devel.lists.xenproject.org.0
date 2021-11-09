Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4068344A749
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223698.386521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9k-0000OO-Ix; Tue, 09 Nov 2021 07:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223698.386521; Tue, 09 Nov 2021 07:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9k-0000Ls-Ft; Tue, 09 Nov 2021 07:02:56 +0000
Received: by outflank-mailman (input) for mailman id 223698;
 Tue, 09 Nov 2021 07:02:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkL9j-00004s-Da
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:02:55 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e88::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0de8392e-412b-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 08:02:52 +0100 (CET)
Received: from SA0PR11CA0076.namprd11.prod.outlook.com (2603:10b6:806:d2::21)
 by MN2PR02MB6047.namprd02.prod.outlook.com (2603:10b6:208:186::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 07:02:49 +0000
Received: from SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d2:cafe::23) by SA0PR11CA0076.outlook.office365.com
 (2603:10b6:806:d2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 07:02:49 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0016.mail.protection.outlook.com (10.97.4.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:02:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:39 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:34 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9O-000Ga6-2A; Mon, 08 Nov 2021 23:02:34 -0800
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
X-Inumbo-ID: 0de8392e-412b-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhVqvpwO/TiLFWYXby/Qz0B456srIkPhmj8gchV9h40wP8mTR2r/oAUjHpWbHYxCaX3uTLkt/RALzjkuWAW958do/fs1sqHKXuMW8rZa0Z5rXq9Kh0b7TTRXD5FWnXCHaBceu0kgpuAXg4xsjyNQgZdp29dybjAwMo0Y8hJnDapdPttdIMYczOoP3Wf1TaznqqdlOoWbMCZx+7/y3aAqW267n6Pi1QhHTMFVs/YYSBcuMInbPsuMHZKAbQor89sOiapvPJlKte/kmsBFr3y2iziTtKLNwaXAIkynPhb3GQHH7EkxCpm9ijJEqbRI9IvUFBllEAh0DBe2uCqItgO9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtJLc1JfjYiw9k5F0Qw1/n6JDGWssDVQSwbVx+ZYHRQ=;
 b=FyFCiJ3y7pUrU57ErLiESkdzIRspI3DsLHTFamlFTd48Dc+RVYKIj1XJ10hqcZ3dgDmPqsZ6CYKucD0ZjqfiN4bBvJbwg9D3TbSnW4T6ue40L07JgspESBlmU098M+F0qQ336k+5vFonZ6MnkFkTiKCkv/oL+uMFvEUJFeSRX+gQa75C7zgt8O/JsTBTjsBf327DeYKx6OCOBFUPPuQ0ugRB3ED3/DnEvTiSH7zuOvmIt+e4lFCAbM9TqBlrt5gd7UULpv7KdMhpdJyEk0hJPcfliVK6TQ4VQc9FS8vCyYAO2LfGyAs3geaVIQkE4Yu0By0Uzms9mDkoHZ1dyYZkLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtJLc1JfjYiw9k5F0Qw1/n6JDGWssDVQSwbVx+ZYHRQ=;
 b=bN9lsulsL8EcxPgPG7pdsiOKpKbYO4aolPH4rkqd5f012ZKAygVRmnnl31UhBJ+MZkx5HIWNR8iOukoKKMfv+hjVGjG+dYe+xQ2nOUtS0nUp8euuhkUGHydoJeYlhUl4DItmqd6S3WhpXGljP/CP33RD+Q94Y5cV2zj+a3aHOk8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN][RFC PATCH v2 00/12] dynamic node programming using overlay dtbo
Date: Mon, 8 Nov 2021 23:02:15 -0800
Message-ID: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28161322-8565-4c2b-751b-08d9a34ef092
X-MS-TrafficTypeDiagnostic: MN2PR02MB6047:
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB60476F13F02226D7AB5C5DB9BC929@MN2PR02MB6047.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oBzgNB/bxnz0jy7yNnmuOFbcOvVq5dmBdfR1wUdbZhiJM+o9pVWnsW2qwN+XZxLrPqdQZa33VSyxoSGPQVpjn9LQmwyHCZ9ZPjm9CCSiMj1tDW51XVofKCoSqGfbWdP4LHwIRJ0FlwpO4yPYGpfAnINRct2pwOIdPZHiB3A+jPKpm27LsyUFeTgOEJAaUo2u7pC0uZXy1dzZArcimkz+vmRw4Bn7C0/5aNJgByV32cWhEmE9eNxddaJPrVm1u3yW40YWwevHRJ99Va6aKMz7fSOnBHtI2giLQnWERfWB2kgO7OjpTu1d3B9ywkiS7el1b1RTw/tly9OhoNdteCOlXABdq8Dy/HCG7JN4/Mi/awuQR1UGXkqS1in8n/DeT57bC6XRdKDJWP08BoCMRdahtWTXNy+dF4tGurTpKZtFEDdlma6aBdvU+M+paL9b3gfw0k3Ze0KoVarX+fvWd1s45fY8WfNmtJ1UFaKjM0fpFMVDccyUO+Yh0W1nKQzTtkiBMnRC9WjqXb52w15IyWd8MBwzMG9nvHtmH5R98SgG9HcRq/+An+tMVKdQkJrkYNwlgZiZD2kMTu7J5A0stKWciAnOJZ/swKd1O+X9JayeOg1yhlkAmvbWZTHyxnQzb0O3NXlAyCUV23XsZ2T/+PWykAB5PYq7n/xJDke+Bzx9r4f9sWSZX6BcIVqaJgEPloHIGO5N7TE/uepzKJU4NKk6cIbHjfsVTAI5OfKRHMgoIEE=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(9786002)(54906003)(186003)(7636003)(2906002)(82310400003)(8676002)(36756003)(336012)(4326008)(36906005)(6666004)(316002)(70586007)(70206006)(6916009)(8936002)(508600001)(2616005)(26005)(5660300002)(83380400001)(36860700001)(7696005)(7416002)(426003)(47076005)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:02:48.7702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28161322-8565-4c2b-751b-08d9a34ef092
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6047

Hi,
This RFC patch series is for introducing dynamic programming i.e. add/remove the
devices during run time. Using "xl overlay" a device can be added/removed with dtbo.

For adding a node using dynamic programming:
    1. flatten device tree overlay node will be added to a fdt
    2. Updated fdt will be unflattened to a new dt_host_new
    3. Extract the newly added node information from dt_host_new
    4. Add the added node under correct parent in original dt_host.
    3. Map interrupt and iomem region as required.

For removing a node:
    1. Find the node with given path.
    2. Check if the node is used by any of dom0 or domus. Removes the node
only when it's not used by any domain.
    3. Removes IRQ permissions and MMIO access.
    5. Find the node in dt_host and delete the device node entry from dt_host.
    6. Free the overlay_tracker entry which means free dt_host_new also(created
in adding node step).

Question: I am not sure how to enable CONFIG_OVERLAY_DTB in tool stack like the
way we do in xen using menuconfig or editing .config file. Would it be possible
for someone in tool stack expertise to guide me?

Reminder: This patch series has dependency on libfdt v1.6.1. A patch for libfdt
upgrade was already sent earlier with below subject:
    [XEN][PATCH v2 0/1] Update libfdt to v1.6.1

Change Log:
 v1 -> v2:
    Add support for multiple node addition/removal using dtbo.
    Replaced fpga-add and fpga-remove with one hypercall overlay_op.
    Moved common domain_build.c function to device.c
    Add OVERLAY_DTB configuration.
    Renamed overlay_get_target() to fdt_overlay_get_target().
    Split remove_device patch into two patches.
    Moved overlay_add/remove code to sysctl and changed it from domctl to sysctl.
    Added all overlay code under CONFIG_OVERLAY_DTB
    Renamed all tool domains fpga function to overlay
    Addressed code issues from v1 review.

Regards,
Vikram

Vikram Garhwal (12):
  device tree: Remove __init from function type
  xen: arm: Add CONFIG_OVERLAY_DTB
  libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
  libfdt: Add fdt_ prefix to overlay_get_target()
  device tree: Add _dt_find_node_by_path() to find nodes in device tree
  xen/smmu: Add remove_device callback for smmu_iommu ops
  xen/smmu: Add remove_device callback for smmu_iommu ops
  xen/arm: Implement device tree node removal functionalities
  xen/arm: Implement device tree node addition functionalities
  tools/libs/ctrl: Implement new xc interfaces for dt overlay
  tools/libs/light: Implement new libxl functions for device tree
    overlay ops
  tools/xl: Add new xl command overlay

 tools/include/libxl.h                 |   5 +
 tools/include/xenctrl.h               |   5 +
 tools/libs/ctrl/Makefile              |   1 +
 tools/libs/ctrl/xc_overlay.c          |  51 +++
 tools/libs/light/Makefile             |   3 +
 tools/libs/light/libxl_overlay.c      |  65 ++++
 tools/xl/xl.h                         |   8 +
 tools/xl/xl_cmdtable.c                |   8 +
 tools/xl/xl_vmcontrol.c               |  47 +++
 xen/arch/arm/Kconfig                  |   8 +
 xen/arch/arm/device.c                 | 146 +++++++++
 xen/arch/arm/domain_build.c           | 150 ---------
 xen/common/device_tree.c              | 122 +++++++-
 xen/common/libfdt/Makefile            |   3 +
 xen/common/libfdt/fdt_overlay.c       |  12 +-
 xen/common/sysctl.c                   | 571 ++++++++++++++++++++++++++++++++++
 xen/drivers/passthrough/arm/smmu.c    |  54 ++++
 xen/drivers/passthrough/device_tree.c |  30 ++
 xen/include/asm-arm/domain_build.h    |  10 +
 xen/include/public/sysctl.h           |  23 ++
 xen/include/xen/device_tree.h         |  20 ++
 xen/include/xen/iommu.h               |   2 +
 xen/include/xen/libfdt/libfdt.h       |   3 +
 23 files changed, 1180 insertions(+), 167 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_overlay.c
 create mode 100644 tools/libs/light/libxl_overlay.c

-- 
2.7.4


