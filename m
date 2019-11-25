Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE51108FBF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 15:21:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZFCz-0000fj-Ca; Mon, 25 Nov 2019 14:19:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZFCx-0000fc-No
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 14:19:19 +0000
X-Inumbo-ID: 90e42ff4-0f8e-11ea-9455-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90e42ff4-0f8e-11ea-9455-bc764e2007e4;
 Mon, 25 Nov 2019 14:19:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 79605B48E;
 Mon, 25 Nov 2019 14:19:17 +0000 (UTC)
To: Doug Goldstein <cardoe@cardoe.com>
References: <a1f4af5b-65f6-6ebf-37af-828cc7e6fff2@cardoe.com>
 <fa0dce89-fadf-e23a-3e71-f84ad7a98613@suse.com>
 <b5a2fc2d-c330-fe68-cdd8-a0fb845905d1@cardoe.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <12fce767-273b-e9df-8496-af02da3238e1@suse.com>
Date: Mon, 25 Nov 2019 15:19:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b5a2fc2d-c330-fe68-cdd8-a0fb845905d1@cardoe.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAxNDo1MiwgRG91ZyBHb2xkc3RlaW4gd3JvdGU6Cj4gT24gMTEvMjUvMTkg
NDo0NCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gCj4+IE9uIDIzLjExLjIwMTkgMTk6MDAsIERv
dWcgR29sZHN0ZWluIHdyb3RlOgo+Pj4gUGVyIFJFQURNRSwgR0NDIDQuMS4yIHNob3VsZCBsZWFk
IHRvIGEgc3VjY2Vzc2Z1bCBkZWZhdWx0ICJtYWtlIGluc3RhbGwiCj4+PiBwZXIgSU5TVEFMTC4g
Q3VycmVudGx5IHRoaXMgaXMgZmFpbGluZyBkdWUgdG8gdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9y
Cj4+PiBiZWluZyBpbiB0aGUgZGVmYXVsdCBwYXRoIGFuZCByZXF1aXJpbmcgYSBjb21waWxlciB3
aXRoIEFWWC4gR0NDIDQuNC43Cj4+PiBvbiBDZW50T1MgNiBkb2VzIG5vdCBoYXZlIHRoaXMgbGVh
ZGluZyB0byBhIGZhaWx1cmUgdG8gYnVpbGQuCj4+Pgo+Pj4gMTI2NSBtYWtlWzVdOiBFbnRlcmlu
ZyBkaXJlY3RvcnkgYC9idWlsZHMveGVuLXByb2plY3QveGVuL3Rvb2xzL3Rlc3RzJwo+Pj4gMTI2
NiBtYWtlIC1DIHg4Nl9lbXVsYXRvciBpbnN0YWxsCj4+PiAxMjY3IGNjMTogZXJyb3I6IHVucmVj
b2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uICItbWF2eDIiCj4+PiAxMjY4IGNjMTogZXJyb3I6
IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uICItbWF2eDUxMmYiCj4+PiAxMjY5IGNj
MTogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uICItbWF2eDUxMmJ3Igo+
Pj4gMTI3MCBjYzE6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZCBsaW5lIG9wdGlvbiAiLW1h
dng1MTJkcSIKPj4+IDEyNzEgY2MxOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBv
cHRpb24gIi1tYXZ4NTEyZXIiCj4+PiAxMjcyIGNjMTogZXJyb3I6IHVucmVjb2duaXplZCBjb21t
YW5kIGxpbmUgb3B0aW9uICItbWF2eDUxMnZibWkiCj4+PiAxMjczIC90bXAvY2NNa0xwVFYuczog
QXNzZW1ibGVyIG1lc3NhZ2VzOgo+Pj4gMTI3NCAvdG1wL2NjTWtMcFRWLnM6MzogRXJyb3I6IGp1
bmsgYXQgZW5kIG9mIGxpbmUsIGZpcnN0IHVucmVjb2duaXplZAo+Pj4gY2hhcmFjdGVyIGlzIGB7
Jwo+PiBUaGVzZSBhcmUgZXJyb3JzLCB5ZXMsIGJ1dCAuLi4KPj4KPj4+IDEyNzUgbWFrZVs2XTog
RW50ZXJpbmcgZGlyZWN0b3J5Cj4+PiBgL2J1aWxkcy94ZW4tcHJvamVjdC94ZW4vdG9vbHMvdGVz
dHMveDg2X2VtdWxhdG9yJwo+Pj4gMTI3NiBNYWtlZmlsZToxMTY6IFRlc3QgaGFybmVzcyBub3Qg
YnVpbHQsIHVzZSBuZXdlciBjb21waWxlciB0aGFuICJnY2MiCj4+PiAodmVyc2lvbiA0LjQuNykg
YW5kIGFuICJ7ZXZleH0iIGNhcGFibGUgYXNzZW1ibGVyCj4+PiAxMjc3IG1ha2VbNl06IE5vdGhp
bmcgdG8gYmUgZG9uZSBmb3IgYGluc3RhbGwnLgo+PiAuLi4gdGhlcmUncyBubyBidWlsZCBmYWls
dXJlIGhlcmUgYWZhaWNzLCBhbmQgdGhpcyBpcyB0aGUgaW50ZW5kZWQKPj4gd2F5IG9mIGhvdyB0
aGluZ3MgYXJlIHRvIHdvcmsuCj4gCj4gVGhlIHRyZWUgaXMgaW50ZW5kZWQgdG8gYnVpbGQgd2l0
aCBhIGRlZmF1bHQgIm1ha2UgaW5zdGFsbCIgd2l0aCBhIAo+IHN1cHBvcnRlZCBzZXQgb2YgdG9v
bHMgZnJvbSBSRUFETUUuIFRoaXMgaXMgcGFydCBvZiB0aGUgY29udmVyc2F0aW9ucyAKPiB3ZSd2
ZSBoYWQgaW4gdGhlIHBhc3QgYWJvdXQgd2hhdCBzaG91bGQgYmUgdHJlYXRlZCBhcyBwcm9wZXIg
YW5kIGl0IHdhcyAKPiB1bml2ZXJzYWxseSBhZ3JlZWQuCgpZb3Ugc3RpbGwgZGlkbid0IGNsYXJp
Znkgd2hlcmUgdGhlIGJ1aWxkIGZhaWx1cmUgaXMgaW4gaGVyZS4gT3NzdGVzdApmb3IgZXhhbXBs
ZSBoaXRzIHRoZSBhYm92ZSBlcnJvcnMgYWxsIHRoZSB0aW1lLCB3aXRob3V0IHRoZSBidWlsZApm
YWlsaW5nLiBTYW1lIGZvciBhcHBhcmVudGx5IGV2ZXJ5b25lIGVsc2UuCgpBbmQgbm8sIEkgZG9u
J3QgdGhpbmsgaXQgd2FzIGFncmVlZCB0aGF0IHRoZSBfdGVzdHNfIG5lZWQgdG8gYmUKYnVpbGRh
YmxlIHdpdGggcmFuZG9tIG9sZCB0b29sIGNoYWlucy4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
