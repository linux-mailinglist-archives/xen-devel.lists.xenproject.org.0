Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 054A5FFC23
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 00:12:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWTg8-0002Xp-Vc; Sun, 17 Nov 2019 23:10:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Iuzj=ZJ=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iWTg7-0002Xk-2S
 for xen-devel@lists.xenproject.org; Sun, 17 Nov 2019 23:09:59 +0000
X-Inumbo-ID: 5ea96892-098f-11ea-a2ce-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5ea96892-098f-11ea-a2ce-12813bfff9fa;
 Sun, 17 Nov 2019 23:09:58 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [XEN PATCH v3 05/11] xen: arm: add interfaces to
 save/restore the state of a PPI.
Thread-Index: AQHVm/DylYIBng8WIEmJ3OX//6vplqeP/fiQ
Date: Sun, 17 Nov 2019 23:10:58 +0000
Message-ID: <f1c4d65e0cf34246b7074c2f65591de2@dornerworks.com>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-1-stewart.hildebrand@dornerworks.com>
In-Reply-To: <20191115201037.44982-1-stewart.hildebrand@dornerworks.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.139.198]
MIME-Version: 1.0
X-spam-status: No, score=2.8 required=3.5 tests=BAYES_00, RCVD_IN_PBL,
 RCVD_IN_XBL, MAILSHELL_SCORE_0_4, HELO_NO_DOMAIN, RDNS_NONE
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [XEN PATCH v3 05/11] xen: arm: add interfaces to
 save/restore the state of a PPI.
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpZGF5LCBOb3ZlbWJlciAxNSwgMjAxOSAzOjExIFBNLCBTdGV3YXJ0IEhpbGRlYnJhbmQg
d3JpdGU6DQoNClsuLi5dDQoNCj5kaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVu
L2FyY2gvYXJtL2dpYy5jDQo+aW5kZXggMTEzNjU1YTc4OS4uNzU5MjE3MjRkZCAxMDA2NDQNCj4t
LS0gYS94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4rKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMNCg0KWy4u
Ll0NCg0KPkBAIC03OCw2ICs4OSwyNSBAQCB2b2lkIGdpY19zYXZlX3N0YXRlKHN0cnVjdCB2Y3B1
ICp2KQ0KPiAgICAgaXNiKCk7DQo+IH0NCj4NCj4rdm9pZCBnaWNfc2F2ZV9hbmRfbWFza19od3Bw
aShzdHJ1Y3QgdmNwdSAqdiwgY29uc3QgdW5zaWduZWQgdmlycSwNCj4rICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgaHdwcGlfc3RhdGUgKnMpDQo+K3sNCj4rICAgIHN0cnVjdCBw
ZW5kaW5nX2lycSAqcCA9IGlycV90b19wZW5kaW5nKHYsIHZpcnEpOw0KPisgICAgc3RydWN0IGly
cV9kZXNjICpkZXNjID0gcC0+ZGVzYzsNCg0KSSBpbnRlbmRlZCB0byByZXBsYWNlIHRoaXMgd2l0
aCBhIGNhbGwgdG8gdmdpY19nZXRfaHdfaXJxX2Rlc2MsIGJ1dCBJDQphY2NpZGVudGFsbHkgcm9s
bGVkIHRoZSBjaGFuZ2UgaW50byBhIGxhdGVyIHBhdGNoIGluc3RlYWQgb2YgdGhpcyBvbmUuDQoN
Cj4rDQo+KyAgICBzcGluX2xvY2soJmRlc2MtPmxvY2spOw0KPisNCj4rICAgIEFTU0VSVCh2aXJx
ID49IDE2ICYmIHZpcnEgPCAzMik7DQo+KyAgICBBU1NFUlQoZGVzYy0+aXJxID49IDE2ICYmIGRl
c2MtPmlycSA8IDMyKTsNCj4rICAgIEFTU0VSVCghaXNfaWRsZV92Y3B1KHYpKTsNCj4rDQo+KyAg
ICBzLT5pbnByb2dyZXNzID0gdGVzdF9hbmRfY2xlYXJfYml0KF9JUlFfSU5QUk9HUkVTUywgJmRl
c2MtPnN0YXR1cyk7DQo+Kw0KPisgICAgZ2ljX2h3X29wcy0+c2F2ZV9hbmRfbWFza19od3BwaShk
ZXNjLCBzKTsNCj4rDQo+KyAgICBzcGluX3VubG9jaygmZGVzYy0+bG9jayk7DQo+K30NCj4rDQo+
IHZvaWQgZ2ljX3Jlc3RvcmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpDQo+IHsNCj4gICAgIEFTU0VS
VCghbG9jYWxfaXJxX2lzX2VuYWJsZWQoKSk7DQo+QEAgLTg5LDYgKzExOSwzMCBAQCB2b2lkIGdp
Y19yZXN0b3JlX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgaXNiKCk7DQo+IH0NCj4NCj4r
dm9pZCBnaWNfcmVzdG9yZV9od3BwaShzdHJ1Y3QgdmNwdSAqdiwNCj4rICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCB1bnNpZ25lZCB2aXJxLA0KPisgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBod3BwaV9zdGF0ZSAqcykNCj4rew0KPisgICAgc3RydWN0IHBlbmRpbmdfaXJx
ICpwID0gaXJxX3RvX3BlbmRpbmcodiwgdmlycSk7DQo+KyAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRl
c2MgPSBpcnFfdG9fZGVzYyhzLT5pcnEpOw0KPisNCj4rICAgIHNwaW5fbG9jaygmZGVzYy0+bG9j
ayk7DQo+Kw0KPisgICAgQVNTRVJUKHZpcnEgPj0gMTYgJiYgdmlycSA8IDMyKTsNCj4rICAgIEFT
U0VSVCghaXNfaWRsZV92Y3B1KHYpKTsNCj4rDQo+KyAgICBwLT5kZXNjID0gZGVzYzsgLyogTWln
cmF0ZSB0byBuZXcgcGh5c2ljYWwgcHJvY2Vzc29yICovDQoNCkkgaW50ZW5kZWQgdG8gcmVwbGFj
ZSB0aGlzIHdpdGggYSBjYWxsIHRvIHZnaWNfY29ubmVjdF9od19pcnEuIFNhbWUgc3RvcnkgYXMg
YWJvdmUuDQoNCj4rDQo+KyAgICBpcnFfc2V0X3ZpcnEoZGVzYywgdmlycSk7DQo+Kw0KPisgICAg
Z2ljX2h3X29wcy0+cmVzdG9yZV9od3BwaShkZXNjLCBzKTsNCj4rDQo+KyAgICBpZiAoIHMtPmlu
cHJvZ3Jlc3MgKQ0KPisgICAgICAgIHNldF9iaXQoX0lSUV9JTlBST0dSRVNTLCAmZGVzYy0+c3Rh
dHVzKTsNCj4rDQo+KyAgICBzcGluX3VubG9jaygmZGVzYy0+bG9jayk7DQo+K30NCj4rDQo+IC8q
IGRlc2MtPmlycSBuZWVkcyB0byBiZSBkaXNhYmxlZCBiZWZvcmUgY2FsbGluZyB0aGlzIGZ1bmN0
aW9uICovDQo+IHZvaWQgZ2ljX3NldF9pcnFfdHlwZShzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MsIHVu
c2lnbmVkIGludCB0eXBlKQ0KPiB7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
