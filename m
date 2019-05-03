Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95FF13225
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:25:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaxi-0003tk-DX; Fri, 03 May 2019 16:23:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XpsL=TD=citrix.com=prvs=019780e18=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hMaxg-0003t1-8H
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:23:00 +0000
X-Inumbo-ID: b0407752-6dbf-11e9-9f12-7b768560a7b4
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0407752-6dbf-11e9-9f12-7b768560a7b4;
 Fri, 03 May 2019 16:22:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="89638448"
Date: Fri, 3 May 2019 18:21:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190503162159.ymqzwzv43opzljlr@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DEF70200007800229EA3@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CC6DEF70200007800229EA3@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/9] x86/IRQ: desc->affinity should strictly
 represent the requested value
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6MjQ6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gZGVzYy0+YXJjaC5jcHVfbWFzayByZWZsZWN0cyB0aGUgYWN0dWFsIHNldCBvZiB0YXJn
ZXQgQ1BVcy4gRG9uJ3QgZXZlcgo+IGZpZGRsZSB3aXRoIGRlc2MtPmFmZmluaXR5IGl0c2VsZiwg
ZXhjZXB0IHRvIHN0b3JlIGNhbGxlciByZXF1ZXN0ZWQKPiB2YWx1ZXMuCj4gCj4gVGhpcyByZW5k
ZXJzIGJvdGggc2V0X25hdGl2ZV9pcnFfaW5mbygpIHVzZXMgKHdoaWNoIHdlcmVuJ3QgdXNpbmcg
cHJvcGVyCj4gbG9ja2luZyBhbnl3YXkpIHJlZHVuZGFudCAtIGRyb3AgdGhlIGZ1bmN0aW9uIGFs
dG9nZXRoZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgoKPiAKPiAtLS0gYS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCj4gKysrIGIveGVuL2FyY2gveDg2
L2lvX2FwaWMuYwo+IEBAIC0xMDQyLDcgKzEwNDIsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0
dXBfSU9fQVBJQ19pcnFzKHZvCj4gICAgICAgICAgICAgIFNFVF9ERVNUKGVudHJ5LCBsb2dpY2Fs
LCBjcHVfbWFza190b19hcGljaWQoVEFSR0VUX0NQVVMpKTsKPiAgICAgICAgICAgICAgc3Bpbl9s
b2NrX2lycXNhdmUoJmlvYXBpY19sb2NrLCBmbGFncyk7Cj4gICAgICAgICAgICAgIF9faW9hcGlj
X3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgMCwgZW50cnkpOwo+IC0gICAgICAgICAgICBzZXRfbmF0
aXZlX2lycV9pbmZvKGlycSwgVEFSR0VUX0NQVVMpOwo+ICAgICAgICAgICAgICBzcGluX3VubG9j
a19pcnFyZXN0b3JlKCZpb2FwaWNfbG9jaywgZmxhZ3MpOwo+ICAgICAgICAgIH0KPiAgICAgIH0K
PiBAQCAtMjI1MSw3ICsyMjUwLDYgQEAgaW50IGlvX2FwaWNfc2V0X3BjaV9yb3V0aW5nIChpbnQg
aW9hcGljLAo+ICAKPiAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb2FwaWNfbG9jaywgZmxhZ3Mp
Owo+ICAgICAgX19pb2FwaWNfd3JpdGVfZW50cnkoaW9hcGljLCBwaW4sIDAsIGVudHJ5KTsKPiAt
ICAgIHNldF9uYXRpdmVfaXJxX2luZm8oaXJxLCBUQVJHRVRfQ1BVUyk7Cj4gICAgICBzcGluX3Vu
bG9jaygmaW9hcGljX2xvY2spOwo+ICAKPiAgICAgIHNwaW5fbG9jaygmZGVzYy0+bG9jayk7Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2lycS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2lycS5jCj4gQEAg
LTU3MiwxMSArNTcyLDE2IEBAIGludCBhc3NpZ25faXJxX3ZlY3RvcihpbnQgaXJxLCBjb25zdCBj
cHUKPiAgCj4gICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmdmVjdG9yX2xvY2ssIGZsYWdzKTsKPiAg
ICAgIHJldCA9IF9fYXNzaWduX2lycV92ZWN0b3IoaXJxLCBkZXNjLCBtYXNrID86IFRBUkdFVF9D
UFVTKTsKPiAtICAgIGlmICghcmV0KSB7Cj4gKyAgICBpZiAoICFyZXQgKQo+ICsgICAgewo+ICAg
ICAgICAgIHJldCA9IGRlc2MtPmFyY2gudmVjdG9yOwo+IC0gICAgICAgIGNwdW1hc2tfY29weShk
ZXNjLT5hZmZpbml0eSwgZGVzYy0+YXJjaC5jcHVfbWFzayk7Cj4gKyAgICAgICAgaWYgKCBtYXNr
ICkKPiArICAgICAgICAgICAgY3B1bWFza19jb3B5KGRlc2MtPmFmZmluaXR5LCBtYXNrKTsKPiAr
ICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgIGNwdW1hc2tfc2V0YWxsKGRlc2MtPmFmZmluaXR5
KTsKCkkgZ3Vlc3MgaXQncyBmaW5lIHRvIHVzZSBzZXRhbGwgaW5zdGVhZCBvZiBjb3B5aW5nIHRo
ZSBjcHUgb25saW5lIG1hcApoZXJlPwoKQUZBSUNUIF9fYXNzaWduX2lycV92ZWN0b3IgYWxyZWFk
eSBmaWx0ZXJzIG9mZmxpbmUgQ1BVcyBmcm9tIHRoZQpwYXNzZWQgbWFzay4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
