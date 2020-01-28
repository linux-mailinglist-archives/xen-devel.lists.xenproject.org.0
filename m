Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F71114BE39
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 18:01:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUCu-0001zl-NP; Tue, 28 Jan 2020 16:59:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwUCt-0001zg-J6
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:59:19 +0000
X-Inumbo-ID: 85e6a526-41ef-11ea-8739-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85e6a526-41ef-11ea-8739-12813bfff9fa;
 Tue, 28 Jan 2020 16:59:18 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwUCn-0005HU-M2; Tue, 28 Jan 2020 16:59:13 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwUCn-0002Hw-A3; Tue, 28 Jan 2020 16:59:13 +0000
Date: Tue, 28 Jan 2020 16:59:10 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20200128165910.tjbumoo4pngbmufx@debian>
References: <20200128154614.30572-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128154614.30572-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v1] x86/domctl: fix typo in comment
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDQ6NDY6MTRQTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gVGhlIGFycmF5IGlzIG5hbWVkIG1zcl9wb2xpY3kuCj4gCj4gRml4ZXMgY29tbWl0IDYw
NTI5ZGZlY2ExCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRl
PgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkJhY2twb3J0OiA0LjEyKwoKPiAtLS0K
PiAgeGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvcHVibGljL2RvbWN0bC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4gaW5kZXgg
ZTMxM2RhNDk5Zi4uMmJiNzM5NzkyMyAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMv
ZG9tY3RsLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPiBAQCAtNjc1LDcg
KzY3NSw3IEBAIHN0cnVjdCB4ZW5fZG9tY3RsX2NwdV9wb2xpY3kgewo+ICAgICAgdWludDMyX3Qg
bnJfbGVhdmVzOyAvKiBJTi9PVVQ6IE51bWJlciBvZiBsZWF2ZXMgaW4vd3JpdHRlbiB0bwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKiAnY3B1aWRfcG9saWN5Jy4gKi8KPiAgICAgIHVpbnQz
Ml90IG5yX21zcnM7ICAgLyogSU4vT1VUOiBOdW1iZXIgb2YgTVNScyBpbi93cml0dGVuIHRvCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAqICdtc3JfZG9tYWluX3BvbGljeScgKi8KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICogJ21zcl9wb2xpY3knICovCj4gICAgICBYRU5fR1VFU1Rf
SEFORExFXzY0KHhlbl9jcHVpZF9sZWFmX3QpIGNwdWlkX3BvbGljeTsgLyogSU4vT1VUICovCj4g
ICAgICBYRU5fR1VFU1RfSEFORExFXzY0KHhlbl9tc3JfZW50cnlfdCkgbXNyX3BvbGljeTsgICAg
LyogSU4vT1VUICovCj4gIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
