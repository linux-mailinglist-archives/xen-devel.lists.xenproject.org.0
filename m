Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62D3C8F69
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:08:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFi4p-0006fP-Ti; Wed, 02 Oct 2019 17:06:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0qpV=X3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iFi4n-0006eQ-V5
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:06:09 +0000
X-Inumbo-ID: e510b3c2-e536-11e9-8628-bc764e2007e4
Received: from mo6-p02-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5302::11])
 by localhost (Halon) with ESMTPS
 id e510b3c2-e536-11e9-8628-bc764e2007e4;
 Wed, 02 Oct 2019 17:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570035954;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=K+0umHwR3D9c/NmdH4VyiiVwrcCxMwHaL/ft2w21YVo=;
 b=Atzf1kiX1k4EtX7Qpay04N+YQ2GKSS+0eN/R/dtwnv1P0Gv6FG+ZP6gEtWh0ThtXzc
 6p4mUdghq/jRrsBLG4/j9rE0EPQVWfjRJdOS8m3P0R0oEqI/N2AwWnarW39zygRounvm
 ItgdM18UtYSWWSYILA/m2/ipwtseF7jHBP9rsS9yrw+BjBsxRotBdqNhrRR1ruhRZZvb
 XzRUn/mEQ9rTpgJ9hTp5RT03Kz+I/xfXVv3Qw3VSbFlD4HL0haZFDJjkcCQhrh4VpLbz
 cZIQRBFGUrh6sXPytCilfO/AWTq8eP+3oivS65AQLW4jE5Cqq4Yd3E+IlKXEC3Hbkon/
 pO2w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2Gkg"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v92H5nUVk
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Oct 2019 19:05:49 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:05:43 +0200
Message-Id: <20191002170543.26571-9-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191002170543.26571-1-olaf@aepfle.de>
References: <20191002170543.26571-1-olaf@aepfle.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 8/8] docs: remove stale create example from
 xl.1
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
Cc: Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWF5YmUgeG0gY3JlYXRlIGhhZCBhIGZlYXR1cmUgdG8gY3JlYXRlIGEgZG9tVSBiYXNlZCBvbiBh
IGNvbmZpZ3VyYXRpb24KZmlsZS4geGwgY3JlYXRlIHJlcXVpcmVzIHRoZSAnLWYnIG9wdGlvbiB0
byByZWZlciB0byBhIGZpbGUuClRoZXJlIGlzIG5vIGNvZGUgdG8gbG9vayBpbnRvIFhFTl9DT05G
SUdfRElSLCBzbyByZW1vdmUgdGhlIGV4YW1wbGUuCgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmlu
ZyA8b2xhZkBhZXBmbGUuZGU+Ci0tLQogZG9jcy9tYW4veGwuMS5wb2QuaW4gfCA3IC0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hs
LjEucG9kLmluIGIvZG9jcy9tYW4veGwuMS5wb2QuaW4KaW5kZXggZmIxNzE1MzYzNS4uYWE5MmRh
MmQyNyAxMDA2NDQKLS0tIGEvZG9jcy9tYW4veGwuMS5wb2QuaW4KKysrIGIvZG9jcy9tYW4veGwu
MS5wb2QuaW4KQEAgLTE3MSwxMyArMTcxLDYgQEAgQjxFWEFNUExFUz4KIAogPW92ZXIgNAogCi09
aXRlbSBJPHdpdGggY29uZmlnIGZpbGU+Ci0KLSAgeGwgY3JlYXRlIERlYmlhbkxlbm55Ci0KLVRo
aXMgY3JlYXRlcyBhIGRvbWFpbiB3aXRoIHRoZSBmaWxlIC9ldGMveGVuL0RlYmlhbkxlbm55LCBh
bmQgcmV0dXJucyBhcwotc29vbiBhcyBpdCBpcyBydW4uCi0KID1pdGVtIEk8d2l0aCBleHRyYSBw
YXJhbWV0ZXJzPgogCiAgIHhsIGNyZWF0ZSBodm0uY2ZnICdjcHVzPSIwLTMiOyBwY2k9WyIwMTow
NS4xIiwiMDE6MDUuMiJdJwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
