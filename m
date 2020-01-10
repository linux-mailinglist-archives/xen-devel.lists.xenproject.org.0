Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B47137409
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 17:47:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipxPt-0004Mt-CP; Fri, 10 Jan 2020 16:45:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zj8/=27=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipxPs-0004Mm-6n
 for xen-devel@lists.xen.org; Fri, 10 Jan 2020 16:45:44 +0000
X-Inumbo-ID: 9f48c2ea-33c8-11ea-a2eb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f48c2ea-33c8-11ea-a2eb-bc764e2007e4;
 Fri, 10 Jan 2020 16:45:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CBD81B25C;
 Fri, 10 Jan 2020 16:45:33 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <e79ec88a-8261-39e0-6c18-a1db5af85b6a@citrix.com>
 <5e6956a4-9b32-6fae-6fa5-cf72a627a3da@citrix.com>
 <01239ba8-9084-faff-c9f7-f59970aefd82@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e57a35f1-1c81-8393-0efd-c3592aa69dd2@suse.com>
Date: Fri, 10 Jan 2020 17:45:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <01239ba8-9084-faff-c9f7-f59970aefd82@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDEuMjAgMTY6NTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEwLjAxLjIwMjAgMTY6
MjgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDEvMTAvMjAgMTE6MDIgQU0sIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBPbiAxMC8wMS8yMDIwIDEwOjM3LCBTZXJnZXkgRHlhc2xpIHdyb3Rl
Ogo+Pj4+IEhpZGUgdGhlIGZvbGxvd2luZyBpbmZvcm1hdGlvbiB0aGF0IGNhbiBoZWxwIGlkZW50
aWZ5IHRoZSBydW5uaW5nIFhlbgo+Pj4+IGJpbmFyeSB2ZXJzaW9uOiBYRU5WRVJfZXh0cmF2ZXJz
aW9uLCBYRU5WRVJfY29tcGlsZV9pbmZvLCBYRU5WRVJfY2hhbmdlc2V0Lgo+Pj4+IEFkZCBleHBs
aWNpdCBjYXNlcyBmb3IgWEVOVkVSX2NvbW1hbmRsaW5lIGFuZCBYRU5WRVJfYnVpbGRfaWQgYXMg
d2VsbC4KPj4+Pgo+Pj4+IEludHJvZHVjZSB4c21fZmlsdGVyX2RlbmllZCgpIHRvIGh2bWxvYWRl
ciB0byByZW1vdmUgIjxkZW5pZWQ+IiBzdHJpbmcKPj4+PiBmcm9tIGd1ZXN0J3MgRE1JIHRhYmxl
cyB0aGF0IG90aGVyd2lzZSB3b3VsZCBiZSBzaG93biBpbiB0b29scyBsaWtlCj4+Pj4gZG1pZGVj
b2RlLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNs
aUBjaXRyaXguY29tPgo+Pj4+IC0tLQo+Pj4+IHYxIC0tPiB2MjoKPj4+PiAtIEFkZGVkIHhzbV9m
aWx0ZXJfZGVuaWVkKCkgdG8gaHZtbG9hZGVyIGluc3RlYWQgb2YgbW9kaWZ5aW5nIHhlbl9kZW55
KCkKPj4+PiAtIE1hZGUgYmVoYXZpb3VyIHRoZSBzYW1lIGZvciBib3RoIFJlbGVhc2UgYW5kIERl
YnVnIGJ1aWxkcwo+Pj4+IC0gWEVOVkVSX2NhcGFiaWxpdGllcyBpcyBubyBsb25nZXIgaGlkZWQK
Pj4+Pgo+Pj4+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
Pj4+IENDOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4+Pj4g
Q0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+Pj4+IENDOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+Cj4+Pj4gQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT4KPj4+PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgo+Pj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+Pj4+IENDOiBEYW5pZWwgRGUgR3Jh
YWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4KPj4+Cj4+PiBJIHJlYWxpc2UgdGhlcmUgYXJlIGFy
Z3VtZW50cyBvdmVyIGhvdyB0byBmaXggdGhpcywgYnV0IHdlICh0aGUgWGVuCj4+PiBjb21tdW5p
dHkpIGhhdmUgYWxyZWFkeSBmKmNrZWQgdXAgb25jZSBoZXJlLCBhbmQgdGhpcyBpcyBkb2luZyBz
byBhCj4+PiBzZWNvbmQgdGltZS4KPj4+Cj4+PiBOYWNrLgo+Pj4KPj4+IEZpeGluZyBpdCBhbnl3
aGVyZSBvdGhlciB0aGFuIFhlbiBpcyBzaW1wbHkgbm90IGFwcHJvcHJpYXRlLgo+IAo+IChyZXBs
eWluZyBoZXJlLCBiZWNhdXNlIHRoZSBvcmlnaW5hbCBtYWlsIGRvZXNuJ3Qgc2VlbSB0byBoYXZl
Cj4gbWFkZSBpdCBpbnRvIG15IGluYm94KQo+IAo+IEkndmUgc2FpZCBzbyB0byBTZXJnZXkgYWxy
ZWFkeSBvbiB2MTogVGhlICJmaXgiIHlvdSB3YW50IG5lZWRzIHRvCj4gYmUgYXQgb3IgY2xvc2Vy
IHRvIHRoZSBwcmVzZW50YXRpb24gbGF5ZXIuIEZyb20gWGVuJ3MgcGVyc3BlY3RpdmUKPiB0aGUg
cmVxdWVzdCBmb3IgaW5mb3JtYXRpb24gd2FzIF9pbmRlZWRfIGRlbmllZC4KPiAKPj4+IFRoZSBy
ZWFzb24gZm9yIHRoaXMgKHdoaWNoIG91Z2h0IHRvIGJlIG9idmlvdXMsIGJ1dCBJIGd1ZXNzIG9u
bHkgdG8KPj4+IHRob3NlIHdobyBhY3R1YWxseSBkbyBjdXN0b21lciBzdXBwb3J0KSBpcyBiYXNp
YyBodW1hbiBwaHlzaW9sb2d5Lgo+Pj4gImRlbmllZCIgbWVhbnMgc29tZXRoaW5nIGhhcyBnb25l
IHdyb25nLsKgIEl0IHNjYXJlcyBwZW9wbGUsIGFuZCBjYXVzZXMKPj4+IHRoZW0gdG8gc2VlayBo
ZWxwIHRvIGNoYW5nZSBmaXggd2hhdGV2ZXIgaXMgYnJva2VuLgo+Pgo+PiBUaGlzIHNlZW1zIGxp
a2UgYSByZWFzb25hYmxlIGFyZ3VtZW50IHRoYXQgIjxkZW5pZWQ+IiBjYXVzZXMgaXNzdWVzLgo+
PiBCdXQgdGhhdCBkb2Vzbid0IGNoYW5nZSB0aGUgZmFjdCB0aGF0ICIiIGFsc28gY2F1c2VzIGlz
c3Vlcy4KPj4KPj4gV2hhdCBhYm91dCBjaGFuZ2luZyB0aGUgc3RyaW5nIHRvICI8YnVpbGQtaWQg
aGlkZGVuPiIgb3Igc29tZXRoaW5nIGxpa2UKPj4gdGhhdD8gIFRoYXQgbWFrZXMgaXQgbW9yZSBj
bGVhciB3aGF0IHdvdWxkIGhhdmUgYmVlbiBpbiB0aGF0IHBsYWNlLCBhbmQKPj4gImhpZGRlbiIg
aXMgYSBsb3QgbGVzcyBzY2FyeSB0aGFuICJkZW5pZWQiLgo+IAo+IEkgY291bGQgbGl2ZSB3aXRo
IHRoaXMuIEJ1dCAoanVkZ2luZyBmcm9tIHRoZSBwaWN0dXJlIHRoYXQgd2FzCj4gcHJvdmlkZWQg
ZWFybGllciBvbikgaXQgd291bGQgc3RpbGwgcmVxdWlyZSBmaWx0ZXJpbmcgYXQgb3IgY2xvc2UK
PiB0byB0aGUgcHJlc2VudGF0aW9uIGxheWVyLCBhbmQgYnkgY2hhbmdpbmcgdGhlIHByaW9yIDxk
ZW5pZWQ+IHRvCj4gZGlmZmVyZW50IGFuZCB2YXJ5aW5nIHN0cmluZ3MgbWF5IG1ha2UgdGhhdCBq
b2IgaGFyZGVyIChhbGJlaXQKPiBwZXJoYXBzIHRoZXkgY291bGQgbG9vayBmb3IgYW55IDwuLi4+
KS4KCkknZCBnbyB3aXRoICI8aGlkZGVuPiIgb3IgIjxOSUw+Ii4gIjxidWlsZC1pZCBoaWRkZW4+
IiBhcyB2YWx1ZSBmb3IgdGhlCmJ1aWxkLWlkIGlzIHNpbWlsYXIgdG8gIkxDRC1kaXNwbGF5Ii4g
QW5kIGl0IHdpbGwgY2VydGFpbmx5IG5vdCBiZSB0aGUKY29ycmVjdCB2YWx1ZSBmb3Igb3RoZXIg
aGlkZGVuIGl0ZW1zLiA6LSkKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
