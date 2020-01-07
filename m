Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63586132762
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 14:15:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioogB-00040g-Lq; Tue, 07 Jan 2020 13:13:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioogA-00040b-PO
 for xen-devel@lists.xen.org; Tue, 07 Jan 2020 13:13:50 +0000
X-Inumbo-ID: 86500760-314f-11ea-bf56-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86500760-314f-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 13:13:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BB93EB1D6;
 Tue,  7 Jan 2020 13:13:40 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191217154625.31561-1-sergey.dyasli@citrix.com>
 <a5e3c4b7-40f4-017b-1154-d75f92075597@suse.com>
 <65aecab1-a1b0-f02e-be92-cda3cd37b9e5@citrix.com>
 <e997ff3e-4260-c872-0166-3885ce1a4ee1@suse.com>
 <2e8bc256-6e7f-ff3d-0917-c744a92cc6ac@citrix.com>
 <d41c1d28-d582-089a-3c8e-9e7d65edc201@citrix.com>
 <16a4056b-c74a-4fdf-499f-755120edf2d5@citrix.com>
 <8593adbb-cc67-fca1-30e6-555fa9adcb86@suse.com>
 <54d496c3-7a93-af37-d152-1dc31367e1f7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76ef9a92-10f5-9ae7-afd4-bef86d60a655@suse.com>
Date: Tue, 7 Jan 2020 14:13:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <54d496c3-7a93-af37-d152-1dc31367e1f7@citrix.com>
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

T24gMDcuMDEuMjAyMCAxMjowMiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAwNi8wMS8yMDIw
IDE0OjQwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDYuMDEuMjAyMCAxNTozNSwgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+IE9uIDA2LzAxLzIwMjAgMTE6MjgsIEdlb3JnZSBEdW5sYXAgd3Jv
dGU6Cj4+Pj4gT24gMTIvMTkvMTkgMTE6MTUgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+
IE9uIDE5LzEyLzIwMTkgMTE6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4gICAgIFhF
TlZFUl9jaGFuZ2VzZXQKPj4+Pj4+Pj4+ICAgICBYRU5WRVJfY29tbWFuZGxpbmUKPj4+Pj4+Pj4+
ICAgICBYRU5WRVJfYnVpbGRfaWQKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBSZXR1cm4gYSBtb3JlIGN1
c3RvbWVyIGZyaWVuZGx5IGVtcHR5IHN0cmluZyBpbnN0ZWFkIG9mICI8ZGVuaWVkPiIKPj4+Pj4+
Pj4+IHdoaWNoIHdvdWxkIGJlIHNob3duIGluIHRvb2xzIGxpa2UgZG1pZGVjb2RlLj4KPj4+Pj4+
Pj4gSSB0aGluayAiPGRlbmllZD4iIGlzIHF1aXRlIGZpbmUgZm9yIG1hbnkgb2YgdGhlIG9yaWdp
bmFsIHB1cnBvc2VzLgo+Pj4+Pj4+PiBNYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gZmlsdGVy
IGZvciB0aGlzIHdoZW4gcG9wdWxhdGluZyBndWVzdAo+Pj4+Pj4+PiBETUkgdGFibGVzPwo+Pj4+
Pj4+IEkgZG9uJ3Qga25vdyBob3cgRE1JIHRhYmxlcyBhcmUgcG9wdWxhdGVkLCBidXQgbm90aGlu
ZyBzdG9wcyBhIGd1ZXN0Cj4+Pj4+Pj4gZnJvbSB1c2luZyB0aGVzZSBoeXBlcmNhbGxzIGRpcmVj
dGx5Lgo+Pj4+Pj4gQW5kIHRoaXMgaXMgcHJlY2lzZWx5IHRoZSBjYXNlIHdoZXJlIEkgdGhpbmsg
IjxkZW5pZWQ+IiBpcyBiZXR0ZXIKPj4+Pj4+IHRoYW4gYW4gZW1wdHkgc3RyaW5nLgo+Pj4+Pgo+
Pj4+PiAiPGRlbmllZD4iIHdhcyBhIHRlcnJpYmxlIGNob2ljZSBiYWNrIHdoZW4gaXQgd2FzIGlu
dHJvZHVjZWQsIGFuZCBpdHMKPj4+Pj4gc3RpbGwgYSB0ZXJyaWJsZSBjaG9pY2UgdG9kYXkuCj4+
Pj4+Cj4+Pj4+IFRoZXNlIGFyZSBBU0NJSSBzdHJpbmcgZmllbGRzLCBhbmQgdGhlIGVtcHR5IHN0
cmluZyBpcyBhIHBlcmZlY3RseSBnb29kCj4+Pj4+IHN0cmluZy4gIE5vdGhpbmcgaXMgZ29pbmcg
dG8gYnJlYWssIGJlY2F1c2UgaXQgd291bGQgaGF2ZSBicm9rZW4gdGhlCj4+Pj4+IGZpcnN0IHRp
bWUgYXJvdW5kLgo+Pj4+Pgo+Pj4+PiBUaGUgZW5kIHJlc3VsdCB3aXRob3V0IGRlbmllZCBzcHJh
eWVkIGFsbCBvdmVyIHRoaXMgaW50ZXJmYWNlIGlzIG11Y2gKPj4+Pj4gY2xlYW5lciBvdmVyYWxs
Lgo+Pj4+Cj4+Pj4gVW5mb3J0dW5hdGVseSB0aGlzIG1haWwgZG9lc24ndCBjb250YWluIGFueSBm
YWN0cyBvciBhcmd1bWVudHMsIGp1c3QKPj4+PiB1bnN1YnN0YW50aWF0ZWQgdmFsdWUganVkZ2Vt
ZW50cy4gIFdoYXQncyBzbyB0ZXJyaWJsZSBhYm91dCAiPGRlbmllZD4iCj4+Pj4gLS0gd2hhdCBi
YWQgZWZmZWN0IGRvZXMgaXQgaGF2ZT8gIFdoeSBpcyAiIiBiZXR0ZXIgLyBjbGVhbmVyPwo+Pj4K
Pj4+IEl0IGNhbiBiZSBleHBsYWluZWQgd2l0aCBhIHBpY3R1cmUgKGF0dGFjaGVkKSA7KQo+Pgo+
PiBCdXQgdGhhdCdzIHNvbWV0aGluZyBiZXR0ZXIgYWRkcmVzc2VkIGF0IG9yIGNsb3NlIHRvIHRo
ZSBwcmVzZW50YXRpb24KPj4gbGF5ZXIsIG5vdCBkZWVwIGRvd24gaW4gWGVuLgo+IAo+IEkgYWdy
ZWUgd2l0aCB0aGF0LiBBbmQgbG9va3MgbGlrZSB0aGUgZm9sbG93aW5nIGRpZmYgZG9lcyB0aGUg
dHJpY2s6Cj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9zbWJpb3Mu
YyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9zbWJpb3MuYwo+IGluZGV4IDk3YTA1NGU5ZTMu
LmI0ZDcyYzM3NWYgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3NtYmlv
cy5jCj4gKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3NtYmlvcy5jCj4gQEAgLTI3NSw2
ICsyNzUsOCBAQCBodm1fd3JpdGVfc21iaW9zX3RhYmxlcygKPiAgICAgIHhlbl9taW5vcl92ZXJz
aW9uID0gKHVpbnQxNl90KSB4ZW5fdmVyc2lvbjsKPiAKPiAgICAgIGh5cGVyY2FsbF94ZW5fdmVy
c2lvbihYRU5WRVJfZXh0cmF2ZXJzaW9uLCB4ZW5fZXh0cmFfdmVyc2lvbik7Cj4gKyAgICBpZiAo
IHN0cmNtcCh4ZW5fZXh0cmFfdmVyc2lvbiwgIjxkZW5pZWQ+IikgPT0gMCApCj4gKyAgICAgICAg
bWVtc2V0KHhlbl9leHRyYV92ZXJzaW9uLCAwLCBzaXplb2YoeGVuX2V4dHJhX3ZlcnNpb24pKTsK
PiAKPiAgICAgIC8qIGJ1aWxkIHVwIGh1bWFuLXJlYWRhYmxlIFhlbiB2ZXJzaW9uIHN0cmluZyAq
Lwo+ICAgICAgcCA9IHhlbl92ZXJzaW9uX3N0cjsKCldoZW4geW91IHN1Ym1pdCB0aGlzIGFzIGEg
cHJvcGVyIHBhdGNoLCBmZWVsIGZyZWUgdG8gYWRkIG15IGFjawpyaWdodCBhd2F5IChhcyBsb25n
IHlvdSBnaXZlIGl0IGEgbm9uLWVtcHR5IGFuZCBoYWxmIHdheSB1c2VmdWwKZGVzY3JpcHRpb24p
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
