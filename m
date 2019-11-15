Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEEFFE3DE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 18:25:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVfJ6-0002ss-5Z; Fri, 15 Nov 2019 17:22:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J+a1=ZH=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iVfJ4-0002sm-6a
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 17:22:50 +0000
X-Inumbo-ID: 877b188e-07cc-11ea-b678-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 877b188e-07cc-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 17:22:43 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:bd38:8202:2c2b:cd7a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 847752001A4;
 Sat, 16 Nov 2019 04:22:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1573838560; bh=RjjHg5T3KbwWnUBjI+/6R05654SvOkhA5b+GLEo2O9I=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=y3WIYdwe/Mj25OUnAKF8MPBDeLTxXWCsgTyEmW/LY6oRtS6sRLFxNV3PBuenaibKs
 ykS2xYLBCzwFdmQCxer6ZGacawPv6RYzGIrqyIeKW6qrineAuz/jkgeQfckDWempZi
 qxi/lA8EX5Td2Bfnj+XyXExBIdKJSB7ZlgBFNAJc=
Date: Sat, 16 Nov 2019 04:22:37 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: Andreas Kinzler <hfp@posteo.de>
Message-Id: <1573838557.2460.1@crc.id.au>
In-Reply-To: <0e47b56a-4e5d-e815-2e74-eab5da11f3d0@posteo.de>
References: <0e47b56a-4e5d-e815-2e74-eab5da11f3d0@posteo.de>
X-Mailer: geary/3.34.1
MIME-Version: 1.0
Subject: Re: [Xen-devel] Ryzen 3xxx works with Windows
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2FuIGFkZCB3ZWlnaHQgdG8gdGhlc2UgZmluZGluZ3MuIFRlc3RlZCB3aXRoIFhlbiA0LjEyLjEg
YW5kIHRoZSBjcHVpZCAKbGluZSBzdWdnZXN0ZWQgYW5kIGl0IGxvb2tzIGxpa2UgbXkgV2luZG93
cyBWTSBoYXMgY29tZSB1cCB3aXRoIDQgdkNQVVMuCgpJIGNhbid0IFJEUCBpbiB0byBtYWtlIHN1
cmUgaXRzIDEwMCUgYm9vdGVkLCBidXQgaXQgY2VydGFpbmx5IGlzbid0IApkb2luZyB0aGUgY3Jh
c2ggZHVtcCBjeWNsZSAtIGFuZCBDUFUgdXNhZ2UgaXMgY29uc2lzdGVudCB3aXRoIGJlaW5nIApz
dWNjZXNzZnVsbHkgYm9vdGVkLgpTdGV2ZW4gSGFpZ2gKCvCfk6cgbmV0d2l6QGNyYy5pZC5hdSAg
ICAg8J+SuyBodHRwczovL3d3dy5jcmMuaWQuYXUK8J+TniArNjEzIDkwMDEgNjA5MCAgICAgICDw
n5OxICs2MTQgMTI5MyA1ODk3CgoKT24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTg6MDYsIEFuZHJl
YXMgS2luemxlciA8aGZwQHBvc3Rlby5kZT4gd3JvdGU6Cj4gSGVsbG8gQWxsLAo+IAo+IEkgY29t
cGFyZWQgdGhlIENQVUlEIGxpc3RpbmdzIGZyb20gUnl6ZW4gMjcwMFggKGF0dGFjaGVkIGFzIHRh
ci54eikgCj4gdG8gMzcwMFggYW5kIGZvdW5kIG9ubHkgdmVyeSBmZXcgZGlmZmVyZW5jZXMuIEkg
YWRkZWQKPiAKPiBjcHVpZCA9IFsgIjB4ODAwMDAwMDg6ZWN4PXh4eHh4eHh4eHh4eHh4eHgwMTAw
eHh4eHh4eHh4eHh4IiBdCj4gCj4gdG8geGwuY2ZnIGFuZCB0aGVuIFdpbmRvd3MgcnVucyBncmVh
dCB3aXRoIDE2IHZDUFVzLiBDaW5lYmVuY2ggUjE1IAo+IHNjb3JlIGlzID4yMDUwIHdoaWNoIGlz
IG1vcmUgb3IgbGVzcyB0aGUgYmFyZSBtZXRhbCB2YWx1ZS4KPiAKPiBSZWdhcmRzIEFuZHJlYXMK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
