Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2042EF18
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210272.367058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKlp-00012S-S3; Fri, 15 Oct 2021 10:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210272.367058; Fri, 15 Oct 2021 10:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKlp-00010f-Ow; Fri, 15 Oct 2021 10:49:01 +0000
Received: by outflank-mailman (input) for mailman id 210272;
 Fri, 15 Oct 2021 10:49:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbKlo-00010Z-2h
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:49:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 397c752a-c966-4d99-8077-3edafb911e4c;
 Fri, 15 Oct 2021 10:48:58 +0000 (UTC)
Received: from AS8P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::13)
 by AM6PR08MB3638.eurprd08.prod.outlook.com (2603:10a6:20b:4b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 10:48:55 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::b1) by AS8P251CA0014.outlook.office365.com
 (2603:10a6:20b:2f2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Fri, 15 Oct 2021 10:48:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 10:48:55 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Fri, 15 Oct 2021 10:48:54 +0000
Received: from 547183e437cd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D61BA5C5-E70F-48D8-BE07-FD7F077CDBDB.1; 
 Fri, 15 Oct 2021 10:48:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 547183e437cd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 10:48:44 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DBAPR08MB5832.eurprd08.prod.outlook.com (2603:10a6:10:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 10:48:41 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 10:48:41 +0000
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
X-Inumbo-ID: 397c752a-c966-4d99-8077-3edafb911e4c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5k/MxR6zlKA0Y4QlMCek+MtrBmbslaomLUm1a9BGVmE=;
 b=pG8tGfQ3xrN2YpD3vCLQKYkyDoj6d7C2yrmMiWVi/+bKRVC8S89ebO37GlIOuIW21obFRZq9Dmx2qhtVeMaUQrWRddhiRYMLIKmPG0nNbVERP+/o8gSuyeDcvqLzPcUE+SPQX3/pi83kd2GMfauuEIoO8y7ZJCg/GBwzfYtmKPk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8a5b23081f44577
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkA8VoAkNoAXpTAOEJDzEpqmOfZVg5T1izTASD3PQl6dIVCoSIB0hk4Ld+FNcCpS8u/l6B+cNVbW3XEbgtgBGHY/zfn9qSX+NvxI9I5bUulpESKki0O5n7ITXyHoBhkjS7oTnbGCeH/aQXlOmQ4MWyg3Ct+11BKPb6L209ojifyd43jZCKk3fyQivzbEKYTDLJtWY082p67lDxU/mZ7HiLbIBn6VC6IH//tAWEX+FoIyH64Su+IaVuu3uBFW9dgUINrC64DMixRhgJlJ87ppKICGeVPta0GEklAXQ61b1kJXY7y6FGj+z29aTYuoFrYQ2D7bSCCY5qjaqODYwsHlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5k/MxR6zlKA0Y4QlMCek+MtrBmbslaomLUm1a9BGVmE=;
 b=XV5wqfXFf2EF37HJYfr02AIRLobDjhxfcGPqr3mUEY6oaqRCG8xVUzLYWTQRmS421hxleK8+0V3n4lVuC716NpG+3V3p/uzAWKri2HFFbcUo8YB36UtuWZTWW7mR5E22OYycgSGLopzyK0Q+CKzbjzUW55agUMjgGUUWodmqEAL8jMvk68noU2xtpyguJLyngCaR7Lnqw+JbvfZtnuuAuueiHqjR8RDiZURkcv5PeV7IqXl++VXn++ltEpel/Kz3AOTJZwmZk/gP7+3/oXpvyCNlxsbEIMpLp9HsYwhlM6MDcX+viT4VH56nrVDp0xXdHd7cpqn2eaMxLR9wubnrEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5k/MxR6zlKA0Y4QlMCek+MtrBmbslaomLUm1a9BGVmE=;
 b=pG8tGfQ3xrN2YpD3vCLQKYkyDoj6d7C2yrmMiWVi/+bKRVC8S89ebO37GlIOuIW21obFRZq9Dmx2qhtVeMaUQrWRddhiRYMLIKmPG0nNbVERP+/o8gSuyeDcvqLzPcUE+SPQX3/pi83kd2GMfauuEIoO8y7ZJCg/GBwzfYtmKPk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index:
 AQHXwQrjS6mPrKT7Q06z3N66FcsDAKvTvGsAgAAWOICAAAj6gIAAApmAgAACGYCAAAIKgA==
Date: Fri, 15 Oct 2021 10:48:41 +0000
Message-ID: <B57498FA-F205-4DC1-ACE0-414558400293@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
 <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
 <1c298c02-5791-8935-f996-516da2409f24@suse.com>
 <BFC005A8-4C72-41C5-93F4-98BB9CBAB198@arm.com>
 <cd81cc31-617c-c750-01f4-b02bcb9e3a9e@suse.com>
In-Reply-To: <cd81cc31-617c-c750-01f4-b02bcb9e3a9e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 14e91714-a797-4ea4-a543-08d98fc96279
x-ms-traffictypediagnostic: DBAPR08MB5832:|AM6PR08MB3638:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3638A7FD49B52D997F9845219DB99@AM6PR08MB3638.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ve17cRra2KjlTVoG4qF2xSI3CwHJFA5cEFRAUM5tyBmfUjONORuySNPn6exk8pPxnC+c+6Sng/eP3Q8tQvmnRPP9Xjrvy30GB7Bzd6X5QpV0HOPXTemx7wxyz2aWZfKkxxr4tRApe0pH2DIXwlg1RLEdGgHDdkHwq58UKX31smYoavLb1NivfhtVLKlHzDx2lHQJAESL8E1OzJ671jHVvHAEJuiw/pXIUOfPcyNGtTx0nNaxQC08By7GnTQiAxkyOMa9xcJsUzJjn9HAptXdYtjqauo5MpeyoVzGW3FKMBEyDS8EpZY6tDpK1llzPoAiz0XP1IzdKe6tL+OvIT/VadSsryJLL3+iSbqstBlRRLiwFzTWY4WidJWDdYmcDx9PvEmcmHTiYkJc7pbVIdksub8vsgYtiZvEcujfkqeoCelegqaczDnlFwJCQLC1No6jymiWuW6U+/o4F2/63LpbXxYuBlacKmniL5VsS21Scg+Mir6bJnYNFyYM17SKCd531nbe27ypunVz7NCWUcVkNOqi+jKShhgC9vQkTFRdfaurVZA4LlaUM/0nmeiyXMqBIO3Y1tqty6wUq9BMilaieh0OHmcdoTIBW+xA7lIAIhNYIGn0QpmprdI/ECCm53D+XnIToUkZUrUse6MA+ei3Tom2jD1HIpKRwI7UyTQ73X+VsdNuC4WTR8JOUVrfhdVcyGadvvvVRPObj5ubr+jaqq5os47guTwhO5+feAo4QjPOKJATKPMWonoMXJJtMTTv
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(91956017)(186003)(7416002)(6916009)(76116006)(54906003)(8936002)(2616005)(26005)(2906002)(36756003)(66946007)(316002)(71200400001)(508600001)(38100700002)(83380400001)(5660300002)(66446008)(64756008)(8676002)(4326008)(38070700005)(122000001)(86362001)(6486002)(53546011)(6506007)(66556008)(33656002)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F8B9D34940CFB46A2492EAEBEB38038@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5832
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b221924-adb7-4319-a079-08d98fc95a5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VXqHFn1XZTnS/ZIPwjsP7mFVv17vlJ13ozbN4lnF7lKsD+kZI+Xx1f3dM5wj3xYjXC1xKFJGWDOSpCiqaayi+RVkq1Y6FGOyWDjzAtNcatRzUxL2rEMXvCGjLI074K2Cte9i1hLasRfxmA8DVkZGC19bcggixaxHOGpaDFpUIF50YufLr7+VvwRM/ya6SQS0pEIUrnxp4LGBZgNhScx0QsmMUqUsqgiD4vkewYnHqHFTFt3VWA3sbE3MR2DmRJ1QOnEy4jVaZcFN0pYgfUGi8ZvTA/hKT6smsiOPiv7pRMoL3jp6nRva2D1j2Srdb2Z/DjED2DfnVv8OKSuKQVNPvV/HrHD0HLClj8viEmecQstq6ew493Jog0U13sMCjVV9JhvbfGNM5w1gKxJXfyCxT305XAk+T0nP7q3E9eJQi6LOzZ/eDL/tj56kH1QPSHhk30mcdyR2TxZWHgIJcrxYU/Q0IZt1K41uBsHrcdIo3Qdx2s/uKHdJCN3y7BXehKCt98I5iqkCnYLq9zKhSaHvDPcWuXq73un3F3mN3k5NcPZ2Ahm7dirmnC/HeWs6Qsx2iE3ac/9IrnKu7DS8/f20vpxPlcQZkE7/IiyPCgM5dcjTP9evmPTDaiFTbwfIpWM0E6Dvjp47uBlJBvnCyzjJ9yjUOQnDJiHwq14pmXZaGdUaiN1egGGCjMZBemV/wRuGYTMcA8uH4OZAKPXQwdfUkA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6512007)(8676002)(26005)(54906003)(70586007)(336012)(356005)(36860700001)(36756003)(33656002)(6506007)(83380400001)(70206006)(2906002)(107886003)(6862004)(186003)(81166007)(4326008)(6486002)(5660300002)(82310400003)(47076005)(2616005)(8936002)(316002)(86362001)(508600001)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:48:55.1944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e91714-a797-4ea4-a543-08d98fc96279
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3638

SGkgSmFuLA0KDQo+IE9uIDE1IE9jdCAyMDIxLCBhdCAxMTo0MSwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE1LjEwLjIwMjEgMTI6MzMsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMTUgT2N0IDIwMjEsIGF0IDExOjI0LCBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IE9uIDE1LjEwLjIwMjEgMTE6NTIsIEJl
cnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+PiBPbiAxNSBPY3QgMjAyMSwgYXQgMDk6MzIsIFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4+IE9uIFRo
dSwgT2N0IDE0LCAyMDIxIGF0IDAzOjQ5OjUwUE0gKzAxMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3Jv
dGU6DQo+Pj4+Pj4gQEAgLTc1Miw2ICs3NTIsMTkgQEAgaW50IHBjaV9hZGRfZGV2aWNlKHUxNiBz
ZWcsIHU4IGJ1cywgdTggZGV2Zm4sDQo+Pj4+Pj4gDQo+Pj4+Pj4gICBjaGVja19wZGV2KHBkZXYp
Ow0KPj4+Pj4+IA0KPj4+Pj4+ICsjaWZkZWYgQ09ORklHX0FSTQ0KPj4+Pj4+ICsgICAgLyoNCj4+
Pj4+PiArICAgICAqIE9uIEFSTSBQQ0kgZGV2aWNlcyBkaXNjb3Zlcnkgd2lsbCBiZSBkb25lIGJ5
IERvbTAuIEFkZCB2cGNpIGhhbmRsZXIgd2hlbg0KPj4+Pj4+ICsgICAgICogRG9tMCBpbmZvcm0g
WEVOIHRvIGFkZCB0aGUgUENJIGRldmljZXMgaW4gWEVOLg0KPj4+Pj4+ICsgICAgICovDQo+Pj4+
Pj4gKyAgICByZXQgPSB2cGNpX2FkZF9oYW5kbGVycyhwZGV2KTsNCj4+Pj4+PiArICAgIGlmICgg
cmV0ICkNCj4+Pj4+PiArICAgIHsNCj4+Pj4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAi
U2V0dXAgb2YgdlBDSSBmYWlsZWQ6ICVkXG4iLCByZXQpOw0KPj4+Pj4+ICsgICAgICAgIGdvdG8g
b3V0Ow0KPj4+Pj4+ICsgICAgfQ0KPj4+Pj4+ICsjZW5kaWYNCj4+Pj4+IA0KPj4+Pj4gSSB0aGlu
ayB2cGNpX2FkZF9oYW5kbGVycyBzaG91bGQgYmUgY2FsbGVkIGFmdGVyIGNoZWNraW5nIHRoYXQN
Cj4+Pj4+IHBkZXYtPmRvbWFpbiBpcyAhPSBOVUxMLCBzbyBJIHdvdWxkIG1vdmUgdGhpcyBjaHVu
ayBhIGJpdCBiZWxvdy4NCj4+Pj4gDQo+Pj4+IE9uIGFybSB0aGlzIHdvdWxkIHByZXZlbnQgdGhl
IGRvbTBsZXNzIHVzZSBjYXNlIG9yIHRvIGhhdmUgdGhlIFBDSQ0KPj4+PiBidXMgZW51bWVyYXRl
ZCBmcm9tIGFuIG90aGVyIGRvbWFpbi4NCj4+Pj4gQG9sZWtzYW5kcjogY2FuIHlvdSBjb21tZW50
IG9uIHRoaXMgb25lLCB5b3UgbWlnaHQgaGF2ZSBhIGJldHRlcg0KPj4+PiBhbnN3ZXIgdGhhbiBt
ZSBvbiB0aGlzID8NCj4+PiANCj4+PiBXZWxsLCB3aXRob3V0IFhlbiBkb2luZyB0aGUgZW51bWVy
YXRpb24sIHNvbWUgb3RoZXIgZW50aXR5IHdvdWxkIG5lZWQNCj4+PiB0byBkbyBzbywgaW5jbHVk
aW5nIHRoZSByZXBvcnRpbmcgdG8gWGVuLiBPYnZpb3VzbHkgd2l0aG91dCBhIERvbTAgaXQNCj4+
PiB3b3VsZCBiZSBhbWJpZ3VvdXMgd2hpY2ggZG9tYWluIHRvIGFzc2lnbiB0aGUgZGV2aWNlIHRv
OyBwZXJoYXBzIGl0DQo+Pj4gc2hvdWxkIGJlIHRoZSBjYWxsZXIgaW4gdGhpcyBjYXNlPyBUaGF0
IHdvdWxkIG1ha2UgdGhhdCBjYWxsZXIgZG9tYWluDQo+Pj4gYSBwc2V1ZG8taHdkb20gdGhvdWdo
LCBhcyBmYXIgYXMgUENJIGlzIGNvbmNlcm5lZCwgd2hpY2ggbWF5IG5vdCBiZQ0KPj4+IGRlc2ly
YWJsZSBhY2NvcmRpbmcgdG8gbXkgKGxpbWl0ZWQpIHVuZGVyc3RhbmRpbmcgb2YgZG9tMGxlc3Mu
DQo+PiANCj4+IFRoaXMgaXMgbm90IHJlYWxseSByZWxhdGVkIHRvIHRoaXMgcGF0Y2ggYnV0IHRo
ZSBwbGFuIGlzIHRoZSBmb2xsb3dpbmc6DQo+PiAtIGVudW1lcmF0aW9uIHdvdWxkIGhhdmUgdG8g
YmUgZG9uZSBieSB0aGUgZmlybXdhcmUgb3IgYm9vdCBsb2FkZXIgYmVmb3JlDQo+PiAtIHhlbiB3
aWxsIGhhdmUgc29tZSBjb2RlIHRvIGRldGVjdCBQQ0kgZGV2aWNlcw0KPj4gLSBkb20wbGVzcyBj
YW4gYmUgdXNlZCB0byBhc3NpZ24gUENJIGRldmljZXMgdG8gZ3Vlc3QNCj4+IA0KPj4gQW55d2F5
IGRvZXMgbm90IGNoYW5nZSB0aGUgZmFjdCB0aGF0IHRoaXMgbXVzdCBiZSBjYWxsZWQgd2hlbiBk
b21haW4gaXMNCj4+IG5vdCBOVUxMIGFuZCBJIHdpbGwgZml4IHRoYXQuDQo+IA0KPiBTaW5jZSB3
ZSBub3cgYWxsIHNlZW0gdG8gYWdyZWUgdGhhdCB0aGUgTlVMTCB3b3VsZCBoYXZlIGJlZW4gYSBw
cm9ibGVtLA0KPiBtYXkgSSBhc2sgaW4gaG93IGZhciBhbnkgb2YgdGhpcyBoYXMgYWN0dWFsbHkg
YmVlbiB0ZXN0ZWQ/DQoNCldpdGggdGhlIHdob2xlIHNlcmllIGN1cnJlbnRseSBvbiBnaXRsYWIg
d2UgaGF2ZSBleHRlbnNpdmVseSB0ZXN0ZWQgcGFzc2luZw0KdGhyb3VnaCBQQ0kgZGV2aWNlcyBv
biBBcm0gaW4gc2V2ZXJhbCBjb25maWd1cmF0aW9uIChudW1iZXIgb2YgZGV2aWNlLCBNU0ksDQpN
U0ktWCkgYW5kIGNoZWNrIHRoYXQgUENJIHdhcyBzdGlsbCBmdW5jdGlvbmFsIG9uIHg4Ni4NCg0K
V2l0aCB0aGUgcGF0Y2hlcyBwdXNoZWQgdG8gWGVuIHJpZ2h0IG5vdyBpdCB3YXMgY2hlY2tlZCB0
aGF0Og0KLSB4ZW4gY29tcGlsZXMgcHJvcGVybHkgb24gYXJtMzIsIGFybTY0IGFuZCB4ODYNCi0g
eGVuIGNvbXBpbGVzIHByb3Blcmx5IHdpdGggVlBDSSBhY3RpdmF0ZWQgKHVzaW5nIGEgcGF0Y2gp
IG9uIGFybTMyIGFuZCBhcm02NA0KLSB4ZW4gb24geDg2IGlzIGZ1bmN0aW9ubmFsICh1c2luZyBi
YXNpYyB0ZXN0IG9uIFFFTVUpDQotIHhlbiBvbiBhcm02NCBpcyBmdW5jdGlvbm5hbCAod2l0aCBz
b21lIGV4dGVuc2l2ZSB0ZXN0cyBvbiBkaWZmZXJlbnQgdGFyZ2V0cykNCg0KV2UgYXJlIG9ubHkg
bGFja2luZyBzb21lIGFjdHVhbCB0ZXN0aW5nIG9uIGFybTMyIGludGVybmFsbHkuDQoNClJlZ2Fy
ZHMNCkJlcnRyYW5kDQoNCj4gDQo+IEphbg0KDQo=

