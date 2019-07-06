Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 243A861302
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 23:15:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjrxT-0004Vk-89; Sat, 06 Jul 2019 21:10:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dJJZ=VD=starlab.io=will.abele@srs-us1.protection.inumbo.net>)
 id 1hjrxR-0004Vd-Ll
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 21:10:57 +0000
X-Inumbo-ID: 8a6ba98e-a032-11e9-b606-c325e3ff8971
Received: from GCC01-CY1-obe.outbound.protection.outlook.com (unknown
 [40.107.83.127]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a6ba98e-a032-11e9-b606-c325e3ff8971;
 Sat, 06 Jul 2019 21:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3mIHt1icLiFiNK8CCbtpF0WYIsj+TuOA9y1n3IPluI=;
 b=mQS74DBQQudp4JyFW9vyeqCEzXGzpFuAcp7ylWShi8CHhrOLHPAG1DOdkPFbpQjcrE47KqbgIiBN9pQY4ilfMqhTX2JiCNwlypMZlI0bKkYT8FFmBlDNzOjDFm8PoBCE2yv+5YdOhbE5Sym5yk4B1v8vO0XPxNO700d+w3BYfAY=
Received: from DM6PR09MB3211.namprd09.prod.outlook.com (20.178.3.95) by
 DM6PR09MB2537.namprd09.prod.outlook.com (20.176.96.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Sat, 6 Jul 2019 21:10:52 +0000
Received: from DM6PR09MB3211.namprd09.prod.outlook.com
 ([fe80::85fb:bda:f7c:6420]) by DM6PR09MB3211.namprd09.prod.outlook.com
 ([fe80::85fb:bda:f7c:6420%2]) with mapi id 15.20.2052.019; Sat, 6 Jul 2019
 21:10:52 +0000
From: Will Abele <will.abele@starlab.io>
To: Julien Grall <Julien.Grall@arm.com>
Thread-Topic: [PATCH 0/1] Dom0less guest device tree format
Thread-Index: AQHVNCT8i/e9XHQvKUuqip9pKzLNp6a95d0AgAAAdQCAAC/3AA==
Date: Sat, 6 Jul 2019 21:10:52 +0000
Message-ID: <20190706211048.uvilbrefroxroli3@starlab.io>
References: <cover.1562435004.git.will.abele@starlab.io>
 <41ff241e-aa17-6033-25b0-80da519cd444@arm.com>
 <c3dd311a-732a-68e8-5b3d-0aa7dd8773c7@arm.com>
In-Reply-To: <c3dd311a-732a-68e8-5b3d-0aa7dd8773c7@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR0102CA0044.prod.exchangelabs.com
 (2603:10b6:208:25::21) To DM6PR09MB3211.namprd09.prod.outlook.com
 (2603:10b6:5:35::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=will.abele@starlab.io; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.246.142.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e23475c7-3af5-4638-ad13-08d702566d56
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR09MB2537; 
x-ms-traffictypediagnostic: DM6PR09MB2537:
x-microsoft-antispam-prvs: <DM6PR09MB253723F4AD71AE1ABBF5D9F1F6F40@DM6PR09MB2537.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39830400003)(346002)(376002)(366004)(51914003)(199004)(189003)(52116002)(6512007)(74482002)(508600001)(6486002)(102836004)(86362001)(186003)(305945005)(26005)(8936002)(76176011)(7736002)(53546011)(6506007)(386003)(8676002)(99286004)(6436002)(5660300002)(6246003)(14444005)(256004)(25786009)(53936002)(2906002)(81156014)(81166006)(4326008)(36756003)(44832011)(6916009)(73956011)(66946007)(66066001)(229853002)(66476007)(3846002)(6116002)(2616005)(316002)(1076003)(446003)(11346002)(476003)(66556008)(486006)(64756008)(54906003)(71190400001)(71200400001)(68736007)(66446008)(14454004)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR09MB2537;
 H:DM6PR09MB3211.namprd09.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: starlab.io does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CXadeStxMd5VX9gG0YvXnqOk+zW6AgIVL3P0EmyBR83ic0p7RtsJJdO9g/AECQvdBE5/2OOj2kSWBKTZPtzhm9JDq7CwAPZILhXOljDoqIzhBrbmo7ePZolsQptmKSwjE6frxkzQ02T4FFBsreNBm9n9UMBfV13BTWWOOH/AT84bB45Pic+5xyC/6T7qGpQYtMyBwrdsjtqF0wJMILZ1NJ7W5/8oWez3+WRWdAxsQ8P4X11CDZlq/J4vpDwF/CN4CP8E4swFg9R+wXOis+NSR4Ta3bWogn3IqX93w2Ta0FSM+RgZkoIb2Gmxzji5nlGk1brBvmnufuX4s2K/SJz6axtmSU+huGCtTQL151DdB5ejVPAyUK1GG4M6dem+mCFSirAgFYU0TTNL4mAzrBLbs2idDKth3fsT2XXfekuwyC0=
Content-ID: <655BDE63C5CC664E9C00279ADC5ABB1D@namprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-Network-Message-Id: e23475c7-3af5-4638-ad13-08d702566d56
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 21:10:52.3275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: will.abele@starlab.io
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR09MB2537
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIDA3LzA2LzIwMTkgMTg6MTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAw
Ni8wNy8yMDE5IDE5OjE3LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4gDQo+ID4gDQo+ID4gT24g
MDYvMDcvMjAxOSAxOTowMiwgV2lsbCBBYmVsZSB3cm90ZToNCj4gPj4gRnJvbTogV2lsbCBBYmVs
ZSA8d2lsbC5hYmVsZUBzdGFybGFiLmlvPg0KPiA+Pg0KPiA+PiBIaSwNCj4gPiANCj4gPiBIaSwN
Cj4gPiANCj4gPj4gSSd2ZSBiZWVuIHVzaW5nIGRvbTBsZXNzIFhlbiBvbiB0aGUgSGlrZXkgOTYw
IHdpdGggYSA0LjE0IExpbnV4IA0KPiA+PiBLZXJuZWwuIEkgaGFkDQo+ID4+IHRyb3VibGUgZ2V0
dGluZyB0aGUgNC4xNCBMaW51eCBLZXJuZWwgdG8gYm9vdCBhcyBhIGRvbTBsZXNzIGRvbVUgDQo+
ID4+IGJlY2F1c2UgaXQgd2FzDQo+ID4+IG1pc2ludGVycHJldGluZyB0aGUgZGV2aWNlIHRyZWUg
dmVyc2lvbi4gTGludXggNC4xNCBhbmQgZWFybGllciANCj4gPj4gaW50ZXJwcmV0IGRldmljZQ0K
PiA+PiB0cmVlcyB3aXRoIGEgIi8iIGluIHRoZSByb290IG5vZGUgYXMgdmVyc2lvbiAxNi4gWGVu
IHByb2R1Y2VzIGEgDQo+ID4+IHZlcnNpb24gMTcNCj4gPj4gZGV2aWNlIHRyZWUsIHNvIHRoZSBy
b290IG5vZGUgbmVlZHMgdG8gYmUgIiIgdG8gd29yayB3aXRoIDQuMTQgYW5kIA0KPiA+PiBlYXJs
aWVyIExpbnV4DQo+ID4+IEtlcm5lbHMuIExpbnV4IDQuMTUgYW5kIGxhdGVyIGFzc3VtZSB0aGF0
IHRoZSB2ZXJzaW9uIGlzIDE3LCBzbyB0aGlzIA0KPiA+PiBwYXRjaCBkb2VzDQo+ID4+IG5vdCBo
YXZlIGFueSBpbXBhY3QuDQo+ID4+DQo+ID4+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgbmVl
ZCBhbnkgbW9yZSBpbmZvcm1hdGlvbiBvciBoYXZlIA0KPiA+PiBzdWdnZXN0aW9ucyBmb3INCj4g
Pj4gb3RoZXIgd2F5cyB0byBoYW5kbGUgdGhpcy4NCj4gPiANCj4gPiBJIGRvbid0IHVuZGVyc3Rh
bmQgd2hlcmUgdGhlIHZlcnNpb24gY29tZXMgZnJvbS4gSSBhbHNvIGRvbid0IHVuZGVyc3RhbmQg
DQo+ID4gaG93IHlvdSBpbmZlcnJlZCB0aGF0IFhlbiBpcyBjcmVhdGluZyBhIHZlcnNpb24gMTcg
ZGV2aWNlLXRyZWUuDQo+ID4gDQo+ID4gRG8geW91IGhhdmUgbGluayB0byB0aGUgcGFyYWdyYXBo
IGluIHRoZSBzcGVjaWZpY2F0aW9ucz8NCj4gDQo+IEFsc28sIHBsZWFzZSBleHBhbmQgd2hhdCBp
cyB0aGUgZXhhY3QgZXJyb3IuIFNvIHdlIGNhbiB1bmRlcnN0YW5kIA0KPiB3aGV0aGVyIHRoaXMg
aXMgdGhlIHJpZ2h0IGZpeC4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3Jh
bGwNCg0KLS0gDQoNCkhpIEp1bGllbiwNCg0KVGhhbmtzIGZvciB0aGUgcHJvbXB0IHJlc3BvbnNl
Lg0KDQpJIHNhaWQgaW4gbXkgbWVzc2FnZSB0aGF0IExpbnV4IHdhcyBpbnRlcnByZXRpbmcgdGhl
IGRldmljZSB0cmVlIGFzIHZlcnNpb24gMTYuDQpMb29raW5nIHRocm91Z2ggdGhlIGNvZGUgYWdh
aW4sIEkgcmVhbGl6ZSBpdCB3YXMgYmVpbmcgaW50ZXJwcmV0ZWQgYXMgZWFybGllcg0KdGhhbiAx
Ni4gQXMgbWVudGlvbmVkIGluIExpbnV4IGNvbW1pdCBhN2U0Y2ZiMGE3Y2E0NzczZTdkMGRkMWQ5
YzAxOGFiMjdhMTUzNjBlLA0KTGludXggaGFkIGFscmVhZHkgYnJva2VuIHN1cHBvcnQgZm9yIEZE
VCB2ZXJzaW9ucyBlYXJsaWVyIHRoYW4gMTYuDQpwb3B1bGF0ZV9ub2RlKCkgaW4gZHJpdmVycy9v
Zi9mZHQuYyB3b3VsZCBzdG9wIHBhcnNpbmcgdGhlIGZkdCBhdCB0aGUgcm9vdCBub2RlDQppZiBp
dCB0aG91Z2h0IHRoZSBmZHQgdmVyc2lvbiB3YXMgZWFybGllciB0aGFuIDE2Lg0KDQpYZW4gc2V0
cyB0aGUgRkRUIHZlcnNpb24gdG8gMTcgaW4gZmR0X2NyZWF0ZSgpLg0KDQpUaGUgaXNzdWUgSSB3
YXMgaGF2aW5nIHdhcyB0aGF0IExpbnV4IHBhbmlja2VkIHdoaWxlIGluaXRpYWxpemluZyBpbnRl
cnJ1cHRzDQpiZWNhdXNlIGl0IGNvdWxkIG5vdCBmaW5kIGFuIGludGVycnVwdCBjb250cm9sbGVy
LiBJdCBjb3VsZG4ndCBmaW5kIHRoZQ0KaW50ZXJydXB0IGNvbnRyb2xsZXIgYmVjYXVzZSBpdCBk
aWRuJ3QgcHJvY2VzcyB0aGF0IHBhcnQgb2YgdGhlIGRldmljZSB0cmVlLg0KDQpUaGFua3MsDQpX
aWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
