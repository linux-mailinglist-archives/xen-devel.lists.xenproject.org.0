Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC254AD6C2B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012638.1391137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGK-00006K-9r; Thu, 12 Jun 2025 09:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012638.1391137; Thu, 12 Jun 2025 09:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGK-0008VA-5C; Thu, 12 Jun 2025 09:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1012638;
 Thu, 12 Jun 2025 09:30:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwpW=Y3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uPeGI-0008FN-RC
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:30:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2412::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d930e516-476f-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 11:30:17 +0200 (CEST)
Received: from MW2PR16CA0063.namprd16.prod.outlook.com (2603:10b6:907:1::40)
 by IA0PPF12042BF6F.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Thu, 12 Jun
 2025 09:30:11 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::df) by MW2PR16CA0063.outlook.office365.com
 (2603:10b6:907:1::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Thu,
 12 Jun 2025 09:30:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 09:30:10 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 04:30:04 -0500
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
X-Inumbo-ID: d930e516-476f-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1vUpOtgG5qpLGUmNM4lJrxqVXYobpNmFxrFBdl6ZRkYKbKrBwZ9KlnAzZ5Dj3RGSqoifA9p8r085W1XfsxeTYmj/a2HZjBKcUoew1rfTUKNtgv4Wpmnk1PMNqrMaMpoUZhlthkpNrauvp0IzaxkuqS6cu2BDrrF0Xf+uHypSXUEzPO5bQHZKOBKqKJPDWX+OJZw+zQzTgrh/WWSWaSq9pYGUNTnp0O1JxT9jnBi4KwPjP55Kmt0Ndb8yPbCzcfNUjtUfqwu6NhLR7uUQ3VBEfXEFPBApeWjt5/xMapViav04G3CDBzxiM57cq1h5ASHifxSzmWmGZk6IFt7VNLsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/ChNhMBnlTEwj3H/64jYRfXdSgIPOdNNIOVJgRyNH8=;
 b=X0+BK0S0WLDZz7ce8/vVtL53HRQBALBiBwuhu7IZ6yGu+Lhk8pft9rC56xp96tGjnPeTDiliV0VdRvoGmxZF+vXDdYPSRlUq1eFn0tE3b0xNOz8ZgoInurWsNASLGFPIM2A/JIylVjkV9eZL9OMzJN12fz980upcWhOQv03Bb3zawfLt5Jjp+eVC4TYmyg8sAev99jZbHdLIi9sZtsLi5LfwQX0NuspbwKlWALNvk0w/3Ez9nEhBqO1+jBWk4bn+FO7eZRc8wZ9AhAEo8rFAx1a5QuJXJl8yuFsebYYAab33lm6Q/QvckXOWvHyus+y2/qFOOAv7lGlcs4Cw3DeQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/ChNhMBnlTEwj3H/64jYRfXdSgIPOdNNIOVJgRyNH8=;
 b=oOvnggYOJ5aXTkN+A1q/BLiQMZXAGdEK69iRpWionH8A1hHrnFrJvmjTuwW++mz354eefKfqun4VPOKo6uv1H1wbMmiHyBHZaHeXgvrIqvhFiodB9iErnDmJyztUBOaUaI8buMzwjtlhgg+uZ8G/yC2n0FZAL0NzNl3Ek/jIXXI=
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
Subject: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Date: Thu, 12 Jun 2025 17:29:36 +0800
Message-ID: <20250612092942.1450344-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|IA0PPF12042BF6F:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c97f06-4a4f-4520-8e4a-08dda993ba4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVQ5emhwcVJPTVNObGdTVkhTc2w4N0pudmt3SU01Z2FES3R3c1h1dGNCMU5W?=
 =?utf-8?B?WVJFWm54N2tpd2sxZXZxR0tHSXFlZm9IbFUwMnZFOW1RaEE5TzhBMGpyaDlx?=
 =?utf-8?B?WS9BWnY1Ly9WNWtydlV6a1dRYWlhcGJKeTVJUDJTcE5MU0ZTWDBZUmV1YTdu?=
 =?utf-8?B?M0xicytpRmZCbVY3UkpCN0RhTXBLbElwT3hHODdWVHhHSitKYlFxSUN6eTE4?=
 =?utf-8?B?Sk5Sbk83bWJ6QzNTWThkRkZ3aitMRWlCdVk3MTZmc05Ua2JHV2UxV2lLWDdi?=
 =?utf-8?B?VDY3Ui9Gd0tibVE5Y0ZHa0pOT1NBeVJqR1JqWnpTMmptU0ZuNkEzdFJsWHB1?=
 =?utf-8?B?bTV1ak05SkpPRE9EbEI5S3IyWGRoL3Vjbm4yTEtNcjVDMVJGV3VFT0FMTFdR?=
 =?utf-8?B?eWtaMnBqQ3JSUmJmVVVESG1VY3YwRnczNXBzMDhDQ3FWNE1CQTVwVWt6TWcv?=
 =?utf-8?B?Lzg4SWtvUVUvRjNMZDg0TFBnRE1PRjRFTmM1bloyRTlyelJubHFqTGNoNW9D?=
 =?utf-8?B?bnVYNmJ1eDRId21Nb3FsQU5JSk9MRGNDbVNEU3NjNGlpRmJSNlV1NEd1Wi8y?=
 =?utf-8?B?THgxRExKNDhNUWJmT205NUtFNVh3V2tTRGhxMlg0S0JNY0hReU0rYzRENXlH?=
 =?utf-8?B?WmZJUDBTd0owOE8vOFNDSk1OUzZUTE1GazFjc3orcUdJK1lWdWZlRzh3bnp6?=
 =?utf-8?B?OStsYkdZQ0FobGNYMjNEZEc5U3AwY1NrTGhkS2VjY1lrVEFZMWVSVW1ZaHd2?=
 =?utf-8?B?NXpmMUplMkhuQktSeUtNRlVUWlNqU3VaT0x0Vm1FcFlWZ2tRS3BrZTZnN2lF?=
 =?utf-8?B?Z0FZeFdCUHNBNk9wNnQ4M2tjSWZsQ2xpSjU4WlhIc0syRkpVeHMwc3BORjFu?=
 =?utf-8?B?K01DVmhYZVpUbGE0SUdvekNGbzg4Yjh2a25OT0hGNDcyODNJeWYwOFZKRHhU?=
 =?utf-8?B?eVFlL1NKRFZVN2lJd2ZacGtXN1lxano0MUIyV2FIUmEzcG9lUjFoa1VzVUlj?=
 =?utf-8?B?cUtvRkdBdmxwUkxWaVB3Q1ZFSVlNWVpqU0hTMWhhNkc4R2NpSnJDdTBDV1dG?=
 =?utf-8?B?NjEyU1FOV09VYXlBWXo5Z0lONndLb21pcGozRlNlS3BLUFVxMTBNU0RRNnJ3?=
 =?utf-8?B?VTNyRlFGYTQ1QUkweGsrK202cGg4b1ZtVFpoUGFCeEhGdkVhRm14am84UWd1?=
 =?utf-8?B?cWpUMEUwaVphbzYzYm1pdGE0dENLbVF5NEJoWnZTTWMzM3B0SjNGcFkzcVdN?=
 =?utf-8?B?dHd0eVZ5blhOUjlMcmJNR09pTnBjM29wd0wwdXVTTGRYSUM4R3E2ZjNmYlo0?=
 =?utf-8?B?N1BCRFdCY3BCbVRVclZrY1lsa2Q2Z2xkZmxpa2dpeEZEVWVRb2gzYU5QZ3lP?=
 =?utf-8?B?VnF1QjAvamFXVkxFUGdHTWhEVVBhM3g0TUdmVW0rakgxVmErTlVrR2tycGtE?=
 =?utf-8?B?Umkxek12SHpXTUorN3prQ2dFYXMxK0V6OWZ0WVZnQWdNS2ZzNEJma01rQXBU?=
 =?utf-8?B?U0xOUFdsVDd0TnRyTVdLd2VucmxhdWduUkE3WVV6dndvMHhkdnZ2b0JYTHdR?=
 =?utf-8?B?TG5MU1hoeU51Q28vSGJQNCtteTA0ZHlRclY4VlFUa2ErVlRmOFBLWGg2ZzIz?=
 =?utf-8?B?b1dCUmozUkJLZ05lZzdiOXRYODBBSnUzSFI0Q3RaQUhCZFlEdkRUaFpxQlE0?=
 =?utf-8?B?b0s2MnVKa3NFU3A4M0NYekN6K1ozdUJGNllXSEtRZGUwQ0VFWEFJVHhTdTJD?=
 =?utf-8?B?Y2g0RGFSTWpZaDFXSG1lNFNPZW9LTy8weTJzZ1huSGltSVoxRkdZSlZRaGEx?=
 =?utf-8?B?dWExYkxxWXhlYVRZajhJMEpkWUtSQm9ZZHkvWnl1R2FRdE1iYzdEK3FRdklT?=
 =?utf-8?B?Z3JSbEREcDR3R1ZuWURES0xLbzNGSGZncVh5SmdnSTI5MWY2K09kRDZqcWdI?=
 =?utf-8?B?Y1ZnZkZibUlIaHZkRThqR3lhbURGRjUzaVZRd0w2SkZ5RmdPNkw3NDJkbjAr?=
 =?utf-8?B?c2J0VGhaQk0rWEZkUHJ3Q2JXbW41RzJMM0NaMStpZSszb2lPUmhkdENsdG9H?=
 =?utf-8?Q?eMs5ef?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:30:10.6201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c97f06-4a4f-4520-8e4a-08dda993ba4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF12042BF6F

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

xen debug
---
 xen/arch/arm/xen.lds.S    |  3 +--
 xen/arch/ppc/xen.lds.S    |  3 +--
 xen/arch/riscv/xen.lds.S  |  3 +--
 xen/arch/x86/xen.lds.S    |  2 +-
 xen/drivers/vpci/header.c |  3 +--
 xen/drivers/vpci/msi.c    |  2 +-
 xen/drivers/vpci/msix.c   |  8 +++++--
 xen/drivers/vpci/rebar.c  |  2 +-
 xen/drivers/vpci/vpci.c   | 44 ++++++++++++++++++++++++++++++---------
 xen/include/xen/vpci.h    | 30 +++++++++++++++++++-------
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
index bf956b6c5fc0..b1c77b2b48d5 100644
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
index a39bf2b12585..2cf54ce60297 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -872,7 +872,7 @@ static int vpci_init_ext_capability_list(struct pci_dev *pdev)
     return 0;
 }
 
-static int cf_check init_header(struct pci_dev *pdev)
+int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
@@ -1068,7 +1068,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
     return rc;
 }
-REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 66e5a8a116be..2d45c7867de7 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_CAP(PCI_CAP_ID_MSI, init_msi, NULL);
 
 void vpci_dump_msi(void)
 {
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 74211301ba10..674815ead025 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -703,9 +703,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
     pdev->vpci->msix = msix;
     list_add(&msix->next, &d->arch.hvm.msix_tables);
 
-    return 0;
+    spin_lock(&pdev->vpci->lock);
+    rc = vpci_make_msix_hole(pdev);
+    spin_unlock(&pdev->vpci->lock);
+
+    return rc;
 }
-REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
+REGISTER_VPCI_CAP(PCI_CAP_ID_MSIX, init_msix, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 793937449af7..9cafd80ca2c9 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_EXTCAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 8474c0e3b995..6e768bb32447 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -36,8 +36,8 @@ struct vpci_register {
 };
 
 #ifdef __XEN__
-extern vpci_register_init_t *const __start_vpci_array[];
-extern vpci_register_init_t *const __end_vpci_array[];
+extern const vpci_capability_t *const __start_vpci_array[];
+extern const vpci_capability_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
@@ -83,6 +83,32 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static int vpci_init_capabilities(struct pci_dev *pdev)
+{
+    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
+    {
+        const vpci_capability_t *capability = __start_vpci_array[i];
+        const unsigned int cap = capability->id;
+        const bool is_ext = capability->is_ext;
+        int rc;
+        unsigned int pos = 0;
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
index 61d16cc8b897..5da2cec9464a 100644
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
+    int (*init)(struct pci_dev *pdev);
+    int (*cleanup)(struct pci_dev *pdev);
+} vpci_capability_t;
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
@@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
-#define REGISTER_VPCI_INIT(x, p)                \
-  static vpci_register_init_t *const x##_entry  \
-               __used_section(".data.vpci." p) = (x)
+#define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
+    static const vpci_capability_t finit##_t = { \
+        .id = (cap), \
+        .init = (finit), \
+        .cleanup = (fclean), \
+        .is_ext = (ext), \
+    }; \
+    static const vpci_capability_t *const finit##_entry  \
+        __used_section(".data.rel.ro.vpci") = &finit##_t
+
+#define REGISTER_VPCI_CAP(cap, finit, fclean) \
+    REGISTER_VPCI_CAPABILITY(cap, finit, fclean, false)
+#define REGISTER_VPCI_EXTCAP(cap, finit, fclean) \
+    REGISTER_VPCI_CAPABILITY(cap, finit, fclean, true)
+
+int __must_check vpci_init_header(struct pci_dev *pdev);
 
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 793d0e11450c..eb86305c11c7 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -188,7 +188,7 @@
 #define VPCI_ARRAY               \
        . = ALIGN(POINTER_ALIGN); \
        __start_vpci_array = .;   \
-       *(SORT(.data.vpci.*))     \
+       *(.data.rel.ro.vpci)           \
        __end_vpci_array = .;
 #else
 #define VPCI_ARRAY
-- 
2.34.1


