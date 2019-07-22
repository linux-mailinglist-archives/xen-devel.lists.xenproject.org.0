Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3286FBDA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 11:09:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpUGt-0005Zc-1r; Mon, 22 Jul 2019 09:06:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpUGr-0005ZX-GL
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 09:06:13 +0000
X-Inumbo-ID: f25d6616-ac5f-11e9-945e-d393a41252b6
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f25d6616-ac5f-11e9-945e-d393a41252b6;
 Mon, 22 Jul 2019 09:06:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7C15344;
 Mon, 22 Jul 2019 02:06:09 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E60803F694;
 Mon, 22 Jul 2019 02:06:07 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <bf64e46ec03145da1887cfff4c632c86784792f6.1563325215.git-series.marmarek@invisiblethingslab.com>
 <49a30043-1dd1-0069-1e3b-c593542f425c@arm.com>
 <20190720212102.GC1250@mail-itl>
 <29595834-4c39-b806-e54d-c73968dd65a9@arm.com>
 <20190722084533.a2tq7qzpunepiguv@Air-de-Roger>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a1175232-a742-8a09-cda4-922009440257@arm.com>
Date: Mon, 22 Jul 2019 10:06:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190722084533.a2tq7qzpunepiguv@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Brian Woods <brian.woods@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9nZXIsCgpPbiAyMi8wNy8yMDE5IDA5OjQ1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+
IE9uIFN1biwgSnVsIDIxLCAyMDE5IGF0IDA3OjA1OjE2UE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4gSGksCj4+Cj4+IE9uIDcvMjAvMTkgMTA6MjEgUE0sIE1hcmVrIE1hcmN6eWtvd3Nr
aS1Hw7NyZWNraSB3cm90ZToKPj4+IE9uIFNhdCwgSnVsIDIwLCAyMDE5IGF0IDA1OjQ4OjU2UE0g
KzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+IFNvcnJ5IGZvciBq
dW1waW5nIGxhdGUgaW4gdGhlIGRpc2N1c3Npb24uCj4+Pj4KPj4+PiBPbiA3LzE3LzE5IDI6MDAg
QU0sIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPj4+Pj4gZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL3hlbi9pcnEuaCBiL3hlbi9pbmNsdWRlL3hlbi9pcnEuaAo+Pj4+PiBpbmRl
eCA1ODZiNzgzLi5jN2E2YTgzIDEwMDY0NAo+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vaXJx
LmgKPj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lycS5oCj4+Pj4+IEBAIC05MSw2ICs5MSw3
IEBAIHR5cGVkZWYgc3RydWN0IGlycV9kZXNjIHsKPj4+Pj4gICAgICAgICBzcGlubG9ja190IGxv
Y2s7Cj4+Pj4+ICAgICAgICAgc3RydWN0IGFyY2hfaXJxX2Rlc2MgYXJjaDsKPj4+Pj4gICAgICAg
ICBjcHVtYXNrX3Zhcl90IGFmZmluaXR5Owo+Pj4+PiArICAgIGRvbWlkX3QgY3JlYXRvcl9kb21p
ZDsgLyogd2VhayByZWZlcmVuY2UgdG8gZG9tYWluIGhhbmRsaW5nIHRoaXMgSVJRICovCj4+Pj4K
Pj4+PiBUaGlzIHg4NiBvbmx5LiBDYW4gdGhpcyBiZSBtb3ZlZCBpbiBhcmNoX2lycV9kZXNjIHRv
IGF2b2lkIGluY3JlYXNpbmcgdGhlCj4+Pj4gc3RydWN0dXJlIG9uIEFybT8KPj4+Cj4+PiBIb3cg
KGlmIGF0IGFsbCkgUENJIHBhc3N0aHJvdWdoIGlzIHN1cHBvcnRlZCBvbiBBUk0/IElzIHFlbXUg
aW52b2x2ZWQ/Cj4+PiBJZiBzbywgYW5kIGlmIHRoYXQgcWVtdSB3b3VsZCBiZSBpc29sYXRlZCBp
biBzdHViZG9tYWluLCBJIHRoaW5rIEFSTQo+Pj4gd291bGQgbmVlZCBhIHNpbWlsYXIgZmVhdHVy
ZS4gSWYgaXQgbm90IHRoZSBjYXNlIHJpZ2h0IG5vdywgYnV0IGl0IGlzCj4+PiBwbGFubmVkLCBk
byB5b3UgdGhpbmsgaXQncyB3b3J0aCBtb3ZpbmcgaXQgdG8gYXJjaF9pcnFfZGVzYyBhbmQgcG9z
c2libHkKPj4+IG1vdmUgYmFjayBsYXRlcj8KPj4KPj4gUENJIHBhc3N0aHJvdWdoIGlzIG5vdCB5
ZXQgc3VwcG9ydGVkIG9uIEFybS4gSG93ZXZlciwgSSB3b3VsZCBub3QgZXhwZWN0Cj4+IFFFTVUg
dG8gYmUgaW52b2x2ZWQgYXQgYWxsIGZvciBBcm0uCj4+Cj4+IEluIGFueSBjYXNlLCBJIHdvdWxk
IHN0aWxsIHByZWZlciB0byBrZWVwIGZpZWxkIGluIGFyY2hfaXJxX2Rlc2MgdW50aWwgd2UKPj4g
c2VlIGFueSB1c2FnZSBvbiBBcm0uCj4gCj4gSSdtIGZpbmUgd2l0aCBwdXR0aW5nIGl0IGluc2lk
ZSBvZiB0aGUgYXJjaCBzdHJ1Y3QsIGJ1dCB0aGVyZSdzCj4gbm90aGluZyB4ODYgc3BlY2lmaWMg
YWJvdXQgdGhpcyBmaWVsZC4KCkluIHRoZW9yeSB5ZXMsIGluIHByYWN0aWNlIHRoaXMgaXMgb25s
eSB1c2VkIGJ5IHg4NiB0b2RheS4gSSBkb24ndCB3YW50IHRvIAppbmNyZWFzZSB0aGUgc2l6ZSBv
ZiBpcnFfZGVzYyBmb3IgdW51c2VkIGZpZWxkLgoKV2UgY2FuIG1vdmUgYmVjYXVzZSB0aGUgZmll
bGQgaW4gaXJxX2Rlc2MgaWYgdGhlcmUgYXJlIGEgbmVlZCBvbiBBcm0uCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
