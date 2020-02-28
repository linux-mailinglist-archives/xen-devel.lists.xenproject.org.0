Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFFC17352E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 11:20:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7chO-0004cW-0M; Fri, 28 Feb 2020 10:16:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7chM-0004cP-CV
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 10:16:48 +0000
X-Inumbo-ID: 6d38317a-5a13-11ea-83b0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d38317a-5a13-11ea-83b0-bc764e2007e4;
 Fri, 28 Feb 2020 10:16:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6C2F5AD5C;
 Fri, 28 Feb 2020 10:16:46 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200228093334.36586-1-roger.pau@citrix.com>
 <20200228093334.36586-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <12c75d73-cc89-9b8c-011a-b6e11f6cf58d@suse.com>
Date: Fri, 28 Feb 2020 11:16:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228093334.36586-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/2] x86: add accessors for scratch cpu
 mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxMDozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEN1cnJlbnQgdXNh
Z2Ugb2YgdGhlIHBlci1DUFUgc2NyYXRjaCBjcHVtYXNrIGlzIGRhbmdlcm91cyBzaW5jZQo+IHRo
ZXJlJ3Mgbm8gd2F5IHRvIGZpZ3VyZSBvdXQgaWYgdGhlIG1hc2sgaXMgYWxyZWFkeSBiZWluZyB1
c2VkIGV4Y2VwdAo+IGZvciBtYW51YWwgY29kZSBpbnNwZWN0aW9uIG9mIGFsbCB0aGUgY2FsbGVy
cyBhbmQgcG9zc2libGUgY2FsbCBwYXRocy4KPiAKPiBUaGlzIGlzIHVuc2FmZSBhbmQgbm90IHJl
bGlhYmxlLCBzbyBpbnRyb2R1Y2UgYSBtaW5pbWFsIGdldC9wdXQKPiBpbmZyYXN0cnVjdHVyZSB0
byBwcmV2ZW50IG5lc3RlZCB1c2FnZSBvZiB0aGUgc2NyYXRjaCBtYXNrIGFuZCB1c2FnZQo+IGlu
IGludGVycnVwdCBjb250ZXh0Lgo+IAo+IE1vdmUgdGhlIGRlZmluaXRpb24gb2Ygc2NyYXRjaF9j
cHVtYXNrIHRvIHNtcC5jIGluIG9yZGVyIHRvIHBsYWNlIHRoZQo+IGRlY2xhcmF0aW9uIGFuZCB0
aGUgYWNjZXNzb3JzIGFzIGNsb3NlIGFzIHBvc3NpYmxlLgoKWW91J3ZlIGNoYW5nZWQgb25lIGlu
c3RhbmNlIG9mICJkZWNsYXJhdGlvbiIsIGJ1dCBub3QgYWxzbyB0aGUgb3RoZXIuCgo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9pcnEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+IEBAIC0xOTYs
NyArMTk2LDcgQEAgc3RhdGljIHZvaWQgX2NsZWFyX2lycV92ZWN0b3Ioc3RydWN0IGlycV9kZXNj
ICpkZXNjKQo+ICB7Cj4gICAgICB1bnNpZ25lZCBpbnQgY3B1LCBvbGRfdmVjdG9yLCBpcnEgPSBk
ZXNjLT5pcnE7Cj4gICAgICB1bnNpZ25lZCBpbnQgdmVjdG9yID0gZGVzYy0+YXJjaC52ZWN0b3I7
Cj4gLSAgICBjcHVtYXNrX3QgKnRtcF9tYXNrID0gdGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrKTsK
PiArICAgIGNwdW1hc2tfdCAqdG1wX21hc2sgPSBnZXRfc2NyYXRjaF9jcHVtYXNrKCk7Cj4gIAo+
ICAgICAgQlVHX09OKCF2YWxpZF9pcnFfdmVjdG9yKHZlY3RvcikpOwo+ICAKPiBAQCAtMjA4LDYg
KzIwOCw3IEBAIHN0YXRpYyB2b2lkIF9jbGVhcl9pcnFfdmVjdG9yKHN0cnVjdCBpcnFfZGVzYyAq
ZGVzYykKPiAgICAgICAgICBBU1NFUlQocGVyX2NwdSh2ZWN0b3JfaXJxLCBjcHUpW3ZlY3Rvcl0g
PT0gaXJxKTsKPiAgICAgICAgICBwZXJfY3B1KHZlY3Rvcl9pcnEsIGNwdSlbdmVjdG9yXSA9IH5p
cnE7Cj4gICAgICB9Cj4gKyAgICBwdXRfc2NyYXRjaF9jcHVtYXNrKHRtcF9tYXNrKTsKPiAgCj4g
ICAgICBkZXNjLT5hcmNoLnZlY3RvciA9IElSUV9WRUNUT1JfVU5BU1NJR05FRDsKPiAgICAgIGNw
dW1hc2tfY2xlYXIoZGVzYy0+YXJjaC5jcHVfbWFzayk7Cj4gQEAgLTIyNyw4ICsyMjgsOSBAQCBz
dGF0aWMgdm9pZCBfY2xlYXJfaXJxX3ZlY3RvcihzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpCj4gIAo+
ICAgICAgLyogSWYgd2Ugd2VyZSBpbiBtb3Rpb24sIGFsc28gY2xlYXIgZGVzYy0+YXJjaC5vbGRf
dmVjdG9yICovCj4gICAgICBvbGRfdmVjdG9yID0gZGVzYy0+YXJjaC5vbGRfdmVjdG9yOwo+IC0g
ICAgY3B1bWFza19hbmQodG1wX21hc2ssIGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLCAmY3B1X29u
bGluZV9tYXApOwo+ICAKPiArICAgIGNwdW1hc2tfYW5kKHRtcF9tYXNrLCBkZXNjLT5hcmNoLm9s
ZF9jcHVfbWFzaywgJmNwdV9vbmxpbmVfbWFwKTsKPiArICAgIHRtcF9tYXNrID0gZ2V0X3NjcmF0
Y2hfY3B1bWFzaygpOwoKRGlkIHlvdSB0ZXN0IHRoaXM/IEl0IGxvb2tzIG92ZXJ3aGVsbWluZ2x5
IGxpa2VseSB0aGF0IHRoZSB0d28KbGluZXMgbmVlZCB0byBiZSB0aGUgb3RoZXIgd2F5IGFyb3Vu
ZC4KCj4gQEAgLTQzODQsNiArNDM4OSwxNyBAQCBzdGF0aWMgaW50IF9fZG9fdXBkYXRlX3ZhX21h
cHBpbmcoCj4gICAgICAgICAgYnJlYWs7Cj4gICAgICB9Cj4gIAo+ICsgICAgc3dpdGNoICggZmxh
Z3MgJiB+VVZNRl9GTFVTSFRZUEVfTUFTSyApCj4gKyAgICB7Cj4gKyAgICBjYXNlIFVWTUZfTE9D
QUw6Cj4gKyAgICBjYXNlIFVWTUZfQUxMOgo+ICsgICAgICAgIGJyZWFrOwo+ICsKPiArICAgIGRl
ZmF1bHQ6Cj4gKyAgICAgICAgcHV0X3NjcmF0Y2hfY3B1bWFzayhtYXNrKTsKPiArICAgIH0KPiAr
Cj4gKwo+ICAgICAgcmV0dXJuIHJjOwoKTm8gdHdvIHN1Y2Nlc3NpdmUgYmxhbmsgbGluZXMgcGxl
YXNlLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvc21wLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc21w
LmMKPiBAQCAtMjUsNiArMjUsMzEgQEAKPiAgI2luY2x1ZGUgPGlycV92ZWN0b3JzLmg+Cj4gICNp
bmNsdWRlIDxtYWNoX2FwaWMuaD4KPiAgCj4gK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKGNw
dW1hc2tfdmFyX3QsIHNjcmF0Y2hfY3B1bWFzayk7Cj4gKwo+ICsjaWZuZGVmIE5ERUJVRwo+ICtj
cHVtYXNrX3QgKnNjcmF0Y2hfY3B1bWFzayhib29sIHVzZSkKPiArewo+ICsgICAgc3RhdGljIERF
RklORV9QRVJfQ1BVKHZvaWQgKiwgc2NyYXRjaF9jcHVtYXNrX3VzZSk7CgpJJ2QgbWFrZSB0aGlz
ICJjb25zdCB2b2lkICoiLCBidHcuCgo+ICsgICAgLyoKPiArICAgICAqIER1ZSB0byByZWVudHJh
bmN5IHNjcmF0Y2ggY3B1bWFzayBjYW5ub3QgYmUgdXNlZCBpbiBJUlEsICNNQyBvciAjTk1JCj4g
KyAgICAgKiBjb250ZXh0Lgo+ICsgICAgICovCj4gKyAgICBCVUdfT04oaW5faXJxKCkgfHwgaW5f
bWNlX2hhbmRsZXIoKSB8fCBpbl9ubWlfaGFuZGxlcigpKTsKPiArCj4gKyAgICBpZiAoIHVzZSAm
JiB1bmxpa2VseSh0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2tfdXNlKSkgKQo+ICsgICAgewo+ICsg
ICAgICAgIHByaW50aygic2NyYXRjaCBDUFUgbWFzayBhbHJlYWR5IGluIHVzZSBieSAlcHMgKCVw
KVxuIiwKPiArICAgICAgICAgICAgICAgdGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrX3VzZSksIHRo
aXNfY3B1KHNjcmF0Y2hfY3B1bWFza191c2UpKTsKCldoeSB0aGUgcmF3ICVwIGFzIHdlbGw/IFdl
IGRvbid0IGRvIHNvIGVsc2V3aGVyZSwgSSB0aGluay4gWWVzLAppdCdzIGRlYnVnZ2luZyBjb2Rl
IG9ubHksIGJ1dCBJIHdvbmRlciBhbnl3YXkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
