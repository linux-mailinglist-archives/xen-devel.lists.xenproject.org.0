Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0E6E697
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:34:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8Gd-0007hx-Gv; Mon, 29 Apr 2019 15:32:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL8Gc-0007hi-8V
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:32:30 +0000
X-Inumbo-ID: fec4f3a0-6a93-11e9-88ea-abe76b80978e
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fec4f3a0-6a93-11e9-88ea-abe76b80978e;
 Mon, 29 Apr 2019 15:32:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556551948; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=TRHk6058JW/D3YQvfMBuNJK52m+0kIOubqXMKr9NvD8=;
 b=PZkZPcfkdnlB/yScUy+GqushF9LiOYnAghqN6PQXmujq8xLJivfLyD5FdtBj0n593/fqN1LR
 DWMufJacOWwMTrE11DE5odiuvWwW5obwEwdRpRlTGY2zpXNK586zaNEGfHrUKFX9PNKEHq6c
 6AVWgbdA+TVJkI87zoa05kwhVBQ=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mxa.mailgun.org with ESMTP id 5cc7190b.7ff0aa003630-smtp-out-n03;
 Mon, 29 Apr 2019 15:32:27 -0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id h11so16416872wmb.5
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 08:32:27 -0700 (PDT)
X-Gm-Message-State: APjAAAX6kCnz8BcePtKZFzGLVyxBimm+IZXUTHM7ALdYXq+XmTifNfmR
 671CX7FuGPlQXvo5gtUM1l257kfmAg5XFiH6NEg=
X-Google-Smtp-Source: APXvYqxl10fEYGDZQlLDHzrshuHWls87HSws9ncyPSWUQ3nqYwPThEYzBh8u0gO4EKGUnrOdzBx4WSoVxEVPlB32nvU=
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr17371879wmc.54.1556551946303; 
 Mon, 29 Apr 2019 08:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-3-tamas@tklengyel.com>
 <5CC710DC020000780022A102@prv1-mh.provo.novell.com>
In-Reply-To: <5CC710DC020000780022A102@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 29 Apr 2019 09:31:49 -0600
X-Gmail-Original-Message-ID: <CABfawhmo7YeW-RGJtLN2pU7qVbgOzVUtGYbsUh=qN-K+xHDTeA@mail.gmail.com>
Message-ID: <CABfawhmo7YeW-RGJtLN2pU7qVbgOzVUtGYbsUh=qN-K+xHDTeA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v3 3/4] x86/mem_sharing: enable mem_share
 audit mode only in debug builds
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgODo1NyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5n
LmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaAo+ID4gQEAgLTI1
LDcgKzI1LDkgQEAKPiA+ICAjaW5jbHVkZSA8cHVibGljL21lbW9yeS5oPgo+ID4KPiA+ICAvKiBB
dWRpdGluZyBvZiBtZW1vcnkgc2hhcmluZyBjb2RlPyAqLwo+ID4gKyNpZm5kZWYgTkRFQlVHCj4g
PiAgI2RlZmluZSBNRU1fU0hBUklOR19BVURJVCAxCj4gPiArI2VuZGlmCj4KPiBTaW5jZSBjb25z
dW1lcnMgdXNlICNpZiAobm90ICNpZmRlZiksIEkgdGhpbmsgYW4gI2Vsc2Ugd291bGQKPiBiZSBv
biBvcmRlciBoZXJlLCBldmVuIGlmIChJIHRoaW5rKSBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5IHdp
dGgKPiBnY2MuCgpTdXJlLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
