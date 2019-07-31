Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44827C58E
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 17:09:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsqBe-0003rF-Tm; Wed, 31 Jul 2019 15:06:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gESl=V4=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1hsqBc-0003rA-RL
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 15:06:41 +0000
X-Inumbo-ID: caad9e77-b3a4-11e9-8980-bc764e045a96
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id caad9e77-b3a4-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 15:06:38 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:2c4d:29ad:9a5d:b54f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 4CB382001B8
 for <xen-devel@lists.xenproject.org>; Thu,  1 Aug 2019 01:06:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1564585567; bh=CkFCurvk61WLhKTKLsAjZ+2RjAzTEdOrO4yEtG9+J74=;
 h=Date:From:Subject:To;
 b=nG/44/ciwx15RfAY3JrxDHSdB4LS5QbRmO4lS3CC6HHi0FYgssN3VvpILMZA7Vu6H
 VIgaw5QzaqmvNSbkWUtMFL7rvjkZj8+m8jP5LDMPI9xh5GrbF3byBmhwwAKNlr1YPu
 D0RP5eBAwywy1eejm3vA/vI0ck71kW58FmT+er60=
Date: Thu, 01 Aug 2019 01:06:33 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-Id: <1564585593.5750.1@crc.id.au>
X-Mailer: geary/3.32.1
MIME-Version: 1.0
Subject: [Xen-devel] Fedora 30 and BLSCFG changes equals non-booting DomUs.
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

RmVkb3JhIDMwIGltcGxlbWVudGVkIEJvb3QgTG9hZGVyIFNwZWNpZmljYXRpb24gKEJMUykgYnkg
ZGVmYXVsdCBmb3IgCmFsbCBuZXdseSBpbnN0YWxsZWQsIGFuZCBhbnkgdXBncmFkZWQgc3lzdGVt
cy4KClRoaXMgY2F1c2VzIGhlbGwgYm9vdGluZyBhIERvbVUgdGhhdCBpcyAqbm90KiBjb25maWd1
cmVkIGFzIEhWTSAtIHRodXMgCmZhaWxzIHdoZW4gbm90IHVzaW5nIHRoZSBib290bG9hZGVyIGZy
b20gd2l0aGluIHRoZSBndWVzdC4KCnB5Z3J1YiB3aWxsIGFsd2F5cyBmYWlsIHRvIGJvb3QgdGhl
c2UgVk1zLgoKTGlua3M6CgpGZWRvcmEgY2hhbmdlIHBhZ2U6CglodHRwczovL2ZlZG9yYXByb2pl
Y3Qub3JnL3dpa2kvQ2hhbmdlcy9Cb290TG9hZGVyU3BlY0J5RGVmYXVsdAoKTWFpbiBGZWRvcmEg
Qlogd2l0aCBsb3RzIG9mIGlzc3VlczoKCWh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93
X2J1Zy5jZ2k/aWQ9MTY1MjgwNgoKTXkgYnVnIHJlcG9ydCBvbiBuZXcga2VybmVscyBub3QgYXBw
ZWFyaW5nIGluIGdlbmVyYXRlZCBncnViLmNmZyBmaWxlczoKCWh0dHBzOi8vYnVnemlsbGEucmVk
aGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTcwMzcwMAoKU28gZmFyLCB0aGUgb25seSB3b3JrYXJv
dW5kIGlzIHRvIGluc3RhbGwgdGhlICdncnViYnktZGVwcmVjaWF0ZWQnIApwYWNrYWdlLCBzZXQg
J0dSVUJfRU5BQkxFX0JMU0NGRz1mYWxzZScgaW4gL2V0Yy9kZWZhdWx0L2dydWIsIHRoZW4gCm1h
bnVhbGx5IHJlLWNyZWF0ZSB0aGUgZ3J1Yi5jZmcgZmlsZSB2aWE6IGdydWIyLW1rY29uZmlnIC1v
IAovYm9vdC9ncnViL2dydWIuY2ZnCgpVcG9uIGEgbmV3ZXIga2VybmVsIGJlaW5nIGluc3RhbGxl
ZCwgaXQgbWF5IG9yIG1heSBub3QgYXBwZWFyIGluIHRoZSAKZ3J1Yi5jZmcgY29uZmlndXJhdGlv
biAtIGV2ZW4gd2l0aCB0aGUgYWJvdmUgY2hhbmdlcy4gQXMgc3VjaCwgbnVtZXJvdXMgCmtlcm5l
bCB1cGdyYWRlcyBsYXRlciBhbmQgeW91ciBpbnN0YWxsZWQgVk0gbWlnaHQgbm90IGJvb3QgYXQg
YWxsLgoKSW4gbnVtZXJvdXMgc3lzdGVtcywgSSBydW4gZ3J1YjItbWtjb25maWcgaW4gL2V0Yy9y
Yy5kL3JjLmxvY2FsIHRvIAphdm9pZCBhIGNvbXBsZXRlbHkgYnJva2VuIFZNLiBOb3QgaWRlYWwu
CgpTbywgdG8gc3RhcnQgdGhlIGRpc2N1c3Npb24sIHdpdGggbm9uZSBvZiB0aGlzIGN1cnJlbnRs
eSBiZWluZyBzZW50IAp1cHN0cmVhbSwgdGhpcyBpcyBhIEZlZG9yYS1pc20uIEhvdyB0byBoYW5k
bGUgQkxTIGVuYWJsZWQgZ3Vlc3RzPwoKSXQgYWxzbyBzZWVtcyB0byBiZSBhIEZlZG9yYSBwcm9i
bGVtIHdpdGggcmVzcGVjdCB0byBrZXJuZWwgdXBkYXRlcyAKc3RpbGwgY2F1c2luZyBwcm9ibGVt
cyAtIGJ1dCB0aGF0J3MgYW5vdGhlciBpc3N1ZS4KClN0ZXZlbiBIYWlnaAoK8J+TpyBuZXR3aXpA
Y3JjLmlkLmF1ICAgICDwn5K7IGh0dHBzOi8vd3d3LmNyYy5pZC5hdQrwn5OeICs2MTMgOTAwMSA2
MDkwICAgICAgIPCfk7EgKzYxNCAxMjkzIDU4OTcKCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
