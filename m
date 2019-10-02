Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BCDC8F7A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:11:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFi7h-0007MA-Ii; Wed, 02 Oct 2019 17:09:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0qpV=X3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iFi7e-0007Lx-Qm
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:09:07 +0000
X-Inumbo-ID: 567b3ad2-e537-11e9-b588-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::1])
 by localhost (Halon) with ESMTPS
 id 567b3ad2-e537-11e9-b588-bc764e2007e4;
 Wed, 02 Oct 2019 17:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570036144;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=GbzhYxVr4PKOxK24SXzYvDJKwRH20NVwyGDYZAtBo0w=;
 b=ZNaEFnn9Bm/KS0S22PbQRXayVvHGrexIfODuXrjJzqK3UrMfnhSVF9+EPAoks7iZxo
 7uLpqoIwm8UU0CXpedykBVYx5CmoSR9VLaWwmbsgwdqGP4KGDmu6fHn97rO3WCp7whXy
 4UyR9D3UrzgpGPUuJOsA8m2JFo9YFFoYg5onichH/eMuluDGaJe2CDSK/T4B2sN9Q3cX
 MJVJzu+C15M5uPjYHJsjVXfjqTcPJ+LEZFKvdPSTKpoJETMQzo336UyX1rqVoIe+UQQG
 7q3uBIjdcTPKE+5g7nJwpNeVfHBVtgO6CpPKuOk8LtMUHvLSAoIeN4d6Cb6TfsGVOUKp
 UOqw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2Gkg"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v92H5kUVc
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Oct 2019 19:05:46 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:05:36 +0200
Message-Id: <20191002170543.26571-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191002170543.26571-1-olaf@aepfle.de>
References: <20191002170543.26571-1-olaf@aepfle.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/8] stubdom/vtpm: include stdio.h for
 declaration of printf
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Olaf Hering <olaf@aepfle.de>, Quan Xu <quan.xu0@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZ1bmN0aW9uIHJlYWRfdnRwbWJsayB1c2VzIHByaW50ZigzKSwgYnV0IHN0ZGlvLmggaXMg
bm90IGluY2x1ZGVkCmluIHRoaXMgZmlsZS4gVGhpcyByZXN1bHRzIGluIGEgd2FybmluZyBmcm9t
IGdjYy03OgoKdnRwbWJsay5jOiBJbiBmdW5jdGlvbiAncmVhZF92dHBtYmxrJzoKdnRwbWJsay5j
OjMyMjo3OiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAncHJpbnRm
JyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgICAgIHByaW50ZigiRXhwZWN0
ZWQ6ICIpOwp2dHBtYmxrLmM6MzIyOjc6IHdhcm5pbmc6IGluY29tcGF0aWJsZSBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBidWlsdC1pbiBmdW5jdGlvbiAncHJpbnRmJwp2dHBtYmxrLmM6MzIyOjc6
IG5vdGU6IGluY2x1ZGUgJzxzdGRpby5oPicgb3IgcHJvdmlkZSBhIGRlY2xhcmF0aW9uIG9mICdw
cmludGYnCgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+CmNrZWQt
Ynk6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PgotLS0KIHN0dWJkb20v
dnRwbS92dHBtYmxrLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL3N0dWJkb20vdnRwbS92dHBtYmxrLmMgYi9zdHViZG9tL3Z0cG0vdnRwbWJsay5j
CmluZGV4IGZlNTI5YWI1YWMuLjY4MWYwYzAxYjYgMTAwNjQ0Ci0tLSBhL3N0dWJkb20vdnRwbS92
dHBtYmxrLmMKKysrIGIvc3R1YmRvbS92dHBtL3Z0cG1ibGsuYwpAQCAtMjAsNiArMjAsNyBAQAog
I2luY2x1ZGUgPHVuaXN0ZC5oPgogI2luY2x1ZGUgPGVycm5vLmg+CiAjaW5jbHVkZSA8ZmNudGwu
aD4KKyNpbmNsdWRlIDxzdGRpby5oPgogCiAvKkVuY3J5cHRpb24ga2V5IGFuZCBibG9jayBzaXpl
cyAqLwogI2RlZmluZSBCTEtTWiAxNgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
