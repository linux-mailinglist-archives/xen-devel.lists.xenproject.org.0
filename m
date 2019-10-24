Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C457E3B5B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 20:53:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNiAv-0006ON-8k; Thu, 24 Oct 2019 18:49:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sPx=YR=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iNiAu-0006OI-3m
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 18:49:32 +0000
X-Inumbo-ID: 0345c486-f68f-11e9-bbab-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0345c486-f68f-11e9-bbab-bc764e2007e4;
 Thu, 24 Oct 2019 18:49:31 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id g3so7767768lfb.11
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 11:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BB2UyCcdQKi4y2qpwrghVxCnPvCvS5guWQvTG18FWy0=;
 b=rNyclJ8bELfsoNtwGCaiyepQ4JiZsUj9kJmpREGSNfFavE0HLblMA3Cd1ei6kcx5HD
 vB5twzmbJJ6vrbREeeV1fo4ZV6x8DPrKJ/qtg65Qi6YnP3iccJFVxInq0gv9w9dYYDZM
 lNjb/lJIiEWVLENXEOCxc+mXpyiPqRzyG94du76MsUwcZ2fqZOIxzZIMeMXTplUf81Kx
 7cuwSbj0J/4Zmh+i9feB00nP4kMiuaFHUegt/D2riTxsOSHYeXj6f5XK+tVAADJQlKLX
 e5iNEWGZd5u1SfjxuuMRhvQcdImctg2Wut6M4+E0Fed1Ade1yd0ALmOHp53IgGAHOxlq
 6OUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BB2UyCcdQKi4y2qpwrghVxCnPvCvS5guWQvTG18FWy0=;
 b=H0rzUHZVCafATn9E3imEfQpe6oMPdYNBDGG7wcreSUfsqyyUHAIVz++Cg7MVgfXp/j
 S3iDMw1We2WVM7vkIcalMc4e1j9MSx/6KpvHET7hAB5+DzEcsQPbIIM/xn+Ae61olWGL
 UinDIqgpZ0qFA+puycFKbXQeBRJBAmomHuS4g60i8J+/NToHcUzBY4FmlKg3q7ONGNeX
 J8prUrZGnsocpBoQ/mlm0tFZjN+2Cr+Y7GyxI1Ig+a1VzRf5AYCWsIifGmynpD2ond5m
 zQ5FvwT9ytFsP44MAH8t5+zkKsIrnOnc+e8O0BATSl038sjmU4k1e0dszBvF81v86i3z
 n4hQ==
X-Gm-Message-State: APjAAAVYStnbv8PtyHhKNDVqA9YokpWjluzPty5Sa/CaP8rMrtJZUj1e
 mHoFtqO8zR94FDjliK4eQQxd/XdN/cbBm5WCvkQ=
X-Google-Smtp-Source: APXvYqzU1unOA7RcBDDTX7Ei6DcWU13QhLPIoFypmfHrlxS10xTPfrX5CIeYc7K6g3LpQeNMIx9hQmR4DJeLdlH2H1k=
X-Received: by 2002:a19:491c:: with SMTP id w28mr27045977lfa.124.1571942970094; 
 Thu, 24 Oct 2019 11:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <26d6deae1803591361f7568645bc59b1535d6b88.1570456846.git.rosbrookn@ainfosec.com>
 <52866b46-6da0-9d89-8c77-0ac4ceb7b689@citrix.com>
In-Reply-To: <52866b46-6da0-9d89-8c77-0ac4ceb7b689@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 24 Oct 2019 14:49:18 -0400
Message-ID: <CAEBZRSdx0cTP+H-zz4nWvsABU0sTJk+EosuJfN5+akWSgxzd0g@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 24/24] golang/xenlight: add make target for
 generated files
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, xen-devel@lists.xenproject.org,
 kerriganb@ainfosec.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbmUgc3RhbmRhcmQgcHJhY3RpY2Ugd2hlbiBtYWtpbmcgYSBzZXJpZXMgaXMgdG8gdHJ5IHRv
IGF2b2lkIGFueQo+IHJlZ3Jlc3Npb25zLCBpbmNsdWRpbmcgYnVpbGQgcmVncmVzc2lvbnMsIGlu
IHRoZSBtaWRkbGUgb2YgdGhlIHNlcmllcy4KPiBUaGlzIGlzIHBhcnRpY3VsYXJseSBoZWxwZnVs
IHRvIGFpZCBpbiBiaXNlY3Rpb25zLCBidXQgaW4gdGhpcyBjYXNlIGl0Cj4gbWFrZXMgaXQgZWFz
aWVyIHRvIG9ic2VydmUgdGhlIGFjdGlvbiBvZiB0aGUgYGdlbmdvdHlwZXMucHlgIHNjcmlwdCAo
YW5kCj4gaG93IGl0J3MgbWVhbnQgdG8gYmUgY2FsbGVkKS4KPgo+IFNvIEkgd291bGQgYmFzaWNh
bGx5IG1ha2UgdGhpcyBwYXJ0IG9mIHBhdGNoIDIsIGV4Y2VwdCByZW1vdmUgcmVmZXJlbmNlcwo+
IHRvIHhlbmxpZ2h0X2hlbHBlcnMuZ28gdW50aWwgdGhlIHBhdGNoIHdoZXJlIHRoYXQgZmlsZSBp
cyBnZW5lcmF0ZWQuCgpBaCB5ZWFoIHRoYXQgbWFrZXMgc2Vuc2UsIEknbGwgY29ycmVjdCB0aGlz
IGluIHYyLgoKPiBJdCBtaWdodCBiZSBuaWNlIHRvIGhhdmUgYSBuYW1pbmcgY29udmVudGlvbiBm
b3IgdGhlIGdlbmVyYXRlZCBmaWxlcwo+IHRoYXQgY2x1ZXMgcGVvcGxlIGluIHRvIHRoZSBmYWN0
IHRoYXQgdGhleSdyZSBnZW5lcmF0ZWQgKG90aGVyIHRoYW4gdGhlCj4gY29tbWVudCBhdCB0aGUg
dG9wIG9mIGNvdXJzZSkuICBJbiBsaWJ4bCwgdGhpcyBpcyBkb25lIGJ5IGdpdmluZyB0aGVtIGEK
PiBsZWFkaW5nIHVuZGVyc2NvcmUgKGUuZy4sIF9saWJ4bF90eXBlLmgpOyBidXQgdGhlIGdvIGNv
bXBpbGVyIHdpbGwKPiBoZWxwZnVsbHkgaWdub3JlIHN1Y2ggZmlsZXMuIDotKQo+Cj4gVGhlIGdv
IGNvbXBpbGVyIHdpbGwgYWxzbyBkbyBzcGVjaWFsIHRoaW5ncyBzb21ldGltZXMgd2l0aCB0aGlu
Z3MgYWZ0ZXIKPiBhIGBfYDsgZS5nLiwgIiR7Zm9vfV90ZXN0LmdvIiB3aWxsIG9ubHkgYmUgY29t
cGlsZWQgZm9yIGBnbyB0ZXN0YCwKPiAiJHtmb299X2xpbnV4LmdvIiB3aWxsIG9ubHkgYmUgY29t
cGlsZWQgb24gTGludXgsIGFuZCBzbyBvbi4gIEknbSBwcmV0dHkKPiBzdXJlIHRoZXNlIG5hbWVz
IHdpbGwgYmUgc2FmZSwgYnV0IGl0IG1pZ2h0IGJlIHNsaWdodGx5IG1vcmUKPiBmdXR1cmUtcHJv
b2YgdG8gYXZvaWQgdXNpbmcgYW4gdW5kZXJzY29yZSBpbiB0aGUgbmFtZXMuCgorMSBmb3IgYSBu
YW1pbmcgY29udmVudGlvbiB0aGF0IHNheXMgInRoaXMgZmlsZSBpcyBnZW5lcmF0ZWQuIiBCdXQs
CnRoZSBvbmx5IHNwZWNpYWwKY2FzZXMgdGhhdCBJJ20gYXdhcmUgb2YgZm9yIGdvIGZpbGUgbmFt
ZSBzdWZmaXhlcyBhcmUgInRlc3QiLCBhbmQKdmFsaWQgR09PUyBhbmQgR09BUkNICnZhbHVlcy4g
SXQncyBjb252ZW50aW9uYWwgdG8gdXNlIHVuZGVyc2NvcmVzIGZvciBjb21wb3VuZGVkIGZpbGUK
bmFtZXMsIGFuZCB1bm5lY2Vzc2FyeQp0byBhdm9pZCB0aGVtLgoKVG8gcmVmZXJlbmNlIGdSUEMg
YWdhaW4sIHRoZWlyIHByb3RvYnVmIGNvbXBpbGVyIHdyaXRlcyBmaWxlIG5hbWVzCmxpa2UgJ3Bh
Y2thZ2UucGIuZ28nLCB3aGVyZQpwYiBpcyBzaG9ydCBmb3IgcHJvdG9idWYuIFNvLCBJIHRoaW5r
IHNvbWV0aGluZyBsaWtlCic8bmFtZT5fZ2VuZXJhdGVkLmdvJywgb3IgJzxuYW1lPi5pZGwuZ28n
CmNvdWxkIHdvcmsuCgo+IEtpbmQgb2YgcmFuZG9tLCBidXQgd291bGQgaXQgbWFrZSBzZW5zZSB0
byBgcm0gLXJmYCB0aGUgd2hvbGUgZGlyZWN0b3J5Cj4gaGVyZSBpbnN0ZWFkPwoKWWVhaCBwcm9i
YWJseSA6KQoKLU5SCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
