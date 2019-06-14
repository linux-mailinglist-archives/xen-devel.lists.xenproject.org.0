Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05345682
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 09:39:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbgkG-0004ML-IS; Fri, 14 Jun 2019 07:35:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdkl=UN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hbgkF-0004MG-Fe
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 07:35:31 +0000
X-Inumbo-ID: f983b046-8e76-11e9-a836-9f1864e2789c
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f983b046-8e76-11e9-a836-9f1864e2789c;
 Fri, 14 Jun 2019 07:35:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0473EAE1B;
 Fri, 14 Jun 2019 07:35:24 +0000 (UTC)
To: Ankur Arora <ankur.a.arora@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-5-ankur.a.arora@oracle.com>
 <11f8b620-11ac-7075-019a-30d6bad7583c@citrix.com>
 <fbfc0a0c-3707-7f17-9f2a-6c9d2c7b05b1@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <59f7cc19-cd9b-119a-1715-50a947cd995d@suse.com>
Date: Fri, 14 Jun 2019 09:35:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fbfc0a0c-3707-7f17-9f2a-6c9d2c7b05b1@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 04/16] x86/xen: hypercall support for
 xenhost_t
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDYuMTkgMDk6MjAsIEFua3VyIEFyb3JhIHdyb3RlOgo+IE9uIDIwMTktMDYtMTIgMjox
NSBwLm0uLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAwOS8wNS8yMDE5IDE4OjI1LCBBbmt1
ciBBcm9yYSB3cm90ZToKPj4+IEFsbG93IGZvciBkaWZmZXJlbnQgaHlwZXJjYWxsIGltcGxlbWVu
dGF0aW9ucyBmb3IgZGlmZmVyZW50IHhlbmhvc3QgCj4+PiB0eXBlcy4KPj4+IE5lc3RlZCB4ZW5o
b3N0LCB3aGljaCBoYXMgdHdvIHVuZGVybHlpbmcgeGVuaG9zdHMsIGNhbiB1c2UgYm90aAo+Pj4g
c2ltdWx0YW5lb3VzbHkuCj4+Pgo+Pj4gVGhlIGh5cGVyY2FsbCBtYWNyb3MgKEhZUEVSVklTT1Jf
KikgaW1wbGljaXRseSB1c2UgdGhlIGRlZmF1bHQgeGVuaG9zdC54Cj4+PiBBIG5ldyBtYWNybyAo
aHlwZXJ2aXNvcl8qKSB0YWtlcyB4ZW5ob3N0X3QgKiBhcyBhIHBhcmFtZXRlciBhbmQgZG9lcyB0
aGUKPj4+IHJpZ2h0IHRoaW5nLgo+Pj4KPj4+IFRPRE86Cj4+PiDCoMKgIC0gTXVsdGljYWxscyBm
b3Igbm93IGFzc3VtZSB0aGUgZGVmYXVsdCB4ZW5ob3N0Cj4+PiDCoMKgIC0geGVuX2h5cGVyY2Fs
bF8qIHN5bWJvbHMgYXJlIG9ubHkgZ2VuZXJhdGVkIGZvciB0aGUgZGVmYXVsdCB4ZW5ob3N0Lgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFua3VyIEFyb3JhIDxhbmt1ci5hLmFyb3JhQG9yYWNsZS5j
b20+Cj4+Cj4+IEFnYWluLCB3aGF0IGlzIHRoZSBoeXBlcnZpc29yIG5lc3RpbmcgYW5kL29yIGd1
ZXN0IGxheW91dCBoZXJlPwo+IFR3byBoeXBlcnZpc29ycywgTDAgYW5kIEwxLCBhbmQgdGhlIGd1
ZXN0IGlzIGEgY2hpbGQgb2YgdGhlIEwxCj4gaHlwZXJ2aXNvciBidXQgY291bGQgaGF2ZSBQViBk
ZXZpY2VzIGF0dGFjaGVkIHRvIGJvdGggTDAgYW5kIEwxCj4gaHlwZXJ2aXNvcnMuCj4gCj4+Cj4+
IEkgY2FuJ3QgdGhpbmsgb2YgYW55IGNhc2Ugd2hlcmUgYSBzaW5nbGUgcGllY2Ugb2Ygc29mdHdh
cmUgY2FuCj4+IGxlZ2l0aW1hdGVseSBoYXZlIHR3byBoeXBlcmNhbGwgcGFnZXMsIGJlY2F1c2Ug
aWYgaXQgaGFzIG9uZSB3b3JraW5nCj4+IG9uZSwgaXQgaXMgYnkgZGVmaW5pdGlvbiBhIGd1ZXN0
LCBhbmQgdGhlcmVmb3JlIG5vdCBwcml2aWxlZ2VkIGVub3VnaCB0bwo+PiB1c2UgdGhlIG91dGVy
IG9uZS4KPiBEZXBlbmRpbmcgb24gd2hpY2ggaHlwZXJjYWxsIHBhZ2UgaXMgdXNlZCwgdGhlIGh5
cGVyY2FsbCB3b3VsZAo+IChldmVudHVhbGx5KSBsYW5kIGluIHRoZSBjb3JyZXNwb25kaW5nIGh5
cGVydmlzb3IuCj4gCj4gSnVlcmdlbiBlbHNld2hlcmUgcG9pbnRlZCBvdXQgcHJveHlpbmcgaHlw
ZXJjYWxscyBpcyBhIGJldHRlciBhcHByb2FjaCwKPiBzbyBJJ20gbm90IHJlYWxseSBjb25zaWRl
cmluZyB0aGlzIGFueSBtb3JlIGJ1dCwgZ2l2ZW4gdGhpcyBsYXlvdXQsIGFuZAo+IGFzc3VtaW5n
IHRoYXQgdGhlIGh5cGVyY2FsbCBwYWdlcyBjb3VsZCBiZSBlbmNvZGVkIGRpZmZlcmVudGx5IHdv
dWxkIGl0Cj4gc3RpbGwgbm90IHdvcms/CgpIeXBlcmNhbGxzIG1pZ2h0IHdvcmssIGJ1dCBpdCBp
cyBhIGJhZCBpZGVhIGFuZCBhIHZpb2xhdGlvbiBvZiBsYXllcmluZwp0byBsZXQgYSBMMSBndWVz
dCBpc3N1ZSBoeXBlcmNhbGxzIHRvIEwwIGh5cGVydmlzb3IsIGFzIHRob3NlIGh5cGVyY2FsbHMK
Y291bGQgaW5mbHVlbmNlIG90aGVyIEwxIGd1ZXN0cyBhbmQgZXZlbiB0aGUgTDEgaHlwZXJ2aXNv
ci4KCkhtbSwgdGhpbmtpbmcgbW9yZSBhYm91dCBpdCwgSSBldmVuIGRvdWJ0IHRob3NlIGh5cGVy
Y2FsbHMgY291bGQgd29yayBpbgphbGwgY2FzZXM6IHdoZW4gaXNzdWVkIGZyb20gYSBMMSBQViBn
dWVzdCB0aGUgaHlwZXJjYWxscyB3b3VsZCBzZWVtIHRvCmJlIGlzc3VlZCBmcm9tIHVzZXIgbW9k
ZSBmb3IgdGhlIEwwIGh5cGVydmlzb3IsIGFuZCB0aGlzIGlzIG5vdCBhbGxvd2VkLgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
