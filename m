Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4BD6CB75
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 11:04:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho2H7-0004RH-QI; Thu, 18 Jul 2019 09:00:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6kuv=VP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ho2H6-0004RC-Nr
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 09:00:28 +0000
X-Inumbo-ID: 7bb5c336-a93a-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7bb5c336-a93a-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 09:00:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9311FAF78;
 Thu, 18 Jul 2019 09:00:24 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Sarah Newman <srn@prgmr.com>,
 "Foerster, Leonard" <foersleo@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1563217075.6815.14.camel@amazon.com>
 <86e560c4-5a14-75fd-8b06-a77e66a8f0a5@prgmr.com>
 <35baad47-f22c-2378-a7a5-f0c48c3eafb8@suse.com>
 <aca2e606-17fa-6266-1e9c-1989d4da6217@prgmr.com>
 <9d6fc9d6-f63a-ae65-bbfa-5e489fda9acf@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <5274084e-ea01-8c61-5ca5-75bbe7ea987a@suse.com>
Date: Thu, 18 Jul 2019 11:00:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9d6fc9d6-f63a-ae65-bbfa-5e489fda9acf@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] Design session report: Live-Updating Xen
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMTkgMDA6MjcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTYvMDcvMjAxOSAw
NToyMCwgU2FyYWggTmV3bWFuIHdyb3RlOgo+PiBPbiA3LzE1LzE5IDg6NDggUE0sIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAxNS4wNy4xOSAyMTozMSwgU2FyYWggTmV3bWFuIHdyb3RlOgo+
Pj4+IE9uIDcvMTUvMTkgMTE6NTcgQU0sIEZvZXJzdGVyLCBMZW9uYXJkIHdyb3RlOgo+Pj4+IC4u
Lgo+Pj4+PiBBIGtleSBjb3JuZXJzdG9uZSBmb3IgTGl2ZS11cGRhdGUgaXMgZ3Vlc3QgdHJhbnNw
YXJlbnQgbGl2ZSBtaWdyYXRpb24KPj4+PiAuLi4KPj4+Pj4gIMKgwqDCoMKgLT4gZm9yIGxpdmUg
bWlncmF0aW9uOiBkb21pZCBpcyBhIHByb2JsZW0gaW4gdGhpcyBjYXNlCj4+Pj4+ICDCoMKgwqDC
oMKgwqDCoCAtPiByYW5kb21pemUgYW5kIHByYXkgZG9lcyBub3Qgd29yayBvbiBzbWFsbGVyIGZs
ZWV0cwo+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgLT4gdGhpcyBpcyBub3QgYSBwcm9ibGVtIGZvciBs
aXZlLXVwZGF0ZQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgLT4gQlVUOiBhcyBhIGNvbW11bml0eSB3
ZSBzaG91ZGwgbWFrZSB0aGlzIHJlc3RyaWN0aW9uIGdvIGF3YXkKPj4+Pgo+Pj4+IEFuZHJldyBD
b29wZXIgcG9pbnRlZCBvdXQgdG8gbWUgdGhhdCBtYW51YWxseSBhc3NpZ25pbmcgZG9tYWluIElE
cwo+Pj4+IGlzIHN1cHBvcnRlZCBpbiBtdWNoIG9mIHRoZSBjb2RlIGFscmVhZHkuIElmIGd1ZXN0
IHRyYW5zcGFyZW50IGxpdmUKPj4+PiBtaWdyYXRpb24gZ2V0cyBtZXJnZWQsIHdlJ2xsIGxvb2sg
YXQgcGFzc2luZyBpbiBhIGRvbWFpbiBJRCB0byB4bCwKPj4+PiB3aGljaCB3b3VsZCBiZSBnb29k
IGVub3VnaCBmb3IgdXMuIEkgZG9uJ3Qga25vdyBhYm91dCB0aGUgb3RoZXIKPj4+PiB0b29sc3Rh
Y2tzLgo+Pj4KPj4+IFRoZSBtYWluIHByb2JsZW0gaXMgdGhlIGNhc2Ugd2hlcmUgb24gdGhlIHRh
cmdldCBob3N0IHRoZSBkb21pZCBvZiB0aGUKPj4+IG1pZ3JhdGVkIGRvbWFpbiBpcyBhbHJlYWR5
IGluIHVzZSBieSBhbm90aGVyIGRvbWFpbi4gU28geW91IGVpdGhlciBuZWVkCj4+PiBhIGRvbWlk
IGFsbG9jYXRvciBzcGFubmluZyBhbGwgaG9zdHMgb3IgdGhlIGNoYW5nZSBvZiBkb21pZCBkdXJp
bmcKPj4+IG1pZ3JhdGlvbiBtdXN0IGJlIGhpZGRlbiBmcm9tIHRoZSBndWVzdCBmb3IgZ3Vlc3Qg
dHJhbnNwYXJlbnQgbWlncmF0aW9uLgo+Pgo+PiBZZXMuIFRoZXJlIGFyZSBzb21lIGNsdXN0ZXIg
bWFuYWdlbWVudCBzeXN0ZW1zIHdoaWNoIHVzZSB4bCByYXRoZXIKPj4gdGhhbiB4YXBpLgo+PiBU
aGV5IGNvdWxkIGJlIGV4dGVuZGVkIHRvIG1hbmFnZSBkb21haW4gSURzIGlmIGl0J3MgdG9vIGRp
ZmZpY3VsdCB0bwo+PiBhbGxvdwo+PiB0aGUgZG9tYWluIElEIHRvIGNoYW5nZSBkdXJpbmcgbWln
cmF0aW9uLgo+IAo+IEZvciBhIHYxIGZlYXR1cmUsIGhhdmluZyBhIHJlc3RyaWN0aW9uIG9mICJ5
b3UgbXVzdCBtYW5hZ2UgZG9taWRzIGFjcm9zcwo+IHRoZSBjbHVzdGVyIiBpcyBhIGZpbmUuwqAg
R3Vlc3QtdHJhbnNwYXJlbnQgbWlncmF0aW9uIGlzIGEgdmVyeSBpbXBvcnRhbnQKPiBmZWF0dXJl
LCBhbmQgb25lIHdoZXJlIHdlIGFyZSBsYWNraW5nIGluIHJlbGF0aW9uIHRvIG90aGVyIGh5cGVy
dmlzb3JzLgo+IAo+IExvbmdlciB0ZXJtLCB3ZSBhcyB0aGUgWGVuIGNvbW11bml0eSBuZWVkIHRv
IGZpZ3VyZSBvdXQgYSB3YXkgdG8gcmVtb3ZlCj4gdGhlIGRlcGVuZGVuY3kgb24gZG9taWRzLCBh
dCB3aGljaCBwb2ludCB0aGUgY2x1c3Rlci13aWRlIG1hbmFnZW1lbnQKPiByZXN0cmljdGlvbiBj
YW4gYmUgZHJvcHBlZC7CoCBUaGlzIGlzbid0IGdvaW5nIHRvIGJlIGEgdHJpdmlhbCB0YXNrLCBi
dXQKPiBpdCB3aWxsIGJlIGEgd29ydGh3aGlsZSBvbmUuCgpBbm90aGVyIHByb2JsZW0gYXJlIFhl
bnN0b3JlIHdhdGNoZXMuIFdpdGggZ3Vlc3QgdHJhbnNwYXJlbnQgTE0gdGhleSBhcmUKbG9zdCB0
b2RheSBhcyB0aGVyZSBpcyBjdXJyZW50bHkgbm8gd2F5IHRvIG1pZ3JhdGUgdGhlbSB0byB0aGUg
dGFyZ2V0IApYZW5zdG9yZS4KCkxpdmUtVXBkYXRlIGNvdWxkIHdvcmsgYXJvdW5kIHRoaXMgaXNz
dWUgdmlhIFhlbnN0b3JlLXN0dWJkb20uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
