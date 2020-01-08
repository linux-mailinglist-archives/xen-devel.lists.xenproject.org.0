Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F8C1348BE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:00:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEe9-0006nE-1M; Wed, 08 Jan 2020 16:57:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipEe8-0006n9-7D
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 16:57:28 +0000
X-Inumbo-ID: ee64f660-3237-11ea-a38f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee64f660-3237-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 16:57:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E41A5AD37;
 Wed,  8 Jan 2020 16:57:18 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 17:57:16 +0100
Message-Id: <20200108165716.9677-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] MAINTAINERS: fix malformed entry
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

TUFJTlRBSU5FUlMgZW50cmllcyB0YWdnZWQgd2l0aCAiTDoiIHNob3VsZCBoYXZlIGEgcHVyZSBt
YWlsIGFkZHJlc3MKYXMgdGhlIHNlY29uZCB3b3JkLiBGaXggYSBtYWxmb3JtZWQgZW50cnkuIE90
aGVyd2lzZSBhZGRfbWFpbnRhaW5lcnMucGwKd2lsbCBwcm9kdWNlIGFuIGVtcHR5ICJDYzoiIGxp
bmUuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQog
TUFJTlRBSU5FUlMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGVh
ZWE0NjIwZTIuLmE0MmZlZjZhYjkgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5U
QUlORVJTCkBAIC0xNzMsNyArMTczLDcgQEAgQVJJTkM2NTMgU0NIRURVTEVSCiBNOglKb3NoIFdo
aXRlaGVhZCA8am9zaC53aGl0ZWhlYWRAZG9ybmVyd29ya3MuY29tPgogTToJU3Rld2FydCBIaWxk
ZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29ya3MuY29tPgogUzoJU3VwcG9ydGVk
Ci1MOglEb3JuZXJXb3JrcyBYZW4tRGV2ZWwgPHhlbi1kZXZlbEBkb3JuZXJ3b3Jrcy5jb20+CitM
Ogl4ZW4tZGV2ZWxAZG9ybmVyd29ya3MuY29tCiBGOgl4ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUz
LmMKIEY6CXRvb2xzL2xpYnhjL3hjX2FyaW5jNjUzLmMKIAotLSAKMi4xNi40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
