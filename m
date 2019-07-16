Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539746A0F8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 05:50:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnES9-00026A-Cr; Tue, 16 Jul 2019 03:48:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YMz1=VN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hnES7-000265-R3
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 03:48:31 +0000
X-Inumbo-ID: 92e03fa0-a77c-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 92e03fa0-a77c-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 03:48:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CBB0FB0AE;
 Tue, 16 Jul 2019 03:48:28 +0000 (UTC)
To: Sarah Newman <srn@prgmr.com>, "Foerster, Leonard" <foersleo@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1563217075.6815.14.camel@amazon.com>
 <86e560c4-5a14-75fd-8b06-a77e66a8f0a5@prgmr.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <35baad47-f22c-2378-a7a5-f0c48c3eafb8@suse.com>
Date: Tue, 16 Jul 2019 05:48:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <86e560c4-5a14-75fd-8b06-a77e66a8f0a5@prgmr.com>
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

T24gMTUuMDcuMTkgMjE6MzEsIFNhcmFoIE5ld21hbiB3cm90ZToKPiBPbiA3LzE1LzE5IDExOjU3
IEFNLCBGb2Vyc3RlciwgTGVvbmFyZCB3cm90ZToKPiAuLi4KPj4gQSBrZXkgY29ybmVyc3RvbmUg
Zm9yIExpdmUtdXBkYXRlIGlzIGd1ZXN0IHRyYW5zcGFyZW50IGxpdmUgbWlncmF0aW9uCj4gLi4u
Cj4+IMKgwqDCoMKgLT4gZm9yIGxpdmUgbWlncmF0aW9uOiBkb21pZCBpcyBhIHByb2JsZW0gaW4g
dGhpcyBjYXNlCj4+IMKgwqDCoMKgwqDCoMKgIC0+IHJhbmRvbWl6ZSBhbmQgcHJheSBkb2VzIG5v
dCB3b3JrIG9uIHNtYWxsZXIgZmxlZXRzCj4+IMKgwqDCoMKgwqDCoMKgIC0+IHRoaXMgaXMgbm90
IGEgcHJvYmxlbSBmb3IgbGl2ZS11cGRhdGUKPj4gwqDCoMKgwqDCoMKgwqAgLT4gQlVUOiBhcyBh
IGNvbW11bml0eSB3ZSBzaG91ZGwgbWFrZSB0aGlzIHJlc3RyaWN0aW9uIGdvIGF3YXkKPiAKPiBB
bmRyZXcgQ29vcGVyIHBvaW50ZWQgb3V0IHRvIG1lIHRoYXQgbWFudWFsbHkgYXNzaWduaW5nIGRv
bWFpbiBJRHMgaXMgCj4gc3VwcG9ydGVkIGluIG11Y2ggb2YgdGhlIGNvZGUgYWxyZWFkeS4gSWYg
Z3Vlc3QgdHJhbnNwYXJlbnQgbGl2ZSAKPiBtaWdyYXRpb24gZ2V0cyBtZXJnZWQsIHdlJ2xsIGxv
b2sgYXQgcGFzc2luZyBpbiBhIGRvbWFpbiBJRCB0byB4bCwgd2hpY2ggCj4gd291bGQgYmUgZ29v
ZCBlbm91Z2ggZm9yIHVzLiBJIGRvbid0IGtub3cgYWJvdXQgdGhlIG90aGVyIHRvb2xzdGFja3Mu
CgpUaGUgbWFpbiBwcm9ibGVtIGlzIHRoZSBjYXNlIHdoZXJlIG9uIHRoZSB0YXJnZXQgaG9zdCB0
aGUgZG9taWQgb2YgdGhlCm1pZ3JhdGVkIGRvbWFpbiBpcyBhbHJlYWR5IGluIHVzZSBieSBhbm90
aGVyIGRvbWFpbi4gU28geW91IGVpdGhlciBuZWVkCmEgZG9taWQgYWxsb2NhdG9yIHNwYW5uaW5n
IGFsbCBob3N0cyBvciB0aGUgY2hhbmdlIG9mIGRvbWlkIGR1cmluZwptaWdyYXRpb24gbXVzdCBi
ZSBoaWRkZW4gZnJvbSB0aGUgZ3Vlc3QgZm9yIGd1ZXN0IHRyYW5zcGFyZW50IG1pZ3JhdGlvbi4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
