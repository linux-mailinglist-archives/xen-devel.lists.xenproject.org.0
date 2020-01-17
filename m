Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA281408FC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 12:34:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPqx-0001gW-Rm; Fri, 17 Jan 2020 11:31:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HJCJ=3G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1isPqw-0001gN-9X
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 11:31:50 +0000
X-Inumbo-ID: ee8f7264-391c-11ea-8e9a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee8f7264-391c-11ea-8e9a-bc764e2007e4;
 Fri, 17 Jan 2020 11:31:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BAE58B1B9;
 Fri, 17 Jan 2020 11:31:40 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200116170004.14373-1-jgross@suse.com>
 <c29c92e3-eb20-7e0a-0174-ef72398b0998@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dc509037-a7d6-caa5-8000-28aeb20b638e@suse.com>
Date: Fri, 17 Jan 2020 12:31:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <c29c92e3-eb20-7e0a-0174-ef72398b0998@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/balloon: Support xend-based toolstack
 take two
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAgMTI6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE2LjAxLjIwMjAgMTg6
MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IENvbW1pdCAzYWE2YzE5ZDJmMzhiZSAoInhlbi9i
YWxsb29uOiBTdXBwb3J0IHhlbmQtYmFzZWQgdG9vbHN0YWNrIikKPj4gdHJpZWQgdG8gZml4IGEg
cmVncmVzc2lvbiB3aXRoIHJ1bm5pbmcgb24gcmF0aGVyIGFuY2llbnQgWGVuIHZlcnNpb25zLgo+
PiBVbmZvcnR1bmF0ZWx5IHRoZSBmaXggd2FzIGJhc2VkIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQg
eGVuZCB3b3VsZAo+PiBqdXN0IHVzZSBhbm90aGVyIFhlbnN0b3JlIG5vZGUsIGJ1dCBpbiByZWFs
aXR5IG9ubHkgc29tZSBkb3duc3RyZWFtCj4+IHZlcnNpb25zIG9mIHhlbmQgYXJlIGRvaW5nIHRo
YXQuIFRoZSB1cHN0cmVhbSB4ZW5kIGRvZXMgbm90IHdyaXRlCj4+IHRoYXQgWGVuc3RvcmUgbm9k
ZSBhdCBhbGwsIHNvIHRoZSBwcm9ibGVtIG11c3QgYmUgZml4ZWQgaW4gYW5vdGhlcgo+PiB3YXku
Cj4+Cj4+IFRoZSBlYXNpZXN0IHdheSB0byBhY2hpZXZlIHRoYXQgaXMgdG8gZmFsbCBiYWNrIHRv
IHRoZSBiZWhhdmlvciBiZWZvcmUKPj4gY29tbWl0IDUyNjZiOGU0NDQ1YyAoInhlbjogZml4IGJv
b3RpbmcgYmFsbG9vbmVkIGRvd24gaHZtIGd1ZXN0IikKPj4gaW4gY2FzZSB0aGUgc3RhdGljIG1l
bW9yeSBtYXhpbXVtIGNhbid0IGJlIHJlYWQuCj4gCj4gSSBjb3VsZCB1c2Ugc29tZSBoZWxwIGhl
cmU6IFByaW9yIHRvIHNhaWQgY29tbWl0IHRoZXJlIHdhcwo+IAo+IAl0YXJnZXRfZGlmZiA9IG5l
d190YXJnZXQgLSBiYWxsb29uX3N0YXRzLnRhcmdldF9wYWdlczsKPiAKPiAKPiBXaGljaCBpcywg
YWZhaWN0LCAuLi4KPiAKPj4gLS0tIGEvZHJpdmVycy94ZW4veGVuLWJhbGxvb24uYwo+PiArKysg
Yi9kcml2ZXJzL3hlbi94ZW4tYmFsbG9vbi5jCj4+IEBAIC05NCw3ICs5NCw3IEBAIHN0YXRpYyB2
b2lkIHdhdGNoX3RhcmdldChzdHJ1Y3QgeGVuYnVzX3dhdGNoICp3YXRjaCwKPj4gICAJCQkJICAi
JWxsdSIsICZzdGF0aWNfbWF4KSA9PSAxKSkKPj4gICAJCQlzdGF0aWNfbWF4ID4+PSBQQUdFX1NI
SUZUIC0gMTA7Cj4+ICAgCQllbHNlCj4+IC0JCQlzdGF0aWNfbWF4ID0gbmV3X3RhcmdldDsKPj4g
KwkJCXN0YXRpY19tYXggPSBiYWxsb29uX3N0YXRzLmN1cnJlbnRfcGFnZXM7Cj4+ICAgCj4+ICAg
CQl0YXJnZXRfZGlmZiA9ICh4ZW5fcHZfZG9tYWluKCkgfHwgeGVuX2luaXRpYWxfZG9tYWluKCkp
ID8gMAo+PiAgIAkJCQk6IHN0YXRpY19tYXggLSBiYWxsb29uX3N0YXRzLnRhcmdldF9wYWdlczsK
PiAKPiAuLi4gd2hhdCB0aGUgY29kZSBkb2VzIGJlZm9yZSB5b3VyIGNoYW5nZS4gQWZhaWN0IHRo
ZXJlIHdhcwo+IG5ldmVyIGEgdXNlIG9mIGJhbGxvb25fc3RhdHMuY3VycmVudF9wYWdlcyBpbiB0
aGlzIGZ1bmN0aW9uLgoKVGhhdCBpcyBhIGxpdHRsZSBiaXQgaW5kaXJlY3QsIHllcy4gSW4gdGhl
IGVuZCBJIHdhbnQgc3RhdGljX21heCB0bwpiZSBlaXRoZXIgdGhlIG1heGltdW0gcmVwb3J0ZWQg
YnkgWGVuLCBvciBpZiBub3QgYXZhaWxhYmxlLCB0aGUgY3VycmVudAphc3N1bWVkIG1lbW9yeSBz
aXplLCB3aGljaCBjYW4gYmUgZm91bmQgaW4gYmFsbG9vbl9zdGF0cy5jdXJyZW50X3BhZ2VzLgoK
VGhlIG1haW4gaWRlYSBpcyB0byBhdm9pZCBhIG5lZ2F0aXZlIHRhcmdldF9kaWZmIHdoaWNoIHdv
dWxkIHJlc3VsdCBpbgpub3QgYmFsbG9vbmluZyBkb3duLgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
