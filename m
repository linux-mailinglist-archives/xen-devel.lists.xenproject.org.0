Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D60A9CF119
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 17:09:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837777.1253672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tByss-0001wI-7N; Fri, 15 Nov 2024 16:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837777.1253672; Fri, 15 Nov 2024 16:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tByss-0001uT-4L; Fri, 15 Nov 2024 16:09:22 +0000
Received: by outflank-mailman (input) for mailman id 837777;
 Fri, 15 Nov 2024 16:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHts=SK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tBysr-0001uN-1s
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 16:09:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2412::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5039800-a36b-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 17:09:14 +0100 (CET)
Received: from SJ0PR05CA0142.namprd05.prod.outlook.com (2603:10b6:a03:33d::27)
 by DS7PR12MB5886.namprd12.prod.outlook.com (2603:10b6:8:79::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.18; Fri, 15 Nov 2024 16:09:09 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::2f) by SJ0PR05CA0142.outlook.office365.com
 (2603:10b6:a03:33d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Fri, 15 Nov 2024 16:09:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 16:09:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 10:09:07 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Nov 2024 10:09:06 -0600
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
X-Inumbo-ID: f5039800-a36b-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjE1IiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImY1MDM5ODAwLWEzNmItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjg2OTU0LjIxMTgxNCwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k49UfSqXC1mwSvtkpaHl/PstKXKw8gxHTj8weTN0ronpp16gNEP20C6OSxfuH/HII5s3E8Xs3uyMbYorm6EIhhJkY1XxF7OCyC8Og5Qref6+4zSP/0MkR4VkvsWgblEGka0aZYjDtl0iOF8/SlzrmlMAYnIA1IRbtTHvU6N6ScRah5vqGmx+r6LncV8z5JFeu6iT5vvhRLaTD0NofO3TSyIsb7u6DSt5tHgCq6dp+syviWAKH4dHi8EFuLCsJHpxt+v84bHvHYUhCICxHBXS4CbV9BjwRa3ZOG7xuFDHX8NBeYgoybQONbNORSuPYlNFMeojyWCGKLoMrIaLdw9eWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEbVazS3AoHbUeTpCOIluv83BoXD0jOYFn6x4Id4meU=;
 b=pUW8ptZrQX9XCOjkes1qWIJgTBaZGr8D+wKLDBYMslw/cQzIUlr6TzKtNMhoAlbRaY/e8vCro19eO0w1xvDwIqGbPnOM4sr4Ns21OmNXFYdwOUVhth/EQV5qroS34HYwV54wdTPHdossip8Zv/R+40kU+Wc/HD9uw6LCFA0RtKu0Jruy/74Y1MS1Fv86rt1LtFTs3acwBlnJ21IG+fumZv32Y/xjyrU4/YaSfH5I2RHqmPnXOYzYFNNL3ikmomruBRxKlSCsEpMCFjRcfKdP786Y2oNDfpWfX6jwtfLg8C6yRhwwMWwCDW/KH9DL+onhhv2ges8IAGM1SpDaLvY+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEbVazS3AoHbUeTpCOIluv83BoXD0jOYFn6x4Id4meU=;
 b=XTpBvkYo2UICs/ZQbOXkKxyYifIfvwB1eLilFkHBeofV4YgqlkvM414V9l3S29aWZg4FHJCNslsq5y0JSNXQDvM1RFzgIYsFBlJSgK0k5EFvaJTrtwslU4pDb3ldpTXZV77iz3KoPIFf2+KgeW2m8guityiZblATnEigML8DvZw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Teddy
 Astie" <teddy.astie@vates.tech>
Subject: [PATCH v8 0/3] xen: SR-IOV fixes
Date: Fri, 15 Nov 2024 11:09:01 -0500
Message-ID: <20241115160905.551224-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|DS7PR12MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: fabe0af5-fbbb-440c-aee5-08dd058fd5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C93wUb5dFtC6fKoCfk1rCbLVQTJBinI1350F8qLbR/E04T8GV/AeV9gzqL1h?=
 =?us-ascii?Q?DvHWmbH3ORIjhmip1Shicajc0ma6p8nSo6fWPLrsQoXLhYyuQOfhhhH9vp+j?=
 =?us-ascii?Q?cccaeVUYGSM5KyyvNeYsFyf0driHJXAYbLHWbAyTFcQlvEedYHMAXbji4MO2?=
 =?us-ascii?Q?riBt3rNicU6a99zxqL5ycQO2SAdDlMxi7cDLE/vWezztp+ebuTTaIrC2zZ7J?=
 =?us-ascii?Q?RJNxm4/PvLTj8KJwGlTNIWUHQktBlS56l6WzEGiSjqvxVGK/uK+XuQhg5xDX?=
 =?us-ascii?Q?dA4thl92tUshxHUzT061FAK1nfkfnqSFtQKhQEfzPBg5U80PjLEhl1SWc0Ex?=
 =?us-ascii?Q?K9ee+1LroohEKfyosjnP826ubbzgRzG+LxJwPYu4GrCon2A8V8TYLn4seyyW?=
 =?us-ascii?Q?lO1khJVsFCatCurU5pX5RcBRguXSOoWYON/GLB7nUdjeg3mfNDxMfH2uRCVM?=
 =?us-ascii?Q?jclnUHfguOiVgsGecoiq0qgz3UGlYPJqcI6ZqOiIshJ1TsWK9fmOzCY4jPFJ?=
 =?us-ascii?Q?9Su+OUbSfBsHmbusn8utteQV9WUeilXC5C21o/UEwu5mC1AqR1PYNG3pg2lq?=
 =?us-ascii?Q?r2A+rkcAK8NHKSrDVgocbYxuyDE0eKaByeABu1EWfFb+YDRUtdSdAtfJS5Kx?=
 =?us-ascii?Q?39Vm1zGk5Rb5IVZrHqxV+k0yrg5LMbgC36j/zXo2tjTChElmZmDoiftzW7VN?=
 =?us-ascii?Q?lUpucRS9jkCJvrqkESgxYNfzbdXX2Ug/2N9J5Sas5XQly/0rPe5PqBr3lSe5?=
 =?us-ascii?Q?Ostxhfm3b99VNocKEcbpT3DUkmTXI1kL67ywsFurtHukvYN1NJZaWhuEaaBF?=
 =?us-ascii?Q?j2kfb5wVmf+IKXVwShVDk32OTZGfPfAANlE4bW4GNuvfgAS5nyq9shA+usKE?=
 =?us-ascii?Q?vx+++KEp9sIR0RSTwuRfXwSt9DTMauN2wTjiu9KVv9kTjMihaceGshinVkKc?=
 =?us-ascii?Q?WIZaQLs2ZrULvKgriRdF/XSWU+rU437tkdK/ekisSXLkZWTJ2Zz5tus4nXXr?=
 =?us-ascii?Q?nr7uu86FdmXTaCbnlKyH8eIv9MGrN55WSubbux45O5eV/KBiWLAEqCoLcvTm?=
 =?us-ascii?Q?ncO8gKhKWb9Pya0py/EPFWQowG4DJ6xKQ+LT2ixCEBHw3LsDFVBpColQnrDf?=
 =?us-ascii?Q?u+fjX4XySweEx2QhoNqmdbQwkb0tuMkZI5kH+ujaH0N3YBKY4oZZ/e73JpQk?=
 =?us-ascii?Q?OsqUZGHXHgCk22LrpBgTSj3rXe+MPKA+Ek/81c8WKK/nyb/L87BYyHImZUqP?=
 =?us-ascii?Q?hrypY7x2J4oRDD4jFxPS+G0GmkUx05MEpECb0I0sRAhCRByeDgl+fWSQ0feG?=
 =?us-ascii?Q?rfnzApvMHu3NME5ys0d3cEsv8ZY0pMHxGB79eQUynOTmQQlsUr3lV1AOBEVM?=
 =?us-ascii?Q?OxMHRW1qalwctHf2BC2SiQueHy4fmcmM19rbFhPG6LVpgGw+PQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 16:09:08.1125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fabe0af5-fbbb-440c-aee5-08dd058fd5d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5886

Introduce PV<->VF links and fix a regressiong related to a locking
change.

Stewart Hildebrand (3):
  xen/pci: introduce PF<->VF links
  x86/msi: fix locking for SR-IOV devices
  xen/pci: remove logic catering to adding VF without PF

 xen/arch/x86/msi.c            | 36 +++++++++-------
 xen/drivers/passthrough/pci.c | 78 +++++++++++++++++++++++++----------
 xen/include/xen/pci.h         | 15 ++++++-
 3 files changed, 92 insertions(+), 37 deletions(-)


base-commit: b1ebb6461a027f07e4a844cae348fbd9cfabe984
-- 
2.47.0


