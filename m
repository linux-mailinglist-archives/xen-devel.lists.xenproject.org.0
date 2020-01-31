Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB114E9D4
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 09:53:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixS0r-00054A-PP; Fri, 31 Jan 2020 08:50:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixS0p-000543-Vk
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 08:50:52 +0000
X-Inumbo-ID: c83b2e7e-4406-11ea-8b9d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c83b2e7e-4406-11ea-8b9d-12813bfff9fa;
 Fri, 31 Jan 2020 08:50:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3480AAE0D;
 Fri, 31 Jan 2020 08:50:50 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-5-anthony.perard@citrix.com>
 <db579f9f-d816-47f9-e75c-4b20d60bda3b@suse.com>
 <20200130181038.GQ1288@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f3c1a0a-56af-c6b2-e959-f1b3ef0a9752@suse.com>
Date: Fri, 31 Jan 2020 09:50:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130181038.GQ1288@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 04/12] xen/build: extract clean
 target from Rules.mk
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@gmail.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxOToxMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gV2VkLCBKYW4g
MjksIDIwMjAgYXQgMDM6MzA6MTlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE3
LjAxLjIwMjAgMTE6NTMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gRnJvbTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGdtYWlsLmNvbT4KPj4+Cj4+PiBNb3N0IG9mIHRoZSBjb2Rl
IGV4ZWN1dGVkIGJ5IFJ1bGVzLm1rIGlzbid0IG5lY2Vzc2FyeSBmb3IgdGhlIGNsZWFuCj4+PiB0
YXJnZXQsIGVzcGVjaWFsbHkgbm90IHRoZSBDRkxBR1MuIFRoaXMgbWFrZSBydW5uaW5nIG1ha2Ug
Y2xlYW4gbXVjaAo+Pj4gZmFzdGVyLgo+Pj4KPj4+IFRoaXMgZXh0cmFjdCB0aGUgY29kZSBpbnRv
IGEgZGlmZmVyZW50IE1ha2VmaWxlLiBJdCBkb2Vzbid0IHdhbnQgdG8KPj4+IGluY2x1ZGUgQ29u
ZmlnLm1rIGVpdGhlciBzbyB2YXJpYWJsZXMgREVQU19STSBhbmQgREVQU19JTkNMVURFIGFyZQo+
Pj4gZXh0cmFjdGVkIGZyb20gQ29uZmlnLm1rIGFzIHdlbGwuIERFUFNfSU5DTFVERSBpcyBwdXQg
aW50bwo+Pj4gS2J1aWxkLmluY2x1ZGUgc28gaXQgY291bGQgYmUgdXNlIGJ5IG90aGVyIE1ha2Vm
aWxlcy4KPj4KPj4gImV4dHJhY3RlZCIgbWFrZXMgaXQgc291bmQgYXMgaWYgdGhlIGludGVudGlv
biB3YXMgdG8gbW92ZSB0aGluZ3MsCj4+IHlldCAuLi4KPj4KPj4+IC0tLQo+Pj4gIHhlbi9SdWxl
cy5tayAgICAgICAgICAgICAgIHwgMTMgLS0tLS0tLS0tLS0tLQo+Pj4gIHhlbi9zY3JpcHRzL0ti
dWlsZC5pbmNsdWRlIHwgIDcgKysrKysrLQo+Pj4gIHhlbi9zY3JpcHRzL01ha2VmaWxlLmNsZWFu
IHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiAgMyBmaWxlcyBjaGFu
Z2VkLCAzOSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPj4KPj4gLi4uIC4vQ29uZmln
Lm1rIGRvZXNuJ3QgZ2V0IHRvdWNoZWQgYXQgYWxsLiBJIGd1ZXNzIHRoZXJlIGFyZSByZWFzb25z
Cj4+IGZvciB0aGlzLCBidXQgSSBjb25zaWRlciBpdCBkYW5nZXJvdXMgdG8gbGVhdmUgaW5kZXBl
bmRlbnQgZGVmaW5pdGlvbnMKPj4gb2YgdGhlIHNhbWUgdmFyaWFibGVzIGluIGRpc2Nvbm5lY3Rl
ZCBwbGFjZXMuIFdoYXQgaWYgb25lIHNpZGUgZ2V0cwo+PiB1cGRhdGVkIHdpdGhvdXQgbm90aWNp
bmcgdGhlIG90aGVyPwo+IAo+IEkgZ3Vlc3MgdGhlIHdvcmQgImV4dHJhY3RlZCIgaXMgdGhlIHdy
b25nIG9uZS4gSSdsbCBuZWVkIHRvIHJld3JpdGUgdGhlCj4gcGF0Y2ggY29tbWVudGFyeS4KPiAK
PiBBcyBmb3Igd2h5IENvbmZpZy5tayBpc24ndCBjaGFuZ2UsIGl0J3MgYmVjYXVzZSBpdCBpcyB1
c2VkIGJ5IGJvdGggdGhlCj4gaHlwZXJ2aXNvciBtYWtlZmlsZXMgYW5kIHRoZSB0b29scyBtYWtl
ZmlsZXMuIEkgd291bGQgbGlrZSBmb3IgcmVjdXJzaXZlCj4gbWFrZWZpbGVzIHRvIG5vdCBpbmNs
dWRlIENvbmZpZy5tayBhbnltb3JlLCBzbyBoYXZpbmcgb25seSB4ZW4vTWFrZWZpbGUKPiBkb2lu
ZyB0aGF0IGluY2x1ZGUuIChJIHdvdWxkIGxpa2UgdG8gZ28gZnVydGhlciBhbmQgbm90IHVzZWQg
Q29uZmlnLm1rCj4gYW55bW9yZSwgYnV0IHRoYXQgbWlnaHQgbm90IGJlIG5lY2Vzc2FyeS4pCj4g
Cj4gQXMgZm9yIHRoZSBsYXN0IHBvaW50LCB0aGUgdmFyaWFibGVzIERFUFNfUk0gYW5kIERFUFNf
SU5DTFVERSBhcmUgY29waWVkCj4gYmVjYXVzZSBNYWtlZmlsZS5jbGVhbiBkb2Vzbid0IGhhdmUg
dGhlbSBhbmQgYXQgc29tZSBwb2ludCBSdWxlcy5tayAobm8KPiBwYXRjaCB5ZXQpIGlzbid0IGdv
aW5nIHRvIGhhdmUgdGhlbSBlaXRoZXIsIHNvIHRoZXJlIHdpbGwgYmUgYSBzaW5nbGUKPiBsb2Nh
dGlvbiB3aGljaCBpcyBLYnVpbGQuaW5jbHVkZS4gQ3VycmVudGx5IHdpdGggdGhpcyBwYXRjaCwg
Ym90aAo+IHZhcmlhYmxlcyBmcm9tIEtidWlsZC5pbmNsdWRlIGFyZSB0aGUgb25lIHVzZWQgYnkg
UnVsZXMubWssIHNvIGl0Cj4gZG9lc24ndCBtYXR0ZXIgaWYgQ29uZmlnLm1rIGlzIG1vZGlmaWVk
LgoKQnV0IHdpdGggQ29uZmlnLm1rIHN0aWxsIGdldHRpbmcgaW5jbHVkZWQgZnJvbSBlbHNld2hl
cmUgdW5kZXJuZWF0aAp4ZW4vLCB0aGlzIGlzIGdvaW5nIHRvIGJlIGNvbmZ1c2luZy4gQ2hhbmdp
bmcgdGhlIEtidWlsZC5pbmNsdWRlCmluc3RhbmNlcyBzaG91bGQgcmVhbGx5IGFmZmVjdCB0aGUg
ZW50aXJlIHhlbi8gdHJlZSB0aGVuLCBhdCB3aGljaApwb2ludCB0aGUgQ29uZmlnLm1rIGluc3Rh
bmNlcyBjb3VsZCBiZSBkZWNsYXJlZCAiZm9yIGV2ZXJ5dGhpbmcKZWxzZSIgKGFuZCBldmVudHVh
bGx5IGJlIG1vdmVkIGludG8gdGhlIHN1YnRyZWVzKS4gSSBhZ3JlZSBpdCdzCm5vdCB2ZXJ5IGhl
bHBmdWwgdGhhdCBDb25maWcubWsgY29udGFpbnMgbm90IG9ubHkgY29tbW9uCmRlZmluaXRpb25z
LCBidXQgYWxzbyBvbmVzIGFjdHVhbGx5IGNvbnRyb2xsaW5nIGhvdyBjZXJ0YWluIHBhcnRzCm9m
IHRoZSBidWlsZCBwcm9jZXNzIHdvcmsgKGxpa2UgdGhlIHR3byBERVBTXyo7IGdvaW5nIHRocm91
Z2ggdGhlCmZpbGUgSSB3b25kZXIgd2hldGhlciB0aGVzZSB0d28gYXJlIGFjdHVhbGx5IHRoZSBv
bmx5IG91dGxpZXJzKS4KCj4gVGhpbmdzIGRvZXNuJ3QgbG9vayBncmVhdCB5ZXQsIGJ1dCBpdCBk
b2Vzbid0IGZlZWwgbGlrZSB0aGVyZSBhcmUgYmV0dGVyCj4gd2F5IHRvIHJlZmFjdG9yIHRoZSBi
dWlsZCBzeXN0ZW0uCgpSaWdodCwgYW4gaW5jcmVtZW50YWwgc3dpdGNoIG9mIHRoZSBidWlsZCBt
YWNoaW5lcnkgaXMgZ29pbmcgdG8KcnVuIGludG8gb2RkaXRpZXMuIENhbGxpbmcgdGhlbSBvdXQg
ZXhwbGljaXRseSAoaW5jbHVkaW5nIHdoYXQKdGhlIHBsYW4gaXMgdG8gcmVzb2x2ZSB0aGVtIGJ5
IHRoZSBlbmQgb2YgdGhlIHRyYW5zZm9ybWF0aW9uCnByb2Nlc3MpIHdvdWxkIGJlIGhlbHBmdWws
IHRob3VnaC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
