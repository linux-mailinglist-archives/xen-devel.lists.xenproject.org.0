Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98C51F74
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 02:03:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfYs9-00004y-8T; Mon, 24 Jun 2019 23:59:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqKT=UX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfYs7-00004s-Do
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 23:59:39 +0000
X-Inumbo-ID: 1f872be8-96dc-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1f872be8-96dc-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 23:59:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B6A720679;
 Mon, 24 Jun 2019 23:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561420777;
 bh=/DJhEteWNqmFr9lOO7jgZSSgPMQLpfSzOPsNaGE3TMY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=gLlz6cxNjJkimU0P7Hst7LSvyNn9zDNn2Gg6sPWuVsMgj4iGqQYuTWHaq0isJB10L
 2qA/QGLhL5QsWJftiTfQ/8rj5baQxK0rvhYiNNrMGFOst4O384gqiT/YXKvX+k9J1b
 v/f6Unfemp5HoD/7bYCcIDsV+dV60lXnqdv677WA=
Date: Mon, 24 Jun 2019 16:59:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <c253cdaf-658d-01ce-9d32-273db4a84f17@arm.com>
Message-ID: <alpine.DEB.2.21.1906241435510.2468@sstabellini-ThinkPad-T480s>
References: <a7c44d926cbe4a0e6447c4aaf8d9862e@sslemail.net>
 <af3fe48d-afaa-3184-e142-9a1e2b8574f4@arm.com>
 <2ed30cde-e2ab-745e-94f5-0cf6155c9122@mxnavi.com>
 <7c645dfb-72f5-5fc2-b559-0a4d09ba8801@arm.com>
 <36531850-15de-2642-6f28-c752a360959c@mxnavi.com>
 <alpine.DEB.2.21.1906241109440.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241121070.2468@sstabellini-ThinkPad-T480s>
 <bc042ae4-db0a-6b25-1e9c-d71a73a0315d@arm.com>
 <alpine.DEB.2.21.1906241313480.2468@sstabellini-ThinkPad-T480s>
 <c253cdaf-658d-01ce-9d32-273db4a84f17@arm.com>
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
Cc: chenbaodong <chenbaodong@mxnavi.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDYv
MjQvMTkgOToxNyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gTW9uLCAyNCBK
dW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSBTdGVmYW5vLAo+ID4gPiAKPiA+
ID4gT24gMjQvMDYvMjAxOSAxOToyNywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiA+
IE9uIE1vbiwgMjQgSnVuIDIwMTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gPiA+
IE9uIFRodSwgMTMgSnVuIDIwMTksIGNoZW5iYW9kb25nIHdyb3RlOgo+ID4gPiA+IExldCBtZSBh
ZGQgdGhhdCBpZiB5b3UgcHJlZmVyIHRvIGRvY3VtZW50IG9uZSBvZiB0aGUgb3RoZXIgaW50ZXJm
YWNlcwo+ID4gPiA+IGxpc3RlZCBhYm92ZSBpbiBteSBlbWFpbCwgeW91IGFyZSB3ZWxjb21lIHRv
IHBpY2sgYW5vdGhlciBvbmUuIEZvcgo+ID4gPiA+IGV4YW1wbGUsIHdlIGFyZSBhbHNvIG1pc3Np
bmcgYSBkb2MgYWJvdXQgdGhlIERvbVUgbWVtb3J5IG1hcCwgbGlzdGluZwo+ID4gPiA+IGFsbCBt
ZW1vcnkgcmVnaW9ucyB3aXRoIGFkZHJlc3NlcyBhbmQgc2l6ZXMsIGJvdGggTU1JTyBhbmQgbm9y
bWFsCj4gPiA+ID4gbWVtb3J5LiBGb3IgdGhhdCwgbW9zdCBvZiB0aGUgaW5mb3JtYXRpb24gaXM6
Cj4gPiA+ID4gCj4gPiA+ID4geGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmgKPiA+ID4gPiAK
PiA+ID4gPiBBIHdlbGwgd3JpdHRlbiBpbi1jb2RlIGNvbW1lbnQgaW4gYXJjaC1hcm0uaCB3b3Vs
ZCBiZSBPSywgb3IgYWxzbyBhCj4gPiA+ID4gZG9jdW1lbnQgdW5kZXIgZG9jcy9taXNjL2FybS4K
PiA+ID4gCj4gPiA+IFBsZWFzZSBubyBkdXBsaWNhdGlvbiwgaXQgaXMgYWxyZWFkeSBxdWl0ZSBo
YXJkIHRvIG1haW50YWluIG9uZSBwbGFjZS4KPiA+ID4gSW5zdGVhZCwgd2Ugc2hvdWxkIGRvY3Vt
ZW50IGFsbCB0aGUgaGVhZGVycyBpbiBhIGRvY3VtZW50ZWQgZm9ybWF0IHRoYXQKPiA+ID4gY2Fu
IGJlIGV4dHJhY3RlZCBhdXRvbWF0aWNhbGx5Lgo+ID4gCj4gPiBBcyB3ZSBoYXZlIG5vIHN1Y2gg
dGhpbmcgdG9kYXkgKGFzIGZhciBhcyBJIGFtIGF3YXJlKSwgcGxlYXNlIG1ha2UgYQo+ID4gcHJv
cG9zYWwgd2l0aCBhIGJpdCBtb3JlIGRldGFpbHMsIG90aGVyd2lzZSBJIGRvbid0IHRoaW5rIEJh
b2Rvbmcgd2lsbAo+ID4gYmUgYWJsZSB0byB0YWtlIHRoZSBuZXh0IHN0ZXAuCj4gCj4gSSBkb24n
dCBoYXZlIGEgY29uY3JldGUgcHJvcG9zYWwgc28gZmFyLiBFeGNlcHQgdGhhdCBkb2N1bWVudGF0
aW9uIG91dHNpZGUgb2YKPiB0aGUgaGVhZGVycyBpcyBhIG5vLWdvIGZyb20gbXkgc2lkZS4gVGhl
IGdvYWwgb2YgZG9jdW1lbnRpbmcgd2l0aGluIHRoZQo+IGhlYWRlcnMgcmF0aGVyIHRoYW4gb3V0
c2lkZSBpcyB5b3UgYWxzbyBoZWxwIHRoZSBkZXZlbG9wZXIgb2YgZ3Vlc3QgT1MuCj4gCj4gQSBm
ZXcgd2Vla3MgYWdvIElhbiBKYWNrc29uIHBvaW50ZWQgdG8gZG9jcy94ZW4taGVhZGVycyBmb3Ig
YSBwb3RlbnRpYWwKPiBzeW50YXguIFNhZGx5LCB0aGVyZSBhcmUgbm8gZG9jdW1lbnRhdGlvbiBv
ZiB0aGUgc2NyaXB0IHNvIGZhci4gSSBoYXZlbid0IGhhZAo+IHRpbWUgdG8gbG9vayBpdCBzbyBm
YXIuCgpJbiB0aGF0IGNhc2UsIEknZCBzdWdnZXN0IGZvciBCYW9kb25nIHRvIGVpdGhlciBwaWNr
IHRoZSBkZXZpY2UgdHJlZQpkb2N1bWVudGF0aW9uIGl0ZW0gKGFzc3VtaW5nIHlvdSBhcmUgT0sg
d2l0aCB0aGF0IG9uZSBiZWluZyB1bmRlcgpkb2NzL21pc2MvYXJtKSBvciBqdXN0IHdyaXRlIGEg
bm9ybWFsIGluLWNvZGUgY29tbWVudCBpbiBhcmNoLWFybS5oIGZvcgp0aGUgZG9tVSBtZW1vcnkg
bWFwIG5vdCB3b3JyeWluZyBhYm91dCB0aGUgZm9ybWF0IG9mIHRoZSBpbi1jb2RlIGNvbW1lbnQK
Zm9yIG5vdy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
