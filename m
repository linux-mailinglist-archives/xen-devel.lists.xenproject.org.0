Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320921736CC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:06:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7eMP-0006Ei-2Z; Fri, 28 Feb 2020 12:03:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7eMN-0006Ed-KR
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:03:15 +0000
X-Inumbo-ID: 4babf836-5a22-11ea-990d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4babf836-5a22-11ea-990d-12813bfff9fa;
 Fri, 28 Feb 2020 12:03:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 898ADB3FA;
 Fri, 28 Feb 2020 12:03:13 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200228093334.36586-1-roger.pau@citrix.com>
 <20200228093334.36586-3-roger.pau@citrix.com>
 <12c75d73-cc89-9b8c-011a-b6e11f6cf58d@suse.com>
 <20200228103131.GU24458@Air-de-Roger.citrite.net>
 <694efd6e-91cc-6a31-dded-0af339af4bef@suse.com>
 <20200228114106.GV24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83dd91cf-d65c-bbcf-b6ce-e4da8614c11d@suse.com>
Date: Fri, 28 Feb 2020 13:03:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228114106.GV24458@Air-de-Roger.citrite.net>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxMjo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyOCwgMjAyMCBhdCAxMjoxNToyMVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjguMDIuMjAyMCAxMTozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIEZyaSwgRmVi
IDI4LCAyMDIwIGF0IDExOjE2OjU1QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDI4LjAyLjIwMjAgMTA6MzMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gKyAgICAvKgo+
Pj4+PiArICAgICAqIER1ZSB0byByZWVudHJhbmN5IHNjcmF0Y2ggY3B1bWFzayBjYW5ub3QgYmUg
dXNlZCBpbiBJUlEsICNNQyBvciAjTk1JCj4+Pj4+ICsgICAgICogY29udGV4dC4KPj4+Pj4gKyAg
ICAgKi8KPj4+Pj4gKyAgICBCVUdfT04oaW5faXJxKCkgfHwgaW5fbWNlX2hhbmRsZXIoKSB8fCBp
bl9ubWlfaGFuZGxlcigpKTsKPj4+Pj4gKwo+Pj4+PiArICAgIGlmICggdXNlICYmIHVubGlrZWx5
KHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFza191c2UpKSApCj4+Pj4+ICsgICAgewo+Pj4+PiArICAg
ICAgICBwcmludGsoInNjcmF0Y2ggQ1BVIG1hc2sgYWxyZWFkeSBpbiB1c2UgYnkgJXBzICglcClc
biIsCj4+Pj4+ICsgICAgICAgICAgICAgICB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2tfdXNlKSwg
dGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrX3VzZSkpOwo+Pj4+Cj4+Pj4gV2h5IHRoZSByYXcgJXAg
YXMgd2VsbD8gV2UgZG9uJ3QgZG8gc28gZWxzZXdoZXJlLCBJIHRoaW5rLiBZZXMsCj4+Pj4gaXQn
cyBkZWJ1Z2dpbmcgY29kZSBvbmx5LCBidXQgSSB3b25kZXIgYW55d2F5Lgo+Pj4KPj4+IEkgdXNl
IGFkZHIybGluZSB0byBmaW5kIHRoZSBvZmZlbmRpbmcgbGluZSwgYW5kIGl0J3MgbXVjaCBlYXNp
ZXIgdG8gZG8KPj4+IHNvIGlmIHlvdSBoYXZlIHRoZSBhZGRyZXNzIGRpcmVjdGx5LCByYXRoZXIg
dGhhbiBoYXZpbmcgdG8gdXNlIG5tIGluCj4+PiBvcmRlciB0byBmaWd1cmUgb3V0IHRoZSBhZGRy
ZXNzIG9mIHRoZSBzeW1ib2wgYW5kIHRoZW4gYWRkIHRoZSBvZmZzZXQuCj4+Pgo+Pj4gTWF5YmUg
SSdtIG1pc3Npbmcgc29tZSBvdGhlciB3YXkgdG8gZG8gdGhpcyBtb3JlIGVhc2lseT8KPj4KPj4g
SW4gc3VjaCBhIGNhc2Ugd2UgbWF5IHdhbnQgdG8gY29uc2lkZXIgbWFraW5nICVwcyAoYW5kICVw
UykKPj4gcHJpbnQgYSBoZXggcHJlc2VudGF0aW9uIG5leHQgdG8gdGhlIGRlY29kZWQgb25lLCBp
biBkZWJ1Zwo+PiBidWlsZHMgYXQgbGVhc3QuIEFuZHJldywgdGhvdWdodHM/IChUaGVyZSBtYXkg
YmUgY2FzZXMgd2hlcmUKPj4gdGhpcyBpcyBub3Qgd2FudGVkLCBiaXQgaWYgd2UgbWFkZSB0aGlz
IGEgZGVidWcgbW9kZSBvbmx5Cj4+IGZlYXR1cmUsIEkgdGhpbmsgaXQgd291bGRuJ3QgZG8gdG9v
IG11Y2ggaGFybS4pCj4gCj4gSWYgeW91IGFncmVlIHRvIG1ha2UgJXBbc1NdIHByaW50IHRoZSBh
ZGRyZXNzIHRoZW4gSSBjYW4gZHJvcCB0aGlzCj4gYW5kIHNlbmQgYSBwYXRjaCB0byB0aGF0IGVm
ZmVjdCAobGlrZWx5IG5leHQgd2VlaykuCgpJbiBwcmluY2lwbGUgSSBhZ3JlZSwgYnV0IHRoZSBl
ZmZlY3QgaW4gcGFydGljdWxhciBvbiBzdGFjawpkdW1wcyBuZWVkcyB0byBiZSBsb29rZWQgYXQg
cHJldHR5IGNsb3NlbHkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
