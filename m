Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0149AC4090
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 21:00:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFNLb-0001cU-Hy; Tue, 01 Oct 2019 18:58:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k2xm=X2=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1iFNLa-0001cP-Ge
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 18:58:06 +0000
X-Inumbo-ID: 66a808a0-e47d-11e9-bf31-bc764e2007e4
Received: from mail-qk1-f195.google.com (unknown [209.85.222.195])
 by localhost (Halon) with ESMTPS
 id 66a808a0-e47d-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 18:58:05 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id y144so12306334qkb.7
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 11:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7EY66jo6PvKaSsJh31JkxqgQFmjMunJ0Kvj/PM6tpU0=;
 b=H97s9IVzmIKVSiGvR6zrMMhSNq2+pk5og/o2OWiVOz9LGEsxP6KElBZdm5VUstDOMA
 bW8m4j62FiC0Ri5gDPEKG0eeZpTfsQyVuG+BCYp0OvCzBbUiyzhsgPQxWPIQAL3BNwFo
 oTb62zz5op55XHv1louqDhpAI+0niep2hOJnr0arJXt/UcN+VCl/X1SU+1S2ZA6GGu0+
 beCKiZzZG2RiV+lnq7GdDDlXieuhHIrqYs+i+75QydS5bSuvVobE9Frv3YS9cdOXbWcN
 PWBHVycsBlKlj3Dv/mK8fM+0lWtI0DocFVRAoOZZ72U0z+Ds44mDgLdZGdGOnEszp51M
 iwaw==
X-Gm-Message-State: APjAAAWVW66R2Ac5lQQa9XlKxKDIyuPw2YVNJczaT5o+ViRdaDJX0jpK
 tpsHvX8SRgSgDlfuiCbYh+/7t0QpMoHBQ5Li/tQ=
X-Google-Smtp-Source: APXvYqyDB8xPt1kofeJ9vy4DjGVaLfhn0UKXBeJHpGI6/IjnKwTQqHsuDY0fC/wEA0lObfyGUxpteBLFU4gleCtca20=
X-Received: by 2002:a37:a858:: with SMTP id r85mr7732418qke.394.1569956285225; 
 Tue, 01 Oct 2019 11:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190906153948.2160342-1-arnd@arndb.de>
 <alpine.DEB.2.21.1910011032500.20899@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1910011032500.20899@sstabellini-ThinkPad-T480s>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Oct 2019 20:57:49 +0200
Message-ID: <CAK8P3a3Nhh1isvm--U8-s5F0bH1DHQ8pYR_+yB9xckhzyV=x3Q@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [PATCH] ARM: xen: unexport HYPERVISOR_platform_op
 function
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Denis Efremov <efremov@linux.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMSwgMjAxOSBhdCA3OjM4IFBNIFN0ZWZhbm8gU3RhYmVsbGluaQo8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLiBIWVBF
UlZJU09SX3BsYXRmb3JtX29wKCkgaXMgYW4gaW5saW5lIGZ1bmN0aW9uLAo+IHRoZSB1bmRlcmx5
aW5nIGZ1bmN0aW9uIHRoYXQgc2hvdWxkIGJlIGV4cG9ydGVkIGlzCj4gSFlQRVJWSVNPUl9wbGF0
Zm9ybV9vcF9yYXcuIFNvLCBpbnN0ZWFkIG9mIHJlbW92aW5nCj4gSFlQRVJWSVNPUl9wbGF0Zm9y
bV9vcCwgd2Ugc2hvdWxkIGNoYW5nZSBpdCB0bwo+IEhZUEVSVklTT1JfcGxhdGZvcm1fb3BfcmF3
LgoKT2ssIHRoYXQgbWFrZXMgc2Vuc2UuCgo+IEZvciBjb252ZW5pZW5jZSwgYW5kIGZvciB0ZXN0
aW5nIEkgY29va2VkIHVwIGEgcGF0Y2guIEFybmQsIGlmIHlvdSBhcmUKPiBoYXBweSB3aXRoIGl0
IChpbiB0aGUgc2Vuc2UgdGhhdCBpdCBzb2x2ZXMgeW91ciBwcm9ibGVtKSB3ZSdsbCBjaGVjayBp
dAo+IGluIHRoZSB4ZW50aXAgdHJlZSwgdW5sZXNzIHlvdSB3b3VsZCBsaWtlIHRvIGdldCBpdCBp
biB5b3VyIHRyZWU/Cj4KClBsZWFzZSBtZXJnZSBpdCB0aHJvdWdoIHlvdXIgdHJlZS4KCj4gQEAg
LTQzNyw3ICs0MzcsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJU09SX21lbW9yeV9vcCk7
Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1JfcGh5c2Rldl9vcCk7Cj4gIEVYUE9SVF9T
WU1CT0xfR1BMKEhZUEVSVklTT1JfdmNwdV9vcCk7Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVS
VklTT1JfdG1lbV9vcCk7Cj4gLUVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1JfcGxhdGZvcm1f
b3ApOwo+ICtFWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJU09SX3BsYXRmb3JtX29wX3Jhdyk7Cj4g
IEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1JfbXVsdGljYWxsKTsKPiAgRVhQT1JUX1NZTUJP
TF9HUEwoSFlQRVJWSVNPUl92bV9hc3Npc3QpOwo+ICBFWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJ
U09SX2RtX29wKTsKCk5vdGUgdGhhdCB0aGVyZSBhcmUgb2J2aW91c2x5IG5vIGNhbGxlcnMgZnJv
bSBhbnkgbG9hZGFibGUgbW9kdWxlcyBpbiB0aGUKa2VybmVsLCBhbGwgdXNlcnMgYXJlIGluIGJ1
aWx0LWluIGNvZGUgYXQgdGhlIG1vbWVudC4gQXMgYW4gQVBJIGRlZmluaXRpb24KaXQgc3RpbGwg
bWFrZXMgc2Vuc2UgdGhvdWdoLgoKICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
