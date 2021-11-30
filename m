Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00F6463D71
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 19:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235422.408437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7cY-00024r-OT; Tue, 30 Nov 2021 18:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235422.408437; Tue, 30 Nov 2021 18:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7cY-00022h-JE; Tue, 30 Nov 2021 18:12:50 +0000
Received: by outflank-mailman (input) for mailman id 235422;
 Tue, 30 Nov 2021 18:12:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JSNa=QR=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1ms7cW-0001Nx-P2
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 18:12:49 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e155ee1-5209-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 19:12:47 +0100 (CET)
Received: from BN6PR16CA0003.namprd16.prod.outlook.com (2603:10b6:404:f5::13)
 by MN2PR02MB6159.namprd02.prod.outlook.com (2603:10b6:208:184::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Tue, 30 Nov
 2021 18:12:42 +0000
Received: from BN1NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::ae) by BN6PR16CA0003.outlook.office365.com
 (2603:10b6:404:f5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24 via Frontend
 Transport; Tue, 30 Nov 2021 18:12:42 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT010.mail.protection.outlook.com (10.13.2.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.20 via Frontend Transport; Tue, 30 Nov 2021 18:12:42 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 30 Nov 2021 18:12:41 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 30 Nov 2021 18:12:41 +0000
Received: from [10.108.8.223] (port=46476 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1ms7cP-00019O-5V; Tue, 30 Nov 2021 18:12:41 +0000
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
X-Inumbo-ID: 1e155ee1-5209-11ec-b941-1df2895da90e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMjMYaa3lYfB01i2g/eCPk5Yifgz4oon0/YkRNWBwQknUPvqfgqAaU3QSByITonjlxP00sf4Pu8COcbmvbHBSX4LEEaS/NRkjWakzL+UJPONDTT0C6871btaGcwOSPygCFGoC2TKAPEFmkkOQgslLw1lSZf6Wm28eh8WoBxQRf6Xuljllb+/fb9FswWsu5NcTzKnIBQ+gWkfry8+ga15zbO20/9WcxTJrRryp7eVvqM95J7G/TqR0yNh08/vVovAAno7mu2UE2/9C+xedBJc5Yhi0Mex6YAPFDBz6QNDr/ThzjhcGh0UNa23+YpfmqJ8th3MYDAuaPd9kXCyyqI9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFvK7IuVRYKoZzH9d/eMklzpLkCZrKFxKUNfK32LjsI=;
 b=eVfi0avWJu62FQzKFKdKuZNfDO7E8yOmA2n7bn5K2WKlMhS9ZCOTTSt7xprZn3r52zaTty/9GWeQVm7S+liQU3FefXXcFcd6YgUu8B+UQetiXtu6yv8a91+ofvoL1jSAtAw9JuOlITxXjbqAEOn14UsrqMXMh5Vz8tuF3T0/zyQaMq9CSICay0zbblG0wadkyKGekLpbPzhhQKe08yvW+CyFVTpzze4JRKf6Q6S5EUZVTxurAFo0s+6c1mlBytUFS0zpYXGDzvMD1gschJVKm7hrg0au3ivf/x7HznnOh8dhq/McJvyStbx6MYWAsIdzbl9NovT5XjlcHHa1y34Xkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFvK7IuVRYKoZzH9d/eMklzpLkCZrKFxKUNfK32LjsI=;
 b=W70IAwqa8UOjWAFZJ0rpH7hCUIe1ntdw/sXsVleUD990FDXQI8qC7xzJ0zEf0selbuT7f4VzTurYimpJCt/GCUR9lXBW3hp4bdmsTKrYnLrRlmwKqqjuHjrxZ2Ne9vI4CDvi5kmbOH0/UFn3Mw5jVYgGOf1zG/SJWaX9rMvGw44=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jbeulich@suse.com>, Ayan Kumar Halder <ayankuma@xilinx.com>,
	<andre.przywara@arm.com>
Subject: [PATCH v2] bitops: Fix incorrect value in comment
Date: Tue, 30 Nov 2021 18:12:38 +0000
Message-ID: <20211130181238.5501-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e5315c2-8b6e-4abe-b343-08d9b42d0091
X-MS-TrafficTypeDiagnostic: MN2PR02MB6159:
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB6159DCD4221EBB806F83B94CB2679@MN2PR02MB6159.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sfZtrMfAD/SLgmgFZBQNjA5VvrfrfpYOnMO/ZO8jG+rLdjRyIfUsIeQt4QyCUmMQuJe7Vkqk1ywIjxo4pGJDe0gN4LfcyD2lAC59Q8BEWsMlBqDIzF00XkYxi427KRBFqR+9gXGgiXL3ahcMI5BtX1oerwQZ2LxfDvYz2h4FlJ9HDENJF+A7bE9Z6D1e2xyD5sRnHyTDjTiwBuo28LCKGPgpfghI10KMmp3Krd5Fj20lyBRMVsTpVobIPYpC0B3NNwsGukUEaMDmwwKaHFj8m+aL6CQrF/nSLrLqFJul/jVoOh48laQcntcNb1RQnCmnOD5AOA4aw0khhdaJV1GvWfBOSjBwoqYnhr9TOC4+E98hJ0A8pEE/lcMNUjFuhmv5ket9m4Hu55KU0Px0N9aYpnh3rgdqpKZNb36Jh6OFY8fs/ZcCGsOlrN4QnIHvlL1bdKAQtgd0CxIOBM8C/hObJJy3nCcwtXL1sCOKf+UlJ8Dy5A7O4D+I9TDNaQdHjqKRXJjQlHlCxBCkz/XyiRkazpV2NEp26sxMVIwk8ZwMPkkDccc4HLtR/LZvNbjjNID7EuIkaMmOjWaZEEAD9AB5K56QWrF4QyRffxwigUJHnNxekoL+H1kIz1cR0R5WPyNtxfUd61ySoRjVYhYK4+5qJCK3AYY9QnmdSMMRTEURDxJASjiNtpZXcVAILtU8BaO2AKbLoLkQNKb/lTc7To8zgiWzsi41Py/CQ+Q29oMQkB4=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(316002)(1076003)(5660300002)(54906003)(356005)(7636003)(8936002)(70206006)(6916009)(83380400001)(8676002)(47076005)(26005)(6666004)(9786002)(2616005)(4326008)(336012)(4744005)(426003)(7696005)(508600001)(36756003)(70586007)(82310400004)(2906002)(36860700001)(186003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 18:12:42.3913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5315c2-8b6e-4abe-b343-08d9b42d0091
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6159

GENMASK(30, 21) should be 0x7fe00000. Fixed this in the comment
in bitops.h.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---
Changelog :-
v2 :- 1. Replaced the word "vector" with "value" in comment.
2. Changed 0x07fe00000 to 0x7fe00000.
3. Updated the commit message to make it meaningful.
(All suggested by Jan Beulich)

 xen/include/xen/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index a64595f68e..dad4b5aa1e 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -5,7 +5,7 @@
 /*
  * Create a contiguous bitmask starting at bit position @l and ending at
  * position @h. For example
- * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
+ * GENMASK(30, 21) gives us the 32bit value 0x7fe00000.
  */
 #define GENMASK(h, l) \
     (((~0UL) << (l)) & (~0UL >> (BITS_PER_LONG - 1 - (h))))
-- 
2.17.1


