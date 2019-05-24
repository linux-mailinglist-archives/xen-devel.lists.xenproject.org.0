Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79809299F7
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 16:22:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUB2j-0003N2-Cd; Fri, 24 May 2019 14:19:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hUB2h-0003Mx-RQ
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 14:19:31 +0000
X-Inumbo-ID: f07f4ecc-7e2e-11e9-ad9b-f3b0beaa8a92
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f07f4ecc-7e2e-11e9-ad9b-f3b0beaa8a92;
 Fri, 24 May 2019 14:19:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 08:19:27 -0600
Message-Id: <5CE7FD6B0200007800232126@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 08:19:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558704586-829-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1558704586-829-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: Skip building on older
 versions of GCC
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA1LjE5IGF0IDE1OjI5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gR0NDIDQuNCAoYXMgaW5jbHVkZWQgaW4gQ2VudE9TIDYpIGlzIHRvbyBvbGQgdG8gaGFu
ZGxlIGRlc2lnbmF0ZWQgaW5pdGlhbGlzZXJzCj4gaW4gYW5vbnltb3VzIHVuaW9ucy4gIEFzIHRo
aXMgaXMganVzdCBhIGRldmVsb3BlciB0b29sLCBza2lwIHRoZSB0ZXN0IGluIHRoaXMKPiBjYXNl
LCByYXRoZXIgdGhhbiBzYWNyYWZpY2luZyB0aGUgbGVnaWJpbGl0eS9leHByZXNpYmlsaXR5IG9m
IHRoZSB0ZXN0IGNhc2VzLgo+IAo+IFRoaXMgZml4ZXMgdGhlIEdpdGxhYiBDSSB0ZXN0cy4KPiAK
PiBXaGlsZSBhZGRpbmcgdGhpcyBsb2dpYyB0byBjcHUtcG9sY3ksIGFkanVzdCB0aGUgZXF1aXZl
bGVudCBsb2dpYyBmcm9tCj4geDg2X2VtdWxhdG9yIG9uIHdoaWNoIHRoaXMgd2FzIGJhc2VkLiAg
UHJpbnRpbmc6Cj4gCj4gICBUZXN0IGhhcm5lc3Mgbm90IGJ1aWx0LCB1c2UgbmV3ZXIgY29tcGls
ZXIgdGhhbiAiZ2NjIgo+IAo+IGlzbid0IGhlbHBmdWwgZm9yIGFueW9uZSB1bmV4cGVjdGVkbHkg
ZW5jb3VudGVyaW5nIHRoZSBlcnJvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKRnVuZGFtZW50YWxseQpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpCdXQgdGhlcmUgYXJlIHJlbWFya3M6Cgo+
IC0tLSBhL3Rvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvTWFrZWZpbGUKPiArKysgYi90b29scy90ZXN0
cy9jcHUtcG9saWN5L01ha2VmaWxlCj4gQEAgLTEsOCArMSwyMCBAQAo+ICBYRU5fUk9PVCA9ICQo
Q1VSRElSKS8uLi8uLi8uLgo+ICBpbmNsdWRlICQoWEVOX1JPT1QpL3Rvb2xzL1J1bGVzLm1rCj4g
IAo+ICtUQVJHRVQteSA6PSB0ZXN0LWNwdS1wb2xpY3kKPiArCj4gKyMgRm9yIGJyZXZpdHksIHRo
ZXNlIHRlc3RzIG1ha2UgZXh0ZW5zaXZlIHVzZSBvZiBkZXNpZ25hdGVkIGluaXRpYWxpc2Vycywg
YnV0Cj4gKyMgR0NDcyBvbGRlciB0aGFuIDQuNiBjYW4ndCBjb3BlLiAgSWdub3JlIHRoZSB0ZXN0
IGluIHRoaXMgY2FzZS4KCkRlc2lnbmF0ZWQgaW5pdGlhbGl6ZXJzIGFsb25lIGFyZSBubyBwcm9i
bGVtIGZvciBvbGQgZ2NjLiBUaGUgaXNzdWUgaXMKd2l0aCBvbmVzIHVzZWQgZm9yIHN1Yi1zdHJ1
Y3R1cmVzLy11bmlvbnMgd2l0aG91dCBmaWVsZCBuYW1lLgpQZXJoYXBzIHdvcnRoIHNsaWdodGx5
IGV4dGVuZGluZyB0aGUgY29tbWVudCB0byB0aGlzIGVmZmVjdD8KCj4gLS0tIGEvdG9vbHMvdGVz
dHMveDg2X2VtdWxhdG9yL01ha2VmaWxlCj4gKysrIGIvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9y
L01ha2VmaWxlCj4gQEAgLTk3LDcgKzk3LDcgQEAgJChmb3JlYWNoIGZsYXZvciwkKFNJTUQpICQo
Rk1BKSwkKGV2YWwgJChjYWxsIHNpbWQtY2hlY2stY2MsJChmbGF2b3IpKSkpCj4gIFRBUkdFVC0k
KHNoZWxsIGVjaG8gJ2FzbSgie2V2ZXh9IHZ6ZXJvYWxsIik7JyB8ICQoQ0MpIC14IGMgLWMgLW8g
L2Rldi9udWxsIAo+IC0gfHwgZWNobyB5KSA6PQo+ICAKPiAgaWZlcSAoJChUQVJHRVQteSksKQo+
IC0kKHdhcm5pbmcgVGVzdCBoYXJuZXNzIG5vdCBidWlsdCwgdXNlIG5ld2VyIGNvbXBpbGVyIHRo
YW4gIiQoQ0MpIikKPiArJCh3YXJuaW5nIFRlc3QgaGFybmVzcyBub3QgYnVpbHQsIHVzZSBuZXdl
ciBjb21waWxlciB0aGFuICQoQ0MpICQoc2hlbGwgJChDQykgLWR1bXB2ZXJzaW9uKSBhbmQgYW4g
IntldmV4fSIgY2FwYWJsZSBhc3NlbWJsZXIpCj4gIGVuZGlmCgpJIGFwcHJlY2lhdGUgdGhlIGlk
ZWEgb2YgcHJvdmlkaW5nIG1vZGUgaW5mb3JtYXRpb24sIGJ1dCBJJ20gYWZyYWlkCnRoaXMgaXMg
Z29pbmcgdG8gYmUgY2x1bXN5IGluIHRoZSBvdGhlciBkaXJlY3Rpb24gbm93OgoKIlRlc3QgaGFy
bmVzcyBub3QgYnVpbHQsIHVzZSBuZXdlciBjb21waWxlciB0aGFuIGdjYy00LjggNC44IGFuZCAu
Li4iCgpOYW1pbmcgdGhlIGNvbXBpbGVyIGJpbmFyeSwgSSB0aG91Z2h0LCBhbGxvd3MgdGhlIHVz
ZXIgdG8gZmlndXJlCm91dCB0aGUgdmVyc2lvbiBlYXNpbHkgZW5vdWdoLiBUaGVyZWZvcmUsIHBs
ZWFzZSBjb25zaWRlcgpkcm9wcGluZyB0aGF0IHBhcnQgYWdhaW4uCgpJJ20gdW5jb25kaXRpb25h
bGx5IGZpbmUgd2l0aCB0aGUge2V2ZXh9IGFkZGl0aW9uLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
