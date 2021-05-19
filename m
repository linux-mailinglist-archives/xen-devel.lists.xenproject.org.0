Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D74388D61
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 14:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130015.243789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljKrt-0002Hd-Hr; Wed, 19 May 2021 12:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130015.243789; Wed, 19 May 2021 12:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljKrt-0002Eo-Db; Wed, 19 May 2021 12:00:05 +0000
Received: by outflank-mailman (input) for mailman id 130015;
 Wed, 19 May 2021 12:00:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=udgl=KO=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1ljKrs-00029A-Ov
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 12:00:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd7ce512-9f3f-4ab9-a1eb-eb3f50447b5d;
 Wed, 19 May 2021 12:00:02 +0000 (UTC)
Received: from AS8PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:20b:312::9)
 by VI1PR0801MB1744.eurprd08.prod.outlook.com (2603:10a6:800:5c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 11:59:57 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::93) by AS8PR04CA0034.outlook.office365.com
 (2603:10a6:20b:312::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Wed, 19 May 2021 11:59:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 11:59:57 +0000
Received: ("Tessian outbound 6c8a2be3c2e7:v92");
 Wed, 19 May 2021 11:59:57 +0000
Received: from da2f4b75cf98.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D695A54-1C33-42C6-8E94-EFC063A55DA2.1; 
 Wed, 19 May 2021 11:59:46 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da2f4b75cf98.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 11:59:46 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB5488.eurprd08.prod.outlook.com (2603:10a6:803:137::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 11:59:45 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::5ca9:87ed:e959:758a]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::5ca9:87ed:e959:758a%5]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 11:59:45 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0514.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.33 via Frontend Transport; Wed, 19 May 2021 11:59:44 +0000
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
X-Inumbo-ID: cd7ce512-9f3f-4ab9-a1eb-eb3f50447b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaDl1v1cN/lR/FpGQKhQjoH+MGVIwO/8c3sSQjIN32Q=;
 b=D53K7dEv/pW339nV28RUTqxGFbkmEG7dvptmelzirBc06nReZOqeObIsoWW3oZXZ5ZXcOGH7R6xLZ+JzuGOQ77KElDlmaeFylAVZUK2CRH1UUc9S1DhT71xvGjgSQjq+3psOgoRE9jOL1lR42YRl63yXortt0fWk6bkpFu/NQcM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a26856f033cbb8a8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1tdISRJ+Hy2iAazTP2PhEyREngX314YOZLTZZsSwSfu/QFP9Gefc6HbqoF7iEeKw5/TKpegmYw7joo2V/yiXeTgisjPKslZ7Hitg0qSkNodDEfK3Laz5sd/M4s3QLQG5uveiAKg2t3yh7A2LlRs3/CQxZhY3f6TAuasLEe42KhWgoA5wZhWRTwf8occ6+Btv2eiX29NjNWAAxz3unI7qUIP7aXcvJWPPy6bxMgPAoBkwt9Jt+YS89oefXT55fG4WPZkZOZzcedNDXEyIA/fom0iLA01McL4MrYx5oxUj3vEB88VhyV7yVlzk0CrwoJxapRPqIxOXYOVTG6J4coVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaDl1v1cN/lR/FpGQKhQjoH+MGVIwO/8c3sSQjIN32Q=;
 b=SY9oddkX4eYr6QT7mvnDBV/3QbKPgOiZyLIa+pPMR5FBZr8U27Kxmu5pvX22Cep+8JXtjNk9C9YhZqNDv3+dpbI/febMXUntw9wM5qkZenzNsBbXZBoJR4sMgeOHWEiV1DBXIIhBALkOxHEiVc8KdElhy4tvSrzSgp9nnDdeLpyXqbLen4hcgx7lO/pcyOrZJ3oB5FDlfC7QTv/3ZzbuaqweiJ3TNSzXqxPHYtMsN9uuVJPKqUX4Uf5NoWNxTtiOWUNvKfD9UbUEICyEiZmeanKChmQnmCOkE/fV66suHaqxFXSrNSNxiUycs+n9NjxmOQE3T9YiXs+U37mLLufAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaDl1v1cN/lR/FpGQKhQjoH+MGVIwO/8c3sSQjIN32Q=;
 b=D53K7dEv/pW339nV28RUTqxGFbkmEG7dvptmelzirBc06nReZOqeObIsoWW3oZXZ5ZXcOGH7R6xLZ+JzuGOQ77KElDlmaeFylAVZUK2CRH1UUc9S1DhT71xvGjgSQjq+3psOgoRE9jOL1lR42YRl63yXortt0fWk6bkpFu/NQcM=
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: Deploy XEN Project
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <4468222a-ac0b-7544-351d-286231a6bc9c@gmail.com>
Date: Wed, 19 May 2021 12:59:38 +0100
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B331F1E-2177-427A-A531-FF8566CB7303@arm.com>
References: <4468222a-ac0b-7544-351d-286231a6bc9c@gmail.com>
To: Technologyrss Mail <technologyrss.mail@gmail.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0514.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::21) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7297e538-c834-4bc5-3020-08d91abd9f3c
X-MS-TrafficTypeDiagnostic: VI1PR08MB5488:|VI1PR0801MB1744:
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1744732A51ADABF55B82973CE42B9@VI1PR0801MB1744.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dXPEOZsoWcpD1SoS/8HJ/q2xqxCJSvTZj8tNzPZnNCaRiNIIQ0LV+YLOXixae5IQSKd9+9L88m7vM9J26cbiI8co5FqU6NFnLqoq/ZE55HXlmXuFVpenwPIJjc5sSs0KxLCAp9vHTLgyqMXtxRYTr/7k/sUdRhSDpcu+uQpiHNrJGH+2PM+vdOET3dlhEyn5SJf1ScrbjnRh/2Hkv5dPcpRm4dX/C88v+r8Jw/BmjGJ/5atzI95AZbeoXvdNhxMAOxfsXJjnFACFRUj4CoFcbv0dgXFwI7brGIm6Deg0243pFkDU6auni9Xt5xDQqsJn7TD+dFfYUUJ1sYBDAZ8QMt/LX2336k/AOr14PxQkIOJS5hIdVCWh1TaRkVksdBEvPaJZYsJnFm5/eamlkYqKTEmbfEekvHEh4vlwnOABufW7tbtVSOVVi2ChfIeWNz20louXA5oBvSF05oHe5S0nfd7Ksuwq2g05mjkbDCcB1f08RV8nawKgci5eIl6xNZVUFl0x6n0ctpgLRcJKoXtKH4UbfHCGhWICBe0XQWxXmDsb641h+I+7oIxw//TBamvNVtyurTY+kdOGgGMTblQMz7JEspBhqgXnTTK8zPExO3LuzrWoo0wsgYKHd0UY/DqRrbsD6Mo4ErvyAkULJbT7WRsAdzMcK0tvviSZSh33ON9mSIk0gxlC2zSjC1tYop7zkryRfWBmU+LE+2UxKYeaekKIT4KzUTAJFbYnBMWRiL/L0Yc9qMmVOQALKXUSzsfNT5bKQb3zKZdt/55R1b04Mg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(15974865002)(2616005)(8676002)(956004)(6916009)(38100700002)(6512007)(52116002)(5660300002)(44832011)(66476007)(83380400001)(36756003)(26005)(6506007)(6486002)(316002)(86362001)(16526019)(33656002)(66556008)(2906002)(966005)(4326008)(4744005)(66946007)(8936002)(6666004)(3480700007)(38350700002)(186003)(53546011)(478600001)(7116003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?n5FPsSNRiHFjDYeyDvSJzTkmU4g+72ao8V8A8CoxPYEa8+v7ik600NnPBp2L?=
 =?us-ascii?Q?x0OTnX6pleq5BAASRVw61Z1Q3coH9AtDpJbNFQkq5b00Qxfec/5SXc2d55HX?=
 =?us-ascii?Q?lUPOESm/v4j+vUb1C2DlJoyjBGxSCtoKREDt5wQ1rFDus4pJdA1LHCzL8llD?=
 =?us-ascii?Q?x/E/AsQ4PpBV76VPT9Dj/lUfMG0ykB47IdSstoSF6uLUPdrfzISvP+h1t6W6?=
 =?us-ascii?Q?QHPmP5dh/a2QGNnFkC47P96cjEp+9Cji3i9RHzR5wiuLsmsHV1KIttJQYdwK?=
 =?us-ascii?Q?RIexzEVJPLV7XW0utLvfxbByg4ZpXBf1o36fGLZjlRhb8g/Mvx9gZpRCs/XF?=
 =?us-ascii?Q?/D4s8cSGrlPInXOmsFRcRzRcp6Z45fxsm5mWIPRjKYdNa/apD7qRiKmkrOQ/?=
 =?us-ascii?Q?rZiSLbSm/97IcEetsvCerOU2DQA5SLXlaqxsMTopiiI/sAR5gisxDuYjYy48?=
 =?us-ascii?Q?920g6V4pzmPh++/I7FldSgRAp5D3YTXHezpecQuoAZjJxr/YlyxTNQB6PZ2Q?=
 =?us-ascii?Q?NGXhSxGLmO1QV8aFsGXTE8NjvoWbiMH9Y+KQDcqxvtWaytN2Um9JqdK6e2Xg?=
 =?us-ascii?Q?HMmUD1xnq8aUo2MgfkYagnuUrNJ3wWuIuBP2QwHWQTt0UTx8/mmrg8wUdwA6?=
 =?us-ascii?Q?kWvYmOgQZ9+qm5nK7D3X2BOsN1KdxwGfo9xvkN/pK6FyDtdyA4SF6ZJ03gLy?=
 =?us-ascii?Q?Tu01tzGpV8j0waDXyZspT6ddRgRHF6QixgFeKjtSGnxzTC6BEYfNPO852DS+?=
 =?us-ascii?Q?4xa+4r16jx9zFMcniDHr/spy/YCYtGrD3JLtBGyqCcGn4PAHLHApguvyAvpm?=
 =?us-ascii?Q?v7BlODad3PBr2HRgCtW31L6be/6mV5aszhr3wicWYega402FU4we0nv85U/h?=
 =?us-ascii?Q?Cen0b7h+susKq5zXodwfUsxbZ2KzlICZn5oTPPLoShUWvKC8nWtfiOphZIis?=
 =?us-ascii?Q?F9aip2vqCgSCkfZvfyKbknLy2A5ss9CAy3USUG5psZ9TM6/n+XPL5Beng4pI?=
 =?us-ascii?Q?iwy+K4CdHPMm93c1EMTb+xlqj7igI71DQ+73AP71rIe0vEwRB57lLXMkPoVA?=
 =?us-ascii?Q?jJIJjYZVqzWqCGbOO/kOswnaLxpC6Bvh8mZx6iIKdLl+2v3RYhSq6r8Gd17N?=
 =?us-ascii?Q?n51fWBdN7bmNfMm9AbgIsv/89QaHbsJF1JbjXljovcr9vGHIPQs+Di2EuI6U?=
 =?us-ascii?Q?FVOiufr6GFCgv0AwT9RIYzDQJ4zM8Fy8h/ys6LY0GDK1D6/Xm9nDbKY1hIMH?=
 =?us-ascii?Q?+XfvKb4ysbXrU4Cxy9X3zHnfwtkI6RMVeHtUDj/9arfC6yXErnawGzJolPih?=
 =?us-ascii?Q?ZylvFF0dxY4t+Ywiaheh65j1?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5488
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71fcf4ae-c58d-41f8-0768-08d91abd97cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Prk9K+wAwsVUyEcerNUmUkvE50z5W+UGC1Cjb+/Lgz/L1SLySZKviSnnbnjBPJQJ8TRkxhi85yV82RZqAHCnbIx3WL+SgNdKKDfshOuDa3Uxc8Bv8lC0ymqyoQ3wNJfeAst7DeWO9ddhKkPprxfHgbEeRX5sP9DeCUBX5cmld4VXC2Wr7HjnFAXfB60+2z9yiY3fOCE9TsLZXJCP3ofPqbKRd+RqnIo59OVP4XqGZy1YPoSDCX+HwHsBAPIimKgq3BIJur5qKNOZE2fiiuoJ+PCGVeNLUygqiTMFoWW/4IdbsRMxTw69JhgKTS+m20ds6LzvbKQNMmRZ5gbsk8r5U2rbHM4S9RLJ9HjLDtGLtJOtfZLExtQ79mLq2/3/s0qYQTB3gObxvvcDEjGGrXqiccim6G3hFH4qFA94sUXiSBLRdD+XdWTy20EdPimGQzcKo0srqPfRrGlh8cSkQ5ttOP6+J4XfqDoNcnOXSuKvNEXoomvmHykAc80WCKHLY18VXyKOeJVl/JE1sNMivJuk2PLUENWtZ1cGeAhEJmw4Sp6X8RN4oAWEyTqARjWWhS/Pb7ON1I0uCw3JnxcgbPaIQk2AWFtwx2btGXD2uAdENxvkQQEAx4NcH+oHU76wdUy7wzz7bCJ2vWoNzvn5Mlc1Szab3QBW9yS4BQo1zDystdOICAJU+sapCuItXR4hqSVzUdcbSE1dAmCBbrCNo1Uix2ufR0JKQmG6qOY1p/Mw0Q4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(36840700001)(46966006)(44832011)(82740400003)(4744005)(81166007)(3480700007)(53546011)(356005)(4326008)(16526019)(5660300002)(33656002)(6666004)(6862004)(86362001)(8936002)(186003)(6486002)(8676002)(2616005)(956004)(6506007)(6512007)(83380400001)(478600001)(316002)(70586007)(70206006)(47076005)(7116003)(15974865002)(36860700001)(36756003)(26005)(2906002)(82310400003)(336012)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 11:59:57.1619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7297e538-c834-4bc5-3020-08d91abd9f3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1744



> On 19 May 2021, at 06:59, Technologyrss Mail <technologyrss.mail@gmail.co=
m> wrote:
>=20
> Hi,
>=20
> I am new user for DEV XEN project on my Centos server. Please guide me ho=
w to install & deploy XEN project on centos 7?=20
>=20

Hi,

I think you might write to xen-users@, here the mailing lists for Xen https=
://xenproject.org/help/mailing-list

Cheers,
Luca

>=20
>=20
> ---
>=20
> Thanks & Regards.
>=20
> Support Admin
>=20
> Facebook | Twitter | Website
>=20
> 116/1 West Malibagh, D. I. T Road
>=20
> Dhaka-1217, Bangladesh
>=20
> Mob : +088 01716915504
>=20
> Email : support.admin@technologyrss.com
>=20
> Web : www.technologyrss.com
>=20


