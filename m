Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45401D4691
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 19:26:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIyba-0001VW-7a; Fri, 11 Oct 2019 17:21:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iIybY-0001VR-Ny
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 17:21:28 +0000
X-Inumbo-ID: 8f0e30a0-ec4b-11e9-933d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f0e30a0-ec4b-11e9-933d-12813bfff9fa;
 Fri, 11 Oct 2019 17:21:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CFC62067B;
 Fri, 11 Oct 2019 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570814487;
 bh=x5nO8vVakuIz30/IqhGALLU09aVNTyQH8rn474suAgg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Lm48iIhVvaXw4+Z8/tT6uIdJJjE8FzyM1UtqgSFZsE/XIFDN42wbgOCtjEZLNq2yX
 qTA20dRGfqScaYIgPjgQK0ZXLp/GOvYTICR5MoRIPrS8ordk6KO8SUhz5JlFlmQfqR
 gBc7/idquWEiBzdYC3Gf4yfqeIvsB9kETUi1p2OI=
Date: Fri, 11 Oct 2019 10:21:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <8413c89d-3495-6407-f1a9-6eb9aff24e47@arm.com>
Message-ID: <alpine.DEB.2.21.1910111017050.6326@sstabellini-ThinkPad-T480s>
References: <20191010141231.25363-1-al1img@gmail.com>
 <23968.40555.917945.129929@mariner.uk.xensource.com>
 <8413c89d-3495-6407-f1a9-6eb9aff24e47@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH v1] libxl: Add DTB compatible list to
 config file
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
Cc: Iurii Konovalenko <iurii.konovalenko@globallogic.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Grytsov <al1img@gmail.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxMSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDEx
LzEwLzIwMTkgMTY6MjMsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gT2xla3NhbmRyIEdyeXRzb3Yg
d3JpdGVzICgiW1BBVENIIHYxXSBsaWJ4bDogQWRkIERUQiBjb21wYXRpYmxlIGxpc3QgdG8KPiA+
IGNvbmZpZyBmaWxlIik6Cj4gPiA+IEZyb206IE9sZWtzYW5kciBHcnl0c292IDxvbGVrc2FuZHJf
Z3J5dHNvdkBlcGFtLmNvbT4KPiA+ID4gCj4gPiA+IFNvbWUgcGxhdGZvcm1zIG5lZWQgbW9yZSBj
b21wYXRpYmxlIHByb3BlcnR5IHZhbHVlcyBpbiBkZXZpY2UKPiA+ID4gdHJlZSByb290IG5vZGUg
aW4gYWRkaXRpb24gdG8gInhlbix4ZW52bS0lZC4lZCIgYW5kICJ4ZW4seGVudm0iCj4gPiA+IHZh
bHVlcyB0aGF0IGFyZSBnaXZlbiBieSBYZW4gYnkgZGVmYXVsdC4KPiAKPiBJIGFtIHByZXR0eSBz
dXJlIEkgaGF2ZSBzZWVuIHRoaXMgcGF0Y2ggYSBmZXcgeWVhcnMgYWdvLCBidXQgSSBjYW4ndCBm
aW5kIGl0Cj4gaW4gbXkgaW5ib3guIFdoYXQgaXMgdGhlIGV4YWN0IHByb2JsZW0gaGVyZT8KPiAK
PiA+ID4gU3BlY2lmeSBpbiBkb21haW4gY29uZmlndXJhdGlvbiBmaWxlIHdoaWNoIHZhbHVlcyBz
aG91bGQgYmUgYWRkZWQKPiA+ID4gYnkgcHJvdmlkaW5nICJkdGJfY29tcGF0aWJsZSIgbGlzdCBv
ZiBzdHJpbmdzIHNlcGFyYXRlZCBieSBjb21hcy4KPiA+IAo+ID4gSGksIHRoYW5rcy4KPiA+IAo+
ID4gSSBkb24ndCBoYXZlIGFuIG9waW5pb24gYWJvdXQgdGhlIHByaW5jaXBsZSBvZiB0aGlzIGFu
ZCB3b3VsZCBsaWtlIHRvCj4gPiBoZWFyIGZyb20gQVJNIGZvbGtzIGFib3V0IHRoYXQuCj4gPiAK
PiA+IEFsc28sIFN0ZWZhbm8sIEp1bGllbjogc2hvdWxkIHdlIGJlIGFza2luZyBmb3IgYSBmcmVl
emUgZXhjZXB0aW9uIGZvcgo+ID4gdGhpcyBmb3IgNC4xMyA/Cj4gCj4gSSBkb24ndCBoYXZlIGVu
b3VnaCBjb250ZXh0IHRvIHVuZGVyc3RhbmQgdGhlIGV4YWN0IGlzc3VlIGhlIGlzIHRyeWluZyB0
bwo+IHNvbHZlLgoKU2FtZSBoZXJlLiBJcyB0aGlzIHBhdGNoIG5lZWRlZCBiZWNhdXNlIG9uIHNv
bWUgcGxhdGZvcm0gdGhlIE9TIGNoZWNrcwpmb3IgdGhlIHBsYXRmb3JtICJtb2RlbCIgKGFsc28g
a25vd24gYXMgIm1hY2hpbmUgbmFtZSIpIG9uIGRldmljZSB0cmVlCmJlZm9yZSBjb250aW51aW5n
IG9yIHRvIHRyaWdnZXIgYSBkaWZmZXJlbmNlIGJlaGF2aW9yPwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
