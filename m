Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9258C3FE9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 20:34:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFMvD-00087y-CP; Tue, 01 Oct 2019 18:30:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFMvB-00087t-Ve
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 18:30:50 +0000
X-Inumbo-ID: 973902d4-e479-11e9-9705-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 973902d4-e479-11e9-9705-12813bfff9fa;
 Tue, 01 Oct 2019 18:30:49 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30F34215EA;
 Tue,  1 Oct 2019 18:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569954648;
 bh=nN+N4tPpwfx12zXwNW5tpydNX0vv7BmCAzR6CDp+lz0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ljtvQyd6P33CgmmsxdVcO35EhE5vu54nQYhTBHMPLNtZHlGVjHdOHt54Pp2cLg/cO
 u5UPdoeeSQhFq6lMX94sj9GsDxMczlXbFGaJaUSXXuHc8pE51wCymZ4P7nR+XENOKR
 yo5DrzkeopIR8jgdxzYLvD7hCwGx/0vwzaVlFr5I=
Date: Tue, 1 Oct 2019 11:30:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Liu <wl@xen.org>
In-Reply-To: <20190916102345.y5sfpzc6s46ox6qx@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Message-ID: <alpine.DEB.2.21.1910011130390.20899@sstabellini-ThinkPad-T480s>
References: <20190913103953.8182-1-julien.grall@arm.com>
 <20190916102345.y5sfpzc6s46ox6qx@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Add Skeleton for using
 configuring early printk using Kconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNiBTZXAgMjAxOSwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIFNlcCAxMywgMjAx
OSBhdCAxMTozOTo1M0FNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiBBdCB0aGUgbW9t
ZW50LCBlYXJseSBwcmludGsgY2FuIG9ubHkgYmUgY29uZmlndXJlZCBvbiB0aGUgbWFrZSBjb21t
YW5kCj4gPiBsaW5lLiBJdCBpcyBub3QgdmVyeSBoYW5keSBiZWNhdXNlIGEgdXNlciBoYXMgdG8g
cmVtb3ZlIHRoZSBvcHRpb24KPiA+IGV2ZXJ5dGltZSBpdCBpcyB1c2luZyBhbm90aGVyIGNvbW1h
bmQgb3RoZXIgdGhhbiBjb21waWxpbmcgdGhlCj4gPiBoeXBlcnZpc29yLgo+ID4gCj4gPiBGdXJ0
aGVybW9yZSwgZWFybHkgcHJpbnRrIGlzIG9uZSBvZiB0aGUgZmV3IG9kZHMgb25lIHRoYXQgYXJl
IG5vdCB1c2luZwo+ID4gS2NvbmZpZy4KPiA+IAo+ID4gU28gdGhpcyBpcyBhYm91dCB0aW1lIHRv
IG1vdmUgaXQgdG8gS2NvbmZpZy4gRm9yIG5vdywgYSBza2VsZXRvbiBpcwo+ID4gYWRkZWQgd2l0
aCBvbmUgZXhhbXBsZSBiYXNlZCBvbiBDYWRlbmNlIFVBUlQuIEZvbGxvdy11cCB3aWxsIGNvbnRp
bnVlIHRvCj4gPiBjb252ZXJ0IGFsbCB0aGUgb3B0aW9ucyB0byBLY29uZmlnLgo+ID4gCj4gPiBC
ZWNhdXNlIEtjb25maWcgd2lsbCBwcmVmaXggYWxsIHRoZSBjb25maWcgYnkgQ09ORklHXywgaXQg
aXMgbmVjZXNzYXJ5Cj4gPiB0byBhZGFwdCB0aGUgZGVmaW5lIHdpdGhpbiB0aGUgY29kZS4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
PiA+IAo+ID4gLS0tCj4gPiAKPiA+IEkgaGF2ZSBzZW50IGl0IGFzIFJGQyBiZWNhdXNlIHRoaXMg
aXMgbm90IGNvbXBsZXRlLiBJIHdpbGwgY29udmVydCB0aGUKPiA+IHJlc3Qgb25jZSB3ZSBhZ3Jl
ZSB0aGUgYXBwcm9hY2ggaXMgY29ycmVjdC4KPiAKPiBIYXZpbmcgYSB0b3AtbGV2ZWwgS2NvbmZp
Zy5kZWJ1ZyBhbmQgaW5jbHVkZXMgYXJjaCBzcGVjaWZpYyBydWxlcyBpcyBob3cKPiBMaW51eCBk
b2VzIGl0IChhbGJlaXQgd2l0aCBkaWZmZXJlbnQgZGlyZWN0b3J5IHN0cnVjdHVyZSksIHNvIEkg
dGhpbmsKPiB3ZSdyZSBqdXN0IGZvbGxvd2luZyB0aGUgbm9ybSBoZXJlLiBObyBvYmplY3Rpb24g
ZnJvbSBtZS4KCkkgYWdyZWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
