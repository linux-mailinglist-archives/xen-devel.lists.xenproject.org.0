Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D0CC8F67
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:08:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFi4z-0006l2-NH; Wed, 02 Oct 2019 17:06:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0qpV=X3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iFi4y-0006kA-0J
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:06:20 +0000
X-Inumbo-ID: e50732e8-e536-11e9-8628-bc764e2007e4
Received: from mo6-p02-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5302::2])
 by localhost (Halon) with ESMTPS
 id e50732e8-e536-11e9-8628-bc764e2007e4;
 Wed, 02 Oct 2019 17:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570035954;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=wJEcYSFxaUYDN/2aym6GXu8L8F3iC/exumk52VK89IQ=;
 b=lk0zIL2Q0LvEo5nVi3Qa9dwORhxkJ2l9R4jvJ64U9K+VYzNjc1EZtAVk+RS5UAJ6ni
 zONZYJeCrZEMmVEtOFMmOVmZGwZY2vUKw0xYjkDYadknfHugKveXorib0Tb+NC3ZrCXl
 J7vHEzl9Lgw8bewdcoSreXQStPOBu2xxlEzrtiRslx81Ol09QJQYkDmJDbQqv+XfPqVy
 8ybXR+keue1nADXD+N4cR3IxD82lui5I8+ebnfR+MsYamFhOvL1EYjux/1lYNYjNZCXi
 qKo+oPAcz0xFj2vwwABBBPhiS95vdrSq9eo/r7VYy1C9M60CfvEZfSX1IPjjMoK/t3y7
 Js1Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2Gkg"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v92H5nUVj
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Oct 2019 19:05:49 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:05:42 +0200
Message-Id: <20191002170543.26571-8-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191002170543.26571-1-olaf@aepfle.de>
References: <20191002170543.26571-1-olaf@aepfle.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 7/8] docs: substitute XEN_CONFIG_DIR in
 xl.conf.5
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
