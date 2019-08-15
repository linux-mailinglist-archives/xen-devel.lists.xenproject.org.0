Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572D88F00A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 18:03:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyIBJ-00070x-JJ; Thu, 15 Aug 2019 16:00:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyIBH-00070j-Qz
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 16:00:51 +0000
X-Inumbo-ID: d97c1772-bf75-11e9-8ba2-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d97c1772-bf75-11e9-8ba2-12813bfff9fa;
 Thu, 15 Aug 2019 16:00:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F41EE28;
 Thu, 15 Aug 2019 09:00:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 269BE3F706;
 Thu, 15 Aug 2019 09:00:47 -0700 (PDT)
To: George Dunlap <george.dunlap@citrix.com>,
 "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Lars Kurth <lars.kurth.xen@gmail.com>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
 <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
 <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
 <664a5f94-bf16-42b1-ff99-e3cee5170563@arm.com>
 <8dd1e706-72a9-da4f-89a1-cde419b6c11d@citrix.com>
 <e8b045af-92c3-0cd6-c8f0-fad184569408@arm.com>
 <792bef63-0ddf-f928-97c0-03c7c0ecb8ed@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7517ae8c-d1e1-e127-d6c0-b20040d23e41@arm.com>
Date: Thu, 15 Aug 2019 17:00:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <792bef63-0ddf-f928-97c0-03c7c0ecb8ed@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH lp-metadata 2/3] livepatch: Handle arbitrary
 size names with the list operation
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
Cc: "Tim \(Xen.org\)" <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLAoKT24gMTUvMDgvMjAxOSAxNjo0OCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBP
biA4LzE1LzE5IDQ6MzYgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgR2VvcmdlLAo+Pgo+
PiBPbiAxNS8wOC8yMDE5IDE2OjMyLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gOC8xNS8x
OSA0OjI5IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDE1LzA4LzIw
MTkgMTY6MTksIFdpZWN6b3JraWV3aWN6LCBQYXdlbCB3cm90ZToKPj4+Pj4gSGkgTGFycywgSnVs
aWVuLAo+Pj4+Cj4+Pj4gSGksCj4+Pj4KPj4+Pj4gVGhhbmtzIGZvciB0aGUgcG9pbnRlcnMsIEkg
d2lsbCByZWFkIHRoZW0gdXAgYW5kIGZvbGxvdyB0aGUKPj4+Pj4gcmVjb21tZW5kYXRpb25zIHdp
dGggbXkgZnV0dXJlIGNvbnRyaWJ1dGlvbnMuCj4+Pj4+IFNvcnJ5IGZvciB0aGUgbWVzc+KApgo+
Pj4+Pgo+Pj4+PiBCdXQsIGxldCBtZSBhc2sgZmlyc3QgYmVmb3JlIHJlYWRpbmcgdGhlIHdpa2lz
LCBob3cgZG8geW91IHByZWZlcgo+Pj4+PiBzdWJtaXR0aW5nIHNlcmllcyB0aGF0IGNvbnRhaW4g
cGF0Y2hlcyBiZWxvbmdpbmcgdG8gMiBkaXN0aW5jdCByZXBvcwo+Pj4+PiAoZS5nLiB4ZW4gYW5k
IGxpdmVwYXRjaC1idWlsZC10b29scyk/Cj4+Pj4KPj4+PiBJIGNhbiBzZWUgdHdvIHdheXM6Cj4+
Pj4KPj4+PiAgwqDCoCAxKSBPbmUgc2VyaWVzIHBlciBwcm9qZWN0IGFuZCBtZW50aW9uIGluIHRo
ZSBjb3ZlciBsZXR0ZXIgdGhhdAo+Pj4+IG1vZGlmaWNhdGlvbnMgYXJlIHJlcXVpcmVkIGluIGFu
b3RoZXIgcHJvamVjdCAod2l0aCBsaW5rL3RpdGxlKS4KPj4+PiAgwqDCoCAyKSBDb21iaW5lIGFs
bCB0aGUgcGF0Y2hlcyBpbiBvbmUgc2VyaWVzIGFuZCB0YWcgdGhlbSBkaWZmZXJlbnRseS4KPj4+
PiBJLmUKPj4+PiBbWEVOXSBbTElWRVBBVENIXS4KPj4+Pgo+Pj4+IDEpIGlzIHByZWZlcmFibGUg
aWYgeW91IGhhdmUgYSBsb3Qgb2YgcGF0Y2hlcyBpbiBlYWNoIHJlcG8uIDIpIGNhbiBiZQo+Pj4+
IGhhbmR5IGlmIHlvdSBoYXZlIG9ubHkgYSBjb3VwbGUgb2YgcGF0Y2hlcyBmb3Igb25lIHJlcG8u
Cj4+Pgo+Pj4gMSBpcyBhbHNvIGVhc2llciBmb3IgYXV0b21hdGVkIHRvb2xzIChsaWtlIHBhdGNo
ZXcpIHRvIGRlYWwgd2l0aC4KPj4KPj4gT3V0IG9mIGludGVyZXN0LCBpbiBnZW5lcmFsIGRldmVs
b3BlciB3aWxsIHRlbmQgdG8gY3Jvc3MtcG9zdCB0aG9zZQo+PiBwYXRjaGVzLiBTbyBpbiB3aGF0
IHdheSB0aGlzIHdvdWxkIG1ha2UgaXQgZWFzaWVyPwo+IAo+IElmIHlvdSBoYXZlIHR3byBzZXBh
cmF0ZSBzZXJpZXMsIHRoZW4gcGF0Y2hldyB3aWxsIGJlIGFibGUgdG8gaGFuZGxlIG9uZQo+IGFu
ZCBub3QgaGFuZGxlIHRoZSBvdGhlci4gIElmIHRoZXkncmUgbWl4ZWQgaW4gYSBzaW5nbGUgc2Vy
aWVzLCBwYXRjaGV3Cj4gd29uJ3QgYmUgYWJsZSB0byBoYW5kbGUgaXQgYXQgYWxsLiAgQXQgdGhl
IG1vbWVudCBwYXRjaGV3IGRvZXNuJ3QgZG8KPiBhbnl0aGluZyBidXQgZ2l2ZSB5b3UgYSBuaWNl
IG1ib3ggLyBnaXQgYnJhbmNoIHRvIHB1bGw7IGJ1dCBldmVudHVhbGx5Cj4gdGhlIGlkZWEgaXMg
dGhhdCBpdCB3aWxsIGRvIHNvbWUgbGV2ZWwgb2YgdGVzdGluZyBhbmQgZ2l2ZSBmZWVkYmFjawo+
IChwYXRjaCBkb2VzL24ndCBhcHBseSwgcGF0Y2ggZG9lcy9uJ3QgYnVpbGQsIHBhdGNoIGRvZXMv
bid0IHBhc3Mgc21va2UKPiB0ZXN0cyAvICZjKS4KCk9oLCBzbyBwYXRjaGV3IHdpbGwgdHJ5IHRv
IGFwcGx5IHRoZSBzZXJpZXMuIElmIGl0IGRvZXMgbm90IGZ1bGx5IGFwcGx5LCB0aGVuIGl0IApt
ZWFucyB0aGUgc2VyaWVzIGRvZXMgbm90IHRhcmdldCBYZW4sIHJpZ2h0PwoKSSBoYXZlbid0IHVz
ZWQgbXVjaCBwYXRjaGV3IHNvIGZhciwgYnV0IGl0IGxvb2tzIGxpa2UgSSBzaG91bGQgZ2l2ZSBh
IHRyeSB3aGVuIApjb21taXR0aW5nL3Jldmlld2luZyBzZXJpZXMgOikuCgpUaGFuayB5b3UgZm9y
IHRoZSBleHBsYW5hdGlvbiEKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
