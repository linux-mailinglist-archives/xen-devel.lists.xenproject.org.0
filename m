Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20DD2C1875
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 23:32:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35215.66634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khKN6-0001Ga-RM; Mon, 23 Nov 2020 22:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35215.66634; Mon, 23 Nov 2020 22:31:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khKN6-0001GB-Nz; Mon, 23 Nov 2020 22:31:44 +0000
Received: by outflank-mailman (input) for mailman id 35215;
 Mon, 23 Nov 2020 22:31:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jwan=E5=zal.aero=leo.krueger@srs-us1.protection.inumbo.net>)
 id 1khKN4-0001G6-Jd
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:31:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.139]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ba826bf-e936-4d92-a21b-a78ba13b54f9;
 Mon, 23 Nov 2020 22:31:40 +0000 (UTC)
Received: from HE1PR05MB4794.eurprd05.prod.outlook.com (2603:10a6:7:9b::11) by
 HE1PR0501MB2393.eurprd05.prod.outlook.com (2603:10a6:3:69::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.28; Mon, 23 Nov 2020 22:31:36 +0000
Received: from HE1PR05MB4794.eurprd05.prod.outlook.com
 ([fe80::7d6a:df13:ca6f:b173]) by HE1PR05MB4794.eurprd05.prod.outlook.com
 ([fe80::7d6a:df13:ca6f:b173%5]) with mapi id 15.20.3564.033; Mon, 23 Nov 2020
 22:31:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Jwan=E5=zal.aero=leo.krueger@srs-us1.protection.inumbo.net>)
	id 1khKN4-0001G6-Jd
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:31:42 +0000
X-Inumbo-ID: 2ba826bf-e936-4d92-a21b-a78ba13b54f9
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.139])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2ba826bf-e936-4d92-a21b-a78ba13b54f9;
	Mon, 23 Nov 2020 22:31:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meZn+AAaOc/RywqRHrWtVWIGTj9RfdDpbXtYtR4osqimVjxNhJ4qJHOBrjA0VU7yLo4Og1y0XDgp2a43ykAceWPnQZQd/sbzyvpxQlTYXyovRE9kmk16REMiOMyZrn6DZmUlbGvxzHdg45RFaVMMv44EA4KA9abAIcdjoxZAEVCbQHa2P0bNxVYg1uUaxDV6wKWtGAdCy6PpOszy5ETq7gJXHavmHu0NihkgwlRakS6raU1bacdi9+b8ViM1ID9lLE16rhfJTm1LmH8C8PRAPjnVA9ek+wszKPKTYvR68fe6UWmJb4tWXI55kPfHX6jVxMlJ2VkzWC7nF6xpRMARiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nj7oRowiAmeJhJJ2mdzzoyIh6f2du/9/9BoNG80YEU0=;
 b=l2dVLIhmbdYJrqwmS6AlOeNfOZizLzJrGHH2Liv3e3I3933oNiekRA8rYTQdmlFtviVsWPN+ak10Oi/yvetyCGSoxgn8behEFtLkeNTu66xOto3VvSewGaPDv2qIKubvo6abl11chhX92EIMk6pcAHRvur1wa5SkOR1WwEc0o5bY56KKuG4o44riazSRKu7qRC6nrfhcdSVAVKXIAsZjDIJwajEAHXJwQjJS7eGfEuLwX85Vc9YehHaCZcN9wUx2mOaWxl4Rdip9taiqm3aXpjwa/O/0cjJZ8SPZt51gXARQm2nw5acS5ubJWR9pOnlG8hRHYS2SB9VB5lYr0lsQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zal.aero; dmarc=pass action=none header.from=zal.aero;
 dkim=pass header.d=zal.aero; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zalgmbh.onmicrosoft.com; s=selector2-zalgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nj7oRowiAmeJhJJ2mdzzoyIh6f2du/9/9BoNG80YEU0=;
 b=T7PYsjpS0lA6N2ssHrPutsX4ZYuLgm182i6DbwMu+tDGHUuJnHp3Q9pPCOWTsOSYXTbV8F5byVxwsLoHuJRuKGgoxCLP1/sK9gchHX0LhUMPX1lFO2rhCMc1UkWan/uMcuWpDvnwnyPz0TJgzumvM0KmXMwoD6fXKoplMAO45Fs=
Received: from HE1PR05MB4794.eurprd05.prod.outlook.com (2603:10a6:7:9b::11) by
 HE1PR0501MB2393.eurprd05.prod.outlook.com (2603:10a6:3:69::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.28; Mon, 23 Nov 2020 22:31:36 +0000
Received: from HE1PR05MB4794.eurprd05.prod.outlook.com
 ([fe80::7d6a:df13:ca6f:b173]) by HE1PR05MB4794.eurprd05.prod.outlook.com
 ([fe80::7d6a:df13:ca6f:b173%5]) with mapi id 15.20.3564.033; Mon, 23 Nov 2020
 22:31:36 +0000
From: Leo Krueger <leo.krueger@zal.aero>
To: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>, Peng Fan
	<peng.fan@nxp.com>, "brucea@xilinx.com" <brucea@xilinx.com>, Cornelia
 Bruelhart <cornelia.bruelhart@zal.aero>, "oleksandr_andrushchenko@epam.com"
	<oleksandr_andrushchenko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: AW: Xen data from meta-virtualization layer
Thread-Topic: Xen data from meta-virtualization layer
Thread-Index: AQHWwY2XkGXatLUPJUSwHO7jlfFZt6nWDYMAgAA/5AA=
Date: Mon, 23 Nov 2020 22:31:35 +0000
Message-ID:
 <HE1PR05MB4794A2DA40D46770D971AD598BFC0@HE1PR05MB4794.eurprd05.prod.outlook.com>
References:
 <AM4PR0501MB2227089FDDF0209EF6E215D9E6100@AM4PR0501MB2227.eurprd05.prod.outlook.com>
 <HE1PR05MB4794B5C57A54A29A48EE8EAE8BE90@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011101842500.21307@sstabellini-ThinkPad-T480s>
 <DB6PR0402MB27608A03EC717053E392A92988E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47940ED4E5FDC0BADC54C8E78BE80@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <DB6PR0402MB2760CEEABA9F52CDEB27C1DB88E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47944761ED6A26D3E2CE15868BE40@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011161656080.20906@sstabellini-ThinkPad-T480s>
 <HE1PR05MB4794569AC67109AF8B6517268BE20@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011171544380.438@sstabellini-ThinkPad-T480s>
 <5dc63ee2-f1ce-31fc-cb6a-fe4dae929fb3@xen.org>
 <HE1PR05MB4794EBDD1FE29BC69D0BCC898BFD0@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <50B2EEEF-4BF2-4511-98D5-F165A70E2EC6@arm.com>
 <15608dee-1f95-2b08-9fe5-cd015f4d1cdf@xen.org>
In-Reply-To: <15608dee-1f95-2b08-9fe5-cd015f4d1cdf@xen.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=zal.aero;
x-originating-ip: [2003:e4:3f2c:9500:8d15:373c:6c7a:4573]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abdc43bc-b676-49e4-6bf9-08d88fff89ac
x-ms-traffictypediagnostic: HE1PR0501MB2393:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <HE1PR0501MB239364410B7E964A81FD35738BFC0@HE1PR0501MB2393.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5Es0fD4o6Hqkn1iWEjA140kArrX9dJckNiCO+l19x5F47Xd6RfuoIGOCrGlMEhtbd7FOIapgSHTRSgMlU+xZqRkhXkpz5XY+u3hfPMZo7fYnUKyasWHNkoz8Nz34nhCMcKwzLL7lravnIGO1aJmuN1FfAeieZlvU43hs/MzwkfnvbyHAjjqZ6Vu7czSLVZRG/w/Mly0Y/NUC/22Hv17XOrJHXA/YdiXZWOr10IoheHvrcYDnqYXKbm/i37TuRtH7NF0wr8dBVo3DTbvG8FluGjNNfEW3yaMpLjP/haFz6HCQq1/wOLj++koigvpZVs4l7OIyZBRhpznYL54Uxb1HVg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR05MB4794.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(366004)(39830400003)(396003)(66556008)(478600001)(4326008)(64756008)(66476007)(86362001)(83380400001)(9686003)(53546011)(6506007)(8936002)(66574015)(66946007)(2906002)(132210200001)(76116006)(55016002)(7696005)(71200400001)(66446008)(5660300002)(54906003)(186003)(8676002)(52536014)(33656002)(44832011)(316002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
	=?utf-8?B?OTBNTnNCMGRrdnpVaWZ5bDVlYk1KYlUvc2dSNWZhM3Q3TFZMK1FXYllDd21a?=
 =?utf-8?B?YWlqL3hyS252bWowYjRzZzQ4WExVQllpakZNTU9ENHNJZi9ZMzN2YWpSa0Fs?=
 =?utf-8?B?N3VGQTU0a3pIbWhTTXdEL0t2bm9EOGJkcnUxNEpwSTFMY3FObFhXK3JKN2lK?=
 =?utf-8?B?elJKVjhRLzV2aVp0bXlFdHpOTThVTm54MGdzWjUzOXhPNDdXUmZvZVlUcE5W?=
 =?utf-8?B?eFJ6dHVwQ2tUZ01EWGJNRnJ4aDVEazljT3A1V1M1RHFlQXdYMGRMdnhNQTFM?=
 =?utf-8?B?cXZZWlZPd1FGQzBsa3FCZ3ROSUtNY05oRkQxQ21RVWJWMWM1NE0wYkhYR2hu?=
 =?utf-8?B?ZVdkaEFhMWFHM0NkQ1JDQjRCWmxSTnhGRk8zcWc2NU50Y0k4eSsxdTFNaGdh?=
 =?utf-8?B?N3FMZnloa1RrVEc0QmNmNmtRNTl6T2l5L3crRkdCczdDeDRPb2JXTXpOc1pu?=
 =?utf-8?B?UWRBOUFKQXJOL1hwdjNBZkUyVVc4eVlhb2hUMStLZGNIYmpCcEh3OFZ0a0Nz?=
 =?utf-8?B?WlRrVS9DOVQyOE9oOFMwcXlWNlZKamt4akF6cjZVTGlLU0Y3Um8xRDVjaGxx?=
 =?utf-8?B?ZXo0c25oT1BwWFMvQjZ5T0JKL3pQOTFjSHNNME5HOUQrYXBJaHRINzErS1F3?=
 =?utf-8?B?VTZCOVNydWtHQ3VjSzZiVlE0L1JrWHlmQ2gyZTVzRGhzTHNTNGliM09YQ29a?=
 =?utf-8?B?SHJyNy9aOG9rRjVrV01WZllhMGRqQ2ljSnBnYk9ONmdLNHFLT2psZUF1YWVw?=
 =?utf-8?B?dkxncGY1Z3hSaHRUQmFKanJUYnZreXBSN0QxSDFCNDFWeHlXRkRoTGpqYXhu?=
 =?utf-8?B?Wmg1SDJ4WGwyNEx6K0ZMZk9VM2YxcjRKdW1hTXBsaHdMWEtXRG03eTZ1K2po?=
 =?utf-8?B?djBRdmdiTHliRnJpdENPbDh3UllMVUU5ZkZnd0JGSkdoSGlGR09uRzhVZkhi?=
 =?utf-8?B?SVpEa1NoeXhadndyNzRzSmJ3WFp6SWFIOGxZVHAvUklPaW1QekQrRkltRFJT?=
 =?utf-8?B?bFgrRzdrbkdyNEUzcHZQOVZzREZvL3E1L2JsZzd3NmNJdU9USEkrMWNEeStN?=
 =?utf-8?B?enVUeERuV1k2b2F2Y0lVRnFJVzdWdjE3RksydlpCZTNhRzM5cFUzU0pYZ0xZ?=
 =?utf-8?B?MFc3S24vVVdOTnFRY0F2dHlybnIvWHRRTlNYay9MZkk2ODB4K3FvWW1UU2lB?=
 =?utf-8?B?NVpIMDRFQXZhMjZBUkVZUWdtOWNROEpNakMwY0tJMmlQcnUxSnVxc0t3b3JL?=
 =?utf-8?B?VWVlZVhPYUEwWU5INEpDRG5sNWFuVVhHYURwVk41UlFxQ0J6Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: zal.aero
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR05MB4794.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abdc43bc-b676-49e4-6bf9-08d88fff89ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2020 22:31:36.0636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dd36ff89-3bc0-4d3d-b543-76f454a3c8e5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jQXUNC+D+dJQ3T8mtiHd9YZy/N4LfQ6ZLAjFacl9oNLZv9FXLIsGMUvFUpcB4aPgbo3v5Qz7PQUQz/XFBVLULw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0501MB2393

SGksDQoNClRoYW5rcyBmb3IgeW91ciBlZmZvcnQhDQoNCj4gLS0tLS1VcnNwcsO8bmdsaWNoZSBO
YWNocmljaHQtLS0tLQ0KPiBWb246IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IEdl
c2VuZGV0OiBNb250YWcsIDIzLiBOb3ZlbWJlciAyMDIwIDE5OjQyDQo+IEFuOiBSYWh1bCBTaW5n
aCA8UmFodWwuU2luZ2hAYXJtLmNvbT47IExlbyBLcnVlZ2VyDQo+IDxsZW8ua3J1ZWdlckB6YWwu
YWVybz4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlu
eC5jb20+OyBQZW5nIEZhbg0KPiA8cGVuZy5mYW5AbnhwLmNvbT47IGJydWNlYUB4aWxpbnguY29t
OyBDb3JuZWxpYSBCcnVlbGhhcnQNCj4gPGNvcm5lbGlhLmJydWVsaGFydEB6YWwuYWVybz47IG9s
ZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tOyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+
DQo+IEJldHJlZmY6IFJlOiBYZW4gZGF0YSBmcm9tIG1ldGEtdmlydHVhbGl6YXRpb24gbGF5ZXIN
Cj4gDQo+IA0KPiANCj4gT24gMjMvMTEvMjAyMCAxMTo0MSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+
ID4gSGVsbG8gLA0KPiANCj4gSGkgUmFodWwsDQo+IA0KPiA+PiBPbiAyMiBOb3YgMjAyMCwgYXQg
MTA6NTUgcG0sIExlbyBLcnVlZ2VyIDxsZW8ua3J1ZWdlckB6YWwuYWVybz4gd3JvdGU6DQo+ID4+
IHJvb3RAa29udHJvbi1zYWwyODp+IyBpcCBsaW5rIHNldCB1cCBkZXYgZ2JlMA0KPiA+PiAoWEVO
KSB2Z2ljLXYzLWl0cy5jOjkwMjpkMHYwIHZJVFMgIGNtZCAweDBjOiAwMDAwMDAxNzAwMDAwMDBj
DQo+ID4+IDAwMDAwMDAwMDAwMDAwMDEgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAw
DQo+ID4+IChYRU4pIHZnaWMtdjMtaXRzLmM6OTAyOmQwdjAgdklUUyAgY21kIDB4MDU6IDAwMDAw
MDAwMDAwMDAwMDUNCj4gMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAw
MDAwMDAwMDANCj4gPj4gWyAgIDM0LjAzNDU5OF0gQXRoZXJvcyA4MDMxIGV0aGVybmV0IDAwMDA6
MDA6MDAuMzowNTogYXR0YWNoZWQgUEhZIGRyaXZlcg0KPiBbQXRoZXJvcyA4MDMxIGV0aGVybmV0
XSAobWlpX2J1czpwaHlfYWRkcj0wMDAwOjAwOjAwLjM6MDUsIGlycT1QT0xMKQ0KPiA+PiBbICAg
MzQuMDQxMTExXSA4MDIxcTogYWRkaW5nIFZMQU4gMCB0byBIVyBmaWx0ZXIgb24gZGV2aWNlIGdi
ZTANCj4gPj4gWyAgIDM0LjA0MTIwOV0gSVB2NjogQUREUkNPTkYoTkVUREVWX1VQKTogZ2JlMDog
bGluayBpcyBub3QgcmVhZHkNCj4gPj4gcm9vdEBrb250cm9uLXNhbDI4On4jIFsgICAzNS4wNDE5
NTFdIGZzbF9lbmV0YyAwMDAwOjAwOjAwLjAgZ2JlMDogTGluayBpcw0KPiBEb3duDQo+ID4+IFsg
ICAzOC4xMTQ0MjZdIGZzbF9lbmV0YyAwMDAwOjAwOjAwLjAgZ2JlMDogTGluayBpcyBVcCAtIDFH
YnBzL0Z1bGwgLSBmbG93DQo+IGNvbnRyb2wgb2ZmDQo+ID4+IFsgICAzOC4xMTQ1MDhdIElQdjY6
IEFERFJDT05GKE5FVERFVl9DSEFOR0UpOiBnYmUwOiBsaW5rIGJlY29tZXMNCj4gcmVhZHkNCj4g
Pj4NCj4gPj4gRG9lcyB0aGF0IHRlbGwgeW91IGFueXRoaW5nPw0KPiA+Pg0KPiA+DQo+ID4gSSBq
dXN0IGNoZWNrZWQgdGhlIGxvZ3Mgc2hhcmVkLCB3aGF0IEkgZm91bmQgb3V0IHRoYXQgdGhlcmXi
gJlzIGlzIGFuIGVycm9yDQo+IHdoaWxlIGJvb3RpbmcgdG8gY29uZmlndXJlIHRoZSBNU0kgZm9y
IHRoZSBQQ0kgZGV2aWNlIGJlY2F1c2Ugb2YgdGhhdCB0aGVyZQ0KPiB3aWxsIGJlIGNhc2UgdGhh
dCBEZXZpY2UgSWQgZ2VuZXJhdGUgb3V0LW9mLWJhbmQgaXMgbm90IG1hcHBlZCBjb3JyZWN0bHkg
dG8NCj4gSVRTIGRldmljZSB0YWJsZSBjcmVhdGVkIHdoaWxlIGluaXRpYWxpc2luZyB0aGUgTVNJ
IGZvciB0aGUgZGV2aWNlLg0KPiA+IEkgbWlnaHQgYmUgd3JvbmcgbGV0IHNvbWVvbmUgZWxzZSBh
bHNvIGNvbW1lbnRzIG9uIHRoaXMuDQo+IA0KPiBJIHRoaW5rIHRoZXJlIG1pZ2h0IGJlIG11bHRp
cGxlIGlzc3Vlcy4gWW91IHNwb3R0ZWQgb25lIGJlbG93IDopLg0KPiANCj4gPiBbICAgIDAuMTcz
OTY0XSBPRjogL3NvYy9wY2llQDFmMDAwMDAwMDogSW52YWxpZCBtc2ktbWFwIHRyYW5zbGF0aW9u
IC0gbm8NCj4gbWF0Y2ggZm9yIHJpZCAweGY4IG9uICAgICAgICAgICAobnVsbCkNCj4gDQo+IExl
bywganVzdCB0byBjb25maXJtLCB0aGlzIGVycm9yIG1lc3NhZ2UgaXMgbm90IHNwb3R0ZWQgd2hl
biBib290aW5nIExpbnV4IG9uDQo+IGJhcmVtZXRhbD8NCg0KSW4gZmFjdCBpdCBpczoNCg0KWyAg
ICAwLjE2MDA3N10gT0Y6IC9zb2MvcGNpZUAxZjAwMDAwMDA6IEludmFsaWQgbXNpLW1hcCB0cmFu
c2xhdGlvbiAtIG5vIG1hdGNoIGZvciByaWQgMHhmOCBvbiAgICAgICAgICAgKG51bGwpDQoNCkJ1
dCBldmVyeXRoaW5nIHdvcmtzIGFzIGV4cGVjdGVkIGhlcmU6DQoNCjExMDogICAgICAzNDI4OCAg
ICAgICAgICAwICAgSVRTLU1TSSAgIDEgRWRnZSAgICAgIGdiZTAtcnh0eDANCjExMTogICAgICAg
ICAgMCAgICAgICA2MTk2ICAgSVRTLU1TSSAgIDIgRWRnZSAgICAgIGdiZTAtcnh0eDENCg0KPiAN
Cj4gQ2hlZXJzLA0KDQpCZXN0IHdpc2hlcw0KDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

