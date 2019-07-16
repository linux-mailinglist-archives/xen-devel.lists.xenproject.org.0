Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563316A603
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 11:58:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnKBg-0004p9-HB; Tue, 16 Jul 2019 09:55:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=btdh=VN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hnKBf-0004p4-0n
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 09:55:55 +0000
X-Inumbo-ID: e62aaaba-a7af-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e62aaaba-a7af-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 09:55:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49F932B;
 Tue, 16 Jul 2019 02:55:53 -0700 (PDT)
Received: from [10.37.10.107] (unknown [10.37.10.107])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37BA03F71A;
 Tue, 16 Jul 2019 02:55:51 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-6-julien.grall@arm.com> <87v9w3rv8f.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a26c3000-5c87-2666-2a9e-1b7a3b1fde05@arm.com>
Date: Tue, 16 Jul 2019 10:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87v9w3rv8f.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 05/17] xen/arm64: head: Introduce print_reg
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "andre.przywara@arm.com" <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xNS8xOSA3OjQ2IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBIaSBKdWxpZW4s
CgpIaSwKCj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPiAKPj4gQXQgdGhlIG1vbWVudCwgdGhlIHVz
ZXIgc2hvdWxkIHNhdmUgeDMwL2xyIGlmIGl0IGNhcmVzIGFib3V0IGl0Lgo+Pgo+PiBGb2xsb3ct
dXAgcGF0Y2hlcyB3aWxsIGludHJvZHVjZSBtb3JlIHVzZSBvZiBwdXRuIGluIHBsYWNlIHdoZXJl
IGxyCj4+IHNob3VsZCBiZSBwcmVzZXJ2ZWQuCj4+Cj4+IEZ1cnRoZXJtb3JlLCBhbnkgdXNlciBv
ZiBwdXRuIHNob3VsZCBhbHNvIG1vdmUgdGhlIHZhbHVlIHRvIHJlZ2lzdGVyIHgwCj4+IGlmIGl0
IHdhcyBzdG9yZWQgaW4gYSBkaWZmZXJlbnQgcmVnaXN0ZXIuCj4+Cj4+IEZvciBjb252ZW5pZW5j
ZSwgYSBuZXcgbWFjcm8gaXMgaW50cm9kdWNlZCB0byBwcmludCBhIGdpdmVuIHJlZ2lzdGVyLgo+
PiBUaGUgbWFjcm8gd2lsbCB0YWtlIGNhcmUgZm9yIHVzIHRvIG1vdmUgdGhlIHZhbHVlIHRvIHgw
IGFuZCBhbHNvCj4+IHByZXNlcnZlIGxyLgo+Pgo+PiBMYXN0bHkgdGhlIG5ldyBtYWNybyBpcyB1
c2VkIHRvIHJlcGxhY2UgYWxsIHRoZSBjYWxsc2l0ZSBvZiBwdXRuLiBUaGlzCj4+IHdpbGwgc2lt
cGxpZnkgcmV3b3JrL3JldmlldyBsYXRlciBvbi4KPj4KPj4gTm90ZSB0aGF0IEN1cnJlbnRFTCBp
cyBub3cgc3RvcmVkIGluIHg1IGluc3RlYWQgb2YgeDQgYmVjYXVzZSB0aGUgbGF0dGVyCj4+IHdp
bGwgYmUgY2xvYmJlcmVkIGJ5IHRoZSBtYWNybyBwcmludF9yZWcuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IC0tLQo+PiAgIHhlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMKPj4gaW5kZXggODRlMjY1ODJjNC4uOTE0MmI0YTc3NCAxMDA2NDQKPj4gLS0t
IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TCj4+IEBAIC05MCw4ICs5MCwyNSBAQAo+PiAgICAgICAgICAgYmwgICAgcHV0cyAgICA7
ICAgICBcCj4+ICAgICAgICAgICBtb3YgICBsciwgeDMgIDsgICAgIFwKPj4gICAgICAgICAgIFJP
REFUQV9TVFIoOTgsIF9zKQo+PiArCj4+ICsvKgo+PiArICogTWFjcm8gdG8gcHJpbnQgdGhlIHZh
bHVlIG9mIHJlZ2lzdGVyIFx4Ygo+PiArICoKPj4gKyAqIENsb2JiZXJzIHgwIC0geDQKPj4gKyAq
Lwo+IAo+IERlc3BpdGUgaXRzIG5hbWUsIHRoaXMgbWFjcm8gY2FuJ3QgcHJpbnQgeDQuIEkgd291
bGQgcmVjb21tZW5kIGFkZGluZyBhdAo+IGxlYXN0IGNvbW1lbnQgYWJvdXQgdGhpcy4gU3RhdGlj
IGFzc2VydGlvbiB3b3VsZCBiZSBldmVuIGJldHRlciwgYnV0Cj4gbG9va3MgbGlrZSB3ZSBkb24n
dCBoYXZlIHRoZW0gZm9yIGFzbSBjb2RlLgoKSSBoYXZlIGEgbmV3IHZlcnNpb24gb2YgdGhlIGZ1
bmN0aW9uIGFsbG93aW5nIHRvIHByaW50IHg0LiBJdCBpcyAKYmFzaWNhbGx5IGp1c3Qgc3dhcHBp
bmcgIm1vdiB4NCwgbHIiIHdpdGggIm1vdiB4MCwgXHhiIi4KCj4gCj4+ICsubWFjcm8gcHJpbnRf
cmVnIHhiCj4+ICsgICAgICAgIG1vdiAgIHg0LCBscgo+PiArICAgICAgICBtb3YgICB4MCwgXHhi
Cj4+ICsgICAgICAgIGJsICAgIHB1dG4KPj4gKyAgICAgICAgbW92ICAgbHIsIHg0Cj4+ICsuZW5k
bQo+PiArCj4+ICAgI2Vsc2UgLyogQ09ORklHX0VBUkxZX1BSSU5USyAqLwo+PiAgICNkZWZpbmUg
UFJJTlQocykKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
