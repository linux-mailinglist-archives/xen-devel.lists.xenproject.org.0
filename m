Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOg5EhjY3GmcWQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 13:48:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC3E3EB806
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 13:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281099.1564146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCFlu-0001KI-FV; Mon, 13 Apr 2026 11:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281099.1564146; Mon, 13 Apr 2026 11:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCFlu-0001JF-CP; Mon, 13 Apr 2026 11:48:06 +0000
Received: by outflank-mailman (input) for mailman id 1281099;
 Mon, 13 Apr 2026 11:48:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCFls-0001J9-J0
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 11:48:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCFlr-002xu7-Ui
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 13:48:03 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcd7ec-e002-0a2a0a5209dd-0a2a450cd658-26
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 13:48:03 +0200
Received: from [40.107.130.0]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcd7f3-f40c-0a2a450c0019-286b820019a3-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 13:48:03 +0200
Received: from DB9PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:10:1d9::26)
 by PAWPR08MB9568.eurprd08.prod.outlook.com (2603:10a6:102:2f2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:48:00 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::28) by DB9PR02CA0021.outlook.office365.com
 (2603:10a6:10:1d9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 11:48:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17 via
 Frontend Transport; Mon, 13 Apr 2026 11:48:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV4PR08MB11273.eurprd08.prod.outlook.com (2603:10a6:150:2ee::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:46:56 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 11:46:56 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=q9ja0OFGWmfzdZMVempoDKAtq4nXmUEQ/zwAfZ6l6t4KouIJ7fzHb9gsqDRlDxjMWpVjbmuYLQEqhiZXJjyOl5hwaTAICrfS3ee7lFJGONx02H4zhzOXZO7ii52z5SxqE+9x7kXOqu49Ruvzs0dWPxdsMBnbVRNHmcweUYwumq87GJESJIBZkXGTfBkGeTjvw2hGVUE59qSyaJkLnz5RFqix+Z2+bapp036a3KB/atPm1iAKjmdVV3iB9IhRDykcQRodIlOqGmtE7WWgGrXimAHRncScN4F2ub+Zlu+6/DtTPp8Rmlp7DUIUXTqR6H/cDPx2uRia5y1Z1sA6rGg3Dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qx7CM4GUeTJ+yHQCO4Wz5NMdfHnS3Bcg8ShdcYvUV8A=;
 b=ZYSPBzbN6eM3tEZHBmXVSxBtqAq+XVcwautsD2oRkqYIwuGdbJ3BvsVyFRuVAG0vdkpJFP+o/Bp6GUyM8L23zYGCIXCMJ2QsKWgGwwi0DFV0FxKB695g/OKsPDDEX/z297AqKG4xjkKbvnAkKCvcOo3EJ1JdwaUvyvjj8Hp1jPBXZGaT3GNgu+Ygs8qXGLNFYDCz8xUbDZavHiiN4JcCWYOyP8dYeQhb1vO/858gEMq+2HnDdLudsKie7u3WasXlhTU8H9+J3CefMnz6b3VWnC9o0i7/IGDzsYucH9N7DHOWwZ97x9ohpBlgmSxDms455IBNOeySN2ZhE3eZvuiocw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx7CM4GUeTJ+yHQCO4Wz5NMdfHnS3Bcg8ShdcYvUV8A=;
 b=NQDeNJclxd4JwKjO+DWsjxOdDiinN1Kofr4sQPMwRW94Nt4PjDauCSVNBr5VZgPxGVpSOs0tqdW5Cx4viIZrUGRp+Ihn1wJfBRnRDElZ3G+YWJUtPyv5FStiUqmKg6B63+J10dNrAZy2t+2vINRduz1yvyDfQooxHyybAr5FlVw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhYueQRbBS3K/5HUzWHh/SV6jMZWbuopbSpCs6SJ87q2zAEBXRIR7JFnzqhPJT6KZ63pywkjHdH413Qd7K1iopY2miGLfwVnvmMjXan1h2OciJLuyWz32bb3jTPiuBhPPeEmyOb2SgugLkzo4ppKBTAAPuFutPyhTB47f/rzSGFp8rMebGm4oJxv0shHD/4qbqhrL+6jASvig+92HTp4sQJ+Z9aLZtXK37Yz15pvjZKNuj3RdLr+sqbyUviHr0lveNV9x8jDNU/VF/lRVMpHz0HCfDdxNw31fIv4Aj6cpIIs6+hblrqoa3yLMEUS3F+FCagLGyrdDWQuzHyjyKNABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qx7CM4GUeTJ+yHQCO4Wz5NMdfHnS3Bcg8ShdcYvUV8A=;
 b=phi7jQrzWC3rMwmhzSGduCCtugfGfNAqFx+1V3/B4a5Y96hBNi2z7Kd6f8alyIMk/0RlVFO4C3bNguQMFfuMPnUlaIokqB2VDCCGkqXbc+Puw/U/WhOx3pJEsE7bHlQ65gbRCS9X+3NluhBDh4NDPvomuLCMGlIKBK8M/uWsJ+KGphagAww4l6+lHQwTqF5xQlYc2+Q17cSpLNQRg8Mw/Va6OKqdLy0QGZPTyAYRApLoi87g/qMbc8SSifISIivhMeh0xUS/N2rA2MpmsugQpfWCB0KfX80vbhbExAfnOTua+85QTKwRGVInqjq2SRvZG6ArAznweXIhenPT094Jag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx7CM4GUeTJ+yHQCO4Wz5NMdfHnS3Bcg8ShdcYvUV8A=;
 b=NQDeNJclxd4JwKjO+DWsjxOdDiinN1Kofr4sQPMwRW94Nt4PjDauCSVNBr5VZgPxGVpSOs0tqdW5Cx4viIZrUGRp+Ihn1wJfBRnRDElZ3G+YWJUtPyv5FStiUqmKg6B63+J10dNrAZy2t+2vINRduz1yvyDfQooxHyybAr5FlVw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 14/23] xen/arm: vIOMMU: IOMMU device tree node for dom0
Thread-Topic: [PATCH v3 14/23] xen/arm: vIOMMU: IOMMU device tree node for
 dom0
Thread-Index: AQHcyzs6VJb6/zH3nkySmP47A5N2jg==
Date: Mon, 13 Apr 2026 11:46:56 +0000
Message-ID: <C89F2BB4-6E71-4F0B-B458-3AE6E33D462B@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <ad7c5071c7d2424d292d4a2dc863a69c0a4b973c.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <ad7c5071c7d2424d292d4a2dc863a69c0a4b973c.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV4PR08MB11273:EE_|DU6PEPF00009529:EE_|PAWPR08MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: f473b6eb-2d01-4bd8-4930-08de9952835e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 1Xwh0LUigAmK0j30TbeCjkOwNmmoiTd2/P4qbIB3tPJc1PxXL1YpkIG2VJgJ1cA7dtaz22P/uroTRdcqdix/3ehjII0ktNzyJpwoU/7LNV70Si6LRo+mKZJx/R4saOxIB4ghUrGSh0YYk6W+xojzAHGSlsJxJ8TkBc7FCyP1GvB/4soi7BIH6ZJ1CTgdBSzJAvcRPRbcQOqPi935rxS0HTBvsRc9KLCGV7QolRgSIwqDgtXTmVzcJ91W/AOuXEbmQdc93kFspM7AyXZUnCWbR6kWMEchdoC7KHFnlx4l5pefar99LF8Z3FBHKA1lwrgSDb2RcbEQ1x8LKpO6kqiBXwy1a/DNAt071mgKCBC0LzNovMt43+jnd4+KlRPT5Z37XUPXfeBZcOmN5cGLZwIc2QILVWRHPQqSjIe3xYqEIiU4kkhedxEmRifKY/VILIwHHEAR1tRnPCo0lJr+fEh+etDT2LZmrvKba9K+Nb9YzMTysh7CrQW2UpXz8fzlm94yZ4PK3Wg1FJIWvi5uaLP33wW2sFWOAEX2H2naRu3FdFsI6G0BvozvPyc37NZrcAEMRTnTxiqNybc3uN43M4GQ39EG+D6ZKVgvWXIm7RLVYLO5YEEAhUs9vGrXJlKhg/vPbRYbpoeg8Yd9KQdHsMjAoEu8FxKJy/2c/o1cGG0hmWT0cyhZrosc8YfqmRuqO29cvzBoy5PAT4AGGvHnRapP7MUVxtMC43NPGjYMdFgjC1vp0OZsA2f/QWW43yFnVfD8qiZ8GjB5bgudAN9p0DpFrB5MwMf/dyzfE/vzR3L9t1Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0570CF606400454D9C5043272C9A7245@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 KPaTNw5SFGvXpAZboqxB4svRG/Zr/Sod/iIVgzvhgZ7fvEjUjc9t6DTMVLnrPdXwoPiNxQ7B83bsPv+x2ZwYfkdvwcywx3d56LUezh77tlLQJ141hsWzcGpmGcV+MZIH5b9FWLCRu4xYNbKyx1IzyoZbJYJDp3ak68fDCo5OWQWY752XfLV/qFCTZJB7gQ3fYpcXDW3os1pE3L+vOSieWMVWNPM9cTokP6IoczmR76rYC/Kj22+WMq/pDW1bEz0VikFiwZHPglyN41FzAtwavGtUxQofsgcK3AnOIQ/fjSn2PVEYLiwn/5I9LSBC5gmrWeyAW9KCPkFtkkQq6wrqzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR08MB11273
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d54e4d6c-ca9e-40c7-8aa1-08de99525d70
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|14060799003|35042699022|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HavdfncEobghqazmlUB3dCcVBkg2vwig/4ZtR51ceFC8TtwuXCJdhxmg9alWKgtzk6PuQA1GyNXCCeQXKn6042f6oGEfmUSGeE4aSfeQSIFEcbXqjJnt6P6DB2NDf1K0+BC5GIjG6k5jLAJd03ga0xJv9RSmEIDpikhlqxH+Yf/2quL9h6zTksNFxEHas2f5Lw2cqKX7oD4DmqexO/tZhPJFr7VCGzpeTA0pjkrb+0ZcIKO/zFyAZPfC4jkXnDrUAjhn0kHdvWFz7MAAd1DxvBM80aIehX95wHXJ3HcQ2NkuZb+nSHRMBTO26sYHGG35sto7q4N+DRvSWPWGGSdzVsqL+QV56MKL/I3G+0yr8DYGtbVQgAl2weJssxJDSOXhV7wcRTB5ycywXhVyMjsOD6lQTK3CCgYbLpPcPyiJQrNT2c/pKJGZUsndR361U0S/Ag9Eizdplew7eCnasDaBLDf/lXnA8ChMNH8amJiwyXiKHEZNn+nhDc+E3lqBT2/kND1V1tRX9CyTWBacvXhQyIy5E6Va/t0vZ7XsDZBGIl1sRUon066reaQFzOCPQhwLjCS/Wd21/sN1Yu9OOKlCiBjXvDSrxdLvHEzGB5qhKx3DODWg3a5wiXMgWNm7IDJV9C+9pvEY/5fjz288U2c1vx90/XK+pwkJ3/MU08SPMxFDOYm0BVyKwla7SQBGxrTuYWSzQWUdGr8vUEQ3m80m+sRr8qUwEyHlElEJ9L4v/jTEE8AqNkev1Ri1NoOMPdPI6IpW9mucrCcPebHSrVSJbg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(14060799003)(35042699022)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7921uPUzdxEqK+TY6gqH+xya0lla5WoH8Sp7b8EqmeyJOChzO4JG9fTbFkyuPWllxVD9KTBwTM55/U/JqnktJDiWqdP9a9HPeYIrB4dvHXMgCxHRjadZFxmumFcTI8ZYsGGKyGWFIQePwC5Qa+OVhqrRdoVKbX7qWZzMaA8BdHnuEstO4Nb5rwBHDUwGlFCWDVcPT4rNjc5bUstPK/0aPyli7why69usZSiJ+nWgbOG+bVWDtPY2TqjRHQDmNjMFW7JRLnKxdGmjnKDPjK/rEo0TU6VM+sdS6rNWu5e2o+abICdsz+LUBhnVG9ooqpqyxej7qyLXALKZlbxN0RJ0aDQqU2tz0Vjy+ptYGUiFMHoeP88VAa3eldW/SJJ1D4vDHRzknf/RW27xVz0hojxUsCFqFH+bjIJA6zwVUURvq8jRKLvW7JVrtM12dsLVYW4Y
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 11:48:00.2418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f473b6eb-2d01-4bd8-4930-08de9952835e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9568
X-purgate-ID: tlsNG-d25034/1776080883-A4242A3D-DF43C862/0/0
X-purgate-type: clean
X-purgate-size: 1189
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: ABC3E3EB806
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

> On 31 Mar 2026, at 02:52, Milan Djokic <milan_djokic@epam.com> wrote:
>=20
> From: Rahul Singh <rahul.singh@arm.com>
>=20
> XEN will create an IOMMU device tree node in the device tree
> to enable the dom0 to discover the virtual SMMUv3 during dom0 boot.
> IOMMU device tree node will only be created when cmdline option viommu
> is enabled.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
> xen/arch/arm/domain_build.c       | 94 +++++++++++++++++++++++++++++++
> xen/arch/arm/include/asm/viommu.h |  1 +
> 2 files changed, 95 insertions(+)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 30a4f1fd09..54ae3b5033 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1440,6 +1440,95 @@ int __init make_timer_node(const struct kernel_inf=
o *kinfo)
>     return res;
> }
>=20
> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
> +static int make_hwdom_viommu_node(const struct kernel_info *kinfo)

__init ?

The rest looks ok to me, with that fixed:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


