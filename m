Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9236E650
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:27:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSs6-0001hm-G6; Fri, 19 Jul 2019 13:24:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9X78=VQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hoSs4-0001hh-Lh
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:24:24 +0000
X-Inumbo-ID: 85fbfb02-aa28-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 85fbfb02-aa28-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:24:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33FEB337;
 Fri, 19 Jul 2019 06:24:23 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81F143F71A;
 Fri, 19 Jul 2019 06:24:21 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
 <27973ea5-a0d4-0ca4-fd3f-9680f179b283@arm.com>
 <CABfawhk4TzQemnG+3XwtQ4SGmquufOd4nFGajEWJJ++YFuqfZw@mail.gmail.com>
 <a0c71023-2546-d7c4-771c-02a944c93d90@arm.com>
 <CABfawhm+e4YfnPGT9K-aWqipAFJp1tqfFr9dNDm6g0Twb2gGoA@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d9f6faf8-c784-7998-e184-19702a625ca9@arm.com>
Date: Fri, 19 Jul 2019 14:24:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CABfawhm+e4YfnPGT9K-aWqipAFJp1tqfFr9dNDm6g0Twb2gGoA@mail.gmail.com>
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpPbiAxOS8wNy8yMDE5IDE0OjE0LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgNzoxMSBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPj4KPj4gSGkgVGFtYXMsCj4+Cj4+IE9uIDE5LzA3LzIwMTkgMTQ6
MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+IE9uIEZyaSwgSnVsIDE5LCAyMDE5IGF0IDI6
NDMgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+
PiBIaSBUYW1hcywKPj4+Pgo+Pj4+IE9uIDE4LzA3LzIwMTkgMTg6NDgsIFRhbWFzIEsgTGVuZ3ll
bCB3cm90ZToKPj4+Pj4+ICAgICAgIC0gTGluZSAxMDI1OiBUaGUgdG9vbHMgbmVlZHMgdG8gYmUg
YWJsZSB0byBkZWFsIGZvcl9lYWNoX3ZjcHUoLi4uKSAmIGNvLgo+Pj4+Pgo+Pj4+PiBUaGVzZSBj
YW4gYmUgbWFkZSBPSyBieSBhZGRpbmcgYnJhY2VzLiBPdGhlciB0aGFuIHRoYXQgdGhlIG9ubHkg
d2F5IEkKPj4+Pj4gZm91bmQgdG8gbWFrZSBpdCBub3QgY2hhbmdlIHRoZSBpbmRlbnRhdGlvbiBp
cyB0byBhZGQgdGhlIGNvbW1lbnQgIi8qCj4+Pj4+ICpJTkRFTlQtT0ZGKiAqLyIgYmVmb3JlIHRo
ZSBibG9jayBhbmQgIi8qICpJTkRFTlQtT04qICovIiBhZnRlcndhcmRzLgo+Pj4+Cj4+Pj4gTm9u
ZSBvZiB0aGVtIGxvb2tzIHJlYWxseSBhcHBlYWxpbmcgYmVjYXVzZSBpdCBtZWFucyBhc3R5bGUg
d2lsbCBub3QgY29ycmVjdGx5Cj4+Pj4gaW5kZW50IGlmIHRoZSB1c2VyIGRvZXMgbm90IGFkZCBi
cmFjZXMgb3IgY29tbWVudHMuCj4+Pj4KPj4+PiBDb3VsZCBhc3R5bGUgYmUgZWFzaWx5IG1vZGlm
aWVkIHRvIHJlY29nbml6ZSBmb3JlYWNoIG1hY3Jvcz8KPj4+Cj4+PiBOb3QgdGhhdCBJJ20gYXdh
cmUgb2YuIElmIHlvdSBkb24ndCB3YW50IHRvIG1hbnVhbGx5IGFubm90YXRlIGZpbGVzCj4+PiB3
aXRoIHVuc3VwcG9ydGVkIG1hY3JvcyB0aGVuIGp1c3QgZXhjbHVkZSB0aG9zZSBmaWxlcyBmcm9t
IGFzdHlsZS4gSQo+Pj4gd291bGRuJ3QgcmVjb21tZW5kIGFkZGluZyB0aGlzIHRvIHRoZSBDSSBm
b3IgYWxsIGZpbGVzLCBvbmx5IGZvciB0aG9zZQo+Pj4gdGhhdCB0aGVpciByZXNwZWN0aXZlIG1h
aW50YWluZXJzIGhhdmUgY29uZmlybWVkIHRvIGNvbmZvcm0gdG8gdGhlCj4+PiBzdHlsZSBhbmQg
d2FudCB0byBlbmZvcmNlIGl0IGdvaW5nIGZvcndhcmQuCj4+Cj4+IFNvIGEgY291cGxlIHVzZSBv
ZiBhbiB1bnN1cHBvcnRlZCBtYWNyb3Mgd291bGQgbWFrZSBpbXBvc3NpYmxlIHRvIGVuZm9yY2Ug
dGhlCj4+IGNvZGluZyBzdHlsZS4gVGhpcyBpcyBub3QgYSB2ZXJ5IGlkZWFsIHBvc2l0aW9uIHRv
IGJlIGluLgo+Pgo+PiBfaWZfIHdlIGFyZSBnb2luZyB0byBhZG9wdCBhc3R5bGUgdGhlbiB3ZSBu
ZWVkIHRvIGJlIGFibGUgdG8gZW5mb3JjZSBpdCBvbiBldmVyeQo+PiBYZW4gZmlsZXMgbG9uZy10
ZXJtLiBJZiBpdCBpcyBub3QgcG9zc2libGUgdG8gZG8gaXQgd2l0aCBhc3R5bGUsIHRoZW4gbWF5
YmUgdGhpcwo+PiBpcyBub3QgdGhlIHJpZ2h0IHRvb2wgdG8gdXNlLgo+Pgo+PiBGb3IgaW5zdGFu
Y2UsIEkga25vdyB0aGF0IHRvb2xzIHN1Y2ggYXMgY2xhbmctZm9ybWF0IGlzIGFibGUgdG8gZGVh
bCB3aXRoCj4+IGZvcmVhY2ggbWFjcm9zLgo+IAo+IElmIHRoZXJlIGFyZSBiZXR0ZXIgdG9vbHMg
dGhlbiBzdXJlLCBJIGRvbid0IHJlYWxseSBtaW5kIHVzaW5nCj4gc29tZXRoaW5nIGVsc2UuIEkg
anVzdCBkb24ndCBoYXZlIHRpbWUgdG8gZG8gdGhlIG1hbnVhbCBzdHlsZSBjaGVjawo+IGJhY2st
YW5kLWZvcnRoIGFueW1vcmUsIHNvIHRoZSBzb29uZXIgd2UgaGF2ZSBzb21ldGhpbmcgaW4gcGxh
Y2UgdGhlCj4gYmV0dGVyLgoKSSB0b3RhbGx5IGFncmVlIHdlIG5lZWQgYSB0b29sIHNvIHRoZSBy
ZXZpZXdlciBjYW4gZnJlZS11cCBzb21lIHRpbWUgdG8gZm9jdXMgb24gCm1vcmUgaW1wb3J0YW50
IHRoaW5ncy4gSG93ZXZlciwgSSB0aGluayB3ZSBzaG91bGQgYmUgY2FyZWZ1bCBvbiB3aGF0IHdl
IGFkb3B0IGhlcmUuCgpTaW1pbGFyIHRvIEFuZHJldywgSSBhbSBvcGVuIHdpdGggbW9kaWZ5aW5n
IHRoZSBjb2Rpbmcgc3R5bGUgdG8gaGVscCB0aGUgCmF1dG9tYXRpYyBzdHlsZSBjaGVjay4gQnV0
IEkgYW0gbm90IGhhcHB5IHRvIGRpc2FibGUgYXV0b21hdGljIHN0eWxlIG9uIHBhcnQgKG9yIApl
bnRpcmUpIG9mIGZpbGVzIGZvcmV2ZXIuCgpBdCB0aGUgbW9tZW50LCBjbGFuZy1mb3JtYXQgZmVl
bHMgbW9yZSBwb3dlcmZ1bCBhbmQgdGhlcmUgYXJlIHBlb3BsZSB3b3JraW5nIG9uIGl0LgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
