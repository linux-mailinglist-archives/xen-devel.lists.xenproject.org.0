Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB89C8F66
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:08:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFi4W-0006Xw-Ge; Wed, 02 Oct 2019 17:05:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0qpV=X3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iFi4U-0006Xr-3f
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:05:50 +0000
X-Inumbo-ID: e0bac56a-e536-11e9-97fb-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::5])
 by localhost (Halon) with ESMTPS
 id e0bac56a-e536-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570035947;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=IUXC4I+JXC+DHEkub8mYWOX6hI/P/lD4+i+wDdaNKk0=;
 b=THASjDLDiFxUtNwh/XGz7z49hDT6yn5pp2Ma0nYw1wBygM2wahRJEeuXfDncBnNQox
 vibuqXWV3YKCTMVCYbUrOV6MjzPuf4ZZnrNHHd1fku1oUdvrdeHltksnbkOnziScvgDj
 fLhbNUq7AiSk3glGmmtvz9wnyK1mHO+pM7sUXspqcbQjHdcJ7IUw4DoeMD9AuZeD1+Tb
 S9kQcCOQLvM/fC9PU6P4a3d2PrpYgJgd0w31qgr2jK1JhwcfxzWJFiRGe2etOK4mHSjl
 7/ZBOtsnCNO5H/Cn6Fc2xkc3L/Q1x5/YXHiJReXC554yZuFhF1Fmn1GNTdJywBjVwAPm
 MNGw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2Gkg"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v92H5kUVb
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Oct 2019 19:05:46 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:05:35 +0200
Message-Id: <20191002170543.26571-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/8] tools, doc and stubdom fixes
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
Cc: Olaf Hering <olaf@aepfle.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9sYWYgSGVyaW5nICg4KToKICBzdHViZG9tL3Z0cG06IGluY2x1ZGUgc3RkaW8uaCBmb3IgZGVj
bGFyYXRpb24gb2YgcHJpbnRmCiAgdG9vbHM6IGFkZCB3aXRoLXhlbi1zY3JpcHRkaXIgY29uZmln
dXJlIG9wdGlvbgogIFVzZSBYRU5fU0NSSVBUX0RJUiB0byByZWZlciB0byAvZXRjL3hlbi9zY3Jp
cHRzCiAgUmVtb3ZlIHRvb2xzL2V4YW1wbGVzL1JFQURNRS5pbmNvbXBhdGliaWxpdGllcwogIHRv
b2xzOiByZW1vdmUgZW1wdHkgeGwuY29uZgogIFJlbW92ZSB0b29scy9leGFtcGxlcy9jcHVwb29s
CiAgZG9jczogc3Vic3RpdHV0ZSBYRU5fQ09ORklHX0RJUiBpbiB4bC5jb25mLjUKICBkb2NzOiBy
ZW1vdmUgc3RhbGUgY3JlYXRlIGV4YW1wbGUgZnJvbSB4bC4xCgogLmdpdGlnbm9yZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKwogZG9jcy9jb25maWd1cmUu
YWMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKwogLi4ucmF0aW9uLjUu
cG9kID0+IHhsLWRpc2stY29uZmlndXJhdGlvbi41LnBvZC5pbn0gfCAgMiArLQogLi4uaW9uLjUu
cG9kID0+IHhsLW5ldHdvcmstY29uZmlndXJhdGlvbi41LnBvZC5pbn0gfCAgNCArLQogZG9jcy9t
YW4veGwuMS5wb2QuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMSArLS0tLS0K
IGRvY3MvbWFuL3t4bC5jb25mLjUucG9kID0+IHhsLmNvbmYuNS5wb2QuaW59ICAgICAgIHwgIDgg
KystLQogZG9jcy9taXNjL2Jsb2NrLXNjcmlwdHMudHh0ICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMiArLQogbTQvcGF0aHMubTQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgOCArKystCiBzdHViZG9tL3Z0cG0vdnRwbWJsay5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKIHRvb2xzL2V4YW1wbGVzL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDMgLS0KIHRvb2xzL2V4YW1wbGVzL1JFQURNRSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgLQogdG9vbHMvZXhhbXBsZXMvUkVBRE1FLmluY29tcGF0aWJpbGl0
aWVzICAgICAgICAgICAgfCAzOCAtLS0tLS0tLS0tLS0tLS0tLS0tCiB0b29scy9leGFtcGxlcy9j
cHVwb29sICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE3IC0tLS0tLS0tLQogdG9vbHMv
ZXhhbXBsZXMveGwuY29uZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0NCAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiB0b29scy94bC94bF9jbWR0YWJsZS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCiAxNSBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAx
MjMgZGVsZXRpb25zKC0pCiByZW5hbWUgZG9jcy9tYW4ve3hsLWRpc2stY29uZmlndXJhdGlvbi41
LnBvZCA9PiB4bC1kaXNrLWNvbmZpZ3VyYXRpb24uNS5wb2QuaW59ICg5OSUpCiByZW5hbWUgZG9j
cy9tYW4ve3hsLW5ldHdvcmstY29uZmlndXJhdGlvbi41LnBvZCA9PiB4bC1uZXR3b3JrLWNvbmZp
Z3VyYXRpb24uNS5wb2QuaW59ICg5OCUpCiByZW5hbWUgZG9jcy9tYW4ve3hsLmNvbmYuNS5wb2Qg
PT4geGwuY29uZi41LnBvZC5pbn0gKDk2JSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9leGFt
cGxlcy9SRUFETUUuaW5jb21wYXRpYmlsaXRpZXMKIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9l
eGFtcGxlcy9jcHVwb29sCiBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvZXhhbXBsZXMveGwuY29u
ZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
