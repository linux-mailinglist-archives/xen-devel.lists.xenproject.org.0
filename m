Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706445BAF6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 13:45:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhuhw-00054R-CP; Mon, 01 Jul 2019 11:42:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhuhv-00054M-NK
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 11:42:51 +0000
X-Inumbo-ID: 58df35ca-9bf5-11e9-9d72-6bddff2a6330
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58df35ca-9bf5-11e9-9d72-6bddff2a6330;
 Mon, 01 Jul 2019 11:42:47 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP
 FOR xen-devel@lists.xenproject.org; Mon,  1 Jul 2019 11:42:41 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:42:13 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:42:13 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3204.namprd18.prod.outlook.com (10.255.137.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Mon, 1 Jul 2019 11:42:12 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:42:12 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [ANNOUNCE] Xen 4.13 Development Update
Thread-Index: AQHVMAEoGc29zgNUHE25BYAbOrgbcKa1o/oA
Date: Mon, 1 Jul 2019 11:42:12 +0000
Message-ID: <30a2c632-c3be-24e4-94a8-10b83f607197@suse.com>
References: <20190701113534.10553-1-jgross@suse.com>
In-Reply-To: <20190701113534.10553-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::18) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2c15443-8778-41d2-c104-08d6fe192852
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3204; 
x-ms-traffictypediagnostic: BY5PR18MB3204:
x-microsoft-antispam-prvs: <BY5PR18MB3204510CE10C2C2D15096C92B3F90@BY5PR18MB3204.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(199004)(189003)(478600001)(6862004)(26005)(6116002)(3846002)(31686004)(68736007)(25786009)(186003)(81166006)(6636002)(256004)(102836004)(99286004)(446003)(53546011)(476003)(2616005)(11346002)(52116002)(81156014)(76176011)(80792005)(6506007)(386003)(8676002)(486006)(8936002)(6486002)(6436002)(53936002)(71190400001)(71200400001)(6512007)(66446008)(64756008)(66556008)(66476007)(14454004)(66946007)(73956011)(2906002)(229853002)(72206003)(6246003)(31696002)(305945005)(4744005)(37006003)(86362001)(66066001)(316002)(7736002)(36756003)(5660300002)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3204;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KHXf6hO/17pCKh3aykvTSq1Sj9li4Xf9eYsRRzBy/nD35PlVOluF79lCjhZME8iy+PXCVtyh3LQf4ntZ0oeWXuXpUJ+5LFOswBOgWTKxdIUWXbQKP/d4tpBwwBpgQfIB9aYAodrQpGJY7IimxekoW4d4gUsmm1H2zjchoEStq6v77LS30o2zeBZe454HhdCBWNwRWMCmCd158yxYrUSFaQx0T/PF7Arefl3cV1dB2frig1zcIFOB6UTZK5YgW5YDc9st5b6pcS17Bg6mPuSnpaSQMVZ+HuY4y7seZ/aEkM0pzMpWsy3AYw8tKVE58m0djC1uDWGCIoWqPrp5pDwZrf8N3ZTYspbgqtqyg7g6s6VwEASeMEwBNBJf7kF6Wf7hlcKGT9h7aTrKUZh6I5GNnYtgfyU8i+m0XxaTnvh+L2M=
Content-ID: <30BAD21A01813B44B5B42AAEEC38C744@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c15443-8778-41d2-c104-08d6fe192852
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:42:12.7341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3204
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxMzozNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gPT09IHg4NiA9PT0N
Cj4gDQo+ICogIFBWLUlPTU1VICh2NykNCj4gICAgLSAgUGF1bCBEdXJyYW50DQo+IA0KPiAqICBI
Vk0gZ3Vlc3QgQ1BVIHRvcG9sb2d5IHN1cHBvcnQgKFJGQykNCj4gICAgLSAgQ2hhbyBHYW8NCj4g
DQo+ICogIEludGVsIFByb2Nlc3NvciBUcmFjZSB2aXJ0dWFsaXphdGlvbiBlbmFibGluZyAodjEp
DQo+ICAgIC0gIEx1d2VpIEthbmcNCj4gDQo+ICogIExpbnV4IHN0dWIgZG9tYWlucyAoUkZDIHYy
KQ0KPiAgICAtICBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kNCj4gDQo+ICogIEltcHJvdmUg
bGF0ZSBtaWNyb2NvZGUgbG9hZGluZyAodjcpDQo+ICAgIC0gIENoYW8gR2FvDQo+IA0KPiAqICBG
aXhlcyB0byAjREIgaW5qZWN0aW9uDQo+ICAgIC0gIEFuZHJldyBDb29wZXINCj4gDQo+ICogIENQ
VUlEL01TUiBYZW4vdG9vbHN0YWNrIGltcHJvdmVtZW50cw0KPiAgICAtICBBbmRyZXcgQ29vcGVy
DQo+IA0KPiAqICBJbXByb3ZlbWVudHMgdG8gZG9tYWluX2NyYXNoKCkNCj4gICAgLSAgQW5kcmV3
IENvb3Blcg0KPiANCj4gKiAgeDJBUElDIHN1cHBvcnQgZm9yIEFNRCAodjIpDQo+ICAgIC0gIEph
biBCZXVsaWNoDQo+IA0KPiAqICBFSUJSUw0KPiAgICAtICBBbmRyZXcgQ29vcGVyDQoNCldhc24n
dCB0aGUgQVZYNTEyIGVtdWxhdG9yIHdvcmsgKG5vdyBhdCB2OSkgb24gdGhpcyBsaXN0IGVhcmxp
ZXIgb24/DQoNCkphbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
