Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0009D7F204
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 11:44:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htU49-0000fY-Ab; Fri, 02 Aug 2019 09:41:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s405=V6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htU48-0000fT-AP
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 09:41:36 +0000
X-Inumbo-ID: b780d8aa-b509-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b780d8aa-b509-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 09:41:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6042344;
 Fri,  2 Aug 2019 02:41:34 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 069DC3F575;
 Fri,  2 Aug 2019 02:41:33 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-3-viktor.mitin.19@gmail.com> <87zhktgfml.fsf@epam.com>
 <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com>
 <43ea6ddd-5f48-865d-c25d-6d0b13845275@arm.com>
 <CAOcoXZbdDiJWfXDxVvZ-tMw-iAZJakB7iw6vpqEdqiHMjxU0DA@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e751b9a0-2b35-9a52-f3dd-32b9e850de08@arm.com>
Date: Fri, 2 Aug 2019 10:41:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOcoXZbdDiJWfXDxVvZ-tMw-iAZJakB7iw6vpqEdqiHMjxU0DA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/2] xen/arm: consolidate make_timer_node
 and make_timer_domU_node
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmlrdG9yLAoKT24gMDEvMDgvMjAxOSAxNzo0NiwgVmlrdG9yIE1pdGluIHdyb3RlOgo+IE9u
IFRodSwgQXVnIDEsIDIwMTkgYXQgNDo1OCBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPiB3cm90ZToKPj4KPj4KPj4KPj4gT24gMDEvMDgvMjAxOSAxNDo1NywgSnVsaWVuIEdy
YWxsIHdyb3RlOgo+IAo+Pj4+PiArICAgIHVuc2lnbmVkIGludCBpcnFbTUFYX1RJTUVSX1BQSV07
Cj4+Pj4gQXMgSSBzYWlkIGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uLCB5b3UgYXJlIHdhc3Rpbmcg
c3RhY2sgc3BhY2UKPj4+PiB0aGVyZS4gQWxzbywgdGhpcyBpcyBtaXNsZWFkaW5nLiBXaGVuIEkg
c2VlIGFycmF5IG9mIDQgaXRlbXMsIEkgZXhwZWN0Cj4+Pj4gdGhhdCBhbGwgNCBpdGVtcyB3aWxs
IGJlIHVzZWQuIEJ1dCB5b3UgYXJlIHVzaW5nIG9ubHkgMywgc28gaXQgbGVhZHMgdG8KPj4+PiB0
d28gY29uY2x1c2lvbnM6IGVpdGhlciB5b3UgbWFkZSBhIG1pc3Rha2UsIG9yIEkgZG9uJ3QgdW5k
ZXJzdGFuZCB3aGF0Cj4+Pj4gaXQgaGFwcGVuaW5nLiBFaXRoZXIgb3B0aW9uIGlzIGJhZC4KPj4+
Cj4+PiA0IGJ5dGUgb24gYSBzdGFjayBvZiAxNktCLi4uIHRoYXQncyBub3QgcmVhbGx5IGEgd2Fz
dGUgd29ydGggYW4gYXJndW1lbnQuIFRoZQo+Pj4gbW9yZSB0aGUgc3RhY2sgaXMgcHJldHR5IGVt
cHR5IGFzIHRoaXMgaXMgYm9vdC4gU28geWVzLCB5b3Ugd2lsbCBub3QgdXNlIHRoZQo+Pj4gbGFz
dCBpbmRleCBiZWNhdXNlIHlvdSBkb24ndCBleHBvc2UgaHlwZXJ2aXNvciB0aW1lciB0byBndWVz
dCB5ZXQhIChJbWFnaW5lCj4+PiBuZXN0ZWQgdmlydCkuIEJ1dCBhdCBsZWFzdCBpdCBhdm9pZHMg
aGFyZGNvZGluZyBhIG51bWJlciBvZiBpbmRleCBhbmQgbWF0Y2ggdGhlCj4+PiBlbnVtLgo+Pgo+
PiBJIGZvcmdvdCB0byBtZW50aW9uLiBAVmlrdG9yLCBpdCBpcyBnb29kIHRvIHRyeSB0byByZXBs
eSB0byBlYWNoIGNvbW1lbnQgYXQKPj4gbGVhc3QgdGhvc2UgeW91IGRvbid0IHBsYW4gdG8gYWRk
cmVzcy4gU28gdGhlIHJldmlld2VyIGRvZXNuJ3QgaGF2ZSB0aGUgZmVlbGluZwo+PiBjb21tZW50
cyBhcmUgaWdub3JlZC4uLgo+IAo+IFdlbGwsIEkgYWRkcmVzcyBlYWNoIG9mIHRoZSBjb21tZW50
cyBvciB3cml0ZSBhYm91dCBpdCBleHBsaWNpdGx5IGluCj4gb3RoZXIgY2FzZXMuCj4gSW4gdGhp
cyBwYXJ0aWN1bGFyIGNhc2UsIEknZCBhZGRlZCAgJy0xJywgYnV0IGxhdGVyIGRpZCBub3QgbWVy
Z2UgaXQKPiBkdWUgdG8gbWlzdGFrZS4KPiBTbyBpdCBzdXBwb3NlZCB0byBiZSB0aGUgbmV4dDoK
PiArICAgIHVuc2lnbmVkIGludCBpcnFbTUFYX1RJTUVSX1BQSS0xXQoKUGxlYXNlIG5vICctMScs
IGl0IGlzIHdvcnN0IHRoYW4gaGFyZGNvZGluZyB2YWx1ZS4gSW4gdGhlIGNvZGUgeW91IGFyZSB1
c2luZyBhbiAKZWxlbWVudCBvZiBhbiBlbnVtIHRvIGFjY2VzcyB0aGUgYXJyYXkuIFRoZXJlIGFy
ZSBubyBndWFyYW50ZWUgdGhlIGxhc3QgZWxlbWVudCAKaXMgYWN0dWFsbHkgdGhlIG9uZSB5b3Ug
d2FudCB0byBkcm9wIGFuZCB0aGVyZWZvcmUgeW91IHJpc2sgdG8gb3ZlcmZsb3cgaXQgaWYgCm1p
c3Rha2VubHkgdXNlZC4KClRoZSByaXNrIGlzIG5vdCB3b3J0aCBjb21wYXJlIHRvIHNhdmluZyBq
dXN0IDQtYnl0ZSBvbiB0aGUgc3RhY2suCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
