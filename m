Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B010E25F
	for <lists+xen-devel@lfdr.de>; Sun,  1 Dec 2019 16:36:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibRCo-00058M-SR; Sun, 01 Dec 2019 15:32:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EgS7=ZX=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1ibRCm-00058H-Si
 for xen-devel@lists.xenproject.org; Sun, 01 Dec 2019 15:32:12 +0000
X-Inumbo-ID: be491e12-144f-11ea-a55d-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be491e12-144f-11ea-a55d-bc764e2007e4;
 Sun, 01 Dec 2019 15:32:12 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1ibRCf-000Psu-Oc; Sun, 01 Dec 2019 15:32:05 +0000
Date: Sun, 1 Dec 2019 15:32:05 +0000
From: Tim Deegan <tim@xen.org>
To: Julian Tuminaro <julian.tuminaro@gmail.com>
Message-ID: <20191201153205.GB99267@deinos.phlegethon.org>
References: <20191130081118.18676-1-julian.tuminaro@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191130081118.18676-1-julian.tuminaro@gmail.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] [PATCH] Fix the KDD_LOG statements to use
 appropriate format specifier for printing uint64_t
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
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <pdurrant@amazon.com>, Jenish Rakholiya <rjenish@cmu.edu>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgMDM6MTEgLTA1MDAgb24gMzAgTm92ICgxNTc1MDgzNDc4KSwgSnVsaWFuIFR1bWluYXJvIHdy
b3RlOgo+IFByZXZpb3VzIGNvbW1pdCBpbiBrZGQuYyBoYWQgYSBzbWFsbCBpc3N1ZSB3aGljaCBs
ZWFkIHRvIHdhcm5pbmcvZXJyb3Igd2hpbGUgY29tcGlsaW5nCj4gb24gMzItYml0IHN5c3RlbXMg
ZHVlIHRvIG1pc21hdGNoIG9mIHR5cGUgc2l6ZSB3aGlsZSBkb2luZyB0eXBlIGNhc3QgZnJvbSB1
aW50NjRfdCB0bwo+IHZvaWQgKgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplbmlzaCBSYWtob2xpeWEg
PHJqZW5pc2hAY211LmVkdT4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpYW4gVHVtaW5hcm8gPGp0dW1p
bmFyQGFuZHJldy5jbXUuZWR1PgoKQWNrZWQtYnk6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgoK
VGhhbmtzIGZvciB0aGUgZml4IQoKVGltLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
