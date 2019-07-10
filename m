Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF1F63F76
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 04:56:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl2ir-0002tQ-2E; Wed, 10 Jul 2019 02:52:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hl2ip-0002tL-Td
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 02:52:43 +0000
X-Inumbo-ID: c9352c06-a2bd-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c9352c06-a2bd-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 02:52:42 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 10 Jul 2019 02:52:40 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 10 Jul 2019 02:51:49 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 10 Jul 2019 02:51:49 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3404.namprd18.prod.outlook.com (10.255.174.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Wed, 10 Jul 2019 02:51:48 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 02:51:48 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] MAINTAINERS: Make myself libxl golang binding maintainer
Thread-Index: AQHVNpLJUMWQBnbrCUuTPDOylHOhYqbDJ68A
Date: Wed, 10 Jul 2019 02:51:48 +0000
Message-ID: <fa0392b6-1099-9a2b-84fe-92d260320d16@suse.com>
References: <20190709201314.1426-1-george.dunlap@citrix.com>
In-Reply-To: <20190709201314.1426-1-george.dunlap@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:610:4e::39) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.80.71.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6e0970e-3b2f-42ec-0caa-08d704e18d8b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3404; 
x-ms-traffictypediagnostic: DM6PR18MB3404:
x-microsoft-antispam-prvs: <DM6PR18MB34045C4F22B86393793819BDB3F00@DM6PR18MB3404.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(189003)(199004)(229853002)(8936002)(6486002)(6436002)(110136005)(6512007)(54906003)(6506007)(4326008)(386003)(3846002)(52116002)(6116002)(478600001)(26005)(71200400001)(53546011)(76176011)(102836004)(99286004)(31686004)(25786009)(316002)(53936002)(14454004)(256004)(446003)(2906002)(186003)(2616005)(4744005)(80792005)(81166006)(5660300002)(476003)(86362001)(31696002)(36756003)(66476007)(66946007)(2501003)(305945005)(8676002)(66556008)(68736007)(66446008)(64756008)(81156014)(66066001)(486006)(7736002)(6246003)(71190400001)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3404;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0qn3cTbzon4Som7f1Qr52efaqyTBC9ki895GdgFEwK9ADgUrdnbvxgaS+2ZPBEad/JxLf0m7wmOt0siE/uxiwYXeiJgQWxfvzzazuaiLXXRMARBRrHrC9vgXvsnV5Z3Ozwybg6VQ9iUA0bXPSWH11WcrxOEVxqjMh+hCp34uKsU1GA/epFygaIzCSUPBtX3UqrB9/7x6KEPXz57MlVed54AM43efYM56t2ZZIYVNUuR4puD2qR9cSxdfBYjKQDtDW1ir/ZCp+9z6NYI8aA1z0/zzQRNaQaaMBFntIp690jF+/B0GXPkrX861X+gSVux0og/hQyWIskzpezEa34TmtG4RcQrLE+8ExoLt608GuGrNvSv8lPfvM04KZ0Mrh2vSSrS1bANcbZ7NcmD2d142UWwtEDSGLkczT+MzFclLoe8=
Content-ID: <87A5563AB2BE4F4DA36B90F5B6AB9DD5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e0970e-3b2f-42ec-0caa-08d704e18d8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 02:51:48.6456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3404
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Make myself libxl golang
 binding maintainer
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad
 Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDcuMjAxOSAyMjoxMywgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gLS0tIGEvTUFJTlRB
SU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTM0Myw2ICszNDMsMTEgQEAgTToJTWFy
ZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29t
Pg0KPiAgIFM6CVN1cHBvcnRlZA0KPiAgIEY6CXRvb2xzL3B5dGhvbg0KPiAgIA0KPiArR09MQU5H
IEJJTkRJTkdTDQo+ICtNOiAgICAgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPg0KPiArUzogICAgIE1haW50YWluZWQNCj4gK0Y6ICAgICB0b29scy9nb2xhbmcNCj4gKw0K
PiAgIFFFTVUtRE0NCj4gICBNOglJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4NCj4gICBTOglTdXBwb3J0ZWQNCg0KVGhpcyBkb2Vzbid0IGxvb2sgdG8gYmUgdGhlIGFscGhh
YmV0aWNhbGx5IGNvcnJlY3Qgc2xvdCB0byBpbnNlcnQNCnRoaXMgc2VjdGlvbi4gWWV0IGluc3Rl
YWQgb2YgbW92aW5nIGl0IHBlcmhhcHMgaXRzIHRpdGxlIHNob3VsZA0KYmUgImxpYnhsIGdvbGFu
ZyBiaW5kaW5ncyI/DQoNCkFsc28gcGxlYXNlIHVzZSB0YWJzIGxpa2Ugc3Vycm91bmRpbmcgc2Vj
dGlvbnMgZG8uDQoNCkphbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
