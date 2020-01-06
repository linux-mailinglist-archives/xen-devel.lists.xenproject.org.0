Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EADA1313E1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 15:41:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioTXp-0004Wg-9y; Mon, 06 Jan 2020 14:39:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioTXn-0004WY-8F
 for xen-devel@lists.xen.org; Mon, 06 Jan 2020 14:39:47 +0000
X-Inumbo-ID: 5d7e42c4-3092-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d7e42c4-3092-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 14:39:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 47A0AABC7;
 Mon,  6 Jan 2020 14:39:37 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191217154625.31561-1-sergey.dyasli@citrix.com>
 <a5e3c4b7-40f4-017b-1154-d75f92075597@suse.com>
 <65aecab1-a1b0-f02e-be92-cda3cd37b9e5@citrix.com>
 <e997ff3e-4260-c872-0166-3885ce1a4ee1@suse.com>
 <2e8bc256-6e7f-ff3d-0917-c744a92cc6ac@citrix.com>
 <d41c1d28-d582-089a-3c8e-9e7d65edc201@citrix.com>
 <16a4056b-c74a-4fdf-499f-755120edf2d5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8593adbb-cc67-fca1-30e6-555fa9adcb86@suse.com>
Date: Mon, 6 Jan 2020 15:40:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <16a4056b-c74a-4fdf-499f-755120edf2d5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNTozNSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAwNi8wMS8yMDIw
IDExOjI4LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAxMi8xOS8xOSAxMToxNSBQTSwgQW5k
cmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDE5LzEyLzIwMTkgMTE6MzUsIEphbiBCZXVsaWNoIHdy
b3RlOgo+Pj4+Pj4+ICAgICBYRU5WRVJfY2hhbmdlc2V0Cj4+Pj4+Pj4gICAgIFhFTlZFUl9jb21t
YW5kbGluZQo+Pj4+Pj4+ICAgICBYRU5WRVJfYnVpbGRfaWQKPj4+Pj4+Pgo+Pj4+Pj4+IFJldHVy
biBhIG1vcmUgY3VzdG9tZXIgZnJpZW5kbHkgZW1wdHkgc3RyaW5nIGluc3RlYWQgb2YgIjxkZW5p
ZWQ+Igo+Pj4+Pj4+IHdoaWNoIHdvdWxkIGJlIHNob3duIGluIHRvb2xzIGxpa2UgZG1pZGVjb2Rl
Lj4KPj4+Pj4+IEkgdGhpbmsgIjxkZW5pZWQ+IiBpcyBxdWl0ZSBmaW5lIGZvciBtYW55IG9mIHRo
ZSBvcmlnaW5hbCBwdXJwb3Nlcy4KPj4+Pj4+IE1heWJlIGl0IHdvdWxkIGJlIGJldHRlciB0byBm
aWx0ZXIgZm9yIHRoaXMgd2hlbiBwb3B1bGF0aW5nIGd1ZXN0Cj4+Pj4+PiBETUkgdGFibGVzPwo+
Pj4+PiBJIGRvbid0IGtub3cgaG93IERNSSB0YWJsZXMgYXJlIHBvcHVsYXRlZCwgYnV0IG5vdGhp
bmcgc3RvcHMgYSBndWVzdAo+Pj4+PiBmcm9tIHVzaW5nIHRoZXNlIGh5cGVyY2FsbHMgZGlyZWN0
bHkuCj4+Pj4gQW5kIHRoaXMgaXMgcHJlY2lzZWx5IHRoZSBjYXNlIHdoZXJlIEkgdGhpbmsgIjxk
ZW5pZWQ+IiBpcyBiZXR0ZXIKPj4+PiB0aGFuIGFuIGVtcHR5IHN0cmluZy4KPj4+Cj4+PiAiPGRl
bmllZD4iIHdhcyBhIHRlcnJpYmxlIGNob2ljZSBiYWNrIHdoZW4gaXQgd2FzIGludHJvZHVjZWQs
IGFuZCBpdHMKPj4+IHN0aWxsIGEgdGVycmlibGUgY2hvaWNlIHRvZGF5Lgo+Pj4KPj4+IFRoZXNl
IGFyZSBBU0NJSSBzdHJpbmcgZmllbGRzLCBhbmQgdGhlIGVtcHR5IHN0cmluZyBpcyBhIHBlcmZl
Y3RseSBnb29kCj4+PiBzdHJpbmcuwqAgTm90aGluZyBpcyBnb2luZyB0byBicmVhaywgYmVjYXVz
ZSBpdCB3b3VsZCBoYXZlIGJyb2tlbiB0aGUKPj4+IGZpcnN0IHRpbWUgYXJvdW5kLgo+Pj4KPj4+
IFRoZSBlbmQgcmVzdWx0IHdpdGhvdXQgZGVuaWVkIHNwcmF5ZWQgYWxsIG92ZXIgdGhpcyBpbnRl
cmZhY2UgaXMgbXVjaAo+Pj4gY2xlYW5lciBvdmVyYWxsLgo+Pgo+PiBVbmZvcnR1bmF0ZWx5IHRo
aXMgbWFpbCBkb2Vzbid0IGNvbnRhaW4gYW55IGZhY3RzIG9yIGFyZ3VtZW50cywganVzdAo+PiB1
bnN1YnN0YW50aWF0ZWQgdmFsdWUganVkZ2VtZW50cy4gIFdoYXQncyBzbyB0ZXJyaWJsZSBhYm91
dCAiPGRlbmllZD4iCj4+IC0tIHdoYXQgYmFkIGVmZmVjdCBkb2VzIGl0IGhhdmU/ICBXaHkgaXMg
IiIgYmV0dGVyIC8gY2xlYW5lcj8KPiAKPiBJdCBjYW4gYmUgZXhwbGFpbmVkIHdpdGggYSBwaWN0
dXJlIChhdHRhY2hlZCkgOykKCkJ1dCB0aGF0J3Mgc29tZXRoaW5nIGJldHRlciBhZGRyZXNzZWQg
YXQgb3IgY2xvc2UgdG8gdGhlIHByZXNlbnRhdGlvbgpsYXllciwgbm90IGRlZXAgZG93biBpbiBY
ZW4uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
