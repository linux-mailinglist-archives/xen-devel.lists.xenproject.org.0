Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FE9190B4D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 11:42:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGgxM-0003J6-LN; Tue, 24 Mar 2020 10:38:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Uq2/=5J=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1jGgxK-0003J1-Tb
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 10:38:46 +0000
X-Inumbo-ID: 8bc18cca-6dbb-11ea-b34e-bc764e2007e4
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bc18cca-6dbb-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 10:38:08 +0000 (UTC)
Received: from MK-DB.hygon.cn ([172.23.18.60])
 by spam2.hygon.cn with ESMTP id 02OAb0Dd061282;
 Tue, 24 Mar 2020 18:37:00 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex02.Hygon.cn ([172.23.18.12])
 by MK-DB.hygon.cn with ESMTP id 02OAasHf083229;
 Tue, 24 Mar 2020 18:36:54 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex02.Hygon.cn
 (172.23.18.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Tue, 24 Mar
 2020 18:36:35 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Tue, 24 Mar 2020 18:36:35 +0800
From: Wen Pu <puwen@hygon.cn>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH] SVM: Add union intstat_t for offset 68h in vmcb struct
Thread-Index: AQHWAZgSRDyLTQE8MEqwgJou4KGvbKhW7i+AgAAYs4A=
Date: Tue, 24 Mar 2020 10:36:35 +0000
Message-ID: <ce9ce734-8abb-b85e-98cb-f294478b568f@hygon.cn>
References: <20200324045219.2110-1-puwen@hygon.cn>
 <688ba3ba-edaa-c504-cceb-b2e7f4f4214e@suse.com>
In-Reply-To: <688ba3ba-edaa-c504-cceb-b2e7f4f4214e@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A9EF6D49A408F4DB7A5E33291E45300@Hygon.cn>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: spam2.hygon.cn 02OAb0Dd061282
X-DNSRBL: 
Subject: Re: [Xen-devel] [PATCH] SVM: Add union intstat_t for offset 68h in
 vmcb struct
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
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAyMC8zLzI0IDE3OjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjQuMDMuMjAyMCAw
NTo1MiwgUHUgV2VuIHdyb3RlOg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVk
c3ZtLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jDQo+PiBAQCAt
NTA4LDcgKzUwOCw3IEBAIHN0YXRpYyBpbnQgbnN2bV92bWNiX3ByZXBhcmU0dm1ydW4oc3RydWN0
IHZjcHUgKnYsIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgICAgfQ0KPj4gICAN
Cj4+ICAgICAgIC8qIFNoYWRvdyBNb2RlICovDQo+PiAtICAgIG4ydm1jYi0+aW50ZXJydXB0X3No
YWRvdyA9IG5zX3ZtY2ItPmludGVycnVwdF9zaGFkb3c7DQo+PiArICAgIG4ydm1jYi0+aW50X3N0
YXQuaW50cl9zaGFkb3cgPSBuc192bWNiLT5pbnRfc3RhdC5pbnRyX3NoYWRvdzsNCj4gDQo+IFdo
aWxlIGJpdCAxIGlzIGlycmVsZXZhbnQgdG8gVk1SVU4sIEkgc3RpbGwgd29uZGVyIHdoZXRoZXIg
eW91DQo+IHNob3VsZG4ndCBjb3B5ICJyYXciIGhlcmUuDQoNCk9rLCB3aWxsIGNvcHkgdGhlIHdo
b2xlICJyYXciIGFzIHN1Z2dlc3RlZCwgdGhhbmtzLg0KDQo+PiBAQCAtMTA1OCw3ICsxMDU4LDcg
QEAgbnN2bV92bWNiX3ByZXBhcmU0dm1leGl0KHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgY3B1X3Vz
ZXJfcmVncyAqcmVncykNCj4+ICAgICAgICAgICBuc192bWNiLT5fdmludHIuZmllbGRzLmludHJf
bWFza2luZyA9IDA7DQo+PiAgIA0KPj4gICAgICAgLyogU2hhZG93IG1vZGUgKi8NCj4+IC0gICAg
bnNfdm1jYi0+aW50ZXJydXB0X3NoYWRvdyA9IG4ydm1jYi0+aW50ZXJydXB0X3NoYWRvdzsNCj4+
ICsgICAgbnNfdm1jYi0+aW50X3N0YXQuaW50cl9zaGFkb3cgPSBuMnZtY2ItPmludF9zdGF0Lmlu
dHJfc2hhZG93Ow0KPiANCj4gU2FtZSBoZXJlLCBvciBhdCB0aGUgdmVyeSBsZWFzdCB5b3Ugd2Fu
dCB0byBhbHNvIGNvcHkgYml0IDEgaGVyZS4NCg0KT2ssIHdpbGwgY2hhbmdlIHRvOg0KICAgICAv
KiBJbnRlcnJ1cHQgc3RhdGUgKi8NCiAgICAgbnNfdm1jYi0+aW50X3N0YXQgPSBuMnZtY2ItPmlu
dF9zdGF0Ow0KDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm1kZWJ1Zy5jDQo+PiAr
KysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm1kZWJ1Zy5jDQo+PiBAQCAtNTEsOSArNTEsOSBA
QCB2b2lkIHN2bV92bWNiX2R1bXAoY29uc3QgY2hhciAqZnJvbSwgY29uc3Qgc3RydWN0IHZtY2Jf
c3RydWN0ICp2bWNiKQ0KPj4gICAgICAgcHJpbnRrKCJpb3BtX2Jhc2VfcGEgPSAlIyJQUkl4NjQi
IG1zcnBtX2Jhc2VfcGEgPSAlIyJQUkl4NjQiIHRzY19vZmZzZXQgPSAlIyJQUkl4NjQiXG4iLA0K
Pj4gICAgICAgICAgICAgIHZtY2JfZ2V0X2lvcG1fYmFzZV9wYSh2bWNiKSwgdm1jYl9nZXRfbXNy
cG1fYmFzZV9wYSh2bWNiKSwNCj4+ICAgICAgICAgICAgICB2bWNiX2dldF90c2Nfb2Zmc2V0KHZt
Y2IpKTsNCj4+IC0gICAgcHJpbnRrKCJ0bGJfY29udHJvbCA9ICUjeCB2aW50ciA9ICUjIlBSSXg2
NCIgaW50ZXJydXB0X3NoYWRvdyA9ICUjIlBSSXg2NCJcbiIsDQo+PiArICAgIHByaW50aygidGxi
X2NvbnRyb2wgPSAlI3ggdmludHIgPSAlIyJQUkl4NjQiIGludGVycnVwdF9zaGFkb3cgPSAlI3hc
biIsDQo+PiAgICAgICAgICAgICAgdm1jYi0+dGxiX2NvbnRyb2wsIHZtY2JfZ2V0X3ZpbnRyKHZt
Y2IpLmJ5dGVzLA0KPj4gLSAgICAgICAgICAgdm1jYi0+aW50ZXJydXB0X3NoYWRvdyk7DQo+PiAr
ICAgICAgICAgICB2bWNiLT5pbnRfc3RhdC5pbnRyX3NoYWRvdyk7DQoNCk9LLCB3aWxsIGR1bXAg
bGlrZSB0aGlzOg0KICAgICBwcmludGsoInRsYl9jb250cm9sID0gJSN4IHZpbnRyID0gJSMiUFJJ
eDY0IiBpbnRfc3RhdCA9ICUjIlBSSXg2NCJcbiIsDQogICAgICAgICAgICB2bWNiLT50bGJfY29u
dHJvbCwgdm1jYl9nZXRfdmludHIodm1jYikuYnl0ZXMsDQogICAgICAgICAgICB2bWNiLT5pbnRf
c3RhdC5yYXcpOw0KCQ0KVGh4Lg0KDQotLSANClJlZ2FyZHMsDQpQdSBXZW4=

