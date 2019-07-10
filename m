Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C3C6462F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 14:31:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlBiV-0000Ze-3o; Wed, 10 Jul 2019 12:28:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hlBiT-0000ZZ-R2
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 12:28:57 +0000
X-Inumbo-ID: 429c430a-a30e-11e9-8bbc-afac728eb81d
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 429c430a-a30e-11e9-8bbc-afac728eb81d;
 Wed, 10 Jul 2019 12:28:52 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 10 Jul 2019 12:28:46 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 10 Jul 2019 12:26:53 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 10 Jul 2019 12:26:53 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2377.namprd18.prod.outlook.com (20.179.71.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Wed, 10 Jul 2019 12:26:51 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 12:26:51 +0000
From: Jan Beulich <JBeulich@suse.com>
To: IanJackson <Ian.Jackson@eu.citrix.com>
Thread-Topic: [Xen-devel] [xen-4.10-testing test] 138852: regressions -
 trouble: blocked/fail/pass/starved
Thread-Index: AQHVNuZ00hW4BKgZYkyOv5wHCKDbJabDx7QA
Date: Wed, 10 Jul 2019 12:26:51 +0000
Message-ID: <80d37f8d-b6b5-d596-b0cc-441e300053b6@suse.com>
References: <osstest-138852-mainreport@xen.org>
In-Reply-To: <osstest-138852-mainreport@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:610:4e::25) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.80.71.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d5df731-2d58-4052-1ac5-08d70531e2f2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2377; 
x-ms-traffictypediagnostic: DM6PR18MB2377:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR18MB237797AC441E6E018A2ECC78B3F00@DM6PR18MB2377.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(189003)(199004)(6246003)(5660300002)(66946007)(26005)(66476007)(68736007)(99286004)(64756008)(66556008)(66446008)(186003)(4326008)(31686004)(76176011)(256004)(486006)(14444005)(2906002)(80792005)(6916009)(476003)(2616005)(4744005)(446003)(11346002)(25786009)(316002)(102836004)(52116002)(54906003)(6512007)(386003)(6116002)(6436002)(36756003)(71190400001)(71200400001)(6486002)(66066001)(229853002)(966005)(81166006)(8676002)(8936002)(81156014)(7736002)(305945005)(86362001)(31696002)(6306002)(478600001)(53936002)(14454004)(3846002)(53546011)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2377;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dGKUy7Gq51IbIPWY95YG49yx92NvEJp88wHhI9uiFj0E/SeUUXQnzHj8l7KagAvUQGBx8NjAJaQy+BRN+vr2JVtON0zXtrf/OcG6NYwrnDgg71fq0OPjclnGobg8W4D/kfMvpcw/v+AzWEBZSDq0BFoA4J40rsWSJEd03uLvpHVVZJjizNJ/b/9PBexLAiB3otBjaKCHI8aUdKSKIeXO/IPsSrvd0c9yZAI2Rdmfi8MH0Kg66kFmyJk9z7V7ZJ8c+mLg4AklL5LRUudfpk1WEItqqwYdMOiIu1FMmd7fktq/qjHsQjPh3i/70lrl2GdyIZSbLK/x7vltAPBw8LA3t4zDBUQnT/EPd/YhHLCAfqfcdQX5vztnn1ymGXe4YSGPiLDGdweFwXjEocNYh1GtIIOtgcdn7W5p0IxuzDwUoAo=
Content-ID: <5CB3154815E09045AD6FA49579CA49DB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5df731-2d58-4052-1ac5-08d70531e2f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 12:26:51.6497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2377
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [xen-4.10-testing test] 138852: regressions -
 trouble: blocked/fail/pass/starved
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDcuMjAxOSAwODoxMCwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOg0KPiBmbGln
aHQgMTM4ODUyIHhlbi00LjEwLXRlc3RpbmcgcmVhbCBbcmVhbF0NCj4gaHR0cDovL2xvZ3MudGVz
dC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzODg1Mi8NCj4gDQo+IFJlZ3Jlc3Np
b25zIDotKA0KPiANCj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tp
bmcsDQo+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOg0KPiAgIGJ1aWxk
LWFtZDY0LXByZXYgICAgICAgICAgICAgIDYgeGVuLWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwg
UkVHUi4gdnMuIDEzODM3Ng0KDQpUaGlzDQoNCmJ1aWxkLnB5Li4uDQovaG9tZS9vc3N0ZXN0L2J1
aWxkLjEzODg1Mi5idWlsZC1hbWQ2NC1wcmV2L3hlbi90b29scy9maXJtd2FyZS9vdm1mLWRpci1y
ZW1vdGUvQ3J5cHRvUGtnL0xpYnJhcnkvT3BlbnNzbExpYi9PcGVuc3NsTGliQ3J5cHRvLmluZigt
MSk6IGVycm9yIDAwMEU6IEZpbGUvZGlyZWN0b3J5IG5vdCBmb3VuZCBpbiB3b3Jrc3BhY2UNCgkv
aG9tZS9vc3N0ZXN0L2J1aWxkLjEzODg1Mi5idWlsZC1hbWQ2NC1wcmV2L3hlbi90b29scy9maXJt
d2FyZS9vdm1mLWRpci1yZW1vdGUvQ3J5cHRvUGtnL0xpYnJhcnkvT3BlbnNzbExpYi9vcGVuc3Ns
L2Vfb3MuaA0KDQppcyB3aGF0IGxvb2tzIHRvIGJlIGNhdXNpbmcgdGhlIGJ1aWxkIGZhaWx1cmUu
IFRoZXJlIGlzIHNvbWUgZWFybGllcg0KZmFpbHVyZSBvZiBhIHRlc3QgdGhhdCBnZXRzIHJ1biBp
bnNpZGUgT1ZNRidzIGJ1aWxkLCBidXQgaXQgbG9va3MgYXMNCmlmIHRoYXQgZmFpbHVyZSB3YXMg
aWdub3JlZC4NCg0KUXVlc3Rpb24gbm93IGlzIC0gaXMgdGhpcyBwbGF1c2libHkgc29tZXRoaW5n
IHRoYXQnbGwgYmUgZml4ZWQgYnkNCnlvdXIgb3NzdGVzdCBjb21taXQgb3ZlcnJpZGUgY2hhbmdl
Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
