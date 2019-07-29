Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C5278C0C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:52:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs562-00028E-5D; Mon, 29 Jul 2019 12:49:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l3zY=V2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hs560-000289-QI
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:49:44 +0000
X-Inumbo-ID: 562997be-b1ff-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 562997be-b1ff-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 12:49:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF0FC28;
 Mon, 29 Jul 2019 05:49:42 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91E413F575;
 Mon, 29 Jul 2019 05:49:40 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
 <fc7cc403-889c-482c-3037-43eba2a7f80a@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <de9f1e4a-7923-40f8-9c3b-fab912aa250b@arm.com>
Date: Mon, 29 Jul 2019 13:49:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fc7cc403-889c-482c-3037-43eba2a7f80a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNy8yOS8xOSAxOjE5IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyNi4w
Ny4yMDE5IDE2OjQ5LCBWaWt0b3IgTWl0aW4gd3JvdGU6Cj4+IEhpIEp1bGllbiwgQWxsLAo+Pgo+
PiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCA2OjQ0IFBNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+IHdyb3RlOgo+Pj4KPj4+IEhpIFRhbWFzLAo+Pj4KPj4+IE9uIDcvMTgvMTkg
NDoxNCBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4+IE9uIFRodSwgSnVsIDE4LCAyMDE5
IGF0IDk6MDIgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+
Pj4+Cj4+Pj4+IEhpIFRhbWFzLAo+Pj4+Pgo+Pj4+PiBBZGRpbmcgTGFycywgQXJ0ZW0gYW5kIEl1
cmlpLiBJdXJpaSBoYXMgYmVlbiB3b3JraW5nIG9uIGEgdmVyc2lvbiBmb3IKPj4+Pj4gY2xhbmct
Zm9ybWF0IHJlY2VudGx5Lgo+Pj4+Pgo+Pj4+PiBPbiA3LzE4LzE5IDM6NDMgUE0sIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPj4+Pj4+IFVzaW5nIGFzdHlsZSAoaHR0cDovL2FzdHlsZS5zb3VyY2Vm
b3JnZS5uZXQpIGNhbiBncmVhdGx5IHJlZHVjZSB0aGUgb3ZlcmhlYWQgb2YKPj4+Pj4+IG1hbnVh
bGx5IGNoZWNraW5nIGFuZCBhcHBseWluZyBzdHlsZS1maXhlcyB0byBzb3VyY2UtY29kZS4gVGhl
IGluY2x1ZGVkCj4+Pj4+PiAuYXN0eWxlcmMgaXMgdGhlIGNsb3Nlc3QgYXBwcm94aW1hdGlvbiBv
ZiB0aGUgZXN0YWJsaXNoZWQgWGVuIHN0eWxlIChpbmNsdWRpbmcKPj4+Pj4+IHN0eWxlcyBub3Qg
Zm9ybWFsbHkgc3BlbGxlZCBvdXQgYnkgQ09ESU5HX1NUWUxFIGJ1dCBjb21tb25seSByZXF1ZXN0
ZWQpLgo+Pj4+Pj4KPj4+Pj4+IENoZWNraW5nIHRoZSBjb21tZW50IHN0eWxlcyBhcmUgbm90IGlu
Y2x1ZGVkIGluIHRoZSBhdXRvbWF0aW9uLgo+Pj4+Pj4KPj4+Pj4+IEluY29ycG9yYXRpbmcgWGVu
J3MgZXhjZXB0aW9uIHRvIHRoZSBkby13aGlsZSBzdHlsZSBpcyBvbmx5IHBhcnRpYWxseSBwb3Nz
aWJsZSwKPj4+Pj4+IHRodXMgYSBjaGFuZ2UgaXMgcHJvcG9zZWQgdG8gdGhlIENPRElOR19TVFlM
RSBvZiBtb3ZpbmcgdGhlIGJyYWNlIGZyb20gImRvIHsiCj4+Pj4+PiB0byB0aGUgbmV4dCBsaW5l
Lgo+Pj4+Pj4KPj4+Pj4+IE1vc3Qgb2YgWGVuJ3MgY29kZS1iYXNlIGlzIG5vbi1jb25mb3JtaW5n
IGF0IHRoZSBtb21lbnQ6IDI4OSBmaWxlcyBwYXNzCj4+Pj4+PiB1bmNoYW5nZWQsIDg3NiBoYXZl
IHNvbWUgc3R5bGUgaXNzdWUKPj4+Pj4+Cj4+Pj4+PiBJZGVhbGx5IHdlIGNhbiBzbG93bHkgbWln
cmF0ZSB0aGUgZW50aXJlIGNvZGUtYmFzZSB0byBiZSBjb25mb3JtaW5nLCB0aHVzCj4+Pj4+PiBl
bGltaW5hdGluZyB0aGUgbmVlZCBvZiBkaXNjdXNzaW5nIGFuZCBlbmZvcmNpbmcgc3R5bGUgaXNz
dWVzIG1hbnVhbGx5IG9uIHRoZQo+Pj4+Pj4gbWFpbGluZ2xpc3QuCj4+Pj4+Cj4+Pj4+IEkgcXVp
dGUgbGlrZSB0aGUgaWRlYSBvZiBhbiBhdXRvbWF0aWMgY29kaW5nIHN0eWxlIGNoZWNrZXIuIEhv
d2V2ZXIsIGl0Cj4+Pj4+IGlzIGEgYml0IGNvbmNlcm5pbmcgdGhhdCBub3QgZXZlbiBhIDEvMyBv
ZiB0aGUgZmlsZXMgYXJlIGFibGUgdG8gcGFzcwo+Pj4+PiB0aGUgY29kaW5nIHN0eWxlIHlvdSBz
dWdnZXN0LiBDb3VsZCB5b3UgZXhwbGFpbiB3aGV0aGVyIHRoaXMgaXMgYmVjYXVzZQo+Pj4+PiB0
aGUgZmlsZXMgZG9lcyBub3QgYWxyZWFkeSBmb2xsb3cgWGVuIGNvZGluZyBzdHlsZSBvciBpcyBp
dCBqdXN0IHRoZQo+Pj4+PiBkaWZmZXJlbmNlIHdpdGggYXN0eWxlPwo+Pj4+Pgo+Pj4+PiBXaGF0
IGFyZSB0aGUgbWFpbiBzdHlsZSBpc3N1ZXM/Cj4+Pj4KPj4+PiBMb29rcyBsaWtlIGEgbG90IG9m
IGZpbGVzIHRoYXQgZG9uJ3QgZm9sbG93IHRoZSBYZW4gY29kaW5nIHN0eWxlCj4+Pj4gYXMtaXMu
IEFsaWdubWVudCBpc3N1ZXMgc2VlbSB0byBtZSB0byBiZSB0aGUgbW9zdCBjb21tb24gZXJyb3Jz
LiBTZWUKPj4+PiB0aGUgZnVsbCBkaWZmIGhlcmU6Cj4+Pj4KPj4+PiBodHRwczovL2dpc3QuZ2l0
aHViLmNvbS90a2xlbmd5ZWwvYzVjYWMxNGEwZDU3ZjExOWRkNzc0N2ExYmU2ZmIyNjAKPj4+Pgo+
Pj4+IFdlIGNhbiBwZXJoYXBzIHR1bmUgc29tZSBhc3BlY3RzIG9mIGl0IHdlIGRpc2FncmVlIHdp
dGggdGhlIGFzdHlsZQo+Pj4+IGdlbmVyYXRlZCBzdHlsZSBhbmQgdHJ5IHRvIG92ZXJyaWRlIGl0
LiBJIGRpZCBteSBiZXN0IHRvIG1ha2UgaXQKPj4+PiBjb25mb3JtIHRvIHRoZSBleGlzdGluZyBY
ZW4gc3R5bGUgYnV0IGNlcnRhaW5seSB0aGVyZSBjb3VsZCBiZSBvdGhlcgo+Pj4+IHR3ZWFrcyBt
YWRlIHRvIHJlZHVjZSB0aGUgY2h1cm4uCj4+Pgo+Pj4gSSB0aGluayB3ZSBkZWZpbml0ZWx5IHdh
bnQgdG8gYXZvaWQgY2h1cm4gYXMgdGhpcyBpcyBnb2luZyB0byB0YWtlIGEgbG90Cj4+PiBvZiB0
aW1lIHRvIGZpeCBhbGwgdGhlIHBsYWNlcyB0byB0aGUgbmV3IGluZGVudGF0aW9uLgo+Pj4KPj4+
IEdvaW5nIHRocm91Z2ggdGhlIGRpZmYgSSBjYW4gc2VlIG1ham9yIGRpZmZlcmVuY2VzIHdpdGgg
dGhlIFhlbiBDb2RpbmcKPj4+IHN0eWxlIGFuZCBhbHNvIHdoYXQgbG9va3MgbGlrZSBpbmNvbnNp
c3RlbmNpZXMgZnJvbSB0aGUgdG9vbHMgaXRzZWxmOgo+Pj4gICAgICAtIExpbmUgNTg6IFRoaXMg
aXMgZmFpcmx5IGNvbW1vbiB0byBpbmRlbnQgdGhlIHBhcmFtZXRlcnMgYXMgaXQgaXMKPj4+IHRv
ZGF5LiBCdXQgdGhlbiBvbiBsaW5lIDE1OC8yNzIgaXQgaW5kZW50cyBhcyB3ZSBkbyB0b2RheS4g
U28gSSBhbSBub3QKPj4+IHN1cmUgd2hhdCB0aGUgZXhwZWN0ZWQgY29kaW5nIHN0eWxlIGZyb20g
dGhlIHRvb2xzLgo+Pj4gICAgICAtIExpbmUgNjc6IEkgYmVsaWV2ZSBKYW4gcmVxdWVzdCB0aGUg
c3BhY2UgYmVmb3JlIGxhYmVsCj4+IFNlZW1zIGFncmVlZCBub3QgdG8gYWRkIHRoZSBzcGFjZXMg
YmVmb3JlIGxhYmVsLiBSaWdodD8KPiAKPiBDZXJ0YWlubHkgbm90LCBhZmFpYS4gSSB3aWxsIG9i
amVjdCB0byBhbnkgd3JpdHRlbiBkb3duIHJ1bGUgZGlzYWxsb3dpbmcKPiBsZWFkaW5nIGJsYW5r
KHMpIGFsdG9nZXRoZXIuIEkgd2lsbCBhcmd1ZSBmb3IgbWFraW5nIG1hbmRhdG9yeSBhdCBsZWFz
dAo+IG9uZSBibGFuayBvZiBpbmRlbnRhdGlvbi4KCkNvZGluZyBzdHlsZSBhcmUgYSBtYXR0ZXIg
b2YgdGFzdGUuIElmIGV2ZXJ5b25lIGlzIGdvaW5nIHRvIHNheSAiSSB3YW50IAp0aGlzIGluIHRo
ZSBjb2Rpbmcgc3R5bGUiLCB0aGVuIHdlIGFyZSBnb2luZyB0byBzcGVuZCBjb3VudGxlc3Mgb2Yg
aG91cnMgCmJpa2Utc2hlZGRpbmcuIFRoaXMgaXMgbm90IGhvdyB3ZSBzaG91bGQgdXNlIG91ciBh
bHJlYWR5IGxpbWl0ZWQgdGltZS4KCklmIHdlIHdhbnQgdG8gcmUtdXNlIGV4aXN0aW5nIGNoZWNr
ZXIsIHRoZW4gd2Ugd2lsbCBtb3N0IGxpa2VseSBoYXZlIHRvIAptYWtlIHNvbWUgY29tcHJvbWlz
ZS4gSSBhbSBub3Qgc3VnZ2VzdGluZyB0aGlzIHNob3VsZCBiZSAob3Igbm90IGJlKSAKcGFydCBv
ZiB0aGUgY29tcHJvbWlzZXMuCgpDaGVlcnMsCgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
