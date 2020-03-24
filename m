Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCC519057C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 07:07:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGcf5-0004oB-8I; Tue, 24 Mar 2020 06:03:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8ME=5J=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jGcf3-0004o6-IS
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 06:03:37 +0000
X-Inumbo-ID: 31ed86c0-6d95-11ea-a6c1-bc764e2007e4
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31ed86c0-6d95-11ea-a6c1-bc764e2007e4;
 Tue, 24 Mar 2020 06:03:34 +0000 (UTC)
IronPort-SDR: ydZSp+vZ+ce/oRewEc+1r04dvq4HVhCPjiX4DNnsXsj1lfG7+9Ax7Abm9zmRtrRDvY+hUIZoyF
 4pRi3n5/B27A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 23:03:33 -0700
IronPort-SDR: ZtVIT2F5Yn9M2Rf6UI/xuTAmdO31BfSgNaK1W5uPI//mhCPUyJYfvH4rRsaRI7jkmnXDV1QXlW
 pRWojy36FMJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,299,1580803200"; d="scan'208";a="446099217"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga005.fm.intel.com with ESMTP; 23 Mar 2020 23:03:33 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Mar 2020 23:03:31 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Mar 2020 23:03:31 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.50]) with mapi id 14.03.0439.000;
 Tue, 24 Mar 2020 14:03:28 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/3] x86/nvmx: clarify and fix usage of nvmx_update_apicv
Thread-Index: AQHV/urx56O11h2t1UOQYEsoZRnaaKhXQBJw
Date: Tue, 24 Mar 2020 06:03:28 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5B44@SHSMSX104.ccr.corp.intel.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-3-roger.pau@citrix.com>
In-Reply-To: <20200320190737.42110-3-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/3] x86/nvmx: clarify and fix usage of
 nvmx_update_apicv
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBT
YXR1cmRheSwgTWFyY2ggMjEsIDIwMjAgMzowOCBBTQ0KPiANCj4gVGhlIGN1cnJlbnQgdXNhZ2Ug
b2YgbnZteF91cGRhdGVfYXBpY3YgaXMgbm90IGNsZWFyOiBpdCBpcyBkZWVwbHkNCj4gaW50ZXJ0
d2luZWQgd2l0aCB0aGUgQWNrIGludGVycnVwdCBvbiBleGl0IFZNRVhJVCBjb250cm9sLg0KPiAN
Cj4gVGhlIGNvZGUgaW4gbnZteF91cGRhdGVfYXBpY3Ygc2hvdWxkIHVwZGF0ZSB0aGUgU1ZJIChp
biBzZXJ2aWNlIGludGVycnVwdCkNCj4gZmllbGQgb2YgdGhlIGd1ZXN0IGludGVycnVwdCBzdGF0
dXMgb25seSB3aGVuIHRoZSBBY2sgaW50ZXJydXB0IG9uDQo+IGV4aXQgaXMgc2V0LCBhcyBpdCBp
cyB1c2VkIHRvIHJlY29yZCB0aGF0IHRoZSBpbnRlcnJ1cHQgYmVpbmcNCj4gc2VydmljZWQgaXMg
c2lnbmFsZWQgaW4gYSB2bWNzIGZpZWxkLCBhbmQgaGVuY2UgaGFzbid0IGJlZW4gaW5qZWN0ZWQN
Cj4gYXMgb24gbmF0aXZlLiBJdCdzIGltcG9ydGFudCB0byByZWNvcmQgdGhlIGN1cnJlbnQgaW4g
c2VydmljZQ0KPiBpbnRlcnJ1cHQgb24gdGhlIGd1ZXN0IGludGVycnVwdCBzdGF0dXMgZmllbGQs
IG9yIGVsc2UgZnVydGhlcg0KPiBpbnRlcnJ1cHRzIHdvbid0IHJlc3BlY3QgdGhlIHByaW9yaXR5
IG9mIHRoZSBpbiBzZXJ2aWNlIG9uZS4NCj4gDQo+IFdoaWxlIGNsYXJpZnlpbmcgdGhlIHVzYWdl
IG1ha2Ugc3VyZSB0aGF0IHRoZSBTVkkgaXMgb25seSB1cGRhdGVkIHdoZW4NCj4gQWNrIG9uIGV4
aXQgaXMgc2V0IGFuZCB0aGUgbmVzdGVkIHZtY3MgaW50ZXJydXB0IGluZm8gZmllbGQgaXMgdmFs
aWQuIE9yDQo+IGVsc2UgYSBndWVzdCBub3QgdXNpbmcgdGhlIEFjayBvbiBleGl0IGZlYXR1cmUg
d291bGQgbG9vc2UgaW50ZXJydXB0cyBhcw0KPiB0aGV5IHdvdWxkIGJlIHNpZ25hbGVkIGFzIGJl
aW5nIGluIHNlcnZpY2Ugb24gdGhlIGd1ZXN0IGludGVycnVwdA0KPiBzdGF0dXMgZmllbGQgYnV0
IHdvbid0IGFjdHVhbGx5IGJlIHJlY29yZGVkIG9uIHRoZSBpbnRlcnJ1cHQgaW5mbyB2bWNzDQo+
IGZpZWxkLCBuZWl0aGVyIGluamVjdGVkIGluIGFueSBvdGhlciB3YXkuDQoNCkl0IGlzIGluc3Vm
ZmljaWVudC4gWW91IGFsc28gbmVlZCB0byB1cGRhdGUgUlZJIHRvIGVuYWJsZSB2aXJ0dWFsIGlu
amVjdGlvbg0Kd2hlbiBBY2sgb24gZXhpdCBpcyBjbGVhcmVkLg0KDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+ICB4
ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCAxMSArKysrKysrKysrLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14
LmMNCj4gaW5kZXggMWI4NDYxYmEzMC4uMTgwZDAxZTM4NSAxMDA2NDQNCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS92bXgvdnZteC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXgu
Yw0KPiBAQCAtMTM4Myw3ICsxMzgzLDcgQEAgc3RhdGljIHZvaWQgbnZteF91cGRhdGVfYXBpY3Yo
c3RydWN0IHZjcHUgKnYpDQo+ICB7DQo+ICAgICAgc3RydWN0IG5lc3RlZHZteCAqbnZteCA9ICZ2
Y3B1XzJfbnZteCh2KTsNCj4gICAgICB1bnNpZ25lZCBsb25nIHJlYXNvbiA9IGdldF92dm1jcyh2
LCBWTV9FWElUX1JFQVNPTik7DQo+IC0gICAgdWludDMyX3QgaW50cl9pbmZvID0gbnZteC0+aW50
ci5pbnRyX2luZm87DQo+ICsgICAgdW5zaWduZWQgbG9uZyBpbnRyX2luZm8gPSBnZXRfdnZtY3Mo
diwgVk1fRVhJVF9JTlRSX0lORk8pOw0KDQp3ZWxsLCBhYm92ZSByZW1pbmRzIG1lIGFuIGludGVy
ZXN0aW5nIHF1ZXN0aW9uLiBDb21iaW5pbmcgbGFzdCBhbmQgdGhpcw0KcGF0Y2gsIHdlJ2Qgc2Vl
IGVzc2VudGlhbGx5IHRoYXQgaXQgZ29lcyBiYWNrIHRvIHRoZSBzdGF0ZSBiZWZvcmUgZjk2ZTE0
NjkNCihhdCBsZWFzdCB3aGVuIEFjayBvbiBleGl0IGlzIHRydWUpLiBpaXJjLCB0aGF0IGNvbW1p
dCB3YXMgaW50cm9kdWNlZCB0byBlbmFibGUNCm5lc3RlZCB4MmFwaWMgd2l0aCBhcGljdiwgYW5k
IHlvdXIgdmVyeSBmaXJzdCB2ZXJzaW9uIGV2ZW4ganVzdCByZW1vdmVkDQp0aGUgd2hvbGUgbnZt
eF91cGRhdGVfYXBpY3YuIFRoZW4gbm93IHdpdGggdGhlIG5ldyByZXZlcnRlZCBsb2dpYywNCmFy
ZSB5b3Ugc3RpbGwgc3VmZmVyaW5nIHgyYXBpYyBwcm9ibGVtPyBJZiBub3QsIGRvZXMgaXQgaW1w
bHkgdGhlIHJlYWwgZml4DQppcyBhY3R1YWxseSBjb21pbmcgZnJvbSBwYXRjaCAzLzMgZm9yIGVv
aSBiaXRtYXAgdXBkYXRlPw0KDQo+IA0KPiAgICAgIGlmICggcmVhc29uID09IEVYSVRfUkVBU09O
X0VYVEVSTkFMX0lOVEVSUlVQVCAmJg0KPiAgICAgICAgICAgbnZteC0+aW50ci5zb3VyY2UgPT0g
aHZtX2ludHNyY19sYXBpYyAmJg0KPiBAQCAtMTM5OSw2ICsxMzk5LDE1IEBAIHN0YXRpYyB2b2lk
IG52bXhfdXBkYXRlX2FwaWN2KHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgICAgICBwcHIgPSB2bGFw
aWNfc2V0X3Bwcih2bGFwaWMpOw0KPiAgICAgICAgICBXQVJOX09OKChwcHIgJiAweGYwKSAhPSAo
dmVjdG9yICYgMHhmMCkpOw0KPiANCj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICogU1ZJIG11
c3QgYmUgdXBkYXRlZCB3aGVuIHRoZSBpbnRlcnJ1cHQgaGFzIGJlZW4gc2lnbmFsZWQgdXNpbmcg
dGhlDQo+ICsgICAgICAgICAqIEFjayBvbiBleGl0IGZlYXR1cmUsIG9yIGVsc2UgdGhlIGN1cnJl
bnRseSBpbi1zZXJ2aWNlIGludGVycnVwdA0KPiArICAgICAgICAgKiB3b24ndCBiZSByZXNwZWN0
ZWQuDQo+ICsgICAgICAgICAqDQo+ICsgICAgICAgICAqIE5vdGUgdGhhdCB0aGlzIGlzIHNwZWNp
ZmljIHRvIHRoZSBmYWN0IHRoYXQgd2hlbiBkb2luZyBhIFZNRVhJVCBhbg0KPiArICAgICAgICAg
KiBpbnRlcnJ1cHQgbWlnaHQgZ2V0IGRlbGl2ZXJlZCB1c2luZyB0aGUgaW50ZXJydXB0IGluZm8g
dm1jcyBmaWVsZA0KPiArICAgICAgICAgKiBpbnN0ZWFkIG9mIGJlaW5nIGluamVjdGVkIG5vcm1h
bGx5Lg0KPiArICAgICAgICAgKi8NCg0KSSdtIG5vdCBzdXJlIG1lbnRpb25pbmcgU1ZJIHNwZWNp
ZmljYWxseSBoZXJlIGlzIG5lY2Vzc2FyeSwgc2luY2UgYWxsIHN0ZXBzDQpoZXJlIGFyZSByZXF1
aXJlZCAtIHVwZGF0aW5nIGlpciwgaXNyLCBydmksIHN2aSwgcHByLCBldGMuIEl0IGlzIGp1c3Qg
YW4gZW11bGF0aW9uDQpvZiB1cGRhdGluZyB2aXJ0dWFsIEFQSUMgc3RhdGUgYXMgaWYgYSB2aXJ0
dWFsIGludGVycnVwdCBkZWxpdmVyeSBoYXBwZW5zLg0KDQo+ICAgICAgICAgIHN0YXR1cyA9IHZl
Y3RvciA8PCBWTVhfR1VFU1RfSU5UUl9TVEFUVVNfU1ZJX09GRlNFVDsNCj4gICAgICAgICAgcnZp
ID0gdmxhcGljX2hhc19wZW5kaW5nX2lycSh2KTsNCj4gICAgICAgICAgaWYgKCBydmkgIT0gLTEg
KQ0KPiAtLQ0KPiAyLjI1LjANCg0K

