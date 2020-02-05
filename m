Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EC71539C7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 21:56:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izRex-0003aU-Q2; Wed, 05 Feb 2020 20:52:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n2Y8=3Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izRew-0003aI-B0
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 20:52:30 +0000
X-Inumbo-ID: 6c6af0e6-4859-11ea-91c3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c6af0e6-4859-11ea-91c3-12813bfff9fa;
 Wed, 05 Feb 2020 20:52:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izReu-0006qi-4g; Wed, 05 Feb 2020 20:52:28 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izRet-0006LG-Qs; Wed, 05 Feb 2020 20:52:28 +0000
Date: Wed, 5 Feb 2020 20:52:24 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200205205224.53sw3hrhxdkv4vv7@debian>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127181115.82709-4-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 3/7] x86/paging: add TLB flush hooks
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDc6MTE6MTFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgpbLi4uXQo+ICAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9t
dWx0aS5jIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9tdWx0aS5jCj4gaW5kZXggMjY3OThiMzE3
Yy4uZGZlMjY0Y2Y4MyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRp
LmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMKPiBAQCAtNDE1Nyw3ICs0
MTU3LDYgQEAgc2hfdXBkYXRlX2NyMyhzdHJ1Y3QgdmNwdSAqdiwgaW50IGRvX2xvY2tpbmcsIGJv
b2wgbm9mbHVzaCkKPiAgICAgIGlmICggZG9fbG9ja2luZyApIHBhZ2luZ191bmxvY2sodi0+ZG9t
YWluKTsKPiAgfQo+ICAKPiAtCgpTdHJheSBjaGFuZ2UuCgo+ICAvKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiov
Cj4gIC8qIEZ1bmN0aW9ucyB0byByZXZva2UgZ3Vlc3QgcmlnaHRzICovCj4gIAo+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2hhcC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXAu
aAo+IGluZGV4IGI5NGJmYjRlZDAuLjBjNmFhMjZiOWIgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9oYXAuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaGFwLmgKPiBAQCAt
NDYsNiArNDYsOSBAQCBpbnQgICBoYXBfdHJhY2tfZGlydHlfdnJhbShzdHJ1Y3QgZG9tYWluICpk
LAo+ICBleHRlcm4gY29uc3Qgc3RydWN0IHBhZ2luZ19tb2RlICpoYXBfcGFnaW5nX2dldF9tb2Rl
KHN0cnVjdCB2Y3B1ICopOwo+ICBpbnQgaGFwX3NldF9hbGxvY2F0aW9uKHN0cnVjdCBkb21haW4g
KmQsIHVuc2lnbmVkIGludCBwYWdlcywgYm9vbCAqcHJlZW1wdGVkKTsKPiAgCj4gK2Jvb2wgaGFw
X2ZsdXNoX3RsYihib29sICgqZmx1c2hfdmNwdSkodm9pZCAqY3R4dCwgc3RydWN0IHZjcHUgKnYp
LAo+ICsgICAgICAgICAgICAgICAgICAgdm9pZCAqY3R4dCk7Cj4gKwo+ICAjZW5kaWYgLyogWEVO
X0hBUF9IICovCj4gIAo+ICAvKgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3No
YWRvdy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9zaGFkb3cuaAo+IGluZGV4IDkwN2M3MWY0OTcu
LjNjMWY2ZGY0NzggMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9zaGFkb3cuaAo+
ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc2hhZG93LmgKPiBAQCAtOTUsNiArOTUsMTAgQEAg
dm9pZCBzaGFkb3dfYmxvd190YWJsZXNfcGVyX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkKTsKPiAg
aW50IHNoYWRvd19zZXRfYWxsb2NhdGlvbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQg
cGFnZXMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCAqcHJlZW1wdGVkKTsKPiAg
Cj4gKy8qIEZsdXNoIHRoZSBUTEIgb2YgdGhlIHNlbGVjdGVkIHZDUFVzLiAqLwo+ICtib29sIHNo
YWRvd19mbHVzaF90bGIoYm9vbCAoKmZsdXNoX3ZjcHUpKHZvaWQgKmN0eHQsIHN0cnVjdCB2Y3B1
ICp2KSwKPiArICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmN0eHQpOwo+ICsKPiAgI2Vsc2Ug
LyogIUNPTkZJR19TSEFET1dfUEFHSU5HICovCj4gIAo+ICAjZGVmaW5lIHNoYWRvd190ZWFyZG93
bihkLCBwKSBBU1NFUlQoaXNfcHZfZG9tYWluKGQpKQo+IEBAIC0xMDYsNiArMTEwLDE0IEBAIGlu
dCBzaGFkb3dfc2V0X2FsbG9jYXRpb24oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHBh
Z2VzLAo+ICAjZGVmaW5lIHNoYWRvd19zZXRfYWxsb2NhdGlvbihkLCBwYWdlcywgcHJlZW1wdGVk
KSBcCj4gICAgICAoeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgLUVPUE5PVFNVUFA7IH0pCj4gIAo+
ICtzdGF0aWMgaW5saW5lIGJvb2wgc2hhZG93X2ZsdXNoX3RsYihib29sICgqZmx1c2hfdmNwdSko
dm9pZCAqY3R4dCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCB2Y3B1ICp2KSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdm9pZCAqY3R4dCkKPiArewo+ICsgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7
Cj4gKyAgICByZXR1cm4gLUVPUE5PVFNVUFA7CgpUaGlzIGZ1bmN0aW9uIG5lZWRzIHRvIHJldHVy
biB0cnVlL2ZhbHNlIHBlciBpdHMgc2lnbmF0dXJlLgoKV2l0aCB0aGlzIGZpeGVkOgoKUmV2aWV3
ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
