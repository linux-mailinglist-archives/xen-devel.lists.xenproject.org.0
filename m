Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE51B407
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 12:28:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ88K-0003ZD-KK; Mon, 13 May 2019 10:24:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ErgS=TN=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1hQ88I-0003Z7-R4
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 10:24:35 +0000
X-Inumbo-ID: 4b93d407-7569-11e9-8980-bc764e045a96
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4b93d407-7569-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 10:24:33 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:3531:a6bb:df13:221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id D0EFF2021D
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2019 20:24:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1557743069; bh=pzcnETj6NW7SMFigod1K4beSlPJQOtyuhP7TlUdWKSA=;
 h=Date:From:Subject:To;
 b=D2PL2xWGSYsqGRElbdKljn/DkVFHq7awHVg+p7a9bgmzOHQdeX02pOVAKPpIg3djN
 u3jdiClAHTbfF2K1WeGUd7xoLbkfXlKNNtf9tPZUF/3BT/xHByXZlVlziRziOsFp8m
 N6VBlc01jG/YnZ4t+DI6Ulb2eVYtyY3n8Sc0L9S4=
Date: Mon, 13 May 2019 20:24:28 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: xen-devel@lists.xenproject.org
Message-Id: <1557743068.2372.0@crc.id.au>
X-Mailer: geary/3.32.1
MIME-Version: 1.0
Subject: [Xen-devel] pygrub not starting first menuentry in Fedora 30
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

VGhlcmUgc2VlbXMgdG8gYmUgc29tZSBjaGFuZ2VzIGluIEZlZG9yYSAzMCB0aGF0IGNhdXNlIHRo
ZSBzZWNvbmQgYm9vdCAKZW50cnkgaW4gZ3J1Yi5jZmcgdG8gYmUgYm9vdGVkIGluc3RlYWQgb2Yg
dGhlIGZpcnN0LgoKVGhpcyBtZWFucyB0aGF0IEZlZG9yYSAzMCBzeXN0ZW1zIGVpdGhlciBhbHdh
eXMgYm9vdCBpbnRvIGFuIG9sZGVyIAprZXJuZWwsIG9yIGluIHRoZSBjYXNlIG9mIHN5c3RlbXMg
d2l0aCBvbmx5IG9uZSBrZXJuZWwgaW5zdGFsbGVkLCB0aGUgCnJlc2N1ZSBpbWFnZS4KClRoZXJl
IGFsc28gc2VlbXMgdG8gYmUgc29tZSBuZXcgaXNzdWVzIHdpdGggdGhlIG1vdmUgdG8gQkxTQ0ZH
IC0gCmhvd2V2ZXIgaXQgc2VlbXMgYSBuZXcgcmVxdWlyZW1lbnQgaXMgdG8gaGF2ZSAKR1JVQl9F
TkFCTEVfQkxTQ0ZHPSJmYWxzZSIgaW4gL2V0Yy9kZWZhdWx0L2dydWIuIFRoaXMgY2F1c2VzIApn
cnViMi1ta2NvbmZpZyB0byB3b3JrIGNvcnJlY3RseSBhbmQgc3BpdCBvdXQgYSBncnViLmNmZyBm
aWxlIHRoYXQgCnB5Z3J1YiBjYW4gdGhlbiB1c2UuCgpJcyB0aGlzIGEgYnVnIGluIHB5Z3J1Yiwg
b3IgYSBwcm9ibGVtIHdpdGggaG93IEZlZG9yYSAzMCBnZW5lcmF0ZXMgYSAKZ3J1Yi5jZmc/CgpJ
IHRyaWVkIHRvIHBpY2sgdGhyb3VnaCBweWdydWIgLSBidXQgY291bGRuJ3QgcXVpdGUgZm9sbG93
IHRoZSBweXRob24gCmxvZ2ljIHRvIHNlZSB3aGVyZSB0aGUgZGVmYXVsdCBib290IG9wdGlvbiBp
cyBzZWxlY3RlZC4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
