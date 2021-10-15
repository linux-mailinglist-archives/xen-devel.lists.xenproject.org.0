Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E642EF62
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 13:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210312.367131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbL4r-0005YP-N8; Fri, 15 Oct 2021 11:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210312.367131; Fri, 15 Oct 2021 11:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbL4r-0005VD-JJ; Fri, 15 Oct 2021 11:08:41 +0000
Received: by outflank-mailman (input) for mailman id 210312;
 Fri, 15 Oct 2021 11:08:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbL4p-0005V7-Cq
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 11:08:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f5adc2a-2da8-11ec-822d-12813bfff9fa;
 Fri, 15 Oct 2021 11:08:38 +0000 (UTC)
Received: from AS9PR06CA0346.eurprd06.prod.outlook.com (2603:10a6:20b:466::21)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 15 Oct
 2021 11:08:35 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::b4) by AS9PR06CA0346.outlook.office365.com
 (2603:10a6:20b:466::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 11:08:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 11:08:34 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Fri, 15 Oct 2021 11:08:34 +0000
Received: from e373e520409d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DA9D597-A330-472F-860B-0FFC068C92CC.1; 
 Fri, 15 Oct 2021 11:08:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e373e520409d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 11:08:25 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0801MB1752.eurprd08.prod.outlook.com (2603:10a6:4:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 11:08:21 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 11:08:21 +0000
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
X-Inumbo-ID: 3f5adc2a-2da8-11ec-822d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g18dRfe0rAE1Y4oxUgsZksq/0G8W9ja82v7QyJjxzbM=;
 b=gio1GJSuz+jmBXBDd/7qFoeGAijV8KLkudUyYB0do0TzO0Pu9MEw0nhlbFSwFbvhg1/aD058sdCJdQAnT+vaEDF+NJTh/LaAJIwpodUqFJ6n5QRLgaXyzEAWu+5uRrQT7wAPraiYpX/49GBwSIn/zm3AMkkXxR6SKpCZxT2FTug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a9ae4a556265743
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=co9QSp+CdEaVmT70fShMNt1pBRK47mIMKIcA//xVYCUAv5mCX8mEcaw9IUaH2j4S22jKcO7DhfmZZN8eRAT35E2y9tFap0mHvYzLgpw5QhLp/eIWrREfSSbB49+hqHSYs/5u7ZWkEH7fUTcJ6RO36ePKrZsy90jeDGRhUFnBc8boBG6lgwvUVFGL//pYR9JSEoFg4ze5MOLYN3w8yyFBMsHisJrou3SRrAKhzGNfNdEOFYINQA8km9GzAGAwBAi5+UazY7KZgGVA9lMyC2RXduMKcZh0NMdBmhEleSzZtFBoY7mkDwOU2W2ktrfkLf1hxjXJHV+nOCWNGL07iSWBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g18dRfe0rAE1Y4oxUgsZksq/0G8W9ja82v7QyJjxzbM=;
 b=hpSGSQTLNeFsP89oX+OT/7tGPiqbfOXibTd4OlAXyAQRbcRpBBjGjQ0rUwJCHdGz2UFgKP1KAfCUr9LETUS4OqYM3LHyO6VdGVKzWDRasE5PsRW6rixQg9M0VP3CYwprSYukq8Vb5j27J2UJ5thkvbmQmcPYhBD27gFAyP4zeyi1l5eN4AgRlZNpG09llop//BwE4AziuFw1C+w2ZxFlDzVCtUoFSopOwh5f+vE5fVBtJDMBh++LiHwS7WM9DyZz82QE4oBMtN/u9KGl/NJVRCw7snYhhwQxv+Q4MVdROP+Zn9Hn0+Ny/CuPyzsSIfPRzMWCeEIM/Bgotk19jbsobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g18dRfe0rAE1Y4oxUgsZksq/0G8W9ja82v7QyJjxzbM=;
 b=gio1GJSuz+jmBXBDd/7qFoeGAijV8KLkudUyYB0do0TzO0Pu9MEw0nhlbFSwFbvhg1/aD058sdCJdQAnT+vaEDF+NJTh/LaAJIwpodUqFJ6n5QRLgaXyzEAWu+5uRrQT7wAPraiYpX/49GBwSIn/zm3AMkkXxR6SKpCZxT2FTug=
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
 AQHXwQrjS6mPrKT7Q06z3N66FcsDAKvTvGsAgAAWOICAAAj6gIAAApmAgAACGYCAAAIKgIAAAMIAgAAEuwA=
Date: Fri, 15 Oct 2021 11:08:20 +0000
Message-ID: <E3C75894-EF18-48A8-A5FC-6981DF1DC33E@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
 <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
 <1c298c02-5791-8935-f996-516da2409f24@suse.com>
 <BFC005A8-4C72-41C5-93F4-98BB9CBAB198@arm.com>
 <cd81cc31-617c-c750-01f4-b02bcb9e3a9e@suse.com>
 <B57498FA-F205-4DC1-ACE0-414558400293@arm.com>
 <d6c2efde-d22a-4d57-63c3-5522f9485188@suse.com>
In-Reply-To: <d6c2efde-d22a-4d57-63c3-5522f9485188@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 59e7537b-c9cf-4a70-5ec5-08d98fcc2178
x-ms-traffictypediagnostic: DB6PR0801MB1752:|AS8PR08MB6280:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB62807204607D7742CC72A9A19DB99@AS8PR08MB6280.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Jxra1oQlgJqbN7vIQrRMm97ux/+OLiPLQaUDqhL6sEv64whs2XgwTLc4601dH72StD+SVO5WZf+8pSiVNGAfOUVCRyD/fNeLtLhq2mVlKQn201G/DVmv//zueTgKvbAP/cmV6gDx5osSAo9R//k6rWxP6l3AOgbOKgT6nRfaWeCDXVdWpdyFHIiMlsFj8UNVzyzXTwTGIlSmfv8FLJhdojciLlpH3qOUtTCrurucVDnIlueQu7n/yaTDEtFub87lgZyJQBrTZEcZP5S2aTZ4DiNqBUfPOyRw7XJegepYxim9zy9OwxnMFjQyvo1k4XlpLFXWa3cRvQP669NHSFU9lB+t08ZGWoBuHzVsHCNSwLPXha6KUV7COeLykJm5MZM9e1irlyTpoj0S9dC44hsUMkvRjuR0XeGDnW59/JOEZ80E01wW0kt0Eucq00KhCNd/XsAk0X8zbZApsrLdH1KCEc/Mm2KWgVERa9xAxqDvD2oavS70A06hQLdXyryhknmwI6dC5+UBF7L02hsyQuC0OjS1KqfaVWC1WEx9fILOBpAbHaHS8RIcWCwfb3WCwR9J+2IdCumI29GcqrvPoRJtuVr9uhrfI8eZuAtVbLSyPjLxXBf1LuLRtYVlO/QAVSdU6mTmA7uuLD8scBtE2EnzN7gOnoV+hJQlSj/ih1dPKzI+ldG09gKWeYJTGG9lZo3U4pjSvtEBHkk+ImLYLggdOp1TKNwDobt3IvwGURAbXHhW8Qq11pg0rNbQ8oV/vuyf
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(26005)(6916009)(2906002)(66446008)(66476007)(186003)(64756008)(66556008)(76116006)(71200400001)(508600001)(2616005)(316002)(91956017)(5660300002)(86362001)(7416002)(8936002)(6486002)(6512007)(4326008)(8676002)(54906003)(38070700005)(36756003)(6506007)(53546011)(122000001)(38100700002)(33656002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AB6E3D7C702034AA4F36CC924FF7E09@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1752
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26bf74f6-c487-4f21-c9c1-08d98fcc194a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2fh45KG577u5AmffKkEkpg6GqbqxRkoceR1uSDB2+LTtAChaBo9zwOlrL+3fW7q0k3ayMSpdtN5vIPFtuxzw/0+Ky5aVamWULSJytcz38AiePGlor+aMi46Bp4gcMZ8tB10ffM9f7MNhZFcBfvA8Zk6S8glcIyA399j3aycG6rOES3efrUpkW5oxBMR1pJx+EptHID0SlkZkEYXw6jxeeRD7z6RArnhp8ktuvDJ2oKbDP0rQqH5sAfN+BdUb9JvlTSHvcTXJNKGq+5oX6guVQp6G39SWOlI/tuKtm55bBTZFkCkOSr1z8pKgu4x+GGpgCXwWPcdtF001ATolj3kTsCLyFpc7AkygVvZhEiLYjHtgFdVG2E1CD6x8T0zM5JYGHNRuwbL1ImXMGTY88rw95ONSDQNkMgT0eHJXDbXtKXNtsnlCdkJrnB06vQL+Yxk3CYsA7h5kSPpYQWyy7DuBqvaGW+Z9y4rldhG7m7/SdTTVeibJSzN6T+TVaACOdKgmFGK3s5xVQGu/v3Sv1Nz0C8spyEv6US0een6FzBV1S3+c50u1shXkgJ5g/3hNc7Gfzdw4+ImGnD5pJIVe0Z6sIMSTKhsm1aNWJ1C/21z8EutukDgRkcuzpTCEiaN/3jX4rSJdCWu+G7T7SPvm1RBXJhmT124VJgbNnLn6rsvYrYiM7a9T0TV/2scQquLRZWuhsJHMQBvucbVD8mjWk1rVkQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(356005)(70586007)(70206006)(186003)(508600001)(53546011)(26005)(6862004)(6486002)(4326008)(107886003)(6512007)(54906003)(316002)(5660300002)(82310400003)(336012)(36756003)(47076005)(86362001)(83380400001)(6506007)(2616005)(8676002)(36860700001)(33656002)(2906002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 11:08:34.6663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e7537b-c9cf-4a70-5ec5-08d98fcc2178
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280

SGksDQoNCj4gT24gMTUgT2N0IDIwMjEsIGF0IDExOjUxLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTUuMTAuMjAyMSAxMjo0OCwgQmVydHJhbmQgTWFy
cXVpcyB3cm90ZToNCj4+IEhpIEphbiwNCj4+IA0KPj4+IE9uIDE1IE9jdCAyMDIxLCBhdCAxMTo0
MSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAx
NS4xMC4yMDIxIDEyOjMzLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4gT24gMTUgT2N0
IDIwMjEsIGF0IDExOjI0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0K
Pj4+Pj4gT24gMTUuMTAuMjAyMSAxMTo1MiwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+
Pj4gT24gMTUgT2N0IDIwMjEsIGF0IDA5OjMyLCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+Pj4+IE9uIFRodSwgT2N0IDE0LCAyMDIxIGF0IDAzOjQ5
OjUwUE0gKzAxMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4+PiBAQCAtNzUyLDYg
Kzc1MiwxOSBAQCBpbnQgcGNpX2FkZF9kZXZpY2UodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwN
Cj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gIGNoZWNrX3BkZXYocGRldik7DQo+Pj4+Pj4+PiANCj4+Pj4+
Pj4+ICsjaWZkZWYgQ09ORklHX0FSTQ0KPj4+Pj4+Pj4gKyAgICAvKg0KPj4+Pj4+Pj4gKyAgICAg
KiBPbiBBUk0gUENJIGRldmljZXMgZGlzY292ZXJ5IHdpbGwgYmUgZG9uZSBieSBEb20wLiBBZGQg
dnBjaSBoYW5kbGVyIHdoZW4NCj4+Pj4+Pj4+ICsgICAgICogRG9tMCBpbmZvcm0gWEVOIHRvIGFk
ZCB0aGUgUENJIGRldmljZXMgaW4gWEVOLg0KPj4+Pj4+Pj4gKyAgICAgKi8NCj4+Pj4+Pj4+ICsg
ICAgcmV0ID0gdnBjaV9hZGRfaGFuZGxlcnMocGRldik7DQo+Pj4+Pj4+PiArICAgIGlmICggcmV0
ICkNCj4+Pj4+Pj4+ICsgICAgew0KPj4+Pj4+Pj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIg
IlNldHVwIG9mIHZQQ0kgZmFpbGVkOiAlZFxuIiwgcmV0KTsNCj4+Pj4+Pj4+ICsgICAgICAgIGdv
dG8gb3V0Ow0KPj4+Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pj4+IA0KPj4+
Pj4+PiBJIHRoaW5rIHZwY2lfYWRkX2hhbmRsZXJzIHNob3VsZCBiZSBjYWxsZWQgYWZ0ZXIgY2hl
Y2tpbmcgdGhhdA0KPj4+Pj4+PiBwZGV2LT5kb21haW4gaXMgIT0gTlVMTCwgc28gSSB3b3VsZCBt
b3ZlIHRoaXMgY2h1bmsgYSBiaXQgYmVsb3cuDQo+Pj4+Pj4gDQo+Pj4+Pj4gT24gYXJtIHRoaXMg
d291bGQgcHJldmVudCB0aGUgZG9tMGxlc3MgdXNlIGNhc2Ugb3IgdG8gaGF2ZSB0aGUgUENJDQo+
Pj4+Pj4gYnVzIGVudW1lcmF0ZWQgZnJvbSBhbiBvdGhlciBkb21haW4uDQo+Pj4+Pj4gQG9sZWtz
YW5kcjogY2FuIHlvdSBjb21tZW50IG9uIHRoaXMgb25lLCB5b3UgbWlnaHQgaGF2ZSBhIGJldHRl
cg0KPj4+Pj4+IGFuc3dlciB0aGFuIG1lIG9uIHRoaXMgPw0KPj4+Pj4gDQo+Pj4+PiBXZWxsLCB3
aXRob3V0IFhlbiBkb2luZyB0aGUgZW51bWVyYXRpb24sIHNvbWUgb3RoZXIgZW50aXR5IHdvdWxk
IG5lZWQNCj4+Pj4+IHRvIGRvIHNvLCBpbmNsdWRpbmcgdGhlIHJlcG9ydGluZyB0byBYZW4uIE9i
dmlvdXNseSB3aXRob3V0IGEgRG9tMCBpdA0KPj4+Pj4gd291bGQgYmUgYW1iaWd1b3VzIHdoaWNo
IGRvbWFpbiB0byBhc3NpZ24gdGhlIGRldmljZSB0bzsgcGVyaGFwcyBpdA0KPj4+Pj4gc2hvdWxk
IGJlIHRoZSBjYWxsZXIgaW4gdGhpcyBjYXNlPyBUaGF0IHdvdWxkIG1ha2UgdGhhdCBjYWxsZXIg
ZG9tYWluDQo+Pj4+PiBhIHBzZXVkby1od2RvbSB0aG91Z2gsIGFzIGZhciBhcyBQQ0kgaXMgY29u
Y2VybmVkLCB3aGljaCBtYXkgbm90IGJlDQo+Pj4+PiBkZXNpcmFibGUgYWNjb3JkaW5nIHRvIG15
IChsaW1pdGVkKSB1bmRlcnN0YW5kaW5nIG9mIGRvbTBsZXNzLg0KPj4+PiANCj4+Pj4gVGhpcyBp
cyBub3QgcmVhbGx5IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCBidXQgdGhlIHBsYW4gaXMgdGhlIGZv
bGxvd2luZzoNCj4+Pj4gLSBlbnVtZXJhdGlvbiB3b3VsZCBoYXZlIHRvIGJlIGRvbmUgYnkgdGhl
IGZpcm13YXJlIG9yIGJvb3QgbG9hZGVyIGJlZm9yZQ0KPj4+PiAtIHhlbiB3aWxsIGhhdmUgc29t
ZSBjb2RlIHRvIGRldGVjdCBQQ0kgZGV2aWNlcw0KPj4+PiAtIGRvbTBsZXNzIGNhbiBiZSB1c2Vk
IHRvIGFzc2lnbiBQQ0kgZGV2aWNlcyB0byBndWVzdA0KPj4+PiANCj4+Pj4gQW55d2F5IGRvZXMg
bm90IGNoYW5nZSB0aGUgZmFjdCB0aGF0IHRoaXMgbXVzdCBiZSBjYWxsZWQgd2hlbiBkb21haW4g
aXMNCj4+Pj4gbm90IE5VTEwgYW5kIEkgd2lsbCBmaXggdGhhdC4NCj4+PiANCj4+PiBTaW5jZSB3
ZSBub3cgYWxsIHNlZW0gdG8gYWdyZWUgdGhhdCB0aGUgTlVMTCB3b3VsZCBoYXZlIGJlZW4gYSBw
cm9ibGVtLA0KPj4+IG1heSBJIGFzayBpbiBob3cgZmFyIGFueSBvZiB0aGlzIGhhcyBhY3R1YWxs
eSBiZWVuIHRlc3RlZD8NCj4+IA0KPj4gV2l0aCB0aGUgd2hvbGUgc2VyaWUgY3VycmVudGx5IG9u
IGdpdGxhYiB3ZSBoYXZlIGV4dGVuc2l2ZWx5IHRlc3RlZCBwYXNzaW5nDQo+PiB0aHJvdWdoIFBD
SSBkZXZpY2VzIG9uIEFybSBpbiBzZXZlcmFsIGNvbmZpZ3VyYXRpb24gKG51bWJlciBvZiBkZXZp
Y2UsIE1TSSwNCj4+IE1TSS1YKSBhbmQgY2hlY2sgdGhhdCBQQ0kgd2FzIHN0aWxsIGZ1bmN0aW9u
YWwgb24geDg2Lg0KPj4gDQo+PiBXaXRoIHRoZSBwYXRjaGVzIHB1c2hlZCB0byBYZW4gcmlnaHQg
bm93IGl0IHdhcyBjaGVja2VkIHRoYXQ6DQo+PiAtIHhlbiBjb21waWxlcyBwcm9wZXJseSBvbiBh
cm0zMiwgYXJtNjQgYW5kIHg4Ng0KPj4gLSB4ZW4gY29tcGlsZXMgcHJvcGVybHkgd2l0aCBWUENJ
IGFjdGl2YXRlZCAodXNpbmcgYSBwYXRjaCkgb24gYXJtMzIgYW5kIGFybTY0DQo+PiAtIHhlbiBv
biB4ODYgaXMgZnVuY3Rpb25uYWwgKHVzaW5nIGJhc2ljIHRlc3Qgb24gUUVNVSkNCj4+IC0geGVu
IG9uIGFybTY0IGlzIGZ1bmN0aW9ubmFsICh3aXRoIHNvbWUgZXh0ZW5zaXZlIHRlc3RzIG9uIGRp
ZmZlcmVudCB0YXJnZXRzKQ0KPiANCj4gQnV0IHNvbWVob3cgaW4gdGhlIHRlc3RpbmcgZG9uZSB5
b3UgbXVzdCBoYXZlIGF2b2lkZWQgdGhlIGNvZGUgcGF0aA0KPiBpbiBxdWVzdGlvbiwgb3IgZWxz
ZSB5b3Ugd291bGQgaGF2ZSBvYnNlcnZlZCBhIGNyYXNoLg0KDQpEZXZpY2VfYWRkIGlzIGFsd2F5
cyBjYWxsZWQgYnkgZG9tMCBzbyB3ZSBkaWQgbm90IGhhdmUgaXNzdWVzIGhlcmUuDQpEb20wbGVz
cyBQQ0kgcGFzc3Rocm91Z2ggaW1wbGVtZW50YXRpb24gaXMgbm90IGRvbmUgcmlnaHQgbm93Lg0K
DQpTbyB5ZXMgd2UgZGlkIG5vdCBnbyB0aHJvdWdoIHRoaXMgcGF0aC4NCg0KQmVydHJhbmQNCg0K
PiANCj4gSmFuDQo+IA0KDQo=

