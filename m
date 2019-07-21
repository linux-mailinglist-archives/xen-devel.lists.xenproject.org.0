Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF66F490
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jul 2019 20:10:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpGDB-0002hB-7Q; Sun, 21 Jul 2019 18:05:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V1PR=VS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpGD9-0002h6-Ld
 for xen-devel@lists.xenproject.org; Sun, 21 Jul 2019 18:05:27 +0000
X-Inumbo-ID: 1bb00074-abe2-11e9-b299-afe4336f2e9d
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1bb00074-abe2-11e9-b299-afe4336f2e9d;
 Sun, 21 Jul 2019 18:05:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F6BD344;
 Sun, 21 Jul 2019 11:05:22 -0700 (PDT)
Received: from [10.37.8.93] (unknown [10.37.8.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22E2B3F71A;
 Sun, 21 Jul 2019 11:05:18 -0700 (PDT)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <bf64e46ec03145da1887cfff4c632c86784792f6.1563325215.git-series.marmarek@invisiblethingslab.com>
 <49a30043-1dd1-0069-1e3b-c593542f425c@arm.com>
 <20190720212102.GC1250@mail-itl>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <29595834-4c39-b806-e54d-c73968dd65a9@arm.com>
Date: Sun, 21 Jul 2019 19:05:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190720212102.GC1250@mail-itl>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Simon Gaiser <simon@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzIwLzE5IDEwOjIxIFBNLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3Jv
dGU6Cj4gT24gU2F0LCBKdWwgMjAsIDIwMTkgYXQgMDU6NDg6NTZQTSArMDEwMCwgSnVsaWVuIEdy
YWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gU29ycnkgZm9yIGp1bXBpbmcgbGF0ZSBpbiB0aGUgZGlz
Y3Vzc2lvbi4KPj4KPj4gT24gNy8xNy8xOSAyOjAwIEFNLCBNYXJlayBNYXJjenlrb3dza2ktR8Oz
cmVja2kgd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2lycS5oIGIveGVu
L2luY2x1ZGUveGVuL2lycS5oCj4+PiBpbmRleCA1ODZiNzgzLi5jN2E2YTgzIDEwMDY0NAo+Pj4g
LS0tIGEveGVuL2luY2x1ZGUveGVuL2lycS5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaXJx
LmgKPj4+IEBAIC05MSw2ICs5MSw3IEBAIHR5cGVkZWYgc3RydWN0IGlycV9kZXNjIHsKPj4+ICAg
ICAgICBzcGlubG9ja190IGxvY2s7Cj4+PiAgICAgICAgc3RydWN0IGFyY2hfaXJxX2Rlc2MgYXJj
aDsKPj4+ICAgICAgICBjcHVtYXNrX3Zhcl90IGFmZmluaXR5Owo+Pj4gKyAgICBkb21pZF90IGNy
ZWF0b3JfZG9taWQ7IC8qIHdlYWsgcmVmZXJlbmNlIHRvIGRvbWFpbiBoYW5kbGluZyB0aGlzIElS
USAqLwo+Pgo+PiBUaGlzIHg4NiBvbmx5LiBDYW4gdGhpcyBiZSBtb3ZlZCBpbiBhcmNoX2lycV9k
ZXNjIHRvIGF2b2lkIGluY3JlYXNpbmcgdGhlCj4+IHN0cnVjdHVyZSBvbiBBcm0/Cj4gCj4gSG93
IChpZiBhdCBhbGwpIFBDSSBwYXNzdGhyb3VnaCBpcyBzdXBwb3J0ZWQgb24gQVJNPyBJcyBxZW11
IGludm9sdmVkPwo+IElmIHNvLCBhbmQgaWYgdGhhdCBxZW11IHdvdWxkIGJlIGlzb2xhdGVkIGlu
IHN0dWJkb21haW4sIEkgdGhpbmsgQVJNCj4gd291bGQgbmVlZCBhIHNpbWlsYXIgZmVhdHVyZS4g
SWYgaXQgbm90IHRoZSBjYXNlIHJpZ2h0IG5vdywgYnV0IGl0IGlzCj4gcGxhbm5lZCwgZG8geW91
IHRoaW5rIGl0J3Mgd29ydGggbW92aW5nIGl0IHRvIGFyY2hfaXJxX2Rlc2MgYW5kIHBvc3NpYmx5
Cj4gbW92ZSBiYWNrIGxhdGVyPwoKUENJIHBhc3N0aHJvdWdoIGlzIG5vdCB5ZXQgc3VwcG9ydGVk
IG9uIEFybS4gSG93ZXZlciwgSSB3b3VsZCBub3QgZXhwZWN0IApRRU1VIHRvIGJlIGludm9sdmVk
IGF0IGFsbCBmb3IgQXJtLgoKSW4gYW55IGNhc2UsIEkgd291bGQgc3RpbGwgcHJlZmVyIHRvIGtl
ZXAgZmllbGQgaW4gYXJjaF9pcnFfZGVzYyB1bnRpbCAKd2Ugc2VlIGFueSB1c2FnZSBvbiBBcm0u
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
