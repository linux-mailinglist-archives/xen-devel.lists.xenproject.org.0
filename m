Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4C49C62EE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 21:54:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834910.1250708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAxtL-0006Zt-Qp; Tue, 12 Nov 2024 20:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834910.1250708; Tue, 12 Nov 2024 20:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAxtL-0006YM-Nw; Tue, 12 Nov 2024 20:53:39 +0000
Received: by outflank-mailman (input) for mailman id 834910;
 Tue, 12 Nov 2024 20:53:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6R0y=SH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tAxtJ-0006YG-VU
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 20:53:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20620.outbound.protection.outlook.com
 [2a01:111:f403:2412::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b9e2061-a138-11ef-a0c7-8be0dac302b0;
 Tue, 12 Nov 2024 21:53:33 +0100 (CET)
Received: from BL1PR13CA0107.namprd13.prod.outlook.com (2603:10b6:208:2b9::22)
 by DS0PR12MB7704.namprd12.prod.outlook.com (2603:10b6:8:138::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 20:53:24 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::94) by BL1PR13CA0107.outlook.office365.com
 (2603:10b6:208:2b9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.14 via Frontend
 Transport; Tue, 12 Nov 2024 20:53:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 20:53:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 14:53:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 14:53:23 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Nov 2024 14:53:22 -0600
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
X-Inumbo-ID: 2b9e2061-a138-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjIwIiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjJiOWUyMDYxLWExMzgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDQ0ODEzLjMyMDUxMywic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybN83OVu3NECRKTklXs4GVlLlcGDrwS2voTvkExbdLLuQys4H/cMNXccwObGo6aaMCqSCdm8Pyoboj7+zSQgs+bMdswn8Tm/6D1s4/HFKDP4yY9qjudThRjWcsuws/QMOQ0+Ko94CBocbnPf4kLrmCHIGcVXXR1XekCj14gmp+i5Xw6OuPAYtK29GXGwt3jdTrArrIEbwnc7ZR3s5REZB4Z5y+9ObfHMcxNIEha8cOMMJEUaVvuLleTjztlfqtLqNdfoT7tNte47aLXpd0LMGFOVXx093jtEpel3odTach9Bj9qkT9sQGCk6xCw0bFLqBvemOc4x5iq0YinIA9KoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TznUirNIgng++pgaNb4AFp4lxySJRj7XVEi88zW4vFA=;
 b=sCGGkkUosXhNzyendSNHMi/6YyOz5nFS3YcSVp2MBZ2QpDMPcN6lWO7dsr7L2VfxRyB05E0hdlGhBDS29j+7Nd9ILsFhhme3HRFKkvIuPGfZZLTkMFOanMQol7QrC8+Tf9npoS7cAxw52Ov3kLMJatKpyjEetLZLBXHf9hRkeev9s/J5gyxGCVxJsHh+/p1c5Wyv/x0ZsgLPJIR5tWLA2m+HVv9u5+rWrsuzDMKMMaO+5/UqF0Fxjp2MTyQVBvdzgu1PsFw3l9vUfBiH6DdoWObtx2kvfH5sMTYVNpbGxCQYU3F6zw2hxqXzJtoEl/KUjY6LMTIUoWXgXi1oPesj4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TznUirNIgng++pgaNb4AFp4lxySJRj7XVEi88zW4vFA=;
 b=We7QIC9UjFXNnbTIcd7ysEzXnEuE3fR4vLHvC3+wp1w56hRZ/OrxyUhoM6KHtJBPZFaLADdgojdFAFTMArKlodPwklS2WCO25+B4h1RWVuFDNtHTbGpp00DBsqwojUGHhNgNCpPH52SGPDZFj/+HMbp0B72BAOjzle5HS8twZPE=
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
Subject: [PATCH v7 0/2] xen: SR-IOV fixes
Date: Tue, 12 Nov 2024 15:53:18 -0500
Message-ID: <20241112205321.186622-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|DS0PR12MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 8536dcc5-edda-4dc6-7263-08dd035c0cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B0DqtXgGnNZi9zf4gDsibbspakhpcbStCl+Jed4P8x5PcsVORIj2Aa3qGLoM?=
 =?us-ascii?Q?367cgPupxfbzryBq1XAR/vowVl9jSlsFBiQUX1CXBBzPdBx8qwben9+H6avc?=
 =?us-ascii?Q?ZiagyteOR3z536Lfd+bnATqgU5Ifm19emoJi/ftsTI3HqW91lRhWkUY0LRLM?=
 =?us-ascii?Q?F3k91oL0hfKVrmQEb31tA+Wf7PEjxdxhpYLl02n0/xg1SR1YCCXL3vIlyakf?=
 =?us-ascii?Q?H9R6SmoyjlN3TLC5qhHsWktDujoe0ew107Tf1BwFV0FzblO/ulwdnPZGfiYi?=
 =?us-ascii?Q?1aOeuoRBdl08eJeRHFfmaceHa1VU/ggwu3QZawRzt1QysTuX1Vhcv58oDpfx?=
 =?us-ascii?Q?nrmiQQELhD5MYv27kYazh9X9cRmn38lTHKiZyyes/9p2tppihubik/MIfgnG?=
 =?us-ascii?Q?2GUJlJxGmxYsisQPK1u5E3srwGzUd++hqO8uM+OUATGdkIxCseLwqwdG+doO?=
 =?us-ascii?Q?l48ZntH0is7fI27wF1kAPf55CLktoaAsgr1DowYd6r0rCLHQfvqPxBDgwoMy?=
 =?us-ascii?Q?Upq9ZsNJznAEPJX+mIWYPyjVPAk5eKZ+U/IozBfGa9lw8D6jwCXRKedaemg4?=
 =?us-ascii?Q?Bj/TY+GNuz1Ej1+IelD/wM4uDgyuWGLS/HfsW84BL31q6uHpnuncwTQsBa2X?=
 =?us-ascii?Q?t5AN1Is7r8d4VDJ6ZkHOkME3uawS3duZmD7CZUqiLHmc6yDELAEPWS4KJTct?=
 =?us-ascii?Q?EVyrSWZsa7kdFrSXfPgAAxSLV7BbVYjA6WxsRYw68eWdasVV5zKWwVivek5h?=
 =?us-ascii?Q?IvdWFbdYgr34OoRtdXgeXBxAoia1Lj/zqfrWUhunKk3bCEOb/1VRcMxKlUky?=
 =?us-ascii?Q?1QlXQC29jhuRYaXsJJEnuvb4pz9ak5QvsZ+Udzw8WX1kvLeF3POHdDEgtL39?=
 =?us-ascii?Q?yKTeJoAyR6z8j6qT+JmT55xn1y/ExP/oyImOiYI1Jlg/oUi+GmjMq3GiBGlT?=
 =?us-ascii?Q?H/dFH5y16dRXWU76zQNCSc8K/zWYU+De2CavF92Cp4XfdFaj92OQQQACIPPx?=
 =?us-ascii?Q?SQ+TWOSZvJfscpoGMTXtakCFjXQRzKoilKU57fwcpDc6+CriGfcKkjjssjWv?=
 =?us-ascii?Q?nF2dExjFySM8eYTn2GNDERDPkqW6toqJhRZV4uubaMBkFa4QrCodQTe/NICW?=
 =?us-ascii?Q?FYGhcL5lz/dvPKHSxeU0fEHPfVeFHSm2eZV5oNUgUAfskCDyM1Hr9Fl4XdYV?=
 =?us-ascii?Q?xthh2C3iEeIPneyJ9KxrThgIO7gH6giCEJ+CrIh09lfI9Vusplk1ZgpFxWEH?=
 =?us-ascii?Q?W0063JG7VZgW4TaMV/tZY5MVthzWiA49OSIrWcyypUQN2e6yr/gW2uQ7IyUF?=
 =?us-ascii?Q?NtvEX+hxBVY1xHlgpQTVb683fz9UB+8TF53+Y2U8wJwbovwFQgRLQbv/LpL2?=
 =?us-ascii?Q?ix/V5rvKv5ZI1jIhNBeZn3GfzZvyrc497uKUngDFFNrgoaF7PQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 20:53:24.1535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8536dcc5-edda-4dc6-7263-08dd035c0cbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7704

Introduce PV<->VF links and fix a regressiong related to a locking
change.

Stewart Hildebrand (2):
  xen/pci: introduce PF<->VF links
  x86/msi: fix locking for SR-IOV devices

 xen/arch/x86/msi.c            | 36 ++++++++-------
 xen/drivers/passthrough/pci.c | 82 +++++++++++++++++++++++++++--------
 xen/include/xen/pci.h         | 15 ++++++-
 3 files changed, 100 insertions(+), 33 deletions(-)


base-commit: 64d2290cf96bbf84bb8606f9bc784166ac610b1c
-- 
2.47.0


