Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D776AE7BB5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 22:47:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPCnI-00021Q-Vb; Mon, 28 Oct 2019 21:43:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iPCnI-00021L-CL
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 21:43:20 +0000
X-Inumbo-ID: f4eb44f2-f9cb-11e9-9500-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4eb44f2-f9cb-11e9-9500-12813bfff9fa;
 Mon, 28 Oct 2019 21:43:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF2D1217D6;
 Mon, 28 Oct 2019 21:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572298999;
 bh=YSeZExxYbBKF+30Z46sgpIketpHJLIScdTwEHGXZ2kg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=YAwfoLk4yOX6Gsd2i9oBM40xaEcr2ZLaVlW2PyX0MIie/Fcag/6bMhVPQEgGGmBBN
 2SatTbTgs+ilnUIq449c/SvjCqIYepKLKaJwtijMuBFNi7iSERcujaTOzCUOt5ia49
 7o3AemFneBH1qbO6Bc+NpmwtWzzUyLY5GUkHjnk0=
Date: Mon, 28 Oct 2019 14:43:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
In-Reply-To: <a2ed0638-846a-fd4a-9093-0f5026eac881@gmail.com>
Message-ID: <alpine.DEB.2.21.1910281144180.29150@sstabellini-ThinkPad-T480s>
References: <4f0a30c7-911e-90ab-0875-83f3d4c454b5@suse.com>
 <a2ed0638-846a-fd4a-9093-0f5026eac881@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] getting 4.11.3 ready
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyOCBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI1
LzEwLzIwMTkgMTE6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gQWxsLAo+ID4gCj4gPiB0aGUg
NC4xMS4zIHN0YWJsZSByZWxlYXNlIGlzIGR1ZS4gSSBpbnRlbmQgdG8gd2FpdCBmb3IgdGhlIFhT
QSBmaXhlcwo+ID4gZ29pbmcgcHVibGljIG9uIHRoZSAzMXN0LCBidXQgbm90IChtdWNoKSBsb25n
ZXIuIFBsZWFzZSBwb2ludCBvdXQKPiA+IGJhY2twb3J0aW5nIGNhbmRpZGF0ZXMgdGhhdCB5b3Ug
ZmluZCBtaXNzaW5nIGZyb20gdGhlIHJlc3BlY3RpdmUKPiA+IHN0YWJsZSB0cmVlcy4gSSBoYXZl
IHRocmVlIG9uZXMgcXVldWVkIHdoaWNoIGhhdmVuJ3QgcGFzc2VkIHRoZSBwdXNoCj4gPiBnYXRl
IHRvIHRoZSBtYXN0ZXIgYnJhbmNoIHlldDoKPiA+IAo+ID4gOTI1N2MyMThlNQl4ODYvdnZteDog
Rml4IHRoZSB1c2Ugb2YgUkRUU0NQIHdoZW4gaXQgaXMgaW50ZXJjZXB0ZWQgYXQgTDAKPiA+IDdl
ZWU5YzE2ZDYJeDg2L3RzYzogdXBkYXRlIHZjcHUgdGltZSBpbmZvIG9uIGd1ZXN0IFRTQyBhZGp1
c3RtZW50cwo+ID4gOTYzMzkyOTgyNAl4ODY6IGZpeCBvZmYtYnktb25lIGluIGlzX3hlbl9maXhl
ZF9tZm4oKQo+IAo+IFdlIGRvbid0IHNlZW0gdG8gaGF2ZSBiYWNrcG9ydGVkIHBhdGNoZXMgZm9y
IHF1aXRlIGEgd2hpbGUgb24gQXJtLiBTb21lIG9mIG15Cj4gcGF0Y2hlcyBoYXZlIGJlZW4gbWFy
a2VkIGFzIHRvIGJlIGJhY2twb3J0ZWQgZnJvbSB0aGUgYmVnaW5uaW5nIFsxXS4gSSBhbQo+IHNw
ZWNpZmljYWxseSB0aGlua2luZyB0bzoKPiAJCj4gZTA0ODE4YjQ2ZCB4ZW4vYXJtOiB0cmFwczog
QXZvaWQgdXNpbmcgQlVHX09OKCkgdG8gY2hlY2sgZ3Vlc3Qgc3RhdGUgaW4KPiBhZHZhbmNlX3Bj
KCkKCkkgaGF2ZSBlMDQ4MThiNDZkLCBwbHVzIHRoZSBmb2xsb3dpbmcgbWFya2VkIGZvciBiYWNr
cG9ydDoKCmU5OGVkY2NiOTQ0YTgwZGI3ODJlNTUxZjMwOTA2MjhlNjZjN2ZiNTIgeGVuL2FybTog
U0NUTFJfRUwxIGlzIGEgNjQtYml0IHJlZ2lzdGVyIG9uIEFybTY0CgpJIGJhY2twb3J0ZWQgdGhl
bSBib3RoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
