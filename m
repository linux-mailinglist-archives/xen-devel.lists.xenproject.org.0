Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22B9108BF
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 16:05:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLppu-00014b-0i; Wed, 01 May 2019 14:03:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLpps-00014W-Gc
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 14:03:48 +0000
X-Inumbo-ID: ee9e75be-6c19-11e9-8910-3b44ea63ae4d
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee9e75be-6c19-11e9-8910-3b44ea63ae4d;
 Wed, 01 May 2019 14:03:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84851029"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 15:02:57 +0100
Message-ID: <20190501140257.27564-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH STABLE BACKPORT for-4.7] Fix misleading
 indentation warnings
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
Cc: =?UTF-8?q?C=C3=A9dric=20Bosdonnat?= <cbosdonnat@suse.com>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQ8OpZHJpYyBCb3Nkb25uYXQgPGNib3Nkb25uYXRAc3VzZS5jb20+CgpHY2M2IGJ1aWxk
IHJlcG9ydHMgbWlzbGVhZGluZyBpbmRlbnRhdGlvbiBhcyB3YXJuaW5ncy4gRml4IGEgZmV3Cndh
cm5pbmdzIGluIHN0dWJkb20uCgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIEJvc2Rvbm5hdCA8Y2Jv
c2Rvbm5hdEBzdXNlLmNvbT4KQWNrZWQtYnk6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNo
by5uc2EuZ292PgpBY2tlZC1ieTogUXVhbiBYdSA8eHVxdWFuOEBodWF3ZWkuY29tPgpSZWxlYXNl
LWFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgooY2hlcnJ5IHBpY2tlZCBm
cm9tIGNvbW1pdCA5ZmRmZmJiYWIzYWRhNDI3YmFjMDcwNzZmMDQyZjAyNjVlNWFlMDVmKQotLS0K
IHN0dWJkb20vdnRwbW1nci9kaXNrX3JlYWQuYyB8IDggKysrKy0tLS0KIHN0dWJkb20vdnRwbW1n
ci9sb2cuYyAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3N0dWJkb20vdnRwbW1nci9kaXNrX3JlYWQuYyBi
L3N0dWJkb20vdnRwbW1nci9kaXNrX3JlYWQuYwppbmRleCA5NDRkM2ZmZGE2Li40OGNmYmZlNmQ1
IDEwMDY0NAotLS0gYS9zdHViZG9tL3Z0cG1tZ3IvZGlza19yZWFkLmMKKysrIGIvc3R1YmRvbS92
dHBtbWdyL2Rpc2tfcmVhZC5jCkBAIC0xMjMsMTAgKzEyMywxMCBAQCBzdGF0aWMgaW50IHBhcnNl
X3Jvb3Rfa2V5KHN0cnVjdCBtZW1fdHBtX21nciAqZHN0LCBzdHJ1Y3QgZGlza19zZWFsX2VudHJ5
ICpzcmMpCiAJc3RydWN0IGRpc2tfcm9vdF9zZWFsZWRfZGF0YSBzZWFsZWQ7CiAKICAgICAvKlRQ
TSAyLjAgdW5iaW5kIHwgVFBNIDEueCB1bnNlYWwqLwotICAgIGlmIChod19pc190cG0yKCkpCi0g
ICAgICAgIHJjID0gVFBNMl9kaXNrX3VuYmluZCgmc2VhbGVkLCAmb2xlbiwgc3JjKTsKLSAgICBl
bHNlCi0gICAgICAgIHJjID0gVFBNX2Rpc2tfdW5zZWFsKCZzZWFsZWQsIHNpemVvZihzZWFsZWQp
LCBzcmMpOworCWlmIChod19pc190cG0yKCkpCisJCXJjID0gVFBNMl9kaXNrX3VuYmluZCgmc2Vh
bGVkLCAmb2xlbiwgc3JjKTsKKwllbHNlCisJCXJjID0gVFBNX2Rpc2tfdW5zZWFsKCZzZWFsZWQs
IHNpemVvZihzZWFsZWQpLCBzcmMpOwogCiAJaWYgKHJjKQogCQlyZXR1cm4gcmM7CmRpZmYgLS1n
aXQgYS9zdHViZG9tL3Z0cG1tZ3IvbG9nLmMgYi9zdHViZG9tL3Z0cG1tZ3IvbG9nLmMKaW5kZXgg
YTgyYzkxMzljMy4uYzFiYzhmM2U0MiAxMDA2NDQKLS0tIGEvc3R1YmRvbS92dHBtbWdyL2xvZy5j
CisrKyBiL3N0dWJkb20vdnRwbW1nci9sb2cuYwpAQCAtMTQ3LDUgKzE0Nyw1IEBAIGNvbnN0IGNo
YXIqIHRwbV9nZXRfZXJyb3JfbmFtZSAoVFBNX1JFU1VMVCBjb2RlKSB7CiAgICAgaWYgKGNvZGUg
PT0gZXJyb3JfbXNnc1tpXS5jb2RlKQogICAgICAgcmV0dXJuIGVycm9yX21zZ3NbaV0uY29kZV9u
YW1lOwogCi0gICAgcmV0dXJuKCJVbmtub3duIEVycm9yIENvZGUiKTsKKyAgcmV0dXJuKCJVbmtu
b3duIEVycm9yIENvZGUiKTsKIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
