Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21C9F73C3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 13:23:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU8g8-0007aM-Tt; Mon, 11 Nov 2019 12:20:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iI+y=ZD=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1iU8g7-0007aH-Az
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 12:20:19 +0000
X-Inumbo-ID: 9f9f21d2-047d-11ea-a20c-12813bfff9fa
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f9f21d2-047d-11ea-a20c-12813bfff9fa;
 Mon, 11 Nov 2019 12:20:18 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iU8fx-0008Et-PF; Mon, 11 Nov 2019 12:20:09 +0000
From: Colin King <colin.king@canonical.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 11 Nov 2019 12:20:09 +0000
Message-Id: <20191111122009.67789-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH][next] xen/gntdev: remove redundant non-zero
 check on ret
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBub24t
emVybyBjaGVjayBvbiByZXQgaXMgYWx3YXlzIGdvaW5nIHRvIGJlIGZhbHNlIGJlY2F1c2UKcmV0
IHdhcyBpbml0aWFsaXplZCBhcyB6ZXJvIGFuZCB0aGUgb25seSBwbGFjZSBpdCBpcyBzZXQgdG8K
bm9uLXplcm8gY29udGFpbnMgYSByZXR1cm4gcGF0aCBiZWZvcmUgdGhlIG5vbi16ZXJvIGNoZWNr
LiBIZW5jZQp0aGUgY2hlY2sgaXMgcmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4KCkFkZHJl
c3Nlcy1Db3Zlcml0eTogKCJMb2dpY2FsbHkgZGVhZCBjb2RlIikKU2lnbmVkLW9mZi1ieTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9n
bnRkZXYuYyB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMveGVuL2dudGRldi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKaW5kZXgg
MTBjYzVlOWU2MTJhLi4wN2Q4MGIxNzYxMTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2dudGRl
di5jCisrKyBiL2RyaXZlcnMveGVuL2dudGRldi5jCkBAIC01MjQsMTEgKzUyNCw2IEBAIHN0YXRp
YyBpbnQgZ250ZGV2X29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZsaXAp
CiAJfQogI2VuZGlmCiAKLQlpZiAocmV0KSB7Ci0JCWtmcmVlKHByaXYpOwotCQlyZXR1cm4gcmV0
OwotCX0KLQogCWZsaXAtPnByaXZhdGVfZGF0YSA9IHByaXY7CiAjaWZkZWYgQ09ORklHX1hFTl9H
UkFOVF9ETUFfQUxMT0MKIAlwcml2LT5kbWFfZGV2ID0gZ250ZGV2X21pc2NkZXYudGhpc19kZXZp
Y2U7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
