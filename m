Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C7B133E7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 07:04:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060931.1426460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2M-0003yg-Oi; Mon, 28 Jul 2025 05:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060931.1426460; Mon, 28 Jul 2025 05:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2M-0003wv-LW; Mon, 28 Jul 2025 05:04:34 +0000
Received: by outflank-mailman (input) for mailman id 1060931;
 Mon, 28 Jul 2025 05:04:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gHj=2J=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ugG2K-0003wp-VC
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 05:04:32 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:200a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57824167-6b70-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 07:04:31 +0200 (CEST)
Received: from MW4P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::31)
 by LV3PR12MB9257.namprd12.prod.outlook.com (2603:10b6:408:1b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 05:04:26 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::8c) by MW4P223CA0026.outlook.office365.com
 (2603:10b6:303:80::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 05:04:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 05:04:24 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 00:04:21 -0500
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
X-Inumbo-ID: 57824167-6b70-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Les/YSUTFMYigMCf9fhQeYNjKv52z6MKYeALGnMkjg0kvNXBYd6pH/VT9h5usIiocimmMwLSmtCYP8qAOE+zC58/wUaeoQncwTXvziB0hI0TLetDrKawwUpmln22uYllafTue/IzVWIqkXjf6NH6SeWQdgi+VBRl7LBVSRJAPKCYgdrvzTYMQDK9k6HUq+Ndebqdah3xD6j+S3mydGz7bileb6rJJFCPFnGacsl7FRa9Uc/FMCLjBjEUsHQE95ktQaMsMtmHjz2ZLXn8AXBY/zsUQNa6U1EfnqE+gBiTlTi1MliakoS0JsCIo+lonZHIZKmft1MzqftFq7dC3vkD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AITRwio7LpyCcDVntKD29CEQvWFBp1r/ncZJXbB+yW0=;
 b=hqr4B0o10l+EKYEyMRYgP/3fx9Hcf3OBwCPY4V8xZR6nD3aj3kzXUbelJ9xEY0EYiTTwROTrsbnCUUq2Uc1Yr/Co0XlhAdND1Bhey29zCPvF3qR2XzkURKATQJYI/BUOZmoc7jUP9JR4Ab8uyAJQ61Np11N2OXSpuy0hsDLYOgCJ+j42MjCUwNRzVCXf/pegFQk2Rq4jGrTqThmChuIfa1wLoISyL8Cpcrdu6Wpj09sVjeeXSicQVlMvVq3+nhBmciORh2C21G5tXXTnyq/s/gV+9s4uUCviIH2MSmd/F1c7LG7kAcIG8c5l0NSoRCZ1OgcJC/WmmRw+82P/uUUlfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AITRwio7LpyCcDVntKD29CEQvWFBp1r/ncZJXbB+yW0=;
 b=fdfMJ81xAreDd0PetyjtGOczP40JbmmPUPi6LxBGPaZV41vJ7TZJ+Sl/BNIAhHY+9xKuJqSi1/Z8/5CNtgU+VUYX+jsbb7bzFe/P6zImC0f0RT4eOTpIgS7X3yZD0XuUYerM2KBsxhoCRxSYhLIGmtLHbQlj/64NBC2mgnHudgA=
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
Subject: [PATCH v9 0/8] Support hiding capability when its initialization fails
Date: Mon, 28 Jul 2025 13:03:53 +0800
Message-ID: <20250728050401.329510-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|LV3PR12MB9257:EE_
X-MS-Office365-Filtering-Correlation-Id: 88993a58-973a-45f6-19f6-08ddcd9438d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUNuVUwxZ1g5b1ozSFFja1I5akJaNzFBWUkvWVI3dXdyVWV0enFXK1JzU2Ni?=
 =?utf-8?B?TmZlZ255aVJVTitLWHdSYXExQUVpeVB1aktXRzJKMmJEQnZZVlFTMXVabTBx?=
 =?utf-8?B?QnhWeXZkOGZKK28yWDBHT1ZtdHcwaHl3alE2ZmxRTTY4VTFyWkh1RDRLZ255?=
 =?utf-8?B?RWlmMTJ4MkhlbU9id0J1U2JsVlcyRWowS3E4VTlNTUdlZDFZQnhoaU5HTFdP?=
 =?utf-8?B?a201SFZyQUVHNGFGY0VRb3FtelVPNUM5SXVsWUg4c2tFVUtFU3YxMzhiQXoy?=
 =?utf-8?B?ajRhcHlIQ0RvQlVPTmU1RElnWk9OM1JHeDIyVWcwcGlodHljWWFxRlFTeER2?=
 =?utf-8?B?TUZJejg2eWpHWGV3dGlQbXhlSHJqTHVFRm1pZEdJSUdoZWh1dFFGVC9jTWVZ?=
 =?utf-8?B?R21DVnR1WWxLMWROZEJldjIrOGJGN0RKQTh1QjVoY3lWajR1MFB2dTU3am1j?=
 =?utf-8?B?ZnJNbk9XNmRkSkRvTm9vaElzNmpRRVF5RC85Y3pkcXBneitFQjdDbWJLMHN1?=
 =?utf-8?B?SDU5eDdiSmF3TUMxcEl6SXE0cVgzdHJnNlpscnh3Z0RRL1p5ck9YQTRqV3d6?=
 =?utf-8?B?MU5RSFZjdFp4UlNJMzJ3UzVYQ2licFk4b2NIdGQzZlRDaDlVcjN0WmZ3MzE5?=
 =?utf-8?B?eFVEenNYaVpHbVRIYlAxUEZ3dGd4dHh5L1djUy9oVGhvbnZ4WkJiTGhjNTdv?=
 =?utf-8?B?SXlxWmt3dUFLTHpFV0dvNS9qSlpuVmFmNWRqeUJselVSSTU5TWhoSmZnei9w?=
 =?utf-8?B?SFVWdGhremhpZzhZNSsrcXZXZDRjZjVaRHh5RTNDTEtaK0tET09XZitIaWtz?=
 =?utf-8?B?czh1VVhRSHNOUkU3YjNqbkliZ200Zkx4Z0NENXJtK3YxNjFXaE1zcExMS29G?=
 =?utf-8?B?T3MzUUVCMlBoQ1lkOVZ6dUs3eUkwbVZiVnF0ODNGWDdFdUkvSkdVSmUwSDJw?=
 =?utf-8?B?N3IvUWlQMEJMYXFBczkwR1FFVUxiWDI5Nm5EWDdaR2dZRkdrLzFLMGdaazlD?=
 =?utf-8?B?NkFhUGs5SDlLcUpDOVhXK25XZW1uSEpGdnZXZFhPVUc1WFl2VU9RTmVoVXZP?=
 =?utf-8?B?NHZqdkd0OXhIbGlWelhWczZPcHZ6YndySG1WZzgxYzNpbXc2VUJ6enNXZFJi?=
 =?utf-8?B?WmJUdmg2cmRwTmJHdWp3akNQRmwzS3JzcmVBNytGTElVcy9CbmJ1cW52NEFC?=
 =?utf-8?B?NmhNd2JMcFlWQ3FRNmQ0cUlaRFcrMmFWamVvd0RXcW5SNlAySnB6MUZYczRq?=
 =?utf-8?B?MUVyL2UwWkJZY3puRDZzdXZDRXJUbTNoMnFUeW5ScEdxemQwME4rcDUyQlNN?=
 =?utf-8?B?VXNjZGpkczRhQTZaSkt5a2lodHJ3WC9wRVJMTnFIR1REWW1rVlBBM01QM05a?=
 =?utf-8?B?MlRKV2taQmRmeE9WWHR0SHJKbVpGL1Z6d1RBOEdTSGtnQkltdVRZcmxuTHVT?=
 =?utf-8?B?TG05SGZXOWY5NUpBOS9DS0d4dTgrQVBmZVFiRGVJK2JEaEx3L1ZtN0wwWm4z?=
 =?utf-8?B?Nlc5dlVmdXVHVko0dHZBMFphTTBRbkdYVzJ3WExoNWJBVG5yMjJjZWpIRTZV?=
 =?utf-8?B?b3pBU2xHbTh1Z2lUalo4bVFnRzB0bW1uOXEvTjMrMU5yV1ZObU4zbEJoMm5L?=
 =?utf-8?B?c2hWOCtqR2ZHdDZWazcxSVRKODB1dG1yUUF5QS9HVHo1YWw1c2RieGxhYlFm?=
 =?utf-8?B?N1JXcUZZTkgrcERPb3VObzRlT21ZSFpZbEJ6VlZrSk9Ga3lUdlFLN3F5MlFC?=
 =?utf-8?B?RDFZVlVtQlNRdTRBOGlUK0FnRnd5WUlBNk0reGhHTjJValE2NmlhZFRRdUdC?=
 =?utf-8?B?Mkd3WkkyN29odis0eU1XaHE5UTVodjQ0WFp4VDZLUmJHTzM5U2s4cThPOEpS?=
 =?utf-8?B?UmJPQ2xUU3FkQVBXdlhFVUtxMTE2RFVTY0RXcVgvcmxtZDJaeGVIajk4MnFm?=
 =?utf-8?B?WkV0cW44OTgwUGFTZXljazRUYmJkbzM4Y3VXNFYvNmJDS2pIelM0bGtwdHda?=
 =?utf-8?B?eWFtSFI0OVUvRU5NTmo0ajlaMCsya2kxbDF4MjhBUS9wbERSY2tuaFoyZDRH?=
 =?utf-8?Q?JvCNle?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:04:24.7341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88993a58-973a-45f6-19f6-08ddcd9438d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9257

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
 xen/drivers/vpci/header.c  |  47 ++++--
 xen/drivers/vpci/msi.c     |  46 +++++-
 xen/drivers/vpci/msix.c    |  51 ++++++-
 xen/drivers/vpci/rebar.c   |  41 ++++--
 xen/drivers/vpci/vpci.c    | 291 ++++++++++++++++++++++++++++++++-----
 xen/include/xen/pci_regs.h |   5 +-
 xen/include/xen/vpci.h     |  35 +++--
 xen/include/xen/xen.lds.h  |   2 +-
 13 files changed, 454 insertions(+), 79 deletions(-)

-- 
2.34.1


