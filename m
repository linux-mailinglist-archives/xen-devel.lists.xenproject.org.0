Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 897457A54A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:57:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOqD-000225-2r; Tue, 30 Jul 2019 09:54:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WuyF=V3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsOqC-00021z-8p
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:54:44 +0000
X-Inumbo-ID: 0bc5c430-b2b0-11e9-bfd4-53c187a8fb55
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0bc5c430-b2b0-11e9-bfd4-53c187a8fb55;
 Tue, 30 Jul 2019 09:54:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E336344;
 Tue, 30 Jul 2019 02:54:39 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B00593F575;
 Tue, 30 Jul 2019 02:54:37 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190730065637.3802-1-lukasz.hawrylko@intel.com>
 <5e5c945a-6bdb-2776-e2db-b11bbeb74bf5@suse.com>
 <d216b609-353d-e4c7-fdea-e2e63b175bb8@arm.com>
 <6b786dc3-f6d0-8536-0291-4f0de7f673b8@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3dc11cbc-97a1-dae7-eba0-1bb0f8151244@arm.com>
Date: Tue, 30 Jul 2019 10:54:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6b786dc3-f6d0-8536-0291-4f0de7f673b8@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Intel TXT: add reviewer,
 move to Odd Fixes state
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Lukasz Hawrylko <lukasz.hawrylko@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMzAvMDcvMjAxOSAxMDowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAu
MDcuMjAxOSAxMDo1NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiA3LzMwLzE5IDk6MjkgQU0s
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMzAuMDcuMjAxOSAwODo1NiwgTHVrYXN6IEhhd3J5
bGtvIHdyb3RlOgo+Pj4+IFN1cHBvcnQgZm9yIEludGVsIFRYVCBoYXMgb3JwaGFuZWQgc3RhdHVz
IHJpZ2h0IG5vdyBiZWNhdXNlCj4+Pj4gbm8gYWN0aXZlIG1haW50YWludGVyIGlzIGxpc3RlZC4g
QWRkaW5nIG15c2VsZiBhcyByZXZpZXdlcgo+Pj4+IGFuZCBtb3ZpbmcgaXQgdG8gT2RkIEZpeGVz
IHN0YXRlLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTHVrYXN6IEhhd3J5bGtvIDxsdWthc3ou
aGF3cnlsa29AaW50ZWwuY29tPgo+Pj4+IC0tLQo+Pj4+ICDCoMKgIE1BSU5UQUlORVJTIHwgMyAr
Ky0KPj4+PiAgwqDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+Pj4+
IGluZGV4IDg5YTAxYjcxMGIuLmNhMzAwZTg3YzggMTAwNjQ0Cj4+Pj4gLS0tIGEvTUFJTlRBSU5F
UlMKPj4+PiArKysgYi9NQUlOVEFJTkVSUwo+Pj4+IEBAIC0yNDAsNyArMjQwLDggQEAgUzrCoMKg
wqAgTWFpbnRhaW5lZAo+Pj4+ICAgRjrCoMKgwqAgdG9vbHMvZ29sYW5nCj4+Pj4gICBJTlRFTChS
KSBUUlVTVEVEIEVYRUNVVElPTiBURUNITk9MT0dZIChUWFQpCj4+Pj4gLVM6wqDCoMKgIE9ycGhh
bmVkCj4+Pj4gK1I6wqDCoMKgIEx1a2FzeiBIYXdyeWxrbyA8bHVrYXN6Lmhhd3J5bGtvQGludGVs
LmNvbT4KPj4+PiArUzrCoMKgwqAgT2RkIEZpeGVzCj4+Pgo+Pj4gSSBndWVzcyB3ZSBzaG91bGQg
Z2l2ZSBpdCBhIGZldyBkYXlzIGZvciBvYmplY3Rpb25zIHRvIGJlIHJhaXNlZAo+Pj4gYWdhaW5z
dCB0aGlzIHNsaWdodGx5IGluY29uc2lzdGVudCBzdGF0ZSwgYnV0IEkgdGhpbmsgdGhhdCdzIHRo
ZQo+Pj4gYmVzdCB3YXkgdG8gZXhwcmVzcyB0aGUgY3VycmVudCBzdGF0ZSBvZiB0aGluZ3MgKGhl
bmNlIG15Cj4+PiBzdWdnZXN0aW9uIHRvIHRoaXMgZWZmZWN0KS4gSWYgbm8gb2JqZWN0aW9ucyB0
dXJuIHVwLCBJJ3ZlIHF1ZXVlZAo+Pj4gdGhpcyBvbnRvIG15IHRvLWJlLWNvbW1pdHRlZCBsaXN0
Lgo+Pgo+PiBJIGhhdmUgc29tZSBvYmplY3Rpb25zIHJlZ2FyZGluZyB0aGUgcHJvY2VzcyBpdHNl
bGYuLi4gT24gdGhlIGZpcnN0Cj4+IHZlcnNpb24gb2YgdGhpcyBwYXRjaCwgaXQgd2FzIHBvaW50
ZWQgb3V0IHRoYXQgdGhlIGUtbWFpbCBzaG91bGRuJ3QKPj4gYmUgc2VudCB3aXRoIGRpc2NsYWlt
ZXIuIFRoaXMgaXMgbm93IHRoZSB0aGlyZCB2ZXJzaW9uIGFuZCB0aGUKPj4gZGlzY2xhaW1lciBp
cyBzdGlsbCBwcmVzZW50Lgo+IAo+IE9rYXksIEkgbXVzdCBoYXZlIG1pc3NlZCBib3RoIGVhcmxp
ZXIgcmVxdWVzdHMgdG8gdGhpcyBlZmZlY3QuIEkndmUKPiBnb25lIGJhY2sgdG8gdGhlIGxpc3Qg
YXJjaGl2ZXMgdGhvdWdoLCBhbmQgSSBjb3VsZG4ndCBmaW5kIGFueSBzdWNoCj4gcmVxdWVzdCBl
aXRoZXIgZnJvbSBKdWx5IG9yIEp1bmUuIFRoZXJlZm9yZSAuLi4KClRoZSBmaXJzdCB2ZXJzaW9u
IHdhcyBzZW50IGZyb20gTWFyY2ggWzFdLgoKPiAKPj4gVGVjaG5pY2FsbHksIG5vIHBhdGNoIHNo
b3VsZCBiZSBhcHBsaWVkIHdoZW4gdGhlcmUgYXJlIGEgZGlzY2xhaW1lci4KPiAKPiAuLi4gSSdk
IGFsc28gbGlrZSB0byBhc2sgZm9yIHRoZSBiYWNrZ3JvdW5kIG9mIHRoaXMuIEl0IHdvdWxkIG5l
dmVyCj4gaGF2ZSBvY2N1cnJlZCB0byBtZSB0aGF0IEkgc2hvdWxkIHBheSBhdHRlbnRpb24gdG8g
cG9zc2libGUKPiBkaXNjbGFpbWVycyBvciBhbGlrZSBvbiBwYXRjaCBzdWJtaXNzaW9ucy4KClRo
ZSBkaXNjbGFpbWVyIHRlbGwgeW91IHRoaXMgcGF0Y2ggbWF5IGNvbnRhaW4gY29uZmlkZW50aWFs
IGluZm9ybWF0aW9uIGFuZCB5b3UgCmFyZSBub3QgYWxsb3dlZCB0byBkaXN0cmlidXRlIGl0Li4u
IFdoaWxlIEkgYWdyZWUgdGhpcyBtYWtlcyBubyBzZW5zZSBmb3IgcHVibGljIApNTCwgd2Ugc3Rp
bGwgaGF2ZSB0byBzdGF5IG9uIHRoZSBzYWZlIHNpZGUuIEhvdyBkbyB5b3Uga25vdyB0aGlzIHdh
cyBub3Qgc2VudCBieSAKbWlzdGFrZT8gTm90ZSB0aGF0IHRoaXMgcXVlc3Rpb24gbWFrZXMgbGl0
dGxlIHNlbnNlIG9uIE1BSU5UQUlORVJTIGZpbGUuLi4KCkluIGdlbmVyYWwsIEkgYW0gZm9sbG93
aW5nIEdyZWcgS0ggYWR2aWNlIGhlcmUgWzJdIGFuZCByZWZyYWluIHRvIGFuc3dlciBhbnkgCmUt
bWFpbCB3aXRoIGRpc2NsYWltZXIuIEkgd291bGQgYWN0dWFsbHkgYWR2b2NhdGUgeGVuLWRldmVs
IHRvIGNvbXBsZXRlbHkgYmxvY2sgCnRob3NlIGUtbWFpbHMuCgpDaGVlcnMsCgpbMV0gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTAzL21z
ZzAwNzI5Lmh0bWwKWzJdIGh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9Zk1lSDd3cU93
WEEmZmVhdHVyZT15b3V0dS5iZSZ0PTEzbTUzcwoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
