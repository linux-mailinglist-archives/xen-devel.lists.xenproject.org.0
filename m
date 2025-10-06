Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E000BBDC0A
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 12:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138083.1473854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5ijk-0006M0-5r; Mon, 06 Oct 2025 10:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138083.1473854; Mon, 06 Oct 2025 10:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5ijk-0006K5-2T; Mon, 06 Oct 2025 10:46:36 +0000
Received: by outflank-mailman (input) for mailman id 1138083;
 Mon, 06 Oct 2025 10:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hel7=4P=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v5ijj-0006Io-8w
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 10:46:35 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9022ef8-a2a1-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 12:46:33 +0200 (CEST)
Received: from CH2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:610:50::38)
 by DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 10:46:26 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::91) by CH2PR16CA0028.outlook.office365.com
 (2603:10b6:610:50::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 10:46:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 10:46:25 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 03:46:24 -0700
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
X-Inumbo-ID: b9022ef8-a2a1-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rloARH8sU+T7ylqrM1BMw0zJhZdBM55oyAQLUcHThR5bVwWKsY026g+8GcGD5wzGiTuL33y5WArw8UdHx+hd1M64zobc7T0FgZTZ12VVPQJEh4k+Uq1Cra3x2kPpYpTgMvFFWKdPdiqL3dYHPWmxvwqurn4axSBrwDDzCCX6+2zl2/JxE0uMYJ6ZBxGBlSa1GU5yMYjPTtEpDHP5sr61OU9Il/c8jO84FczGAQIyxCjE2pBprHiBZYq1yBLF6zg2srW50YhL37wK+g3pA5qw+r3Aw4Z5njyQMOeQiM5Ni+xnZ7Kj5w9ASbdNim0WKvzZJvtGeNIV1nzGs+nVY1J6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IcmOquuMdT2tsa4Dun9crV41S9EzCt6xvNtoPns56s=;
 b=FJILVGHh7F2yB64rE8Ps7QXxCNkVdRvy+773EEimozDC8/036Ak/wIf10dWL6ZJyLdpDj3xgqVZahFEaBokK/O8thHjr0t+y9urV4W2AH69BdxXCIOWFFtJiAfwSFOKpHp4U+lRApMLchZJGcswMiszM51iskAMc6FYcall7LyHevWtdAbFoYYtONNgpWRGXqr4pIYucSTlZujqXdkMW2b609DYoPfbmgJvfYD55aE+A0vJNFv3MOxQSc/NRrCkcuEhADu+GAyMLlA4Tx4XLPb4WQXBAmwYT6ZVkk1DjExxLBocwBPAtS9/hwP0en1H9XlUUiAxz8/uxcizvaY/8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IcmOquuMdT2tsa4Dun9crV41S9EzCt6xvNtoPns56s=;
 b=s+YJwx/Knbu4j0OdKOHK1ySWLBzsOTqhWDq1DF//ComLdPEDU9g1TCOhBBivMdpInKHln4ryXLrCD+O2xy2ZSKnv6h9p6CKFwbi8O0CHCtwXsHQexx3pYsUtXP9I0vFLLP7pBnAL32KoOTHEJjpDHDKOmaECvdqRCjk9fs9lHPQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86: Add missing forward declaration and include to hvm/svm/vmcb.h
Date: Mon, 6 Oct 2025 12:46:07 +0200
Message-ID: <20251006104608.12149-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dae01b4-217d-4c30-853b-08de04c59949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fyyrs2oFBFv/GK7dh1dKm7L9JqNVPIiuA7nUm9R+QPnXsH9vNLI/4e6X2a+k?=
 =?us-ascii?Q?zVWRlBOJvhZWC/daywvetRTxqpFMlJlVb810tYRRXFjXVH0MwfXBbkxnaXGC?=
 =?us-ascii?Q?vTt8cb1XrBFdmbqAt3o5EuBNzWoicb4XK+5LUCFYMt6YvZeMeQE7x3IYyMLJ?=
 =?us-ascii?Q?BLnMP2q+hzLxJTWY4YzDD2zHljn3TUhxQ4wo8Rid2Ozi78j1zXZQlSBmzwMI?=
 =?us-ascii?Q?Pi99iIRNaRfTh+ntXmEQUQlB6Ka40Mspfj8v2Y5m0Iq6i3ncHeskdjKrikPq?=
 =?us-ascii?Q?2F7rAI64A3iNp/+5u0GwUMJx1XhNphwocjaEW0NK/k7gpuLuJcNcoMLjuBar?=
 =?us-ascii?Q?MkPR0egOj4NU7QPbFEjq0XUVtSTHcYVgM+wMF8PbLRCp1jPrMn5FdNRkMtwc?=
 =?us-ascii?Q?vtELtsSclhxhy2MVkrK3xC8ebdjvpJNWULC8vaKKFP/Kx9UedCHriUO5osBN?=
 =?us-ascii?Q?+WPXfGaQjf+8d3tgI1/z3NF+AsCsTZNPKKqaZbWDbiSkVjffyVt8HR+5ZgeK?=
 =?us-ascii?Q?EVKpXPDDEdlJFb3gcKidbl7Ur7noAhStKFwmKILGv2fVTKEFUVGM3ktsnKlh?=
 =?us-ascii?Q?DesWfFauA7dMkWx+tQZ948plnoMT1ydnoKOTNruInKJcipkiYioAB3t2ANAz?=
 =?us-ascii?Q?9lCKxOUvZDFcdxC3bdEVNVF8Rf9wJBl2fShmEqg3DWSJEMZZP8JfkwBXUUXf?=
 =?us-ascii?Q?3YANGr6JJwTTMz1/EFNRTkBkoOdsFOluw/nfOmVp+JLl70TwICHPPAmTHU+o?=
 =?us-ascii?Q?LhPM1YxoQptv+iPcQ4L1xbKPUZVyFXsQvm9q0mZ6GBpwLNvtoxdrJpFakAuG?=
 =?us-ascii?Q?FUqk3Pb6sNnN7n3CmwYqOjrXZuMUWD2ScKLFwgdG2can3leUfqsw1SU7sdpF?=
 =?us-ascii?Q?xQXOJJHOGx5/gwu2s6uEC9K99ubhvgj8v3YsHfZCbgMe306B7lh9yjLivIe0?=
 =?us-ascii?Q?7EMgTgMoowxYTe8lj+QYrXCgOe7HHJU/66Hm3VBpNTGrBJ9iXd5ugujeTUeh?=
 =?us-ascii?Q?g76v3iZ3fUsLxY+VD/hq/zajctHowznYeb6rXk5Q9AOK6sh+7uktgdxVAQpS?=
 =?us-ascii?Q?zln++spgWh0dj0XMQgrGJv/QmZcel/Ql2e2yV77yFMTDMzmKu1+tk50IDIwC?=
 =?us-ascii?Q?IJFZO9XYhdOjufGoqbdfVhRaLHB98p3f2Z6Ksjej+OrIt6n1cgw5Hq0bT+lk?=
 =?us-ascii?Q?WbAq+2ocztZoI2VsLl5U8k9lPmcjL9EfAN9glME5Q32GQ0s0ke+LlZGKPDsV?=
 =?us-ascii?Q?ERgRtOdExBoMxBOJdbdMKSi7FXHpeMliTEZKm4Y4dpewAaH3c309k5Ro3XRd?=
 =?us-ascii?Q?izJkUX+cyarNpCSzpWp1boJvMG4H6iX/hhNDHIyrpyqHFV3z5lyHxZ27b3MC?=
 =?us-ascii?Q?YVEnjUybaHN5svm5lbn/Neh+dXebh4oHSOEFTuNZDPAH8vLVrjIVC475iUm2?=
 =?us-ascii?Q?qQ+9FzAI9ZaDcHj05eevYKOEVWKNXlpKg0PfRK9wvdh3GdfidEZ6OY9Cn18H?=
 =?us-ascii?Q?yGYnzjpoFhT8VbynMT3LULbl8qDDUq3nSQp1gwqUgcsSP4lorGRN3qdVHUSE?=
 =?us-ascii?Q?Eu/hgo9uFs1jeCJzrbU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 10:46:25.9440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dae01b4-217d-4c30-853b-08de04c59949
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717

"struct segment_register" requires a prior inclusion of x86_emulate.h,
and it's missing a forward declaration of "struct vcpu" too.

Sort these out so the header can be included by itself.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
This dependency already exists today. I'm just making it explicit.

"segment_register" is weird. It naturally belongs in vmcb.h, but the
emulator makes use of it and must be compilable outside of Xen.

I don't like having vmcb.h depending on the emulator header, but I see
no way of breaking that dependency without breaking the emulator unit
tests.
---
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 28f715e376..7c599a1c39 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -10,6 +10,10 @@
 
 #include <xen/types.h>
 
+#include <asm/x86_emulate.h> /* for "struct segment_register" */
+
+struct vcpu;
+
 /* general 1 intercepts */
 enum GenericIntercept1bits
 {

base-commit: b6fc307b0b00314d4e4460fcf8be2cd9e4ff8652
-- 
2.43.0


