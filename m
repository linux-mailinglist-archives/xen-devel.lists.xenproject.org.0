Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E87612A0
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 20:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjpFk-00076G-NY; Sat, 06 Jul 2019 18:17:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vVoM=VD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hjpFi-00076B-TF
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 18:17:39 +0000
X-Inumbo-ID: 54da1380-a01a-11e9-8980-bc764e045a96
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::607])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 54da1380-a01a-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 18:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTDbRtpH4osEXraNixeIq9J2GBJIZ+QpJu/jzCyGIeQ=;
 b=Mu2WaQN3PFb0T+ejTgeiKqLdUaxtjMXBExPdyakGhF0kgznsrj+6ebmDN4I1xie3cxBZ475G5ewMUH3kQ34B1FztfiLUXlR9FFj6M2+UhxK8ihEJpgCHVF0fAGlz9XtSJTcFmBcb0qulbuoAz272D8FknHMeYOl2ldD+ZZeNNk4=
Received: from AM6PR08MB5271.eurprd08.prod.outlook.com (10.255.123.151) by
 AM6PR08MB3223.eurprd08.prod.outlook.com (52.135.164.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Sat, 6 Jul 2019 18:17:35 +0000
Received: from AM6PR08MB5271.eurprd08.prod.outlook.com
 ([fe80::710f:e30c:686f:6d02]) by AM6PR08MB5271.eurprd08.prod.outlook.com
 ([fe80::710f:e30c:686f:6d02%5]) with mapi id 15.20.2052.019; Sat, 6 Jul 2019
 18:17:35 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Will Abele <will.abele@starlab.io>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/1] Dom0less guest device tree format
Thread-Index: AQHVNCT8i/e9XHQvKUuqip9pKzLNp6a95d0A
Date: Sat, 6 Jul 2019 18:17:34 +0000
Message-ID: <41ff241e-aa17-6033-25b0-80da519cd444@arm.com>
References: <cover.1562435004.git.will.abele@starlab.io>
In-Reply-To: <cover.1562435004.git.will.abele@starlab.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0060.eurprd07.prod.outlook.com
 (2603:10a6:6:2a::22) To AM6PR08MB5271.eurprd08.prod.outlook.com
 (2603:10a6:20b:ef::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b102d723-59c4-4ddc-f8fd-08d7023e380e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB3223; 
x-ms-traffictypediagnostic: AM6PR08MB3223:
x-microsoft-antispam-prvs: <AM6PR08MB3223AFE5158A2303D797F7FE80F40@AM6PR08MB3223.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(189003)(199004)(66946007)(73956011)(44832011)(229853002)(66476007)(66066001)(31686004)(2501003)(4326008)(36756003)(110136005)(64756008)(486006)(54906003)(14454004)(66446008)(68736007)(71200400001)(71190400001)(446003)(316002)(2616005)(6116002)(3846002)(66556008)(476003)(11346002)(102836004)(31696002)(86362001)(305945005)(186003)(8936002)(26005)(76176011)(6506007)(53546011)(7736002)(52116002)(6512007)(6486002)(478600001)(2906002)(53936002)(81166006)(81156014)(6436002)(8676002)(4744005)(386003)(72206003)(256004)(99286004)(25786009)(5660300002)(6246003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3223;
 H:AM6PR08MB5271.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1mtKR5UPuWOwRt15vX9ww8QdW6uxOBzxOa3rGYb1P3CQQJ4yHGmumr2Mr0WTE2mw1Ap14neDzU6zj5ZSJ6ZbAmixH2hmsPS7bl1I5qTPtu4eMRNb2RAn59W+3pK+2Bc0yoDAis6KdjBh4IlDrpoN8/ivawqLEsJLvDdHYug+2KJmTkxlqf37kf+ZQ1123269WpQfbIsSyremg4iQShulMgCADs6TFD5pvw4PfMPwmeAtWleOq5QjpOqC59mBLQw+kz+dEgLjDO3L7/slTJZxfwycUwB9CNvfHupKzcddUVMASE+50L8iq361ZKWGbcIiSiKfqJO4+NdKwEnLT77P5fXu8fS4vQRORB4oSCLY29+YQ1yJIz42hKchSEUkFBiF2modjuU0jWJsQtRmiR5GhBnYy/ZRSZrYQF1XjpaBVEc=
Content-ID: <C3CC09D29459CD41A9D9B6E2F8061A3B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b102d723-59c4-4ddc-f8fd-08d7023e380e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 18:17:34.9906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3223
Subject: Re: [Xen-devel] [PATCH 0/1] Dom0less guest device tree format
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA2LzA3LzIwMTkgMTk6MDIsIFdpbGwgQWJlbGUgd3JvdGU6DQo+IEZyb206IFdpbGwg
QWJlbGUgPHdpbGwuYWJlbGVAc3RhcmxhYi5pbz4NCj4gDQo+IEhpLA0KDQpIaSwNCg0KPiBJJ3Zl
IGJlZW4gdXNpbmcgZG9tMGxlc3MgWGVuIG9uIHRoZSBIaWtleSA5NjAgd2l0aCBhIDQuMTQgTGlu
dXggS2VybmVsLiBJIGhhZA0KPiB0cm91YmxlIGdldHRpbmcgdGhlIDQuMTQgTGludXggS2VybmVs
IHRvIGJvb3QgYXMgYSBkb20wbGVzcyBkb21VIGJlY2F1c2UgaXQgd2FzDQo+IG1pc2ludGVycHJl
dGluZyB0aGUgZGV2aWNlIHRyZWUgdmVyc2lvbi4gTGludXggNC4xNCBhbmQgZWFybGllciBpbnRl
cnByZXQgZGV2aWNlDQo+IHRyZWVzIHdpdGggYSAiLyIgaW4gdGhlIHJvb3Qgbm9kZSBhcyB2ZXJz
aW9uIDE2LiBYZW4gcHJvZHVjZXMgYSB2ZXJzaW9uIDE3DQo+IGRldmljZSB0cmVlLCBzbyB0aGUg
cm9vdCBub2RlIG5lZWRzIHRvIGJlICIiIHRvIHdvcmsgd2l0aCA0LjE0IGFuZCBlYXJsaWVyIExp
bnV4DQo+IEtlcm5lbHMuIExpbnV4IDQuMTUgYW5kIGxhdGVyIGFzc3VtZSB0aGF0IHRoZSB2ZXJz
aW9uIGlzIDE3LCBzbyB0aGlzIHBhdGNoIGRvZXMNCj4gbm90IGhhdmUgYW55IGltcGFjdC4NCj4g
DQo+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgbmVlZCBhbnkgbW9yZSBpbmZvcm1hdGlvbiBv
ciBoYXZlIHN1Z2dlc3Rpb25zIGZvcg0KPiBvdGhlciB3YXlzIHRvIGhhbmRsZSB0aGlzLg0KDQpJ
IGRvbid0IHVuZGVyc3RhbmQgd2hlcmUgdGhlIHZlcnNpb24gY29tZXMgZnJvbS4gSSBhbHNvIGRv
bid0IHVuZGVyc3RhbmQgDQpob3cgeW91IGluZmVycmVkIHRoYXQgWGVuIGlzIGNyZWF0aW5nIGEg
dmVyc2lvbiAxNyBkZXZpY2UtdHJlZS4NCg0KRG8geW91IGhhdmUgbGluayB0byB0aGUgcGFyYWdy
YXBoIGluIHRoZSBzcGVjaWZpY2F0aW9ucz8NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFs
bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
