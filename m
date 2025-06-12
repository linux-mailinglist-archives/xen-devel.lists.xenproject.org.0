Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282DAAD6C2A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012636.1391116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGF-00082i-Jn; Thu, 12 Jun 2025 09:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012636.1391116; Thu, 12 Jun 2025 09:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGF-00081I-HB; Thu, 12 Jun 2025 09:30:15 +0000
Received: by outflank-mailman (input) for mailman id 1012636;
 Thu, 12 Jun 2025 09:30:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwpW=Y3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uPeGE-00081C-0C
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:30:14 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [2a01:111:f403:2418::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0c12da3-476f-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 11:30:02 +0200 (CEST)
Received: from SJ0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:33a::28)
 by CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Thu, 12 Jun
 2025 09:30:07 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::3a) by SJ0PR03CA0023.outlook.office365.com
 (2603:10b6:a03:33a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Thu,
 12 Jun 2025 09:30:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 09:30:06 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 04:29:59 -0500
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
X-Inumbo-ID: d0c12da3-476f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uj6v3r9rsIcrQmWe7oj28hHMHcdDL1NQLdV8hWPTzVT8hRux9sFtJEKQNpE+fBHwPPbYxH1Hm3BW4YJ50I7kU0vy9wTPVbBTSH6TP/AprsfuOXtj6QJhtYctDd2niSxQMKqHhn0jrGdHel6BhyaRieXuAGU+vLwiY6AjQGkklCRLMSwQcZG18kFGTFB+fkqgd1UoXpnGv1SmjG3rLFeC/XSLR9EL1BbuyF842YQ77n7qtXXyWfw1B2bfm5yLvA7rNqKFg/HbDLj6Muohn8xYh1Ltt4ANgraa7R2sD9DiTfn8HggaTsWvc/SK+WfMcyZGKAHn4p6Ftolxtz1uBa5OWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pkqn70ZAbRTvqLOKlzkzMDMievy0UdcX/JDLxlqXjys=;
 b=LAZcOxMezxc8PoCTSpgJoglOcpP3qaByiqp5JprEI5kh6qFo4WNFtSfb44ZWv4JbyIPaaw4kK7pxywHVMmJ2CpegJWpJWlHbYBeAn8ldkOe7xzr3+2+MJvAT+rZXnG1qxS7/kkFdjONUmHLBr4WeYds5CrIi4fwqVx/jbkEjGj8zuEOVLj3PTQvyaljFnVOAFuomXMC2u1Po9pqf0SP3Iv2J02xRnDw7Rw7NhtLkrOB/qqYCOkwuznBOv3sOn2indwPJyGMA53+IvIVC/UcxWBCRmV63/QFeAjv3sk19OrfKcNR3z3ZOl4JpTV+wnodxQym6aHbnAm1tihaOeMO/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pkqn70ZAbRTvqLOKlzkzMDMievy0UdcX/JDLxlqXjys=;
 b=XiQmyTuZcplnj1/I1JT4jDNT7znYfouO6J+UtNmjxwvL20CoIeUFReVysK/SVL6XFaNaf+nE5/x0MR/4OBXFSEHC9aHw4PjN2gNpLl+EEbYhH10ghecq+M+5FevmzfdzkpXw+oFMiP0CbYo88kAvSjvLKHZoUREf8KRwWxhXudA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v6 00/8] Support hiding capability when its initialization fails
Date: Thu, 12 Jun 2025 17:29:34 +0800
Message-ID: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|CYXPR12MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: 57349c21-c286-4f1a-8989-08dda993b7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUFlMUhBVlk2NjFEVDBrVkRLbVlCYjlTVFk4eE1RQUlnTGxlc3lBejVRV3Ft?=
 =?utf-8?B?UnhVYkU5OHoxSHF5ekZMU3Y1eGJDdEdrN0E4RXlyTlErK1dvdXdaalN2Qjdy?=
 =?utf-8?B?VVk1TzlkRDJoR3Bvb2Jna2xYRE1MR3lhSTVRR20xaVloZS8yY3ZqbHpyUmdi?=
 =?utf-8?B?VE9qUG5CQTdxSUp2ZHlrWG0wUTVGUTBWdUIzM2xLakhrRTI3cU9ReHYyU1ZK?=
 =?utf-8?B?UjFWbjZUOHUrT2FSVlVDTWxtVnhKcG8yN1pLaDYreC9LbFBqQWYvUm9yaEJM?=
 =?utf-8?B?cjNETlZjR0hzYWI4K3g5RCswSHZGY09qbk5FYlpoMThPV0QyS2Q3dmNybEo5?=
 =?utf-8?B?aXlvcWVJeG5vNnRLbElpVllsbHI0R0lhTkMwTGxxL0F6N3kwUVZTV2hCQUV3?=
 =?utf-8?B?VVJyNmFJVE1Zb2tTSnVRSmhuVWVzZ0J4NEoxM21UcmQ2ZkNzUXdMcTdUMEEr?=
 =?utf-8?B?ZDNvZG0wcTd5UGtjd1Q3d0hyVjNCTjJDWWhjbWdjS3V1elhvVUF0K3JvYi9I?=
 =?utf-8?B?MDBybml1ZHBMMExFM214aHdiRVNCay95RXQ3eDJ3VkFlb3lBYkdKYkZWMmpo?=
 =?utf-8?B?VTYyRWxxSUh5UmZrOWl6WmtzdTQ0dVl4aUIwN2tTOTlSTjNJL1l6TTV3d1RE?=
 =?utf-8?B?aE54TGJhaStONTdOeWlKaDZpanlwYW80Wkc1NWtXdzRqUy9DcHllajZvYWRS?=
 =?utf-8?B?bkRWRmdxdDJCaVBKcHAreWJZOUNuaFU5MlcyWDIzQmQzaDFwZ0xXWm1RbzRt?=
 =?utf-8?B?VjhXQkE3bGJkREtXRGg4NkVIa21sVWRLRzk5ZE1KOEphOEMvSzdMbUY2aWRT?=
 =?utf-8?B?ckZXTU9iTGxXRkVkbWFtbHBuL0Jucy93YnRUejIwZkpjVEJoTzMvWGJrMWJt?=
 =?utf-8?B?bVo2OUVRcHg5WkFsaVRYVWFHVjltVFdhazloZ2VLTmFwOUdLRTBlZTRuVTY3?=
 =?utf-8?B?Zm4ram9aeDFDSWtQNVpvWVFUNTJCSFBKeVRQaXpaTVB2aUF2MXlTSFdxUWJh?=
 =?utf-8?B?MTJBS2JuaFJtVDFZa05JWHJQOFU5RzluanAwcmRrbUdmeHIxbUlIbzBZNmNo?=
 =?utf-8?B?M2djY0JKdVBaZklmbWVuYjVYN0VDL2VKMlBwT1hOSTlLZ0F4aDZqaE8xdXU0?=
 =?utf-8?B?cVlmbnlIS3BFS2FEaDlGL2RqMGsvdnpaeitIS0t3eFhFQmhPTCtkSzZId2o2?=
 =?utf-8?B?blU1RHJySk93eEdVZ2NVMks0eTJWcWhpRWxYOTNtQ29lR0tyeSthUXdPUHRn?=
 =?utf-8?B?WFE4QnBhVlYyRVl0REt4SmFTVmU0ZGpFb05Cb000azRqc2dQSDNFb01kYlc1?=
 =?utf-8?B?SnNvamFRcE83SlE2S05MZ1NlUTd1WmI1U2MxOWhVZVNwVWVtM2hzdVBwNUNj?=
 =?utf-8?B?OHJKTDlPVUtTWTVCc0FJY0V4VHFuc1N4T0U4Yk95bUVLZnR4aXF5NGhITkg4?=
 =?utf-8?B?NG5XQW55aG9ialdCK1h4Sm5qWm1YOHUxenVzSGJoNTRUdjg4VnQ5MkNEWlpH?=
 =?utf-8?B?aDZ6eEk3NUUwL1VlazY0L1JXNXZyRUlyYk00WDF5bER1U0xhZDROK1BuQ3BE?=
 =?utf-8?B?TDRqQmhEY21FaFJrSitXY1BkVGpYdWladlFzMklDYmJyQ2JMZjR3OHJKMnEx?=
 =?utf-8?B?SWNqdVpTUmVtZTZndnZGbUh0OXBRcDVkTFA4L2szQk93dlcwNTBOTVE0T3VF?=
 =?utf-8?B?VE41cEVIMnVWMGdGQ1ljN1JlK2NPWlZUM0drcWJwSWRVWEpVcVVHUlgrMW1a?=
 =?utf-8?B?dkFVc2FseEYxNEFBbmhMMExma055S2hNSGtCWThlWW5mY1cyZlhPYVJrS3Z2?=
 =?utf-8?B?YW9qQXNqck5wNnpkZEkrd29iem03UjdZaEk0K0JZL0FKMGJqaTJNTlNKOCsr?=
 =?utf-8?B?aHVUS0NhS3NvNy9yR1paQjhaTmNja0syMjFidVRHeE84T1ZMbU1UVEMzRSta?=
 =?utf-8?B?L0U2c0dOdVZtL3YzQ1FvUHNOeXhhL0pBUzcwNEI2eVY1bVV4dnFoMmkvaG45?=
 =?utf-8?B?djdYRlZFeVZYNWZvWGoxYWVkY0tTS0ZTT3FhdldJa1NObHFDVTJkMmtMSzBk?=
 =?utf-8?Q?sqb+Hw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:30:06.4774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57349c21-c286-4f1a-8989-08dda993b7d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426

Hi,

This series is to
emulate extended capability list for dom0, including patch #1.
hide legacy and extended capability when its initialization fails, including patch #2, #3, #4.
remove all related registers and other resources when initializing capability fails, including patch #5, #6, #7, #8.

Best regards,
Jiqian Chen.
---
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
Jiqian Chen (8):
  vpci/header: Emulate extended capability list for dom0
  vpci: Refactor REGISTER_VPCI_INIT
  vpci: Hide legacy capability when it fails to initialize
  vpci: Hide extended capability when it fails to initialize
  vpci: Refactor vpci_remove_register to remove matched registers
  vpci/rebar: Free Rebar resources when init_rebar() fails
  vpci/msi: Free MSI resources when init_msi() fails
  vpci/msix: Free MSIX resources when init_msix() fails

 tools/tests/vpci/main.c    |   4 +-
 xen/arch/arm/xen.lds.S     |   3 +-
 xen/arch/ppc/xen.lds.S     |   3 +-
 xen/arch/riscv/xen.lds.S   |   3 +-
 xen/arch/x86/xen.lds.S     |   2 +-
 xen/drivers/vpci/header.c  |  50 +++++--
 xen/drivers/vpci/msi.c     |  29 +++-
 xen/drivers/vpci/msix.c    |  35 ++++-
 xen/drivers/vpci/rebar.c   |  35 +++--
 xen/drivers/vpci/vpci.c    | 278 +++++++++++++++++++++++++++++++++----
 xen/include/xen/pci_regs.h |   5 +-
 xen/include/xen/vpci.h     |  36 +++--
 xen/include/xen/xen.lds.h  |   2 +-
 13 files changed, 414 insertions(+), 71 deletions(-)

-- 
2.34.1


