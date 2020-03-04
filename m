Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A887C178E78
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 11:33:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9RJn-00077Y-4w; Wed, 04 Mar 2020 10:31:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=usiQ=4V=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j9RJm-00077S-Cx
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 10:31:58 +0000
X-Inumbo-ID: 602585de-5e03-11ea-90c4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 602585de-5e03-11ea-90c4-bc764e2007e4;
 Wed, 04 Mar 2020 10:31:58 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j9RJk-0003Jo-N4; Wed, 04 Mar 2020 10:31:56 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j9RJk-0004Pg-Dd; Wed, 04 Mar 2020 10:31:56 +0000
Date: Wed, 4 Mar 2020 10:31:53 +0000
From: Wei Liu <wl@xen.org>
To: jonas.licht@fem.tu-ilmenau.de
Message-ID: <20200304103153.xg74oqynievvy4sf@debian>
References: <493c670d7726e74e0c5d76da678e190a@fem.tu-ilmenau.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <493c670d7726e74e0c5d76da678e190a@fem.tu-ilmenau.de>
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

SGkgSm9uYXMKClRoYW5rcyBmb3IgdGhpcyBwYXRjaC4KCk9uIE1vbiwgTWFyIDAyLCAyMDIwIGF0
IDA2OjUzOjM4UE0gKzAxMDAsIGpvbmFzLmxpY2h0QGZlbS50dS1pbG1lbmF1LmRlIHdyb3RlOgo+
IEZpeGVzIHRoZSBsaWJ4ZW5zdGF0IE1ha2VmaWxlIHRvIGRldGVybWluZSB0aGUgY29ycmVjdCBw
YXRocwo+IG9mIHB5dGhvbiBpbmNsdWRlcyB3aGVuIGJ1aWxkaW5nIHB5dGhvbi1iaW5kaW5ncy4K
PiBBbHNvIHJlcGxhY2VzIHRoZSAtbHhlbnN0YXQgbGlua2luZyB0byBjb3JyZWN0IG9iamVjdCBm
aWxlcwo+IGFuZCB1c2UgdGhlIGxpYmRpciB2YXJpYWJsZSBmb3IgaW5zdGFsbGluZy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKb25hcyBMaWNodCA8am9uYXMubGljaHRAZmVtLnR1LWlsbWVuYXUuZGU+
Cj4gLS0tCj4gIHRvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9NYWtlZmlsZSB8IDExICsrKysrLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9NYWtlZmlsZQo+IGIvdG9v
bHMveGVuc3RhdC9saWJ4ZW5zdGF0L01ha2VmaWxlCj4gaW5kZXggMDNjYjIxMmUzYi4uNGEwMmQy
ZTU2MyAxMDA2NDQKPiAtLS0gYS90b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUKPiAr
KysgYi90b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUKPiBAQCAtMTE0LDE4ICsxMTQs
MTcgQEAgJChCSU5ESU5HUyk6ICQoU0hMSUIpICQoU0hMSUJfTElOS1MpIHNyYy94ZW5zdGF0LmgK
PiAgU1dJR19GTEFHUz0tbW9kdWxlIHhlbnN0YXQgLUlzcmMKPiAKPiAgIyBQeXRob24gYmluZGlu
Z3MKPiAtUFlUSE9OX1ZFUlNJT049JChQWVRIT046cHl0aG9uJT0lKQo+IC1QWVRIT05fRkxBR1M9
LUkvdXNyL2luY2x1ZGUvcHl0aG9uJChQWVRIT05fVkVSU0lPTikKPiAtbHB5dGhvbiQoUFlUSE9O
X1ZFUlNJT04pCj4gK1BZVEhPTl9GTEFHUz1gJChQWVRIT04pIC1jICdpbXBvcnQgZGlzdHV0aWxz
LnN5c2NvbmZpZzsgcHJpbnQoIi1JIiArCgpBIGJldHRlciBhcHByb2FjaCB3b3VsZCBiZSB0byB1
c2UgcHl0aG9uLWNvbmZpZyBoZXJlLgoKPiBkaXN0dXRpbHMuc3lzY29uZmlnLmdldF9weXRob25f
aW5jKFRydWUpICsgIiAiICsKPiBkaXN0dXRpbHMuc3lzY29uZmlnLmdldF9jb25maWdfdmFyKCJC
TERMSUJSQVJZIikpJ2AKPiAgJChQWU1PRCk6ICQoUFlTUkMpCj4gICQoUFlTUkMpOiBiaW5kaW5n
cy9zd2lnL3hlbnN0YXQuaQo+ICAgICAgICAgc3dpZyAtcHl0aG9uICQoU1dJR19GTEFHUykgLW91
dGRpciAkKEBEKSAtbyAkKFBZU1JDKSAkPAo+IAo+ICAkKFBZTElCKTogJChQWVNSQykKPiAtICAg
ICAgICQoQ0MpICQoQ0ZMQUdTKSAkKExERkxBR1MpICQoUFlUSE9OX0ZMQUdTKSAkKFNITElCX0xE
RkxBR1MpCj4gLWx4ZW5zdGF0IC1vICRAICQ8ICQoQVBQRU5EX0xERkxBR1MpCj4gKyAgICAgICAk
KENDKSAkKENGTEFHUykgJChMREZMQUdTKSAkKFBZVEhPTl9GTEFHUykgJChTSExJQl9MREZMQUdT
KSAtbyAkQCAkPAo+ICQoU0hMSUIpICQoTERMSUJTLXkpICQoQVBQRU5EX0xERkxBR1MpCj4gCj4g
IHB5dGhvbi1iaW5kaW5nczogJChQWUxJQikgJChQWU1PRCkKPiAKPiAtcHl0aG9ubGliZGlyPSQo
cHJlZml4KS9saWIvcHl0aG9uJChQWVRIT05fVkVSU0lPTikvc2l0ZS1wYWNrYWdlcwo+ICtweXRo
b25saWJkaXI9YCQoUFlUSE9OKSAtYyAnaW1wb3J0IGRpc3R1dGlscy5zeXNjb25maWc7CgpBbmQg
aGVyZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
