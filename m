Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0728E088
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 00:14:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hy1Uj-0000fU-I1; Wed, 14 Aug 2019 22:11:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hy1Ui-0000fP-60
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 22:11:48 +0000
X-Inumbo-ID: 81df2738-bee0-11e9-8b98-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81df2738-bee0-11e9-8b98-12813bfff9fa;
 Wed, 14 Aug 2019 22:11:47 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B252520651;
 Wed, 14 Aug 2019 22:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565820706;
 bh=Iy2i4Os70EzYintyxaiR8y5TylhiBsbmasxB4o9oYUU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=JPYjGCGo8P7DbD6S2cXtabFsKNARhOE9iQj7jAd0VrrPpnzP19Kq4WzJYVdydL01u
 WAikRzdXJE03zZHc1gTQ/RKU6YCkpuEjBDXblXwyXqlkkB35r0WIxgPFDtmIU+OVH0
 mfQ7oYZIvZV/NFfPubQjtyEYilN+IYbt4KT6WMTA=
Date: Wed, 14 Aug 2019 15:11:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <b6fa1f2b-52e8-b7ac-df32-aab9d81b4ca8@arm.com>
Message-ID: <alpine.DEB.2.21.1908141511270.8737@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-1-sstabellini@kernel.org>
 <b6fa1f2b-52e8-b7ac-df32-aab9d81b4ca8@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v5 1/7] xen/arm: pass node to
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxMyBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDgv
MTIvMTkgMTE6MjggUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IEFkZCBhIG5ldyBw
YXJhbWV0ZXIgdG8gZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZTogbm9kZSwgdGhlIG5vZGUgdG8K
PiA+IHN0YXJ0IHRoZSBzZWFyY2ggZnJvbS4gUGFzc2luZyAwIHRyaWdnZXJzIHRoZSBvbGQgYmVo
YXZpb3IuCj4gPiAKPiA+IFNldCBtaW5fZGVwdGggdG8gZGVwdGggb2YgdGhlIGN1cnJlbnQgbm9k
ZSArIDEgYW5kIHJlcGxhY2UgdGhlIGZvcgo+ID4gbG9vcCB3aXRoIGEgZG8vd2hpbGUgbG9vcCB0
byBhdm9pZCBzY2FubmluZyBzaWJsaW5ncyBvZiB0aGUgaW5pdGlhbCBub2RlCj4gPiBwYXNzZWQg
YXMgYW4gYXJndW1lbnQuCj4gPiAKPiA+IFdlIG5lZWQgdGhpcyBjaGFuZ2UgYmVjYXVzZSBpbiBm
b2xsb3ctdXAgcGF0Y2hlcyB3ZSB3YW50IHRvIGJlIGFibGUgdG8KPiA+IHVzZSByZXVzZSBkZXZp
Y2VfdHJlZV9mb3JfZWFjaF9ub2RlIHRvIGNhbGwgYSBmdW5jdGlvbiBmb3IgZWFjaCBjaGlsZHJl
bgo+ID4gbm9kZXMgb2YgYSBwcm92aWRlZCBub2RlIGFuZCB0aGUgbm9kZSBpdHNlbGYuCj4gCj4g
SSBoYXZlIHRvIHNheSB0aGlzIHdvdWxkIGJlIGZhaXJseSBjb25mdXNpbmcgZm9yIHJlc2VydmVk
LW1lbW9yeSBiZWNhdXNlIHlvdQo+IGFyZSBvbmx5IGV4cGVjdGluZyB0byBwYXJzZSB0aGUgc3Vi
bm9kZS4KPiAKPiBGdXJ0aGVybW9yZSwgaW4gdGhlIHVubGlrZWx5IGV2ZW50IHRvIGZpcnN0IG5v
ZGUgZG9lcyBoYXZlIGEgcHJvcGVydHkgInJlZ3MiLAo+IHRoZW4gI2FkZHJlc3MtY2VsbHMgYW5k
ICNzaXplLWNlbGxzIGlzIGdvaW5nIHRvIGJlIGluY29ycmVjdCAod2UgZG9uJ3QgbG9vayB1cAo+
IGZvciBpdHMgcGFyZW50Li4uKS4KPiAKPiBTbyBJIHRoaW5rIGl0IHdvdWxkIGJlIGJlc3QgdG8g
Y29uc2lkZXIgdG8gaWdub3JlIHRoZSBmaXJzdCBub2RlLiBUaGlzIHNob3VsZAo+IG5vdCBiZSBh
biBpc3N1ZSBhcyBub25lIG9mIHRoZSB1c2VyIGNhcmUgYWJvdXQgdGhlIHJvb3Qgbm9kZSAoaS5l
IC8pLiBJdCB3b3VsZAo+IGFsc28gbWFrZXMgdGhlIGludGVyZmFjZSBtb3JlIHN0cmFpZ2h0Zm9y
d2FyZC4KClllcywgSSBjYW4gZG8gdGhhdC4gSXQgaXMgYSBnb29kIGlkZWEuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
