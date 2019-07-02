Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1BC5D2C6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 17:26:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiKdM-0002ye-PI; Tue, 02 Jul 2019 15:23:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hiKdL-0002yZ-5N
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 15:23:51 +0000
X-Inumbo-ID: 6474ab16-9cdd-11e9-bcce-536333a5c266
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6474ab16-9cdd-11e9-bcce-536333a5c266;
 Tue, 02 Jul 2019 15:23:50 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0666E21721;
 Tue,  2 Jul 2019 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562081029;
 bh=nF7XcumMKz5Z9zsz2iGrwoT3ymdSGozlBam86ZQl/QI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Gc8AD7Y9P3k5vTYbHXefgkYwiARTWIKc8u+irMgHhN4yExSSuU0vx0uNiumsg9/9Q
 m7isksTv3pwPlBiJsWjyhBYIE++K2+WEPqoSdZsVa6vkWVkYyJ8UI5PmCHO377OhCf
 2Jg/wP2kE7KbE0n1/4HeXMvTTbi8uWR4O71Sn0ro=
Date: Tue, 2 Jul 2019 08:23:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190702135327.26543-1-anthony.perard@citrix.com>
Message-ID: <alpine.DEB.2.21.1907020823390.14636@sstabellini-ThinkPad-T480s>
References: <20190702135327.26543-1-anthony.perard@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add Anthony as libxl maintainer
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyIEp1bCAyMDE5LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBDcmVhdGUgYSBuZXcg
c2VjdGlvbiB3aXRoIG9ubHkgbGlieGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gSSd2ZSBjcmVhdGVkIGEgbmV3
IHNlY3Rpb24gZm9yIG9ubHkgbGlieGVubGlnaHQgYnV0IGlmIHlvdSB3b3VsZAo+IHByZWZlciB0
byBhZGQgbWUgaW50byBUT09MU1RBQ0sgaW5zdGVhZCwgdGhhdCBtaWdodCBiZSBvay4gSSBqdXN0
Cj4gZG9uJ3QgaGF2ZSBtdWNoIGV4cGVyaWVuY2Ugd2l0aCB0aGUgcmVzdCBvZiB0b29scy8uCj4g
LS0tCj4gIE1BSU5UQUlORVJTIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGlu
ZGV4IDg4MmU0ZWZhMjIuLmI4ZTRkYWFlNDEgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiAr
KysgYi9NQUlOVEFJTkVSUwo+IEBAIC0yODQsNiArMjg0LDEzIEBAIEY6CXhlbi9pbmNsdWRlL3tr
ZXhlYyxraW1hZ2V9LmgKPiAgRjoJeGVuL2FyY2gveDg2L21hY2hpbmVfa2V4ZWMuYwo+ICBGOgl4
ZW4vYXJjaC94ODYveDg2XzY0L2tleGVjX3JlbG9jLlMKPiAgCj4gK0xJQlhFTkxJR0hUCj4gK006
CUlhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+ICtNOglXZWkgTGl1IDx3
bEB4ZW4ub3JnPgo+ICtNOglBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KPiArUzoJU3VwcG9ydGVkCj4gK0Y6CXRvb2xzL2xpYnhsLwo+ICsKPiAgTElWRVBBVENICj4g
IE06CUtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiAgTToJ
Um9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+Cj4gLS0gCj4gQW50aG9u
eSBQRVJBUkQKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
