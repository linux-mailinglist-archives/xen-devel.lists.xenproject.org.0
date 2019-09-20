Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44942B8DC9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 11:29:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBFBu-0001AW-27; Fri, 20 Sep 2019 09:27:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WsuA=XP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iBFBs-0001AP-9S
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 09:27:00 +0000
X-Inumbo-ID: cb4cae58-db88-11e9-9686-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cb4cae58-db88-11e9-9686-12813bfff9fa;
 Fri, 20 Sep 2019 09:26:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB479337;
 Fri, 20 Sep 2019 02:26:57 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E20C3F575;
 Fri, 20 Sep 2019 02:26:57 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190917132125.13033-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1909191542330.19418@sstabellini-ThinkPad-T480s>
 <4d91648c-5039-a93d-e694-453c8c51b93d@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c8456c80-680a-31ab-d28a-6cf4128d2455@arm.com>
Date: Fri, 20 Sep 2019 10:26:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4d91648c-5039-a93d-e694-453c8c51b93d@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm32: setup: Give a xenheap page to
 the boot allocator
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDIwLzA5LzIwMTkgMDk6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9u
IDIwLjA5LjIwMTkgMDA6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gVHVlLCAx
NyBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gQEAgLTY2NSw2ICs2NjYsMTEgQEAg
c3RhdGljIHZvaWQgX19pbml0IHNldHVwX21tKHZvaWQpCj4+PiAgIAo+Pj4gICAgICAgc2V0dXBf
eGVuaGVhcF9tYXBwaW5ncygoZSA+PiBQQUdFX1NISUZUKSAtIHhlbmhlYXBfcGFnZXMsIHhlbmhl
YXBfcGFnZXMpOwo+Pj4gICAKPj4+ICsgICAgLyogV2UgbmVlZCBhIHNpbmdsZSBtYXBwZWQgcGFn
ZSBmb3IgcG9wdWxhdGluZyBib290bWVtX3JlZ2lvbl9saXN0LiAqLwo+Pj4gKyAgICBib290X21m
bl9zdGFydCA9IG1mbl9hZGQoeGVuaGVhcF9tZm5fZW5kLCAtMSk7Cj4+PiArICAgIGJvb3RfbWZu
X2VuZCA9IHhlbmhlYXBfbWZuX2VuZDsKPj4+ICsgICAgaW5pdF9ib290X3BhZ2VzKG1mbl90b19t
YWRkcihib290X21mbl9zdGFydCksIG1mbl90b19tYWRkcihib290X21mbl9lbmQpKTsKPj4+ICsK
Pj4+ICAgICAgIC8qIEFkZCBub24teGVuaGVhcCBtZW1vcnkgKi8KPj4+ICAgICAgIGZvciAoIGkg
PSAwOyBpIDwgYm9vdGluZm8ubWVtLm5yX2JhbmtzOyBpKysgKQo+Pj4gICAgICAgewo+Pj4gQEAg
LTcxMCw3ICs3MTYsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odm9pZCkKPj4+ICAg
Cj4+PiAgICAgICAvKiBBZGQgeGVuaGVhcCBtZW1vcnkgdGhhdCB3YXMgbm90IGFscmVhZHkgYWRk
ZWQgdG8gdGhlIGJvb3QgYWxsb2NhdG9yLiAqLwo+Pj4gICAgICAgaW5pdF94ZW5oZWFwX3BhZ2Vz
KG1mbl90b19tYWRkcih4ZW5oZWFwX21mbl9zdGFydCksCj4+PiAtICAgICAgICAgICAgICAgICAg
ICAgICBtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fZW5kKSk7Cj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICBtZm5fdG9fbWFkZHIoYm9vdF9tZm5fZW5kKSk7Cj4+Cj4+IEkgY2FuIHNlZSB3aGF0
IHlvdSBhcmUgdHJ5aW5nIHRvIGRvIHdpdGggdGhpcyBwYXRjaCBhbmQgaXQgbG9va3MgbGlrZQo+
PiB0aGUgcmlnaHQgZml4IGF0IHRoZSBtb21lbnQuIEhvd2V2ZXIsIHNob3VsZG4ndCB0aGlzIGxh
c3QgY2hhbmdlOgo+Pgo+PiAgICBtZm5fdG9fbWFkZHIoYm9vdF9tZm5fc3RhcnQpCgpEb2gsIHll
cyBpdCBzaG91bGQuIEkgd2lsbCB1cGRhdGUgdGhlIHBhdGNoIGFuZCByZXNlbmQgaXQuCgo+IAo+
IE9oLCBpbmRlZWQgLSB3aGVuIGRvaW5nIHRoZSByZXZpZXcgeWVzdGVyZGF5IEkgdGhvdWdodCBJ
IGhhZAo+IGNhcmVmdWxseSBjb21wYXJlZCB3aXRoIGhvdyB0aGluZ3MgbG9va2VkIHByaW9yIHRv
IHRoZSBjaGFuZ2UKPiBuZWVkaW5nIGZpeGluZyB1cCBub3csIHlldCBJIGRpZG4ndCBzcG90IHRo
aXMgKG90aGVyd2lzZQo+IG9idmlvdXMpIGRpZmZlcmVuY2UgdG8gdGhlIG9yaWdpbmFsIGNvZGUu
Cj4gCj4gSmFuCj4gCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
