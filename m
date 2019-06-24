Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458C651A86
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 20:29:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfTgK-0000Ve-QD; Mon, 24 Jun 2019 18:27:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqKT=UX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfTgK-0000VY-0e
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 18:27:08 +0000
X-Inumbo-ID: abc1291c-96ad-11e9-b3ae-c70ed72cf9a5
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abc1291c-96ad-11e9-b3ae-c70ed72cf9a5;
 Mon, 24 Jun 2019 18:27:07 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CC2420645;
 Mon, 24 Jun 2019 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561400826;
 bh=A0GHTH+fFd5oWF+Fn3ibBUIoOwmSvjWT4kpJC94r61E=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=cAimtPjPi/OiGRQ/0b0iabju8oV4WhAATdidOoMgWJuzu4rKf5D8Sb9U8bJvxD+e+
 VBDTTDDTL3tjt9HR8IGhdWZhDDpam/6CAReopK3qje/ipWDhMOirSTfYOp9tIxpNmR
 SuW5WGgaWJPFBqnZ5agpmb489n7kdDFV9uel8Qb0=
Date: Mon, 24 Jun 2019 11:27:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1906241109440.2468@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1906241121070.2468@sstabellini-ThinkPad-T480s>
References: <a7c44d926cbe4a0e6447c4aaf8d9862e@sslemail.net>
 <af3fe48d-afaa-3184-e142-9a1e2b8574f4@arm.com>
 <2ed30cde-e2ab-745e-94f5-0cf6155c9122@mxnavi.com>
 <7c645dfb-72f5-5fc2-b559-0a4d09ba8801@arm.com>
 <36531850-15de-2642-6f28-c752a360959c@mxnavi.com>
 <alpine.DEB.2.21.1906241109440.2468@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: io: add function
 swap_mmio_handler()
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
Cc: chenbaodong <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNCBKdW4gMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFRodSwg
MTMgSnVuIDIwMTksIGNoZW5iYW9kb25nIHdyb3RlOgo+ID4gPiA+IEJ1dCBjdXJyZW50bHkgaSBk
b24ndCB1bmRlcnN0YW5kIHhlbiB3ZWxsLCBvbmx5IGEgZmV3IHdlZWtzIGV4cGVyaWVuY2UuCj4g
PiA+IAo+ID4gPiBXZSBkbyBoYXZlIHNtYWxsIHRhc2sgZm9yIG5ld2NvbWVycyB0aGF0IHdvdWxk
IGltcHJvdmUgWGVuIGNvZGUgYmFzZSBhbmQKPiA+ID4gYWxzbyBhbGxvdyB5b3VyIHRvIHVuZGVy
c3RhbmQgbW9yZSBzb21lIHBhcnQgb2YgdGhlIGNvZGUuCj4gPiA+IAo+ID4gPiBJZiB5b3UgaGF2
ZSBhIHNwZWNpZmljIGFyZWEgb2YgaW50ZXJlc3QsIEkgY2FuIHNlZSBpZiBJIGhhdmUgc29tZSBz
bWFsbAo+ID4gPiB0YXNrcyB0aGVyZS4KPiA+IAo+ID4gSSdtIGhhcHB5IHdpdGggdGhpcy4KPiA+
IAo+ID4gSW50ZXJlc3RlZCBpbiBhcm0gcGxhdGZvcm0gZm9yIGVtYmVkZGVkIGFuZCBhdXRvbW90
aXZlIHVzZSBjYXNlLgo+ID4gCj4gPiB0aGluZ3MgbGlrZSBpbiB0aGlzIGxpbms6Cj4gPiBodHRw
czovL3hlbnByb2plY3Qub3JnL2RldmVsb3BlcnMvdGVhbXMvZW1iZWRkZWQtYW5kLWF1dG9tb3Rp
dmUvCj4gCj4gSGkgQmFvZG9uZywKPiAKPiBXb3VsZCB5b3UgYmUgdXAgZm9yIGEgZG9jdW1lbnRh
dGlvbiB0YXNrPyBEb24ndCB3b3JyeSBpZiB0aGUgRW5nbGlzaCBpcwo+IG5vdCBwZXJmZWN0LCBp
dCBjYW4gZWFzaWx5IGJlIGFkanVzdGVkIG9uIGNvbW1pdCwgYXMgbG9uZyBhcyB0aGUgY29udGVu
dAo+IGlzIGNvcnJlY3QuCj4gCj4gV2UgaGF2ZSByZWNlbnRseSBzdGFydGVkIGFuIGVmZm9ydCB0
byB3cml0ZSBiZXR0ZXIgZG9jdW1lbnRhdGlvbiBmb3IgYWxsCj4gZXh0ZXJuYWwgWGVuIGludGVy
ZmFjZXMuIEkgd3JvdGUgYSBsaXN0IG9mIHRoZXNlIGludGVyZmFjZXMgdGhhdCBuZWVkCj4gZG9j
dW1lbnRpbmc6Cj4gCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE5LTA2L21zZzAxMTExLmh0bWwKPiAKPiAKPiBGb3IgaW5zdGFuY2UsIHdl
IGFyZSBjdXJyZW50bHkgbWlzc2luZyBhIGRvY3VtZW50IGRlc2NyaWJpbmcgaW4gZGV0YWlscwo+
IHRoZSBkZXZpY2UgdHJlZSBleHBvc2VkIHRvIGEgRG9tVS4gWW91IGNhbiBzZWUgdGhlIGNvZGUg
dGhhdCBidWlsZHMgc3VjaAo+IGEgZGV2aWNlIHRyZWUgaW4gdG9vbHMvbGlieGwvL2xpYnhsX2Fy
bS5jLCBmb3Igbm9ybWFsIGd1ZXN0cywgYW5kIGluCj4geGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jIGZvciBkb20wIGFuZCBkb20wbGVzcyBndWVzdHMuIEZyb20gd2l0aGluIGEKPiBndWVzdCwg
eW91IGNhbiBzZWUgdGhlIGRldmljZXRyZWUgYnkgYWNjZXNzaW5nIC9wcm9jL2RldmljZS10cmVl
IChpZiB0aGUKPiBndWVzdCBpcyBMaW51eCkuCj4gCj4gSWYgeW91IGFyZSB1cCBmb3IgaXQsIGl0
IHdvdWxkIGJlIGdyZWF0IHRvIGdldCB0aGF0IHdyaXR0ZW4gZG93bgo+IGNsZWFybHkuIFlvdSBj
b3VsZCBhZGQgdG8gZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ndWVzdC50eHQsIHdoaWNoIGlz
Cj4gb25seSBkZXNjcmliaW5nIHRoZSB4ZW4gaHlwZXJ2aXNvciBub2RlLCBidXQgbm90aGluZyBl
bHNlLiBQcm9iYWJseSBpdAo+IHdvdWxkIGJlIGJldHRlciB0byByZW5hbWUgZG9jcy9taXNjL2Fy
bS9kZXZpY2UtdHJlZS9ndWVzdC50eHQgdG8KPiBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2h5
cGVydmlzb3IudHh0IGFuZCBjcmVhdGUgYSBuZXcKPiBkb2NzL21pc2MvYXJtL2RldmljZS10cmVl
L2d1ZXN0LnR4dCBkb2N1bWVudCB3aXRoIHRoZSBkZXNjcmlwdGlvbiBvZiBhbGwKPiBub2RlcyBl
eHBvc2VkIHRvIGRvbVVzLiBZb3UgY291bGQgcG9pbnQgdG8gdGhlIGZ1bGwgZGVzY3JpcHRpb24g
b2YgZWFjaAo+IG5vZGUgdG8gdGhlIGJpbmRpbmcgdW5kZXIgTGludXguIEZvciBpbnN0YW5jZSwg
dGhlIGJpbmRpbmcgZm9yIHRoZSBBcm0KPiBhcmNoIHRpbWVyIGlzIGRlc2NyaWJlZCBoZXJlOgo+
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
OS0wNi9tc2cwMTExMS5odG1sCj4gCj4gRG9lcyBpdCBtYWtlIHNlbnNlPwoKTGV0IG1lIGFkZCB0
aGF0IGlmIHlvdSBwcmVmZXIgdG8gZG9jdW1lbnQgb25lIG9mIHRoZSBvdGhlciBpbnRlcmZhY2Vz
Cmxpc3RlZCBhYm92ZSBpbiBteSBlbWFpbCwgeW91IGFyZSB3ZWxjb21lIHRvIHBpY2sgYW5vdGhl
ciBvbmUuIEZvcgpleGFtcGxlLCB3ZSBhcmUgYWxzbyBtaXNzaW5nIGEgZG9jIGFib3V0IHRoZSBE
b21VIG1lbW9yeSBtYXAsIGxpc3RpbmcKYWxsIG1lbW9yeSByZWdpb25zIHdpdGggYWRkcmVzc2Vz
IGFuZCBzaXplcywgYm90aCBNTUlPIGFuZCBub3JtYWwKbWVtb3J5LiBGb3IgdGhhdCwgbW9zdCBv
ZiB0aGUgaW5mb3JtYXRpb24gaXM6Cgp4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAoKQSB3
ZWxsIHdyaXR0ZW4gaW4tY29kZSBjb21tZW50IGluIGFyY2gtYXJtLmggd291bGQgYmUgT0ssIG9y
IGFsc28gYQpkb2N1bWVudCB1bmRlciBkb2NzL21pc2MvYXJtLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
