Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBB82C1E0
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 10:56:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVXs9-00041v-5d; Tue, 28 May 2019 08:54:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVXs7-00041o-TA
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 08:54:15 +0000
X-Inumbo-ID: 2ad82fab-8126-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2ad82fab-8126-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 08:54:14 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 28 May 2019 02:54:13 -0600
Message-Id: <5CECF7300200007800232E9E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 28 May 2019 02:54:08 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-3-roger.pau@citrix.com>
 <cdc13026-212f-65a0-0fdf-a6bcb919de0e@citrix.com>
 <20190527160837.ilyt76lgcxtqqhgg@Air-de-Roger>
In-Reply-To: <20190527160837.ilyt76lgcxtqqhgg@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/5] pci: use function generation macros for
 pci_config_{write, read}<size>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA1LjE5IGF0IDE4OjA4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgTWF5IDI0LCAyMDE5IGF0IDEwOjI5OjI2QU0gKzAxMDAsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4+IE9uIDEwLzA1LzIwMTkgMTc6MTAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4g
PiBUaGlzIGF2b2lkcyBjb2RlIGR1cGxpY2F0aW9uIGJldHdlZW4gdGhlIGhlbHBlcnMuCj4+ID4K
Pj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPj4gPgo+PiA+IFNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiAKPj4gLTEuICBJ
IHNlZSB0aGlzIGFzIGFjdGl2ZWx5IG1ha2luZyB0aGUgY29kZSB3b3JzZSwgbm90IGFuIGltcHJv
dmVtZW50Lgo+IAo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLiBJJ20gbm90IHNwZWNpYWxseSB0
aHJpbGxlZCBlaXRoZXIgd2F5IChzZWVpbmcKPiBKYW4gcHJvdmlkZWQgaGlzIFJCKSwgdGhlIG1h
aW4gbW90aXZhdGlvbiBiZWhpbmQgdGhlIGNoYW5nZSB3YXMgdG8KPiBhdm9pZCBoYXZpbmcgdG8g
Y2hhbmdlIHRoZSBsaXN0IG9mIHBhcmFtZXRlcnMgdG8gYSBwY2lfc2JkZl90IGluIGVhY2gKPiBo
ZWxwZXIsIEkgZmluZCB0aGlzIGVycm9yIHByb25lIHdoZW4gdGhlIGNvZGUgaXMgdGhlIHNhbWUg
aW4gYWxsIDMKPiBkaWZmZXJlbnQgaGVscGVycyBleGNlcHQgZm9yIHRoZSBzaXplIGRpZmZlcmVu
Y2UuCj4gCj4gR2l2ZW4gQW5kcmV3J3Mgb3BpbmlvbiBkbyB5b3Ugc3RpbGwgY29uc2lkZXIgdGhp
cyB1c2VmdWwgSmFuPwoKV2VsbCwgbGV0IG1lIHB1dCBpdCB0aGF0IHdheTogSSdtIGZpbmUgd2l0
aCB0aGUgY2hhbmdlLCBidXQgSSdtIGFsc28KZmluZSB3aXRoIHRoZSBjb2RlIHN0YXlpbmcgYXMg
aXMsIHNlZWluZyBBbmRyZXcncyBvYmplY3Rpb24uCgpKYW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
