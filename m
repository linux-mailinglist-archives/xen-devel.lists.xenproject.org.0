Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4450A158D91
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 12:31:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1TfG-0001aO-Gw; Tue, 11 Feb 2020 11:25:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3UK8=37=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j1TfF-0001aJ-Ev
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 11:25:13 +0000
X-Inumbo-ID: 2b51dc52-4cc1-11ea-852a-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b51dc52-4cc1-11ea-852a-bc764e2007e4;
 Tue, 11 Feb 2020 11:25:12 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j1TfE-00042j-4v; Tue, 11 Feb 2020 11:25:12 +0000
Received: from [62.60.63.48] (helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j1TfD-0006pL-SW; Tue, 11 Feb 2020 11:25:12 +0000
Date: Tue, 11 Feb 2020 11:25:09 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200211112509.qp2iutkhmkswdz7x@debian>
References: <20200120115053.1010739-1-anthony.perard@citrix.com>
 <20200120115217.GF1288@perard.uk.xensource.com>
 <20200127123021.gqxdbe2vv4tylf5l@debian>
 <20200127123623.GL1288@perard.uk.xensource.com>
 <20200127144040.bqgrvcppq3xyq7cv@debian>
 <20200211111902.GE85066@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211111902.GE85066@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH 0/3] Default to python3
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMTE6MTk6MDJBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDI6NDA6NDBQTSArMDAwMCwgV2VpIExp
dSB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDI3LCAyMDIwIGF0IDEyOjM2OjIzUE0gKzAwMDAsIEFu
dGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBPbiBNb24sIEphbiAyNywgMjAyMCBhdCAxMjozMDoy
MVBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgSmFuIDIwLCAyMDIwIGF0
IDExOjUyOjE3QU0gKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiA+ID4gT24gTW9u
LCBKYW4gMjAsIDIwMjAgYXQgMTE6NTA6NTBBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6
Cj4gPiA+ID4gPiA+IFBhdGNoIHNlcmllcyBhdmFpbGFibGUgaW4gdGhpcyBnaXQgYnJhbmNoOgo+
ID4gPiA+ID4gPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFy
ZC94ZW4tdW5zdGFibGUuZ2l0IGJyLnB5dGhvbjMtZGVmYXVsdC12MQo+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gSGksCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJIHRoaW5rIGl0J3MgdGltZSBm
b3IgWGVuIHRvIGJ1aWxkIHdpdGggcHl0aG9uMyBieSBkZWZhdWx0Lgo+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gVGhlIG1haW4gcmVhc29uIGZvciB0aGF0IGlzIHRoYXQgUUVNVSB1cHN0cmVhbSBk
b24ndCBidWlsZCB3aXRoIHB5dGhvbiAyLngKPiA+ID4gPiA+ID4gYW55bW9yZSwgYW5kIHRoZSBw
eXRob24gYmluYXJ5IHNlbGVjdGVkIGJ5IFhlbiBidWlsZCBzeXN0ZW0gaXMgdGhlIG9uZSB1c2Vk
Cj4gPiA+ID4gPiA+IHdoZW4gYnVpbGRpbmcgcWVtdS14ZW4uIFNvIG5vdyBvc3N0ZXN0IGZhaWxl
ZCB0byBidWlsZCBRRU1VIHVwc3RyZWFtLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gQWxzbywg
cHl0aG9uMiBpcyBFT0wuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBGWUksIHRoZSBoeXBlcnZp
c29yIGJ1aWxkIHN5c3RlbSBhbHJlYWR5IHNlbGVjdCBweXRob24zIGJ5IGRlZmF1bHQsIHRoaXMg
Y2hhbmdlCj4gPiA+ID4gPiA+IHRoZSB0b29scyBzaWRlLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJ
IGZvcmdvdCB0byBzYXkgdGhhdCB0aGVyZSdzIGEgb3NzdGVzdCBwYXRjaCBhcyB3ZWxsOgo+ID4g
PiA+ID4gW09TU1RFU1QgUEFUQ0hdIHRzLXhlbi1idWlsZC1wcmVwOiBJbnN0YWxsIHB5dGhvbjMt
ZGV2Cj4gPiA+ID4gCj4gPiA+ID4gQUlVSSBJIGRvbid0IG5lZWQgdG8gd2FpdCBmb3IgdGhhdCBw
YXRjaCB0byBiZSBhcHBsaWVkIGJlZm9yZSBhcHBseWluZwo+ID4gPiA+IHRoaXMgc2VyaWVzLiBM
ZXQgbWUga25vdyBpZiBJJ20gd3JvbmcuCj4gPiA+IAo+ID4gPiBJdCBqdXN0IGdvaW5nIHRvIHBy
ZXZlbnQgYSBwdXNoIDotKS4gQWxsIGJ1aWxkIG9mIHN0YWdpbmcgd2lsbCBmYWlsLiBTbywKPiA+
ID4gdGhlIG9zc3Rlc3QgcGF0Y2ggaXMgbmVlZGVkIGJlZm9yZSBhcHBseWluZyB0aGUgcGF0Y2gg
My8zLgo+ID4gCj4gPiBBY2suIEkgd2lsbCBwdXNoIHRoZSBmaXJzdCB0d28gcGF0Y2hlcyBmaXJz
dC4KPiAKPiBvc3N0ZXN0IHNob3VsZCBiZSByZWFkeSwgY291bGQgeW91IHB1c2ggdGhhdCBsYXN0
IHBhdGNoPwoKUHVzaGVkLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
