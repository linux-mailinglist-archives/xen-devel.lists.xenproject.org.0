Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC62C345D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 00:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37035.69184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khhTS-00019w-AE; Tue, 24 Nov 2020 23:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37035.69184; Tue, 24 Nov 2020 23:11:50 +0000
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
	id 1khhTS-00019W-5g; Tue, 24 Nov 2020 23:11:50 +0000
Received: by outflank-mailman (input) for mailman id 37035;
 Tue, 24 Nov 2020 23:11:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mdj2=E6=zal.aero=leo.krueger@srs-us1.protection.inumbo.net>)
 id 1khhTQ-00019R-5l
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 23:11:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.131]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40668a29-9494-4bc9-aa2f-32bb02172795;
 Tue, 24 Nov 2020 23:11:46 +0000 (UTC)
Received: from HE1PR05MB4794.eurprd05.prod.outlook.com (2603:10a6:7:9b::11) by
 HE1PR05MB4779.eurprd05.prod.outlook.com (2603:10a6:7:97::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20; Tue, 24 Nov 2020 23:11:26 +0000
Received: from HE1PR05MB4794.eurprd05.prod.outlook.com
 ([fe80::7d6a:df13:ca6f:b173]) by HE1PR05MB4794.eurprd05.prod.outlook.com
 ([fe80::7d6a:df13:ca6f:b173%5]) with mapi id 15.20.3564.033; Tue, 24 Nov 2020
 23:11:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Mdj2=E6=zal.aero=leo.krueger@srs-us1.protection.inumbo.net>)
	id 1khhTQ-00019R-5l
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 23:11:48 +0000
X-Inumbo-ID: 40668a29-9494-4bc9-aa2f-32bb02172795
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.131])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 40668a29-9494-4bc9-aa2f-32bb02172795;
	Tue, 24 Nov 2020 23:11:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipjQMG1ElQ+k2eduAFpzUaP8GR2tK8zl0mnPUtrrjKa1Ox0PnImAepe8e3lqxUqSIfpK1o4daF5eyxRNI/SZ3fzIcHN0gw87WeV99j0H0mHRuI1g46lxiU8ISV0CxuN3KzENA9/e+lIRBJOh3ercC38DWpwf40Tytqn8lQfgfP4inc/ooyru7FhPDMN9ph6PQaIlKS8bYXI8xOj7GkOpwG/PnLee3vIxfVaYNim913RHLD1SMi8okqbz52dJlTFPMIT7H4WAU4KXpTG1t/wzNRkDBCREe5JaxltD0BKfwq2swRN/EIcrtzGUDe77dHMuAPPp210qPGEyJqEzX6z2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53yoF7REm0yX67XQYQQYlljxEs1Kcsrjjfn40UG8xxw=;
 b=drrHy4cYnGW/yyeFCtaR7iIxLzzPW3pCWLRa0gvGxikSssNac0BocV+FKzbTrzVDQAJiFgLygUBAdNNEN1enq8fM2RHBLz0XHoYBzIuNoEPYhTWip1TgDmrN1BUAMAPgXQwZYeAmNdImI5N4T2F5i9UrKLqzFTUkwPcuuiTsqy5uGDlZ4sFrviB50vitL9LZh833TL0h/WG3XVAfA4I6qOmAOGEKSW80D65SgHFXoG3k0Dx9cItr83PH+WkGPz8ja9bHz4R9j5ZZNoI1zuJps2J942v16uRoP1aC8hM69GzL0l0MgvDsbJKeQkvpjDPxagsvJl6B/vq6WLZSariWqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zal.aero; dmarc=pass action=none header.from=zal.aero;
 dkim=pass header.d=zal.aero; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zalgmbh.onmicrosoft.com; s=selector2-zalgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53yoF7REm0yX67XQYQQYlljxEs1Kcsrjjfn40UG8xxw=;
 b=IdqP7grtIjVR9/jfHPCRKzjQ7rWy+JWEiqlfwWcNha07FsNDHIOw10uUDRoB4AoFaTd8mKwrcf8o+SPkQ33k0mlniWUOXtZ+vutT9f6yCuC3Lj8eTtE7ZfrttVYcL+kZmRMMq7LXJmaPhMbN5TS+JqWpN8cziRYDRRbnSIYeH1o=
Received: from HE1PR05MB4794.eurprd05.prod.outlook.com (2603:10a6:7:9b::11) by
 HE1PR05MB4779.eurprd05.prod.outlook.com (2603:10a6:7:97::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20; Tue, 24 Nov 2020 23:11:26 +0000
Received: from HE1PR05MB4794.eurprd05.prod.outlook.com
 ([fe80::7d6a:df13:ca6f:b173]) by HE1PR05MB4794.eurprd05.prod.outlook.com
 ([fe80::7d6a:df13:ca6f:b173%5]) with mapi id 15.20.3564.033; Tue, 24 Nov 2020
 23:11:25 +0000
From: Leo Krueger <leo.krueger@zal.aero>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
CC: Peng Fan <peng.fan@nxp.com>, "brucea@xilinx.com" <brucea@xilinx.com>,
	Cornelia Bruelhart <cornelia.bruelhart@zal.aero>,
	"oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>
Subject: AW: AW: AW: AW: AW: AW: Xen data from meta-virtualization layer
Thread-Topic: AW: AW: AW: AW: AW: Xen data from meta-virtualization layer
Thread-Index:
 AdaxGoYJbW1LEL/jTUmK3sZDIRyPGAA9xNCAASdllGAAABZN8AAYnVUAACWhGAAAC0bcAAAAU02AAAYKpqgABBfLAADlnDFgADm6ywAAK1PyQAAEq7SAABo3VQAA3unxYAApO/qAADv7W5A=
Date: Tue, 24 Nov 2020 23:11:25 +0000
Message-ID:
 <HE1PR05MB4794FE31A2BDE8BC458D81848BFB0@HE1PR05MB4794.eurprd05.prod.outlook.com>
References:
 <AM4PR0501MB2227089FDDF0209EF6E215D9E6100@AM4PR0501MB2227.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011091858010.21307@sstabellini-ThinkPad-T480s>
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
 <b67581c6-6682-5059-55d1-a9c695a8cdc3@xen.org>
In-Reply-To: <b67581c6-6682-5059-55d1-a9c695a8cdc3@xen.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=zal.aero;
x-originating-ip: [2003:e4:3f2c:9500:2d89:c573:b2ac:fc47]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e5f29cd-2c2e-4d02-0b8a-08d890ce446f
x-ms-traffictypediagnostic: HE1PR05MB4779:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <HE1PR05MB4779DAEB0C7268A34A519D878BFB0@HE1PR05MB4779.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 R14Ryookhh8C0MLF6eJ5+M1xEBJrQ6yt58Xu/nCz46aEMoMPyzl5n8VCkFMiqaw7HgNWqteFR8CqDCxfid8rDMsRiQJGoobDr7y83fCvf4z13HaQKNvr0cHmWdyaDdMYVaTLpz5x2rh0KPVE7gH04dtNZ6jW0Gwvh65DzYxKhXezP3Z+QVKEuAkQFdiGKGKFpl0Z5mTmRA2rVE/qsFLrUVqow+zv3H/qHCtPi9I8Vvcer0n/9VWSrfZVzUbvjflIzfc2rKb6gbwlc4DvC8H8x3bVafeXC+FEhcOLfAgoEzLXldTNDEP+lL+L5C6F/80xVEaf3giD1FmPbVtYn6JvkiVuhPLuvuIFRdxy75vrAxQJbwzFTqH0vqJu1LbCFPXdu9VKdi9s242c2qfd93TkIA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR05MB4794.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(39830400003)(136003)(346002)(366004)(6506007)(9686003)(8676002)(316002)(66556008)(64756008)(66476007)(966005)(66946007)(55016002)(76116006)(478600001)(4326008)(53546011)(7696005)(71200400001)(66446008)(8936002)(44832011)(2906002)(33656002)(52536014)(110136005)(66574015)(5660300002)(186003)(54906003)(132210200001)(83380400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
	=?utf-8?B?akRqZUVpVmVGOEtWVVFnOE05L21WNkRyaFVEbWZPbUR3MUlsTUtJTEhFcy9w?=
 =?utf-8?B?Mlgxdks5KzZpL0dPQlZmWWhoRENzUDF3THhwb2JsZkYvNzBoRnpQcktQeUdW?=
 =?utf-8?B?RWc0L2VPZnZiZGZ4cnhjamhwOHUrUGJCWStTKzZOYkdyeEdUN3VUemNSQ0FX?=
 =?utf-8?B?YXhCaEg5a1lmYzRsSGV1R28xSjFJS3VQS0xhTEF6M0diOFpRQ05xemJEeEhs?=
 =?utf-8?B?a1FsZmJ4czkzYnpWaXAxaTdyZ0tXNVNuTnpRMEdHWjZYLzg3Y3p2bXUwQldY?=
 =?utf-8?B?c1lCR0ZEcFhVQjgrYTB4UitxZVVtL0djanNFTnJtOGVUMWQyMUtiSnhHeHRW?=
 =?utf-8?B?SzJwUUhaM0xheTlMVzdHYW1XUm1ZSmlhbE9nZE5lVXFvSCtpWW9YWFhoL2gx?=
 =?utf-8?B?VkVHOTN2WDQrbDhiVnBXbSt2bnVkN1FLdi9PMFBYT0Z0enZFWlBkU04zV1J1?=
 =?utf-8?B?QzY2cVJScGFyUzZqV0VJNXFWVTl4RVF0OGRnaHphanFpdHVaeFlCRnNDL1JI?=
 =?utf-8?B?T3ptblNvS0dsNGkyK0RwbGhCeit2enFuaXFRTE5YSDdWNW1LSjFNVGcyOVJT?=
 =?utf-8?B?T2gzTW00N0R6WlNMOGtFdFljT3pOWjRaNXN4U0hJRlRLeW9JZmRvdmZjcG1r?=
 =?utf-8?B?bkJWemdjelNwUGI1ckxxV2lQNzZiTTA4NUxjZDVqaGhaR08zZ2hsL1FUbndE?=
 =?utf-8?B?QU5LOHorWUFvNW1kWlN0RjcwZ1VVR1FkMkFsWHcrV1lJL2RPaWxnVU55aDBz?=
 =?utf-8?B?Mi9MYk0wSGZLVXJielRVeU41RkxtTUZzUFpvRVZva3ZEZGNMYUErMDhrR01j?=
 =?utf-8?B?cG9LMEZ3TnlWSVV3bEtoMDR2ZVVidmtuWnRjKzg3NnNLdHhDcW1Qc1JRYjBw?=
 =?utf-8?B?WlV1TjNVVjNuOFZKVTJCUTZ1Y1Q0VXU2d3llY0o1QmdQdXJseVA2bWg3bXFl?=
 =?utf-8?B?QjV0aTB4di82MTVDVGt5T29QZ1lkdWZFSjdWS2p5U0tPZ1NyK0VPYkN3SGpz?=
 =?utf-8?B?SUtQSW9TWG44WEZNalhad3k5QnZzRk9kUUQ5aXIrd1BkWEMxYk1FTGc5dUtj?=
 =?utf-8?B?blROV0diNFByanBucjBoeTZGNWZZbTlieUU0cHJyT2hxemhlYjhwSE43bWV5?=
 =?utf-8?B?S1BnZm1yZ1hOSkFHUS9Bdk5PNjNnVEd2WW9BcVBYYWF2MTc2WVRBOGVSZEh5?=
 =?utf-8?B?STZuQ3crTXdjSUI1QVA1SnNkcStHWGFuU1ZlQTVBQU9GR1BqcXN5a3pRL2Vh?=
 =?utf-8?B?MTJITHhucWIreng0d0czcWVvTTZUS3NwZ1A1b21TVXRiQVFvUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: zal.aero
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR05MB4794.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5f29cd-2c2e-4d02-0b8a-08d890ce446f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 23:11:25.6627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dd36ff89-3bc0-4d3d-b543-76f454a3c8e5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dd+YirD1+MgeqTE7+FXnz+oDZACsOVlJQkBrH7UZP0UkSO87OA7zdBh4WKbTwHILp3F+pCRfqmkggPZd5avnUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR05MB4779

SGksDQoNCj4gLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0KPiBWb246IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IEdlc2VuZGV0OiBNb250YWcsIDIzLiBOb3ZlbWJl
ciAyMDIwIDE5OjI3DQo+IEFuOiBMZW8gS3J1ZWdlciA8bGVvLmtydWVnZXJAemFsLmFlcm8+OyBT
dGVmYW5vIFN0YWJlbGxpbmkNCj4gPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0KPiBD
YzogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+OyBicnVjZWFAeGlsaW54LmNvbTsgQ29ybmVs
aWEgQnJ1ZWxoYXJ0DQo+IDxjb3JuZWxpYS5icnVlbGhhcnRAemFsLmFlcm8+OyBvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbTsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZzsgQmVydHJhbmQuTWFycXVpc0Bhcm0uY29tDQo+IEJldHJlZmY6IFJlOiBBVzogQVc6IEFXOiBB
VzogQVc6IFhlbiBkYXRhIGZyb20gbWV0YS12aXJ0dWFsaXphdGlvbiBsYXllcg0KPiANCj4gDQo+
IA0KPiBPbiAyMi8xMS8yMDIwIDIyOjU1LCBMZW8gS3J1ZWdlciB3cm90ZToNCj4gPiBIaSBKdWxp
ZW4sDQo+IA0KPiBIaSBMZW8sDQo+IA0KPiA+DQo+ID4gZmluYWxseSBJIGNvdWxkIHRyeSBvdXQg
d2hhdCB5b3Ugc3VnZ2VzdGVkLCBwbGVhc2UgZmluZCBteSBhbnN3ZXJzIGlubGluZS4NCj4gDQo+
IFRoYW5rIHlvdSBmb3Igc2VuZGluZyB0aGUgbG9ncyENCj4gDQo+ID4NCj4gPj4gLS0tLS1VcnNw
csO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0KPiA+PiBWb246IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+DQo+ID4+IEdlc2VuZGV0OiBNaXR0d29jaCwgMTguIE5vdmVtYmVyIDIwMjAgMTM6
MjQNCj4gPj4gQW46IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlu
eC5jb20+OyBMZW8gS3J1ZWdlcg0KPiA+PiA8bGVvLmtydWVnZXJAemFsLmFlcm8+DQo+ID4+IENj
OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT47IGJydWNlYUB4aWxpbnguY29tOyBDb3JuZWxp
YQ0KPiA+PiBCcnVlbGhhcnQgPGNvcm5lbGlhLmJydWVsaGFydEB6YWwuYWVybz47DQo+ID4+IG9s
ZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tOyB4ZW4tIGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOw0KPiA+PiBCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20NCj4gPj4gQmV0cmVmZjogUmU6
IEFXOiBBVzogQVc6IEFXOiBYZW4gZGF0YSBmcm9tIG1ldGEtdmlydHVhbGl6YXRpb24gbGF5ZXIN
Cj4gPj4NCj4gPj4gSGksDQo+ID4+DQo+ID4+IE9uIDE3LzExLzIwMjAgMjM6NTMsIFN0ZWZhbm8g
U3RhYmVsbGluaSB3cm90ZToNCj4gPj4+IEFkZGluZyBCZXJ0cmFuZCwgT2xla3NhbmRyLCBKdWxp
ZW4sIGFuZCBvdGhlcnMgLS0gdGhleSBoYXZlIGEgbW9yZQ0KPiA+Pj4gcmVjZW50IGV4cGVyaWVu
Y2Ugd2l0aCBHSUN2MyBJVFMgdGhhbiBtZSBhbmQgbWlnaHQgYmUgYWJsZSB0byBoZWxwLg0KPiA+
Pj4gSSBhbSBhdHRhY2hpbmcgdGhlIGRldmljZSB0cmVlIExlbyBzZW50IGEgZmV3IGRheXMgYWdv
IGZvciByZWZlcmVuY2UuDQo+ID4+Pg0KPiA+Pj4NCj4gPj4+IFR5cGljYWxseSB3aGVuIHlvdSBj
YW4gc2V0IHRoZSBldGhlcm5ldCBsaW5rIHVwIGFuZCBubyBwYWNrZXRzIGFyZQ0KPiA+Pj4gZXhj
aGFuZ2VkIGl0IGlzIGJlY2F1c2Ugb2YgYSBtaXNzaW5nIGludGVycnVwdC4gSW4gdGhpcyBjYXNl
IGENCj4gPj4+IG1pc3NpbmcgTVNJLg0KPiA+Pj4NCj4gPj4+IEJlcnRyYW5kLCBJIGJlbGlldmUg
eW91IHRyaWVkIHRoZSBHSUMgSVRTIGRyaXZlciB3aXRoIFBDSSBkZXZpY2VzDQo+ID4+PiByZWNl
bnRseS4gSXQgaXMgZXhwZWN0ZWQgdG8gd29yayBjb3JyZWN0bHkgd2l0aCBNU0lzIGluIERvbTAs
IHJpZ2h0Pw0KPiA+Pg0KPiA+PiBPU1NUZXN0IGhhcyBzb21lIGhhcmR3YXJlIChlLmcuIFRodW5k
ZXItWCkgd2hlcmUgSVRTIGlzIHJlcXVpcmVkIHRvDQo+ID4+IGJvb3QgRG9tMC4gSSBoYXZlbid0
IHNlZW4gYW55IGZhaWx1cmUgb24gcmVjZW50IFhlbi4gV2UgYXJlIHRlc3RpbmcNCj4gPj4gNC4x
MSBhbmQgb253YXJkcyBvbiBUaHVuZGVyLVguDQo+ID4+DQo+ID4+IEhvd2V2ZXIsIGl0IG1heSBi
ZSBwb3NzaWJsZSB0aGF0IHNvbWUgbW9yZSB3b3JrIGlzIG5lY2Vzc2FyeSBmb3INCj4gPj4gb3Ro
ZXIgaGFyZHdhcmUgKGUuZy4gd29ya2Fyb3VuZCwgbWlzc2luZyBjb2RlLi4uKS4gU2VlIG1vcmUg
YmVsb3cuDQo+ID4+DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+DQo+ID4+PiBPbiBUdWUsIDE3IE5vdiAy
MDIwLCBMZW8gS3J1ZWdlciB3cm90ZToNCj4gPj4+PiBIaSwNCj4gPj4+Pg0KPiA+Pj4+IEkgZW5h
YmxlZCBDT05GSUdfSEFTX0lUUyAod2hhdCBhIHN0dXBpZCBtaXN0YWtlIGJ5IG1lIHRvIG5vdCBz
ZXQgaXQNCj4gPj4+PiBiZWZvcmUuLi4pIGJ1dCB0aGVuIGhhZCB0byBhZGQgdGhlIGZvbGxvd2lu
ZyBub2RlIHRvIG15IGRldmljZSB0cmVlDQo+ID4+Pj4NCj4gPj4+PiAJZ2ljX2xwaV9iYXNlOiBz
eXNjb25AMHg4MDAwMDAwMCB7DQo+ID4+Pj4gCQljb21wYXRpYmxlID0gImdpYy1scGktYmFzZSI7
DQo+ID4+DQo+ID4+IEkgY291bGRuJ3QgZmluZCB0aGlzIGNvbXBhdGlibGUgZGVmaW5lZC91c2Vk
IGluIExpbnV4IDUuMTAtcmM0LiBATGVvLA0KPiA+PiBjb3VsZCB5b3UgY2xhcmlmeSB3aGljaCBm
bGF2b3IvdmVyc2lvbiBvZiBMaW51eCB5b3UgYXJlIHVzaW5nPw0KPiA+DQo+ID4gSXQgaXMgTGlu
dXggNC4xOSBmcm9tIFlvY3RvIChXYXJyb3IgcmVsZWFzZSkuIFhFTiA0LjEzLjIuDQo+IA0KPiBE
byB5b3UgaGF2ZSBhIGxpbmsgdG8gdGhlIExpbnV4IHRyZWU/IElzIHRoZXJlIGFueSBhZGRpdGlv
bmFsIHBhdGNoZXMgb24gdG9wIG9mDQo+IHZhbmlsbGE/DQoNCkxpbnV4IHRyZWUgaXMgZm91bmQg
aGVyZTogaHR0cHM6Ly9naXRodWIuY29tL2tvbnRyb24vbGludXgtc21hcmMtc2FsMjgvY29tbWl0
cy9tYXN0ZXItTFNESy0xOS4wOQ0KKHVwIHRvIHRoZSBsYXRlc3QgY29tbWl0IGluIHRoYXQgYnJh
bmNoKQ0KDQo+IA0KPiA+IFdoaWxlIHNlYXJjaGluZyBhcm91bmQgdGhlIEludGVybmV0IGZvciBh
bnkgc29sdXRpb24sIEkgY2FtZSBhY3Jvc3MgWzBdDQo+IHdoaWNoIGNvbnRhaW5lZCB0aGUgZ2lj
LWxwaS1iYXNlIG5vZGUuDQo+ID4gU28gSSBqdXN0IHRyaWVkIGFkZGluZyBpdCAocXVpdGUgZGVz
cGVyYXRlIEkga25vdykgYW5kIHZvaWxhLCBpdCBhdCBsZWFzdA0KPiBicm91Z2h0IG1lIG9uZSBz
dGVwIGZ1cnRoZXIgKFhFTiBleHBvc2luZyB0aGUgSVRTKS4uLg0KPiANCj4gSSBhbSBzbGlnaHRs
eSBjb25mdXNlZCB0byBob3cgdGhpcyB3b3VsZCBoZWxwLiBYZW4gYW5kLCBBRkFJQ1QsIExpbnV4
IGRvbid0DQo+IHVuZGVyc3RhbmQgZ2ljLWxwaS1iYXNlLiBEbyB5b3UgaGF2ZSBtb2RpZmljYXRp
b24gaW4geW91ciBMaW51eCB0byB1c2UgaXQ/DQoNCkkgaGF2ZSBubyBpZGVhLCB0byBiZSBob25l
c3QuIE1heWJlIGl0IGlzIGFib3V0IHRoZSBtZW1vcnkgYmVpbmcgcmVzZXJ2ZWQgZHVlIHRvIHRo
YXQgbm9kZSBvciBzb21ldGhpbmcgbGlrZSB0aGF0Pw0KDQo+IA0KPiBMb29raW5nIGF0IHRoZSBE
VCBjaGFuZ2VzIGluIFswXSwgaXQgbG9va3MgbGlrZSB0aGUgbm9kZSBpcyBub3QgYSBjaGlsZCBv
ZiBnaWNALg0KPiBTbyBJIHRoaW5rIFhlbiB3aWxsIG1hcCB0aGUgcmVnaW9uIHRvIERvbTAuDQo+
IA0KPiBUaGVyZSBhcmUgdHdvIHRoaW5ncyB0aGF0IEkgY2FuIG5vdGljZToNCj4gICAgMSkgVGhp
cyByZWdpb24gaXMgUkFNLCBidXQgSSBjYW4ndCBmaW5kIGFueSByZXNlcnZlIG5vZGUuIElzIHRo
ZXJlIGFueSBzcGVjaWZpYw0KPiBjb2RlIGluIExpbnV4IHRvIHJlc2VydmUgaXQ/DQo+ICAgIDIp
IFRoZSBpbXBsZW1lbnRhdGlvbiBpbiBVLWJvb3Qgc2VlbXMgdG8gc3VnZ2VzdCB0aGF0IHRoZSBm
aXJtd2FyZSB3aWxsDQo+IGNvbmZpZ3VyZSB0aGUgTFBJcyBhbmQgdGhlbiBlbmFibGUgaXQuIElm
IHRoYXQncyB0aGUgY2FzZSwgdGhlbiBYZW4gbmVlZHMgdG8NCj4gcmUtdXNlIHRoZSB0YWJsZSBp
biB0aGUgRFQgcmF0aGVyIHRoYW4gYWxsb2NhdGluZyBhIG5ldyBvbmUuDQo+IEhvd2V2ZXIsIEkg
d291bGQgaGF2ZSBleHBlY3RlZCBhbiBlcnJvciBtZXNzYWdlIGluIHRoZSBsb2c6DQo+IA0KPiAg
ICAgIkdJQ3YzOiBDUFV4OiBDYW5ub3QgaW5pdGlhbGl6ZSBMUElzIg0KPiANCj4gQXQgbGVhc3Qg
WGVuIHNob3VsZCBub3QgZXhwb3NlIGdpYy1scGktYmFzZSB0byB0aGUga2VybmVsLCBidXQgSSB3
aWxsIHdhaXQgb24NCj4gbW9yZSBkZXRhaWxzIGFib3V0IHRoZSBMaW51eCBrZXJuZWwgdXNlZCBi
ZWZvcmUgY29tbWVudGluZyBtb3JlLg0KPiANCj4gSSB3b3VsZCBhbHNvIGJlIGludGVyZXN0ZWQg
dG8ga25vdyBtb3JlIGRldGFpbHMgYWJvdXQgdGhlIGZhaWx1cmUgd2hlbiBnaWMtDQo+IGxwaS1i
YXNlIGlzIG5vdCBhZGRlZCBpbiB5b3VyIERULiBJbiBwYXJ0aWN1bGFyLCBJIGFtIGludGVyZXN0
ZWQgdG8gdW5kZXJzdGFuZA0KPiB3aHkgWGVuIHdvdWxkIG5vdCBleHBvc2UgdGhlIElUUyBhcyB3
ZSBkb24ndCBwYXJzZSB0aGF0IG5vZGUuDQoNCkhvdyBjYW4gSSBzdXBwbHkgeW91IHdpdGggbW9y
ZSBpbmZvcm1hdGlvbiBpbiByZWdhcmQgdG8gdGhhdD8gV2l0aG91dCB0aGF0IG5vZGUsIElUUyB3
YXMgbm90IGV4cG9zZWQgYXQgYWxsLg0KDQo+IA0KPiBbLi4uXQ0KPiANCj4gPiBGb3IgWEVOIDQu
MTMuMiBJIGhhZCB0byBhZGFwdCB5b3VyIHBhdGNoIHNsaWdodGx5IFsxXSwgc2VlIGJlbG93ICh5
ZXMgSSBrbm93LA0KPiBxdWl0ZSB1Z2x5IGluIHBhcnRzKS4NCj4gDQo+IE5vIHdvcnJpZXMsIGRl
YnVnIHBhdGNoZXMgYXJlIG5vdCBtZWFudCB0byBiZSBuaWNlIHRvIHJlYWQgOykuDQo+IA0KPiA+
IEZpbmQgYXR0YWNoZWQgdGhlIGJvb3QgbG9nIGFuZCBhbiBvdXRwdXQgb2YgInhsIGRtZXNnIiB3
aGljaCBpcyB0cnVuY2F0ZWQNCj4gZHVlIHRvIHRoZSBsYXJnZSBhbW91bnQgb2YgbWVzc2FnZXMu
DQo+ID4NCj4gPiBXaGVuIGVuYWJsaW5nIHRoZSBuZXR3b3JrIGludGVyZmFjZSAoZ2JlMCksIHRo
ZSBmb2xsb3dpbmcgb3V0cHV0IGlzDQo+IHZpc2libGU6DQo+ID4NCj4gPiByb290QGtvbnRyb24t
c2FsMjg6fiMgaXAgbGluayBzZXQgdXAgZGV2IGdiZTANCj4gPiAoWEVOKSB2Z2ljLXYzLWl0cy5j
OjkwMjpkMHYwIHZJVFMgIGNtZCAweDBjOiAwMDAwMDAxNzAwMDAwMDBjDQo+ID4gMDAwMDAwMDAw
MDAwMDAwMSAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gPiAoWEVOKSB2Z2lj
LXYzLWl0cy5jOjkwMjpkMHYwIHZJVFMgIGNtZCAweDA1OiAwMDAwMDAwMDAwMDAwMDA1DQo+ID4g
MDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gDQo+
IDB4YyBpcyBJTlYgYW5kIDB4NSBpcyBTWU5DLiBNb3N0IGxpa2VseSB0aGUgZHJpdmVyIHVubWFz
ayB0aGUgaW50ZXJydXB0IGJ5DQo+IHdyaXRpbmcgaW4gdGhlIHByb3BlcnR5IHRhYmxlIChhY2Nl
c3MgYXJlIG5vdCB0cmFwcGVkIHRvIFhlbikgYW5kIHRoZW4NCj4gcmVxdWVzdGVkIHRvIGludmFs
aWRhdGUgdGhlIGNhY2hlIHN0YXRlLg0KPiANCj4gPiBbICAgMzQuMDM0NTk4XSBBdGhlcm9zIDgw
MzEgZXRoZXJuZXQgMDAwMDowMDowMC4zOjA1OiBhdHRhY2hlZCBQSFkgZHJpdmVyDQo+IFtBdGhl
cm9zIDgwMzEgZXRoZXJuZXRdIChtaWlfYnVzOnBoeV9hZGRyPTAwMDA6MDA6MDAuMzowNSwgaXJx
PVBPTEwpDQo+ID4gWyAgIDM0LjA0MTExMV0gODAyMXE6IGFkZGluZyBWTEFOIDAgdG8gSFcgZmls
dGVyIG9uIGRldmljZSBnYmUwDQo+ID4gWyAgIDM0LjA0MTIwOV0gSVB2NjogQUREUkNPTkYoTkVU
REVWX1VQKTogZ2JlMDogbGluayBpcyBub3QgcmVhZHkNCj4gPiByb290QGtvbnRyb24tc2FsMjg6
fiMgWyAgIDM1LjA0MTk1MV0gZnNsX2VuZXRjIDAwMDA6MDA6MDAuMCBnYmUwOiBMaW5rIGlzDQo+
IERvd24NCj4gPiBbICAgMzguMTE0NDI2XSBmc2xfZW5ldGMgMDAwMDowMDowMC4wIGdiZTA6IExp
bmsgaXMgVXAgLSAxR2Jwcy9GdWxsIC0gZmxvdw0KPiBjb250cm9sIG9mZg0KPiA+IFsgICAzOC4x
MTQ1MDhdIElQdjY6IEFERFJDT05GKE5FVERFVl9DSEFOR0UpOiBnYmUwOiBsaW5rIGJlY29tZXMN
Cj4gcmVhZHkNCj4gPg0KPiA+IERvZXMgdGhhdCB0ZWxsIHlvdSBhbnl0aGluZz8NCj4gDQo+IEl0
IGlzIGF0IGxlYXN0IGEgZ29vZCBzaWduIGJlY2F1c2UgaXQgbWVhbnMgTGludXggaXMgYWJsZSB0
byBpbml0aWFsaXplL3RhbGsgdG8gdGhlDQo+IHZJVFMuDQo+IA0KPiBJIHdvdWxkIGxlYW4gdG93
YXJkcyBvbmUgKG9yIG11bHRpcGxlKSBpc3N1ZSB3aXRoIHBJVFMgYW5kL29yIHRoZSBkZXZpY2Ut
dHJlZQ0KPiBleHBvc2VkIHRvIExpbnV4LiBJIGFtIG5vdCBlbnRpcmVseSB3aGF0IGV4YWN0bHku
Li4gSSB0aGluayBoYXZpbmcgbW9yZSBkZXRhaWxzDQo+IGFib3V0IHRoZSBMaW51eCBzZXR1cCB3
b3VsZCBiZSBoZWxwZnVsLg0KDQpPayBsZXQgbWUga25vdyB3aGF0IHlvdSBuZWVkIGZyb20gbXkg
c2lkZS4gSSB3YXMgY29uc2lkZXJpbmcgdGhlIGZvbGxvd2luZyB0aGluZ3MgdG8gdHJ5IG91dCBu
ZXh0Og0KDQotIGEgbW9yZSByZWNlbnQgdS1ib290IHZlcnNpb24gYXMgdGhpcyBtaWdodCBmaXgg
cHJvYmxlbXMgd2l0aCB0aGUgbXNpLW1hcCAoYXQgbGVhc3QgdGhhdCBpcyB3aGF0IEkgdGhpbmss
IEkgYW0gbm90IGFuIGV4cGVydCBoZXJlKQ0KLSBhIGRpZmZlcmVudCBkZXZpY2UgdHJlZSAoYSBt
b3JlIHJlY2VudCBvbmUsIC4uLikNCi0gLi4uDQoNCj4gDQo+IEkgd2lsbCByZXBseSBvbiBSYWh1
bCdzIGUtbWFpbCBzZXBhcmF0ZWx5Lg0KPiANCj4gQ2hlZXJzLA0KDQpCZXN0IHdpc2hlcyENCg0K
PiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

