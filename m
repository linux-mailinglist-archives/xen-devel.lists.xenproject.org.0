Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9B0AC3D33
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 11:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997341.1378229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPb-0003iU-1Y; Mon, 26 May 2025 09:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997341.1378229; Mon, 26 May 2025 09:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPa-0003hO-TY; Mon, 26 May 2025 09:46:26 +0000
Received: by outflank-mailman (input) for mailman id 997341;
 Mon, 26 May 2025 09:46:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qdiq=YK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uJUPY-0003hH-Qo
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 09:46:24 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2417::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48acaf7d-3a16-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 11:46:23 +0200 (CEST)
Received: from BL1PR13CA0184.namprd13.prod.outlook.com (2603:10b6:208:2be::9)
 by BL3PR12MB9051.namprd12.prod.outlook.com (2603:10b6:208:3ba::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 09:46:17 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::f8) by BL1PR13CA0184.outlook.office365.com
 (2603:10b6:208:2be::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Mon,
 26 May 2025 09:46:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 09:46:16 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 04:46:13 -0500
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
X-Inumbo-ID: 48acaf7d-3a16-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slYlmZfcpqhgJj3EDDX1mRY/r/1BdT3cAYgrmbzjuLDqqKwCyXtIEr7hDg/35ayOK1X2oigpxPMbk05uc8dJzL2qpL/apLFyUv3suAFlT1KuzXC+m94iKeajwksz96seG6twZ94D8gm+lPbQAmyTUrXaXNJsLiKntXLNRAJg+zd7yMLJfDbe0/GQfMA5PyWqzMuKPEU93AkMhMsaJX0fPBxsF5XyC+lAlyXi1ywcMHZRpVuBz+1t7IfgkMN+7Wf1f+XBclj1tGaf85buqSwrd3AisYP7LQz5Wk20gcLZfdQIetM+eVv64UDpWIoNVuNsDrOUbOf+Ner4zDxFzFHv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgCGQ36mKt8+nLsWda08/hpIxoIRAEZAIVomHicqwAM=;
 b=imWSnaZT7eCnoEnM+igtfTZZ9H6GbIJdlrnkirW2bB4yO1mICu+NbcLEDdvF3DWTro0ewV7OISWNolclpO7qLoJP7viXoYoNML+TTzPubfToQmGAbhyUimD/hKcgLvvcpN4agx/N6ExgAUhJI+D6L1RX83J2QwdOqfZ0eEynZoJ/K6D1+bbHLmEY33BzYNgDPDwfumHCfoshhsJsZ12I4neprifZ1jB3Oa2oAdwtA+9oEH9hhPOk7fM8SrRn2BbvbwgFsu1U7ZL0qFX/iFSiBGh5JXEVt0r+151OvE9GSWVR9TBwWKK9WiwuMmzb0eyOJZZsJeaX5/i+oKpJbIWp3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgCGQ36mKt8+nLsWda08/hpIxoIRAEZAIVomHicqwAM=;
 b=2QsxPgPv7H7Gh6gQ/3BohOSoT+Uh+hS7xwxwfLoaMikUUwCUlBmhgW1f8pAes8fq1MQLNge6CtxqC4bdEfLXfs4Fscs5UoazAE6owjyojOouV/CE0zTJ0d1wDGJR3HPLXG/r2UzYX3Gb/asu+W6XnXPCCIP52nVPNFoODD7JIvc=
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
Subject: [PATCH v5 00/10] Support hiding capability when its initialization fails
Date: Mon, 26 May 2025 17:45:49 +0800
Message-ID: <20250526094559.140423-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|BL3PR12MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e8ce00-9f75-484a-b5e3-08dd9c3a28f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUhCYzhzTVE5S0dNS0xjM3JEbk5kaUt0a1JVSHRrcGVNY1lUbVFLdStoT1Ar?=
 =?utf-8?B?UldXTWJpY0QrNmJ1ZmUvQmlUc084M2FBMUl5WEF2ZVZMdHdGUHVxdXN6SmY3?=
 =?utf-8?B?clNhK0wzN0tGdVBraU1mMjZKSy92aTh4dit3enNabnc0ME5IbXhpcDRTYk8z?=
 =?utf-8?B?OEVwK2ZQZVFwTHkzbzhkS2U2d0NzOVdOSDJNdmtDS1pKYlZBcm0xVUdaK2t2?=
 =?utf-8?B?TE5wUFZrOUJhNDdEZWxVbWQ4U2drZEQ1YTBJLyswSEIxTXY5OUhHaTFTMXR2?=
 =?utf-8?B?WGFjeXpHM1l3bHdMNXJlUlhiRW5RT1JMR0FkZDI1RGxHaFZmQ0hKYjhnVjBu?=
 =?utf-8?B?N1prSzlDbVlhUlpnSG9ZdDBkVkJoOUlHYkpTczVyN3VlZ1FpSlUvWDg0a1lM?=
 =?utf-8?B?VVdlSWZ6WStCUVNYdW5uai93bThkQVNOR1NNQlI0SlhwUWVFYythMW9NZVYr?=
 =?utf-8?B?bWtzOFFwSlNIK1M0bmJPbk1ReWlacXJseURoVDRkNm9UNGo3N1dDUnFNQTZC?=
 =?utf-8?B?U1ZiaHBIbk51M1lSL1NYZDVycWYrdVZ5amh5YUR0QWkvMk5vUnVWV1p2d3N1?=
 =?utf-8?B?U3lnRXUxbndWRmE3RWszV203YWdHalJacDlIV2w5eThVRWtnbmlxVUR5UG01?=
 =?utf-8?B?c3ZsQkRPUGg1Wm5YbUtlbkVPbnN3a29wVmJRMlVTUEtraFcwZndMcE4rRmJk?=
 =?utf-8?B?MFlWdW53ZHNLbFk5TnJIZmJaZTlIL3lha2EycXFkcFBWTWpwdVBkWjd5dmFT?=
 =?utf-8?B?bmZKOGMrYXc4enFNU0RFNkd1NW1FMEY2RFVxL3FkWHhIaHJDZThsQStBUGJz?=
 =?utf-8?B?UHdNT290S3RpSnR4N0lZbVRueldEK3BURzJueXpiOStJWktXaVM4NlhPSFFo?=
 =?utf-8?B?Y0xSaGZWVmM4cnFnNS9yNERucHQ1SmRndUNpRm5SZFNmMkxWNkRsY242MFh4?=
 =?utf-8?B?aGNtcUd4dS9UbGd4VC9TKys2S21Vc01EazVYbDU5LzdKVXg3bldSTlZxSndw?=
 =?utf-8?B?a0tkaEZaOE1Hb0M3b04zWjNMWk83VGI4SWZCcWZiRWlVMzF4S1BkTmFGRGFF?=
 =?utf-8?B?L1RmSEhmMGNqdC9KRkFjejlnWXR6SGZVK2M2allwbU53TkM3OThPY0JlMHNF?=
 =?utf-8?B?NjFIR1V6a0lUL0F6clVYZnpTc053dTllcHlRWWFxT1V4TUxGczBCVWl0cTc0?=
 =?utf-8?B?SGNjSGx5a2VSYjJsK3JFRHdBMkU5cHRBb0o4TzdUNjlsTXVUam1rclB1bTly?=
 =?utf-8?B?SDE1Z0kzcXQ4R1M2Ym85aC9UU3E4azFQWW1VTzgxM3V6bHB0cXFmNnB0cW1h?=
 =?utf-8?B?QkxnVGU3Ym15NkxHN2ZSNGpMTEdQditBUFBXUHZ6VUdyeDdOOGk2R2NsdnAx?=
 =?utf-8?B?QW9VZ2E5aWZNNk5zRHhDLzVoVlV5ZkZmYi9BTkxZMXhHelQ2QTJEU1p4OVJy?=
 =?utf-8?B?N3lJR2F4OERXcXZCeDAzSS8wNkJBbStCN3NkVlNuZkhmMDVyNDM0akdlTjhH?=
 =?utf-8?B?VHovMFdCVXNzd2UyVnNMS2oyaDVMR1FsVTFobVN0bVJwR1UzRVZnUTFQc2x3?=
 =?utf-8?B?V0FYRUViY1JNK3dMeWdhRWZKNTdZWjhmUmxRQndxd0pSWkljcEl6ZThlVHl4?=
 =?utf-8?B?Q3NQZFhyekE0WUM1ZTJVeEJpS2g0K1pWMDJ3L3crZDlnL0lOajA0dmhqR1Vr?=
 =?utf-8?B?RGYxZjZ6TEtReG9YNjF4QkNZUWE3b3FvdmVZdlJXNXFQQ3VTWDBQSi9uaE1G?=
 =?utf-8?B?V2plNUNlUUN2VUVkQWg4MzNQRXVBOFJuL2RTTm84Mi9OekMzUUh0WmcxdHZ5?=
 =?utf-8?B?QjMweDBUc0tkZnMxaVNFUExkTVBMcTZSa1BoNzRKSk1VYjFBYlB5Wmsrenpx?=
 =?utf-8?B?bGlxR1JkT2YxYk9JU0V1WkRpNmx4VlhSTFN4L08yMkxDaGxjU1VFdmRWWlVE?=
 =?utf-8?B?WXFqUU5iTzFBTHNlSHlOTDZhdWlUQ1p1ZWVJT3YrT1BaYXM2cW40cmRkRkdZ?=
 =?utf-8?B?eWRZTHM1THZpWWFWOU9VS2wvSGZCeHRLN3BhSnVSY0xpZjlzRDFTR2JnU21R?=
 =?utf-8?Q?dygwZK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:46:16.5537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e8ce00-9f75-484a-b5e3-08dd9c3a28f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9051

Hi,

This series is to
emulate legacy and extended capability list for dom0, including patch #1, #2, #3.
hide legacy and extended capability when its initialization fails, including patch #4, #5, #6.
remove all related registers and other resources when initializing capability fails, including patch #7, #8, #9, #10.

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
Jiqian Chen (10):
  vpci/header: Move emulating cap list logic into new function
  vpci/header: Emulate legacy capability list for dom0
  vpci/header: Emulate extended capability list for dom0
  vpci: Refactor REGISTER_VPCI_INIT
  vpci: Hide legacy capability when it fails to initialize
  vpci: Hide extended capability when it fails to initialize
  vpci: Refactor vpci_remove_register to remove matched registers
  vpci/rebar: Free Rebar resources when init_rebar() fails
  vpci/msi: Free MSI resources when init_msi() fails
  vpci/msix: Free MSIX resources when init_msix() fails

 tools/tests/vpci/main.c    |   4 +-
 xen/drivers/vpci/header.c  | 195 +++++++++++++++---------
 xen/drivers/vpci/msi.c     |  29 +++-
 xen/drivers/vpci/msix.c    |  35 ++++-
 xen/drivers/vpci/rebar.c   |  35 +++--
 xen/drivers/vpci/vpci.c    | 293 +++++++++++++++++++++++++++++++++----
 xen/include/xen/pci_regs.h |   5 +-
 xen/include/xen/vpci.h     |  38 +++--
 xen/include/xen/xen.lds.h  |   2 +-
 9 files changed, 510 insertions(+), 126 deletions(-)

-- 
2.34.1


