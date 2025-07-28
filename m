Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95905B133E6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 07:04:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060932.1426470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2S-0004DQ-1n; Mon, 28 Jul 2025 05:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060932.1426470; Mon, 28 Jul 2025 05:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2R-0004BC-T9; Mon, 28 Jul 2025 05:04:39 +0000
Received: by outflank-mailman (input) for mailman id 1060932;
 Mon, 28 Jul 2025 05:04:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gHj=2J=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ugG2P-0003wp-N5
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 05:04:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:200a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ad97a16-6b70-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 07:04:36 +0200 (CEST)
Received: from MW4P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::22)
 by CH2PR12MB9544.namprd12.prod.outlook.com (2603:10b6:610:280::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Mon, 28 Jul
 2025 05:04:30 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::28) by MW4P223CA0017.outlook.office365.com
 (2603:10b6:303:80::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 05:04:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 05:04:29 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 00:04:26 -0500
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
X-Inumbo-ID: 5ad97a16-6b70-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6QTgy7OiYp5GikE/yS5ebnzAt/EgAm/qB6mN1iNWPGAWfr5DtTII10Vo/p6iB6Zkw7dyoaRRWHOB8APTIZRCh+BFX+tEOdVCSZcZOquV8Ygg3jdqOHOih96yOTNfKVl3PmA2cziEyBsECoVU9zC8GvmzzoWTsehwnkU6yemt3H0artYYt7JIDQrF88ZZtjbKwZTBfmO9skbQgGhB2Z1aQSmkj7pkLWMU3hlEJbZZ4oJMfLanljFUW3WgHKlGW7/33iQOoJDMn8S1C8mbxar4H1VUhpqQQAhj6utoxymAPlp+0ZZ8LZ9lcAqUl4fSM1eSQJRATKWJEZGH9YMhZKLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW1UZCUPRItqxX4Fb/DDNjb7U/hN8oEQZn2v1lBpYSg=;
 b=br7XIxKd52gTKKRZarkX8vytIuo0X1ex4WP7APU03cKq/8Ml6ilHb9dQEvQbI82R7ukVebeolDT7299hnbLw/5WCuM1PYGNOjtC5Nd8VBhbc9zRCtjB06wEdcVgZr6MKm3URSwHq1SSQ1i1/4/MfZBOtsDtpFnW+JEexJh7esX74LIjoJqWMDbHFZEzXbCtrAPXUt0U68TZMSU2IChhap/buC/41Tkvsm/oipBTYnnr9l4MKuNb7EbX5DV/ROaQWlSlSsKjc5hewoOuUHQN8QlLNrV+bgzrKGIypVcoU55rRd+6WcKTEkDH0eTQo6u8f5PT1yij8nR1Jv3KaxpMlMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SW1UZCUPRItqxX4Fb/DDNjb7U/hN8oEQZn2v1lBpYSg=;
 b=MaACJ4xg+xR+iipFeNip6YsDRv75Ajs0cxrSFiiFtG2LNQXEz/i2KC8Hx9Cz6EeCrCDH2fVYYKKzvXY3Yd+6wFxf4v9u3tAhrA14djR57JXGWjizcQ7jGgmZsyWKXNefG6oDri4RIF6tlHooXG5LevB9KESQF2AWCmDl35Jxr2k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 2/8] vpci: Refactor REGISTER_VPCI_INIT
Date: Mon, 28 Jul 2025 13:03:55 +0800
Message-ID: <20250728050401.329510-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250728050401.329510-1-Jiqian.Chen@amd.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|CH2PR12MB9544:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7039ab-3cbf-4596-0a60-08ddcd943bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXora2NrUUxaM0FWc0dLVC80cElRWk5qZ2UycDdGdDBMaTNMcE9VSFphd09F?=
 =?utf-8?B?aDd2T0ZzbG4wWjUyTVFuTjBTZElnRXNRelhvYVAvdEpTZys4dUNBT1REUmlH?=
 =?utf-8?B?Qy9IOVlGS3dXNmdHN2pQWXhQcCs4QWZJTmZjRDFyU3RzeHQyMGIrcXBTTkxi?=
 =?utf-8?B?a1FEalZ6MUZQK1lNaUQ2WWV0RGNtcFVwWDZ5T0RQNHVvb3RrVFpheXhMc0E5?=
 =?utf-8?B?Q2hOb0hTTzB0QTJVNXoybXhFdGk0NmRaR1FYMkFXcW9RcTZUU0wwNjcrbzRp?=
 =?utf-8?B?bGhtaW5sREEvNlJJZGlNd1liMDV2Nmt1OHpHa1JUa1NyRXR0Tk5FS0FURUpz?=
 =?utf-8?B?cXh0R2FJaW9xMGk0Um5FNjk4UW9zMDQ0Y2g0VmZncnUrT2lKSTN5cFhKU1NQ?=
 =?utf-8?B?dXlaMldUUU9CU0h3Y2R0QU5kZktJejkyZVJuNFh3SDByR3lxUW9BUGJIbndx?=
 =?utf-8?B?cVB4aU53UnNIdVJtVDB2V1BvZkIzdzdBUVY4UjArS1Z6OTJ5Mkx6amNlNGI2?=
 =?utf-8?B?YWJMZDE5L0ZoNzdkMVNxdWlIZDhNSG0zVXIvT2p6dSszN1VET3dsZVo1bFNY?=
 =?utf-8?B?YzhhM3d5NUJpU01GNmU4Y0E2OE5BdzZkUU9ldW1hYi9wbldoTjFxcFMyOWxp?=
 =?utf-8?B?STFGUVNwR1lZamZLcENJQmViZDFOYWVzUlFHYjNRMXNPWW5OMjUxYy9UNnlr?=
 =?utf-8?B?cCtTc1JRaFVRbkhIdjRTbUdhaTN0aTdWUDJoTUtnSUM3bU5DbUo1MXVHTllv?=
 =?utf-8?B?czdmWE9oWlh3WStjRENwZmRtUU9tSlhISGZuZGRDOWtyR0tCeGRyMnhFVENF?=
 =?utf-8?B?b3piaXVTbmhieWgxVUJJMlhPN1dvRm41eitOOFhLS1pxNS8vOFNyVVh5U01R?=
 =?utf-8?B?VlpDUFpOSTdoRHgzWkozWkRVM3o4aXFiVTVwWTJ5T0k2T3ZOaDRHZytnS1lR?=
 =?utf-8?B?SUFjdnIzUW9QTDd0UE5ZUi9PUHlIY3dveTJTdE04RlpiMGttbVNobC9rUHRu?=
 =?utf-8?B?K2FHM3BJTXJBT1p4YWFjYWRGbDNCQWVjaW5yTEllczVuV3lMZk93d0R0bkw3?=
 =?utf-8?B?czV0TmVFMVJxdUlKTk1kQ1liZVlLQmlOYXpSRzlwQmtRNFhlcEU3RDdHVmVy?=
 =?utf-8?B?d2NpeVlFRjVJbG84L3F6b01wMFZsMnh0V011THRCTTVsd090S2dudzMxWXRV?=
 =?utf-8?B?aWZ5SzJ3MzVqdDcraFg4eE83WHhvNXBzcXU4cE9WVWJzSVU2Q295VmYyeGFa?=
 =?utf-8?B?UmVxQTF4Q0l2MDZsYkxnc3RqM3p1R2ZXUjg4NENSbzZiSU9VdHkvZ1dBNmsr?=
 =?utf-8?B?b2xHMUs0Mk9KelJCU1hFdDdQSjVDOWxMempCek4yWlRSQlJFdXo1eEZ5UTlu?=
 =?utf-8?B?UWRyNm40ZXYxbDZlTm1SZlRLMEtvaEVoOWlFOS84T2pMTG5ZMWY3QjdDR2s1?=
 =?utf-8?B?ZFVJOWJMaHk2MUtYVGNNTmo5ZEFMclJTTDN3eFVuU25SeEtZNWVPbk5IVnVy?=
 =?utf-8?B?NTh5dEl5V3lvdExRTjJSUmcxNHRBb2ZndlpvUElXMkpaQlZoUVpCU2VOaENL?=
 =?utf-8?B?cjRxS3htUHdpNXVSSjNCK3F1SnZSTkk5dXpyQXhmMlYzRllqY1NUT1ZmTmtk?=
 =?utf-8?B?YjhqL25KWVYybXpWUVJxc1F1QzluVlFrK2MwOU1YanhMOEwyY2ZqSnJzRFdO?=
 =?utf-8?B?d1g4QnBZN3JZMzJRMmZSRDdzdTJvTzR1QzBsanBlcW02WG9TemphcTFFSzZ2?=
 =?utf-8?B?T3M1dTdlS0tsc3JKbGpVb21qbTB1enljekw1bHpjZEllTlhIM3hUZTZJU2FN?=
 =?utf-8?B?eGpKMDV5S0VtTFlkT2lrUUZxZUc0dXN5NU1SZnBSY2NlbmZXREprdGdabW5H?=
 =?utf-8?B?V3FWSEJLbG00REg0UGVzMndlOXFsaE9EQ1I3OW1tUmp0K2F1YmtFaGNCME8z?=
 =?utf-8?B?WXk2c0VDVHd1a0FRZTdiaVNhdm93REdmYnBtSkxxWEdoTUQ0aGhnUG9leXdO?=
 =?utf-8?B?dDdUMlRSem43dGJzWGxSdW9KN2ZBVldRS3l5T0R1M0JPWnQycTNWVzY1TXJQ?=
 =?utf-8?Q?4yJrQC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:04:29.8197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7039ab-3cbf-4596-0a60-08ddcd943bdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9544

Refactor REGISTER_VPCI_INIT to contain more capability specific
information, this will benefit further follow-on changes to hide
capability when initialization fails.

What's more, change the definition of init_header() since it is
not a capability and it is needed for all devices' PCI config space.

After refactor, the "priority" of initializing capabilities isn't
needed anymore, so delete its related codes.

Note:
Call vpci_make_msix_hole() in the end of init_msix() since the change
of sequence of init_header() and init_msix().

The cleanup hook is also added in this change, even if it's still
unused. Further changes will make use of it.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
v8->v9 changes:
* Delete unnecessary vpci->lock that surround vpci_make_msix_hole() in init_msix().

v7->v8 changes:
* Recover vpci_make_msix_hole() call in modify_decoding(), which was  deleted by wrong.
* Add some comment to describe why need to add vpci_make_msix_hole() in init_msix().

v6->v7 changes:
* Change the pointer parameter of cleanup hook of vpci_capability_t to be const.
  If change parameter of init hook to be const will affect init_msix, and it assigns pdev
  to struct vpci_msix, so keep no const to expanding the impact.
* Delete the vpci_make_msix_hole() call in modify_decoding().
* Change __start_vpci_array from vpci_capability_t* array to vpci_capability_t array.
* Change the name "finit##_t" to be "name##_entry" and add a "name" parameter to macro
  REGISTER_VPCI_CAPABILITY.

v5->v6 changes:
* Rename REGISTER_PCI_CAPABILITY to REGISTER_VPCI_CAPABILITY.
* Move vpci_capability_t entry from ".data.vpci" to ".data.rel.ro.vpci" and
  move the instances of VPCI_ARRAY in the linker scripts before *(.data.rel.ro).
* Change _start/end_vpci_array[] to be const pointer array.

v4->v5 changes:
* Rename REGISTER_VPCI_CAP to REGISTER_PCI_CAPABILITY, rename REGISTER_VPCI_LEGACY_CAP to
  REGISTER_VPCI_CAP, rename REGISTER_VPCI_EXTENDED_CAP to REGISTER_VPCI_EXTCAP.
* Change cleanup hook of vpci_capability_t from void to int.

v3->v4 changes
* Delete the useless trailing dot of section ".data.vpci".
* Add description about priority since this patch removes the initializing priority of
  capabilities and priority is not needed anymore.
* Change the hook name from fini to cleanup.
* Change the name x and y to be finit and fclean.
* Remove the unnecessary check "!capability->init"

v2->v3 changes:
* This is separated from patch "vpci: Hide capability when it fails to initialize" of v2.
* Delete __maybe_unused attribute of "out" in function vpci_assign_devic().
* Rename REGISTER_VPCI_EXTEND_CAP to REGISTER_VPCI_EXTENDED_CAP.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to remove
  failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/arch/arm/xen.lds.S    |  3 +--
 xen/arch/ppc/xen.lds.S    |  3 +--
 xen/arch/riscv/xen.lds.S  |  3 +--
 xen/arch/x86/xen.lds.S    |  2 +-
 xen/drivers/vpci/header.c |  3 +--
 xen/drivers/vpci/msi.c    |  2 +-
 xen/drivers/vpci/msix.c   |  9 ++++++--
 xen/drivers/vpci/rebar.c  |  2 +-
 xen/drivers/vpci/vpci.c   | 44 ++++++++++++++++++++++++++++++---------
 xen/include/xen/vpci.h    | 29 +++++++++++++++++++-------
 xen/include/xen/xen.lds.h |  2 +-
 11 files changed, 70 insertions(+), 32 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 5bfbe1e92c1e..9f30c3a13ed1 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -57,6 +57,7 @@ SECTIONS
 
        *(.rodata)
        *(.rodata.*)
+       VPCI_ARRAY
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
@@ -64,8 +65,6 @@ SECTIONS
        __proc_info_start = .;
        *(.proc.info)
        __proc_info_end = .;
-
-       VPCI_ARRAY
   } :text
 
 #if defined(BUILD_ID)
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 1366e2819eed..1de0b77fc6b9 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -51,11 +51,10 @@ SECTIONS
 
         *(.rodata)
         *(.rodata.*)
+        VPCI_ARRAY
         *(.data.rel.ro)
         *(.data.rel.ro.*)
 
-        VPCI_ARRAY
-
         . = ALIGN(POINTER_ALIGN);
     } :text
 
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 8c3c06de01f6..edcadff90bfe 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -46,11 +46,10 @@ SECTIONS
 
         *(.rodata)
         *(.rodata.*)
+        VPCI_ARRAY
         *(.data.rel.ro)
         *(.data.rel.ro.*)
 
-        VPCI_ARRAY
-
         . = ALIGN(POINTER_ALIGN);
     } :text
 
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 636c7768aa3c..8e9cac75b09e 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -135,6 +135,7 @@ SECTIONS
 
        *(.rodata)
        *(.rodata.*)
+       VPCI_ARRAY
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
@@ -148,7 +149,6 @@ SECTIONS
        *(.note.gnu.build-id)
        __note_gnu_build_id_end = .;
 #endif
-       VPCI_ARRAY
   } PHDR(text)
 
 #if defined(CONFIG_PVH_GUEST) && !defined(EFI)
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f537f3f25d2a..469f4977441a 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -858,7 +858,7 @@ static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
     return 0;
 }
 
-static int cf_check init_header(struct pci_dev *pdev)
+int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
@@ -1054,7 +1054,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
     return rc;
 }
-REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 66e5a8a116be..c3eba4e14870 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_CAP(MSI, init_msi, NULL);
 
 void vpci_dump_msi(void)
 {
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 74211301ba10..54a5070733aa 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -703,9 +703,14 @@ static int cf_check init_msix(struct pci_dev *pdev)
     pdev->vpci->msix = msix;
     list_add(&msix->next, &d->arch.hvm.msix_tables);
 
-    return 0;
+    /*
+     * vPCI header initialization will have mapped the whole BAR into the
+     * p2m, as MSI-X capability was not yet initialized.  Crave a hole for
+     * the MSI-X table here, so that Xen can trap accesses.
+     */
+    return vpci_make_msix_hole(pdev);
 }
-REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
+REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 793937449af7..3c18792d9bcd 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_EXTCAP(REBAR, init_rebar, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 09988f04c27c..7778acee0df6 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -36,8 +36,8 @@ struct vpci_register {
 };
 
 #ifdef __XEN__
-extern vpci_register_init_t *const __start_vpci_array[];
-extern vpci_register_init_t *const __end_vpci_array[];
+extern const vpci_capability_t __start_vpci_array[];
+extern const vpci_capability_t __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
@@ -83,6 +83,32 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static int vpci_init_capabilities(struct pci_dev *pdev)
+{
+    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
+    {
+        const vpci_capability_t *capability = &__start_vpci_array[i];
+        const unsigned int cap = capability->id;
+        const bool is_ext = capability->is_ext;
+        unsigned int pos = 0;
+        int rc;
+
+        if ( !is_ext )
+            pos = pci_find_cap_offset(pdev->sbdf, cap);
+        else if ( is_hardware_domain(pdev->domain) )
+            pos = pci_find_ext_capability(pdev->sbdf, cap);
+
+        if ( !pos )
+            continue;
+
+        rc = capability->init(pdev);
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
 void vpci_deassign_device(struct pci_dev *pdev)
 {
     unsigned int i;
@@ -128,7 +154,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
 
 int vpci_assign_device(struct pci_dev *pdev)
 {
-    unsigned int i;
     const unsigned long *ro_map;
     int rc = 0;
 
@@ -159,14 +184,13 @@ int vpci_assign_device(struct pci_dev *pdev)
         goto out;
 #endif
 
-    for ( i = 0; i < NUM_VPCI_INIT; i++ )
-    {
-        rc = __start_vpci_array[i](pdev);
-        if ( rc )
-            break;
-    }
+    rc = vpci_init_header(pdev);
+    if ( rc )
+        goto out;
+
+    rc = vpci_init_capabilities(pdev);
 
- out: __maybe_unused;
+ out:
     if ( rc )
         vpci_deassign_device(pdev);
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 6a481a4e89d3..17cfecb0aabf 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -13,11 +13,12 @@ typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
 typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
                           uint32_t val, void *data);
 
-typedef int vpci_register_init_t(struct pci_dev *dev);
-
-#define VPCI_PRIORITY_HIGH      "1"
-#define VPCI_PRIORITY_MIDDLE    "5"
-#define VPCI_PRIORITY_LOW       "9"
+typedef struct {
+    unsigned int id;
+    bool is_ext;
+    int (* init)(struct pci_dev *pdev);
+    int (* cleanup)(const struct pci_dev *pdev);
+} vpci_capability_t;
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
@@ -29,9 +30,21 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
-#define REGISTER_VPCI_INIT(x, p)                \
-  static vpci_register_init_t *const x##_entry  \
-               __used_section(".data.vpci." p) = (x)
+#define REGISTER_VPCI_CAPABILITY(cap, name, finit, fclean, ext) \
+    static const vpci_capability_t name##_entry \
+        __used_section(".data.rel.ro.vpci") = { \
+        .id = (cap), \
+        .init = (finit), \
+        .cleanup = (fclean), \
+        .is_ext = (ext), \
+    }
+
+#define REGISTER_VPCI_CAP(name, finit, fclean) \
+    REGISTER_VPCI_CAPABILITY(PCI_CAP_ID_##name, name, finit, fclean, false)
+#define REGISTER_VPCI_EXTCAP(name, finit, fclean) \
+    REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
+
+int __must_check vpci_init_header(struct pci_dev *pdev);
 
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 793d0e11450c..b126dfe88792 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -188,7 +188,7 @@
 #define VPCI_ARRAY               \
        . = ALIGN(POINTER_ALIGN); \
        __start_vpci_array = .;   \
-       *(SORT(.data.vpci.*))     \
+       *(.data.rel.ro.vpci)      \
        __end_vpci_array = .;
 #else
 #define VPCI_ARRAY
-- 
2.34.1


