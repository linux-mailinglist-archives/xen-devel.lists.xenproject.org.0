Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6D317C440
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 18:24:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAGfe-0001fK-SK; Fri, 06 Mar 2020 17:21:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yFgG=4X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jAGfe-0001fF-6G
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 17:21:58 +0000
X-Inumbo-ID: fb87f0ee-5fce-11ea-b52f-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb87f0ee-5fce-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 17:21:57 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jAGfc-00082M-8t; Fri, 06 Mar 2020 17:21:56 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jAGfa-0004gQ-8T; Fri, 06 Mar 2020 17:21:56 +0000
Date: Fri, 6 Mar 2020 17:21:48 +0000
From: Wei Liu <wl@xen.org>
To: Jonas Licht <jonas.licht@fem.tu-ilmenau.de>
Message-ID: <20200306172148.7kooz5cw26ndbnnx@debian>
References: <493c670d7726e74e0c5d76da678e190a@fem.tu-ilmenau.de>
 <20200304103153.xg74oqynievvy4sf@debian>
 <49a5966b-a3b3-541d-52d1-3746b3bc7000@fem.tu-ilmenau.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49a5966b-a3b3-541d-52d1-3746b3bc7000@fem.tu-ilmenau.de>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxenstat: fixed Makefile for building
 python-bindings
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMDY6Mjk6MzlQTSArMDEwMCwgSm9uYXMgTGljaHQgd3Jv
dGU6Cj4gQW0gMDQuMDMuMjAgdW0gMTE6MzEgc2NocmllYiBXZWkgTGl1Ogo+ID4gSGkgSm9uYXMK
PiBIaSBXZWkKPiA+IFRoYW5rcyBmb3IgdGhpcyBwYXRjaC4KPiA+Cj4gPiBPbiBNb24sIE1hciAw
MiwgMjAyMCBhdCAwNjo1MzozOFBNICswMTAwLCBqb25hcy5saWNodEBmZW0udHUtaWxtZW5hdS5k
ZSB3cm90ZToKPiA+PiBGaXhlcyB0aGUgbGlieGVuc3RhdCBNYWtlZmlsZSB0byBkZXRlcm1pbmUg
dGhlIGNvcnJlY3QgcGF0aHMKPiA+PiBvZiBweXRob24gaW5jbHVkZXMgd2hlbiBidWlsZGluZyBw
eXRob24tYmluZGluZ3MuCj4gPj4gQWxzbyByZXBsYWNlcyB0aGUgLWx4ZW5zdGF0IGxpbmtpbmcg
dG8gY29ycmVjdCBvYmplY3QgZmlsZXMKPiA+PiBhbmQgdXNlIHRoZSBsaWJkaXIgdmFyaWFibGUg
Zm9yIGluc3RhbGxpbmcuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKb25hcyBMaWNodCA8am9u
YXMubGljaHRAZmVtLnR1LWlsbWVuYXUuZGU+Cj4gPj4gLS0tCj4gPj4gIHRvb2xzL3hlbnN0YXQv
bGlieGVuc3RhdC9NYWtlZmlsZSB8IDExICsrKysrLS0tLS0tCj4gPj4gIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEv
dG9vbHMveGVuc3RhdC9saWJ4ZW5zdGF0L01ha2VmaWxlCj4gPj4gYi90b29scy94ZW5zdGF0L2xp
YnhlbnN0YXQvTWFrZWZpbGUKPiA+PiBpbmRleCAwM2NiMjEyZTNiLi40YTAyZDJlNTYzIDEwMDY0
NAo+ID4+IC0tLSBhL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9NYWtlZmlsZQo+ID4+ICsrKyBi
L3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9NYWtlZmlsZQo+ID4+IEBAIC0xMTQsMTggKzExNCwx
NyBAQCAkKEJJTkRJTkdTKTogJChTSExJQikgJChTSExJQl9MSU5LUykgc3JjL3hlbnN0YXQuaAo+
ID4+ICBTV0lHX0ZMQUdTPS1tb2R1bGUgeGVuc3RhdCAtSXNyYwo+ID4+Cj4gPj4gICMgUHl0aG9u
IGJpbmRpbmdzCj4gPj4gLVBZVEhPTl9WRVJTSU9OPSQoUFlUSE9OOnB5dGhvbiU9JSkKPiA+PiAt
UFlUSE9OX0ZMQUdTPS1JL3Vzci9pbmNsdWRlL3B5dGhvbiQoUFlUSE9OX1ZFUlNJT04pCj4gPj4g
LWxweXRob24kKFBZVEhPTl9WRVJTSU9OKQo+ID4+ICtQWVRIT05fRkxBR1M9YCQoUFlUSE9OKSAt
YyAnaW1wb3J0IGRpc3R1dGlscy5zeXNjb25maWc7IHByaW50KCItSSIgKwo+ID4gQSBiZXR0ZXIg
YXBwcm9hY2ggd291bGQgYmUgdG8gdXNlIHB5dGhvbi1jb25maWcgaGVyZS4KPiBJJ20gbm90IHF1
aXRlIHN1cmUgaWYgSSBjYW4gcmVxdWlyZSB0aGUgcHl0aG9uLWNvbmZpZyB0b29sIGlzIGluc3Rh
bGxlZC4KPiBBcyBJIHNlZSBpdCdzIG5vdCBjaGVja2VkIGJ5IHRoZSBjb25maWd1cmUuCgpweXRo
b24tY29uZmlnIGlzIGluc3RhbGxlZCBhcyBwYXJ0IG9mIHB5dGhvbi1kZXYgb24gRGViaWFuLCBh
cyB3ZWxsIGFzClJlZGhhdC9DZW50T1MuCgpUaGUgY29uZmlndXJlIHNjcmlwdCBkb2VzIGNoZWNr
IGlmIHB5dGhvbiBkZXZlbG9wbWVudCBwYWNrYWdlIGlzCmluc3RhbGxlZC4KCj4gSSd2ZSBzZWVu
IHNvbWUgY29uZmlndXJlIHNjcmlwdHMsIHdoaWNoIGhhcyBhbiBleHRyYSBmYWxsYmFjayB3aGVu
Cj4gcHl0aG9uLWNvbmZpZyBpcyBtaXNzaW5nLgo+IEkgd2FzIGluc3BpcmVkIGJ5IHRoZSBtNC9w
eXRob25fZGV2ZWwubTQgc2NyaXB0IHRvby4KCkluIGFueSBjYXNlLCBJIHRoaW5rIHRoaXMgcGF0
Y2ggaXMgYWxyZWFkeSBhbiBpbXByb3ZlbWVudCBvdmVyIHdoYXQgaXMKaW4gdHJlZS4KCkFja2Vk
LWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
