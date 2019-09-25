Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E744BE17E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:38:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9LL-0007qN-UX; Wed, 25 Sep 2019 15:36:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mY+w=XU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iD9LK-0007qH-Dn
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:36:38 +0000
X-Inumbo-ID: 42db1548-dfaa-11e9-97fb-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by localhost (Halon) with ESMTPS
 id 42db1548-dfaa-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 15:36:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n14so7489771wrw.9
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 08:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fSHn/LxVhH5R4EwNTexJ4ABfnpHAl/GgiE+ZBw+sR/8=;
 b=dT2GByoX0TLYhbMBUoy4Vqet/yTSkU9o9HQiOTFklR2VSPnE0CKDMfORQCkBsYJ+EB
 AROpmkEwpBRiEC0jOSb9BTFFplUEbtpQh+yX9wDFBCCMKD+npV9xmhLCgVdlVbZZMhj5
 JiF4+t8zA8umrqKeQhiTzIY57g3nPwzDovLGwIxDUiEnn9rX0AuLBMWSvTcgRdyk9gJw
 8N8hMVnExt4RxA+fX4okvhzBlf/0uEygXb5TAXeAFzFi5Vn+3p4SDn5WGta0TOCRKwAM
 k3E22zjhUZCpQUVwE3THDN4BjnPaJtvArChuEsV/dOz+DzwKq0Tt6JInHDbwP8OfMyt8
 QzVQ==
X-Gm-Message-State: APjAAAURzUNJTTVKtTLA9PqlnHA5y8X+6EVEMbB8zauo3XFNmvo43m+y
 2ZeMfPHTTYIQiaJdZ3dM7e8=
X-Google-Smtp-Source: APXvYqyuciJcZjfy9DXC+K/v/TVi8VKYjR3mzxdWTyI+jUPKLsQIYIRHPBirgaCvjfw6Ct2UxWh4tA==
X-Received: by 2002:adf:e591:: with SMTP id l17mr10613148wrm.199.1569425796614; 
 Wed, 25 Sep 2019 08:36:36 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id f143sm8932536wme.40.2019.09.25.08.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 08:36:35 -0700 (PDT)
Date: Wed, 25 Sep 2019 16:36:34 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190925153634.wjlxjnz6egibqypg@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190925110250.vshhg52xlrmafpka@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925110250.vshhg52xlrmafpka@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDE6MDI6NTBQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIFNlcCAyMywgMjAxOSBhdCAxMTowOToyM0FNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gSGkgYWxsCj4gPiAKPiA+IEluIGNhc2UgeW91J3JlIHdvbmRlcmluZywg
SSBjYW4gYWxyZWFkeSBydW4gYSBmdWxseSBmbGVkZ2VkIFhlbiBzeXN0ZW0gb24KPiA+IEh5cGVy
LVYgd2l0aCBlbXVsYXRlZCBkaXNrIGFuZCBuZXR3b3JrLgo+ID4gCj4gPiBUaGlzIGlzIHRoZSB2
ZXJ5IGZpcnN0IHN0YWdlIGZvciBwb3J0aW5nIFhlbiB0byBydW4gb24gSHlwZXItViB3aXRoIGFs
bCB0aGUKPiA+IGdvb2RpZXMgSHlwZXItViBoYXMgdG8gb2ZmZXIuICBXaXRoIHRoaXMgc2VyaWVz
LCBYZW4gY2FuIHN1Y2Nlc3NmdWxseSBkZXRlY3QKPiA+IEh5cGVyLVYgYW5kIHByaW50cyBvdXQg
YSBtZXNzYWdlLiAgSSB3b3VsZCBsaWtlIHRvIGZpcnN0IGdldCB0aGUgZGlyZWN0b3J5Cj4gPiBz
dHJ1Y3R1cmUgYW5kIGtjb25maWcgb3B0aW9ucyBhZ3JlZWQgdXBvbi4KPiA+IAo+ID4gVGhlcmUg
YXJlIHR3byBtYWpvciBhcmVhcyB0byBiZSB3b3JrZWQgb246Cj4gPiAgICogTWFrZSBEb20wIGFi
bGUgdG8gdXNlIEh5cGVyLVYncyBzeW50aGV0aWMgZGV2aWNlcy4KPiA+ICAgKiBNYWtlIFhlbiB1
c2Ugb2YgdGhlIHN5bnRoZXRpYyB0aW1lciwgcmVmZXJlbmNlIFRTQyBhbmQgZW5saWdodGVubWVu
dCBWTUNTCj4gPiAgICAgYW5kIG90aGVyIGludGVyZmFjZXMuCj4gPiAKPiA+IFRoZXkgYXJlbid0
IHRyaXZpYWwsIGFuZCB0aW1lIGNhbiBiZSBzY2FyY2Ugb24gbXkgc2lkZSwgc28gSSBpbnRlbmQg
dG8gcG9zdAo+ID4gcGF0Y2hlcyBwaWVjZSBtZWFsIHdoZW4gdGhleSBhcmUgcmVhZHkuCj4gPiAK
PiA+IFF1ZXN0aW9ucyBhbmQgY29tbWVudHMgYXJlIHdlbGNvbWUuCj4gCj4gVGhhbmtzIGZvciBk
b2luZyB0aGlzIQo+IAo+IEluIHRoZSBwYXN0IEkndmUgcGxheWVkIHdpdGggdHJ5aW5nIHRvIGdl
dCBYZW4gdG8gYm9vdCBhcyBhIGd1ZXN0IG9uCj4gSHlwZXJWIGdlbjIgaW5zdGFuY2VzLCBhbmQg
SSBkaWQgbWFuYWdlIHRvIGdldCBpdCBib290aW5nLCBMaW51eAo+IGhvd2V2ZXIgd291bGQgZ2V0
IGV4dHJlbWVseSBjb25mdXNlZCBiZWNhdXNlIGdlbjIgbGFja3MgZW11bGF0ZWQKPiBkZXZpY2Vz
IGFuZCBpbnN0ZWFkIHRoZSBndWVzdCBpcyBmb3JjZWQgdG8gdXNlIHRoZSBIeXBlclYgUFYgZGV2
aWNlcwo+IEFGQUlLLgoKSG93IGRpZCB5b3UgZm9yY2UgTGludXggdG8gdXNlIEh5cGVyLVYgUFYg
ZGV2aWNlcz8gIEFJVUkgTGludXggd29uJ3QKaGF2ZSBhY2Nlc3MgdG8gVk1CdXMgKGxpa2UgWGVu
QnVzIGJ1dCB3aXRoIHNvbWUgZGlmZmVyZW5jZXMpIGFuZCBTeW5JQwooU3ludGhldGljIGludGVy
cnVwdCBjb250cm9sbGVyLCB0aGluayBvZiBpdCBhcyBhbiBhYnN0cmFjdGlvbiBhcm91bmQKZXZl
bnQgY2hhbm5lbCBpbiBYZW4gd29ybGQpIGluIHRoZSBmaXJzdCBwbGFjZS4gIEJ1dCBJIGhhdmVu
J3QgdHJpZWQKZ2VuMiBzbyBJIGNvdWxkIGJlIHdyb25nLgoKPiAKPiBBbnl3YXksIEkgaGFkIHRo
ZSBmb2xsb3dpbmcgcGF0Y2ggb24gbXkgYmFja2xvZyB3aGljaCBhbGxvd2VkIG1lIHRvCj4gYm9v
dCBvbiBnZW4yIGluc3RhbmNlcywgcG9zdGluZyBpdCBoZXJlIGluIGNhc2UgaXQgaGVscHMgeW91
IGlmIHlvdQo+IHBsYW4gdG8gZ28gdGhhdCByb3V0ZS4KClRoZSBsb25nIHRlcm0gcGxhbiBmb3Ig
dGhlIHRpbWUgc291cmNlIGlzIHRvIHVzZSB0aGUgcmVmZXJlbmNlIFRTQyBwYWdlCnByb3ZpZGVk
IGJ5IEh5cGVyLVYsIGp1c3QgbGlrZSB3ZSBkaWQgZm9yIFhlbi4KCllvdXIgcGF0Y2ggc2VlbXMg
dG8gYmUgYW4gdXNlZnVsIHRoaW5nIHRvIGRvIG9uIGl0cyBvd24gYW55d2F5LgoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
