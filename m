Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E914A67B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:46:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5dG-0004EK-Nk; Mon, 27 Jan 2020 14:44:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v1KH=3Q=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iw5dE-0004EE-QZ
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:44:52 +0000
X-Inumbo-ID: 93809408-4113-11ea-8e9a-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93809408-4113-11ea-8e9a-bc764e2007e4;
 Mon, 27 Jan 2020 14:44:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw5dD-0003nU-JI; Mon, 27 Jan 2020 14:44:51 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw5dD-0005CB-B9; Mon, 27 Jan 2020 14:44:51 +0000
Date: Mon, 27 Jan 2020 14:44:48 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200127144448.25queiza3jubef2p@debian>
References: <20200120115053.1010739-1-anthony.perard@citrix.com>
 <20200120115217.GF1288@perard.uk.xensource.com>
 <20200127123021.gqxdbe2vv4tylf5l@debian>
 <20200127123623.GL1288@perard.uk.xensource.com>
 <20200127144040.bqgrvcppq3xyq7cv@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127144040.bqgrvcppq3xyq7cv@debian>
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

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDI6NDA6NDBQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEphbiAyNywgMjAyMCBhdCAxMjozNjoyM1BNICswMDAwLCBBbnRob255IFBFUkFS
RCB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDI3LCAyMDIwIGF0IDEyOjMwOjIxUE0gKzAwMDAsIFdl
aSBMaXUgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSmFuIDIwLCAyMDIwIGF0IDExOjUyOjE3QU0gKzAw
MDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgSmFuIDIwLCAyMDIwIGF0
IDExOjUwOjUwQU0gKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiA+ID4gUGF0Y2gg
c2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cj4gPiA+ID4gPiBodHRwczovL3hl
bmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJy
LnB5dGhvbjMtZGVmYXVsdC12MQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBIaSwKPiA+ID4gPiA+IAo+
ID4gPiA+ID4gSSB0aGluayBpdCdzIHRpbWUgZm9yIFhlbiB0byBidWlsZCB3aXRoIHB5dGhvbjMg
YnkgZGVmYXVsdC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlIG1haW4gcmVhc29uIGZvciB0aGF0
IGlzIHRoYXQgUUVNVSB1cHN0cmVhbSBkb24ndCBidWlsZCB3aXRoIHB5dGhvbiAyLngKPiA+ID4g
PiA+IGFueW1vcmUsIGFuZCB0aGUgcHl0aG9uIGJpbmFyeSBzZWxlY3RlZCBieSBYZW4gYnVpbGQg
c3lzdGVtIGlzIHRoZSBvbmUgdXNlZAo+ID4gPiA+ID4gd2hlbiBidWlsZGluZyBxZW11LXhlbi4g
U28gbm93IG9zc3Rlc3QgZmFpbGVkIHRvIGJ1aWxkIFFFTVUgdXBzdHJlYW0uCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IEFsc28sIHB5dGhvbjIgaXMgRU9MLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGWUks
IHRoZSBoeXBlcnZpc29yIGJ1aWxkIHN5c3RlbSBhbHJlYWR5IHNlbGVjdCBweXRob24zIGJ5IGRl
ZmF1bHQsIHRoaXMgY2hhbmdlCj4gPiA+ID4gPiB0aGUgdG9vbHMgc2lkZS4KPiA+ID4gPiAKPiA+
ID4gPiBJIGZvcmdvdCB0byBzYXkgdGhhdCB0aGVyZSdzIGEgb3NzdGVzdCBwYXRjaCBhcyB3ZWxs
Ogo+ID4gPiA+IFtPU1NURVNUIFBBVENIXSB0cy14ZW4tYnVpbGQtcHJlcDogSW5zdGFsbCBweXRo
b24zLWRldgo+ID4gPiAKPiA+ID4gQUlVSSBJIGRvbid0IG5lZWQgdG8gd2FpdCBmb3IgdGhhdCBw
YXRjaCB0byBiZSBhcHBsaWVkIGJlZm9yZSBhcHBseWluZwo+ID4gPiB0aGlzIHNlcmllcy4gTGV0
IG1lIGtub3cgaWYgSSdtIHdyb25nLgo+ID4gCj4gPiBJdCBqdXN0IGdvaW5nIHRvIHByZXZlbnQg
YSBwdXNoIDotKS4gQWxsIGJ1aWxkIG9mIHN0YWdpbmcgd2lsbCBmYWlsLiBTbywKPiA+IHRoZSBv
c3N0ZXN0IHBhdGNoIGlzIG5lZWRlZCBiZWZvcmUgYXBwbHlpbmcgdGhlIHBhdGNoIDMvMy4KPiAK
PiBBY2suIEkgd2lsbCBwdXNoIHRoZSBmaXJzdCB0d28gcGF0Y2hlcyBmaXJzdC4KPiAKPiBCVFcs
IGhhdmUgeW91IHVwZGF0ZWQgdGhlIGRvY2tlciBpbWFnZXMgaW4gR2l0bGFiIENJPwoKTmV2ZXIg
bWluZC4gWW91IHNhaWQgdGhhdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYWxyZWFkeS4KCldlaS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
