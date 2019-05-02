Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9A112055
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 18:34:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMEbn-0007UK-RJ; Thu, 02 May 2019 16:30:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oY2n=TC=citrix.com=prvs=018b94f25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hMEbl-0007UF-W7
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 16:30:54 +0000
X-Inumbo-ID: a6bdda59-6cf7-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a6bdda59-6cf7-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 16:30:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,422,1549929600"; d="scan'208";a="84972743"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 2 May 2019 17:25:50 +0100
Message-ID: <20190502162550.21038-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/Makefile: Fix build of QEMU,
 remove --source-path
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9sbG93aW5nIFFFTVUncyBjb21taXQgNzlkNzdiY2QzNiAoY29uZmlndXJlOiBSZW1vdmUgLS1z
b3VyY2UtcGF0aApvcHRpb24pLCBYZW4ncyBidWlsZCBzeXN0ZW0gZmFpbHMgdG8gYnVpbGQgcWVt
dS14ZW4uIFRoZSAtLXNvdXJjZS1wYXRoCm9wdGlvbiBnaXZlcyByZWR1bmRhbnQgaW5mb3JtYXRp
b24gYWJvdXQgdGhlIGxvY2F0aW9uIG9mIHRoZSBzb3VyY2VzCnNvIHNpbXBseSByZW1vdmUgaXQu
IChjb25maWd1cmUgYWxyZWFkeSBsb29rcyBhdCBpdHMgJDAgdG8gZmluZCB0aGUKc291cmNlLXBh
dGguKQoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+Ci0tLQpUaGlzIHBhdGNoIHdvdWxkIHVuYmxvY2sgdGhlIHFlbXUtbWFpbmxpbmUgYnJh
bmNoIGluIG9zc3Rlc3QuCi0tLQogdG9vbHMvTWFrZWZpbGUgfCAxIC0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvTWFrZWZpbGUgYi90b29scy9NYWtl
ZmlsZQppbmRleCBjOTAzZDZhNjNlLi45OWNiYzk1MGRjIDEwMDY0NAotLS0gYS90b29scy9NYWtl
ZmlsZQorKysgYi90b29scy9NYWtlZmlsZQpAQCAtMjQ2LDcgKzI0Niw2IEBAIHN1YmRpci1hbGwt
cWVtdS14ZW4tZGlyOiBxZW11LXhlbi1kaXItZmluZAogCQktLXByZWZpeD0kKExJQkVYRUMpIFwK
IAkJLS1saWJkaXI9JChMSUJFWEVDX0xJQikgXAogCQktLWluY2x1ZGVkaXI9JChMSUJFWEVDX0lO
QykgXAotCQktLXNvdXJjZS1wYXRoPSQkc291cmNlIFwKIAkJLS1leHRyYS1jZmxhZ3M9Ii1EWENf
V0FOVF9DT01QQVRfRVZUQ0hOX0FQST0xIFwKIAkJLURYQ19XQU5UX0NPTVBBVF9HTlRUQUJfQVBJ
PTEgXAogCQktRFhDX1dBTlRfQ09NUEFUX01BUF9GT1JFSUdOX0FQST0xIFwKLS0gCkFudGhvbnkg
UEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
