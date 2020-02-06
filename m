Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702E8153F65
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 08:51:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izbtf-0004Pe-LH; Thu, 06 Feb 2020 07:48:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ObBe=32=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1izbte-0004PZ-9d
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 07:48:22 +0000
X-Inumbo-ID: 0bb03228-48b5-11ea-8952-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bb03228-48b5-11ea-8952-bc764e2007e4;
 Thu, 06 Feb 2020 07:48:21 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1izbtW-000APf-2h; Thu, 06 Feb 2020 07:48:14 +0000
Date: Thu, 6 Feb 2020 07:48:14 +0000
From: Tim Deegan <tim@xen.org>
To: Julien Grall <julien@xen.org>
Message-ID: <20200206074814.GA39912@deinos.phlegethon.org>
References: <20200203165812.21089-1-julien@xen.org>
 <c39dd542-1748-066e-399f-dc110ac11e19@citrix.com>
 <53769c85-cc65-55ad-3538-339f51243079@xen.org>
 <52e15a69-3882-695a-2153-3ec1da6869b1@citrix.com>
 <78b64ea3-f9f4-cd34-9f05-e71ea355d1db@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78b64ea3-f9f4-cd34-9f05-e71ea355d1db@xen.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] [PATCH] xen/x86: p2m: Don't initialize slot 0 of
 the P2M
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgMTg6MzEgKzAwMDAgb24gMDMgRmViICgxNTgwNzU0NzExKSwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+IE9uIDAzLzAyLzIwMjAgMTc6MzcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gPiBPbiAyLzMv
MjAgNToyMiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4+IE9uIDAzLzAyLzIwMjAgMTc6MTAs
IEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gPj4+IE9uIDIvMy8yMCA0OjU4IFBNLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4gPj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+
ID4+Pj4KPiA+Pj4+IEl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB3aHkgdGhlIHNsb3QgMCBvZiBl
YWNoIHAybSBzaG91bGQgYmUgcG9wdWxhdGVkCj4gPj4+PiB3aXRoIGVtcHR5IHBhZ2UtdGFibGVz
LiBUaGUgY29tbWl0IGludHJvZHVjaW5nIGl0IDc1OWFmOGUzODAwICJbSFZNXQo+ID4+Pj4gRml4
IDY0LWJpdCBIVk0gZG9tYWluIGNyZWF0aW9uLiIgZG9lcyBub3QgY29udGFpbiBtZWFuaW5nZnVs
Cj4gPj4+PiBleHBsYW5hdGlvbiBleGNlcHQgdGhhdCBpdCB3YXMgbmVjZXNzYXJ5IGZvciBzaGFk
b3cuCj4gPj4+Cj4gPj4+IFRpbSwgYW55IGlkZWFzIGhlcmU/CgpBZnJhaWQgbm90LCBzb3JyeS4g
IEkgY2FuJ3QgdGhpbmsgd2hhdCB3b3VsZCByZWx5IG9uIHRoZSB0YWJsZXMgYmVpbmcKYWxsb2Nh
dGVkIGZvciBzbG90IDAgaW4gcGFydGljdWxhci4gIE1heWJlIHRoZXJlJ3Mgc29tZXRoaW5nIGxh
dGVyCnRoYXQgYWRkcyBvdGhlciBlbnRyaWVzIGluIHRoZSBib3R0b20gMk1CIGFuZCBjYW4ndCBo
YW5kbGUgYSB0YWJsZQphbGxvY2F0aW9uIGZhaWx1cmU/Cgo+ID4gQWxzbywgaXQncyBub3QgY2xl
YXIgdG8gbWUgd2hhdCBraW5kIG9mIGJ1ZyB0aGUgY29kZSB5b3UncmUgZGVsZXRpbmcKPiA+IHdv
dWxkIGZpeC4gIElmIHlvdSByZWFkIGEgbm90LXByZXNlbnQgZW50cnksIHlvdSBzaG91bGQgZ2V0
IElOVkFMSURfTUZOCj4gPiBhbnl3YXkuICBVbmxlc3MgeW91IHdlcmUgY2FsbGluZyBwMm1fZ2V0
X2VudHJ5X3F1ZXJ5KCksIHdoaWNoIEknbSBwcmV0dHkKPiA+IHN1cmUgaGFkbid0IGJlZW4gaW50
cm9kdWNlZCBhdCB0aGlzIHBvaW50Lgo+IAo+IEkgY2FuJ3QgZmluZCB0aGlzIGZ1bmN0aW9uIHlv
dSBtZW50aW9uIGluIHN0YWdpbmcuIFdhcyBpdCByZW1vdmVkIHJlY2VudGx5Pwo+IAo+IFRoZSBj
b2RlIGlzIGFsbG9jYXRpbmcgYWxsIHBhZ2UtdGFibGVzIGZvciBfZ2ZuKDApLiBJIHdvdWxkIG5v
dCBleHBlY3QgCj4gdGhlIGNvbW1vbiBjb2RlIHRvIGNhcmUgd2hldGhlciBhIHRhYmxlIGlzIGFs
bG9jYXRlZCBvciBub3QuIFNvIHRoaXMgCj4gd291bGQgc3VnZ2VzdCB0aGF0IGFuIGludGVybmFs
IGltcGxlbWVudGF0aW9uIChvZiB0aGUgc2hhZG93PykgaXMgCj4gcmVseWluZyBvbiB0aGlzLgo+
IAo+IEhvd2V2ZXIsIEkgY2FuJ3QgZmluZCBhbnl0aGluZyBvYnZpb3VzIHN1Z2dlc3RpbmcgdGhh
dCBpcyBuZWNlc3NhcnkuIElmIAo+IHRoZXJlIHdhcyBhbnl0aGluZywgSSB3b3VsZCBleHBlY3Qg
dG8gaGFwcGVuIGR1cmluZyBkb21haW4gY3JlYXRpb24sIGFzIAo+IG5laXRoZXIgWGVuIG5vciBh
IGd1ZXN0IGNvdWxkIHJlbHkgb24gdGhpcyAodGhlcmUgYXJlIHdheSB0byBtYWtlIHRob3NlIAo+
IHBhZ2VzIGRpc2FwcGVhciB3aXRoIHRoZSBNRU1PUlkgb3AgaHlwZXJjYWxsKS4KClRoYXQgbWF5
IG5vdCBoYXZlIGJlZW4gdHJ1ZSBhdCB0aGUgdGltZSAoYW5kIHNvIHdoYXRldmVyIGl0IHdhcyB0
aGF0Cm5lZWRlIHRoaXMgbWF5IGhhdmUgYmVlbiBmaXhlZCB3aGVuIGl0IGJlY2FtZSB0cnVlPykK
CkNoZWVycywKClRpbS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
