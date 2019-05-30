Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366F330299
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 21:09:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWQM1-0001uS-Uu; Thu, 30 May 2019 19:04:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yI+1=T6=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1hWQM0-0001uN-Sp
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 19:04:44 +0000
X-Inumbo-ID: c852a1fc-830d-11e9-8980-bc764e045a96
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c852a1fc-830d-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 19:04:43 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hWQLu-0004Od-Lv; Thu, 30 May 2019 19:04:38 +0000
From: Colin King <colin.king@canonical.com>
To: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>,
 "David S . Miller" <davem@davemloft.net>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org
Date: Thu, 30 May 2019 20:04:38 +0100
Message-Id: <20190530190438.9571-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen-netback: remove redundant assignment to err
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSB2YXJp
YWJsZSBlcnIgaXMgYXNzaWduZWQgd2l0aCB0aGUgdmFsdWUgLUVOT01FTSB0aGF0IGlzIG5ldmVy
CnJlYWQgYW5kIGl0IGlzIHJlLWFzc2lnbmVkIGEgbmV3IHZhbHVlIGxhdGVyIG9uLiAgVGhlIGFz
c2lnbm1lbnQgaXMKcmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4KCkFkZHJlc3Nlcy1Db3Zl
cml0eTogKCJVbnVzZWQgdmFsdWUiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29s
aW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVy
ZmFjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMgYi9k
cml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwppbmRleCA3ODMxOTg4NDRkZDcuLjI0
MGY3NjJiMzc0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNl
LmMKKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKQEAgLTYzMyw3ICs2
MzMsNyBAQCBpbnQgeGVudmlmX2Nvbm5lY3RfZGF0YShzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1
ZSwKIAkJCXVuc2lnbmVkIGludCByeF9ldnRjaG4pCiB7CiAJc3RydWN0IHRhc2tfc3RydWN0ICp0
YXNrOwotCWludCBlcnIgPSAtRU5PTUVNOworCWludCBlcnI7CiAKIAlCVUdfT04ocXVldWUtPnR4
X2lycSk7CiAJQlVHX09OKHF1ZXVlLT50YXNrKTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
