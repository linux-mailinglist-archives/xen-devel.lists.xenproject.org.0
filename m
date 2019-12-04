Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF344112C5F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 14:12:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icUQP-0006GE-Bi; Wed, 04 Dec 2019 13:10:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icUQN-0006G8-Ql
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 13:10:35 +0000
X-Inumbo-ID: 741732a9-1697-11ea-8204-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 741732a9-1697-11ea-8204-12813bfff9fa;
 Wed, 04 Dec 2019 13:10:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 823ADB169;
 Wed,  4 Dec 2019 13:10:33 +0000 (UTC)
To: Jeremi Piotrowski <jeremi.piotrowski@gmail.com>
References: <CAHnBbQ8Xt=f_P+sntM27m7+NXft-U=DYXFdTV9hOqJBTU+CXNw@mail.gmail.com>
 <cae8cbfb-270a-6e1f-366c-b0aec3deb06b@suse.com>
 <20191201174714.GA13968@gentoo-tp.home>
 <68a03bc4-2f75-4327-8089-f6724c1d867c@suse.com>
 <20191204071433.GA5806@gentoo-tp.home>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db54c6bb-fdde-ddfb-c2fc-c013e891cfda@suse.com>
Date: Wed, 4 Dec 2019 14:10:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204071433.GA5806@gentoo-tp.home>
Content-Language: en-US
Subject: Re: [Xen-devel] bug: unable to LZ4 decompress ub1910 installer
 kernel when launching domU
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Pry Mar <pryorm09@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAwODoxNCwgSmVyZW1pIFBpb3Ryb3dza2kgd3JvdGU6Cj4gSSdtIGFibGUg
dG8gcmVwcm8sIGFuZCBJIGlzb2xhdGVkIHRoZSBjb2RlIGZyb20geGNfZG9tX2J6aW1hZ2Vsb2Fk
ZXIuYywKPiB4Y19kb21fZGVjb21wcmVzc19sejQuYyBhbmQgL3hlbi9jb21tb24vbHo0L2RlY29t
cHJlc3MuYyBzdWNoIHRoYXQgSSBjYW4KPiB0ZXN0IG1vcmUgZWFzaWx5IChJJ20gdXNpbmcgY29k
ZSBmcm9tIDQuMTIuMSkuIEknbSB0ZXN0aW5nIHdpdGgKPiB2bWxpbnV6LTUuMy4wLTIzLWdlbmVy
aWMgaW5zdGFsbGVkIGluIHVidW50dS0xOS4xMC4KPiAKPiBXaGF0IEkgc2VlIGlzIHRoYXQgdGhl
IGNvZGUgZmFpbHMgYXQgdGhlIGZpcnN0IGZyYW1lIGF0IGRlY29tcHJlc3MuYzoyODIKPiAoaWYg
KHVubGlrZWx5KCh1bnNpZ25lZCBsb25nKWNweSA8ICh1bnNpZ25lZCBsb25nKW9wKSkpLgo+IGJl
Y2F1c2UgY3B5ID09IChvcCAtIDEpLgo+IGRlY29tcHJlc3MuYzoyNjUgKGNweSA9IG9wICsgbGVu
Z3RoIC0gKFNURVBTSVpFLTQpOykgZ2V0cyBleGVjdXRlZCB0d2ljZSBhbmQKPiBwcmludHM6Cj4g
Cj4gbGVuZ3RoPTQKPiBsZW5ndGg9Mwo+IAo+IFNURVBTSVpFIGlzIDggKHg4Nl82NCkuIFNvIHRo
aXMgaGFzIHRvIGZhaWwuIFRoZSBTVEVQU0laRSBnYXZlIG1lIHRoZQo+IGlkZWEgdG8gcmVidWls
ZCB0aGUgY29kZSBhcyAzMi1iaXQgYW5kIGRlY29tcHJlc3Npb24gd29ya3MgY29ycmVjdGx5LgoK
VGhhbmtzIGEgbG90IGZvciB0aGUgYW5hbHlzaXMuCgo+IEFueSBzdWdnZXN0aW9ucyBob3cgdG8g
cHJvY2VlZD8KClBsZWFzZSBnaXZlIHRoZSBwYXRjaCBiZWxvdyBhIHRyeS4KCkphbgoKbHo0OiBy
ZXZlcnQgaGFsZiBvZiA5MTQzYTZjNTVlZjcgZm9yIHRoZSA2NC1iaXQgY2FzZQoKSSBjbGVhcmx5
IHdlbnQgdG9vIGZhciB0aGVyZTogV2hpbGUgdGhlIExaNF9XSUxEQ09QWSgpIGluc3RhbmNlcyBp
bmRlZWQKbmVlZCBwcmlvciBndWFyZGluZywgTFo0X1NFQ1VSRUNPUFkoKSBuZWVkcyB0aGlzIG9u
bHkgaW4gdGhlIDMyLWJpdCBjYXNlCih3aGVyZSBpdCBzaW1wbHkgYWxpYXNlcyBMWjRfV0lMRENP
UFkoKSkuICJjcHkiIGNhbiB2YWxpZGx5IHBvaW50CihzbGlnaHRseSkgYmVsb3cgIm9wIiBpbiB0
aGVzZSBjYXNlcywgZHVlIHRvCgoJCWNweSA9IG9wICsgbGVuZ3RoIC0gKFNURVBTSVpFIC0gNCk7
Cgp3aGVyZSBsZW5ndGggY2FuIGJlIGFzIGxvdyBhcyAwIGFuZCBTVEVQU0laRSBpcyA4LgoKUmVw
b3J0ZWQtYnk6IE1hcmsgUHJ5b3IgPHByeW9ybTA5QGdtYWlsLmNvbT4KUmVwb3J0ZWQtYnk6IEpl
cmVtaSBQaW90cm93c2tpIDxqZXJlbWkucGlvdHJvd3NraUBnbWFpbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSB1bnN0YWJsZS5vcmlnL3hl
bi9jb21tb24vbHo0L2RlY29tcHJlc3MuYworKysgdW5zdGFibGUveGVuL2NvbW1vbi9sejQvZGVj
b21wcmVzcy5jCkBAIC0xNDcsOCArMTQ3LDEwIEBAIHN0YXRpYyBpbnQgSU5JVCBsejRfdW5jb21w
cmVzcyhjb25zdCB1bnMKIAkJCQlnb3RvIF9vdXRwdXRfZXJyb3I7CiAJCQljb250aW51ZTsKIAkJ
fQorI2lmICFMWjRfQVJDSDY0CiAJCWlmICh1bmxpa2VseSgodW5zaWduZWQgbG9uZyljcHkgPCAo
dW5zaWduZWQgbG9uZylvcCkpCiAJCQlnb3RvIF9vdXRwdXRfZXJyb3I7CisjZW5kaWYKIAkJTFo0
X1NFQ1VSRUNPUFkocmVmLCBvcCwgY3B5KTsKIAkJb3AgPSBjcHk7IC8qIGNvcnJlY3Rpb24gKi8K
IAl9CkBAIC0yNzksOCArMjgxLDEwIEBAIHN0YXRpYyBpbnQgbHo0X3VuY29tcHJlc3NfdW5rbm93
bm91dHB1dHMKIAkJCQlnb3RvIF9vdXRwdXRfZXJyb3I7CiAJCQljb250aW51ZTsKIAkJfQorI2lm
ICFMWjRfQVJDSDY0CiAJCWlmICh1bmxpa2VseSgodW5zaWduZWQgbG9uZyljcHkgPCAodW5zaWdu
ZWQgbG9uZylvcCkpCiAJCQlnb3RvIF9vdXRwdXRfZXJyb3I7CisjZW5kaWYKIAkJTFo0X1NFQ1VS
RUNPUFkocmVmLCBvcCwgY3B5KTsKIAkJb3AgPSBjcHk7IC8qIGNvcnJlY3Rpb24gKi8KIAl9CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
