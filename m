Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F0887C1
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2019 05:42:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwIDd-00007u-Ue; Sat, 10 Aug 2019 03:39:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ez8X=WG=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1hwIDc-00007p-DW
 for xen-devel@lists.xenproject.org; Sat, 10 Aug 2019 03:39:00 +0000
X-Inumbo-ID: 61a15ec1-bb20-11e9-8980-bc764e045a96
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 61a15ec1-bb20-11e9-8980-bc764e045a96;
 Sat, 10 Aug 2019 03:38:58 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:3531:a6bb:df13:221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 74EAF2000A0
 for <xen-devel@lists.xenproject.org>; Sat, 10 Aug 2019 13:37:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1565408276; bh=/7MMs+qR5L4+ABSG3PMsLw0J0wgpHEZWIEUK9XVsu2I=;
 h=Date:From:Subject:To:In-Reply-To:References;
 b=PI+UaK6uMqjae6ob9Rjdtk1Eaw6Z5eSVBrslFsOGRltVyoaEU1tW+jvsSsxhoWXOO
 Q3XRFPQtdJ27IONYNEa9HG+QRY8wAgeVY9rUwzHKK4ZqUBdAySTjkZ0cpmuE2/ZWA/
 RNMFyJYw6HchkszTFz45QM+IGomGxMOOm6EKOXaE=
Date: Sat, 10 Aug 2019 13:38:54 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: xen-devel@lists.xenproject.org
Message-Id: <1565408334.4987.0@crc.id.au>
In-Reply-To: <1564584874.5750.0@crc.id.au>
References: <1564584874.5750.0@crc.id.au>
X-Mailer: geary/3.32.2
MIME-Version: 1.0
Subject: Re: [Xen-devel] Fedora 30 DomU - pygrub always boots the second
 menu option
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnVydGhlciBsb29raW5nIGludG8gdGhpcywgaXQgc2VlbXMgdGhlIHByb2JsZW0gb2NjdXJzIG9u
IHRoaXMgc2VjdGlvbiAKb2YgdGhlIGdydWIuY2ZnOgoKIyMjIEJFR0lOIC9ldGMvZ3J1Yi5kLzA4
X2ZhbGxiYWNrX2NvdW50aW5nICMjIwppbnNtb2QgaW5jcmVtZW50CiMgQ2hlY2sgaWYgYm9vdF9j
b3VudGVyIGV4aXN0cyBhbmQgYm9vdF9zdWNjZXNzPTAgdG8gYWN0aXZhdGUgdGhpcyAKYmVoYXZp
b3VyLgppZiBbIC1uICIke2Jvb3RfY291bnRlcn0iIC1hICIke2Jvb3Rfc3VjY2Vzc30iID0gIjAi
IF07IHRoZW4KICAjIGlmIGNvdW50ZG93biBoYXMgZW5kZWQsIGNob29zZSB0byBib290IHJvbGxi
YWNrIGRlcGxveW1lbnQsCiAgIyBpLmUuIGRlZmF1bHQ9MSBvbiBPU1RyZWUtYmFzZWQgc3lzdGVt
cy4KICBpZiBbICIke2Jvb3RfY291bnRlcn0iID0gIjAiIC1vICIke2Jvb3RfY291bnRlcn0iID0g
Ii0xIiBdOyB0aGVuCiAgICBzZXQgZGVmYXVsdD0xCiAgICBzZXQgYm9vdF9jb3VudGVyPS0xCiAg
IyBvdGhlcndpc2UgZGVjcmVtZW50IGJvb3RfY291bnRlcgogIGVsc2UKICAgIGRlY3JlbWVudCBi
b290X2NvdW50ZXIKICBmaQogIHNhdmVfZW52IGJvb3RfY291bnRlcgpmaQojIyMgRU5EIC9ldGMv
Z3J1Yi5kLzA4X2ZhbGxiYWNrX2NvdW50aW5nICMjIwoKSXQgc2VlbXMgcHlncnViIHNlZXMgdGhl
ICdzZXQgZGVmYXVsdD0xJyBhbmQgdXNlcyBpdCAtIGV2ZW4gdGhvdWdoIGl0IApzaG91bGRuJ3Qg
YmUgbm9ybWFsbHkgaGl0IGR1ZSB0byBpdCBiZWluZyBpbiBhIGNvbmRpdGlvbmFsLgpTdGV2ZW4g
SGFpZ2gKCvCfk6cgbmV0d2l6QGNyYy5pZC5hdSAgICAg8J+SuyBodHRwczovL3d3dy5jcmMuaWQu
YXUK8J+TniArNjEzIDkwMDEgNjA5MCAgICAgICDwn5OxICs2MTQgMTI5MyA1ODk3CgoKT24gVGh1
LCBBdWcgMSwgMjAxOSBhdCAxMjo1NCBBTSwgU3RldmVuIEhhaWdoIDxuZXR3aXpAY3JjLmlkLmF1
PiB3cm90ZToKPiBUaGVyZSdzIGEgdG9uIG9mIGNoYW5nZXMgdG8gZ3J1YiBpbiBGZWRvcmEgMzAu
Li4uIE1vc3Qgb2YgdGhlbSAKPiBjYXVzaW5nIHBhaW4uCj4gCj4gV2hlbiBib290aW5nIHVzaW5n
IHB5Z3J1YiwgdGhlIHByZXNlbnRlZCBtZW51IGFsd2F5cyBoYXMgdGhlIHNlY29uZCAKPiBvcHRp
b24gc2VsZWN0ZWQuCj4gCj4gVGhlIGNvbnRlbnRzIG9mIC9ldGMvZGVmYXVsdC9ncnViIGlzIGFz
IGZvbGxvd3M6Cj4gR1JVQl9USU1FT1VUPTEKPiBHUlVCX0RFRkFVTFQ9MAo+IEdSVUJfRElTQUJM
RV9TVUJNRU5VPXRydWUKPiBHUlVCX1RFUk1JTkFMX09VVFBVVD0iY29uc29sZSIKPiBHUlVCX0NN
RExJTkVfTElOVVg9ImF1ZGl0PTAgc2VsaW51eD0wIGNvbnNvbGU9aHZjMCIKPiBHUlVCX0RJU0FC
TEVfUkVDT1ZFUlk9InRydWUiCj4gR1JVQl9FTkFCTEVfQkxTQ0ZHPWZhbHNlCj4gCj4gSSBoYXZl
IGF0dGFjaGVkIHRoZSBnZW5lcmF0ZWQgZ3J1Yi5jZmcgY3JlYXRlZCB2aWE6Cj4gCWdydWIyLW1r
Y29uZmlnIC1vIC9ib290L2dydWIvZ3J1Yi5jZmcKPiAKPiBCTFNDRkcgaXMgYSB3aG9sZSBuZXcg
Y2x1c3RlcmYqKmsgb2YgcHJvYmxlbXMgdGhhdCBiZWNhbWUgZGVmYXVsdCBpbiAKPiBGZWRvcmEg
MzAgdGhhdCBjYXVzZSBtYW55IHByb2JsZW1zIC0gYnV0IGZpcnN0IHRoaW5ncyBmaXJzdC4uLgo+
IFN0ZXZlbiBIYWlnaAo+IAo+IPCfk6cgbmV0d2l6QGNyYy5pZC5hdSAgICAg8J+SuyBodHRwczov
L3d3dy5jcmMuaWQuYXUKPiDwn5OeICs2MTMgOTAwMSA2MDkwICAgICAgIPCfk7EgKzYxNCAxMjkz
IDU4OTcKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
