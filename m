Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB72EBCA7A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:44:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClz5-0001IJ-53; Tue, 24 Sep 2019 14:40:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l/dq=XT=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iClz3-00019Z-MM
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:40:06 +0000
X-Inumbo-ID: 2efcd7d6-ded9-11e9-8628-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by localhost (Halon) with ESMTPS
 id 2efcd7d6-ded9-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 14:40:01 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:687b:c909:9c42:5397])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 9960D2000A6;
 Wed, 25 Sep 2019 00:39:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1569335997; bh=b5iUnwDK90z2YAlw9l3jpUfJo0/wy+eSAT84hRwZZoE=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=H8qGw9yxapiS6eZsjCHybYH+R9G0TVXLpSsxkyr62/A0eSmpFj7OuOmGrP8nmuxUV
 DUhlrqyRWw8pctpL+vwvPah017zfbOZ5yAcvLmMLT1ALzNmb2nwhpwsbPKBg6uWW3J
 2fS1g25FncsCIDPNacYJod3CxON1GxkWNF8u/cHg=
Date: Wed, 25 Sep 2019 00:39:57 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: Andreas Kinzler <hfp@posteo.de>
Message-Id: <1569335997.2918.0@crc.id.au>
In-Reply-To: <d275020d-5ced-be61-ef1d-9378b0240fb7@posteo.de>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <5d406fbf-d057-a515-5364-6f0e2f6955c7@suse.com>
 <d275020d-5ced-be61-ef1d-9378b0240fb7@posteo.de>
X-Mailer: geary/3.34.0
MIME-Version: 1.0
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul.Durrant@citrix.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgdGhpcyBpcyBoZWxwZnVsLCBJIGNhbiBwcm9iYWJseSBwcm92aWRlIHRoZSBzYW1lIGZyb206
CgkqIFJ5emVuIDE3MDB4CgkqIFJ5emVuIDI3MDB4CgkqIFJ5emVuIDM5MDB4CgpJJ2xsIGxlYXZl
IGl0IHRvIHRob3NlIGluIHRoZSBrbm93IGFzIHRvIHdoYXQgaXMgdXNlZnVsIG9yIG5vdC4uLgpT
dGV2ZW4gSGFpZ2gKCvCfk6cgbmV0d2l6QGNyYy5pZC5hdSAgICAg8J+SuyBodHRwczovL3d3dy5j
cmMuaWQuYXUK8J+TniArNjEzIDkwMDEgNjA5MCAgICAgICDwn5OxICs2MTQgMTI5MyA1ODk3CgoK
T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMTE6NTYsIEFuZHJlYXMgS2luemxlciA8aGZwQHBvc3Rl
by5kZT4gd3JvdGU6Cj4gT24gMjMuMDkuMjAxOSAxMDoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
IFdoaWxlLCBhY2NvcmRpbmcgdG8gQU1EJ3MgcHJvY2Vzc29yIHNwZWNzIHBhZ2UsIHRoZSAzNzAw
WCBpcyBqdXN0IGFuCj4+IDgtY29yZSBjaGlwLCBJIHdvbmRlciB3aGV0aGVyCj4+IGh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wOS9tc2cw
MTk1NC5odG1sCj4+IHN0aWxsIGFmZmVjdHMgdGhpcyBjb25maWd1cmF0aW9uIGFzIHdlbGwuIENv
dWxkIHlvdSBnaXZlIHRoaXMgYSB0cnkgCj4+IGluCj4+IGF0IGxlYXN0IHRoZSB2aXJpZGlhbj0w
IGNhc2U/IEFzIHRvIExpbnV4LCBkaWQgeW91IGNoZWNrIHRoYXQgUFZICj4gCj4gQXMgYSBmaXJz
dCBpbnB1dCBmb3IgdGhlIFhlbiBkZXZlbG9wZXJzIEkgdXNlZCB0aGUgdG9vbCBmcm9tIAo+IGh0
dHA6Ly93d3cuZXRhbGxlbi5jb20vY3B1aWQuaHRtbCB0byBkdW1wIGNvbXBsZXRlIGNwdWlkIGlu
Zm9ybWF0aW9uLgo+IAo+IFJlZ2FyZHMgQW5kcmVhcwo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
