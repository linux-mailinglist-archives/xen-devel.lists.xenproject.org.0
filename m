Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD3B952E4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 02:58:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzsQb-0005Jh-AX; Tue, 20 Aug 2019 00:55:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hzsQa-0005JY-Er
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 00:55:12 +0000
X-Inumbo-ID: 29aebe6c-c2e5-11e9-8bf0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29aebe6c-c2e5-11e9-8bf0-12813bfff9fa;
 Tue, 20 Aug 2019 00:55:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA2D622CE8;
 Tue, 20 Aug 2019 00:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566262511;
 bh=soa2GxZoOOhJI2Kz8zAneHSYEF6GCE+yryTKX84f+Dk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=g0McnXfkOuraLpu3NK3bCK/CMRm0HPFAjY0QDEkcdZ+EYVdFoZT8H7kbgunI5dNro
 42JcXdpS4X/3ZFA3vpC0Xzzy/qQbMCeydxjeEsZzhW0Cz43zmAykWGy4DhiL8CJay/
 cPFWrMVQHiuFRlK99dI0Gh9kROkg88NPIOrOaVxI=
Date: Mon, 19 Aug 2019 17:55:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <7715e474-0102-d7fe-7cd6-e26404280d57@arm.com>
Message-ID: <alpine.DEB.2.21.1908191754360.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-5-sstabellini@kernel.org>
 <7715e474-0102-d7fe-7cd6-e26404280d57@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 5/6] xen/arm: introduce nr_spis
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA5IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiA4LzkvMTkgMTI6MTIgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IFdlIGRv
bid0IGhhdmUgYSBjbGVhciB3YXkgdG8ga25vdyBob3cgbWFueSB2aXJ0dWFsIFNQSXMgd2UgbmVl
ZCBmb3IgdGhlCj4gPiBib290IGRvbWFpbnMuIEludHJvZHVjZSBhIG5ldyBvcHRpb24gdW5kZXIg
eGVuLGRvbWFpbiB0byBzcGVjaWZ5IHRoZQo+ID4gbnVtYmVyIG9mIFNQSXMgdG8gYWxsb2NhdGUg
Zm9yIHRoZSBkb21haW4uCj4gPiAKPiA+IFRoZSBwcm9wZXJ0eSBpcyBvcHRpb25hbCwgd2hlbiBh
YnNlbnQsIHdlJ2xsIHVzZSB0aGUgcGh5c2ljYWwgbnVtYmVyIG9mCj4gPiBnaWMgbGluZXMgZm9y
IGRvbTBsZXNzIGRvbWFpbnMsIGp1c3QgbGlrZSBmb3IgZG9tMC4gR2l2ZW4gdGhhdCBkb20wbGVz
cwo+ID4gVk1zIGFyZSBtZWFudCBmb3Igc3RhdGljIHBhcnRpdGlvbmluZyBzY2VuYXJpb3Mgd2hl
cmUgdGhlIG51bWJlciBvZiBWTXMKPiA+IGlzIHZlcnkgbG93LCBpbmNyZWFzZWQgbWVtb3J5IG92
ZXJoZWFkIHNob3VsZCBub3QgYmUgYSBwcm9ibGVtLCBhbmQgaXQKPiA+IGlzIHBvc3NpYmxlIHRv
IG1pbmltaXppbmcgaXQgYnkgdXNpbmcgIm5yX3NwaXMiLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gPiAtLS0KPiA+IENo
YW5nZXMgaW4gdjM6Cj4gPiAtIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UKPiA+IC0gaW50cm9kdWNl
IG5yX3NwaXMKPiA+IC0tLQo+ID4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCA3ICsr
Ky0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4gaW5kZXggMDA1N2E1MDlkMS4uZmM0ZTViYzRj
YSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4gKysrIGIv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiBAQCAtMjI3MCw3ICsyMjcwLDYgQEAgdm9p
ZCBfX2luaXQgY3JlYXRlX2RvbVVzKHZvaWQpCj4gPiAgICAgICAgICAgc3RydWN0IGRvbWFpbiAq
ZDsKPiA+ICAgICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gZF9jZmcgPSB7
Cj4gPiAgICAgICAgICAgICAgIC5hcmNoLmdpY192ZXJzaW9uID0gWEVOX0RPTUNUTF9DT05GSUdf
R0lDX05BVElWRSwKPiA+IC0gICAgICAgICAgICAuYXJjaC5ucl9zcGlzID0gMCwKPiA+ICAgICAg
ICAgICAgICAgLmZsYWdzID0gWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0IHwgWEVOX0RPTUNUTF9D
REZfaGFwLAo+ID4gICAgICAgICAgICAgICAubWF4X2V2dGNobl9wb3J0ID0gLTEsCj4gPiAgICAg
ICAgICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gNjQsCj4gPiBAQCAtMjI4MCwxMyArMjI3OSwx
MyBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tVXModm9pZCkKPiA+ICAgICAgICAgICBpZiAoICFk
dF9kZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAieGVuLGRvbWFpbiIpICkKPiA+ICAgICAgICAg
ICAgICAgY29udGludWU7Cj4gPiAgIC0gICAgICAgIGlmICggZHRfcHJvcGVydHlfcmVhZF9ib29s
KG5vZGUsICJ2cGwwMTEiKSApCj4gPiAtICAgICAgICAgICAgZF9jZmcuYXJjaC5ucl9zcGlzID0g
R1VFU1RfVlBMMDExX1NQSSAtIDMyICsgMTsKPiA+IC0KPiAKPiBUaGlzIGNoYW5nZSBpcyBub3Qg
c3BlY2lmaWVkIGluIHRoZSBjb21taXQgbWVzc2FnZSBub3IgdGhlIGRvY3VtZW50YXRpb24uCgpJ
J2xsIGFkZCBhIHJlZmVyZW5jZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCgoKPiBUaGlzIHdpbGwg
bGlrZWx5IGxlYWQgdG8gc29tZSBpc3N1ZXMgaWYgdGhlIG51bWJlciBvZiBTUElzIHByb2dyYW1t
ZWQgKGVpdGhlcgo+IGZyb20gdGhlIERUIG9yIHRoZSBIYXJkd2FyZSkgaXMgc21hbGxlciB0aGFu
IHRoZSB0aGUgU1BJIGhlcmUuCj4gCj4gRnVydGhlbW9yZSwgaXQgaXMgaW1wb3J0YW50IHRvIHdy
aXRlIGRvd24gaW4gdGhlIGRvY3VtZW50YXRpb24gdGhhdCB0aGUgU1BJCj4gdXNlZCBieSB2cGww
MTEgbWF5IGNsYXNoIHdpdGggYSBkZXZpY2UgaW50ZXJydXB0IHJvdXRlZCB0byB0aGUgZ3Vlc3Qu
CgpHb29kIHBvaW50cywgSSdsbCBhZGQgdGhvc2UgaW5mbyB0byB0aGUgZG9jcy4KCgo+ID4gICAg
ICAgICAgIGlmICggIWR0X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJjcHVzIiwgJmRfY2ZnLm1h
eF92Y3B1cykgKQo+ID4gICAgICAgICAgICAgICBwYW5pYygiTWlzc2luZyBwcm9wZXJ0eSAnY3B1
cycgZm9yIGRvbWFpbiAlc1xuIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgZHRfbm9kZV9uYW1l
KG5vZGUpKTsKPiA+ICAgKyAgICAgICAgaWYgKCAhZHRfcHJvcGVydHlfcmVhZF91MzIobm9kZSwg
Im5yX3NwaXMiLCAmZF9jZmcuYXJjaC5ucl9zcGlzKQo+ID4gKQo+ID4gKyAgICAgICAgICAgIGRf
Y2ZnLmFyY2gubnJfc3BpcyA9IGdpY19udW1iZXJfbGluZXMoKSAtIDMyOwo+ID4gKwo+ID4gICAg
ICAgICAgIGQgPSBkb21haW5fY3JlYXRlKCsrbWF4X2luaXRfZG9taWQsICZkX2NmZywgZmFsc2Up
Owo+ID4gICAgICAgICAgIGlmICggSVNfRVJSKGQpICkKPiA+ICAgICAgICAgICAgICAgcGFuaWMo
IkVycm9yIGNyZWF0aW5nIGRvbWFpbiAlc1xuIiwgZHRfbm9kZV9uYW1lKG5vZGUpKTsKPiA+IAo+
IAo+IENoZWVycywKPiAKPiAtLSAKPiBKdWxpZW4gR3JhbGwKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
