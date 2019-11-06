Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46623F144C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 11:49:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSIoZ-00063I-Gn; Wed, 06 Nov 2019 10:45:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MOxY=Y6=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iSIoX-00063D-E8
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 10:45:25 +0000
X-Inumbo-ID: 896c33ea-0082-11ea-9631-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 896c33ea-0082-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 10:45:24 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a17so1265322wmb.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 02:45:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xau8SPdKGAcMGfUo9R6RNWOMgUZuHGaLuVo+YpICtp8=;
 b=s0K2KtdcrcKRAVteWeWO/DBeDVoOh3TRkjMJpBpnRwaCHUvpQVG4tPmQ3PPV6KbJfd
 WTK8ygLZkx60lBCTTErq3okJJboDZW+MF8pi2Psb3WcUIi77kYT5yf/Zi8VTSkAoaDu2
 6D7K25SmbgzmSVGoj3gTjiTFeEEZchUUQqFeEWDWSvgM7NVEZvKYt11BsMaKse7ukDRx
 Jhz2GlBS9VivabAPRyyDk6JdaCKQopqf+jCOnoirhN5CmND7l+MdiohW7kZLtc08I9wO
 WCyVgAFOoQPVq3wmlbkSIXJ7+YFlZCunnohiSeAnc/de4U5qxMooIbXs1vMw35t7wcwC
 OcSw==
X-Gm-Message-State: APjAAAXrnIRckGYvQwngKRFJ2geaYf9uAJw7GORPnKtmqmox5vhkK3e6
 ZXHUD5yjZrIRAX+xGl+4N10=
X-Google-Smtp-Source: APXvYqyvPKkP7lt9ZGHs5z6O08NRD6cXYRI8abBE5hqVhDI401+Km7CBw/GU0U3bB7Zoc/DWJzIoAg==
X-Received: by 2002:a1c:ca:: with SMTP id 193mr1791307wma.103.1573037123586;
 Wed, 06 Nov 2019 02:45:23 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id e27sm6690206wra.21.2019.11.06.02.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 02:45:22 -0800 (PST)
Date: Wed, 6 Nov 2019 10:45:21 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20191106104521.xm32dkkcj7a3d3ru@debian>
References: <20191105235113.27469-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105235113.27469-1-sstabellini@kernel.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools: pygrub actually cross-compiles just
 fine
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
Cc: wl@xen.org, ian.jackson@eu.citrix.com,
 Christopher Clark <christopher.w.clark@gmail.com>, anthony.perard@citrix.com,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2MgeGVuLWRldmVsCgpPbiBUdWUsIE5vdiAwNSwgMjAxOSBhdCAwMzo1MToxM1BNIC0wODAwLCBT
dGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gQWN0dWFsbHksIHB5Z3J1YiBjcm9zcy1jb21waWxl
cyB3aXRob3V0IGlzc3Vlcy4gVGhlIGNyb3NzLWNvbXBpbGF0aW9uCj4gd29yay1hcm91bmQgZ29l
cyBiYWNrIHRvIDIwMDUgYW5kIGl0IHByb2JhYmx5IHJlZmVycmVkIHRvIFBvd2VyUEMuCj4gCj4g
UmVtb3ZlIHRoZSB3b3JrLWFyb3VuZCBub3cuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4KPiBDQzogQ2hyaXN0b3Bo
ZXIgQ2xhcmsgPGNocmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29tPgoKUHJlc3VtYWJseSB5b3Ug
dHJpZWQgdG8gY3Jvc3MtY29tcGlsZSBpdCBmb3IgQXJtPyBJdCB3b3VsZCBiZSBnb29kIHRvCm1l
bnRpb24gdGhhdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCgpJIHRoaW5rIHRoZSBjb250ZW50IG9m
IHRoaXMgcGF0Y2ggaXMgZmluZToKCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
