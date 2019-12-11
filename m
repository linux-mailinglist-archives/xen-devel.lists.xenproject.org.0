Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B5C11A631
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 09:48:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iexd5-00028W-Pk; Wed, 11 Dec 2019 08:45:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K8rm=2B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iexd3-00028O-Nm
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 08:45:53 +0000
X-Inumbo-ID: a34be374-1bf2-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a34be374-1bf2-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 08:45:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB636AB98;
 Wed, 11 Dec 2019 08:45:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Dec 2019 09:45:49 +0100
Message-Id: <20191211084549.10421-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH-for-4.13] SUPPORT.md: add core scheduling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGNvcmUgc2NoZWR1bGluZyBmZWF0dXJlIHRvIFNVUFBPUlQubWQuCgpTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogU1VQUE9SVC5tZCB8IDggKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9TVVBQ
T1JULm1kIGIvU1VQUE9SVC5tZAppbmRleCAxY2FkN2Q2MTY0Li4xNjliNmY4ZmNmIDEwMDY0NAot
LS0gYS9TVVBQT1JULm1kCisrKyBiL1NVUFBPUlQubWQKQEAgLTI1NSw2ICsyNTUsMTQgQEAgb2Yg
dXNpbmcgZGlmZmVyZW50IHNjaGVkdWxlcnMgYW5kIHNjaGVkdWxpbmcgcHJvcGVydGllcy4KIAog
ICAgIFN0YXR1czogU3VwcG9ydGVkCiAKKyMjIyBDb3JlIFNjaGVkdWxpbmcKKworQWxsb3dzIHRv
IGdyb3VwIHZpcnR1YWwgY3B1cyBpbnRvIHZpcnR1YWwgY29yZXMgd2hpY2ggYXJlIHNjaGVkdWxl
ZCBvbiB0aGUKK3BoeXNpY2FsIGNvcmVzLiBUaGlzIHJlc3VsdHMgaW4gbmV2ZXIgcnVubmluZyBk
aWZmZXJlbnQgZ3Vlc3RzIGF0IHRoZSBzYW1lCit0aW1lIG9uIHRoZSBzYW1lIHBoeXNpY2FsIGNv
cmUuCisKKyAgICBTdGF0dXMsIHg4NjogRXhwZXJpbWVudGFsCisKICMjIyBDcmVkaXQgU2NoZWR1
bGVyCiAKIEEgd2VpZ2h0ZWQgcHJvcG9ydGlvbmFsIGZhaXIgc2hhcmUgdmlydHVhbCBDUFUgc2No
ZWR1bGVyLgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
