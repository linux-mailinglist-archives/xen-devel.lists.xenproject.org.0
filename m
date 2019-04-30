Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37300FD71
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 18:06:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLVEU-0007sL-Af; Tue, 30 Apr 2019 16:03:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m7Se=TA=citrix.com=prvs=016bbe1f6=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hLVES-0007sB-9k
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 16:03:48 +0000
X-Inumbo-ID: 89017522-6b61-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 89017522-6b61-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 16:03:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,414,1549929600"; d="scan'208";a="84774101"
To: Jan Beulich <JBeulich@suse.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
 <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
 <CABfawhnjK-6KtLQx_bKngHg6+nHdjEMDYoSGErOGL5581JyZHw@mail.gmail.com>
 <5CC80AE3020000780022A44D@prv1-mh.provo.novell.com>
 <3c95a2b1-11bf-faff-5c55-99e517c56a48@citrix.com>
 <5CC8646F020000780022A89E@prv1-mh.provo.novell.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <b6b753ed-baa3-832f-5d40-e26d0a25a36a@citrix.com>
Date: Tue, 30 Apr 2019 17:03:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <5CC8646F020000780022A89E@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8zMC8xOSA0OjA2IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAzMC4wNC4xOSBh
dCAxNjo0MywgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDQvMzAvMTkg
OTo0NCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAzMC4wNC4xOSBhdCAxMDoyOCwg
PHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+Pj4+IE9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0
IDE6MTUgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4gSSd2
ZSBvdXRsaW5lZCBhIHNvbHV0aW9uIGFscmVhZHk6IE1ha2UgYSBtZW0tc2hhcmluZyBwcml2YXRl
IHZhcmlhbnQKPj4+Pj4gb2YgcGFnZV97LHVufWxvY2soKSwgZGVyaXZlZCBmcm9tIHRoZSBQViBv
bmVzIChidXQgd2l0aCBwaWVjZXMKPj4+Pj4gZHJvcHBlZCB5b3UgZG9uJ3Qgd2FudC9uZWVkKS4K
Pj4+Pgo+Pj4+IFdlbGwsIHRoYXQncyB3aGF0IEkgYWxyZWFkeSBkaWQgaGVyZSBpbiB0aGlzIHBh
dGNoLiBObz8KPj4+Cj4+PiBObyAtIHlvdSd2ZSByZXRhaW5lZCBhIHNoYXJlZCBfcGFnZV97LHVu
fWxvY2soKSwgd2hlcmVhcyBteQo+Pj4gc3VnZ2VzdGlvbiB3YXMgdG8gaGF2ZSBhIGNvbXBsZXRl
bHkgaW5kZXBlbmRlbnQgcGFpciBvZgo+Pj4gZnVuY3Rpb25zIGluIG1lbV9zaGFyaW5nLmMuIFRo
ZSBvbmx5IHRoaW5nIG5lZWRlZCBieSBib3RoIFBWCj4+PiBhbmQgSFZNIHdvdWxkIHRoZW4gYmUg
dGhlIFBHVF9sb2NrZWQgZmxhZy4KPj4KPj4gQnV0IGl0IHdhc24ndCBvYnZpb3VzIHRvIG1lIGhv
dyB0aGUgaW1wbGVtZW50YXRpb25zIG9mIHRoZSBhY3R1YWwgbG9jawo+PiBmdW5jdGlvbiB3b3Vs
ZCBiZSBiZSBkaWZmZXJlbnQuICBBbmQgdGhlcmUncyBubyBwb2ludCBpbiBoYXZpbmcgdHdvCj4+
IGlkZW50aWNhbCBpbXBsZW1lbnRhdGlvbnM7IGluIGZhY3QsIGl0IHdvdWxkIGJlIGhhcm1mdWwu
Cj4gCj4gVGhlIG1haW4gZGlmZmVyZW5jZSB3b3VsZCBiZSB0aGUgb25lIHRoYXQgVGFtYXMgaXMg
YWZ0ZXIgLSBub3QKPiBkb2luZyB0aGUgY2hlY2tpbmcgdGhhdCB3ZSBkbyBmb3IgUFYuIFdoZXRo
ZXIgb3RoZXIgYml0cyBjb3VsZAo+IGJlIGRyb3BwZWQgZm9yIGEgbWVtLXNoYXJpbmcgc3BlY2lh
bCB2YXJpYW50IEkgZG9uJ3Qga25vdyAoeWV0KS4KClRoZSAiY2hlY2tpbmciIGJlaW5nIHRoYXQg
dGhlIHR5cGUgY291bnQgZG9lc24ndCBnbyB0byAwPwoKSXQncyBub3QganVzdCBwYWdlX2xvY2so
KSB0aGF0IGRvZXMgdGhhdCBjaGVja2luZzsgaXQncyBhbHNvCl9wdXRfcGFnZV90eXBlKCkuICBX
ZSBjYW4ndCByZWFsbHkgY2hhbmdlIG9uZSBidXQgbGVhdmUgdGhlIG90aGVyIGFsb25lLgoKVGhl
IGFwcHJvYWNoIEknbSBleHBsb3Jpbmcgbm93IGlzIHRvIGhhdmUgX3B1dF9wYWdlX3R5cGUoKSBv
bmx5IHNwaW4gb24KdGhlIGxhc3QgcGFnZSByZWZlcmVuY2UgaWYgdGhlIHR5cGUgPD0gUEdUX2w0
X3BhZ2VfdGFibGUgKGkuZS4sIGlmCl9wdXRfZmluYWxfcGFnZV90eXBlKCkgd291bGQgYmUgY2Fs
bGVkIGZvciB0aGlzIHR5cGUpLgoKVGhvdWdodHM/CgogLUdlb3JnZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
