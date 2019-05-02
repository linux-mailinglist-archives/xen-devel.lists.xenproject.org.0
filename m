Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0CE11A6E
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:45:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMByZ-0006Ed-JJ; Thu, 02 May 2019 13:42:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Flb6=TC=citrix.com=prvs=018be947d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hMByY-0006ES-57
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:42:14 +0000
X-Inumbo-ID: 167d9a67-6ce0-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 167d9a67-6ce0-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 13:42:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="89572119"
To: Jan Beulich <JBeulich@suse.com>
References: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
 <8300afef-e75e-1d81-83e4-7f020595f81a@citrix.com>
 <5CCAEDAB020000780022B3EC@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a99e7a6b-6c45-759b-ee0e-ed9174397de3@citrix.com>
Date: Thu, 2 May 2019 14:42:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CCAEDAB020000780022B3EC@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDUvMjAxOSAxNDoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDIuMDUuMTkg
YXQgMTQ6NTksIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMDIvMDUv
MjAxOSAxMzoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9wY2kuYwo+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPj4+
IEBAIC0xNDUwLDE3ICsxNDUwLDM2IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3Qg
ZG9tYWluICoKPj4+ICAgICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29w
cyApCj4+PiAgICAgICAgICByZXR1cm4gMDsKPj4+ICAKPj4+IC0gICAgLyogUHJldmVudCBkZXZp
Y2UgYXNzaWduIGlmIG1lbSBwYWdpbmcgb3IgbWVtIHNoYXJpbmcgaGF2ZSBiZWVuIAo+Pj4gLSAg
ICAgKiBlbmFibGVkIGZvciB0aGlzIGRvbWFpbiAqLwo+Pj4gLSAgICBpZiAoIHVubGlrZWx5KGQt
PmFyY2guaHZtLm1lbV9zaGFyaW5nX2VuYWJsZWQgfHwKPj4+IC0gICAgICAgICAgICAgICAgICB2
bV9ldmVudF9jaGVja19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykgfHwKPj4+ICsgICAgZG9tYWlu
X2xvY2soZCk7Cj4+PiArCj4+PiArICAgIC8qCj4+PiArICAgICAqIFByZXZlbnQgZGV2aWNlIGFz
c2lnbm1lbnQgaWYgYW55IG9mCj4+PiArICAgICAqIC0gbWVtIHBhZ2luZwo+Pj4gKyAgICAgKiAt
IG1lbSBzaGFyaW5nCj4+PiArICAgICAqIC0gdGhlIHAybV9yYW1fcm8gdHlwZQo+Pj4gKyAgICAg
KiAtIGdsb2JhbCBsb2ctZGlydHkgbW9kZQo+PiBYZW5TZXJ2ZXIgaGFzIHdvcmtpbmcgbGl2ZSBt
aWdyYXRpb24gd2l0aCBHUFVzLCB3aGljaCB0aGlzIGNoYW5nZSB3b3VsZAo+PiByZWdyZXNzLgo+
Pgo+PiBCZWhpbmQgdGhlIHNjZW5lcywgd2UgY29tYmluZSBYZW4ncyBsb2dkaXJ0eSBiaXRtYXAg
d2l0aCBvbmUgcHJvdmlkZWQgYnkKPj4gdGhlIEdQVSwgdG8gZW5zdXJlIHRoYXQgYWxsIGRpcnR5
IHVwZGF0ZXMgYXJlIHRyYWNrZWQuCj4gQnV0IHRoaXMgc2F5cyBub3RoaW5nIGZvciB0aGUgcGF0
Y2ggaGVyZS4KClllcyBpdCBkb2VzLgoKVGhlcmUgaXMgbm90aGluZyBpbmhlcmVudCBhYm91dCBn
bG9iYWwgbG9nLWRpcnR5IG1vZGUgd2hpY2ggaXMKaW5jb21wYXRpYmxlIHdpdGggcGFzc3Rocm91
Z2ggd2hlbiB0aGUgSU9NTVUgcGFnZXRhYmxlcyBhcmUgbm90IHNoYXJlZAp3aXRoIEVQVC4KCj4g
QXMgbG9uZyBhcyBpdCBkb2Vzbid0IHdvcmsgaW4gdGhlIHN0YWdpbmcgdHJlZSwgaXQgc2hvdWxk
IGJlIHByZXZlbnRlZC4KCi4uLiBidXQgaXQgZG9lcyB3b3JrLgoKPiBJbiBYZW5TZXJ2ZXIKPiB5
b3UgY291bGQgdGhlbiBwYXRjaCBvdXQgdGhhdCBjaGVjayBhbmQgY29tbWVudCBsaW5lIHRvZ2V0
aGVyCj4gd2l0aCB3aGF0ZXZlciBvdGhlciBjaGFuZ2VzIHlvdSBoYXZlIHRvIG1ha2UgZm9yIHRo
aW5zIHRvCj4gd29yay4KCkV2ZXJ5dGhpbmcgaXMgdXBzdHJlYW0gaW4gdGhlIHZhcmlvdXMgcHJv
amVjdHMsIG90aGVyIHRoYW4gdGhlIHZlbmRvcidzCmNsb3NlZCBzb3VyY2UgbGlicmFyeSBhbmQg
a2VybmVsIGRyaXZlci4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
