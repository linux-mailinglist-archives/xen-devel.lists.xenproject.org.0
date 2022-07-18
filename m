Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB247577BF7
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 08:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369265.600587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDKfN-00028m-FE; Mon, 18 Jul 2022 06:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369265.600587; Mon, 18 Jul 2022 06:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDKfN-00025c-Bz; Mon, 18 Jul 2022 06:55:41 +0000
Received: by outflank-mailman (input) for mailman id 369265;
 Mon, 18 Jul 2022 06:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrJR=XX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oDKfL-00025W-RI
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 06:55:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a14f89f7-0666-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 08:55:38 +0200 (CEST)
Received: from AM6PR0202CA0055.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::32) by VE1PR08MB4703.eurprd08.prod.outlook.com
 (2603:10a6:802:b1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 06:55:34 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::36) by AM6PR0202CA0055.outlook.office365.com
 (2603:10a6:20b:3a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Mon, 18 Jul 2022 06:55:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 06:55:33 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 18 Jul 2022 06:55:33 +0000
Received: from 7ee5ca051378.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CDB0368-7D53-41C0-9BC0-EB56FB4B988F.1; 
 Mon, 18 Jul 2022 06:55:23 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7ee5ca051378.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jul 2022 06:55:23 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR08MB4032.eurprd08.prod.outlook.com (2603:10a6:803:e2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Mon, 18 Jul
 2022 06:55:15 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0%8]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 06:55:15 +0000
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
X-Inumbo-ID: a14f89f7-0666-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hywb9ODP8k3Wy/wWyZV6lsDjAeiCjUEQiO6GsjySDWvK4h3HgGI3j12ag8WUu4AYwZJa/yFQs7ETVoJ2INPvzgN1mlAxTUuWiHyNKgfy6qd4tCBbjhvMKzqSB1NUA1O6+ElBJHufbJmlTSmrMM79HxIdIHcpLdaMFGF+ITvutmeDnxrcWHZzgfjo4KMnT2jyko8zPbAlaqVqRBy29NU9rJLw+D9SIHGIkWxIQ9+jby2hVGA2MnK/LHLluW+72uDcyFIfV505fesC8nn6qib5U3CFmErOByQ1AIlirdou3LzXU+bOEuHKu07NbEgKWT/awTgMvsf0d44QvXfkowaoog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c29vz3kTNv/RXNVhzO6kc8mAWheac5OoKcFAF1JWE4g=;
 b=GzlPZ/Df4CZ4074BpDFHwLInKvbDus2505VBvj5t1u63+SF0fTzH/2STpTrY5UblqVSutu/QwroSofEX4RM371TXN/fYft31Q9LNR+kQPJzkYSnSkID8mY/KK6swUTkNzFShAFpCi4JGFyyGHpsWGVbiWuHm0OYEF6kK/GZjJChK6l02+uTsKEzsGIwBZmTN2clnd6zH7h6m9gV/M1bDNn5Vlbf3qkqfioVQzjPg+saDHWpHca2i+TH35U4vzlMpoZJIrBJZ60mOmP3ubejDr2z815jyvnhPFiweS3VdLFjOLBHan9y3+uDngop3eGmcrJsIyov6VQFOqrmNxArn0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c29vz3kTNv/RXNVhzO6kc8mAWheac5OoKcFAF1JWE4g=;
 b=zXEx6RftfuNzpjYO8w2ruzmNlw+/4VrN3E9GeHk3EqjcmO3fkOLNVyT7Or/AEbWLfmnUDswAn9ipQz3kdYETlv2D7Y0mILvZbia5bwmxXEH2mY+5ffD3lZQ/negS2WFhIUSZ648ZZ+gqyP68qZ0LNibHf3JBC6yhQdkaCSAtWws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyeF6tzaU65xy4rDjhweaZGgsPn2mus1A9DragFmecYzVlYV0AmDCpR5ZwOgEk9kBn/e/BHJ5mRYN2wQoSdxdxDVwIiUTC6V/6FVW1xn7OsOOPGfriChOzdD/Qkr3C8bh07WsaaMKbt1OXhTiVdWP0UDRscUhKtGReYoI6k7U5XeNpxg9xsti/RdM8RAowP8pDUhf5Byye46FImKrqfY5Run/GJBEt/3DPO//lypwJgGlANBnQ4suQAEXeSUEez+wtLwVqFoYBDbm7qZgQagZmoK1CA21mFrhEDy1NjLUhguSNS0iRP3ED8HLYgSErzM6sVV6hirr4P/6ukUIsJ2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c29vz3kTNv/RXNVhzO6kc8mAWheac5OoKcFAF1JWE4g=;
 b=VN5shFLLgyCmZZJ480sIM2xxSwcOgPz9O60MjpqLmKO2mVS+1t0V7QAx5ZCWW0SGtB/StG2dMVRKgGewgouA8s7vief0ttQViJjHJUkDfCb4wKH6iyX6jN1/dmZp6La9Vv0kOjS0eG8hA6CS7KtLqEC/HJvSTgg9QMENpU7jiWWKizHJ1y1zPQWLc7Mzo2XykP7mMBlHeN1LaNVHvqqBc+8WXVC+/k+721mt0zTmicKJ72wfbvRrUPHioEdEGb2OgPlrx9HyQ9lXCwBdHC/AvKnCk+D/BXYm2hVKnwPvoIE5+pkbUaYbqO5EYjaY8ApOXyWlDAND4C928ynIFjI4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c29vz3kTNv/RXNVhzO6kc8mAWheac5OoKcFAF1JWE4g=;
 b=zXEx6RftfuNzpjYO8w2ruzmNlw+/4VrN3E9GeHk3EqjcmO3fkOLNVyT7Or/AEbWLfmnUDswAn9ipQz3kdYETlv2D7Y0mILvZbia5bwmxXEH2mY+5ffD3lZQ/negS2WFhIUSZ648ZZ+gqyP68qZ0LNibHf3JBC6yhQdkaCSAtWws=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 9/9] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v8 9/9] xen: retrieve reserved pages on populate_physmap
Thread-Index: AQHYkeNFlB68JC6RfEmkKZyT8Sz16q10c0gAgA9MCTA=
Date: Mon, 18 Jul 2022 06:55:15 +0000
Message-ID:
 <DU2PR08MB7325F71DB7A4CBFDA1423246F78C9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
 <20220707092244.485936-10-Penny.Zheng@arm.com>
 <9697f641-d660-a346-3baf-18bc8ffab717@suse.com>
In-Reply-To: <9697f641-d660-a346-3baf-18bc8ffab717@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A11586945C03FD42B27CA98E068C1C7C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e6edcf61-e403-4eba-f093-08da688a830c
x-ms-traffictypediagnostic:
	VI1PR08MB4032:EE_|VE1EUR03FT055:EE_|VE1PR08MB4703:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j3EBDorFCeInXf1+hYaDaxjvnGi1+aQkPWf977KX+qdweECzVoUs0TS8PZtVOGNwcuIIdoe8wIf1Rt45A07OZB1w+cQQ9IsSNp7vONTDkCYp62z9QB40OYuWUpBTR8e/FvtDH4uINjewXnJ1wuubBWhJZZi6n7SjuPJ5LllPXSdSb28OAHym6p7n/XDxVmxWApnLLgolC21tq3gPbr3pAe8g75+WjJ52xSYeLc8WU9wRniaWmXnTyB7RvPiAPf4avlnUwaCR1PjjuidgXoYyZgCzJU6lreHQB61qa1VzCmw96rEvde2HYJ2YQZwohNYLCsETrGN3MT4DGzsQBzUezdtzhyhfiIEr9znLP+XhMmOumVmsa7BD+Yi6Q2tsrNBNcrjuQNJMAwrU5KB41UDKfXgeM1W9AfuMSvjwvETW/al0r30C5uexRAa1HwclJZg2agAIe4KylsBkpTAbme1TN1fo0foxiArU9vi93p6PggH+xU67vyqBmqjEZxEWCGwPoxv6u1cBEM5ZmbdjIV3T0TQKyULnH0FNG2c6zBCqIyeGfq2eCniArQzT+6bSabbMDw2sySx8UeAqV3HCEKvx5jNHYp9sAN7qfzcF6wQL2Cou/yvBq/oefQYP345QXUfh/ZY2fVaeaKhb1YlKx+5aBc6fyxYLxQa9VN5n2lP7sgEqFj3WYwadDRtOQwpkFlBoajz9pCClNADNn0JJwYNUg0BN3D33E/PSoLhLQmRSRmNUApVOae84vMnavjdkza6hczlRLSi51bHXASnpt0l3xDt0oG7+7i8o7UcpkZt4hrhB6LwEe1SnmaU+Jas1DzH4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39850400004)(366004)(396003)(8936002)(33656002)(52536014)(38100700002)(38070700005)(66556008)(4326008)(64756008)(66446008)(66476007)(8676002)(66946007)(76116006)(316002)(6916009)(54906003)(53546011)(7696005)(6506007)(26005)(83380400001)(55016003)(41300700001)(9686003)(186003)(122000001)(71200400001)(5660300002)(86362001)(478600001)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4032
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d6720f69-0b00-4f68-24af-08da688a77d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yavoToxkv8Ac3oUWq1eV/FqnxvCHjnWCo5XUPgoXfcUvDvX8QslmriZHl+sn2QxbUOFaYjmnQAiOjsxIc6/Yn5jv5emZjVR9nVc/rOPLQND4AmXfBqxP+zBrBed5vapheMcmJ9lilJ/H9kzLceh8k0rNHj/0Cc6fWGNPrNpMLCfp9ahLBMc/JLmjjGt1TI62t5LNzT3GbTGqk1W3WJjIBob2R2eHj4znAzHeJ0k3s/09WWD/OywEkBnX9GztvzV9qikTT8YCaQqoDRFdJULD01zWgahgEyVupXwpsYJxnnNn3o6CSAmP/u9AlrmkBIBMLf6MtH5cVi8oyb0hejwmLxD51VBY/8OB7Fz231OT4S03YG+0rQbaTDvm3gdbla44Qoqoa4wOmCcZXORHdtQILoNs6mOjo3WU8sDxaXN7O91VjztXpkcrZkInazcGFzy9aO4ZvuLj6Z2QNQ7oh/q1EvkiVtwOpfZEEfNpUQg01QiMYmX8zaOTVtzBJbUiDDNu8c2Wf/dhAqge9TUlqk9XMdneXDd3yrYCPgAckCF0Mt/x5XF+DyV3MhYzmYqAljiL76/cpjQWrhKdNnV8Kxo1aeKQVt2IivQSJmn04iTW9PfLINznBW/SD9TwFXin/jpQ8mWpM56t1wLqojXGvXA4ueaB8neIBb4DhDO5OzflEvz/Q2gneUEUNDa6cXTpUf+C+aMOwFLWkImn8LcZtmwpUCBsGeHjyMkDrFsP0to1fLeg1NzfeViXPBGkwyCW+Qq+15tDG6XXgC7ifgFqExlRfRPGi8riVNnWqxKcsUC2qb4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39850400004)(46966006)(36840700001)(336012)(47076005)(5660300002)(186003)(86362001)(82310400005)(52536014)(54906003)(36860700001)(8936002)(356005)(83380400001)(82740400003)(6862004)(81166007)(70206006)(8676002)(4326008)(2906002)(33656002)(7696005)(26005)(41300700001)(478600001)(6506007)(40480700001)(53546011)(316002)(55016003)(9686003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 06:55:33.8377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6edcf61-e403-4eba-f093-08da688a830c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4703

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBGcmlkYXksIEp1bHkgOCwgMjAyMiA5OjA2
IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IFdlaSBD
aGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47DQo+
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggOS85XSB4ZW46IHJl
dHJpZXZlIHJlc2VydmVkIHBhZ2VzIG9uDQo+IHBvcHVsYXRlX3BoeXNtYXANCj4gDQo+IE9uIDA3
LjA3LjIwMjIgMTE6MjIsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9jb21tb24v
bWVtb3J5LmMNCj4gPiArKysgYi94ZW4vY29tbW9uL21lbW9yeS5jDQo+ID4gQEAgLTI0NSw2ICsy
NDUsMjkgQEAgc3RhdGljIHZvaWQgcG9wdWxhdGVfcGh5c21hcChzdHJ1Y3QgbWVtb3BfYXJncw0K
PiA+ICphKQ0KPiA+DQo+ID4gICAgICAgICAgICAgICAgICBtZm4gPSBfbWZuKGdwZm4pOw0KPiA+
ICAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICAgICAgIGVsc2UgaWYgKCBpc19kb21haW5fdXNp
bmdfc3RhdGljbWVtKGQpICkNCj4gPiArICAgICAgICAgICAgew0KPiA+ICsgICAgICAgICAgICAg
ICAgLyoNCj4gPiArICAgICAgICAgICAgICAgICAqIE5vIGVhc3kgd2F5IHRvIGd1YXJhbnRlZSB0
aGUgcmV0cmlldmVkIHBhZ2VzIGFyZSBjb250aWd1b3VzLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICogc28gZm9yYmlkIG5vbi16ZXJvLW9yZGVyIHJlcXVlc3RzIGhlcmUuDQo+ID4gKyAgICAgICAg
ICAgICAgICAgKi8NCj4gPiArICAgICAgICAgICAgICAgIGlmICggYS0+ZXh0ZW50X29yZGVyICE9
IDAgKQ0KPiA+ICsgICAgICAgICAgICAgICAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGdk
cHJpbnRrKFhFTkxPR19XQVJOSU5HLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJDYW5ub3QgYWxsb2NhdGUgc3RhdGljIG9yZGVyLSV1IHBhZ2VzIGZvciBzdGF0aWMgJXBkXG4i
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGEtPmV4dGVudF9vcmRlciwgZCk7
DQo+IA0KPiBJJ20gcHJvYmFibHkgd3JvbmcgaW4gdGhpbmtpbmcgdGhhdCBJIGRpZCBwb2ludCBv
dXQgYmVmb3JlIHRoYXQgdGhlcmUncyBubyByZWFsDQo+IHJlYXNvbiB0byBoYXZlICJzdGF0aWMi
IHR3aWNlIGluIHRoZSBtZXNzYWdlLiBPciBhbSBJIG1pc3Rha2VuIGluIG15DQo+IHVuZGVyc3Rh
bmRpbmcgdGhhdCBvbmx5IHN0YXRpYyBkb21haW5zIGNhbiBldmVyIGhhdmUgc3RhdGljIHBhZ2Vz
Pw0KPiANCg0KU29ycnkgZm9yIG9taXR0aW5nIHRoZSBjb21tZW50LCBJJ2xsIG9ubHkga2VlcCBv
bmUgc3RhdGljIGhlcmUuDQpZb3UncmUgcmlnaHQsIG9ubHkgc3RhdGljIGRvbWFpbnMgY2FuIGhh
dmUgc3RhdGljIHBhZ2VzIGF0IHRoZSBtb21lbnQuDQoNCj4gPiBAQCAtMjgxOCw2ICsyODA1LDU1
IEBAIGludCBfX2luaXQgYWNxdWlyZV9kb21zdGF0aWNfcGFnZXMoc3RydWN0DQo+ID4gZG9tYWlu
ICpkLCBtZm5fdCBzbWZuLA0KPiA+DQo+ID4gICAgICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+ICsN
Cj4gPiArLyoNCj4gPiArICogQWNxdWlyZSBucl9tZm5zIGNvbnRpZ3VvdXMgcGFnZXMsIHN0YXJ0
aW5nIGF0ICNzbWZuLCBvZiBzdGF0aWMNCj4gPiArbWVtb3J5LA0KPiA+ICsgKiB0aGVuIGFzc2ln
biB0aGVtIHRvIG9uZSBzcGVjaWZpYyBkb21haW4gI2QuDQo+ID4gKyAqLw0KPiA+ICtpbnQgX19p
bml0IGFjcXVpcmVfZG9tc3RhdGljX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQsIG1mbl90IHNtZm4s
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5y
X21mbnMsIHVuc2lnbmVkIGludA0KPiA+ICttZW1mbGFncykgew0KPiA+ICsgICAgc3RydWN0IHBh
Z2VfaW5mbyAqcGc7DQo+ID4gKw0KPiA+ICsgICAgQVNTRVJUX0FMTE9DX0NPTlRFWFQoKTsNCj4g
PiArDQo+ID4gKyAgICBwZyA9IGFjcXVpcmVfc3RhdGljbWVtX3BhZ2VzKHNtZm4sIG5yX21mbnMs
IG1lbWZsYWdzKTsNCj4gPiArICAgIGlmICggIXBnICkNCj4gPiArICAgICAgICByZXR1cm4gLUVO
T0VOVDsNCj4gPiArDQo+ID4gKyAgICBpZiAoIGFzc2lnbl9kb21zdGF0aWNfcGFnZXMoZCwgcGcs
IG5yX21mbnMsIG1lbWZsYWdzKSApDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4g
Kw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIEFj
cXVpcmUgYSBwYWdlIGZyb20gcmVzZXJ2ZWQgcGFnZSBsaXN0KHJlc3ZfcGFnZV9saXN0KSwgd2hl
bg0KPiA+ICtwb3B1bGF0aW5nDQo+ID4gKyAqIG1lbW9yeSBmb3Igc3RhdGljIGRvbWFpbiBvbiBy
dW50aW1lLg0KPiA+ICsgKi8NCj4gPiArbWZuX3QgYWNxdWlyZV9yZXNlcnZlZF9wYWdlKHN0cnVj
dCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBtZW1mbGFncykNCj4gPiArew0KPiA+ICsgICAgc3Ry
dWN0IHBhZ2VfaW5mbyAqcGFnZTsNCj4gDQo+IFVzZSBBU1NFUlRfQUxMT0NfQ09OVEVYVCgpIGhl
cmUgYXMgd2VsbD8NCj4gDQoNClN1cmUsDQoNCj4gPiArICAgIC8qIEFjcXVpcmUgYSBwYWdlIGZy
b20gcmVzZXJ2ZWQgcGFnZSBsaXN0KHJlc3ZfcGFnZV9saXN0KS4gKi8NCj4gPiArICAgIHNwaW5f
bG9jaygmZC0+cGFnZV9hbGxvY19sb2NrKTsNCj4gPiArICAgIHBhZ2UgPSBwYWdlX2xpc3RfcmVt
b3ZlX2hlYWQoJmQtPnJlc3ZfcGFnZV9saXN0KTsNCj4gPiArICAgIHNwaW5fdW5sb2NrKCZkLT5w
YWdlX2FsbG9jX2xvY2spOw0KPiA+ICsgICAgaWYgKCB1bmxpa2VseSghcGFnZSkgKQ0KPiA+ICsg
ICAgICAgIHJldHVybiBJTlZBTElEX01GTjsNCj4gPiArDQo+ID4gKyAgICBpZiAoICFwcmVwYXJl
X3N0YXRpY21lbV9wYWdlcyhwYWdlLCAxLCBtZW1mbGFncykgKQ0KPiA+ICsgICAgICAgIGdvdG8g
ZmFpbDsNCj4gDQo+IERvbid0IHlvdSBuZWVkIHRvIHVuZG8gd2hhdCB0aGlzIGRpZCBpZiAuLi4N
Cj4gDQo+ID4gKyAgICBpZiAoIGFzc2lnbl9kb21zdGF0aWNfcGFnZXMoZCwgcGFnZSwgMSwgbWVt
ZmxhZ3MpICkNCj4gPiArICAgICAgICBnb3RvIGZhaWw7DQo+IA0KPiAuLi4gdGhpcyBmYWlscz8N
Cg0KWWVzLCB0aGFua3MgZm9yIHBvaW50aW5nIG91dC4NCmZyZWVfc3RhdGljbWVtX3BhZ2VzIGlz
IG5lZWRlZCB0byBkbyB0aGUgcmV2ZXJzYWwgd2hlbiBpdCBmYWlscw0KDQo+IA0KPiBKYW4NCg==

