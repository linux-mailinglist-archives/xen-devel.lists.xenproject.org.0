Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71D6849DEB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676187.1052147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0oV-0004sE-71; Mon, 05 Feb 2024 15:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676187.1052147; Mon, 05 Feb 2024 15:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0oV-0004oz-47; Mon, 05 Feb 2024 15:23:15 +0000
Received: by outflank-mailman (input) for mailman id 676187;
 Mon, 05 Feb 2024 15:23:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vGJX=JO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rX0oT-0004ot-4z
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:23:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2611::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7926a945-c43a-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 16:23:11 +0100 (CET)
Received: from AM9P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::22)
 by AS8PR08MB6373.eurprd08.prod.outlook.com (2603:10a6:20b:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 15:23:07 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::fd) by AM9P250CA0017.outlook.office365.com
 (2603:10a6:20b:21c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34 via Frontend
 Transport; Mon, 5 Feb 2024 15:23:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 5 Feb 2024 15:23:06 +0000
Received: ("Tessian outbound 31df1b57f90c:v228");
 Mon, 05 Feb 2024 15:23:06 +0000
Received: from 8b9f1b5d3fdc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D5E3101-83EE-4305-9307-4E855F47A3F4.1; 
 Mon, 05 Feb 2024 15:22:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8b9f1b5d3fdc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Feb 2024 15:22:59 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PR3PR08MB5836.eurprd08.prod.outlook.com (2603:10a6:102:8f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 15:22:57 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::2257:5fcb:b449:fff0]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::2257:5fcb:b449:fff0%7]) with mapi id 15.20.7249.027; Mon, 5 Feb 2024
 15:22:57 +0000
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
X-Inumbo-ID: 7926a945-c43a-11ee-8a45-1f161083a0e0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IzmbJT/857NLqZRFDxNSyToU4onC3MQZOfDMbhMz9OovFGeTSfvs1TZtzcF5UPw5MrnjVE7yNu37w1xGYpwSjTjxPwfNDd0LfbiR4dwQr4MJvwMYjEwcjrVa5aGAktHvwfT9/l2lJXgIiYD2kIRimMRS05a9Nh2dRheOm0junQ4fpdZCmoQ7gdSLxPN9qwXinbocFO1G5I55+2vWeVSfFaY6UM+MoIwz6jbC2KYSkJqH3GsAKk3peGjrQm5zhbyaLzaTO/YAkkXCBBcLsCeSiDkwT5L/3ad23X6VrlkPpxfweoZM52nZ7nUcBPxCPpmw+dFa+1uYuUBaVg+KfONiaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRY6zly75qyZO3IoYXgvNPG6LAcRfIxsTT5sGoA2obE=;
 b=LiLb42WTlBuagCwuFGOZuOBfKCtw1frYVp843TYxdhTQFEA3yXxoWivhtE3Y4skeKvzZS3r+rzcG07JR9UTgKgSiJof0T+Sj9wC6QacxBnlcPlZzcXyOgl4tv8z/2d2MTa6iYZqsnlEvSscrQnduy6EPFRIWiwl3XHEG5NdqwOjidHCbU2DSbyNIRxK9DXjPcZdf0V6da++90IFGdNQ0xE11l8D++zQVzRQvfefzjTtZCT6jenoSOn5LqSkxB2IAg6wcrtCf/M+T5uAn78bXK8/kqtU81YdFPLalZgOWjTiBVKmJbW3NNkalcytopP8X13nG+aRLD0h0hr5zrLOKIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRY6zly75qyZO3IoYXgvNPG6LAcRfIxsTT5sGoA2obE=;
 b=IYUZxdtPsbgfQIQO8dKatPV4PW3DVlcIXDcMr7+Kh676obbmDhpHOrHgdJtV1wp0rDReg2F7oOjPfMwlGMTf0sT911IcZ0P7+dcdI93cer5fHWrFonhBoFItx4Q+Nubc2KfcmUgM6jwMll10LdUO1nWqVeYp/9VqZqriEfmF81w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 628d59e15ef772d7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5mBjdptPFuBU5/awCjvxatSfiVj82ZuCk5dJBO9Bwvp57RwbtFBfQ7LbFEfSbz4IS3DkeljIagy3E5pwyy5AhNZS7OtyS0Hk7bAxfbwnrAdawOQxR0m8v67d5Dx1a5hDupoloxDSRdkJN3xJ6PdKtDT5L/p6q1nn/y4QWU27SlAURP3REJPUtT2PS2Cgqc7hi0uWarVlP8CBFAOR6mfikZ6PdHmFl/Cy2ni6SbmKS79IBPkOZEoOdysLnGRxWa+V6hHFCXHQ2LRaW1Ke9tl1lhbtpXz5eUCXbctjW37gqv3As5ePDf02HODsN2Do1gxvDnQBijWcoa34Pqk5YdNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRY6zly75qyZO3IoYXgvNPG6LAcRfIxsTT5sGoA2obE=;
 b=EGvGpoqeKonxlkmw6huy/8VJQmxpZHsQIwTNJRsyxuPOKssu5Qyrp/oNxYJhCvGS3tsn/1UM6VX2YRd7BBykXti8gtKM9yGuUeJL58g9rve5T+zvVEyqgh4XkGq+oh4tkUVZm5eFHuPMXsllL3cgLVRlQOFmmaYodQcCpws1+6MkTVxp2hPlYGZ4HY7n4jQQWmTSx2vSlziz3VOZp2KEnt3OkPgGVmecoX1IpJK9dHg4KyxN1MTJFKlagwuke8gDAVbG7XuqmLJaHEF4ys0ab8jV3jCXvQJUxxL+M5Y40/qhDO+hGlAfC1jDRYxC5XqrFvt7a9EZ2z+FAD7KHmMXNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRY6zly75qyZO3IoYXgvNPG6LAcRfIxsTT5sGoA2obE=;
 b=IYUZxdtPsbgfQIQO8dKatPV4PW3DVlcIXDcMr7+Kh676obbmDhpHOrHgdJtV1wp0rDReg2F7oOjPfMwlGMTf0sT911IcZ0P7+dcdI93cer5fHWrFonhBoFItx4Q+Nubc2KfcmUgM6jwMll10LdUO1nWqVeYp/9VqZqriEfmF81w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v3] xen/arm: ffa: reclaim shared memory on guest
 destroy
Thread-Topic: [XEN PATCH v3] xen/arm: ffa: reclaim shared memory on guest
 destroy
Thread-Index: AQHaSTVKNVT0ywRTlE22Kr4Xf5r90LD1mryAgAZVM4CAAAv9AA==
Date: Mon, 5 Feb 2024 15:22:57 +0000
Message-ID: <141E52D2-CBC3-4562-B41C-905F2CA78C85@arm.com>
References: <20240117110618.2183977-1-jens.wiklander@linaro.org>
 <6980D75D-544A-4A3B-906B-DC27D68A260B@arm.com>
 <CAHUa44GS7hX=7msPgzMestM+Dpre0rjuFs9gOq-WY+c=waxi8g@mail.gmail.com>
In-Reply-To:
 <CAHUa44GS7hX=7msPgzMestM+Dpre0rjuFs9gOq-WY+c=waxi8g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PR3PR08MB5836:EE_|AM3PEPF0000A799:EE_|AS8PR08MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: 5efeede4-6519-4317-7272-08dc265e5ab5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KKhsRU89ymIWl1obtOD7uK3N5Mto3dGEKZe17n5Tae6IAPBdczcxDrchYQnCAlyVneiqa5z7Yrrcm8utPTt3yhVJEjvAfEJj1itssxFSSv0SnOMCZlO90bid6RT2KCCNEdGjZmwnf172QWl72scQ8NTUyTe/CCP4iSJ/12NE1NIMicovI9n3JY12h8HoNXbwujVmqfDxS2r2jtDeS0vmCcZd1WTE5UG3H1TYNfZZoBMHfpzwNDtnHBfvChU2LO1qfKLJZxPceSgGELdO2eSMIcWguibapu2rhqsVEDyETef7fBPEFPVkXH6H58/zaxvZ4sYAmDEEWOLRSJHfffQ203ndFhRvg6B4gPEu2sIFaydwSR/KrHIP7j0RKCZuEVPaZRCkqfeSpUpzgvMdIzle+qkp/NSNYsvid8eEoXMt9sp3epTi6OeEIiz9tb2YuaRHe3y7CzbpFlwGBhxD2adbE2y9xII9JmxXcEWSlhRUYUxKYVr9x0dqT2hRvOIjhuqSkQx4RSTwUD1r86bt2uxhjpELdY/Q39QtawANrcGxt5bSi5LBZ2b3tPoF3+pCUp8qK8EIH4GiDoiSYOpw7nPAPt1+gp1J1W5OMdvh++HW+TMOirHef8Gl3YmRWn/S6rKICJ78IqZ9uD+BBppJvir1dQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(478600001)(86362001)(26005)(6506007)(6512007)(53546011)(122000001)(6486002)(38100700002)(71200400001)(2616005)(83380400001)(33656002)(316002)(64756008)(54906003)(66476007)(66446008)(66556008)(76116006)(66946007)(4326008)(41300700001)(5660300002)(30864003)(2906002)(36756003)(6916009)(8936002)(8676002)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <41E6FD16E774F2488AD498A72E0675AF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5836
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37bfcb5b-d7a8-4091-ee7b-08dc265e550a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mCKH7wBWaJgSSLFWQnTEAnX/bbj69eWFz7N5hXGepUXVOoWHGIXBfFKhlQiXM1wiGFZUE/AhXJxELn+aw0tJFVoWmkSPAgGDdb3GZhjsTiUz4y4BhJXEMVOToDWS5QrU6fX1KWrGvZFa+2ZNyZleLrVW4EOl/pBmciG+2mkO5PZp0p68wAVRPfe1VDo0GqBvdZ4uGhhPhkQ05T2KOE6Gidw3q6nNWELHw8oj3zrYxUIm+DMxd7maIPIOzC1mY1VFhgmPaxuCJRfq7VSNAPDYg9yAGkiYDPwOr3Sg4HgnnqNLuKdUJvcle7I1BPoLCq3vJST/eqxSBidvxpeuaDrn11SZnSXwSdOxOnUoqDBuph12XTE3zT/YXw/4peT51SsAH035OivH+/3eYkEtxf6PJQUDIvBVxCkozZWES1wSuOC2H7k/lbvtaCLQ7v1vKJxKL2jFmyLVeCxTEZo7Up0P8MO4gZYXh2fcW1Mk47WYgGsl3ebBtUcnEPqmd6Ow4lXS8j3GB4UBKwRp6ShMUNpMEwicWC3Ap4zIbWB00gfI0nD7cAixN3lZdTrjhYyc+CpIYInvzmv0QZ/ihDqcrGpoAyYQiJ5CVRCdor6RtDGxZMb/xROyVhrPAFyy8R/glnUWmnFx3GG+OHJYi6NJ+++CmiAnGAI+2Nk4+8bLLYeaMgzWKY73B4wxQPhmXAbwZc05gSqr1VdE755+dlAUbqIPthjPcNEPNOp56NHWLktodUrFJ9HUPsDcQID7ZHI6NUy2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(82310400011)(451199024)(186009)(36840700001)(40470700004)(46966006)(41300700001)(6506007)(6862004)(8676002)(8936002)(36756003)(6486002)(4326008)(47076005)(70206006)(54906003)(2906002)(70586007)(30864003)(316002)(36860700001)(5660300002)(86362001)(356005)(81166007)(6512007)(82740400003)(53546011)(2616005)(478600001)(83380400001)(107886003)(33656002)(26005)(336012)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 15:23:06.9764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efeede4-6519-4317-7272-08dc265e5ab5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6373

SGkgSmVucywNCg0KPiBPbiA1IEZlYiAyMDI0LCBhdCAxNDozOSwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBUaHUsIEZlYiAxLCAyMDI0IGF0IDI6NTfigK9QTSBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxC
ZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBIaSBKZW5zLA0KPj4gDQo+
Pj4gT24gMTcgSmFuIDIwMjQsIGF0IDEyOjA2LCBKZW5zIFdpa2xhbmRlciA8amVucy53aWtsYW5k
ZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gV2hlbiBhbiBGRi1BIGVuYWJsZWQgZ3Vl
c3QgaXMgZGVzdHJveWVkIGl0IG1heSBsZWF2ZSBiZWhpbmQgbWVtb3J5DQo+Pj4gc2hhcmVkIHdp
dGggU1BzLiBUaGlzIG1lbW9yeSBtdXN0IGJlIHJlY2xhaW1lZCBiZWZvcmUgaXQncyByZXVzZWQg
b3IgYW4NCj4+PiBTUCBtYXkgbWFrZSBjaGFuZ2VzIHRvIG1lbW9yeSB1c2VkIGJ5IGEgbmV3IHVu
cmVsYXRlZCBndWVzdC4gU28gd2hlbiB0aGUNCj4+PiBkb21haW4gaXMgdGVhcmVkIGRvd24gYWRk
IEZGLUEgcmVxdWVzdHMgdG8gcmVjbGFpbSBhbGwgcmVtYWluaW5nIHNoYXJlZA0KPj4+IG1lbW9y
eS4NCj4+PiANCj4+PiBTUHMgaW4gdGhlIHNlY3VyZSB3b3JsZCBhcmUgbm90aWZpZWQgdXNpbmcg
Vk1fREVTVFJPWUVEIHRoYXQgYSBndWVzdCBoYXMNCj4+PiBiZWVuIGRlc3Ryb3llZC4gQW4gU1Ag
aXMgc3VwcG9zZWQgdG8gcmVsaW5xdWlzaCBhbGwgc2hhcmVkIG1lbW9yeSB0byBhbGxvdw0KPj4+
IHJlY2xhaW1pbmcgdGhlIG1lbW9yeS4gVGhlIHJlbGlucXVpc2ggb3BlcmF0aW9uIG1heSBuZWVk
IHRvIGJlIGRlbGF5ZWQgaWYNCj4+PiB0aGUgc2hhcmVkIG1lbW9yeSBpcyBmb3IgaW5zdGFuY2Ug
cGFydCBvZiBhIERNQSBvcGVyYXRpb24uDQo+Pj4gDQo+Pj4gVGhlIGRvbWFpbiByZWZlcmVuY2Ug
Y291bnRlciBpcyBpbmNyZWFzZWQgd2hlbiB0aGUgZmlyc3QgRkYtQSBzaGFyZWQNCj4+PiBtZW1v
cnkgaXMgcmVnaXN0ZXJlZCBhbmQgdGhlIGNvdW50ZXIgaXMgZGVjcmVhc2VkIGFnYWluIHdoZW4g
dGhlIGxhc3QNCj4+PiBzaGFyZWQgbWVtb3J5IGlzIHJlY2xhaW1lZC4gSWYgRkYtQSBzaGFyZWQg
bWVtb3J5IHJlZ2lzdHJhdGlvbnMgcmVtYWluDQo+Pj4gYXQgdGhlIGVuZCBvZiBvZiBmZmFfZG9t
YWluX3RlYXJkb3duKCkgYSB0aW1lciBpcyBzZXQgdG8gdHJ5IHRvIHJlY2xhaW0NCj4+PiB0aGUg
c2hhcmVkIG1lbW9yeSBldmVyeSBzZWNvbmQgdW50aWwgdGhlIG1lbW9yeSBpcyByZWNsYWltZWQu
DQo+Pj4gDQo+Pj4gQSBmZXcgbWlub3Igc3R5bGUgZml4ZXMgd2l0aCBhIHJlbW92ZWQgZW1wdHkg
bGluZSBoZXJlIGFuZCBhbiBhZGRlZCBuZXcNCj4+PiBsaW5lIHRoZXJlLg0KPj4+IA0KPj4+IFNp
Z25lZC1vZmYtYnk6IEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPg0K
Pj4+IC0tLQ0KPj4+IA0KPj4+IHYzOg0KPj4+IC0gTWVudGlvbmluZyBpbiB0aGUgY29tbWl0IG1l
c3NhZ2UgdGhhdCB0aGVyZSBhcmUgc29tZSBzdHlsZSBmaXhlcw0KPj4+IC0gQWRkcmVzc2luZyBy
ZXZpZXcgY29tbWVudHMNCj4+PiAtIFJlZmFjdG9yIHRoZSBmZmFfZG9tYWluX3RlYXJkb3duKCkg
cGF0aCB0byBsZXQNCj4+PiBmZmFfZG9tYWluX3RlYXJkb3duX2NvbnRpbnVlKCkgZG8gbW9zdCBv
ZiB0aGUgd29yay4NCj4+PiANCj4+PiB2MjoNCj4+PiAtIFVwZGF0ZSBjb21taXQgbWVzc2FnZSB0
byBtYXRjaCB0aGUgbmV3IGltcGxlbWVudGF0aW9uDQo+Pj4gLSBVc2luZyBhIHBlciBkb21haW4g
Yml0ZmllbGQgdG8ga2VlcCB0cmFjayBvZiB3aGljaCBTUHMgaGFzIGJlZW4gbm90aWZpZWQNCj4+
PiB3aXRoIFZNX0RFU1RST1lFRA0KPj4+IC0gSG9sZGluZyBhIGRvbWFpbiByZWZlcmVuY2UgY291
bnRlciB0byBrZWVwIHRoZSBkb21haW4gYXMgYSB6b21iaWUgZG9tYWluDQo+Pj4gd2hpbGUgdGhl
cmUgc3RpbGwgaXMgc2hhcmVkIG1lbW9yeSByZWdpc3RyYXRpb25zIHJlbWFpbmluZyB0byBiZSBy
ZWNsYWltZWQNCj4+PiAtIFVzaW5nIGEgdGltZXIgdG8gcmV0cnkgcmVjbGFpbWluZyByZW1haW5p
bmcgc2hhcmVkIG1lbW9yeSByZWdpc3RyYXRpb25zDQo+Pj4gLS0tDQo+Pj4geGVuL2FyY2gvYXJt
L3RlZS9mZmEuYyB8IDI1MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LQ0KPj4+IDEgZmlsZSBjaGFuZ2VkLCAyMDQgaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0p
DQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMgYi94ZW4vYXJj
aC9hcm0vdGVlL2ZmYS5jDQo+Pj4gaW5kZXggMDc5M2MxYzc1ODVkLi44MGViYmY0ZjAxYzYgMTAw
NjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4+ICsrKyBiL3hlbi9hcmNo
L2FybS90ZWUvZmZhLmMNCj4+PiBAQCAtNTQsNiArNTQsNyBAQA0KPj4+ICNpbmNsdWRlIDx4ZW4v
bW0uaD4NCj4+PiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+DQo+Pj4gI2luY2x1ZGUgPHhlbi9zaXpl
cy5oPg0KPj4+ICsjaW5jbHVkZSA8eGVuL3RpbWVyLmg+DQo+Pj4gI2luY2x1ZGUgPHhlbi90eXBl
cy5oPg0KPj4+IA0KPj4+ICNpbmNsdWRlIDxhc20vZXZlbnQuaD4NCj4+PiBAQCAtMTQ0LDYgKzE0
NSwxMiBAQA0KPj4+ICovDQo+Pj4gI2RlZmluZSBGRkFfTUFYX1NITV9DT1VOVCAgICAgICAgICAg
ICAgIDMyDQo+Pj4gDQo+Pj4gKy8qDQo+Pj4gKyAqIFRoZSB0aW1lIHdlIHdhaXQgdW50aWwgdHJ5
aW5nIHRvIHRlYXIgZG93biBhIGRvbWFpbiBhZ2FpbiBpZiBpdCB3YXMNCj4+PiArICogYmxvY2tl
ZCBpbml0aWFsbHkuDQo+Pj4gKyAqLw0KPj4+ICsjZGVmaW5lIEZGQV9DVFhfVEVBUkRPV05fREVM
QVkgICAgICAgICAgU0VDT05EUygxKQ0KPj4+ICsNCj4+PiAvKiBGRi1BLTEuMS1SRUwwIHNlY3Rp
b24gMTAuOS4yIE1lbW9yeSByZWdpb24gaGFuZGxlLCBwYWdlIDE2NyAqLw0KPj4+ICNkZWZpbmUg
RkZBX0hBTkRMRV9IWVBfRkxBRyAgICAgICAgICAgICBCSVQoNjMsIFVMTCkNCj4+PiAjZGVmaW5l
IEZGQV9IQU5ETEVfSU5WQUxJRCAgICAgICAgICAgICAgMHhmZmZmZmZmZmZmZmZmZmZmVUxMDQo+
Pj4gQEAgLTM4NCwxMSArMzkxLDYgQEAgc3RydWN0IGZmYV9jdHggew0KPj4+ICAgIHVuc2lnbmVk
IGludCBwYWdlX2NvdW50Ow0KPj4+ICAgIC8qIEZGLUEgdmVyc2lvbiB1c2VkIGJ5IHRoZSBndWVz
dCAqLw0KPj4+ICAgIHVpbnQzMl90IGd1ZXN0X3ZlcnM7DQo+Pj4gLSAgICAvKg0KPj4+IC0gICAg
ICogTnVtYmVyIG9mIFNQcyB0aGF0IHdlIGhhdmUgc2VudCBhIFZNIGNyZWF0ZWQgc2lnbmFsIHRv
LCB1c2VkIGluDQo+Pj4gLSAgICAgKiBmZmFfZG9tYWluX3RlYXJkb3duKCkgdG8ga25vdyB3aGlj
aCBTUHMgbmVlZCB0byBiZSBzaWduYWxsZWQuDQo+Pj4gLSAgICAgKi8NCj4+PiAtICAgIHVpbnQx
Nl90IGNyZWF0ZV9zaWduYWxfY291bnQ7DQo+Pj4gICAgYm9vbCByeF9pc19mcmVlOw0KPj4+ICAg
IC8qIFVzZWQgc2hhcmVkIG1lbW9yeSBvYmplY3RzLCBzdHJ1Y3QgZmZhX3NobV9tZW0gKi8NCj4+
PiAgICBzdHJ1Y3QgbGlzdF9oZWFkIHNobV9saXN0Ow0KPj4+IEBAIC00MDIsNiArNDA0LDE1IEBA
IHN0cnVjdCBmZmFfY3R4IHsNCj4+PiAgICBzcGlubG9ja190IHR4X2xvY2s7DQo+Pj4gICAgc3Bp
bmxvY2tfdCByeF9sb2NrOw0KPj4+ICAgIHNwaW5sb2NrX3QgbG9jazsNCj4+PiArICAgIC8qIFVz
ZWQgaWYgZG9tYWluIGNhbid0IGJlIHRvcm4gZG93biBpbW1lZGlhdGVseSAqLw0KPj4+ICsgICAg
c3RydWN0IGRvbWFpbiAqdGVhcmRvd25fZDsNCj4+PiArICAgIHN0cnVjdCBsaXN0X2hlYWQgdGVh
cmRvd25fbGlzdDsNCj4+PiArICAgIHNfdGltZV90IHRlYXJkb3duX2V4cGlyZTsNCj4+PiArICAg
IC8qDQo+Pj4gKyAgICAgKiBVc2VkIGZvciBmZmFfZG9tYWluX3RlYXJkb3duKCkgdG8ga2VlcCB0
cmFjayBvZiB3aGljaCBTUHMgc2hvdWxkIGJlDQo+Pj4gKyAgICAgKiBub3RpZmllZCB0aGF0IHRo
aXMgZ3Vlc3QgaXMgYmVpbmcgZGVzdHJveWVkLg0KPj4+ICsgICAgICovDQo+Pj4gKyAgICB1bnNp
Z25lZCBsb25nIHZtX2Rlc3Ryb3lfYml0bWFwW107DQo+Pj4gfTsNCj4+PiANCj4+PiBzdHJ1Y3Qg
ZmZhX3NobV9tZW0gew0KPj4+IEBAIC00MzYsNiArNDQ3LDEyIEBAIHN0YXRpYyB2b2lkICpmZmFf
dHggX19yZWFkX21vc3RseTsNCj4+PiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGZmYV9yeF9idWZm
ZXJfbG9jayk7DQo+Pj4gc3RhdGljIERFRklORV9TUElOTE9DSyhmZmFfdHhfYnVmZmVyX2xvY2sp
Ow0KPj4+IA0KPj4+ICsNCj4+PiArLyogVXNlZCB0byB0cmFjayBkb21haW5zIHRoYXQgY291bGQg
bm90IGJlIHRvcm4gZG93biBpbW1lZGlhdGVseS4gKi8NCj4+PiArc3RhdGljIHN0cnVjdCB0aW1l
ciBmZmFfdGVhcmRvd25fdGltZXI7DQo+Pj4gK3N0YXRpYyBzdHJ1Y3QgbGlzdF9oZWFkIGZmYV90
ZWFyZG93bl9oZWFkOw0KPj4+ICtzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGZmYV90ZWFyZG93bl9s
b2NrKTsNCj4+PiArDQo+Pj4gc3RhdGljIGJvb2wgZmZhX2dldF92ZXJzaW9uKHVpbnQzMl90ICp2
ZXJzKQ0KPj4+IHsNCj4+PiAgICBjb25zdCBzdHJ1Y3QgYXJtX3NtY2NjXzFfMl9yZWdzIGFyZyA9
IHsNCj4+PiBAQCAtODUzLDcgKzg3MCw2IEBAIHN0YXRpYyBpbnQzMl90IGhhbmRsZV9wYXJ0aXRp
b25faW5mb19nZXQodWludDMyX3QgdzEsIHVpbnQzMl90IHcyLCB1aW50MzJfdCB3MywNCj4+PiAg
ICAgICAgICAgIGdvdG8gb3V0X3J4X3JlbGVhc2U7DQo+Pj4gICAgICAgIH0NCj4+PiANCj4+PiAt
DQo+Pj4gICAgICAgIG1lbWNweShjdHgtPnJ4LCBmZmFfcngsIHN6KTsNCj4+PiAgICB9DQo+Pj4g
ICAgY3R4LT5yeF9pc19mcmVlID0gZmFsc2U7DQo+Pj4gQEAgLTk5Miw1MyArMTAwOCw3NSBAQCBz
dGF0aWMgdm9pZCBwdXRfc2htX3BhZ2VzKHN0cnVjdCBmZmFfc2htX21lbSAqc2htKQ0KPj4+ICAg
IH0NCj4+PiB9DQo+Pj4gDQo+Pj4gLXN0YXRpYyBib29sIGluY19jdHhfc2htX2NvdW50KHN0cnVj
dCBmZmFfY3R4ICpjdHgpDQo+Pj4gK3N0YXRpYyBib29sIGluY19jdHhfc2htX2NvdW50KHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCBmZmFfY3R4ICpjdHgpDQo+Pj4gew0KPj4+ICAgIGJvb2wgcmV0
ID0gdHJ1ZTsNCj4+PiANCj4+PiAgICBzcGluX2xvY2soJmN0eC0+bG9jayk7DQo+Pj4gKw0KPj4+
ICsgICAgLyoNCj4+PiArICAgICAqIElmIHRoaXMgaXMgdGhlIGZpcnN0IHNobSBhZGRlZCwgaW5j
cmVhc2UgdGhlIGRvbWFpbiByZWZlcmVuY2UNCj4+PiArICAgICAqIGNvdW50ZXIgYXMgd2UgbmVl
ZCB0byBrZWVwIGRvbWFpbiBhcm91bmQgYSBiaXQgbG9uZ2VyIHRvIHJlY2xhaW0gdGhlDQo+Pj4g
KyAgICAgKiBzaGFyZWQgbWVtb3J5IGluIHRoZSB0ZWFyZG93biBwYXRoLg0KPj4+ICsgICAgICov
DQo+Pj4gKyAgICBpZiAoICFjdHgtPnNobV9jb3VudCApDQo+Pj4gKyAgICAgICAgZ2V0X2tub3du
YWxpdmVfZG9tYWluKGQpOw0KPj4+ICsNCj4+PiAgICBpZiAoY3R4LT5zaG1fY291bnQgPj0gRkZB
X01BWF9TSE1fQ09VTlQpDQo+Pj4gICAgICAgIHJldCA9IGZhbHNlOw0KPj4+ICAgIGVsc2UNCj4+
PiAgICAgICAgY3R4LT5zaG1fY291bnQrKzsNCj4+PiArDQo+Pj4gICAgc3Bpbl91bmxvY2soJmN0
eC0+bG9jayk7DQo+Pj4gDQo+Pj4gICAgcmV0dXJuIHJldDsNCj4+PiB9DQo+Pj4gDQo+Pj4gLXN0
YXRpYyB2b2lkIGRlY19jdHhfc2htX2NvdW50KHN0cnVjdCBmZmFfY3R4ICpjdHgpDQo+Pj4gK3N0
YXRpYyB2b2lkIGRlY19jdHhfc2htX2NvdW50KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBmZmFf
Y3R4ICpjdHgpDQo+Pj4gew0KPj4+ICAgIHNwaW5fbG9jaygmY3R4LT5sb2NrKTsNCj4+PiArDQo+
Pj4gICAgQVNTRVJUKGN0eC0+c2htX2NvdW50ID4gMCk7DQo+Pj4gICAgY3R4LT5zaG1fY291bnQt
LTsNCj4+PiArDQo+Pj4gKyAgICAvKg0KPj4+ICsgICAgICogSWYgdGhpcyB3YXMgdGhlIGxhc3Qg
c2htIHJlbW92ZWQsIGxldCBnbyBvZiB0aGUgZG9tYWluIHJlZmVyZW5jZSB3ZQ0KPj4+ICsgICAg
ICogdG9vayBpbiBpbmNfY3R4X3NobV9jb3VudCgpIGFib3ZlLg0KPj4+ICsgICAgICovDQo+Pj4g
KyAgICBpZiAoICFjdHgtPnNobV9jb3VudCApDQo+Pj4gKyAgICAgICAgcHV0X2RvbWFpbihkKTsN
Cj4+PiArDQo+Pj4gICAgc3Bpbl91bmxvY2soJmN0eC0+bG9jayk7DQo+Pj4gfQ0KPj4+IA0KPj4+
IC1zdGF0aWMgc3RydWN0IGZmYV9zaG1fbWVtICphbGxvY19mZmFfc2htX21lbShzdHJ1Y3QgZmZh
X2N0eCAqY3R4LA0KPj4+ICtzdGF0aWMgc3RydWN0IGZmYV9zaG1fbWVtICphbGxvY19mZmFfc2ht
X21lbShzdHJ1Y3QgZG9tYWluICpkLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHBhZ2VfY291bnQpDQo+Pj4gew0KPj4+ICsgICAg
c3RydWN0IGZmYV9jdHggKmN0eCA9IGQtPmFyY2gudGVlOw0KPj4+ICAgIHN0cnVjdCBmZmFfc2ht
X21lbSAqc2htOw0KPj4+IA0KPj4+ICAgIGlmICggcGFnZV9jb3VudCA+PSBGRkFfTUFYX1NITV9Q
QUdFX0NPVU5UICkNCj4+PiAgICAgICAgcmV0dXJuIE5VTEw7DQo+Pj4gLSAgICBpZiAoICFpbmNf
Y3R4X3NobV9jb3VudChjdHgpICkNCj4+PiArICAgIGlmICggIWluY19jdHhfc2htX2NvdW50KGQs
IGN0eCkgKQ0KPj4+ICAgICAgICByZXR1cm4gTlVMTDsNCj4+PiANCj4+PiAgICBzaG0gPSB4emFs
bG9jX2ZsZXhfc3RydWN0KHN0cnVjdCBmZmFfc2htX21lbSwgcGFnZXMsIHBhZ2VfY291bnQpOw0K
Pj4+ICAgIGlmICggc2htICkNCj4+PiAgICAgICAgc2htLT5wYWdlX2NvdW50ID0gcGFnZV9jb3Vu
dDsNCj4+PiAgICBlbHNlDQo+Pj4gLSAgICAgICAgZGVjX2N0eF9zaG1fY291bnQoY3R4KTsNCj4+
PiArICAgICAgICBkZWNfY3R4X3NobV9jb3VudChkLCBjdHgpOw0KPj4+IA0KPj4+ICAgIHJldHVy
biBzaG07DQo+Pj4gfQ0KPj4+IA0KPj4+IC1zdGF0aWMgdm9pZCBmcmVlX2ZmYV9zaG1fbWVtKHN0
cnVjdCBmZmFfY3R4ICpjdHgsIHN0cnVjdCBmZmFfc2htX21lbSAqc2htKQ0KPj4+ICtzdGF0aWMg
dm9pZCBmcmVlX2ZmYV9zaG1fbWVtKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBmZmFfc2htX21l
bSAqc2htKQ0KPj4+IHsNCj4+PiArICAgIHN0cnVjdCBmZmFfY3R4ICpjdHggPSBkLT5hcmNoLnRl
ZTsNCj4+PiArDQo+Pj4gICAgaWYgKCAhc2htICkNCj4+PiAgICAgICAgcmV0dXJuOw0KPj4+IA0K
Pj4+IC0gICAgZGVjX2N0eF9zaG1fY291bnQoY3R4KTsNCj4+PiArICAgIGRlY19jdHhfc2htX2Nv
dW50KGQsIGN0eCk7DQo+Pj4gICAgcHV0X3NobV9wYWdlcyhzaG0pOw0KPj4+ICAgIHhmcmVlKHNo
bSk7DQo+Pj4gfQ0KPj4+IEBAIC0xMzA2LDcgKzEzNDQsNyBAQCBzdGF0aWMgdm9pZCBoYW5kbGVf
bWVtX3NoYXJlKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4+ICAgICAgICBnb3RvIG91
dF91bmxvY2s7DQo+Pj4gICAgfQ0KPj4+IA0KPj4+IC0gICAgc2htID0gYWxsb2NfZmZhX3NobV9t
ZW0oY3R4LCBwYWdlX2NvdW50KTsNCj4+PiArICAgIHNobSA9IGFsbG9jX2ZmYV9zaG1fbWVtKGQs
IHBhZ2VfY291bnQpOw0KPj4+ICAgIGlmICggIXNobSApDQo+Pj4gICAgew0KPj4+ICAgICAgICBy
ZXQgPSBGRkFfUkVUX05PX01FTU9SWTsNCj4+PiBAQCAtMTM1MCw3ICsxMzg4LDcgQEAgc3RhdGlj
IHZvaWQgaGFuZGxlX21lbV9zaGFyZShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+PiAN
Cj4+PiBvdXQ6DQo+Pj4gICAgaWYgKCByZXQgKQ0KPj4+IC0gICAgICAgIGZyZWVfZmZhX3NobV9t
ZW0oY3R4LCBzaG0pOw0KPj4+ICsgICAgICAgIGZyZWVfZmZhX3NobV9tZW0oZCwgc2htKTsNCj4+
PiBvdXRfdW5sb2NrOg0KPj4+ICAgIHNwaW5fdW5sb2NrKCZjdHgtPnR4X2xvY2spOw0KPj4+IA0K
Pj4+IEBAIC0xNDAxLDcgKzE0MzksNyBAQCBzdGF0aWMgaW50IGhhbmRsZV9tZW1fcmVjbGFpbSh1
aW50NjRfdCBoYW5kbGUsIHVpbnQzMl90IGZsYWdzKQ0KPj4+ICAgIH0NCj4+PiAgICBlbHNlDQo+
Pj4gICAgew0KPj4+IC0gICAgICAgIGZyZWVfZmZhX3NobV9tZW0oY3R4LCBzaG0pOw0KPj4+ICsg
ICAgICAgIGZyZWVfZmZhX3NobV9tZW0oZCwgc2htKTsNCj4+PiAgICB9DQo+Pj4gDQo+Pj4gICAg
cmV0dXJuIHJldDsNCj4+PiBAQCAtMTQ4Niw2ICsxNTI0LDQxIEBAIHN0YXRpYyBib29sIGZmYV9o
YW5kbGVfY2FsbChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+PiAgICB9DQo+Pj4gfQ0K
Pj4+IA0KPj4+ICtzdGF0aWMgYm9vbCBpc19pbl9zdWJzY3JfbGlzdChjb25zdCB1aW50MTZfdCAq
c3Vic2NyLCB1aW50MTZfdCBzdGFydCwNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDE2X3QgZW5kLCB1aW50MTZfdCBzcF9pZCkNCj4+PiArew0KPj4+ICsgICAgdW5zaWdu
ZWQgaW50IG47DQo+Pj4gKw0KPj4+ICsgICAgZm9yICggbiA9IHN0YXJ0OyBuIDwgZW5kOyBuKysg
KQ0KPj4+ICsgICAgew0KPj4+ICsgICAgICAgIGlmICggc3Vic2NyW25dID09IHNwX2lkICkNCj4+
PiArICAgICAgICAgICAgcmV0dXJuIHRydWU7DQo+Pj4gKyAgICB9DQo+Pj4gKw0KPj4+ICsgICAg
cmV0dXJuIGZhbHNlOw0KPj4+ICt9DQo+Pj4gKw0KPj4+ICtzdGF0aWMgdm9pZCB2bV9kZXN0cm95
X2JpdG1hcF9pbml0KHN0cnVjdCBmZmFfY3R4ICpjdHgsDQo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGNyZWF0ZV9zaWduYWxfY291bnQpDQo+Pj4g
K3sNCj4+PiArICAgIHVuc2lnbmVkIGludCBuOw0KPj4+ICsNCj4+PiArICAgIGZvciAoIG4gPSAw
OyBuIDwgc3Vic2NyX3ZtX2Rlc3Ryb3llZF9jb3VudDsgbisrICkNCj4+PiArICAgIHsNCj4+PiAr
ICAgICAgICAvKg0KPj4+ICsgICAgICAgICAqIFNraXAgU1BzIHN1YnNjcmliZWQgdG8gdGhlIFZN
IGNyZWF0ZWQgZXZlbnQgdGhhdCBuZXZlciB3YXMNCj4+PiArICAgICAgICAgKiBub3RpZmllZCBv
ZiB0aGUgVk0gY3JlYXRpb24gZHVlIHRvIGFuIGVycm9yIGR1cmluZw0KPj4+ICsgICAgICAgICAq
IGZmYV9kb21haW5faW5pdCgpLg0KPj4+ICsgICAgICAgICAqLw0KPj4+ICsgICAgICAgIGlmICgg
aXNfaW5fc3Vic2NyX2xpc3Qoc3Vic2NyX3ZtX2NyZWF0ZWQsIGNyZWF0ZV9zaWduYWxfY291bnQs
DQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdWJzY3Jfdm1fY3JlYXRlZF9j
b3VudCwNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN1YnNjcl92bV9kZXN0
cm95ZWRbbl0pICkNCj4+PiArICAgICAgICAgICAgY29udGludWU7DQo+Pj4gKw0KPj4+ICsgICAg
ICAgIHNldF9iaXQobiwgY3R4LT52bV9kZXN0cm95X2JpdG1hcCk7DQo+Pj4gKyAgICB9DQo+Pj4g
K30NCj4+PiArDQo+Pj4gc3RhdGljIGludCBmZmFfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAq
ZCkNCj4+PiB7DQo+Pj4gICAgc3RydWN0IGZmYV9jdHggKmN0eDsNCj4+PiBAQCAtMTUwMSwxMSAr
MTU3NCwxNCBAQCBzdGF0aWMgaW50IGZmYV9kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0K
Pj4+ICAgIGlmICggZC0+ZG9tYWluX2lkID49IFVJTlQxNl9NQVgpDQo+Pj4gICAgICAgIHJldHVy
biAtRVJBTkdFOw0KPj4+IA0KPj4+IC0gICAgY3R4ID0geHphbGxvYyhzdHJ1Y3QgZmZhX2N0eCk7
DQo+Pj4gKyAgICBjdHggPSB4emFsbG9jX2ZsZXhfc3RydWN0KHN0cnVjdCBmZmFfY3R4LCB2bV9k
ZXN0cm95X2JpdG1hcCwNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUU19U
T19MT05HUyhzdWJzY3Jfdm1fZGVzdHJveWVkX2NvdW50KSk7DQo+Pj4gICAgaWYgKCAhY3R4ICkN
Cj4+PiAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+Pj4gDQo+Pj4gICAgZC0+YXJjaC50ZWUgPSBj
dHg7DQo+Pj4gKyAgICBjdHgtPnRlYXJkb3duX2QgPSBkOw0KPj4+ICsgICAgSU5JVF9MSVNUX0hF
QUQoJmN0eC0+c2htX2xpc3QpOw0KPj4+IA0KPj4+ICAgIGZvciAoIG4gPSAwOyBuIDwgc3Vic2Ny
X3ZtX2NyZWF0ZWRfY291bnQ7IG4rKyApDQo+Pj4gICAgew0KPj4+IEBAIC0xNTE1LDY1ICsxNTkx
LDE0MSBAQCBzdGF0aWMgaW50IGZmYV9kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+
ICAgICAgICB7DQo+Pj4gICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiZmZhOiBGYWlsZWQg
dG8gcmVwb3J0IGNyZWF0aW9uIG9mIHZtX2lkICV1IHRvICAldTogcmVzICVkXG4iLA0KPj4+ICAg
ICAgICAgICAgICAgICAgIGdldF92bV9pZChkKSwgc3Vic2NyX3ZtX2NyZWF0ZWRbbl0sIHJlcyk7
DQo+Pj4gLSAgICAgICAgICAgIGN0eC0+Y3JlYXRlX3NpZ25hbF9jb3VudCA9IG47DQo+Pj4gLSAg
ICAgICAgICAgIHJldHVybiAtRUlPOw0KPj4+ICsgICAgICAgICAgICBicmVhazsNCj4+PiAgICAg
ICAgfQ0KPj4+ICAgIH0NCj4+PiAtICAgIGN0eC0+Y3JlYXRlX3NpZ25hbF9jb3VudCA9IHN1YnNj
cl92bV9jcmVhdGVkX2NvdW50Ow0KPj4+IC0NCj4+PiAtICAgIElOSVRfTElTVF9IRUFEKCZjdHgt
PnNobV9saXN0KTsNCj4+PiArICAgIHZtX2Rlc3Ryb3lfYml0bWFwX2luaXQoY3R4LCBuKTsNCj4+
PiArICAgIGlmICggbiAhPSBzdWJzY3Jfdm1fY3JlYXRlZF9jb3VudCApDQo+Pj4gKyAgICAgICAg
cmV0dXJuIC1FSU87DQo+Pj4gDQo+Pj4gICAgcmV0dXJuIDA7DQo+Pj4gfQ0KPj4+IA0KPj4+IC1z
dGF0aWMgYm9vbCBpc19pbl9zdWJzY3JfbGlzdChjb25zdCB1aW50MTZfdCAqc3Vic2NyLCB1aW50
MTZfdCBzdGFydCwNCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3Qg
ZW5kLCB1aW50MTZfdCBzcF9pZCkNCj4+PiArc3RhdGljIHZvaWQgc2VuZF92bV9kZXN0cm95ZWQo
c3RydWN0IGRvbWFpbiAqZCkNCj4+PiB7DQo+Pj4gKyAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0g
ZC0+YXJjaC50ZWU7DQo+Pj4gICAgdW5zaWduZWQgaW50IG47DQo+Pj4gKyAgICBpbnQzMl90IHJl
czsNCj4+PiANCj4+PiAtICAgIGZvciAoIG4gPSBzdGFydDsgbiA8IGVuZDsgbisrICkNCj4+PiAr
ICAgIGZvciAoIG4gPSAwOyBuIDwgc3Vic2NyX3ZtX2Rlc3Ryb3llZF9jb3VudDsgbisrICkNCj4+
PiAgICB7DQo+Pj4gLSAgICAgICAgaWYgKCBzdWJzY3Jbbl0gPT0gc3BfaWQgKQ0KPj4+IC0gICAg
ICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+PiAtICAgIH0NCj4+PiArICAgICAgICBpZiAoICF0ZXN0
X2JpdChuLCBjdHgtPnZtX2Rlc3Ryb3lfYml0bWFwKSApDQo+Pj4gKyAgICAgICAgICAgIGNvbnRp
bnVlOw0KPj4+IA0KPj4+IC0gICAgcmV0dXJuIGZhbHNlOw0KPj4+ICsgICAgICAgIHJlcyA9IGZm
YV9kaXJlY3RfcmVxX3NlbmRfdm0oc3Vic2NyX3ZtX2Rlc3Ryb3llZFtuXSwgZ2V0X3ZtX2lkKGQp
LA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRkZBX01TR19TRU5E
X1ZNX0RFU1RST1lFRCk7DQo+Pj4gKw0KPj4gDQo+PiBJIHRoaW5rIGhlcmUgd2Ugc2hvdWxkIGRp
bnN0aW5ndWlzaCBjYXNlcyBkZXBlbmRpbmcgb24gdGhlIGVycm9yIHJlY2VpdmVkOg0KPj4gLSBy
ZXRyeTogd2Ugc2hvdWxkIGtlZXAgdGhlIGJpdCBzZXQgYW5kIHJldHJ5IGxhdGVyDQo+PiAtIG90
aGVyOiB1bnNldCB0aGUgYml0IGFzIHRoZXJlIGlzIG5vdCBtdWNoIHdlIGNhbiBkbyBidXQgbG9n
IGl0Lg0KPiANCj4gTWFrZXMgc2Vuc2UuDQo+IA0KPj4gDQo+PiBUaGUgaW50ZXJydXB0ZWQgY2Fz
ZSBjYW4gaGFwcGVuLCB3ZSBoYW5kbGUgdGhhdCBhbHJlYWR5IGluIHRoZSBkaXJlY3QgbWVzc2Fn
ZQ0KPj4gcmVxdWVzdCBidXQgd2Ugd2lsbCBnZXQgYmFjayBoZXJlIGlmIHRoYXQgZG9lcyBub3Qg
d29yayBhZnRlciBzb21lIHJldHJpZXMgc28NCj4+IHB1dHRpbmcgaXQgaW4gdGhlIG90aGVyIGNh
dGVnb3J5IGlzIG9rIGkgdGhpbmsuDQo+IA0KPiBJbiB0aGUgY2FzZSBvZiBGRkFfTVNHX1NFTkRf
Vk1fREVTVFJPWUVEIGlzIHRoaW5rIGl0IG1ha2VzIG1vcmUgc2Vuc2UNCj4gdG8gYWxzbyByZXRy
eSBGRkFfUkVUX0lOVEVSUlVQVEVEIGxhdGVyLiBUbyBtZSBpdCBzZWVtcyB0aGF0IHRoZXJlDQo+
IHdpbGwgYmUgYW4gZXZlbiBiZXR0ZXIgY2hhbmNlIGZvciBhbiBldmVudHVhbCBub24tc2VjdXJl
IGludGVycnVwdCB0bw0KPiBiZSBoYW5kbGVkIGlmIHdhaXQgYSBsaXR0bGUgYmVmb3JlIHJldHJ5
aW5nLiBTbywgaWYgeW91IGRvbid0IG1pbmQsDQo+IEknbGwgc2tpcCBjbGVhcmluZyB0aGUgYml0
IGJlbG93IGZvciBib3RoIEZGQV9SRVRfSU5URVJSVVBURUQgYW5kDQo+IEZGQV9SRVRfUkVUUlku
DQoNCkkgYWdyZWUuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4+IA0KPj4+ICsgICAgICAg
IGlmICggcmVzICkNCj4+PiArICAgICAgICB7DQo+Pj4gKyAgICAgICAgICAgIHByaW50ayhYRU5M
T0dfRVJSICIlcGQ6IGZmYTogRmFpbGVkIHRvIHJlcG9ydCBkZXN0cnVjdGlvbiBvZiB2bV9pZCAl
dSB0byAldTogcmVzICVkXG4iLA0KPj4+ICsgICAgICAgICAgICAgICAgICAgZCwgZ2V0X3ZtX2lk
KGQpLCBzdWJzY3Jfdm1fZGVzdHJveWVkW25dLCByZXMpOw0KPj4+ICsgICAgICAgIH0NCj4+PiAr
ICAgICAgICBlbHNlDQo+Pj4gKyAgICAgICAgew0KPj4+ICsgICAgICAgICAgICBjbGVhcl9iaXQo
biwgY3R4LT52bV9kZXN0cm95X2JpdG1hcCk7DQo+Pj4gKyAgICAgICAgfQ0KPj4+ICsgICAgfQ0K
Pj4+IH0NCj4+PiANCj4+PiAtLyogVGhpcyBmdW5jdGlvbiBpcyBzdXBwb3NlZCB0byB1bmRvIHdo
YXQgZmZhX2RvbWFpbl9pbml0KCkgaGFzIGRvbmUgKi8NCj4+PiAtc3RhdGljIGludCBmZmFfZG9t
YWluX3RlYXJkb3duKHN0cnVjdCBkb21haW4gKmQpDQo+Pj4gK3N0YXRpYyB2b2lkIHJlY2xhaW1f
c2htcyhzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+IHsNCj4+PiAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4
ID0gZC0+YXJjaC50ZWU7DQo+Pj4gLSAgICB1bnNpZ25lZCBpbnQgbjsNCj4+PiArICAgIHN0cnVj
dCBmZmFfc2htX21lbSAqc2htLCAqdG1wOw0KPj4+ICAgIGludDMyX3QgcmVzOw0KPj4+IA0KPj4+
IC0gICAgaWYgKCAhY3R4ICkNCj4+PiAtICAgICAgICByZXR1cm4gMDsNCj4+PiArICAgIGxpc3Rf
Zm9yX2VhY2hfZW50cnlfc2FmZShzaG0sIHRtcCwgJmN0eC0+c2htX2xpc3QsIGxpc3QpDQo+Pj4g
KyAgICB7DQo+Pj4gKyAgICAgICAgcmVnaXN0ZXJfdCBoYW5kbGVfaGk7DQo+Pj4gKyAgICAgICAg
cmVnaXN0ZXJfdCBoYW5kbGVfbG87DQo+Pj4gDQo+Pj4gLSAgICBmb3IgKCBuID0gMDsgbiA8IHN1
YnNjcl92bV9kZXN0cm95ZWRfY291bnQ7IG4rKyApDQo+Pj4gKyAgICAgICAgdWludDY0X3RvX3Jl
Z3BhaXIoJmhhbmRsZV9oaSwgJmhhbmRsZV9sbywgc2htLT5oYW5kbGUpOw0KPj4+ICsgICAgICAg
IHJlcyA9IGZmYV9tZW1fcmVjbGFpbShoYW5kbGVfbG8sIGhhbmRsZV9oaSwgMCk7DQo+PiANCj4+
IFNhbWUgaGVyZSBhcyBmb3IgdGhlIFZNX0RFU1RST1lFRCwgdGhlcmUgYXJlIHNvbWUgZXJyb3Ig
Y29kZSB0aGF0IHdlIHNob3VsZA0KPj4gbm90IHJlaXRlcmF0ZSBvbiBhcyB0aGV5IHdpbGwgYWxz
byBmYWlsIG5leHQgdGltZToNCj4+IC0gaW52YWxpZCBwYXJhbWV0ZXJzOiBzdG9wIGFuZCBsb2cg
YW4gZXJyb3IsIHRoaXMgd2lsbCBhbHdheXMgZmFpbA0KPj4gLSBubyBtZW1vcnk6IGZvciBub3cg
SSB3b3VsZCBzYXkgZG8gdGhlIHNhbWUgYXMgaW52YWxpZCBwYXJhbWV0ZXIgd2l0aCBhIGNvbW1l
bnQNCj4+IG1heWJlIGJlY2F1c2Ugd2UgY291bGQgcmV0cnkgYW5kIG1lbW9yeSBjb3VkIGJlIGF2
YWlsYWJsZSBuZXh0IHRpbWUNCj4+IC0gYWJvcnQ6IHN0b3AgYW5kIGxvZyBhbiBlcnJvciwgdGhp
cyBpcyBhIG1ham9yIGZhdWx0IG9uIHRoZSBvdGhlciBzaWRlDQo+PiAtIGRlbmllZDogcmV0cnku
DQo+IA0KPiBJIGFncmVlLCBJJ2xsIHByb3Bvc2Ugc29tZXRoaW5nIGxpa2UgdGhhdCBpbiB0aGUg
djQuDQo+IA0KPj4gDQo+Pj4gKyAgICAgICAgaWYgKCByZXMgKQ0KPj4+ICsgICAgICAgIHsNCj4+
PiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX0lORk8gIiVwZDogZmZhOiBGYWlsZWQgdG8g
cmVjbGFpbSBoYW5kbGUgJSNseCA6ICVkXG4iLA0KPj4+ICsgICAgICAgICAgICAgICAgICAgZCwg
c2htLT5oYW5kbGUsIHJlcyk7DQo+Pj4gKyAgICAgICAgfQ0KPj4+ICsgICAgICAgIGVsc2UNCj4+
PiArICAgICAgICB7DQo+Pj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfR19ERUJVRyAiJXBk
OiBmZmE6IFJlY2xhaW1lZCBoYW5kbGUgJSNseFxuIiwNCj4+PiArICAgICAgICAgICAgICAgICAg
IGQsIHNobS0+aGFuZGxlKTsNCj4+PiArICAgICAgICAgICAgbGlzdF9kZWwoJnNobS0+bGlzdCk7
DQo+Pj4gKyAgICAgICAgICAgIGZyZWVfZmZhX3NobV9tZW0oZCwgc2htKTsNCj4+PiArICAgICAg
ICB9DQo+Pj4gKyAgICB9DQo+Pj4gK30NCj4+PiArDQo+Pj4gK3N0YXRpYyB2b2lkIGZmYV9kb21h
aW5fdGVhcmRvd25fY29udGludWUoc3RydWN0IGZmYV9jdHggKmN0eCwgYm9vbCBmaXJzdF90aW1l
KQ0KPj4+ICt7DQo+Pj4gKyAgICBzdHJ1Y3QgZmZhX2N0eCAqbmV4dF9jdHggPSBOVUxMOw0KPj4+
ICsNCj4+PiArICAgIHNlbmRfdm1fZGVzdHJveWVkKGN0eC0+dGVhcmRvd25fZCk7DQo+Pj4gKyAg
ICByZWNsYWltX3NobXMoY3R4LT50ZWFyZG93bl9kKTsNCj4+PiArDQo+Pj4gKyAgICBpZiAoIGN0
eC0+c2htX2NvdW50ICkNCj4+PiArICAgIHsNCj4+IA0KPj4gSWYgaSBkbyB1bmRlcnN0YW5kIHJp
Z2h0IHlvdSBvbmx5IHJldHJ5IGlmIHRoZXJlIGFyZSByZW1haW5pbmcgU0hNIHRvIHJlY2xhaW0g
YnV0IHdoYXQNCj4+IGlmIHlvdSBoYXZlIGRlc3Ryb3kgbWVzc2FnZXMgdGhhdCB3ZXJlIG5vdCBz
ZW50IHN1Y2Nlc3NmdWxseSwgc2hvdWxkbid0IHdlIHJlaXRlcmF0ZQ0KPj4gaW4gdGhhdCBjYXNl
IHRvIHNlbmQgdGhlIGRlc3Ryb3kgbWVzc2FnZSBhZ2FpbiA/DQo+IA0KPiBJIGFncmVlLCBJJ2xs
IGZpeC4NCj4gDQo+IENoZWVycywNCj4gSmVucw0KPiANCj4+IA0KPj4+ICsgICAgICAgIHByaW50
ayhYRU5MT0dfR19JTkZPICIlcGQ6IGZmYTogUmVtYWluaW5nIHVuY2xhaW1lZCBoYW5kbGVzLCBy
ZXRyeWluZ1xuIiwgY3R4LT50ZWFyZG93bl9kKTsNCj4+PiArDQo+Pj4gKyAgICAgICAgY3R4LT50
ZWFyZG93bl9leHBpcmUgPSBOT1coKSArIEZGQV9DVFhfVEVBUkRPV05fREVMQVk7DQo+Pj4gKw0K
Pj4+ICsgICAgICAgIHNwaW5fbG9jaygmZmZhX3RlYXJkb3duX2xvY2spOw0KPj4+ICsgICAgICAg
IGxpc3RfYWRkX3RhaWwoJmN0eC0+dGVhcmRvd25fbGlzdCwgJmZmYV90ZWFyZG93bl9oZWFkKTsN
Cj4+PiArICAgICAgICAvKiBOZWVkIHRvIHNldCBhIG5ldyB0aW1lciBmb3IgdGhlIG5leHQgY3R4
IGluIGxpbmUgKi8NCj4+PiArICAgICAgICBuZXh0X2N0eCA9IGxpc3RfZmlyc3RfZW50cnkoJmZm
YV90ZWFyZG93bl9oZWFkLCBzdHJ1Y3QgZmZhX2N0eCwNCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdGVhcmRvd25fbGlzdCk7DQo+Pj4gKyAgICAgICAgc3Bpbl91bmxv
Y2soJmZmYV90ZWFyZG93bl9sb2NrKTsNCj4+PiArICAgIH0NCj4+PiArICAgIGVsc2UNCj4+PiAg
ICB7DQo+Pj4gICAgICAgIC8qDQo+Pj4gLSAgICAgICAgICogU2tpcCBTUHMgc3Vic2NyaWJlZCB0
byB0aGUgVk0gY3JlYXRlZCBldmVudCB0aGF0IG5ldmVyIHdhcw0KPj4+IC0gICAgICAgICAqIG5v
dGlmaWVkIG9mIHRoZSBWTSBjcmVhdGlvbiBkdWUgdG8gYW4gZXJyb3IgZHVyaW5nDQo+Pj4gLSAg
ICAgICAgICogZmZhX2RvbWFpbl9pbml0KCkuDQo+Pj4gKyAgICAgICAgICogZG9tYWluX2Rlc3Ry
b3koKSBtaWdodCBoYXZlIGJlZW4gY2FsbGVkICh2aWEgcHV0X2RvbWFpbigpIGluDQo+Pj4gKyAg
ICAgICAgICogcmVjbGFpbV9zaG1zKCkpLCBzbyB3ZSBjYW4ndCB0b3VjaCB0aGUgZG9tYWluIHN0
cnVjdHVyZSBhbnltb3JlLg0KPj4+ICAgICAgICAgKi8NCj4+PiAtICAgICAgICBpZiAoIGlzX2lu
X3N1YnNjcl9saXN0KHN1YnNjcl92bV9jcmVhdGVkLCBjdHgtPmNyZWF0ZV9zaWduYWxfY291bnQs
DQo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdWJzY3Jfdm1fY3JlYXRlZF9j
b3VudCwNCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN1YnNjcl92bV9kZXN0
cm95ZWRbbl0pICkNCj4+PiAtICAgICAgICAgICAgY29udGludWU7DQo+Pj4gKyAgICAgICAgeGZy
ZWUoY3R4KTsNCj4+PiANCj4+PiAtICAgICAgICByZXMgPSBmZmFfZGlyZWN0X3JlcV9zZW5kX3Zt
KHN1YnNjcl92bV9kZXN0cm95ZWRbbl0sIGdldF92bV9pZChkKSwNCj4+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEZGQV9NU0dfU0VORF9WTV9ERVNUUk9ZRUQpOw0KPj4+
IC0NCj4+PiAtICAgICAgICBpZiAoIHJlcyApDQo+Pj4gLSAgICAgICAgICAgIHByaW50ayhYRU5M
T0dfRVJSICJmZmE6IEZhaWxlZCB0byByZXBvcnQgZGVzdHJ1Y3Rpb24gb2Ygdm1faWQgJXUgdG8g
ICV1OiByZXMgJWRcbiIsDQo+Pj4gLSAgICAgICAgICAgICAgICAgICBnZXRfdm1faWQoZCksIHN1
YnNjcl92bV9kZXN0cm95ZWRbbl0sIHJlcyk7DQo+Pj4gKyAgICAgICAgLyogT25seSBjaGVjayBp
ZiB0aGVyZSBoYXMgYmVlbiBhIGNoYW5nZSB0byB0aGUgdGVhcmRvd24gcXVldWUgKi8NCj4+PiAr
ICAgICAgICBpZiAoICFmaXJzdF90aW1lICkNCj4+PiArICAgICAgICB7DQo+Pj4gKyAgICAgICAg
ICAgIHNwaW5fbG9jaygmZmZhX3RlYXJkb3duX2xvY2spOw0KPj4+ICsgICAgICAgICAgICBuZXh0
X2N0eCA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmZmZhX3RlYXJkb3duX2hlYWQsDQo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBm
ZmFfY3R4LCB0ZWFyZG93bl9saXN0KTsNCj4+PiArICAgICAgICAgICAgc3Bpbl91bmxvY2soJmZm
YV90ZWFyZG93bl9sb2NrKTsNCj4+PiArICAgICAgICB9DQo+Pj4gICAgfQ0KPj4+IA0KPj4+ICsg
ICAgaWYgKCBuZXh0X2N0eCApDQo+Pj4gKyAgICAgICAgc2V0X3RpbWVyKCZmZmFfdGVhcmRvd25f
dGltZXIsIG5leHRfY3R4LT50ZWFyZG93bl9leHBpcmUpOw0KPj4+ICt9DQo+Pj4gKw0KPj4+ICtz
dGF0aWMgdm9pZCBmZmFfdGVhcmRvd25fdGltZXJfY2FsbGJhY2sodm9pZCAqYXJnKQ0KPj4+ICt7
DQo+Pj4gKyAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4Ow0KPj4+ICsNCj4+PiArICAgIHNwaW5fbG9j
aygmZmZhX3RlYXJkb3duX2xvY2spOw0KPj4+ICsgICAgY3R4ID0gbGlzdF9maXJzdF9lbnRyeV9v
cl9udWxsKCZmZmFfdGVhcmRvd25faGVhZCwgc3RydWN0IGZmYV9jdHgsDQo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVhcmRvd25fbGlzdCk7DQo+Pj4gKyAgICBpZiAo
IGN0eCApDQo+Pj4gKyAgICAgICAgbGlzdF9kZWwoJmN0eC0+dGVhcmRvd25fbGlzdCk7DQo+Pj4g
KyAgICBzcGluX3VubG9jaygmZmZhX3RlYXJkb3duX2xvY2spOw0KPj4+ICsNCj4+PiArICAgIGlm
ICggY3R4ICkNCj4+PiArICAgICAgICBmZmFfZG9tYWluX3RlYXJkb3duX2NvbnRpbnVlKGN0eCwg
ZmFsc2UgLyogIWZpcnN0X3RpbWUgKi8pOw0KPj4+ICsgICAgZWxzZQ0KPj4+ICsgICAgICAgIHBy
aW50ayhYRU5MT0dfR19FUlIgIiVzOiB0ZWFyZG93biBsaXN0IGlzIGVtcHR5XG4iLCBfX2Z1bmNf
Xyk7DQo+Pj4gK30NCj4+PiArDQo+Pj4gKy8qIFRoaXMgZnVuY3Rpb24gaXMgc3VwcG9zZWQgdG8g
dW5kbyB3aGF0IGZmYV9kb21haW5faW5pdCgpIGhhcyBkb25lICovDQo+Pj4gK3N0YXRpYyBpbnQg
ZmZhX2RvbWFpbl90ZWFyZG93bihzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+ICt7DQo+Pj4gKyAgICBz
dHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+Pj4gKw0KPj4+ICsgICAgaWYgKCAh
Y3R4ICkNCj4+PiArICAgICAgICByZXR1cm4gMDsNCj4+PiArDQo+Pj4gICAgaWYgKCBjdHgtPnJ4
ICkNCj4+PiAgICAgICAgcnh0eF91bm1hcChjdHgpOw0KPj4+IA0KPj4+IC0gICAgWEZSRUUoZC0+
YXJjaC50ZWUpOw0KPj4+ICsgICAgZmZhX2RvbWFpbl90ZWFyZG93bl9jb250aW51ZShjdHgsIHRy
dWUgLyogZmlyc3RfdGltZSAqLyk7DQo+Pj4gDQo+Pj4gICAgcmV0dXJuIDA7DQo+Pj4gfQ0KPj4+
IEBAIC0xNzM5LDYgKzE4OTEsOSBAQCBzdGF0aWMgYm9vbCBmZmFfcHJvYmUodm9pZCkNCj4+PiAg
ICBpZiAoICFpbml0X3NwcygpICkNCj4+PiAgICAgICAgZ290byBlcnJfZnJlZV9mZmFfdHg7DQo+
Pj4gDQo+Pj4gKyAgICBJTklUX0xJU1RfSEVBRCgmZmZhX3RlYXJkb3duX2hlYWQpOw0KPj4+ICsg
ICAgaW5pdF90aW1lcigmZmZhX3RlYXJkb3duX3RpbWVyLCBmZmFfdGVhcmRvd25fdGltZXJfY2Fs
bGJhY2ssIE5VTEwsIDApOw0KPj4+ICsNCj4+PiAgICByZXR1cm4gdHJ1ZTsNCj4+PiANCj4+PiBl
cnJfZnJlZV9mZmFfdHg6DQo+Pj4gLS0NCj4+PiAyLjM0LjENCj4+PiANCj4+IA0KPj4gUmVnYXJk
cw0KPj4gQmVydHJhbmQNCg0KDQo=

