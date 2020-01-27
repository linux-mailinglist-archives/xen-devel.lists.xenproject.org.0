Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137B914A66A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:43:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5ZH-00037j-0B; Mon, 27 Jan 2020 14:40:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v1KH=3Q=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iw5ZE-00037d-O6
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:40:44 +0000
X-Inumbo-ID: ff7a6130-4112-11ea-855d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff7a6130-4112-11ea-855d-12813bfff9fa;
 Mon, 27 Jan 2020 14:40:44 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw5ZD-0003f9-19; Mon, 27 Jan 2020 14:40:43 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw5ZC-0004qx-Nj; Mon, 27 Jan 2020 14:40:42 +0000
Date: Mon, 27 Jan 2020 14:40:40 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200127144040.bqgrvcppq3xyq7cv@debian>
References: <20200120115053.1010739-1-anthony.perard@citrix.com>
 <20200120115217.GF1288@perard.uk.xensource.com>
 <20200127123021.gqxdbe2vv4tylf5l@debian>
 <20200127123623.GL1288@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127123623.GL1288@perard.uk.xensource.com>
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

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMTI6MzY6MjNQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMTI6MzA6MjFQTSArMDAwMCwgV2VpIExp
dSB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDIwLCAyMDIwIGF0IDExOjUyOjE3QU0gKzAwMDAsIEFu
dGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBPbiBNb24sIEphbiAyMCwgMjAyMCBhdCAxMTo1MDo1
MEFNICswMDAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+ID4gPiBQYXRjaCBzZXJpZXMgYXZh
aWxhYmxlIGluIHRoaXMgZ2l0IGJyYW5jaDoKPiA+ID4gPiBodHRwczovL3hlbmJpdHMueGVuLm9y
Zy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLnB5dGhvbjMtZGVm
YXVsdC12MQo+ID4gPiA+IAo+ID4gPiA+IEhpLAo+ID4gPiA+IAo+ID4gPiA+IEkgdGhpbmsgaXQn
cyB0aW1lIGZvciBYZW4gdG8gYnVpbGQgd2l0aCBweXRob24zIGJ5IGRlZmF1bHQuCj4gPiA+ID4g
Cj4gPiA+ID4gVGhlIG1haW4gcmVhc29uIGZvciB0aGF0IGlzIHRoYXQgUUVNVSB1cHN0cmVhbSBk
b24ndCBidWlsZCB3aXRoIHB5dGhvbiAyLngKPiA+ID4gPiBhbnltb3JlLCBhbmQgdGhlIHB5dGhv
biBiaW5hcnkgc2VsZWN0ZWQgYnkgWGVuIGJ1aWxkIHN5c3RlbSBpcyB0aGUgb25lIHVzZWQKPiA+
ID4gPiB3aGVuIGJ1aWxkaW5nIHFlbXUteGVuLiBTbyBub3cgb3NzdGVzdCBmYWlsZWQgdG8gYnVp
bGQgUUVNVSB1cHN0cmVhbS4KPiA+ID4gPiAKPiA+ID4gPiBBbHNvLCBweXRob24yIGlzIEVPTC4K
PiA+ID4gPiAKPiA+ID4gPiBGWUksIHRoZSBoeXBlcnZpc29yIGJ1aWxkIHN5c3RlbSBhbHJlYWR5
IHNlbGVjdCBweXRob24zIGJ5IGRlZmF1bHQsIHRoaXMgY2hhbmdlCj4gPiA+ID4gdGhlIHRvb2xz
IHNpZGUuCj4gPiA+IAo+ID4gPiBJIGZvcmdvdCB0byBzYXkgdGhhdCB0aGVyZSdzIGEgb3NzdGVz
dCBwYXRjaCBhcyB3ZWxsOgo+ID4gPiBbT1NTVEVTVCBQQVRDSF0gdHMteGVuLWJ1aWxkLXByZXA6
IEluc3RhbGwgcHl0aG9uMy1kZXYKPiA+IAo+ID4gQUlVSSBJIGRvbid0IG5lZWQgdG8gd2FpdCBm
b3IgdGhhdCBwYXRjaCB0byBiZSBhcHBsaWVkIGJlZm9yZSBhcHBseWluZwo+ID4gdGhpcyBzZXJp
ZXMuIExldCBtZSBrbm93IGlmIEknbSB3cm9uZy4KPiAKPiBJdCBqdXN0IGdvaW5nIHRvIHByZXZl
bnQgYSBwdXNoIDotKS4gQWxsIGJ1aWxkIG9mIHN0YWdpbmcgd2lsbCBmYWlsLiBTbywKPiB0aGUg
b3NzdGVzdCBwYXRjaCBpcyBuZWVkZWQgYmVmb3JlIGFwcGx5aW5nIHRoZSBwYXRjaCAzLzMuCgpB
Y2suIEkgd2lsbCBwdXNoIHRoZSBmaXJzdCB0d28gcGF0Y2hlcyBmaXJzdC4KCkJUVywgaGF2ZSB5
b3UgdXBkYXRlZCB0aGUgZG9ja2VyIGltYWdlcyBpbiBHaXRsYWIgQ0k/CgpXZWkuCgo+IAo+IENo
ZWVycywKPiAKPiAtLSAKPiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
