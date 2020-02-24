Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A7616AC1A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 17:49:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6GsK-0005vP-5u; Mon, 24 Feb 2020 16:46:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rl5L=4M=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1j6GsI-0005vK-ST
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 16:46:30 +0000
X-Inumbo-ID: 3489b718-5725-11ea-aba8-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3489b718-5725-11ea-aba8-bc764e2007e4;
 Mon, 24 Feb 2020 16:46:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e8so11202214wrm.5
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 08:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G5IzTERINSUA5c30yDEuaE24QfdOx3JImijrmm034/4=;
 b=X+wqFA1hH5PukHPoRzv3oWw9kdqUPUuCd6vppNT5vCYoNEqL4ym55zPo6G+vY+nY7C
 jW4VZoQfCnc/t8EG5ZIw/bLWqd4I88vaOboU1uG6ubBdcqFMhOq+3dFJGoXmfB3VT7oC
 PU3Teh+5VYRhQV+MNFadCBOsToe2ZQbiyT/nqq6lomPu+nanqBkIcXBfBrp4SBT8XiWx
 wQkKL/cI6Lbz9Ej+5Wzo9xlK5sVC/F8G2EADmaVjt4zYvzLLY1asUV+3ycPgDTsUGV68
 FFU3VKkKSQ3Cr74lkd91bNk7Kxew5ZXiczvWkdhilpnMJKfK1UReZRXUNNEYPc1PjyhY
 aYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G5IzTERINSUA5c30yDEuaE24QfdOx3JImijrmm034/4=;
 b=MAggguTP0qKGAjWUrzj4AR9pozUSQiqNhmskbNf2N3ysllQ3NPby/9iGazELZkJkdr
 Z/Sc8G5WEVIAFfNbzkMvYzg6OcOJialUXEUSL3cXsHe/fy4Sbq9j0bdJvdyzD+KjfIYN
 mhMhKIggAOffolymzv4DM6/+5Lc9F+MOsIAdLLbnGKCUh+0bYqlIxwSPxSoq96+TEEQO
 pYybkcQNlclaMSKF/jeabW0JS0z4vf8irWa2QjUDd1OeQk9Ry9rCTKl8ua7EUS5+ahkx
 wuw5X6wlcYdW6dJjL8nW0KSYzrV4tcMADUt8Qhb9oaSzxSj+UhQYXgiBANtZX2CD/RE5
 lkqQ==
X-Gm-Message-State: APjAAAXcflTd5hvi8N+viQsPkXDGWHJ4pJbCuNAUW61n/50kuau0QXhJ
 UaPjlC23TgIEglgUQ1FXLldtbIuO63ry8XqcTeY=
X-Google-Smtp-Source: APXvYqxwAKicSghvjDobpnQHzqyS5mGKdJvLGEMa/IQY90dLg7peD00QR5gcHkGp6tPn1s6d4rzH3vy3TkbFoU7jeUI=
X-Received: by 2002:adf:8b54:: with SMTP id v20mr70409839wra.390.1582562789014; 
 Mon, 24 Feb 2020 08:46:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <532a499f00b42299d8035b4ca9c6d7bfcbdc6e1f.1582310142.git.tamas.lengyel@intel.com>
 <b58479ab-94d0-7cc2-72ff-7fbcb1374a40@xen.org>
 <CABfawhk=+bTmjT-T1kehFs=+E01zs_6sou=CjO986aYNvugO0w@mail.gmail.com>
 <a26f41ca-d85a-9a93-144d-026c82cf53af@xen.org>
In-Reply-To: <a26f41ca-d85a-9a93-144d-026c82cf53af@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 24 Feb 2020 09:45:52 -0700
Message-ID: <CABfawhnGWWXWH4UzZgnbF3_V5YP3GEh6AhLcb_U+4TisQGAHNQ@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] [PATCH v9 5/5] xen/tools: VM forking toolstack side
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgOTozMCBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMjQvMDIvMjAyMCAxNjoxOSwgVGFtYXMgSyBMZW5n
eWVsIHdyb3RlOgo+ID4gT24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgOToxMyBBTSBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToKPiA+Pgo+ID4+IEhpIFRhbWFzLAo+ID4+Cj4gPj4g
T24gMjEvMDIvMjAyMCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiAraW50IGxp
YnhsX2RvbWFpbl9mb3JrX3ZtKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBwZG9taWQsIHVpbnQz
Ml90ICpkb21pZCkKPiA+Pj4gK3sKPiA+Pj4gKyAgICBpbnQgcmM7Cj4gPj4+ICsgICAgc3RydWN0
IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIGNyZWF0ZSA9IHswfTsKPiA+Pj4gKyAgICBjcmVhdGUu
ZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfaHZtOwo+ID4+PiArICAgIGNyZWF0ZS5mbGFncyB8PSBY
RU5fRE9NQ1RMX0NERl9oYXA7Cj4gPj4+ICsgICAgY3JlYXRlLmZsYWdzIHw9IFhFTl9ET01DVExf
Q0RGX29vc19vZmY7Cj4gPj4+ICsgICAgY3JlYXRlLmFyY2guZW11bGF0aW9uX2ZsYWdzID0gKFhF
Tl9YODZfRU1VX0FMTCAmIH5YRU5fWDg2X0VNVV9WUENJKTsKPiA+Pgo+ID4+IFRoaXMgaXMgeDg2
IHNwZWNpZmljIGJ1dCBzZWVtcyB0byBiZSB3cml0dGVuIGluIGNvbW1vbiBjb2RlLiBEaWQgeW91
Cj4gPj4gYnVpbGQgaXQgb24gQXJtPwo+ID4KPiA+IEkgaGF2ZSBub3QsIGRvbid0IGhhdmUgYSBz
ZXR1cCBmb3IgQVJNIGF0IHRoZSBtb21lbnQuIEkgZ3Vlc3MgSSdsbAo+ID4ganVzdCBtb3ZlIHRo
aXMgZnVuY3Rpb24gdG8gbGlieGxfeDg2LmMgdG8gcmVzb2x2ZSB0aGUgaXNzdWUuCj4KPiBJdCBp
cyBmYWlybHkgZWFzeSB0byBzZXR1cCBhIGJ1aWxkIGVudmlyb25tZW50IGZvciBBcm0uIFlvdSBj
YW4gdXNlIFFFTVUKPiB1c2VyIGVtdWxhdGlvbiBhbmQgYSBBcm0gcm9vdGZzLgo+Cj4gPgo+ID4+
Cj4gPj4+ICsKPiA+Pj4gKyAgICBjcmVhdGUuc3NpZHJlZiA9IFNFQ0lOSVRTSURfRE9NVTsKPiA+
Pj4gKyAgICBjcmVhdGUucGFyZW50X2RvbWlkID0gcGRvbWlkOwo+ID4+PiArICAgIGNyZWF0ZS5t
YXhfZXZ0Y2huX3BvcnQgPSAxMDIzOwo+ID4+PiArICAgIGNyZWF0ZS5tYXhfZ3JhbnRfZnJhbWVz
ID0gTElCWExfTUFYX0dSQU5UX0ZSQU1FU19ERUZBVUxUOwo+ID4+PiArICAgIGNyZWF0ZS5tYXhf
bWFwdHJhY2tfZnJhbWVzID0gTElCWExfTUFYX01BUFRSQUNLX0ZSQU1FU19ERUZBVUxUOwo+ID4+
Cj4gPj4gVGhlIGRvbWFpbiB5b3UgZm9yayBtYXkgaGF2ZSBkaWZmZXJlbnQgdmFsdWVzIGhlcmUu
IEZyb20gbXkKPiA+PiB1bmRlcnN0YW5kaW5nLCB0aGUgZm9yayByZXF1aXJlcyB0byBoYXZlIHRo
ZSBzYW1lIHBhcmFtZXRlcnMgYXMgdGhlCj4gPj4gcGFyZW50LiBTbyBob3cgZG8geW91IGVuc3Vy
ZSB0aGV5IGFyZSB0aGUgc2FtZT8KPiA+Cj4gPiBUaGUgcGFyZW50IGRvbWFpbiBpcyBjcmVhdGVk
IGJ5IHhsLiBJZiB5b3UgY3JlYXRlIGEgZG9tYWluIHdpdGggeGwgaXQKPiA+IHdpbGwgaGF2ZSB0
aGVzZSBwYXJhbWV0ZXJzIHNldCBieSBkZWZhdWx0Lgo+Cj4gSSBob3BlIHlvdSBhcmUgYXdhcmUg
dGhhdCB5b3UgY2FuIG92ZXJyaWRlIG1vc3Qgb2YgdGhvc2UgcGFyYW1ldGVycyBpbgo+IHRoZSBn
dWVzdCBjb25maWd1cmF0aW9uIGZpbGUuIEl0IHdvdWxkIGJlIGdvb2QgdG8gYXQgbGVhc3Qgd3Jp
dGUgZG93bgo+IHRoZSBsaW1pdGF0aW9ucyBzbyBwZW9wbGUgZG9lc24ndCBzcGVuZCBhZ2VzIGZp
Z3VyaW5nIG91dCB3aHkgaXQgZG9lcwo+IG5vdCB3b3JrLgoKRmFpciBlbm91Z2guCgpUYW1hcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
