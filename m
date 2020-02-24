Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDC816AA91
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 16:58:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6G5n-00005A-Ux; Mon, 24 Feb 2020 15:56:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rl5L=4M=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1j6G5m-00004v-Dr
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 15:56:22 +0000
X-Inumbo-ID: 33846e00-571e-11ea-a490-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33846e00-571e-11ea-a490-bc764e2007e4;
 Mon, 24 Feb 2020 15:56:21 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m16so10951704wrx.11
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 07:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r1YUXPCxcVreAEHNqvTHa1PViLhInduLFL8SHh+r7Gg=;
 b=cwe5veQkYAtmNrjhKyYtKtaXqoU1OS6YoOsq4KJX9QPmHT0AOhzIkpBImfBVKu7f8o
 1CaISHkP7x0QDvRXL4PvyS2s1e9sF3SBTLUpFGUbAVVlMInoRIuXDbyFfrMXpwXe99ob
 9Uqe5tmZJKpbj4n2kduWgaNzaE0ZgTf1T/lzcNeW8p2vrLINaBSR1/a0LCT6/2yAhdi4
 O3FzSwDt2rEwCVK5Gm82JufRDWboz/nXqcs+zJ6GGm3YEwIr2pSlidQQpIEPoXznQu6X
 Cflp3qx6DIKSVuT25ctOb07bg5DVRTQ2gN9AT0UGuZlpJo2Ansrvthu1tehfg2hJu0m0
 xzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r1YUXPCxcVreAEHNqvTHa1PViLhInduLFL8SHh+r7Gg=;
 b=nJrEqcoVB013aZ90ipTjGR/t1gijuBo6nFi2ZzzSyT6j9kTFhLE1fYk/8j9NWraizV
 ftF1CqA3th+3qy02HBX0ZX4Lej+ghABT9HBbADJ0EfOjGE0Z5lc6ZgV3zyxuml+iXebi
 4e7hDTPCXrhhfCNhlkxPgjUaCDK5FLCwiHCw9RMsi6CY2RTvugIHBPmeNcPXmr9FgSXL
 NV8hBfqwadVzigxHUi5KP3ZF+pQDBfi6ivA32fWT54m2EyHJAI5l2CwIkBLCj72UZ+dI
 ameIXaOmROjv3wMmK3FI7bwch3oHh3GpKj0MJBJuCgek/FcbzLyD7rsKBna4U9yeYLSv
 KXqQ==
X-Gm-Message-State: APjAAAWzgNTv4UppNkIuQzjDdIRjHta/dDq4GSf8VesS/asJvYSwNx3M
 1vhklv+8o/veKVVKojX+XyVVm4A+8wXUIxfohBg=
X-Google-Smtp-Source: APXvYqx3Cb934Nybp/UFrQ1phrEFKo1sjE40qu4wXi4a8XTWsZCc6mk7d5szUe6JQjOomKKVHGtKCUUCnbRNvdgXRi8=
X-Received: by 2002:adf:f986:: with SMTP id f6mr69849723wrr.182.1582559780929; 
 Mon, 24 Feb 2020 07:56:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <08d22ed5ffef1d947b819606aafa6414a16bed0b.1582310142.git.tamas.lengyel@intel.com>
 <2d67745e-cb5b-83d2-e6a3-46d8e08ae03d@citrix.com>
In-Reply-To: <2d67745e-cb5b-83d2-e6a3-46d8e08ae03d@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 24 Feb 2020 08:55:44 -0700
Message-ID: <CABfawhmkvmbHO7-jAX8-kb9bsT4WjHmsiTyP2DFqB7d_XUJJRg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v9 2/5] xen: add parent_domid field to
 createdomain domctl
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
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgODo0NSBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDIxLzAyLzIwMjAgMTg6NDksIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IFdoZW4gY3JlYXRpbmcgYSBkb21haW4gdGhhdCB3aWxsIGJlIHVz
ZWQgYXMgYSBWTSBmb3JrIHNvbWUgaW5mb3JtYXRpb24gaXMKPiA+IHJlcXVpcmVkIHRvIHNldCB0
aGluZ3MgdXAgcHJvcGVybHksIGxpa2UgdGhlIG1heF92Y3B1cyBjb3VudC4gSW5zdGVhZCBvZiB0
aGUKPiA+IHRvb2xzdGFjayBoYXZpbmcgdG8gZ2F0aGVyIHRoaXMgaW5mb3JtYXRpb24gZm9yIGVh
Y2ggZm9yayBpbiBhIHNlcGFyYXRlCj4gPiBoeXBlcmNhbGwgd2UgY2FuIGp1c3QgaW5jbHVkZSB0
aGUgcGFyZW50IGRvbWFpbidzIGlkIGluIHRoZSBjcmVhdGVkb21haW4gZG9tY3RsCj4gPiBzbyB0
aGF0IFhlbiBjYW4gY29weSB0aGUgc2V0dGluZyB3aXRob3V0IHRoZSBleHRyYSB0b29sc3RhY2sg
cXVlcmllcy4KPgo+IFJpZ2h0LCBidXQgd2hlbiBJIHNhaWQgdGhpcyB3YXNuJ3Qgc2FmZSwgSSBk
aWQgbWVhbiBpdC4uLgo+Cj4gV2hhdCBoYXBwZW5zIHdoZW4gcGFyZW50IGFuZCB0aGUgY3VycmVu
dCBkb21haW4gaGF2ZSBkaWZmZXJlbnQgZ250dGFiIG9yCj4gZXZ0Y2huIGxpbWl0cywgb3IgZGlm
ZmVyZW50IGVtdWxhdGlvbiBzZXR0aW5ncz8KPgo+IElmIHlvdSB3YW50IHRvIGZvcmsgYSBkb21h
aW4gc2FmZWx5LCB5b3UgZWl0aGVyIG5lZWQgdG8gaGF2ZSBubwo+IHBhcmFtZXRlcnMgcGFzc2Vk
IGJ5IHRoZSB0b29sc3RhY2sgKGFuZCBsZXQgWGVuIGNvcHkgYXBwcm9wcmlhdGUKPiB2YWx1ZXMp
LCBvciBjcm9zcyBjaGVjayBldmVyeSBwcm92aWRlZCBwYXJhbWV0ZXIgYW5kIGJhaWwgZWFybHkg
b24gYQo+IG1pc21hdGNoLgoKSWYgeW91IGFyZSB1c2luZyB0aGUgdG9vbHN0YWNrIGNvZGUgd2Ug
YWRkIGluIHBhdGNoIDUgdGhhdCBkb2Vzbid0CmhhcHBlbi4gU28sIGZvciB0aGUgc2l0dWF0aW9u
IHlvdSBkZXNjcmliZSB0byBoYXBwZW46IDEpIHlvdSBoYXZlIHRvCmN1c3RvbSBjb21waWxlIFhl
biB3aXRoIHRoZSBFWFBFUlQgc2V0dGluZyBlbmFibGUgdGhpcyBleHBlcmltZW50YWwKZmVhdHVy
ZSAyKSB3cml0ZSB5b3VyIG93biB0b29sc3RhY2sgY29kZSAzKSBzY3JldyB1cCBkb2luZyBzby4g
VGhpcyBpcwpzdWNoIGFuIHVubGlrZWx5IHNjZW5hcmlvIHRoYXQgSSdtIG5vdCByZWFsbHkgYm90
aGVyZWQgYnkgaXQuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
