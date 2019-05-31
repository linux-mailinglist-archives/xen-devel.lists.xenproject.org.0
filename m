Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9163130EB5
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 15:18:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWhNc-0008F8-Na; Fri, 31 May 2019 13:15:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWhNa-0008F3-Ka
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 13:15:30 +0000
X-Inumbo-ID: 27348db6-83a6-11e9-b119-9bfcef2dd89c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27348db6-83a6-11e9-b119-9bfcef2dd89c;
 Fri, 31 May 2019 13:15:26 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 07:15:25 -0600
Message-Id: <5CF128EA0200007800234051@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 07:15:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <1559211432-30973-1-git-send-email-chenbaodong@mxnavi.com>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
 <D13DE1D6-CE96-4A41-941E-FC4161CFA1EA@citrix.com>
In-Reply-To: <D13DE1D6-CE96-4A41-941E-FC4161CFA1EA@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen: make tracebuffer configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Rich Persaud <persaur@gmail.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Baodong Chen <chenbaodong@mxnavi.com>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDE0OjU4LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPj4gT24gTWF5IDMxLCAyMDE5LCBhdCAxMjoxMCBQTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToKPj4+Pj4gT24gMzAuMDUuMTkgYXQgMTI6MTcsIDxjaGVuYmFvZG9u
Z0BteG5hdmkuY29tPiB3cm90ZToKPj4+IERlZmF1bHQ6IGVuYWJsZWQuCj4+PiBDYW4gYmUgZGlz
YWJsZWQgZm9yIHNtYWxsZXIgY29kZSBmb290cHJpbnQuCj4+IAo+PiBCdXQgeW91J3JlIGF3YXJl
IHRoYXQgd2UncmUsIGZvciBub3cgYXQgbGVhc3QsIHRyeWluZyB0byBsaW1pdCB0aGUKPj4gbnVt
YmVyIG9mIGluZGVwZW5kZW50bHkgc2VsZWN0YWJsZSBjb25maWcgb3B0aW9ucz8gT25lcyBkZXBl
bmRpbmcKPj4gb24gRVhQRVJUIGFyZSBzb3J0IG9mIGFuIGV4Y2VwdGlvbiBpbiBjZXJ0YWluIGNh
c2VzLgo+IAo+IEnigJltIHRyeWluZyB0byByZW1lbWJlciBleGFjdGx5IHdoYXQgd2UgaGF2ZSBv
ciBoYXZlbuKAmXQgZGVjaWRlZC4gIEkgdGFrZSBpdCAKPiB5b3UgdGhpbmsgd2Ugc2hvdWxkIGF2
b2lkIGhhdmluZyBhIGxvYWQgb2YgaW5kZXBlbmRlbnRseS1zZWxlY3RhYmxlIAo+IGNvbmZpZ3Vy
YXRpb25zIHRvIHN1cHBvcnQ/CgpZZXMsIHRoYXQncyB0aGUgbWFpbiAoYW5kIHBlcmhhcHMgb25s
eSkgcmVhc29uIHRvIGxpbWl0IG9wdGlvbnMgd2l0aAp1c2VyIHZpc2libGUgcHJvbXB0cy4KCj4g
QmFvZG9uZywgd2hhdCB3YXMgeW91ciBtYWluIHB1cnBvc2UgaW4gYWRkaW5nIGEgcGF0Y2ggbGlr
ZSB0aGlzPyAgSnVzdCB0byAKPiBtYWtlIHRoaW5ncyBhIGJpdCB0aWRpZXIsIG9yIHdhcyBpdCB0
byB0cnkgdG8gZ28gdGhyb3VnaCBhbmQgZ2VuZXJhdGUgYSBmYXIgCj4gc21hbGxlciBoeXBlcnZp
c29yIGNvZGViYXNlIChmb3IgaW5zdGFuY2UsIHBlcmhhcHMgdG8gbWFrZSBzYWZldHkgCj4gY2Vy
dGlmaWNhdGlvbiBtb3JlIHRyYWN0YWJsZSk/Cj4gCj4gSSB0aGluayB3ZeKAmXZlIHRhbGtlZCBh
Ym91dCB0aGlzIGJlZm9yZSwgYnV0IG91ciBiYXNpYyBvcHRpb25zLCBhcyBmYXIgYXMgCj4gc3Vw
cG9ydCwgd291bGQgYmU6Cj4gCj4gMS4gSGF2ZSBhIHNpbmdsZSBsYXJnZSBjb25maWcgb3B0aW9u
IHdoaWNoIGRpc2FibGVkIGxhcmdlIHN3YXRoZXMgb2YgdW51c2VkIAo+IGZ1bmN0aW9uYWxpdHkK
ClBlcmhhcHMgdGhpcyBpcyBhIHdvcnRod2hpbGUgdGhpbmcgdG8gaGF2ZSBhbnl3YXkuCgo+IDIu
IEhhdmUgaW5kaXZpZHVhbCBiaXRzIGNvbmZpZ3VyYWJsZSwgYnV0IGhhdmUgb25seSBhIGhhbmRm
dWwgb2Yg4oCcc2VjdXJpdHkgCj4gc3VwcG9ydGVk4oCdIGNvbmZpZ3VyYXRpb25zLgo+IAo+IFRo
ZSBpZGVhIHdpdGggIzIgaXMgdGhhdCB3ZeKAmWQgaGF2ZSBhIOKAnGNlcnRpZmljYXRpb27igJ0g
Y29uZmlnIHRoYXQgd2UgdGVzdGVkIAo+IGFuZCBzZWN1cml0eSBzdXBwb3J0ZWQsIHdpdGggYWxs
IG9mIHRoZXNlIGluZGl2aWR1YWwgYml0cyBvZmYsIGFzIHdlbGwgYXMgCj4g4oCcY2xvdWTigJ0g
YW5kIOKAnGNsaWVudOKAnSBjb25maWdzIHdpdGggYWxsIG9mIHRoZXNlIOKAnG9wdGlvbmFs4oCd
IGJpdHMgb24gKG9yIHNvbWUgCj4gc3Vic2V0IG9uLCBkZXBlbmRpbmcgb24gd2hhdCBlYWNoIGNv
bW11bml0eSB0aG91Z2h0IG1hZGUgdGhlIG1vc3Qgc2Vuc2UgZm9yIAo+IHRoZWlyIHVzZSBjYWZl
KS4gIElmIHBlb3BsZSB3YW50ZWQgdG8gZW5hYmxlIG9yIGRpc2FibGUgaW5kaXZpZHVhbCBjb25m
aWcgCj4gb3B0aW9ucyBvdXRzaWRlIGZvIHRob3NlLCB0aGV54oCZZCBiZSB0YWtpbmcgYSByaXNr
IHdydCBicmVha2FnZSAobm90IHRlc3RlZCkgCj4gb3Igc2VjdXJpdHkgaXNzdWVzIChubyBYU0Eg
aXNzdWVkIHVubGVzcyBpdCBhZmZlY3RlZCBvbmUgb2YgdGhlIHN1cHBvcnRlZCAKPiBjb25maWdz
KS4KClRoZSBvbmUgaXNzdWUgd2l0aCB0aGlzIHRoYXQgSSBzZWUgKGJlc2lkZXMgdGhlIGltcGxp
ZWQgdGVzdGluZyBuZWVkcywKYXMgZ2VuZXJhbGx5IGFsbCBvciBhdCBsZWFzdCBtb3N0IG9mIHRo
ZSBwb3NzaWJsZSBjb21iaW5hdGlvbnMgd2lsbCBuZWVkCnRlc3RpbmcpIGlzIHRoYXQgb25jZSB3
ZSBoYXZlIGNob3NlbiBzdWNoIGEgImhhbmRmdWwiLCB0aGVpciB2b2x1bWUKd2lsbCBsaWtlbHkg
Z3Jvdy4gUGx1cyBpdCBtYXkgYmUgZGlmZmljdWx0IHRvIGNvbWUgdG8gYW4gYWdyZWVtZW50IHdo
YXQKc2hvdWxkIG9yIHNob3VsZCBub3QgYmUgcGFydCBvZiB0aGlzICJoYW5kZnVsIi4gQnV0IHN1
cmUsIHdlIGNhbiBnaXZlCml0IGEgdHJ5IC4uLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
