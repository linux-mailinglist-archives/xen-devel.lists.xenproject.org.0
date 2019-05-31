Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D130D1B
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 13:13:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWfR0-0005mM-F2; Fri, 31 May 2019 11:10:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWfQz-0005mH-Ib
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 11:10:53 +0000
X-Inumbo-ID: c054c8f1-8394-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c054c8f1-8394-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 11:10:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 05:10:51 -0600
Message-Id: <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 05:10:48 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Baodong Chen" <chenbaodong@mxnavi.com>
References: <1559211432-30973-1-git-send-email-chenbaodong@mxnavi.com>
In-Reply-To: <1559211432-30973-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen: make tracebuffer configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMwLjA1LjE5IGF0IDEyOjE3LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6
Cj4gRGVmYXVsdDogZW5hYmxlZC4KPiBDYW4gYmUgZGlzYWJsZWQgZm9yIHNtYWxsZXIgY29kZSBm
b290cHJpbnQuCgpCdXQgeW91J3JlIGF3YXJlIHRoYXQgd2UncmUsIGZvciBub3cgYXQgbGVhc3Qs
IHRyeWluZyB0byBsaW1pdCB0aGUKbnVtYmVyIG9mIGluZGVwZW5kZW50bHkgc2VsZWN0YWJsZSBj
b25maWcgb3B0aW9ucz8gT25lcyBkZXBlbmRpbmcKb24gRVhQRVJUIGFyZSBzb3J0IG9mIGFuIGV4
Y2VwdGlvbiBpbiBjZXJ0YWluIGNhc2VzLgoKPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcKPiAr
KysgYi94ZW4vY29tbW9uL0tjb25maWcKPiBAQCAtMzY4LDQgKzM2OCwxMCBAQCBjb25maWcgRE9N
MF9NRU0KPiAgCj4gIAkgIExlYXZlIGVtcHR5IGlmIHlvdSBhcmUgbm90IHN1cmUgd2hhdCB0byBz
cGVjaWZ5Lgo+ICAKPiArY29uZmlnIEhBU19UUkFDRUJVRkZFUgo+ICsJYm9vbCAiRW5hYmxlL0Rp
c2FibGUgdHJhY2VidWZmZXIiCj4gKwlkZWZhdWx0IHkKPiArCS0tLWhlbHAtLS0KPiArCSAgRW5h
YmxlIG9yIGRpc2FibGUgdHJhY2VidWZmZXIgZnVuY3Rpb24uCgpIQVNfKiBvcHRpb25zIHNob3Vs
ZCBub3QgY29tZSB3aXRoIGEgcHJvbXB0LCBhbmQgc2hvdWxkCm9ubHkgYmUgInNlbGVjdCItZWQg
YnkgKG5vcm1hbGx5KSBwZXItYXJjaGl0ZWN0dXJlIEtjb25maWcKZmlsZXMuIElmIHdlIGFyZSB0
byBwZXJtaXQgaGF2aW5nIHRoaXMgb3B0aW9uLCB0aGVuIEkgYWxzbyB0aGluawp0aGUgaGVscCB0
ZXh0IG5lZWRzIGV4cGFuZGluZy4KCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKPiAr
KysgYi94ZW4vaW5jbHVkZS94ZW4vdHJhY2UuaAo+IEBAIC0yMSwxMiArMjEsMTQgQEAKPiAgI2lm
bmRlZiBfX1hFTl9UUkFDRV9IX18KPiAgI2RlZmluZSBfX1hFTl9UUkFDRV9IX18KPiAgCj4gLWV4
dGVybiBpbnQgdGJfaW5pdF9kb25lOwo+ICAKPiAgI2luY2x1ZGUgPHB1YmxpYy9zeXNjdGwuaD4K
PiAgI2luY2x1ZGUgPHB1YmxpYy90cmFjZS5oPgo+ICAjaW5jbHVkZSA8YXNtL3RyYWNlLmg+Cj4g
IAo+ICsjaWZkZWYgQ09ORklHX0hBU19UUkFDRUJVRkZFUgo+ICsKPiArZXh0ZXJuIGludCB0Yl9p
bml0X2RvbmU7Cj4gIC8qIFVzZWQgdG8gaW5pdGlhbGlzZSB0cmFjZSBidWZmZXIgZnVuY3Rpb25h
bGl0eSAqLwo+ICB2b2lkIGluaXRfdHJhY2VfYnVmcyh2b2lkKTsKCkkgd29uZGVyIGlmIHRoZXJl
IGhhZG4ndCBiZWVuIGEgcmVhc29uIGZvciB0aGUgZGVjbGFyYXRpb24gdG8gbGl2ZQp1cCB3aGVy
ZSBpdCB3YXMuIEFsc28gcGxlYXNlIHNlcGFyYXRlIGluZGVwZW5kZW50IGJsb2NrcyBvZiBjb2Rl
CmJ5IGEgYmxhbmsgbGluZS4KCj4gQEAgLTQ3LDYgKzQ5LDIwIEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCB0cmFjZV92YXIodTMyIGV2ZW50LCBpbnQgY3ljbGVzLCBpbnQgCj4gZXh0cmEsCj4gIHZvaWQg
X190cmFjZV9oeXBlcmNhbGwodWludDMyX3QgZXZlbnQsIHVuc2lnbmVkIGxvbmcgb3AsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3QgeGVuX3Vsb25nX3QgKmFyZ3MpOwo+ICAKPiArI2Vs
c2UKPiArI2RlZmluZSB0Yl9pbml0X2RvbmUgKDApCgpQZXJoYXBzIGJldHRlciAiZmFsc2UiLCBh
bmQgbm8gcmVhbCBuZWVkIGZvciB0aGUgcGFyZW50aGVzZXMgYWZhaWN0LgoKPiArc3RhdGljIGlu
bGluZSB2b2lkIGluaXRfdHJhY2VfYnVmcyh2b2lkKSB7fQo+ICtzdGF0aWMgaW5saW5lIGludCB0
Yl9jb250cm9sKHN0cnVjdCB4ZW5fc3lzY3RsX3RidWZfb3AgKnRiYykgeyByZXR1cm4gLUVOT1NZ
UzsgfQo+ICsKPiArc3RhdGljIGlubGluZSBpbnQgdHJhY2Vfd2lsbF90cmFjZV9ldmVudCh1MzIg
ZXZlbnQpIHsgcmV0dXJuIDA7IH0KPiArc3RhdGljIGlubGluZSB2b2lkIHRyYWNlX3Zhcih1MzIg
ZXZlbnQsIGludCBjeWNsZXMsIGludCBleHRyYSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCB2b2lkICpleHRyYV9kYXRhKSB7fQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX190
cmFjZV92YXIodTMyIGV2ZW50LCBib29sX3QgY3ljbGVzLCB1bnNpZ25lZCBpbnQgZXh0cmEsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB2b2lkICpleHRyYV9kYXRhKSB7
fQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX190cmFjZV9oeXBlcmNhbGwodWludDMyX3QgZXZlbnQs
IHVuc2lnbmVkIGxvbmcgb3AsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCB4ZW5fdWxvbmdfdCAqYXJncykge30KPiArI2VuZGlmCgpXZSB0cnkgdG8gZG8gYXdh
eSB3aXRoIHUzMiBhbmQgZnJpZW5kcywgc28gcGxlYXNlIGRvbid0IGludHJvZHVjZQpuZXcgdXNl
cyAtIGV2ZW4gbGVzcyBzbyB3aGVuIGluIG9uZSBjYXNlIGhlcmUgeW91IGFscmVhZHkgdXNlCnVp
bnQzMl90LiBTaW1pbGFybHkgcGxlYXNlIHVzZSAiYm9vbCIgaW4gZmF2b3Igb2YgImJvb2xfdCIu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
