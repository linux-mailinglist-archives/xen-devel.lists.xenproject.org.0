Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E75BC9C3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:06:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClPw-0004gU-2A; Tue, 24 Sep 2019 14:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IFUW=XT=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iClPt-0004g9-V6
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:03:45 +0000
X-Inumbo-ID: 1bc53e10-ded4-11e9-97fb-bc764e2007e4
Received: from mo6-p02-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5302::3])
 by localhost (Halon) with ESMTPS
 id 1bc53e10-ded4-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 14:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569333819;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=wJEcYSFxaUYDN/2aym6GXu8L8F3iC/exumk52VK89IQ=;
 b=HH+n0EHYV1aO5xx2vfQtvqH2X13cnd4gplEaLCMxZDHXYIf3i1tNBI+Huhq3CLUbDu
 Mdl30ulGZ89j+TzLwaNOzzkSjbCJT1sVDsFS33VV/IwPRaDR8sBiWYFMYs7mdRpFy4L2
 NWbzHLxlCm1ApAW8MXfSB5m2KYFiMwi5+qDz34kR+B0UB0S4+i5b52wDqxFNp8cVu5EU
 dujNZ2XrCdmyFsHYnyV9i1RGsBL1XdgJasqEpm+42qXPoOHX4awdEYH9cIKYPkcixfBv
 66vD395vZnECbj6JPodc4iOZGOOr+whoIprCgMgC43GY/xUHk8S8DL6eyYIV81bM1sJ5
 6bjQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3KJf+j/F"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v8OE3Z1mn
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 24 Sep 2019 16:03:35 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 16:03:18 +0200
Message-Id: <20190924140319.11303-8-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190924140319.11303-1-olaf@aepfle.de>
References: <20190924140319.11303-1-olaf@aepfle.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH RESEND v1 7/8] docs: substitute XEN_CONFIG_DIR
 in xl.conf.5
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

eGwoMSkgb3BlbnMgeGwuY29uZiBpbiBYRU5fQ09ORklHX0RJUi4KU3Vic3RpdHV0ZSB0aGlzIHZh
cmlhYmxlIGFsc28gaW4gdGhlIG1hbiBwYWdlLgoKU2lnbmVkLW9mZi1ieTogT2xhZiBIZXJpbmcg
PG9sYWZAYWVwZmxlLmRlPgpSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Ci0tLQogZG9jcy9tYW4veGwuMS5wb2QuaW4gICAgICB8IDIgKy0KIGRv
Y3MvbWFuL3hsLmNvbmYuNS5wb2QuaW4gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL21hbi94bC4xLnBvZC5p
biBiL2RvY3MvbWFuL3hsLjEucG9kLmluCmluZGV4IDNkNjRlYWE1YjIuLmZiMTcxNTM2MzUgMTAw
NjQ0Ci0tLSBhL2RvY3MvbWFuL3hsLjEucG9kLmluCisrKyBiL2RvY3MvbWFuL3hsLjEucG9kLmlu
CkBAIC01MCw3ICs1MCw3IEBAIHNldHVwIHRoZSBicmlkZ2UuCiAKIElmIHlvdSBzcGVjaWZ5IHRo
ZSBhbW91bnQgb2YgbWVtb3J5IGRvbTAgaGFzLCBwYXNzaW5nIEI8ZG9tMF9tZW0+IHRvCiBYZW4s
IGl0IGlzIGhpZ2hseSByZWNvbW1lbmRlZCB0byBkaXNhYmxlIEI8YXV0b2JhbGxvb24+LiBFZGl0
Ci1CPC9ldGMveGVuL3hsLmNvbmY+IGFuZCBzZXQgaXQgdG8gMC4KK0I8QFhFTl9DT05GSUdfRElS
QC94bC5jb25mPiBhbmQgc2V0IGl0IHRvIDAuCiAKID1pdGVtIHJ1biB4bCBhcyBCPHJvb3Q+CiAK
ZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLmNvbmYuNS5wb2QuaW4gYi9kb2NzL21hbi94bC5jb25m
LjUucG9kLmluCmluZGV4IDJiZWIyMTE5YTguLjdiMTMxNTk0NzYgMTAwNjQ0Ci0tLSBhL2RvY3Mv
bWFuL3hsLmNvbmYuNS5wb2QuaW4KKysrIGIvZG9jcy9tYW4veGwuY29uZi41LnBvZC5pbgpAQCAt
MSw2ICsxLDYgQEAKID1oZWFkMSBOQU1FCiAKLS9ldGMveGVuL3hsLmNvbmYgLSBYTCBHbG9iYWwv
SG9zdCBDb25maWd1cmF0aW9uIAorQFhFTl9DT05GSUdfRElSQC94bC5jb25mIC0gWEwgR2xvYmFs
L0hvc3QgQ29uZmlndXJhdGlvbgogCiA9aGVhZDEgREVTQ1JJUFRJT04KIAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
