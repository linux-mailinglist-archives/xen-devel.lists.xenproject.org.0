Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8428BBDB00
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 12:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138040.1473823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5iSF-00028h-VT; Mon, 06 Oct 2025 10:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138040.1473823; Mon, 06 Oct 2025 10:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5iSF-00025p-ST; Mon, 06 Oct 2025 10:28:31 +0000
Received: by outflank-mailman (input) for mailman id 1138040;
 Mon, 06 Oct 2025 10:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hel7=4P=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v5iSF-0001qe-4j
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 10:28:31 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 335bf249-a29f-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 12:28:30 +0200 (CEST)
Received: from SJ0PR03CA0047.namprd03.prod.outlook.com (2603:10b6:a03:33e::22)
 by SA5PPFE3F7EF2AE.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 6 Oct
 2025 10:28:20 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::e5) by SJ0PR03CA0047.outlook.office365.com
 (2603:10b6:a03:33e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 10:28:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 10:28:18 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 03:28:17 -0700
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
X-Inumbo-ID: 335bf249-a29f-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yvv71YbjrflPt61bq808CArG9Za1bW8/8dXChAHkzUJX92OFcxFY6u/79QFuOBBAfO1nOXgjIN169C4F8n9IktRC0e705qvGM66qId3rHSHnZY/X/Tyq2QW7s9ys+CUN2+PQSXS7MkIZ7+3n2k5tU0UKJj1iwCwjEocqyj94S8rKfd9lOOSQ4Tt3/GbP7bTN8paTkQl8dULpP7KFU9KxigrVEJoMtXBAupM69jomTyfffZMFbAowKRzgQ6EhPK5huXn5TTuGLv8WpbYX1rYW1kRAaa2WMVoMcKTp0OjOetXtho3uNsjBTMsPQhh4KCG9ni05WuhlAcyv/pFqmJ1F1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsMXiiGH9rBLvTUq/4/suDkB8nbjPOIgBDGiIXrKsHk=;
 b=p9UKVgyqkaa0n5S0/CXrGRFAl2IUmq4wmR8St4I7/siXXcaR1JeN9x8UJCIMUFiaWEy/G6hJNhQ7SCBnkjrL/6TwwS9CPUPDVaq1d+IJSwTDkcSp8edzJg8LZCX3YhnNyhUAjkz30XSygfRKzxsTTPPReJ//oeCsJmkuf22jMdIWAxHzko+ygBC9ND/Ohbrn73HYHthY2JjF9LNbm6AP1MAdtfnSFZclu2xsDsNVLiVNK07MQoCr0sLjJ4ESllZMwQw85ywOLAVm6coEcJCkUr4GcTG5bPZEeZ6xtrqE186ayjc79c1FyOdj6Ic4G1M1YRQFf3SYPU40WVB4KWljXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsMXiiGH9rBLvTUq/4/suDkB8nbjPOIgBDGiIXrKsHk=;
 b=kT4ZJdM/FnBmYfvZ4l4i9hCoDxCoFZyPOoJ5QLK44z6Mler7oQHSMRtCrb4klcx+fYJPWTvbNvsCNq8917Ubg/mj5omt6r1g2geIXSeSbypqOIA5No7pL4+v2UMFAeiPnjOcGdVbwi8pANUMyt8wEeGLuQo2fBEgjpwBGgWlauo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: [XTF PATCH v3 3/3] x86: Poison hypercall page with `int3` rather than `ret`
Date: Mon, 6 Oct 2025 12:25:58 +0200
Message-ID: <20251006102743.3907-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006102743.3907-1-alejandro.garciavallejo@amd.com>
References: <20251006102743.3907-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|SA5PPFE3F7EF2AE:EE_
X-MS-Office365-Filtering-Correlation-Id: a0212e3d-5bfa-4b0c-1871-08de04c31159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXJsM1M5YlcvNTlYazBIdzJKUEFqY0xyOHMzTk9TWGpQbzRrZS9UQ2VzNHRD?=
 =?utf-8?B?ZUFwQ2tzS2pFMU1HVDZDNGdVUE1oSVUzdGVUaGZ5cStSblVJSlNiS2k1SWla?=
 =?utf-8?B?WFpoRTY5c2ZOUWJLU2tpRVFCb2lKUEtXMlFFZmMzUEtwME9MZzFOS0ZyeDRq?=
 =?utf-8?B?cmxhS29XZmVsdWY4L2VYOWF5UTRKbTZjTno2MDZYUmtZZVNuWWw3Q0RMQTlY?=
 =?utf-8?B?RHhzSjBqSEw2Y3U5TXdNT2g1aThOZWxxZGU5RWtTdFMyZnExQndCQWhxSUsr?=
 =?utf-8?B?b1NFL2x1ejlMU2hDZjhoYVljbVB3Y0MreFJVZlFsbjdQMElaa2VDa25JdUp1?=
 =?utf-8?B?NWREdlpEWG5sT1Q4S3J6Zm4xQURTT2lTb29GZldhVnRReTBwc1hPdlFRaVpt?=
 =?utf-8?B?ZWl6L2hXSzRQVmxOM1AvQjFrZDBpNEUxeE5GcCtrUGxRdXg1NW9Td3NBVXVv?=
 =?utf-8?B?SU03TzQzLzZDY05DTEhubTdUMjBPVlZ0eXZwbFl5Njh2Wm14TWVCZ3U2c2lw?=
 =?utf-8?B?bFdZclBaTmEweDFYVGpiT2xzUkN6WEpXclhUT293REIwanEwZElPYVgvQmow?=
 =?utf-8?B?Mi9jZTRreTkwM1R4OFhuTXZjQjFpV1dJbkZ3UkNMcGd1aUJ5ckhKRFR1aEZ1?=
 =?utf-8?B?RXI2WjhScjU2d0VIYk91VWpZOCs5T3JmdktsRHNHTzFWeHowN0tzTEc5WC9y?=
 =?utf-8?B?VHlrNURSV2IvUjFhclo0QitnNFpBRkdxOWhwUFNmWUZRdlRyV1JydGxFbit4?=
 =?utf-8?B?T3diYis1eXVpS0YvTmpBZ3AwVU1BZE1yUXZPSWlpNEo3VDhFbnU0Z2VtWDlr?=
 =?utf-8?B?Y3RqZGhTOE5ROW5tN2RHT1pydGlPeUpaU0ZqaDhSOHhWbmZST1FORUxxT1Bj?=
 =?utf-8?B?OGFyQXZ3aGxlUmxZTmU2MzZkK3hBc09RcndMUmY1allUVm4rVHVMbmtRc3B1?=
 =?utf-8?B?SVdydTJXUlViQXlPelhYaHpYbWdET2ZSWXp1TXIvcitWckFPM052UERWblFv?=
 =?utf-8?B?LzVhZ1N0NVh2dVNGZUxSV1RJWk0vdG1aMnU2U2VjK2QvY0xlOXhUMzlIVFJy?=
 =?utf-8?B?R2p6YlM1T1FRZHlEN1ZTVTJNYW8zUzQwUUJUUmxRT2E4SFp2MG1zZ1ZxR0FT?=
 =?utf-8?B?c2p6QTByTFpRdTZ2VTY3QitpdUZVYlhndVQ5cS9JMmgvQ2ZrT3VITEhjbVFh?=
 =?utf-8?B?L0hyOFhaLzlmZlFNbFI5SUJYbnJRUWh3VVlvaVBwaUZNdngxZkhJSUQ1OWRI?=
 =?utf-8?B?NmtlNHBTT0E3Z3JUd2ZudTg2K3YxWGJxNGVhVEk1c3NVeVN1VWZvdCtZSERV?=
 =?utf-8?B?RXplQ3pSZVRJUSs4a2dJUXN1MHNHZGJsN0JreG9Ya1pTNHpNUVlISDRoajcw?=
 =?utf-8?B?d0V6QnhvQ2YvdEVuRzdHc0k1NFMrZWxmZDg2ZmE2V0FoZDBsNXhucHdXcTYr?=
 =?utf-8?B?Mk43UVRVZkNxS1hNQVR0Ujk3dEpTU2FmMU1FUXhSL1FQb3ZBTlBRZXpsckc1?=
 =?utf-8?B?b1BDRWltVVM2MVh0MWpnb2FZWmwyWk1wSEkxc05nQk91cmYvVUdialVlVjdr?=
 =?utf-8?B?TklXRklVelpnejdFOXBOK1ZEZkh1MzJlSjBySjhITXZONzdnZ1dtZEt2SnZ2?=
 =?utf-8?B?SUZLYkREQ3pVSlJVNHBVTTlOcERlZFdZU09nY0JoWStzekZXQ2pVMVJodzJQ?=
 =?utf-8?B?bHB3ZnQ5Z3VOcmdRVVJPdXF3R3lBTWwrem1NK1VOSlF3VDhLRXdsWlp0QXBm?=
 =?utf-8?B?S1F0MzNudEhncllQVTVWemFmbTRHN044WStUZkYwVS9ha3N2TkJkaU1QVjdH?=
 =?utf-8?B?aFNORjZnUFVZeTVycWN3TW9tTU1VR0R4eVJMQmhNaXJiUEhWVzUyK3F2MzNp?=
 =?utf-8?B?Z0JlOUxKWUw5UktRQW12Mys2QmlNTXlEVFkxeDgxWnZWbHhEc0NZaUtyaU5P?=
 =?utf-8?B?Tkc0K2Vwc1o0RE5JWm9ORGx4cmltenVvQWFndm5EUlFjbDZoR201dXlxTEJr?=
 =?utf-8?B?dEhZb0hGdHJQUFVnVlMwcTJ3ZlYySW90MU5SVjIwUy9WZXM3WVNrcFZ2R2Zt?=
 =?utf-8?B?SVgrei9Vd3F4YW95Y3d4TlROaW5pYkdRdVI3Ti8rdXVXanY4R2t5VEFERUx2?=
 =?utf-8?Q?ipJE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 10:28:18.8052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0212e3d-5bfa-4b0c-1871-08de04c31159
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE3F7EF2AE

Making a hypercall with the hypercall page absent should not
have a happy ending. At best it's just weird, but at worst it might
allow an otherwise failing test to pass.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
`./xtf-runner -a` passes

v3:
  * New patch based on Roger's suggestion
---
 arch/x86/hypercall_page.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/hypercall_page.S b/arch/x86/hypercall_page.S
index cc6ddc2..de0a991 100644
--- a/arch/x86/hypercall_page.S
+++ b/arch/x86/hypercall_page.S
@@ -6,8 +6,8 @@
         .p2align PAGE_SHIFT
 
 GLOBAL(hypercall_page)
-         /* Poisoned with `ret` for safety before hypercalls are set up. */
-        .fill PAGE_SIZE, 1, 0xc3
+         /* Poisoned with `int3` so a stray hypercall is patently clear */
+        .fill PAGE_SIZE, 1, 0xcc
         .type hypercall_page, STT_OBJECT
         .size hypercall_page, PAGE_SIZE
 
-- 
2.43.0


