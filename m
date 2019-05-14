Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8451C98C
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 15:44:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQXfk-0003ve-Qg; Tue, 14 May 2019 13:40:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=56h2=TO=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1hQXfi-0003vZ-Rn
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 13:40:46 +0000
X-Inumbo-ID: df4addb5-764d-11e9-8980-bc764e045a96
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id df4addb5-764d-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 13:40:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id p26so22948643edr.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2019 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U0MRJrGkJHsZkLjYq00Ws9bs2NhbvNe8wK7cdgVncP4=;
 b=nzk8ASbuswxjsMEySaUTbQBXFrKfe+PumPI9A4fVetp3tS40htaxRNVe3xDHWvEznx
 BQyvAPUvsx5cw4xSGeTsA2uxdgTSxBWP8l//cE0s32V159jqtKObbbW2eCEJIhC0YXHA
 /0OVvUHjHwZkcOTdMrWQ9mMepfDzz8h77jQBIHIo2Rpb6Rf3LkcfyZI67MXSHq5OKWXW
 hmSFY/2gEz6kHFzaUnXYNbjiBHkApCQwLTRQgl6Rcrv38cblv0kbWKacNM+VX01y+vnO
 uHsMyIH/ya2r6bxg8r+cpoqHDvEtYpaUrhSo30/5adr7fdwUFMXUpG9oXGO0CkRR5NOQ
 HD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U0MRJrGkJHsZkLjYq00Ws9bs2NhbvNe8wK7cdgVncP4=;
 b=q8LGgQsgdc7RcVuJcB2g67H9eEOoLDIjLxfrttXqL0/va7w9rszwSQNj/e9UMsRZ1s
 XGdfDwdntAEVwjnEgClLnE22b6AY8d5dQLsYy+xZaka4ly4tA6FTXmzsfQJAvwMLyiI7
 wEPxRlIc5JuZWo9U4F2OMnO/R3liC3Cm2VM0migamugcMPLlmQHuKQs30MzL8nT4Ode4
 8jLrPPFRgLhK4LcWgAOBZ9FDk49IIRjxTdYm5OzonoJuv4Jfi/8HlbzUATlcjSwDeRJl
 6GSJCksIMzGLFKCSrY+FbA7LEaTRodxBS7+OHsvdk+zrTGeGGjN/ky2OoVKElxNjMVI6
 mRBg==
X-Gm-Message-State: APjAAAWz3KglN0EoMwhgWO/lD/1uxaL9PfmjgxgxgEJJLzwbWc/Z6C6R
 Gjzknchhnu4Fmgur6TFoid4nrbCFmP40+qqUxdQ=
X-Google-Smtp-Source: APXvYqyR/wR7XBX2/KT9uP/iEnNf3hfTZmIzhtXR0LOcT5GQvc3c3h1o8xMbb35vBWNxjvcoeFhG85R0QdhoekoXYHc=
X-Received: by 2002:a50:b815:: with SMTP id j21mr35963756ede.132.1557841243894; 
 Tue, 14 May 2019 06:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <1557743068.2372.0@crc.id.au>
In-Reply-To: <1557743068.2372.0@crc.id.au>
From: George Dunlap <dunlapg@umich.edu>
Date: Tue, 14 May 2019 14:40:33 +0100
Message-ID: <CAFLBxZawmyFKLko0PhhfJHuVBdqzhkYzyQZAeo2Z9eTX=YkEPA@mail.gmail.com>
To: Steven Haigh <netwiz@crc.id.au>
Subject: Re: [Xen-devel] pygrub not starting first menuentry in Fedora 30
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTE6MjUgQU0gU3RldmVuIEhhaWdoIDxuZXR3aXpAY3Jj
LmlkLmF1PiB3cm90ZToKPgo+IFRoZXJlIHNlZW1zIHRvIGJlIHNvbWUgY2hhbmdlcyBpbiBGZWRv
cmEgMzAgdGhhdCBjYXVzZSB0aGUgc2Vjb25kIGJvb3QKPiBlbnRyeSBpbiBncnViLmNmZyB0byBi
ZSBib290ZWQgaW5zdGVhZCBvZiB0aGUgZmlyc3QuCj4KPiBUaGlzIG1lYW5zIHRoYXQgRmVkb3Jh
IDMwIHN5c3RlbXMgZWl0aGVyIGFsd2F5cyBib290IGludG8gYW4gb2xkZXIKPiBrZXJuZWwsIG9y
IGluIHRoZSBjYXNlIG9mIHN5c3RlbXMgd2l0aCBvbmx5IG9uZSBrZXJuZWwgaW5zdGFsbGVkLCB0
aGUKPiByZXNjdWUgaW1hZ2UuCj4KPiBUaGVyZSBhbHNvIHNlZW1zIHRvIGJlIHNvbWUgbmV3IGlz
c3VlcyB3aXRoIHRoZSBtb3ZlIHRvIEJMU0NGRyAtCj4gaG93ZXZlciBpdCBzZWVtcyBhIG5ldyBy
ZXF1aXJlbWVudCBpcyB0byBoYXZlCj4gR1JVQl9FTkFCTEVfQkxTQ0ZHPSJmYWxzZSIgaW4gL2V0
Yy9kZWZhdWx0L2dydWIuIFRoaXMgY2F1c2VzCj4gZ3J1YjItbWtjb25maWcgdG8gd29yayBjb3Jy
ZWN0bHkgYW5kIHNwaXQgb3V0IGEgZ3J1Yi5jZmcgZmlsZSB0aGF0Cj4gcHlncnViIGNhbiB0aGVu
IHVzZS4KPgo+IElzIHRoaXMgYSBidWcgaW4gcHlncnViLCBvciBhIHByb2JsZW0gd2l0aCBob3cg
RmVkb3JhIDMwIGdlbmVyYXRlcyBhCj4gZ3J1Yi5jZmc/Cj4KPiBJIHRyaWVkIHRvIHBpY2sgdGhy
b3VnaCBweWdydWIgLSBidXQgY291bGRuJ3QgcXVpdGUgZm9sbG93IHRoZSBweXRob24KPiBsb2dp
YyB0byBzZWUgd2hlcmUgdGhlIGRlZmF1bHQgYm9vdCBvcHRpb24gaXMgc2VsZWN0ZWQuCgpBRkFJ
Q1QsIHRoZSBiYXNpYyBpc3N1ZSBpcyB0aGF0IHB5Z3J1YiBpcyBhIHBhcnRpYWwgcmUtaW1wbGVt
ZW50YXRpb24Kb2YgZ3J1YiwgYW5kIGhhc24ndCByZS1pbXBsZW1lbnRlZCB0aGUgYmxzY2ZnIGZ1
bmN0aW9uYWxpdHkuCgpUaGUgKm1vc3Qgcm9idXN0KiBzb2x1dGlvbiBnb2luZyBmb3J3YXJkIGlz
IGFsd2F5cyBnb2luZyB0byBiZSB0byB1c2UKZ3J1Yi14ZW4gKEFLQSBwdmdydWIyKSBpbnN0ZWFk
IG9mIHB5Z3J1Yi4gIGdydWIteGVuIGlzIGEgcG9ydCBvZiB0aGUKYWN0dWFsIGdydWIgcHJvamVj
dCB0byBydW4gYXMgYSBQViBndWVzdCwgYW5kIHNvIHdpbGwgYWx3YXlzIGJlICB0aGUKbW9zdCBj
b21wYXRpYmxlIHdpdGggdXBzdHJlYW0gZ3J1Yi4KCk5vdCBzdXJlIHdobydzICJpbiBjaGFyZ2Ui
IG9mIHB5Z3J1YiBlbm91Z2ggdG8gdGVhY2ggaXQgaG93IHRvIHVzZSBibHNjZmcuCgogLUdlb3Jn
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
