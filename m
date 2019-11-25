Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AA4108C2A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 11:46:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZBrB-0005np-Gu; Mon, 25 Nov 2019 10:44:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZBr9-0005nk-He
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 10:44:35 +0000
X-Inumbo-ID: 8f0a0988-0f70-11ea-a38d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f0a0988-0f70-11ea-a38d-12813bfff9fa;
 Mon, 25 Nov 2019 10:44:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 78027AC0C;
 Mon, 25 Nov 2019 10:44:29 +0000 (UTC)
To: Doug Goldstein <cardoe@cardoe.com>
References: <a1f4af5b-65f6-6ebf-37af-828cc7e6fff2@cardoe.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa0dce89-fadf-e23a-3e71-f84ad7a98613@suse.com>
Date: Mon, 25 Nov 2019 11:44:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a1f4af5b-65f6-6ebf-37af-828cc7e6fff2@cardoe.com>
Content-Language: en-US
Subject: Re: [Xen-devel] tools/tests/x86_emulator causes build failures with
 older but supported compilers
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTEuMjAxOSAxOTowMCwgRG91ZyBHb2xkc3RlaW4gd3JvdGU6Cj4gUGVyIFJFQURNRSwg
R0NDIDQuMS4yIHNob3VsZCBsZWFkIHRvIGEgc3VjY2Vzc2Z1bCBkZWZhdWx0ICJtYWtlIGluc3Rh
bGwiIAo+IHBlciBJTlNUQUxMLiBDdXJyZW50bHkgdGhpcyBpcyBmYWlsaW5nIGR1ZSB0byB0b29s
cy90ZXN0cy94ODZfZW11bGF0b3IgCj4gYmVpbmcgaW4gdGhlIGRlZmF1bHQgcGF0aCBhbmQgcmVx
dWlyaW5nIGEgY29tcGlsZXIgd2l0aCBBVlguIEdDQyA0LjQuNyAKPiBvbiBDZW50T1MgNiBkb2Vz
IG5vdCBoYXZlIHRoaXMgbGVhZGluZyB0byBhIGZhaWx1cmUgdG8gYnVpbGQuCj4gCj4gMTI2NSBt
YWtlWzVdOiBFbnRlcmluZyBkaXJlY3RvcnkgYC9idWlsZHMveGVuLXByb2plY3QveGVuL3Rvb2xz
L3Rlc3RzJwo+IDEyNjYgbWFrZSAtQyB4ODZfZW11bGF0b3IgaW5zdGFsbAo+IDEyNjcgY2MxOiBl
cnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBvcHRpb24gIi1tYXZ4MiIKPiAxMjY4IGNj
MTogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uICItbWF2eDUxMmYiCj4g
MTI2OSBjYzE6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZCBsaW5lIG9wdGlvbiAiLW1hdng1
MTJidyIKPiAxMjcwIGNjMTogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9u
ICItbWF2eDUxMmRxIgo+IDEyNzEgY2MxOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGlu
ZSBvcHRpb24gIi1tYXZ4NTEyZXIiCj4gMTI3MiBjYzE6IGVycm9yOiB1bnJlY29nbml6ZWQgY29t
bWFuZCBsaW5lIG9wdGlvbiAiLW1hdng1MTJ2Ym1pIgo+IDEyNzMgL3RtcC9jY01rTHBUVi5zOiBB
c3NlbWJsZXIgbWVzc2FnZXM6Cj4gMTI3NCAvdG1wL2NjTWtMcFRWLnM6MzogRXJyb3I6IGp1bmsg
YXQgZW5kIG9mIGxpbmUsIGZpcnN0IHVucmVjb2duaXplZCAKPiBjaGFyYWN0ZXIgaXMgYHsnCgpU
aGVzZSBhcmUgZXJyb3JzLCB5ZXMsIGJ1dCAuLi4KCj4gMTI3NSBtYWtlWzZdOiBFbnRlcmluZyBk
aXJlY3RvcnkgCj4gYC9idWlsZHMveGVuLXByb2plY3QveGVuL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVs
YXRvcicKPiAxMjc2IE1ha2VmaWxlOjExNjogVGVzdCBoYXJuZXNzIG5vdCBidWlsdCwgdXNlIG5l
d2VyIGNvbXBpbGVyIHRoYW4gImdjYyIgCj4gKHZlcnNpb24gNC40LjcpIGFuZCBhbiAie2V2ZXh9
IiBjYXBhYmxlIGFzc2VtYmxlcgo+IDEyNzcgbWFrZVs2XTogTm90aGluZyB0byBiZSBkb25lIGZv
ciBgaW5zdGFsbCcuCgouLi4gdGhlcmUncyBubyBidWlsZCBmYWlsdXJlIGhlcmUgYWZhaWNzLCBh
bmQgdGhpcyBpcyB0aGUgaW50ZW5kZWQKd2F5IG9mIGhvdyB0aGluZ3MgYXJlIHRvIHdvcmsuCgo+
IEZ1bGwgbG9nIGhlcmU6IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC94ZW4vLS9qb2Jz
LzM1ODg1Mjk3OCNMMTI2Ngo+IAo+IFdlIGhhdmUgMiBvcHRpb25zIGZvciB0aGUgbmV4dCByZWxl
YXNlOgo+IAo+IDEuIEJ1bXAgdGhlIG1pbmltdW0gR0NDIHJlcXVpcmVtZW50IGZvciB0aGUgdHJl
ZSBhbmQgZHJvcCBhbnkgc3VwcG9ydCAKPiBmb3IgYW55IGRpc3RybyBub3QgbWF0Y2hpbmcgdGhh
dCByZXF1aXJlbWVudC4KCk5vdCBhbiBvcHRpb24gLSB0aGUgaGFybmVzcyBjYW4gb25seSBiZSBi
dWlsdCB3aXRoIGdjYyA4IG9yIG5ld2VyIHJpZ2h0Cm5vdywgeWV0IHdlIGNhbid0IHJhaXNlIHRo
ZSByZXF1aXJlbWVudHMgKGZvciBhbGwgb2YgWGVuKSB0aGlzIG11Y2ggaW1vLgoKPiAyLiBGaXgg
dGhlIGRlZmF1bHQgYnVpbGQgdG8gd29yayB3aXRoIG9sZGVyIEdDQyB2ZXJzaW9ucy4KCk5vdCBh
IHJlYXNvbmFibGUgb3B0aW9uIGVpdGhlciwgYXMgaXQgd291bGQgYmUgY2x1dHRlcmluZyB0aGUg
aGFybmVzcwp3aXRoIGFsbCBzb3J0cyBvZiAjaWZkZWYtcyBvciBhYnN0cmFjdGluZyB3cmFwcGVy
cywgbWFraW5nIGl0IGV2ZW4KbW9yZSBkaWZmaWN1bHQgdG8gbWFrZSBjaGFuZ2VzIHRvIGl0LgoK
V2hhdCB3YXMgY29uc2lkZXJlZCBpbiB0aGUgcGFzdCB3YXMgdG8gc2tpcCBidWlsZGluZyBvZiB0
ZXN0cy8gYXMgYQp3aG9sZSBpbiBub24tZGVidWcgYnVpbGRzOyBkb24ndCBrbm93IHdoYXQgaGFz
IGNvbWUgb2YgdGhpcy4gSXQgaXMKcHJvYmFibHkgdGVsbGluZyBlbm91Z2ggdGhhdCB0aGUgYm90
dG9tIG9mIC4vQ29uZmlnLm1rIHJlYWRzIGxpa2UgdGhpczoKCiMgU2hvcnQgYW5zd2VyIC0tIGRv
IG5vdCBlbmFibGUgdGhpcyB1bmxlc3MgeW91IGtub3cgd2hhdCB5b3UgYXJlCiMgZG9pbmcgYW5k
IGFyZSBwcmVwYXJlZCBmb3Igc29tZSBwYWluLgoKQ09ORklHX1RFU1RTICAgICAgID89IHkKCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
