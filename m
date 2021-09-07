Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41F6402266
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 05:06:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180328.326927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNRRF-0000Zk-Iu; Tue, 07 Sep 2021 03:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180328.326927; Tue, 07 Sep 2021 03:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNRRF-0000X8-Fb; Tue, 07 Sep 2021 03:06:21 +0000
Received: by outflank-mailman (input) for mailman id 180328;
 Tue, 07 Sep 2021 03:06:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNGS=N5=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNRRD-0000X2-NO
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 03:06:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::612])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ae9452c-2b70-4c21-970a-d27f2542b225;
 Tue, 07 Sep 2021 03:06:16 +0000 (UTC)
Received: from DB6PR0601CA0021.eurprd06.prod.outlook.com (2603:10a6:4:7b::31)
 by AM8PR08MB6339.eurprd08.prod.outlook.com (2603:10a6:20b:317::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 03:06:15 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b::4) by DB6PR0601CA0021.outlook.office365.com
 (2603:10a6:4:7b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 03:06:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 03:06:14 +0000
Received: ("Tessian outbound 610b9df843d5:v105");
 Tue, 07 Sep 2021 03:06:14 +0000
Received: from fa98366dd5e0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B5C8ABBC-0598-449B-9455-F5BE0C669D43.1; 
 Tue, 07 Sep 2021 03:06:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa98366dd5e0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Sep 2021 03:06:08 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4318.eurprd08.prod.outlook.com (2603:10a6:803:f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 03:05:50 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 03:05:50 +0000
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
X-Inumbo-ID: 8ae9452c-2b70-4c21-970a-d27f2542b225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRCisFhpggo291C6aobRFvXGwFA/5l47T6YR9tpJq30=;
 b=X6Jg0Q30d77huaZYeQ1swI0vNboAhgy+8r4dLxWetixqgyUlpH58x+Qfq0hjb+mZmeMxCirE1tmu3c01ZxSKc2cXEywbSFo3rlgMkIBC5hfQuzwxX4Dl0194YXNzRqlRteigj/U0CiC5cMunHLb9HmWqX/H7GIGJOnsfoZrm+ec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOqDZk45ztnl5sPmS/exIS4JdOkueecBfm903RmYtWQco20jmhz6LrS7zqMgYLucx4bqa9cllGxH9uBePzwk7JNwGt5veEnPBV3Rbx4zq0JWdWmf3QSS8w68nuACF4yHx+1Rsoa0XYq44EEPdXwP3NP0jTRmC/onE5xn721JuM8MnCHQQW4eBdgQkBHLr8CEhkbpBpW4L2sjjcdFqFzPbmyX0y1Suo0fC9h18lO3bJl0zLEj0B4p9NWUYelmQDv9bF3syfx7oyz8XMl4JWEshNVZARtbsVxWqQJzr+mh0y8URnJVmTCGIenMsd9QQdZytPLbnc5cVKpvmDDz2wpktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uRCisFhpggo291C6aobRFvXGwFA/5l47T6YR9tpJq30=;
 b=jUh+OV2HjmuW8aCK9cDCwGrLCQqZtgf8zda0tA5hAj/rfTqN9YRt0ZghuqxaBa4oqscr6R+YmuQzoGKGQuUQYBAgDYHzjbQiZuiG3LG8mjbdZ4Sex0BNoFilzaOrVkJ/yFfsXl8VGBl7Zv1o8jA3t6SockLmxdolES6/JHqrNxuWDp1XFBRmg10UmszTil5tf/0c4LSRTSN1VT0gOo/F+XVCrdoaznLPc3thipnugI9gTr+/g1RPdtzpGUKmnWhDhmL+FI2x+Uh/Pc7xlLg0buVdH/EDBxAQyjLbfFCzJnqEjjosctXu6utHrqQc6LuUngkRZByAPLGDOxkj77CDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRCisFhpggo291C6aobRFvXGwFA/5l47T6YR9tpJq30=;
 b=X6Jg0Q30d77huaZYeQ1swI0vNboAhgy+8r4dLxWetixqgyUlpH58x+Qfq0hjb+mZmeMxCirE1tmu3c01ZxSKc2cXEywbSFo3rlgMkIBC5hfQuzwxX4Dl0194YXNzRqlRteigj/U0CiC5cMunHLb9HmWqX/H7GIGJOnsfoZrm+ec=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH v5 1/7] xen/arm: introduce new helper
 device_tree_get_meminfo
Thread-Topic: [PATCH v5 1/7] xen/arm: introduce new helper
 device_tree_get_meminfo
Thread-Index: AQHXmM2TtDweULKD40q5wirMZQfui6uO7RIAgAkLAqA=
Date: Tue, 7 Sep 2021 03:05:49 +0000
Message-ID:
 <VE1PR08MB52153FC6C86128102A1A2A05F7D39@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210824095045.2281500-1-penny.zheng@arm.com>
 <20210824095045.2281500-2-penny.zheng@arm.com>
 <06395a17-24fb-35d5-8332-a6ca42dbc183@xen.org>
In-Reply-To: <06395a17-24fb-35d5-8332-a6ca42dbc183@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: ECEF68F408207442B32D4A429459FAB8.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fa26699c-2db9-4240-c0b4-08d971ac742d
x-ms-traffictypediagnostic: VI1PR08MB4318:|AM8PR08MB6339:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB6339FB31B5EB63727D8F6CD7F7D39@AM8PR08MB6339.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1122;OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AAKiH1ZB7CgwbFK/f4sAXCyZ70wABNBj+O8nlddF+0ANu6neF0Atpo11hF7TSbjDIj5w9nC7x2ki5mObY9laC0MWYxYPyXo4igogiHk0BPESBTmWObM8IehwGdFbIl7Hbycxpv9gj8Y0TyD1HaWKwkyybPyfqKfOIHzcC9mT3fHTYbnA9vAk3PRMgJQKVmUT9b12KlOEdsDo8qH6O8HKLbeqxSWiOvPibKps81c1sUMop0hqnr7dKAhWRD2YYuB2IT2bEKuPYWcvGDAvx/T53vtkOfTRF6snQrv9zWlDVNNCBqWH614itB7yg1CSNMgaPpqrIfeMof2/q1C6sCdfr/i8CJ91E/rLISUptpUrnml26SV/PuhnE7LCTnLu/E+R7Ztwu5kfpvXGwWxqQo9pw/cwa2i28I4/PtBKHYBqjshL5l1hD0jxLfJfOWXpgq/YFQV+fV/YCqk3r7xyZ2fY4CqNegaUH12jzRk+GXLoG/beQr5sy/Pv+mB3mT1M14MtC1Kxb6QFKQj6Ern2CW4dGEGUaXRieoAgj7Yy6cpeQihqrJrnEt3RB9SIoG4OpaQdQ1p/5g+YyJ0M/Z19sBjQ2AAKw8TmOX5snVUs4/y+CHppgv07L3QmdmhN6FRnwTzYFy0MtmLmy0uuzWjFBrwveO1uYoWiThaeuOIetymtfkomK+Q0WoVsrOccYWzeXXpN6um+2u9m+KT985uSuZF1pw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(38070700005)(186003)(64756008)(66556008)(66476007)(71200400001)(7696005)(26005)(38100700002)(5660300002)(52536014)(316002)(508600001)(9686003)(86362001)(83380400001)(8676002)(55016002)(76116006)(53546011)(6506007)(4326008)(66946007)(66446008)(33656002)(122000001)(110136005)(54906003)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4318
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8c28562c-8dd3-4b47-da8e-08d971ac657c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nj7zY7ECgQL+EsfUWWc3tgMGn41LW1p7lK2hhv5v6ZEsY11/2mcljdtrOVm1tOJozbXbmRB0iSeI7n/9Qe2JvqHDbk/p/4MEWMPyR4qkbMxmCezJk+7Qva+/57/JWWA0CPhwN0xbgPlHWJEJos+s51+np+7U08DtDO5PMuH2LqVKVed0KwNaJXFrJtOtlX3OX0N7wAjG79/vZQOskOF7O7t7oNv+sVGMu1laji4ynPuZ314pE1B0sEH0OyTUo7hGvlVEdkwOVnuaPBS97IghyTw0NUhbiBhVurKR6RRoh+WC6+DhIqHWNMO8kUEnJVuMVTeNAZLh95tA1EeG/J4rxqc4q8OCjGK3MayBRQNOn75UFcFbbKa2cLw45PxP55TQiV4g8h0eE2RZossW2YeIvoGQknWkecZFls/uvl1z5xsGnC/3+su/12Ogsa5sTTdg3y1LrAD5y++J1wnLr8j50wCPu1JsWfrWHajoSA/LkwktcfqI3Gi35P7mNZNntB/o7mjcvCQyYzNk9QnDNZv3UjPvibMR2/nAuzhQCzuuf/pEwcsKZGKHmuxTzLQ6pg796Wg7EOCdjuRnnJ+RaJEDJTI5jtBhyLVyYxyz6dwKzfI3FGxQJMj7YvTnxXRzjKi7AKhtrtT1XM9KkWK8Clh2LzzaZv7usiQjWZ0ry91A56wKTztK5LDrWpBxrQ2Y5u+uWyOIoNsb+2Anuxaz88mthA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(70206006)(70586007)(5660300002)(53546011)(54906003)(356005)(86362001)(6506007)(81166007)(82310400003)(110136005)(82740400003)(55016002)(8936002)(316002)(8676002)(33656002)(4326008)(478600001)(47076005)(7696005)(2906002)(9686003)(336012)(83380400001)(52536014)(36860700001)(186003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 03:06:14.7014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa26699c-2db9-4240-c0b4-08d971ac742d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6339

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMSwg
MjAyMSA0OjU3IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENo
ZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NSAxLzddIHhlbi9hcm06IGludHJvZHVjZSBuZXcgaGVscGVyDQo+IGRldmljZV90
cmVlX2dldF9tZW1pbmZvDQo+IA0KPiBIaSBQZW5ueSwNCj4gDQo+IE9uIDI0LzA4LzIwMjEgMTA6
NTAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEEgZmV3IGZ1bmN0aW9ucyBpdGVyYXRlIG92ZXIg
dGhlIGRldmljZSB0cmVlIHByb3BlcnR5IHRvIGdldCBtZW1vcnkNCj4gPiBpbmZvLCBsaWtlICJy
ZWciIG9yIHRoZSBsYXRlciAieGVuLHN0YXRpYy1tZW0iLCBzbyB0aGlzIGNvbW1pdCBjcmVhdGVz
DQo+ID4gYSBuZXcgaGVscGVyIGRldmljZV90cmVlX2dldF9tZW1pbmZvIHRvIGV4dHJhY3QgdGhl
IGNvbW1vbiBjb2Rlcy4NCj4gDQo+IFRoZSBjb21taXQgbWVzc2FnZSBuZWVkcyB0byBiZSB1cGRh
dGVkIGFzIHRoZSBwYXRjaCBoYXMgYmVlbiByZXNodWZmbGVkLg0KPiANCg0KWWVzISBJJ2xsIHJl
Y29uc3RydWN0Lg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bh
cm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyB8IDY4ICsrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDM5IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIGluZGV4
DQo+ID4gNDc2ZTMyZTBmNS4uOGM4MWJlMzM3OSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9h
cm0vYm9vdGZkdC5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYw0KPiA+IEBAIC02
Myw2ICs2Myw0NCBAQCB2b2lkIF9faW5pdCBkZXZpY2VfdHJlZV9nZXRfcmVnKGNvbnN0IF9fYmUz
MiAqKmNlbGwsDQo+IHUzMiBhZGRyZXNzX2NlbGxzLA0KPiA+ICAgICAgICpzaXplID0gZHRfbmV4
dF9jZWxsKHNpemVfY2VsbHMsIGNlbGwpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQg
X19pbml0IGRldmljZV90cmVlX2dldF9tZW1pbmZvKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNo
YXIgKnByb3BfbmFtZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdTMyIGFkZHJlc3NfY2VsbHMsIHUzMiBzaXplX2NlbGxzLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKSB7DQo+ID4gKyAgICBj
b25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5ICpwcm9wOw0KPiA+ICsgICAgdW5zaWduZWQgaW50IGks
IGJhbmtzOw0KPiA+ICsgICAgY29uc3QgX19iZTMyICpjZWxsOw0KPiA+ICsgICAgdTMyIHJlZ19j
ZWxscyA9IGFkZHJlc3NfY2VsbHMgKyBzaXplX2NlbGxzOw0KPiA+ICsgICAgcGFkZHJfdCBzdGFy
dCwgc2l6ZTsNCj4gPiArICAgIHN0cnVjdCBtZW1pbmZvICptZW0gPSBkYXRhOw0KPiA+ICsNCj4g
PiArICAgIHByb3AgPSBmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgbm9kZSwgcHJvcF9uYW1lLCBOVUxM
KTsNCj4gPiArICAgIGlmICggIXByb3AgKQ0KPiA+ICsgICAgICAgIHJldHVybiAtRU5PRU5UOw0K
PiA+ICsNCj4gPiArICAgIGNlbGwgPSAoY29uc3QgX19iZTMyICopcHJvcC0+ZGF0YTsNCj4gPiAr
ICAgIGJhbmtzID0gZmR0MzJfdG9fY3B1KHByb3AtPmxlbikgLyAocmVnX2NlbGxzICogc2l6ZW9m
ICh1MzIpKTsNCj4gPiArDQo+ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IGJhbmtzICYmIG1lbS0+
bnJfYmFua3MgPCBOUl9NRU1fQkFOS1M7IGkrKyApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAg
ZGV2aWNlX3RyZWVfZ2V0X3JlZygmY2VsbCwgYWRkcmVzc19jZWxscywgc2l6ZV9jZWxscywgJnN0
YXJ0LCAmc2l6ZSk7DQo+ID4gKyAgICAgICAgLyogU29tZSBEVCBtYXkgZGVzY3JpYmUgZW1wdHkg
YmFuaywgaWdub3JlIHRoZW0gKi8NCj4gPiArICAgICAgICBpZiAoICFzaXplICkNCj4gPiArICAg
ICAgICAgICAgY29udGludWU7DQo+ID4gKyAgICAgICAgbWVtLT5iYW5rW21lbS0+bnJfYmFua3Nd
LnN0YXJ0ID0gc3RhcnQ7DQo+ID4gKyAgICAgICAgbWVtLT5iYW5rW21lbS0+bnJfYmFua3NdLnNp
emUgPSBzaXplOw0KPiA+ICsgICAgICAgIG1lbS0+bnJfYmFua3MrKzsNCj4gPiArICAgIH0NCj4g
PiArDQo+ID4gKyAgICBpZiAoIGkgPCBiYW5rcyApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAg
cHJpbnRrKCJXYXJuaW5nOiBNYXggbnVtYmVyIG9mIHN1cHBvcnRlZCBtZW1vcnkgcmVnaW9ucw0K
PiByZWFjaGVkLlxuIik7DQo+ID4gKyAgICAgICAgcmV0dXJuIC1FTk9TUEM7DQo+ID4gKyAgICB9
DQo+ID4gKyAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHUzMiBfX2luaXQgZGV2
aWNlX3RyZWVfZ2V0X3UzMihjb25zdCB2b2lkICpmZHQsIGludCBub2RlLA0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnByb3BfbmFtZSwgdTMyIGRmbHQp
DQo+ID4gICB7DQo+ID4gQEAgLTEzOSwxNCArMTc3LDYgQEAgc3RhdGljIGludCBfX2luaXQgcHJv
Y2Vzc19tZW1vcnlfbm9kZShjb25zdCB2b2lkDQo+ICpmZHQsIGludCBub2RlLA0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgYWRkcmVzc19jZWxscywgdTMy
IHNpemVfY2VsbHMsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHZvaWQgKmRhdGEpDQo+ID4gICB7DQo+ID4gLSAgICBjb25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5
ICpwcm9wOw0KPiA+IC0gICAgaW50IGk7DQo+ID4gLSAgICBpbnQgYmFua3M7DQo+ID4gLSAgICBj
b25zdCBfX2JlMzIgKmNlbGw7DQo+ID4gLSAgICBwYWRkcl90IHN0YXJ0LCBzaXplOw0KPiA+IC0g
ICAgdTMyIHJlZ19jZWxscyA9IGFkZHJlc3NfY2VsbHMgKyBzaXplX2NlbGxzOw0KPiA+IC0gICAg
c3RydWN0IG1lbWluZm8gKm1lbSA9IGRhdGE7DQo+ID4gLQ0KPiA+ICAgICAgIGlmICggYWRkcmVz
c19jZWxscyA8IDEgfHwgc2l6ZV9jZWxscyA8IDEgKQ0KPiANCj4gVGhpcyBjaGVjayB3aWxsIGJl
IHRoZSBzYW1lIGZvciAieGVuLHN0YXRpYy1tZW0iLiBTbyBjYW4gaXQgYmUgbW92ZWQgdG8NCj4g
ZGV2aWNlX3RyZWVfZ2V0X21lbWluZm8oKT8NCj4gDQoNClN1cmUuIEknbGwgbW92ZSBpdC4NCg0K
PiA+ICAgICAgIHsNCj4gPiAgICAgICAgICAgcHJpbnRrKCJmZHQ6IG5vZGUgYCVzJzogaW52YWxp
ZCAjYWRkcmVzcy1jZWxscyBvcg0KPiA+ICNzaXplLWNlbGxzIiwgQEAgLTE1NCwyNyArMTg0LDcg
QEAgc3RhdGljIGludCBfX2luaXQNCj4gcHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2b2lkICpm
ZHQsIGludCBub2RlLA0KPiA+ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAgICAgICB9
DQo+ID4NCj4gPiAtICAgIHByb3AgPSBmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgbm9kZSwgInJlZyIs
IE5VTEwpOw0KPiA+IC0gICAgaWYgKCAhcHJvcCApDQo+ID4gLSAgICAgICAgcmV0dXJuIC1FTk9F
TlQ7DQo+ID4gLQ0KPiA+IC0gICAgY2VsbCA9IChjb25zdCBfX2JlMzIgKilwcm9wLT5kYXRhOw0K
PiA+IC0gICAgYmFua3MgPSBmZHQzMl90b19jcHUocHJvcC0+bGVuKSAvIChyZWdfY2VsbHMgKiBz
aXplb2YgKHUzMikpOw0KPiA+IC0NCj4gPiAtICAgIGZvciAoIGkgPSAwOyBpIDwgYmFua3MgJiYg
bWVtLT5ucl9iYW5rcyA8IE5SX01FTV9CQU5LUzsgaSsrICkNCj4gPiAtICAgIHsNCj4gPiAtICAg
ICAgICBkZXZpY2VfdHJlZV9nZXRfcmVnKCZjZWxsLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxz
LCAmc3RhcnQsICZzaXplKTsNCj4gPiAtICAgICAgICAvKiBTb21lIERUIG1heSBkZXNjcmliZSBl
bXB0eSBiYW5rLCBpZ25vcmUgdGhlbSAqLw0KPiA+IC0gICAgICAgIGlmICggIXNpemUgKQ0KPiA+
IC0gICAgICAgICAgICBjb250aW51ZTsNCj4gPiAtICAgICAgICBtZW0tPmJhbmtbbWVtLT5ucl9i
YW5rc10uc3RhcnQgPSBzdGFydDsNCj4gPiAtICAgICAgICBtZW0tPmJhbmtbbWVtLT5ucl9iYW5r
c10uc2l6ZSA9IHNpemU7DQo+ID4gLSAgICAgICAgbWVtLT5ucl9iYW5rcysrOw0KPiA+IC0gICAg
fQ0KPiA+IC0NCj4gPiAtICAgIGlmICggaSA8IGJhbmtzICkNCj4gPiAtICAgICAgICByZXR1cm4g
LUVOT1NQQzsNCj4gPiAtICAgIHJldHVybiAwOw0KPiA+ICsgICAgcmV0dXJuIGRldmljZV90cmVl
X2dldF9tZW1pbmZvKGZkdCwgbm9kZSwgInJlZyIsIGFkZHJlc3NfY2VsbHMsDQo+ID4gKyBzaXpl
X2NlbGxzLCBkYXRhKTsNCj4gPiAgIH0NCj4gPg0KPiA+ICAgc3RhdGljIGludCBfX2luaXQgcHJv
Y2Vzc19yZXNlcnZlZF9tZW1vcnlfbm9kZShjb25zdCB2b2lkICpmZHQsIGludA0KPiA+IG5vZGUs
DQo+ID4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

