Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198167B3A7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 21:56:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsYAs-0002Ft-08; Tue, 30 Jul 2019 19:52:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WuyF=V3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsYAq-0002Fo-M4
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 19:52:40 +0000
X-Inumbo-ID: 95c18ef4-b303-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 95c18ef4-b303-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 19:52:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC76D344;
 Tue, 30 Jul 2019 12:52:38 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA6283F575;
 Tue, 30 Jul 2019 12:52:37 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906271135340.5851@sstabellini-ThinkPad-T480s>
 <e802f230-52f7-a018-8902-ad466f2dab76@arm.com>
 <alpine.DEB.2.21.1907301024460.28600@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0f74ba78-6c38-61d4-98e4-885f5228fcca@arm.com>
Date: Tue, 30 Jul 2019 20:52:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907301024460.28600@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDcvMzAvMTkgNjozMyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIFRodSwgMjcgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gNi8yNy8x
OSA3OjU1IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBNb24sIDEwIEp1biAy
MDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gKzE6Cj4+Pj4gKyAgICAgICAgLyoKPj4+PiAr
ICAgICAgICAgKiBGaW5kIHRoZSBzZWNvbmQgc2xvdCB1c2VkLiBSZW1vdmUgdGhlIGVudHJ5IGZv
ciB0aGUgZmlyc3QKPj4+PiArICAgICAgICAgKiB0YWJsZSBpZiB0aGUgc2xvdCBpcyBub3QgMSAo
cnVudGltZSBYZW4gbWFwcGluZyBpcyAyTSAtIDRNKS4KPj4+PiArICAgICAgICAgKiBGb3Igc2xv
dCAxLCBpdCBtZWFucyB0aGUgSUQgbWFwIHdhcyBub3QgY3JlYXRlZC4KPj4+PiArICAgICAgICAg
Ki8KPj4+PiArICAgICAgICBsc3IgICB4MSwgeDE5LCAjU0VDT05EX1NISUZUCj4+Pj4gKyAgICAg
ICAgYW5kICAgeDEsIHgxLCAjTFBBRV9FTlRSWV9NQVNLICAvKiB4MSA6PSBmaXJzdCBzbG90ICov
Cj4+Pj4gKyAgICAgICAgY21wICAgeDEsICMxCj4+Pj4gKyAgICAgICAgYmVxICAgaWRfbWFwX3Jl
bW92ZWQKPj4+PiArICAgICAgICAvKiBJdCBpcyBub3QgaW4gc2xvdCAxLCByZW1vdmUgdGhlIGVu
dHJ5ICovCj4+Pj4gKyAgICAgICAgbGRyICAgeDAsID1ib290X3NlY29uZCAgICAgICAgICAvKiB4
MCA6PSBzZWNvbmQgdGFibGUgKi8KPj4+PiArICAgICAgICBzdHIgICB4enIsIFt4MCwgeDEsIGxz
bCAjM10KPj4+Cj4+PiBXb3VsZG4ndCBpdCBiZSBhIGJpdCBtb3JlIHJlbGlhYmxlIGlmIHdlIGNo
ZWNrZWQgd2hldGhlciB0aGUgc2xvdCBpbgo+Pj4gcXVlc3Rpb24gZm9yIHgxOSAod2hldGhlciB6
ZXJvLCBmaXJzdCwgc2Vjb25kKSBpcyBhIHBhZ2V0YWJsZSBwb2ludGVyIG9yCj4+PiBzZWN0aW9u
IG1hcCwgdGhlbiB6ZXJvIGl0IGlmIGl0IGlzIGEgc2VjdGlvbiBtYXAsIG90aGVyd2lzZSBnbyBk
b3duIG9uZQo+Pj4gbGV2ZWw/IElmIHdlIGRpZCBpdCB0aGlzIHdheSBpdCB3b3VsZCBiZSBpbmRl
cGVuZGVudCBmcm9tIHRoZSB3YXkKPj4+IGNyZWF0ZV9wYWdlX3RhYmxlcyBpcyB3cml0dGVuLgo+
Pgo+PiBZb3VyIHN1Z2dlc3Rpb24gd2lsbCBub3QgY29tcGx5IHdpdGggdGhlIGFyY2hpdGVjdHVy
ZSBjb21wbGlhbmNlIGFuZCBob3cgWGVuCj4+IGlzL3dpbGwgYmUgd29ya2luZyBhZnRlciB0aGUg
ZnVsbCByZXdvcmsuIFdlIHdhbnQgdG8gcmVtb3ZlIGV2ZXJ5dGhpbmcKPj4gKG1hcHBpbmcgKyB0
YWJsZSkgYWRkZWQgc3BlY2lmaWNhbGx5IGZvciB0aGUgMToxIG1hcHBpbmcuCj4+Cj4+IE90aGVy
d2lzZSwgeW91IG1heSBlbmQgdXAgaW4gYSBwb3NpdGlvbiB3aGVyZSBib290X2ZpcnN0X2lkIGlz
IHN0aWxsIGluIHBsYWNlLgo+PiBXZSB3b3VsZCBuZWVkIHRvIHVzZSB0aGUgYnJlYWstYmVmb3Jl
LW1ha2Ugc2VxdWVuY2UgaW4gc3Vic2VxdWVudCBjb2RlIGlmIHdlCj4+IHdlcmUgYWJvdXQgdG8g
aW5zZXJ0IDFHQiBtYXBwaW5nIGF0IHRoZSBzYW1lIHBsYWNlLgo+Pgo+PiBBZnRlciBteSByZXdv
cmssIHdlIHdvdWxkIGhhdmUgdmlydHVhbGx5IG5vIHBsYWNlIHdoZXJlIGJyZWFrLWJlZm9yZS1t
YWtlIHdpbGwKPj4gYmUgbmVjZXNzYXJ5IGFzIGl0IHdpbGwgZW5mb3JjZSBhbGwgdGhlIG1hcHBp
bmdzIHRvIGJlIGRlc3Ryb3llZCBiZWZvcmUgaGFuZC4KPj4gU28gSSB3b3VsZCByYXRoZXIgYXZv
aWQgdG8gbWFrZSBhIHNwZWNpZmljIGNhc2UgZm9yIHRoZSAxOjEgbWFwcGluZy4KPiAKPiBJIGRv
bid0IGZ1bGx5IHVuZGVyc3RhbmQgeW91ciBleHBsYW5hdGlvbi4gSSB1bmRlcnN0YW5kIHRoZSBm
aW5hbCBnb2FsCj4gb2YgInJlbW92aW5nIGV2ZXJ5dGhpbmcgKG1hcHBpbmcgKyB0YWJsZSkgYWRk
ZWQgc3BlY2lmaWNhbGx5IGZvciB0aGUgMToxCj4gbWFwcGluZyIuIEkgZG9uJ3QgdW5kZXJzdGFu
ZCB3aHkgbXkgc3VnZ2VzdGlvbiB3b3VsZCBiZSBhIGhpbmRyYW5jZQo+IHRvd2FyZCB0aGF0IGdv
YWwsIGNvbXBhcmVkIHRvIHdoYXQgaXQgaXMgZG9uZSBpbiB0aGlzIHBhdGNoLgoKQmVjYXVzZSwg
QUZBSUNULCB5b3VyIHN1Z2dlc3Rpb24gd2lsbCBvbmx5IHJlbW92ZSB0aGUgbWFwcGluZyBhbmQg
bm90IAp0aGUgdGFibGVzIChzdWNoIGFzIGJvb3RfZmlyc3RfaWQpLiBUaGlzIGlzIGRpZmZlcmVu
dCBmcm9tIHRoaXMgcGF0Y2ggCndoZXJlIGJvdGggbWFwcGluZyBhbmQgdGFibGVzIGFyZSByZW1v
dmVkLgoKU28geWVzLCBteSBzdWdnZXN0aW9uIGlzIG5vdCBnZW5lcmljLCBidXQgYXQgbGVhc3Qg
aXQgZG9lcyB0aGUgam9iIHRoYXQgCmlzIGV4cGVjdGVkIGJ5IHRoaXMgZnVuY3Rpb24uIEkuZSBy
ZW1vdmluZyBhbnl0aGluZyB0aGF0IHdhcyAKc3BlY2lmaWNhbGx5IGNyZWF0ZWQgZm9yIHRoZSBp
ZGVudGl0eSBtYXBwaW5nLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
