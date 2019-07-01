Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082745B924
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 12:38:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhteH-000506-V1; Mon, 01 Jul 2019 10:35:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhteG-000501-Nj
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 10:35:00 +0000
X-Inumbo-ID: 886d1154-9beb-11e9-b3a6-9ba9e922851c
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 886d1154-9beb-11e9-b3a6-9ba9e922851c;
 Mon, 01 Jul 2019 10:34:56 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 10:32:28 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 10:32:29 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 10:32:29 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3121.namprd18.prod.outlook.com (10.255.136.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Mon, 1 Jul 2019 10:32:28 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 10:32:28 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Ian Jackson <ian.jackson@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [xen-4.7-testing test] 138307: regressions - FAIL
Thread-Index: AQHVL/P3kv+ti3aDFEKENw4SQaI6cKa1kJkA
Date: Mon, 1 Jul 2019 10:32:27 +0000
Message-ID: <1cf4768d-6bcd-05ce-d10f-4cbc11eb0cfb@suse.com>
References: <osstest-138307-mainreport@xen.org>
 <23833.55752.614954.80320@mariner.uk.xensource.com>
In-Reply-To: <23833.55752.614954.80320@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR04CA0023.eurprd04.prod.outlook.com
 (2603:10a6:10:12::36) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ab5be19-01b5-4e80-cff4-08d6fe0f6a19
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3121; 
x-ms-traffictypediagnostic: BY5PR18MB3121:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BY5PR18MB31214ABE7A657EBC2515EC8FB3F90@BY5PR18MB3121.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(199004)(189003)(966005)(6306002)(7736002)(305945005)(4744005)(476003)(99286004)(446003)(86362001)(2616005)(11346002)(52116002)(31696002)(72206003)(14454004)(486006)(6246003)(110136005)(478600001)(316002)(256004)(5660300002)(14444005)(53936002)(26005)(6506007)(76176011)(73956011)(64756008)(2906002)(66946007)(68736007)(66556008)(66476007)(66446008)(71200400001)(186003)(71190400001)(2501003)(3846002)(6116002)(386003)(53546011)(66066001)(102836004)(6512007)(81156014)(25786009)(81166006)(80792005)(229853002)(31686004)(8676002)(6486002)(36756003)(8936002)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3121;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yHvZKerV3QqamK+CU80W2i8ETcglnkBP3QsPndjGuvxm7lIywrsrvfMb38reVWYaQ0RvTchfXmaqBo1k9kX2j84w4S36mPRRGKhZi47hJp+tsFynNWqaBwDFQ6WUDroX9zBVuB3jBUye4g+v1VaK3DwEEPWW7aFs53FU+t/UyHSTXE1UGm3LfMzxvK/sZF90wvsqJRzR42dgMQxqRNnDDRcebSdaR0zgsgg8R/Riv9xw8ZEq4UqJ+RwL5+GxvrGykGaUnZvvo0bXOngTjbFb2kctU79Wdxmw74bXNWyGcB5Am4XUBDVDYNcWEb7FPPYpGZJ11aMwaEDNCgWxrmiVOf4GvxEtHl9Zi6Wr6dsVjXfllD47cl6bVEchGml6Mtvjp7ApojLLNqfDf8XtVxf1alICqUtQuRQ22+yd4p/jdqA=
Content-ID: <41D75896EDC76941A8D3EDDA27C7F2F2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab5be19-01b5-4e80-cff4-08d6fe0f6a19
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 10:32:27.9813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3121
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [xen-4.7-testing test] 138307: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxMjowMCwgSWFuIEphY2tzb24gd3JvdGU6DQo+IG9zc3Rlc3Qgc2Vydmlj
ZSBvd25lciB3cml0ZXMgKCJbeGVuLTQuNy10ZXN0aW5nIHRlc3RdIDEzODMwNzogcmVncmVzc2lv
bnMgLSBGQUlMIik6DQo+PiBmbGlnaHQgMTM4MzA3IHhlbi00LjctdGVzdGluZyByZWFsIFtyZWFs
XQ0KPj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEz
ODMwNy8NCj4+DQo+PiBSZWdyZXNzaW9ucyA6LSgNCj4+DQo+PiBUZXN0cyB3aGljaCBkaWQgbm90
IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywNCj4+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3Vs
ZCBub3QgYmUgcnVuOg0KPj4gICBidWlsZC1pMzg2LXByZXYgICAgICAgICAgICAgICA2IHhlbi1i
dWlsZCAgICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzM1OTYNCj4+ICAgYnVpbGQtYW1k
NjQtcHJldiAgICAgICAgICAgICAgNiB4ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdS
LiB2cy4gMTMzNTk2DQo+IA0KPiBUaGlzIGlzIG5vdCBleHBlY3RlZC4gIEJ1dCB0aGlzIGJyYW5j
aCBpcyBvdXQgb2Ygc2VjdXJpdHkgc3VwcG9ydCBhbmQNCj4gdGhlIG9ubHkgZWZmZWN0IGlzIHRo
YXQgd2UgY291bGQgbm90IGRvIHRoZSA0LjYgdG8gNC43IG1pZ3JhdGlvbiB0ZXN0Lg0KDQpJJ3Zl
IHRha2VuIGEgbG9vayAtIGl0J3MgdGhlIE9WTUYgYnVpbGQgdGhhdCBmYWlscy4NCg0KPiBVbmxl
c3Mgc29tZW9uZSBvYmplY3RzIEkgd2lsbCBmb3JjZSBwdXNoIGl0Lg0KDQpJJ2Qgc2F5IC0gZ28g
YWhlYWQuDQoNCkphbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
