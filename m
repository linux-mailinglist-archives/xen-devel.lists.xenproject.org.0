Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A027E116D8
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 12:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM8WN-000183-Vx; Thu, 02 May 2019 10:00:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM8WM-00017y-6t
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 10:00:54 +0000
X-Inumbo-ID: 24ef9484-6cc1-11e9-bba3-9ff1c6f2a1ba
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24ef9484-6cc1-11e9-bba3-9ff1c6f2a1ba;
 Thu, 02 May 2019 10:00:42 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 04:00:41 -0600
Message-Id: <5CCABFC7020000780022B1F8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 04:00:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "David Woodhouse" <dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
 <cover.1556708225.git.dwmw2@infradead.org>
 <c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org>
 <5CCAA6ED020000780022B0AA@prv1-mh.provo.novell.com>
 <5a327ee0-58cd-6526-b3e1-3bda2b71a230@citrix.com>
In-Reply-To: <5a327ee0-58cd-6526-b3e1-3bda2b71a230@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [RFC PATCH 2/7] x86/boot: Remove gratuitous call
 back into low-memory code
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDExOjIzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDIvMDUvMjAxOSAwOToxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAx
LjA1LjE5IGF0IDEzOjE3LCA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4+PiBXZSBhcHBl
YXIgdG8gaGF2ZSBpbXBsZW1lbnRlZCBhIG1lbWNweSgpIGluIHRoZSBsb3ctbWVtb3J5IHRyYW1w
b2xpbmUKPj4+IHdoaWNoIHdlIHRoZW4gY2FsbCBpbnRvIGZyb20gX19zdGFydF94ZW4oKSwgZm9y
IG5vIGFkZXF1YXRlbHkgZGVmaW5lZAo+Pj4gcmVhc29uLgo+PiBNYXkgSSBzdWdnZXN0IHRoYXQg
aW4gY2FzZXMgbGlrZSB0aGlzIHlvdSBsb29rIGF0IHRoZSBjb21taXQKPj4gaW50cm9kdWNpbmcg
dGhlIGZ1bmN0aW9uPyBJdCBzdXBwbGllcyBhIHJlYXNvbjoKPj4KPj4gIkFkZCBhIG5ldyByYXcg
ZTgyMCB0YWJsZSBmb3IgY29tbW9uIHB1cnBvc2UgYW5kIGNvcHkgdGhlIEJJT1MgYnVmZmVyCj4+
ICB0byBpdC4gRG9pbmcgdGhlIGNvcHlpbmcgaW4gYXNzZW1ibHkgYXZvaWRzIHRoZSBuZWVkIHRv
IGV4cG9ydCB0aGUKPj4gIHN5bWJvbHMgZm9yIHRoZSBCSU9TIEU4MjAgYnVmZmVyIGFuZCBudW1i
ZXIgb2YgZW50cmllcy4iCj4gCj4gSSBjb21wbGV0ZWx5IGFncmVlIHdpdGggRGF2aWQgaGVyZS4g
IFRoYXQgZGVzY3JpcHRpb24gaXMgY29tcGxldGVseQo+IGluc3VmZmljaWVudCBmb3IganVzdGlm
eWluZyB3aHkgdGhlIGxvZ2ljIHdhcyBkb25lIHRoYXQgd2F5IGluIHRoZSBlbmQsCj4gYW5kIEkg
d291bGQgbm90IGhhdmUgYWNjZXB0ZWQgdGhlIHBhdGNoIGluIHRoYXQgZm9ybSBhdCBhbGwuCj4g
Cj4gVG8gYmUgY2xlYXIuICBJIHVuZGVyc3RhbmQgKGFuZCBhZ3JlZSkgd2h5IGhhdmluZyBvdXIg
bWFpbiBjb3B5IG9mIHRoZQo+IGU4MjAgdGFibGUgaW4gdGhlIHRyYW1wb2xpbmUgaXMgYSBiYWQg
dGhpbmcsIGFuZCBtb3ZpbmcgdGhlIG1haW4gY29weQo+IG91dCBvZiB0aGUgdHJhbXBvbGluZSBp
cyBmaW5lLgo+IAo+IFdoYXQgaXNuJ3QgZmluZSBpcyB3aHksIGluIHRoZSBhZGp1c3RlZCB3b3Js
ZCwgd2UgY2FsbCBiYWNrIGludG8gd2hhdAo+IGFwcGVhcnMgdG8gYmUgdGhlIHRyYW1wb2xpbmUs
IGJ1dCBpc24ndCwgdG8gZ2V0IGFjY2VzcyB0byBkYXRhIHdoaWNoIHRoZQo+IGNhbGxpbmcgY29k
ZSBjYW4gYWxyZWFkeSBhY2Nlc3MuICBJbiBwYXJ0aWN1bGFyLi4uCj4gCj4+IEkgaGF2ZSB0byBh
ZG1pdCB0aGF0IEkgc2VlIHZhbHVlIGluIHRoaXMsIGFzIGl0IGF2b2lkcyBpbnRyb2R1Y3Rpb24K
Pj4gb2Ygd3JvbmcgYWNjZXNzZXMgdG8gdGhlc2UgdmFyaWFibGVzLgo+IAo+IC4uLnRoaXMgcmVh
c29uaW5nIGlzIGJvZ3VzLiAgV2UncmUgZWl0aGVyIGFjY2Vzc2luZyB0aGUgZGF0YSBpdHNlbGYs
IG9yCj4gdGhlIG1lbWNweSBmdW5jdGlvbiwgYnV0IHRoZXJlIGlzIG5vIHBvc3NpYmxlIHdheSB0
byBwcm9ncmFtYXRpY2FsbHkKPiBhdm9pZCAid3JvbmciIGFjY2VzcyBpbnRvIHRoZSB0cmFtcG9s
aW5lLCBiZWNhdXNlIHdlJ3JlIHN0aWxsIGFjY2Vzc2luZyBpdC4KPiAKPiBUaGVyZWZvcmUsIEkg
ZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHBvc3NpYmxlIGJlbmVmaXQgbm90IGV4cG9ydGluZyB0aGUK
PiBkYXRhIGhhcyBpbiB0aGUgZmlyc3QgcGxhY2UsIGFuZCB3aHkgY29tcGxpY2F0aW5nIGl0IHdp
dGggYSBjYWxsIHRvIGEKPiBmdW5jdGlvbiAod2hpY2ggaXNuJ3QgYWN0dWFsbHkgZXhlY3V0aW5n
IHdoZXJlIGl0IGFwcGVhcnMgdG8gbGl2ZSksIGlzCj4gY29uc2lkZXJlZCBhIGJlbmVmaXQuCgpX
aXRob3V0IGhhdmluZyBnb25lIGJhY2sgdG8gdGhlIG9sZCB0aHJlYWQsIEkgdGhpbmsgcGFydCBv
Zgp0aGUgbW90aXZhdGlvbiB0byBhdm9pZCBzdWNoIGRpcmVjdCBkYXRhIGFjY2Vzc2VzIHdhcyB0
aGF0CmFuIGluaXRpYWwgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggYWN0dWFsbHkgYnJva2UgdGhpbmdz
IGJ5CmludHJvZHVjaW5nIHN1Y2ggYWNjZXNzZXMuCgpBcGFydCBmcm9tIHRoYXQsIGRlc3BpdGUg
bm90IGJlaW5nIGEgaGVhdnkgQysrIHVzZXIsIEkKdmVyeSBtdWNoIGFwcHJlY2lhdGUgdGhlIGxh
bmd1YWdlJ3MgZnVuZGFtZW50YWwgZGVzaXJlIHRvCmF2b2lkIGRpcmVjdCBhY2Nlc3NlcyB0byBk
YXRhIGVsZW1lbnRzLCBwcm92aWRpbmcgZnVuY3Rpb25zCihtZXRob2RzKSB0byBkbyBzbyBpbnN0
ZWFkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
