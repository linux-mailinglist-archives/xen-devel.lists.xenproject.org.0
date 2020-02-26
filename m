Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB311704FB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:57:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6zx4-00038q-Hz; Wed, 26 Feb 2020 16:54:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TepR=4O=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j6zx3-00038h-1e
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 16:54:25 +0000
X-Inumbo-ID: a423d92a-58b8-11ea-9484-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a423d92a-58b8-11ea-9484-12813bfff9fa;
 Wed, 26 Feb 2020 16:54:24 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j6zx1-0005LX-5D; Wed, 26 Feb 2020 16:54:23 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j6zx0-00084i-SU; Wed, 26 Feb 2020 16:54:23 +0000
Date: Wed, 26 Feb 2020 16:54:20 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200226165420.l3dku6lxrvcom5ey@debian>
References: <20200226131213.15305-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226131213.15305-1-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxl: add initializers for
 libxl__domid_history
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMDE6MTI6MTNQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggZml4ZXMgQ292ZXJpdHkgaXNzdWUgQ0lEIDE0NTkwMDYgKEluc2Vj
dXJlIGRhdGEgaGFuZGxpbmcKPiAoSU5URUdFUl9PVkVSRkxPVykpLgo+IAo+IFRoZSBwcm9ibGVt
IGlzIHRoYXQgdGhlIGVycm9yIHBhdGhzIGZvciBsaWJ4bF9fbWFya19kb21pZF9yZWNlbnQoKSBh
bmQKPiBsaWJ4bF9faXNfZG9taWRfcmVjZW50KCkgY2hlY2sgdGhlICdmJyBmaWVsZCBpbiBzdHJ1
Y3QgbGlieGxfX2RvbWlkX2hpc3RvcnkKPiB3aGVuIGl0IG1heSBub3QgaGF2ZSBiZWVuIGluaXRp
YWxpemVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9u
LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
