Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC24572CD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 22:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgEhL-0008CV-Dq; Wed, 26 Jun 2019 20:39:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hgEhJ-0008CQ-PT
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 20:39:17 +0000
X-Inumbo-ID: 75e5f042-9852-11e9-9a86-7b036de4209b
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 75e5f042-9852-11e9-9a86-7b036de4209b;
 Wed, 26 Jun 2019 20:39:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46CED2B;
 Wed, 26 Jun 2019 13:39:14 -0700 (PDT)
Received: from [10.37.12.58] (unknown [10.37.12.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07F6E3F718;
 Wed, 26 Jun 2019 13:39:12 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261309000.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <12426eb9-1545-b1f7-a85a-55c9e04b8cc4@arm.com>
Date: Wed, 26 Jun 2019 21:39:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906261309000.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 14/17] xen/arm64: head: Remove ID map as
 soon as it is not used
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMjYvMTkgOToyNSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMTAgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gVGhlIElEIG1h
cCBtYXkgY2xhc2ggd2l0aCBvdGhlciBwYXJ0cyBvZiB0aGUgWGVuIHZpcnR1YWwgbWVtb3J5IGxh
eW91dC4KPj4gQXQgdGhlIG1vbWVudCwgWGVuIGlzIGhhbmRsaW5nIHRoZSBjbGFzaCBieSBvbmx5
IGNyZWF0aW5nIGEgbWFwcGluZyB0bwo+PiB0aGUgcnVudGltZSB2aXJ0dWFsIGFkZHJlc3MgYmVm
b3JlIGVuYWJsaW5nIHRoZSBNTVUuCj4+Cj4+IFRoZSByZXN0IG9mIHRoZSBtYXBwaW5ncyAoc3Vj
aCBhcyB0aGUgZml4bWFwKSB3aWxsIGJlIG1hcHBlZCBhZnRlciB0aGUKPj4gTU1VIGlzIGVuYWJs
ZWQuIEhvd2V2ZXIsIHRoZSBjb2RlIGRvaW5nIHRoZSBtYXBwaW5nIGlzIG5vdCBzYWZlIGFzIGl0
Cj4+IHJlcGxhY2UgbWFwcGluZyB3aXRob3V0IHVzaW5nIHRoZSBCcmVhay1CZWZvcmUtTWFrZSBz
ZXF1ZW5jZS4KPj4KPj4gQXMgdGhlIElEIG1hcCBjYW4gYmUgYW55d2hlcmUgaW4gdGhlIG1lbW9y
eSwgaXQgaXMgZWFzaWVyIHRvIHJlbW92ZSBhbGwKPj4gdGhlIGVudHJpZXMgYWRkZWQgYXMgc29v
biBhcyB0aGUgSUQgbWFwIGlzIG5vdCB1c2VkIHJhdGhlciB0aGFuIGFkZGluZwo+PiB0aGUgQnJl
YWstQmVmb3JlLU1ha2Ugc2VxdWVuY2UgZXZlcnl3aGVyZS4KPiAKPiBJIHRoaW5rIGl0IGlzIGEg
Z29vZCBpZGVhLCBidXQgSSB3b3VsZCBhc2sgeW91IHRvIG1lbnRpb24gMToxIG1hcAo+IGluc3Rl
YWQgb2YgIklEIG1hcCIgaW4gY29tbWVudHMgYW5kIGNvbW1pdCBtZXNzYWdlcyBiZWNhdXNlIHRo
YXQgaXMgdGhlCj4gd29yZGluZyB3ZSB1c2VkIGluIGFsbCBjb21tZW50cyBzbyBmYXIgKHNlZSB0
aGUgb25lIGluCj4gY3JlYXRlX3BhZ2VfdGFibGVzIGFuZCBtbS5jKS4gSXQgaXMgZWFzaWVyIHRv
IGdyZXAgYW5kIHJlZmVyIHRvIGlmIHdlCj4gdXNlIHRoZSBzYW1lIG5vbWVuY2xhdHVyZS4gTm90
ZSB0aGF0IEkgZG9uJ3QgY2FyZSBhYm91dCB3aGljaAo+IG5vbWVuY2xhdHVyZSB3ZSBkZWNpZGUg
dG8gdXNlLCBJIGFtIG9ubHkgYXNraW5nIGZvciBjb25zaXN0ZW5jeS4KPiBPdGhlcndpc2UsIGl0
IHdvdWxkIGFsc28gd29yayBpZiB5b3Ugc2F5IGl0IGJvdGggd2F5IGF0IGxlYXN0IG9uY2U6Cj4g
Cj4gICBUaGUgSUQgbWFwICgxOjEgbWFwKSBtYXkgY2xhc2ggWy4uLl0KCkkgd291bGQgcmF0aGVy
IGRyb3AgdGhlIHdvcmRpbmcgMToxIGFzIHRoaXMgaXMgY29uZnVzaW5nLiBJdCBpcyBhbHNvIG5v
dCAKdHJpdmlhbCB0byBmaW5kIGFueXRoaW5nIG9uIGdvb2dsZSB0eXBpbmcgIjE6MSIuCgo+IAo+
IAo+PiBJdCBpcyBkaWZmaWN1bHQgdG8gdHJhY2sgd2hlcmUgZXhhY3RseSB0aGUgSUQgbWFwIHdh
cyBjcmVhdGVkIHdpdGhvdXQgYQo+PiBmdWxsIHJld29yayBvZiBjcmVhdGVfcGFnZV90YWJsZXMo
KS4gSW5zdGVhZCwgaW50cm9kdWNlIGEgbmV3IGZ1bmN0aW9uCj4+IHJlbW92ZV9pZF9tYXAoKSB3
aWxsIGxvb2sgd2hlcmUgaXMgdGhlIHRvcC1sZXZlbCBlbnRyeSBmb3IgdGhlIElEIG1hcAo+PiBh
bmQgcmVtb3ZlIGl0Lgo+IAo+IERvIHlvdSB0aGluayBpdCB3b3VsZCBiZSB3b3J0aCBzaW1wbGlm
eWluZyB0aGlzIGNvZGUgYmVsb3cgYnkgcHJlc2VydmluZwo+IHdoZXJlL2hvdyB0aGUgSUQgbWFw
IHdhcyBjcmVhdGVkPyBXZSBjb3VsZCByZXB1cnBvc2UgeDI1IGZvciB0aGF0LAo+IGNhcnJ5aW5n
IGZvciBpbnN0YW5jZSB0aGUgYWRkcmVzcyBvZiB0aGUgSUQgbWFwIHNlY3Rpb24gc2xvdCBvciBh
IGNvZGUKPiBudW1iZXIgdG8gc3BlY2lmeSB3aGljaCBjYXNlIHdlIGFyZSBkZWFsaW5nIHdpdGgu
IFdlIHNob3VsZCBiZSBhYmxlIHRvCj4gdHVybiByZW1vdmVfaWRfbWFwIGludG8gb25seSB+NSBs
aW5lcz8KCkkgdGhvdWdodCBhYm91dCBpdCBidXQgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
b2YgY3JlYXRlX21hcF90YWJsZXMoKSAKaXMgcXVpdGUgYXdmdWwgdG8gcmVhZC4gU28gdGhlIGxl
c3MgSSB0b3VjaCB0aGlzIGZ1bmN0aW9uLCB0aGUgYmV0dGVyIEkgCmZlZWwgOikuCgpJIGhhdmUg
c29tZSByZXdvcmsgZm9yIHRoZSBjcmVhdGVfcGFnZV90YWJsZXMoKSB3aGljaCBzaW1wbGlmeSBp
dCBhIGxvdC4gCllldCwgSSBhbSBub3QgZW50aXJlbHkgc3VyZSBpdCBpcyB3b3J0aCB0byBzcGVu
ZCB0aW1lIHRyeWluZyB0byBzaW1wbGlmeSAKcmVtb3ZlX2lkX21hcC4gVGhpcyBpcyB1bmxpa2Vs
eSB0byBtYWtlIHRoZSBib290IHNpZ25pZmljYW50bHkgZmFzdGVyIAphbmQgSSBkb24ndCBleHBl
Y3QgdGhlIGZ1bmN0aW9uIHRvIHN1cnZpdmUgbW9yZSB0aGFuIGEgcmVsZWFzZSBhcyB0aGUgSUQg
Cm1hcCBhcyB0byBiZSBrZXB0IGluIHBsYWNlIChmb3Igc2Vjb25kYXJ5IGJvb3QgYW5kIHN1c3Bl
bmQvcmVzdW1lKS4KClRoZSBvbmx5IHJlYXNvbiBpdCBpcyByZW1vdmVkIG5vdyBpcyBiZWNhdXNl
IGl0IGNsYXNoZXMgd2l0aCBvdGhlciAKbWFwcGluZyB3ZSBtYXkgZG8uCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
