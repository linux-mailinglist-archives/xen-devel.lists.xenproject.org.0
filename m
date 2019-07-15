Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3BE69901
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 18:29:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn3ny-0006rP-6D; Mon, 15 Jul 2019 16:26:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SdY0=VM=ravnborg.org=sam@srs-us1.protection.inumbo.net>)
 id 1hn3nw-0006rK-GQ
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 16:26:20 +0000
X-Inumbo-ID: 45b5be13-a71d-11e9-8980-bc764e045a96
Received: from asavdk3.altibox.net (unknown [109.247.116.14])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 45b5be13-a71d-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 16:26:18 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B116B20021;
 Mon, 15 Jul 2019 18:26:16 +0200 (CEST)
Date: Mon, 15 Jul 2019 18:26:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <20190715162615.GA27038@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-3-sam@ravnborg.org>
 <7c758e43-048b-d094-bced-9d171987538f@gmail.com>
 <20190701060524.GA28256@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701060524.GA28256@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=DBfv99YmAAAA:8
 a=5Y2y6C4kfaShNWru4agA:9 a=CjuIK1q_8ugA:10 a=c73wXdw0ADZYY2z2LwuN:22
Subject: Re: [Xen-devel] [PATCH v1 02/33] drm/xen: drop use of drmP.h
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
Cc: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMDg6MDU6MjRBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIE9sZWtzYW5kcgo+IAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hl
bl9kcm1fZnJvbnQuaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJv
bnQuaAo+ID4gPiBAQCAtMTEsMTMgKzExLDE5IEBACj4gPiA+ICAgI2lmbmRlZiBfX1hFTl9EUk1f
RlJPTlRfSF8KPiA+ID4gICAjZGVmaW5lIF9fWEVOX0RSTV9GUk9OVF9IXwo+ID4gPiAtI2luY2x1
ZGUgPGRybS9kcm1QLmg+Cj4gPiA+IC0jaW5jbHVkZSA8ZHJtL2RybV9zaW1wbGVfa21zX2hlbHBl
ci5oPgo+ID4gPiAtCj4gPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3NjYXR0ZXJsaXN0Lmg+Cj4gPiA+
ICsjaW5jbHVkZSA8ZHJtL2RybV9jb25uZWN0b3IuaD4KPiA+ID4gKyNpbmNsdWRlIDxkcm0vZHJt
X3NpbXBsZV9rbXNfaGVscGVyLmg+Cj4gPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9zaW1wbGVfa21z
X2hlbHBlci5oPgo+ID4gbm8gbmVlZCB0byBpbmNsdWRlIHR3aWNlCj4gPiB3aXRoIHRoYXQgZml4
ZWQ6Cj4gPiBBY2tlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRy
dXNoY2hlbmtvQGVwYW0uY29tPgoKQXBwbGllZCwgdGhhbmtzLgoKCVNhbQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
