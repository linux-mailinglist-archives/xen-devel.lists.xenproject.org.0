Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175532045D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:16:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRELG-0000G0-Ji; Thu, 16 May 2019 11:14:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BGuO=TQ=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRELE-0000Fq-NG
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:14:28 +0000
X-Inumbo-ID: c4537352-77cb-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c4537352-77cb-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:14:27 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w1so2761504ljw.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 04:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mrM64QavtG0E6aPUOqGHW/JfhU5OFNkQecULLeg6t6A=;
 b=a6G264RmUdFcmcx6+C4XEIydvKUTgnbdNNZIxZ2VEiMw6w43+ss3wZT3HqN+/92CyE
 RM2PkoPMd4+l525PINm9m+Y/vlgh6l8aOLdNeWgtnLX1JkfJ9/rOD04IJXhB0M1ve1EC
 q3iFuWysqxQCR4FAoHQkUBOJxlS7QQSPzYA7vK7xEPOOmrfcL1irgrqQEKUV1tNei5Gu
 +oWB8ftrSIOtW28ran18rNh6aDutfDsb96zj8uDgKDwBKZcrDGIkRYSk/69lfOhHeUZz
 KcqUlkeDf4TpAFUvg2qBbT8QKXmL6T93r1paEF3kG0bSRcvHYqXGK5kss5Lcv8JDcIxP
 /vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mrM64QavtG0E6aPUOqGHW/JfhU5OFNkQecULLeg6t6A=;
 b=OI1sCW2KvvcUItgfsbjhZt9QEgTnEIJGPfmdK+6SSUHxGpL+NznyZBdTWhpKJIWr5H
 QLIoI2u+zRIERQM2pQyBaSFYCOvg7VNStN34bTycRiUBxqJ8D8FiMOij8VTPIz1Trk1o
 p4CqCEPrzhXNVr3k2+qZ4hSIJP3oZAWZC1ytP6zALumdVQfc5THB64byXZhH/+pjxNIg
 CIbdoDxbIUrG5JH7n7PLkH+PPtTzPPfH7WQvn81eaz1UvJ4oqF/lk+whrvnWmSQu0I3X
 qUNiU2IrWYlYXJr1MXnjAqiYSim2kO+fEmL1oWMoJzfA5kF4331xuQUtkaSfY2NKQ9pR
 54+A==
X-Gm-Message-State: APjAAAVNID4tWtPJSHbjxI1eU2kgBduvwG8Unm4m79IhXs4YKVWTEVVJ
 7hVfXC/Tu8x7FeFa/Vh2QguKpDAbN5M=
X-Google-Smtp-Source: APXvYqylQqn0WPgfL9mqZ2udu5sFrrSTQMwbZKf3bYgpra19UnI+Nh39yG8mi9hZ2+2+bCPeM/Xwdw==
X-Received: by 2002:a2e:7f13:: with SMTP id a19mr23666364ljd.35.1558005265949; 
 Thu, 16 May 2019 04:14:25 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id 10sm826369ljv.47.2019.05.16.04.14.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 04:14:25 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 16 May 2019 14:13:54 +0300
Message-Id: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] coverage: GCC coverage libfdt Makefile fix
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBhdGNoIHJlc29sdmVzICd4ZW5jb3YnIGNyYXNoZXMgaW4gY2FzZSBvZiBBYXJjaDY0LgoK
QWxsIHRoZSAuaW5pdC4qIHNlY3Rpb25zIGFyZSBzdHJpcHBlZCBhZnRlciBib290LAppdCBtZWFu
cyB0aGF0IGFueXRoaW5nIGluIC5pbml0LmRhdGEgY2Fubm90IGJlIGFjY2Vzc2VkIGFueW1vcmUu
ClRoZSBidWlsZCBzeXN0ZW0gZXhwbGljaXRseSBjb21waWxlcyBhbnkgLmluaXQgYmluYXJ5IHdp
dGhvdXQgZ2NvdiBvcHRpb24uClRoZSBwcm9ibGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdC4KVGhl
IGVudGlyZSBsaWJyYXJ5IGlzIG1vdmVkIHRvIC5pbml0IHVzaW5nOgokKE9CSkNPUFkpICQoZm9y
ZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1lLXNlY3Rpb24gLiQocyk9LmluaXQuJChzKSkgJDwg
JEAKU28gd2UgbmVlZCB0byB0ZWxsIHRoZSB0b3AgTWFrZWZpbGUgdG8gZmlsdGVyIG91dCBsaWJm
ZHQuCgpSZXBvcnRlZC1ieTogVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpUZXN0
ZWQtYnk6IFZpa3RvciBNaXRpbiA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4KLS0tCiB4ZW4v
Y29tbW9uL2xpYmZkdC9NYWtlZmlsZSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUgYi94ZW4vY29tbW9u
L2xpYmZkdC9NYWtlZmlsZQppbmRleCBkODFmNTRiNmI4Li5jMDc1YmJmNTQ2IDEwMDY0NAotLS0g
YS94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZQorKysgYi94ZW4vY29tbW9uL2xpYmZkdC9NYWtl
ZmlsZQpAQCAtMyw2ICszLDcgQEAgaW5jbHVkZSBNYWtlZmlsZS5saWJmZHQKIFNFQ1RJT05TIDo9
IHRleHQgZGF0YSAkKFNQRUNJQUxfREFUQV9TRUNUSU9OUykKIAogb2JqLXkgKz0gbGliZmR0Lm8K
K25vY292LXkgKz0gbGliZmR0Lm8KIAogQ0ZMQUdTICs9IC1JJChCQVNFRElSKS9pbmNsdWRlL3hl
bi9saWJmZHQvCiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
