Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF00F609E8B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 12:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428806.679330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuMB-0004ux-7b; Mon, 24 Oct 2022 10:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428806.679330; Mon, 24 Oct 2022 10:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuMB-0004rk-4F; Mon, 24 Oct 2022 10:06:55 +0000
Received: by outflank-mailman (input) for mailman id 428806;
 Mon, 24 Oct 2022 10:06:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=smss=2Z=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1omuM9-0004rV-5U
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 10:06:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d5a045-5383-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 12:06:52 +0200 (CEST)
Received: from DU2PR04CA0044.eurprd04.prod.outlook.com (2603:10a6:10:234::19)
 by DB4PR08MB9192.eurprd08.prod.outlook.com (2603:10a6:10:3fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.25; Mon, 24 Oct
 2022 10:06:50 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::88) by DU2PR04CA0044.outlook.office365.com
 (2603:10a6:10:234::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Mon, 24 Oct 2022 10:06:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 24 Oct 2022 10:06:49 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Mon, 24 Oct 2022 10:06:49 +0000
Received: from 35a82b6d175c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 267915AD-22B7-4161-BFFB-EAD1381FCDEE.1; 
 Mon, 24 Oct 2022 10:06:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35a82b6d175c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Oct 2022 10:06:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5521.eurprd08.prod.outlook.com (2603:10a6:208:18a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 10:06:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 10:06:42 +0000
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
X-Inumbo-ID: 94d5a045-5383-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CgAxS4v0WvVsvBUkERKoJpAn8ZMED9QcGuU/fpsEWioRxPaxogI8o9SUyAMief2dAGASrKDUUlqqOPkBUBR+fM/xyXXJoe5PzdBi//lCnGC6SPaydzYcBd/SI31IqhIzHx/tVlOMPRqlUMsDTXW+9cVF9al7xjgqP3i+SBKmauELNAZgFvozVbNb1lWxA9/mEaINY7OjSFlaXYel92+ElqUSc+8V/3qtO1htuSCu+Eh/HiREoi7XRfmbFpji54oVtnKTaIgFL5YEL9AIE6ZQNACy/+qzATiVOouaF+sRLQoFQsWA0ay2XhOZyYiWp7SUb1XNa7gk/4s1ArtP0n4dgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHSOAM9cz3HYxb2meNSJMTfre4ZFZdxUU8qU9e6Rv0w=;
 b=PiaKPolovkdkYNa33uPNvjvlrPrTfWlVgUW3i6B8I85bHKIRCARP8wUss8dBvHRBy/dW5q51wsYti8iUkyrfIFJWFewC3kanMhCJeSRNrD9TEprgVQqpKC2IGW8sWjI4+EQMIeY+xLPvD5eubpZQSn1oNPvlFOCjuyNO7ZMsyMBORd8X7RM9yFOgtYx07EqBQHvpMjKB0Qj8sa7ZPaJ6VKCl4aB5rWl6rYmB/CCIYg5XA0B29GIkcLBr8yvbGmXOhIu83HYchDw14FbwLlxLnQIKhP1yMiWIyhVTpBN0HwXS08r/86A4gHOf3mvkUCBfDPB/yk7vrmuEsFmM00fbbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHSOAM9cz3HYxb2meNSJMTfre4ZFZdxUU8qU9e6Rv0w=;
 b=eSQs/BnILY4CudTfKm/KlySSJN6+D4dl2ZOpXtndWbtk3TXk9FUnE07qBmIzQZQGHNZ40YKjeGNerRQDava5S2BpDuAeIxyVepTrrb8IC7jG3SNW094KIDbzil3DKxeQriBlKRV25Eq4qBiyuo2AN2MXpLRLGpEv5/2s60KrECw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e098678c999f5c35
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxU8rBrQkgQQ3U9UHg2Tc2OhqZHqiq0iiSGVLewuYqPMK3U80By9NVt7QTLQjrY2BZma0o2lFwuvjLGrWTItc2CRBzKKz/qWG62epESGRfYLBlIgX2x+ZP8UzBVMleYXa1Tk2Abrch5w34K0l1Cdzcp4NNDSAlqe/DyRqV8XCe1lR6TtkUOqIS/pNVhxYXHg8vkd7FAuEM7uA/FxyrNdYgVJM+xId7DpTVCNxkKjX93uDOPV3TCYNTT0JJMMI6VKxcE52HfEebT3zO9aKxQ/h187J5nADVZLSK1VSfWjpYmqQdzlJQ1boQynY6jgr20b4Al6B3cn1eiu3KnwG4QQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHSOAM9cz3HYxb2meNSJMTfre4ZFZdxUU8qU9e6Rv0w=;
 b=Y/YswKnTKw19Y7dXiEPPZYqDped1q79G7p0htuI64F0GSQlGj+8hdXPYXCp3aZB71RtqjoslZ8fVd4kwrzKEyvVjp6t1UUDf15FAM3RhBHLGxuVY6LP7XMYZIrnwI5H4qR3LhvQ1gTRwOLUJE6QGz55SJ8agaUAbIlA4P4rKe5xu4BjEH7epurUUiNKC9Syz0jIEoyFz99xKFtBONNn9mE8dzjESdwlTyCg4qBcio0B09wnJ00HJ+kvnNgcIFEkJj+9wyWmYWtBAVIwESPUYbl5yAliS7CqbA9NoQgWK6myIERMLQ5QKhMqTnFS4HTCCE0q36aPa9xqX27AS+IBFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHSOAM9cz3HYxb2meNSJMTfre4ZFZdxUU8qU9e6Rv0w=;
 b=eSQs/BnILY4CudTfKm/KlySSJN6+D4dl2ZOpXtndWbtk3TXk9FUnE07qBmIzQZQGHNZ40YKjeGNerRQDava5S2BpDuAeIxyVepTrrb8IC7jG3SNW094KIDbzil3DKxeQriBlKRV25Eq4qBiyuo2AN2MXpLRLGpEv5/2s60KrECw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN v2] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
Thread-Topic: [XEN v2] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
Thread-Index: AQHY5HCY/1GJrkxfi0yPJz1IUtcgr64dV76A
Date: Mon, 24 Oct 2022 10:06:42 +0000
Message-ID: <AE2C68A9-4276-444C-B227-F079D330EB8A@arm.com>
References: <20221020104146.29841-1-ayankuma@amd.com>
In-Reply-To: <20221020104146.29841-1-ayankuma@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM0PR08MB5521:EE_|DBAEUR03FT025:EE_|DB4PR08MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: 438b77c3-5e7d-4af4-2eff-08dab5a777ba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k3SZiyi2aaWbBCLjepWz1tUUs8wziPTTytGHdBMQ0NN3Ks+7jUDwT3SbApZ1AZIjf5FLXITnKbObGiQpumbnvGEmAzvJGyEpIsR7hu6fumfEY0S4CDkyIKEqWRGvBRZHpYGRlhpVIql29WhLa2YmWA6hiTH8UA+fDgaGozfh7nrjhMQodwHmDIi3YrqMwzTmEghbBHZfwJqCB9h2azYhQrrebg3VsFRlpgtkPn+fznaUPT/PQNteRsp0vHCLMnFwPmoNTgWneuq6OdAyyYeJswG8ikWVKjr4NvAm6j/2DNprLSfvF3w04iUwkS9DlYRO5+lkwkh/Wo+QtEzZIuCNNJ4fGwfQJZNlnFB54+xLqrobPv2Kg7yQyMc8kGoD0XCszggAU6Q+51/6UDiCg+r0dXghSJ7PzND84GAF3a5sRkC5q49WAwl5/OkSC8CIi7Py4iGTjA1Z0ibpc54EJ+fiHrULQIjKVzFpS2hLYXJx5p1UHOnBvwkkeUTS/1Jz7riWAxox8gmhbNrmuwFuWSZKYwMZXjdXzw1yXriXh34frEnVqyxaT9Kju24qvkeroKS2Sr5uqzNJVUMRiTp/l8rXvsZnIoh60VwrfbrRPvspVDhVKGed4ZnPQ5QM/Ap5hRHFu0c+7O0hlTtS9WmYX14IGcgWyhy04s1atZ/I6axatUTNGKshB9yPQkF8rBXn0A+AD9Bl4s4hhXWoy8oTf7fsY+FqdPH+wgr1OREyXg36LP9RFwmts2X9bZjQuzNoiqnm0E+3oNfiV0gZX2O5Rn5axv0xzRyIHZcByxNhwuQLN4c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199015)(33656002)(38070700005)(6916009)(54906003)(36756003)(2906002)(5660300002)(8936002)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(41300700001)(86362001)(76116006)(316002)(6506007)(91956017)(26005)(6512007)(53546011)(83380400001)(186003)(2616005)(38100700002)(71200400001)(6486002)(122000001)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2CFBC18262EFC448A66CA845D7ED81B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5521
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb55d65b-39f9-4b08-4f5d-08dab5a7731f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oC3p/G+rM5d1ZFSUU197KZKxEJCvWD1r3QFm1YWormaSSHDta0QoGxOh32RtEjOB+Jow9HbxrfKYzFEvHD5F5s/YTaFjh5ISvub95Xa5JZ1RAEu9uC8a5KVM+zLwCAxo0PUV5z0b0qgyUodBpM/b887pKzFEU4yycwFncmLz7dhncft6gnOrbYoFj4LPcbXrD5rmZcYmZjZfW+H7TJbW03PpvWu1+BIFvQaAvHOG2SfaAF70gjiKJ+B0eZD5Eu2lI2dEScFqIE/Ivjd50R3TUWiuwnFI3ytVRa2r6SMO//Gl73sTahvmxNkDgtnQJDejKttqpad/6yxU/HxI7Yl5cWHpmlzX6F7g6MtaIKcBaW3raHwUCgj7fSu6VG9u2zP4YA4jVHqG+wzlPgpUgfupc3zR8lPlKRMhkAdh8y0yXMJfEcdzqdAMcPRXlk03XiHGVi/KhQ/SnTrOkLpuCN+RlXQLuGTOFy62a2hrpQV8tthlp0hEPKtM2/L6Vwbpfuwbfbyf3EC702/091TaUike42rjJIXgozkuB4leBQ0Trsp0ZynUne3r1s0he392+v0mX5A9c+AwJXI6X1WUceCh0kZXJG2dHyJ1N6+HUpMf0eOa5Ib0su9smlrf4dIxp11AXSZkZRMXYUaJi9k7AqXNHsn/gqxUet47rzKx1qjfBNWXNowI5GstSXmKRxJkyQ/2FYVK8EMKynDEog6PhoJYQ0Z1heLZH4RaDZyi433fmro=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(2906002)(36756003)(6862004)(47076005)(81166007)(82740400003)(41300700001)(8936002)(33656002)(8676002)(86362001)(54906003)(4326008)(70206006)(70586007)(5660300002)(316002)(336012)(83380400001)(6512007)(6486002)(186003)(2616005)(356005)(82310400005)(40480700001)(36860700001)(26005)(53546011)(107886003)(6506007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 10:06:49.9046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 438b77c3-5e7d-4af4-2eff-08dab5a777ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9192

SGkgQXlhbiwNCg0KPiBPbiAyMCBPY3QgMjAyMiwgYXQgMTE6NDEsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFua3VtYUBhbWQuY29tPiB3cm90ZToNCj4gDQo+IFJlZmVyIEdJQyB2MyBzcGVjaWZpY2F0
aW9uIChBcm0gSUhJIDAwNjlIIElEMDIwOTIyKSwgSUdSUE1PRFIgKHNpbWlsYXIgdG8NCj4gSUdS
T1VQUikgaXMgcmVsZXZhbnQgb25seSB3aGVuIHRoZSBndWVzdHMgcnVuIGluIHNlY3VyZS9ub24t
c2VjdXJlIG1vZGUuDQoNClRoaXMgc2VudGVuY2UgaXMgYSBiaXQgbWlzbGVhZGluZyBhcyBndWVz
dHMgYXJlIGFsd2F5cyBydW5uaW5nIGluIGVpdGhlciBzZWN1cmUgb3Igbm9uLXNlY3VyZS4NCldl
IHNob3VsZCBqdXN0IHNheSB0aGF0IHdlIGRvIG5vdCB3YW50IGd1ZXN0IHRvIGNoYW5nZSB0aGUg
Z3JvdXAgb2YgaW50ZXJydXB0cyBzbyB3ZSBkbyBhcyBpZiBhbGwgZ3Vlc3RzIGFyZSBydW5uaW5n
IGluIG5vbi1zZWN1cmUuDQoNCj4gQXMgWGVuIGRvZXMgbm90IGltcGxlbWVudCBzZWN1cml0eSBl
eHRlbnNpb25zIGZvciBndWVzdHMsIHNvIHRoZSByZWdpc3RlcnMNCj4gYXJlIGVtdWxhdGVkIGFz
IHJlYWQgYXMgemVyby93cml0ZSBpZ25vcmUuDQoNCkkgd291bGQgcmVwaHJhc2UgdGhpcyBhcyDi
gJxYZW4gZG9lcyBzdXBwb3J0IHRvIHJ1biBpbiBzZWN1cmUgbW9kZSBzbyBlbXVsYXRlIGFsbCBy
ZWdpc3RlcnMgYXMgdGhlIGhhcmR3YXJlIGRvZXMgaW4gbm9uLXNlY3VyZS7igJ0NCg0KT24gYSBz
aWRlIG5vdGUsIHRoZSBxdWVzdGlvbiBtaWdodCBjb21lIGF0IHNvbWUgcG9pbnQgaWYgd2Ugc3Vw
cG9ydCB0byBydW4gZnJvbSBzZWN1cmUgbW9kZSBvbiBoYXJkd2FyZSBzdXBwb3J0aW5nIGl0LCBp
dCBjb3VsZCBiZSB0aGF0IGRvbTAgb3IgWGVuIGl0c2VsZiB3b3VsZCBuZWVkIHRvIG1vZGlmeSB0
aG9zZS4NCg0KVGhlIGNvZGUgaXMgb2ssIGp1c3QgdGhlIGNvbW1pdCBtZXNzYWdlIHdvdWxkIG5l
ZWQgYSBiaXQgb2YgcmV3b3JrIEkgdGhpbmsuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW5rdW1hQGFtZC5jb20+DQo+IC0t
LQ0KPiANCj4gT2JzZXJ2ZWQgdGhlIGlzc3VlIHdoaWxlIHJ1bm5pbmcgWmVwaHlyIG9uIFI1Mi4N
Cj4gQWxzbywgZm91bmQgdGhhdCBLVk0gaGFzIHNpbWlsYXIgYmVoYXZpb3VyLg0KPiANCj4gQ2hh
bmdlcyBmcm9tOi0NCj4gdjEgLSBNb3ZlZCB0aGUgZGVmaW5pdGlvbnMgb2YgR0lDRF9JR1JQTU9E
UiwgR0lDRF9JR1JQTU9EUk4gdG8gZ2ljX3YzDQo+IHNwZWNpZmljIGhlYWRlci4NCj4gDQo+IHhl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWNfdjNfZGVmcy5oIHwgMiArKw0KPiB4ZW4vYXJjaC9h
cm0vdmdpYy12My5jICAgICAgICAgICAgICAgICB8IDQgKysrKw0KPiAyIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9naWNfdjNfZGVmcy5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dpY192M19kZWZz
LmgNCj4gaW5kZXggMzRlZDVmODU3ZC4uNzI4ZTI4ZDVlNSAxMDA2NDQNCj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2dpY192M19kZWZzLmgNCj4gKysrIGIveGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2dpY192M19kZWZzLmgNCj4gQEAgLTMwLDYgKzMwLDggQEANCj4gI2RlZmluZSBH
SUNEX0NMUlNQSV9OU1IgICAgICAgICAgICAgICgweDA0OCkNCj4gI2RlZmluZSBHSUNEX1NFVFNQ
SV9TUiAgICAgICAgICAgICAgICgweDA1MCkNCj4gI2RlZmluZSBHSUNEX0NMUlNQSV9TUiAgICAg
ICAgICAgICAgICgweDA1OCkNCj4gKyNkZWZpbmUgR0lDRF9JR1JQTU9EUiAgICAgICAgICAgICAg
ICAoMHhEMDApDQo+ICsjZGVmaW5lIEdJQ0RfSUdSUE1PRFJOICAgICAgICAgICAgICAgKDB4RDdD
KQ0KPiAjZGVmaW5lIEdJQ0RfSVJPVVRFUiAgICAgICAgICAgICAgICAgKDB4NjAwMCkNCj4gI2Rl
ZmluZSBHSUNEX0lST1VURVIzMiAgICAgICAgICAgICAgICgweDYxMDApDQo+ICNkZWZpbmUgR0lD
RF9JUk9VVEVSMTAxOSAgICAgICAgICAgICAoMHg3RkQ4KQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL3ZnaWMtdjMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMNCj4gaW5kZXggN2ZiOTlh
OWZmMi4uMGMyM2Y2ZGY5ZCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMuYw0K
PiArKysgYi94ZW4vYXJjaC9hcm0vdmdpYy12My5jDQo+IEBAIC02ODUsNiArNjg1LDcgQEAgc3Rh
dGljIGludCBfX3ZnaWNfdjNfZGlzdHJfY29tbW9uX21taW9fcmVhZChjb25zdCBjaGFyICpuYW1l
LCBzdHJ1Y3QgdmNwdSAqdiwNCj4gICAgIHN3aXRjaCAoIHJlZyApDQo+ICAgICB7DQo+ICAgICBj
YXNlIFZSQU5HRTMyKEdJQ0RfSUdST1VQUiwgR0lDRF9JR1JPVVBSTik6DQo+ICsgICAgY2FzZSBW
UkFOR0UzMihHSUNEX0lHUlBNT0RSLCBHSUNEX0lHUlBNT0RSTik6DQo+ICAgICAgICAgLyogV2Ug
ZG8gbm90IGltcGxlbWVudCBzZWN1cml0eSBleHRlbnNpb25zIGZvciBndWVzdHMsIHJlYWQgemVy
byAqLw0KPiAgICAgICAgIGlmICggZGFidC5zaXplICE9IERBQlRfV09SRCApIGdvdG8gYmFkX3dp
ZHRoOw0KPiAgICAgICAgIGdvdG8gcmVhZF9hc196ZXJvOw0KPiBAQCAtNzgxLDYgKzc4Miw3IEBA
IHN0YXRpYyBpbnQgX192Z2ljX3YzX2Rpc3RyX2NvbW1vbl9tbWlvX3dyaXRlKGNvbnN0IGNoYXIg
Km5hbWUsIHN0cnVjdCB2Y3B1ICp2LA0KPiAgICAgc3dpdGNoICggcmVnICkNCj4gICAgIHsNCj4g
ICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JR1JPVVBSLCBHSUNEX0lHUk9VUFJOKToNCj4gKyAgICBj
YXNlIFZSQU5HRTMyKEdJQ0RfSUdSUE1PRFIsIEdJQ0RfSUdSUE1PRFJOKToNCj4gICAgICAgICAv
KiBXZSBkbyBub3QgaW1wbGVtZW50IHNlY3VyaXR5IGV4dGVuc2lvbnMgZm9yIGd1ZXN0cywgd3Jp
dGUgaWdub3JlICovDQo+ICAgICAgICAgZ290byB3cml0ZV9pZ25vcmVfMzI7DQo+IA0KPiBAQCAt
MTE5Miw2ICsxMTk0LDcgQEAgc3RhdGljIGludCB2Z2ljX3YzX2Rpc3RyX21taW9fcmVhZChzdHJ1
Y3QgdmNwdSAqdiwgbW1pb19pbmZvX3QgKmluZm8sDQo+ICAgICBjYXNlIFZSQU5HRTMyKEdJQ0Rf
SUNBQ1RJVkVSLCBHSUNEX0lDQUNUSVZFUk4pOg0KPiAgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lQ
UklPUklUWVIsIEdJQ0RfSVBSSU9SSVRZUk4pOg0KPiAgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lD
RkdSLCBHSUNEX0lDRkdSTik6DQo+ICsgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lHUlBNT0RSLCBH
SUNEX0lHUlBNT0RSTik6DQo+ICAgICAgICAgLyoNCj4gICAgICAgICAgKiBBYm92ZSBhbGwgcmVn
aXN0ZXIgYXJlIGNvbW1vbiB3aXRoIEdJQ1IgYW5kIEdJQ0QNCj4gICAgICAgICAgKiBNYW5hZ2Ug
aW4gY29tbW9uDQo+IEBAIC0xMzc5LDYgKzEzODIsNyBAQCBzdGF0aWMgaW50IHZnaWNfdjNfZGlz
dHJfbW1pb193cml0ZShzdHJ1Y3QgdmNwdSAqdiwgbW1pb19pbmZvX3QgKmluZm8sDQo+ICAgICBj
YXNlIFZSQU5HRTMyKEdJQ0RfSUNBQ1RJVkVSLCBHSUNEX0lDQUNUSVZFUk4pOg0KPiAgICAgY2Fz
ZSBWUkFOR0UzMihHSUNEX0lQUklPUklUWVIsIEdJQ0RfSVBSSU9SSVRZUk4pOg0KPiAgICAgY2Fz
ZSBWUkFOR0UzMihHSUNEX0lDRkdSLCBHSUNEX0lDRkdSTik6DQo+ICsgICAgY2FzZSBWUkFOR0Uz
MihHSUNEX0lHUlBNT0RSLCBHSUNEX0lHUlBNT0RSTik6DQo+ICAgICAgICAgLyogQWJvdmUgcmVn
aXN0ZXJzIGFyZSBjb21tb24gd2l0aCBHSUNSIGFuZCBHSUNEDQo+ICAgICAgICAgICogTWFuYWdl
IGluIGNvbW1vbiAqLw0KPiAgICAgICAgIHJldHVybiBfX3ZnaWNfdjNfZGlzdHJfY29tbW9uX21t
aW9fd3JpdGUoInZHSUNEIiwgdiwgaW5mbywNCj4gLS0gDQo+IDIuMTcuMQ0KPiANCg0K

