Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDBF59790
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 11:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgnDq-0004lx-43; Fri, 28 Jun 2019 09:31:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgnDo-0004ls-L3
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 09:31:08 +0000
X-Inumbo-ID: 74224c32-9987-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 74224c32-9987-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 09:31:06 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 28 Jun 2019 09:31:06 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 28 Jun 2019 09:29:53 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 28 Jun 2019 09:29:53 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2572.namprd18.prod.outlook.com (20.179.106.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Fri, 28 Jun 2019 09:29:53 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::302a:6fe1:31f0:3abf]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::302a:6fe1:31f0:3abf%4]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 09:29:53 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 1/5] make: simplify setting HOST{CC/CXX}
Thread-Index: AQHVLZQKRk+ndxEiz0+XlRTNmtzJFA==
Date: Fri, 28 Jun 2019 09:29:53 +0000
Message-ID: <decd4108-1234-921f-ba89-f2eec18d21f5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0043.namprd07.prod.outlook.com
 (2603:10b6:a03:60::20) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9cf8dad-5583-466e-55bb-08d6fbab2cc8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2572; 
x-ms-traffictypediagnostic: DM6PR18MB2572:
x-microsoft-antispam-prvs: <DM6PR18MB257272CC4E453556F8CBD59BB3FC0@DM6PR18MB2572.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(189003)(199004)(386003)(7736002)(6916009)(2616005)(72206003)(316002)(53936002)(476003)(31696002)(86362001)(25786009)(8936002)(14454004)(3846002)(6246003)(5660300002)(2906002)(6436002)(4326008)(256004)(66476007)(66556008)(99286004)(66446008)(73956011)(229853002)(6116002)(486006)(54906003)(6512007)(478600001)(8676002)(66946007)(71190400001)(71200400001)(102836004)(80792005)(7416002)(31686004)(52116002)(305945005)(68736007)(186003)(66066001)(36756003)(6486002)(6506007)(53546011)(64756008)(26005)(81156014)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2572;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6gRgx0sXhalD5l8mJQIYP+1xJash+cUPPW7C/r0vhuyIifpm9kgaJmt5HWwd8lKlnv2u9TYCf1PnZKof93+51SCO+Ek7praqTlKacvWoxJkO43Ee61cuhvTVEq++T5SukxeIm9d4mdobpLxb+MphGyR3pq2gyUpxUX4NBLj1kMNidbmCFneu6VR0kOIC2MSH507ORtO/vlxudCARHQP1kNQABriDoXqtgCOkuF2OxT8xk54lQZEPhgpaWMFsxGyuSzdZPLOwidrr3cIXhlWAWoFS5fiGQEdcw8FffCZkkBeMnttHVkH1MC3E7Ikz8Z9KalJWjAJkvb2XhKC1svZ8Xwlyqkz5ePnMxdI77odmEto46gj99nNTbiBOT7bK+G0Ph1S0lVFDYEJHuAV+3j0qsCb7RESZ6xluaIKd1BqUTOs=
Content-ID: <89BB767FB5E0C44D8837D9E1E632352F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f9cf8dad-5583-466e-55bb-08d6fbab2cc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 09:29:53.0898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2572
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/5] make: simplify setting HOST{CC/CXX}
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "Ian.Jackson@eu.citrix.com" <Ian.Jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ID4+PiBPbiAyNi4wNi4xOSBhdCAxNTo1NSwgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToN
CiA+IC0tLSBhL0NvbmZpZy5taw0KID4gKysrIGIvQ29uZmlnLm1rDQogPiBAQCAtMzksMjIgKzM5
LDEyIEBAIERFU1RESVIgICAgID89IC8NCiA+ICAjIEFsbG93IHBob255IGF0dHJpYnV0ZSB0byBi
ZSBsaXN0ZWQgYXMgZGVwZW5kZW5jeSByYXRoZXIgdGhhbiBmYWtlIA0KdGFyZ2V0DQogPiAgLlBI
T05ZOiAucGhvbnkNCiA+DQogPiAtIyBJZiB3ZSBhcmUgbm90IGNyb3NzLWNvbXBpbGluZywgZGVm
YXVsdCBIT1NUQ3tDL1hYfSB0byBDe0MvWFh9DQogPiAtaWZlcSAoJChYRU5fVEFSR0VUX0FSQ0gp
LCAkKFhFTl9DT01QSUxFX0FSQ0gpKQ0KID4gLUhPU1RDQyA/PSAkKENDKQ0KID4gLUhPU1RDWFgg
Pz0gJChDWFgpDQogPiAtZW5kaWYNCiA+IC0NCiA+ICAjIFVzZSBDbGFuZy9MTFZNIGluc3RlYWQg
b2YgR0NDPw0KID4gIGNsYW5nID89IG4NCiA+ICBpZmVxICgkKGNsYW5nKSxuKQ0KID4gIGdjYyA6
PSB5DQogPiAtSE9TVENDID89IGdjYw0KID4gLUhPU1RDWFggPz0gZysrDQogPiAgZWxzZQ0KID4g
IGdjYyA6PSBuDQogPiAtSE9TVENDID89IGNsYW5nDQogPiAtSE9TVENYWCA/PSBjbGFuZysrDQog
PiAgZW5kaWYNCg0KVGhlIGluY2x1c2lvbiBwb2ludCBsZWFkaW5nIHRvIGNvbmZpZy9TdGRHTlUu
bWsgc2l0cyBiZWxvdw0KaGVyZSBhZmFpY3QsIHNvIEkgZG9uJ3Qgc2VlIGhvdyAuLi4NCg0KID4g
LS0tIGEvY29uZmlnL1N0ZEdOVS5taw0KID4gKysrIGIvY29uZmlnL1N0ZEdOVS5taw0KID4gQEAg
LTksNiArOSwxMCBAQCBDQyAgICAgICAgPz0gJChDUk9TU19DT01QSUxFKWdjYw0KID4gIENYWCAg
ICAgICA/PSAkKENST1NTX0NPTVBJTEUpZysrDQogPiAgTERfTFRPICAgID89ICQoQ1JPU1NfQ09N
UElMRSlsZA0KID4gIGVuZGlmDQogPiArDQogPiArSE9TVENDICAgID89ICQoQ0MpDQogPiArSE9T
VENYWCAgID89ICQoQ1hYKQ0KDQouLi4gdGhlc2UgYXJlIGV2ZXJ5IGdvaW5nIHRvIHRha2UgZWZm
ZWN0IC0gdGhlIHR3byB2YXJpYWJsZXMgYXJlbid0DQp1bnNldCBhbnltb3JlIGF0IHRoYXQgcG9p
bnQuIEZ1cnRoZXJtb3JlLCB3aGVuIENST1NTX0NPTVBJTEUNCmlzIG5vdCBlbXB0eSwgdGhpcyBp
cyBjZXJ0YWlubHkgbm90IHdoYXQgd2Ugd2FudC4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
