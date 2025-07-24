Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8DB10032
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 07:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055184.1423675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqt-0006Im-AX; Thu, 24 Jul 2025 05:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055184.1423675; Thu, 24 Jul 2025 05:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqt-0006Fu-7E; Thu, 24 Jul 2025 05:50:47 +0000
Received: by outflank-mailman (input) for mailman id 1055184;
 Thu, 24 Jul 2025 05:50:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42zg=2F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ueoqr-0005TY-DK
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 05:50:45 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2413::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 230b44ec-6852-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 07:50:43 +0200 (CEST)
Received: from SJ0PR03CA0142.namprd03.prod.outlook.com (2603:10b6:a03:33c::27)
 by IA0PR12MB7580.namprd12.prod.outlook.com (2603:10b6:208:43b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Thu, 24 Jul
 2025 05:50:36 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::ac) by SJ0PR03CA0142.outlook.office365.com
 (2603:10b6:a03:33c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Thu,
 24 Jul 2025 05:50:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 05:50:35 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:50:32 -0500
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
X-Inumbo-ID: 230b44ec-6852-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDrEm/4PdG8OkhjgAOdK0JIinRTJ1dcpwL4GgrNGW3B9SNQ3y0BT47UdCc6w/B+FWUrn/M74PCNFiPAa2zfW/E35xSJ2ISYgdjHLIkEiR4VrPEXKhIz2F/HievdBdwX9tBMnrjuMQjUlMa+mXUYkQIebolf4vISFx6rxJygq1I88ZMkNSZ4eCGGl5cW+Cnb5Wb2t9mifuSl/xvoCzXof+cJ+3nhK5h1veOre+VeXXmUk4u1GMCQrzXFtNYlwuGZkma25fPZhH67j5uKEubaRxYZLguYqai/7HBm7f58MjEWKS4ln/iuuYEJFCCRp56VvHcRkfdd84oFC+f9TRTVt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsUNJ7a4FB2K+Y/WH3LrXbvNnHtpf9eqxl3+5xeuxYA=;
 b=VyEqCj9VnkynqyU8dHkuHbzGgfhuKXqT6At7Z7m3o4lWmK/EBoRWG7m/nyAj4g5twVRgNmpsftIOLasZqp0CKoW39i/EtSzed6thgcVKP05voSYfYD4Cja2c20MjaR5oWu3FLCLRZw0SYeW9yPHC4py+ID5p9W68IO+jxEWLlR2LwB3r6gxZ0jj4TCgGEJ+/xp768FG8HxwLsZN6umdthhMNFL+K5gMtuVlMSdoX6yGTm6s+NDDuuBQKhqI0582GXzNFQh9KhXXo3GyoEfDUACIf4+ZaPRTSC9733OVgYAgwKgLozT01qiAEXdqnHtVTUn5vLw9Cd4RJGau2pq8AJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsUNJ7a4FB2K+Y/WH3LrXbvNnHtpf9eqxl3+5xeuxYA=;
 b=Yc/teFE+i8yGZT/hyibNINOUFD2OXi98/nLSGiZIyuu1S7+Qz4YgpXmAk9JCHfenEYXwqmhkgnq8RXXm0JxTSN6mkESCbOyyaiewJMOUn2zgJYn4sOyiSC6hYtrd/EzjONW8p+UxS0OPwyrrHJFV6g8QV529/AaNFgfvzC5iTvE=
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
Subject: [PATCH v8 4/8] vpci: Hide extended capability when it fails to initialize
Date: Thu, 24 Jul 2025 13:50:02 +0800
Message-ID: <20250724055006.29843-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724055006.29843-1-Jiqian.Chen@amd.com>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|IA0PR12MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abf00b4-1a21-428b-859d-08ddca7602f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ymd2bWxCZWRtbWo4U1lmS3VGang0eVVCbU1kamJxekk4aHV0bGpTL0l4Q3J5?=
 =?utf-8?B?YTB6RFdROU5COGgyeWNEYmFnTm5BQm44T0IxTHdNMGJZUk05QStPUFpCQjBz?=
 =?utf-8?B?aE4ycTNvYWxQRDZDZ2p4eU8wOG5YSWdXeEFPd0gzVWpZSldnUm1mcG5sZnBH?=
 =?utf-8?B?V3pJVkg0aXZHcFpNTk1ISW9tNDZZOXJBdlZRem5zYXJCQmJHUmJ4Ny85Mkda?=
 =?utf-8?B?WHNheWJQQkhYV0J4ZWFVZWo0ZWhpR2NTdGZhbnowUjQyK0FaUlRPcDJmREF4?=
 =?utf-8?B?anlQS1V1UFN0T29ram5ORmI2cXp3TE52d0FaM3R6cUF4RXBsWHllZmpndWlk?=
 =?utf-8?B?WVAyMm1UU1JUdzFXTW1uQ21WMnViN3phMXo4MEc3MFJtN3A2RXU1U0lZWURY?=
 =?utf-8?B?OTlZMXRqOS9iZldBQlVhM2RVT3BDUlp5anVhYzZvZDBZK3JveXRFT0JkUEgx?=
 =?utf-8?B?RldJQjVCMXBlZUNuTFJGRHlpMTRLaitROTBEMDB2dk82WTk4OVNJSzF4UkRG?=
 =?utf-8?B?V1NoNTNUYVBKajVrWGdRNGNlSWlWTnd6RnVkcEYzU1ppc2NmYkJYYnJlNVFw?=
 =?utf-8?B?UEQ4bUQ4cVJRT1E2TDF3ODB5LzFmcEdkc1dzVjcwMDI5cGF5d2crSUJRNXc5?=
 =?utf-8?B?M0xKczRqL2N1aDlSN0dBMDdGZjZhZ0krem9mY3dya2NGbFNsN2FYUnkzK2dp?=
 =?utf-8?B?eUFkRG5mQ09taGFpZDg1RERuVDlxZStYbm5qeGp5ODBseHhvaEFSMUZHaHg4?=
 =?utf-8?B?d3hxNHNxTWRVb1crMHFJUG5ObDE2b0FUVWN5OUdESnllQzZxMUVKR25LZTFU?=
 =?utf-8?B?NEFMRVpNSUxPZFQ0S3ZMZlNiY0FWZnlVYlNBcmN3bVVnVjdHdWQzdlN1d0ZI?=
 =?utf-8?B?QjFZbW5UMGR5TUJobVllQ01MNXh0UThST3hqUTJrL0owNzlqbHBPY1Rmdy96?=
 =?utf-8?B?M214czZqZEo0QmM0RmdLSGJlSFJDb2djT1JlOVJrTmd5SVVhT2FnZXhsdkdt?=
 =?utf-8?B?cEp5KytiWU05VFBWVmRZNEFQTWpQMkRmL0ZnVnoyWlZOWDNuMFF5RVh3OWRh?=
 =?utf-8?B?cStSYWxCRlR0NVQwa1dWajhjUG9qMndUaW0xV2FQcmJHS2lucGhwVjF0SlQr?=
 =?utf-8?B?dXcxa2tYajlkQTkwY28wREY3dGtQNUpLNG0yYVFaYzJDUkQ4VXhHL0ZUUW5q?=
 =?utf-8?B?eUJsQlZTc2lpcTRMck5uUUI0QnJ3UFpVRzRLNy80c1A5S1ZUZUVuVzE3amRk?=
 =?utf-8?B?L3lZT25Ud1Zla3lCUjQ1Q2hFOHg1bzhCWWx5M1QyVTJUaVFKSkUxVVFOMHgw?=
 =?utf-8?B?UnJyZzRPVjlwTHh2ellsNWxlNzJFMVVuMU92c2pRZVRmOUNYbmpWT1ZESXcx?=
 =?utf-8?B?Mk5VdUVtS2VIS1B6SVF4YWxseXEwWll5MVlwSnFRZXBJVUJHVlBlM1JiY25t?=
 =?utf-8?B?bGNOZXRsVmJJbC9vWlBZdTJ5RmN4RStHSHNJenBBaG5CQmhGN3V0OEZMOWJP?=
 =?utf-8?B?bXB6Z1dIM2lGVVhteDZJQ0s1ZjN0NnJnbnljVE9GcEpMSzViV0RXZEJHSWJC?=
 =?utf-8?B?NUc0QkRpV01hOXpwNnRLV0h6VGt0VnE5bUc5aCtvVFJHRzBWZlVtclA3djVp?=
 =?utf-8?B?TERKRWh3Tm9VL00ycncwdVh3dktRS2pFRHg0Qk5MTytIVC8xTW9zQkNFMHFO?=
 =?utf-8?B?MGNkN3hzbzk1ekljOFRZenVGaFBoVy8zQlhzbGg3VjN2TGlJVzlIc0V3SDd2?=
 =?utf-8?B?NFFRQVYvREVZTU9lbXA1L1B3MkIwUGF2UjZXc2J1Y2VyQjZwTmdDT2d1aW1H?=
 =?utf-8?B?WHhwL29vdHZxaTFKWEIwRjZyYTBWbVI2M29vdmFub0ZaVHFqVGNWWkZJNDFN?=
 =?utf-8?B?NE1BcFNrYU52ZjN0b000VFVoVkRjUWM2MVR3UGhVNlJFd3JtL0ZTVDFwcjlI?=
 =?utf-8?B?ZnBGT3FPK0E5c1BtUTFkT21YN3dmSWhtVDRJTEdkTDMxK2NrWkpGUWNSU2Za?=
 =?utf-8?B?UUo3aTV2MUUyRCtCcGtTN1dQUGQxYWFEUCtGYTZjdDNPKytibTRxSG83clBr?=
 =?utf-8?Q?67P29i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:50:35.9400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abf00b4-1a21-428b-859d-08ddca7602f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7580

When vpci fails to initialize an extended capability of device, it
just returns an error and vPCI gets disabled for the whole device.

So, add function to hide extended capability when initialization
fails. And remove the failed extended capability handler from vpci
extended capability list.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
v7->v8 changes:
* s/and force/hopefully forcing/ in vpci_ext_capability_hide().
* Add Roger's Reviewed-by.

v6->v7 changes:
* Change the pointer parameter of vpci_get_previous_ext_cap_register()
  and vpci_ext_capability_hide() to be const.

v5->v6 changes:
* Change to use for loop to compact code of vpci_get_previous_ext_cap_register().
* Rename parameter rm to r in vpci_ext_capability_hide().
* Change comment to describ the case that hide capability of position
  0x100U.

v4->v5 changes:
* Modify the hex digits of PCI_EXT_CAP_NEXT_MASK and PCI_EXT_CAP_NEXT to be low case.
* Rename vpci_ext_capability_mask to vpci_ext_capability_hide.

v3->v4 changes:
* Change definition of PCI_EXT_CAP_NEXT to be "#define PCI_EXT_CAP_NEXT(header)
  (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xFFCU)" to avoid redundancy.
* Modify the commit message.
* Change vpci_ext_capability_mask() to return error instead of using ASSERT.
* Set the capability ID part to be zero when we need to hide the capability of position 0x100U.
* Add check "if ( !offset )" in vpci_ext_capability_mask().

v2->v3 changes:
* Separated from the last version patch "vpci: Hide capability when it fails to initialize".
* Whole implementation changed because last version is wrong.
  This version gets target handler and previous handler from vpci->handlers, then remove the target.
* Note: a case in function vpci_ext_capability_mask() needs to be discussed,
  because it may change the offset of next capability when the offset of target
  capability is 0x100U(the first extended capability), my implementation is just to
  ignore and let hardware to handle the target capability.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
  remove failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/vpci.c    | 88 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_regs.h |  5 ++-
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 9960b11cf2c9..26cda5b3262a 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -165,6 +165,92 @@ static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
     return 0;
 }
 
+static struct vpci_register *vpci_get_previous_ext_cap_register(
+    const struct vpci *vpci, unsigned int offset)
+{
+    unsigned int pos = PCI_CFG_SPACE_SIZE;
+    struct vpci_register *r;
+
+    if ( offset <= PCI_CFG_SPACE_SIZE )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    for ( r = vpci_get_register(vpci, pos, 4); r;
+          r = pos > PCI_CFG_SPACE_SIZE ? vpci_get_register(vpci, pos, 4)
+                                       : NULL )
+    {
+        uint32_t header = (uint32_t)(uintptr_t)r->private;
+
+        ASSERT(header == (uintptr_t)r->private);
+
+        pos = PCI_EXT_CAP_NEXT(header);
+        if ( pos == offset )
+            break;
+    }
+
+    return r;
+}
+
+static int vpci_ext_capability_hide(
+    const struct pci_dev *pdev, unsigned int cap)
+{
+    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
+    struct vpci_register *r, *prev_r;
+    struct vpci *vpci = pdev->vpci;
+    uint32_t header, pre_header;
+
+    if ( offset < PCI_CFG_SPACE_SIZE )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    spin_lock(&vpci->lock);
+    r = vpci_get_register(vpci, offset, 4);
+    if ( !r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    header = (uint32_t)(uintptr_t)r->private;
+    if ( offset == PCI_CFG_SPACE_SIZE )
+    {
+        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
+            r->private = (void *)(uintptr_t)0;
+        else
+            /*
+             * The first extended capability (0x100) can not be removed from
+             * the linked list, so instead mask its capability ID to return 0
+             * hopefully forcing OSes to skip it.
+             */
+            r->private = (void *)(uintptr_t)(header & ~PCI_EXT_CAP_ID(header));
+
+        spin_unlock(&vpci->lock);
+        return 0;
+    }
+
+    prev_r = vpci_get_previous_ext_cap_register(vpci, offset);
+    if ( !prev_r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    pre_header = (uint32_t)(uintptr_t)prev_r->private;
+    pre_header &= ~PCI_EXT_CAP_NEXT_MASK;
+    pre_header |= header & PCI_EXT_CAP_NEXT_MASK;
+    prev_r->private = (void *)(uintptr_t)pre_header;
+
+    list_del(&r->node);
+    spin_unlock(&vpci->lock);
+    xfree(r);
+
+    return 0;
+}
+
 static int vpci_init_capabilities(struct pci_dev *pdev)
 {
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
@@ -206,6 +292,8 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
 
             if ( !is_ext )
                 rc = vpci_capability_hide(pdev, cap);
+            else
+                rc = vpci_ext_capability_hide(pdev, cap);
             if ( rc )
             {
                 printk(XENLOG_ERR "%pd %pp: hide %s cap %u fail rc=%d\n",
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 27b4f44eedf3..3b6963133dbd 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -448,7 +448,10 @@
 /* Extended Capabilities (PCI-X 2.0 and Express) */
 #define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
 #define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
-#define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
+#define PCI_EXT_CAP_NEXT_MASK		0xfff00000U
+/* Bottom two bits of next capability position are reserved. */
+#define PCI_EXT_CAP_NEXT(header) \
+    (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xffcU)
 
 #define PCI_EXT_CAP_ID_ERR	1
 #define PCI_EXT_CAP_ID_VC	2
-- 
2.34.1


