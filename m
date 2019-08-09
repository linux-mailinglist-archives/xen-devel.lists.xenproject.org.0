Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC74388579
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2019 00:04:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwCx8-0003SQ-Ud; Fri, 09 Aug 2019 22:01:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hwCx6-0003SL-Sv
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 22:01:36 +0000
X-Inumbo-ID: 4119f928-baf1-11e9-b588-a78754aed6a2
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4119f928-baf1-11e9-b588-a78754aed6a2;
 Fri, 09 Aug 2019 22:01:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E76BA2089E;
 Fri,  9 Aug 2019 22:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565388095;
 bh=oOv0q9fSJzkl4R/94SpczNuLm6XbO1u8z01VUNXnIBU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=E7hAfurUZ2I2Qtkgl0fOd7rZhoxepO4zu7WfWn1QbBy8jhRjMpmFGCfZpr5TjI5pX
 6naCdVn0iXQASDROocubjQXYWAonA2AFCRX/HLxWrCiiUFJ2zDrpJAJI2QetIujrbM
 m5Lfhl/yFL9AobBijP0nyW7dKykX4XbNQaPvgoD4=
Date: Fri, 9 Aug 2019 15:01:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <532408cc-6352-9eee-cee1-0535df8a2c93@arm.com>
Message-ID: <alpine.DEB.2.21.1908091436430.7788@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-1-sstabellini@kernel.org>
 <532408cc-6352-9eee-cee1-0535df8a2c93@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 1/7] xen/arm: extend
 device_tree_for_each_node
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA3IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwNi8wOC8yMDE5IDIyOjQ5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBBZGQg
bmV3IHBhcmFtZXRlcnMgdG8gZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZTogbm9kZSwgZGVwdGgs
Cj4gPiBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzLgo+IAo+IGFkZHJlc3NfY2VsbHMgKHJlc3Au
IHNpemVfY2VsbHMpIGFyZSBuYW1lZCBhZGRyZXNzX2NlbGxzX3AgKHJlc3AuCj4gc2l6ZV9jZWxs
c19wKSBpbiB0aGUgY29kZS4KPiAKPiBCdXQgSSBhbSBub3QgY29udmluY2VkIHlvdSBuZWVkIHRo
ZW0uIFBlciB0aGUgRFQgc3BlYyAodjAuMiBzZWN0aW9uIDIuMy41KSwKPiB0aGUgcGFyZW50IHNo
b3VsZCBlaXRoZXIgY29udGFpbiB0aGUgI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzIG9y
IGRlZmF1bHQKPiB2YWx1ZXMgKHJlc3AuIDIgYW5kIDEpIHdpbGwgYmUgdXNlZC4gSXQgaXMgY2xl
YXJseSBzdGF0ZWQgdGhhdCB2YWx1ZXMgYXJlIG5vdAo+IGluaGVyaXRlZCBmcm9tIHRoZSBhbmNl
c3RvcnMuCgpZb3UgYXJlIHJpZ2h0LCBhbHNvIG9uIHBhZ2UgMjQgb2YgdGhlIGVQQVBSLgoKCj4g
U28gdGVjaG5pY2FsbHkgdGhlIGltcGxlbWVudGF0aW9uIG9mIGRldmljZV90cmVlX2Zvcl9lYWNo
X25vZGUoKSBpcyBpbmNvcnJlY3QuCj4gSWYgeW91IGZvbGxvdyB0aGUgc3BlYyBoZXJlLCB0aGVu
IHRoZSBhZGRyZXNzX2NlbGxzX3AgYW5kIHNpemVfY2VsbHNfcCB3b3VsZAo+IGJlY29tZSB1bm5l
Y2Vzc2FyeS4KCkluZGVlZC4KCgo+ID4gTm9kZSBpcyB0aGUgcGFyZW50IG5vZGUgdG8gc3RhcnQg
dGhlIHNlYXJjaCBmcm9tOwo+ID4gZGVwdGggaXMgdGhlIG1pbiBkZXB0aCBvZiB0aGUgc2VhcmNo
ICh0aGUgZGVwdGggb2YgdGhlIHBhcmVudCBub2RlKTsKPiA+IGFkZHJlc3NfY2VsbHMgYW5kIHNp
emVfY2VsbHMgYXJlIHRoZSByZXNwZWN0aXZlIHBhcmFtZXRlcnMgYXQgdGhlIHBhcmVudAo+ID4g
bm9kZS4gUGFzc2luZyAwLCAwLCAwLCAwIHRyaWdnZXJzIHRoZSBvbGQgYmVoYXZpb3IuID4KPiA+
IFdlIG5lZWQgdGhpcyBjaGFuZ2UgYmVjYXVzZSBpbiBmb2xsb3ctdXAgcGF0Y2hlcyB3ZSB3YW50
IHRvIGJlIGFibGUgdG8KPiA+IHVzZSByZXVzZSBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlIHRv
IGNhbGwgYSBmdW5jdGlvbiBmb3IgZWFjaCBjaGlsZHJlbgo+ID4gbm9kZXMgb2YgYSBwcm92aWRl
ZCBub2RlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZh
bm9zQHhpbGlueC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiAtIGFkZCBhZGRy
ZXNzX2NlbGxzIGFuZCBzaXplX2NlbGxzIHBhcmFtZXRlcnMKPiA+IAo+ID4gQ2hhbmdlcyBpbiB2
MzoKPiA+IC0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQo+ID4gLSBpbXByb3ZlIGluLWNvZGUgY29t
bWVudHMKPiA+IC0gaW1wcm92ZSBjb2RlIHN0eWxlCj4gPiAKPiA+IENoYW5nZXMgaW4gdjI6Cj4g
PiAtIG5ldwo+ID4gLS0tCj4gPiAgIHhlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYyAgICAgIHwgIDIg
Ky0KPiA+ICAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAgICAgICAgfCAyMSArKysrKysrKysrKysr
KystLS0tLS0KPiA+ICAgeGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmggfCAgNiArKysrLS0K
PiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FjcGkvYm9vdC5jIGIveGVuL2FyY2gv
YXJtL2FjcGkvYm9vdC5jCj4gPiBpbmRleCA5YjI5NzY5YTEwLi5kMjc1ZjhjNTM1IDEwMDY0NAo+
ID4gLS0tIGEveGVuL2FyY2gvYXJtL2FjcGkvYm9vdC5jCj4gPiArKysgYi94ZW4vYXJjaC9hcm0v
YWNwaS9ib290LmMKPiA+IEBAIC0yNDgsNyArMjQ4LDcgQEAgaW50IF9faW5pdCBhY3BpX2Jvb3Rf
dGFibGVfaW5pdCh2b2lkKQo+ID4gICAgICAgICovCj4gPiAgICAgICBpZiAoIHBhcmFtX2FjcGlf
b2ZmIHx8ICggIXBhcmFtX2FjcGlfZm9yY2UKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmJgo+ID4gZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZShkZXZpY2VfdHJlZV9mbGF0dGVu
ZWQsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZHRfc2Nhbl9kZXB0aDFfbm9kZXMsCj4gPiBOVUxMKSkpCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMCwgMCwgMCwgMCwgZHRfc2Nhbl9kZXB0aDFfbm9kZXMsIE5VTEwp
KSkKPiAKPiBOSVQ6IENhbiB3ZSBzcGxpdCB0aGUgaWY/CiAKU3VyZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
