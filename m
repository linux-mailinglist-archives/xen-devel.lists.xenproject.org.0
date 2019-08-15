Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF9A8EFFE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 18:01:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyI9H-0005j4-KN; Thu, 15 Aug 2019 15:58:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyI9G-0005iq-4S
 for xen-devel@lists.xen.org; Thu, 15 Aug 2019 15:58:46 +0000
X-Inumbo-ID: 8d6ef9b2-bf75-11e9-8ba2-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8d6ef9b2-bf75-11e9-8ba2-12813bfff9fa;
 Thu, 15 Aug 2019 15:58:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7064028;
 Thu, 15 Aug 2019 08:58:41 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90EDB3F706;
 Thu, 15 Aug 2019 08:58:39 -0700 (PDT)
To: Lars Kurth <lars.kurth.xen@gmail.com>,
 "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
 <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
 <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
 <18CBBC37-9027-41B7-8375-44FE3E56F79F@gmail.com>
 <C3D44CDE-E1C3-404D-852E-FDA691F09B82@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7308f1a7-ceaf-d0e3-b425-bbd8049d5007@arm.com>
Date: Thu, 15 Aug 2019 16:58:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <C3D44CDE-E1C3-404D-852E-FDA691F09B82@gmail.com>
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
 Ross Lagerwall <ross.lagerwall@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDE1LzA4LzIwMTkgMTY6NDYsIExhcnMgS3VydGggd3JvdGU6Cj4gCj4gCj4+
IE9uIDE1IEF1ZyAyMDE5LCBhdCAxNjozMywgTGFycyBLdXJ0aCA8bGFycy5rdXJ0aC54ZW5AZ21h
aWwuY29tIAo+PiA8bWFpbHRvOmxhcnMua3VydGgueGVuQGdtYWlsLmNvbT4+IHdyb3RlOgo+Pgo+
Pgo+Pgo+Pj4gT24gMTUgQXVnIDIwMTksIGF0IDE2OjE5LCBXaWVjem9ya2lld2ljeiwgUGF3ZWwg
PHdpcGF3ZWxAYW1hem9uLmRlIAo+Pj4gPG1haWx0bzp3aXBhd2VsQGFtYXpvbi5kZT4+IHdyb3Rl
Ogo+Pj4KPj4+IEhpIExhcnMsIEp1bGllbiwKPj4+Cj4+PiBUaGFua3MgZm9yIHRoZSBwb2ludGVy
cywgSSB3aWxsIHJlYWQgdGhlbSB1cCBhbmQgZm9sbG93IHRoZSByZWNvbW1lbmRhdGlvbnMgCj4+
PiB3aXRoIG15IGZ1dHVyZSBjb250cmlidXRpb25zLgo+Pj4gU29ycnkgZm9yIHRoZSBtZXNz4oCm
Cj4+Cj4+IEl0J3Mgbm90IHJlYWxseSBhIG1lc3M6IGl0IG11c3QgaGF2ZSBiZWVuIHF1aXRlIGEg
cGFpbiB0byBwdXQgdGhlIG1haWxzIAo+PiB0b2dldGhlciBtYW51YWxseQo+PiBBbmQgaXQgd291
bGQgYmVjb21lIG1vcmUgcGFpbmZ1bCBmb3IgYSBzZWNvbmQgcmV2aXNpb24KPj4gSSBoYXZlIGJl
ZW4gdGhyb3VnaCB0aGlzIG15c2VsZgo+Pgo+Pj4gQnV0LCBsZXQgbWUgYXNrIGZpcnN0IGJlZm9y
ZSByZWFkaW5nIHRoZSB3aWtpcywgaG93IGRvIHlvdSBwcmVmZXIgc3VibWl0dGluZyAKPj4+IHNl
cmllcyB0aGF0IGNvbnRhaW4gcGF0Y2hlcyBiZWxvbmdpbmcgdG8gMiBkaXN0aW5jdCByZXBvcyAo
ZS5nLiB4ZW4gYW5kIAo+Pj4gbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzKT8KPj4KPj4gVGhhdCdzIGEg
Z29vZCBxdWVzdGlvbiBhbmQgYSB2ZXJ5IHJhcmUgdXNlLWNhc2UuIFdlIHNwbGl0IHRoZW0sIGFz
IGFsbCB0aGUgCj4+IHRvb2xzIHN1Y2ggYXPCoGdpdCBmb3JtYXQtcGF0Y2ggb25seSB3b3JrIG9u
IG9uZSByZXBvCj4+IEFwcGx5aW5nIHBhdGNoZXMgYWxzbyBvbmx5IHdvcmtzIG9uIGEgcGVyIHJl
cG8gYmFzaXMKPj4KPj4gU28sIEkgd291bGQgc2VuZCB0d28gc2VyaWVzLiBCdXQgbWVudGlvbiB0
aGUgcmVsYXRpb25zaGlwIGluIHRoZSBjb3ZlciBsZXR0ZXIgCj4+IChhbmQvb3IgcGF0Y2ggaWYg
aXQgaXMgYSBzaW5nbGUgb25lKQo+Pgo+PiBUaGUgdG9vbHMgaW4gdGhlIGRvY3MgY3VycmVudGx5
IG1heSBub3Qgd29yayBvbiBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMuZ2l0Cj4+ICogRmlyc3Q6IHRo
ZXJlIGlzIG5vIE1BSU5UQUlORVJTIGZpbGUgaW4gbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzLmdpdCwg
d2hpY2ggCj4+IHJlYWxseSBzaG91bGQgYmUgYWRkZWQKPj4gKiBTZWNvbmQ6IHVzaW5nIHhlbi5n
aXQ6L3NjcmlwdHMvYWRkX21haW50YWluZXJzLnBsIG1heSBub3Qgd29yayB3aGVuIGNhbGxlZCAK
Pj4gZnJvbSB3aXRoaW4gbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzLmdpdAo+Pgo+PiBJIGFtIGdvaW5n
IHRvIHBsYXkgd2l0aCB0aGlzIGFuZCB1cGRhdGUgdGhlIGRvY3MgYW5kIGlmIG5lZWRlZCB0aGUg
dG9vbHMgCj4+IGFjY29yZGluZ2x5Cj4+IFlvdSBtYXkgaGF2ZSB0byBpbXByb3Zpc2UgaW4gdGhl
IG1lYW50aW1lOgo+PiAqIFN0ZXAgMSAmIDMgd2lsbCB3b3JrOiBTdGVwIDIsIG9wdGlvbiAxIHdp
bGwgcHJvYmFibHkgbm90ICh3aGljaCBtZWFucyB1bnRpbCAKPj4gSSBoYXZlIGRvbmUgdGhpcywg
eW91IG1heSBoYXZlIHRvIGZvbGxvdyBvcHRpb24gMiBhbmQgbWFrZSBzdXJlIHRoYXQgdGhlIHJp
Z2h0IAo+PiBwZW9wbGUgYXJlIENDJ2VkKQo+IAo+IEkgY2FuIGNvbmZpcm0gdGhhdCBTdGVwIDIg
ZG9lcyBub3Qgd29yayB3aXRob3V0IHNvbWUgdG9vbHMgY2hhbmdlcyB0byAKPiBzY3JpcHRzL2Fk
ZF9tYWludGFpbmVycy5wbCB3aGVuIGNhbGxlZCBmcm9tIHdpdGhpbiBhIG5vbi14ZW4uZ2l0IHJl
cG8KPiAKPiBBbmQKPiAKPiBnaXQgc2VuZC1lbWFpbCAtLXRvIHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZyAKPiA8bWFpbHRvOnhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gCj4g
LS1jYy1jbWQ9Ii4uL3hlbi5naXQvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCIgLS1kcnktcnVu
IC0xCj4gCj4gZXJyb3JzIHdpdGgKPiAKPiAuLi94ZW4uZ2l0L3NjcmlwdHMvZ2V0X21haW50YWlu
ZXIucGw6IFRoZSBjdXJyZW50IGRpcmVjdG9yeSBkb2VzIG5vdCBhcHBlYXIgdG8gCj4gYmUgYSBY
ZW4gc291cmNlIHRyZWUuCj4gCj4gSSBuZWVkIHRvIGZpeCB0aGlzLiBIb3BlZnVsbHkgZ2V0X21h
aW50YWluZXIucGwgaXNuJ3QgdG9vIGRlcGVuZGFudCBvbiB0aGUgCj4gYWN0dWFsIFhlbiB0cmVl
CgpnZXRfbWFpbnRhaW5lci5wbCByZWxpZXMgb24gdGhlIGN1cnJlbnQgd29ya2luZyBkaXJlY3Rv
cnkgdG8gYmUgdGhlIHRvcCBvZiB0cmVlLgoKQXQgdGhlIG1vbWVudCwgaXQgY2hlY2tzIHZhcmlv
dXMgZmlsZSBhcmUgcHJlc2VudCAoc2VlIHRvcF9vZl90cmVlKSBidXQgSSB0aGluayAKaXQgc2hv
dWxkIGJlIGZlYXNpYmxlIHRvIGp1c3QgcmVsYXggaXQgdG8ganVzdCBNQUlOVEFJTkVSUy4KClRo
ZSByaXNrIGlzIGEgdXNlciBtYXkgZW5kIHVwIHRvIGNhbGwgdGhlIHdyb25nIE1BSU5UQUlORVJT
IGZpbGUgaWYgaXQgbWVzc2VzIHVwIAp0aGUgY3VycmVudCB3b3JraW5nIGRpcmVjdG9yeSAoaS5l
IGNhbGxpbmcgZm9yIFhlbiBwYXRjaGVzIGZyb20gCmxpdmVwYXRjaC10b29scykuIE5vdCBzdXJl
IGlmIHRoaXMgaXMgYSByZWFsIGNvbmNlcm4gdGhvdWdoLi4uCgpOb3RlIHRoYXQgTGludXggaGFz
IGEgc2ltaWxhciBjaGVjayB0byBlbnN1cmUgdGhlIHVzZXIgaXMgb24gdGhlIHJpZ2h0IGRpcmVj
dG9yeSAKKGkuZQoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
