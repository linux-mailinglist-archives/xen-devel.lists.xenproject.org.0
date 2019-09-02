Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC258A4D33
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 03:59:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4bXQ-0005Tn-PJ; Mon, 02 Sep 2019 01:53:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3NRn=W5=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1i4bXQ-0005Ti-4a
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 01:53:48 +0000
X-Inumbo-ID: 7ec4d4a6-cd24-11e9-ac23-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ec4d4a6-cd24-11e9-ac23-bc764e2007e4;
 Mon, 02 Sep 2019 01:53:46 +0000 (UTC)
Received: from lamp.crc.id.au (lamp.crc.id.au [IPv6:2407:e400:b000:200::8e8e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 04F2120008F;
 Mon,  2 Sep 2019 11:53:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1567389223; bh=7tSib4h1uXOsFGoESWQGTWVBt4eLcTLhcZaKq8ImC3g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=eDykAGXAUEkseHglv2Rfrq8Z3+1cWHZjJewLSmf64RqZTcFD4puMM27AhOliJXvMB
 Y2P8PHrDL6cO0yUuUn3w9cRCG155xQEZTnxb735SLxt9Lvj1xuwFS9Gu8dBL64tmKL
 hP+RM40HNQRqbZCK7SLINZn6fwvz5RsYc5WSCmi0=
MIME-Version: 1.0
Date: Mon, 02 Sep 2019 11:53:42 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: Andreas Kinzler <hfp@posteo.de>
In-Reply-To: <71fad1413643be2df5f2291270b60448@crc.id.au>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
 <1dfc79fa-acde-40af-704d-be3289fdd133@posteo.de>
 <71fad1413643be2df5f2291270b60448@crc.id.au>
User-Agent: Roundcube Webmail/1.4-rc1
Message-ID: <cbbfaf3c5d4e12358c635054198bce17@crc.id.au>
X-Sender: netwiz@crc.id.au
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
 (and 3900X)
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul.Durrant@citrix.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wOS0wMiAxMTo0MiwgU3RldmVuIEhhaWdoIHdyb3RlOgo+IE9uIDIwMTktMDgtMjEg
MDY6NTcsIEFuZHJlYXMgS2luemxlciB3cm90ZToKPj4gT24gMjAuMDguMjAxOSAyMjozOCwgQW5k
cmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDIwLzA4LzIwMTkgMjE6MzYsIEFuZHJlYXMgS2luemxl
ciB3cm90ZToKPj4+PiBPbiAyMC4wOC4yMDE5IDIwOjEyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
Pj4+Pj4gWGVuIHZlcnNpb24gNC4xMC4yLiBkb20wIGtlcm5lbCA0LjEzLjE2LiBUaGUgQklPUyB2
ZXJzaW9uIGlzIAo+Pj4+Pj4gdW5jaGFuZ2VkCj4+Pj4+PiBmcm9tIDI3MDBYICh3b3JraW5nKSB0
byAzNzAwWCAoY3Jhc2hpbmcpLgo+Pj4+PiBTbyB5b3UndmUgZG9uZSBhIFplbiB2MSA9PiBaZW4g
djIgQ1BVIHVwZ3JhZGUgYW5kIGFuIGV4aXN0aW5nIAo+Pj4+PiBzeXN0ZW0/Cj4+Pj4gV2l0aCAi
ZXhpc3Rpbmcgc3lzdGVtIiB5b3UgbWVhbiB0aGUgV2luZG93cyBpbnN0YWxsYXRpb24/Cj4+PiBJ
IG1lYW50IHNhbWUgY29tcHV0ZXIsIG5vdCBzYW1lIFZNLgo+PiAKPj4gVHJpZWQgd2l0aCAyIG1h
aW5ib2FyZHM6IEFzcm9jayBYMzcwIFBybzQgYW5kIEFzcm9ja1JhY2sgWDQ3MEQ0VS4KPj4gWW91
IG5lZWQgdG8gZmxhc2ggdGhlIEJJT1MgZm9yIFplbjIuIFg0NzBENFUgQklPUyAzLjEgd29ya3Mg
d2l0aCAyNzAwWAo+PiBidXQgbm90IHdpdGggMzcwMFguIFgzNzAgUHJvNCB3aXRoIHNvbWV3aGF0
IG9sZGVyIEJJT1Mgd29ya2VkIGZvcgo+PiAyNzAwWCBhbmQgZG9lcyBub3Qgd29yayB3aXRoIGN1
cnJlbnQgKDYuMDApIEJJT1MgYW5kIDM3MDBYLgo+PiAKPj4+PiBZZXMsIGJ1dCBpdCBpcyBub3Qg
cmVsZXZhbnQuIFRoZSBzYW1lIEJTT0RzIGhhcHBlbiBpZiB5b3UgYm9vdCB0aGUgCj4+Pj4gSFZN
Cj4+Pj4gd2l0aCBqdXN0IHRoZSBpc28gaW5zdGFsbGF0aW9uIG1lZGl1bSBhbmQgbm8gZGlza3Mu
Cj4+PiBUaGF0J3MgYSB1c2VmdWwgZGF0YXBvaW50LsKgIEkgd291bGRuJ3QgZXhwZWN0IHRoaXMg
dG8gYmUgcmVsZXZhbnQsIAo+Pj4gZ2l2ZW4KPj4+IGhvdyBXaW5kb3cncyBIQUwgd29ya3MuCj4+
IAo+PiBJdCBzaG91bGQgbWFrZSBkZWJ1Z2dpbmcgZm9yIHlvdSBxdWl0ZSAic2ltcGxlIiBiZWNh
dXNlIGl0IGNhbiBiZQo+PiByZXByb2R1Y2VkIHZlcnkgZWFzaWx5Lgo+IAo+IEp1c3QgdG8gYWRk
IGEgZGF0YSBwb2ludCB0byB0aGlzIC0gSSBhbHNvIHNlZSB0aGlzIHByb2JsZW0gb24gYSBSeXpl
biA5IAo+IDM5MDB4Lgo+IAo+IHhsIGRtZXNnIHNob3dzOgo+IChYRU4pIGQydjAgVklSSURJQU4g
Q1JBU0g6IGFjIDAgYTBhMCBmZmZmZjgwMjkzMjU0NzUwIGFlYQo+IChYRU4pIGQzdjAgVklSSURJ
QU4gQ1JBU0g6IGFjIDAgYTBhMCBmZmZmZjgwMDkzYTQwNzUwIGFlYQo+IChYRU4pIGQ1djAgVklS
SURJQU4gQ1JBU0g6IGFjIDAgYTBhMCBmZmZmZjgwMjhlNDIyMzUwIGFlYQo+IChYRU4pIGQ2djAg
VklSSURJQU4gQ1JBU0g6IGFjIDAgYTBhMCBmZmZmZjgwMzA5NDMxNzUwIGFlYQo+IChYRU4pIGQx
MHYwIFZJUklESUFOIENSQVNIOiBhYyAwIGEwYTAgZmZmZmY4MDEyODIzZTc1MCBhZWEKPiAoWEVO
KSBkMTF2MCBWSVJJRElBTiBDUkFTSDogYWMgMCBhMGEwIGZmZmZmODAzMmU2NTczNTAgYWVhCj4g
Cj4gV2luZG93cyB1c3VhbGx5IGhhcyBhIHN0b3Bjb2RlIG9mICJIQUwgTUVNT1JZIEFMTE9DQVRJ
T04iIHdoZW4gaXQgYmx1ZSAKPiBzY3JlZW5zLgo+IAo+IEZyb20geGwgaW5mbzoKPiBod19jYXBz
ICAgICAgICAgICAgICAgIDoKPiAxNzhiZjNmZjpmNmQ4MzIwYjoyZTUwMDgwMDoyNDQwMzdmZjow
MDAwMDAwZjoyMTljOTFhOTowMDQwMDAwNDowMDAwMDUwMAo+IHZpcnRfY2FwcyAgICAgICAgICAg
ICAgOiBodm0gaHZtX2RpcmVjdGlvCj4geGVuX3ZlcnNpb24gICAgICAgICAgICA6IDQuMTEuMgo+
IHhlbl9jYXBzICAgICAgICAgICAgICAgOiB4ZW4tMy4wLXg4Nl82NCB4ZW4tMy4wLXg4Nl8zMnAg
aHZtLTMuMC14ODZfMzIKPiBodm0tMy4wLXg4Nl8zMnAgaHZtLTMuMC14ODZfNjQKPiAKPiBJcyB0
aGVyZSBhbnkgZnVydGhlciBpbmZvIHRoYXQgY2FuIGJlIHByb3ZpZGVkPyBOb3QgYmVpbmcgYWJs
ZSB0bwo+IHZpcnR1YWxpc2UgV2luZG93cyBpcyBhIGJpdCBvZiBhIFBJVEEuLi4KCkZ1cnRoZXIg
dG8gdGhlIGFib3ZlLCBJIGRpZCBzb21lIGV4cGVyaW1lbnRhdGlvbi4gVGhlIGZvbGxvd2luZyBp
cyBhIApsaXN0IG9mIGF0dGVtcHRlZCBib290IGNvbmZpZ3VyYXRpb25zIGFuZCB0aGVpciBvdXRj
b21lczoKCnZpcmlkaWFuPTEKdmNwdXM9NApTVE9QQ09ERTogSEFMIE1FTU9SWSBBTExPQ0FUSU9O
Cgp2aXJpZGlhbj0wCnZjcHVzPTQKU1RPUENPREU6IE1VTFRJUFJPQ0VTU09SX0NPTkZJR1VSQVRJ
T05fTk9UX1NVUFBPUlRFRAoKdmlyaWRpYW49MAp2Y3B1cz0xCkJvb3QgT0sgLSBnZXQgdG8gV2lu
ZG93cyBTZXJ2ZXIgMjAxNiBsb2dpbiBldGMKCkFzIHN1Y2gsIGl0IGxvb2tzIGxpa2UgaXRzIG5v
dCBhIGNvbXBsZXRlbHkgZmF0YWwgcHJvYmxlbSAtIGJ1dCBydW5uaW5nIApXaW5kb3dzIG9uIGEg
c2luZ2xlIHZjcHUgaXMuLi4uIHVucGxlYXNhbnQgOykKCi0tIApTdGV2ZW4gSGFpZ2gKCj8gbmV0
d2l6QGNyYy5pZC5hdSAgICAgPyBodHRwOi8vd3d3LmNyYy5pZC5hdQo/ICs2MSAoMykgOTAwMSA2
MDkwICAgID8gMDQxMiA5MzUgODk3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
