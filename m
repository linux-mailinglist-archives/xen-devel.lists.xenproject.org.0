Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879228F7A8
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 01:38:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyPIA-0004Yd-N8; Thu, 15 Aug 2019 23:36:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HmHk=WL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hyPI8-0004Wn-L6
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 23:36:24 +0000
X-Inumbo-ID: 7e2dfbfc-bfb5-11e9-a661-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e2dfbfc-bfb5-11e9-a661-bc764e2007e4;
 Thu, 15 Aug 2019 23:36:24 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 587EF2171F;
 Thu, 15 Aug 2019 23:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565912183;
 bh=0uqIw7fi9ShLv/DkZ30VYPsmelaDyUQss+KOJVtuL50=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HKiB2E6oJWOagzttb97ezGU1FithE4jz1g3eJiJoHQh+pY8FtFHczy1oeCKARSDBH
 puM23kbxYdN62Im//3oDksHSCWOKERAi6vLTIucWPZJpV4B+Inq7fdjUaDy8reVni+
 M8mFWTkOFH4GWjR/0euWrVS5oneN7a+jxZYUKCC0=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2019 16:36:14 -0700
Message-Id: <20190815233618.31630-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v6 4/8] xen/arm: fix indentation in
 early_print_info
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vc0B4aWxpbnguY29tPgotLS0KIHhlbi9hcmNoL2FybS9ib290ZmR0LmMgfCAxNSAr
KysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2Fy
bS9ib290ZmR0LmMKaW5kZXggZjIzZWJhYTE4OC4uYTcwYTczOWJiMCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL2Jvb3RmZHQuYworKysgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCkBAIC0zNTQs
MTUgKzM1NCwxNSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWFybHlfcHJpbnRfaW5mbyh2b2lkKQog
CiAgICAgZm9yICggaSA9IDA7IGkgPCBtaS0+bnJfYmFua3M7IGkrKyApCiAgICAgICAgIHByaW50
aygiUkFNOiAlIlBSSXBhZGRyIiAtICUiUFJJcGFkZHIiXG4iLAotICAgICAgICAgICAgICAgICAg
ICAgbWktPmJhbmtbaV0uc3RhcnQsCi0gICAgICAgICAgICAgICAgICAgICBtaS0+YmFua1tpXS5z
dGFydCArIG1pLT5iYW5rW2ldLnNpemUgLSAxKTsKKyAgICAgICAgICAgICAgICBtaS0+YmFua1tp
XS5zdGFydCwKKyAgICAgICAgICAgICAgICBtaS0+YmFua1tpXS5zdGFydCArIG1pLT5iYW5rW2ld
LnNpemUgLSAxKTsKICAgICBwcmludGsoIlxuIik7CiAgICAgZm9yICggaSA9IDAgOyBpIDwgbW9k
cy0+bnJfbW9kczsgaSsrICkKICAgICAgICAgcHJpbnRrKCJNT0RVTEVbJWRdOiAlIlBSSXBhZGRy
IiAtICUiUFJJcGFkZHIiICUtMTJzXG4iLAotICAgICAgICAgICAgICAgICAgICAgaSwKLSAgICAg
ICAgICAgICAgICAgICAgIG1vZHMtPm1vZHVsZVtpXS5zdGFydCwKLSAgICAgICAgICAgICAgICAg
ICAgIG1vZHMtPm1vZHVsZVtpXS5zdGFydCArIG1vZHMtPm1vZHVsZVtpXS5zaXplLAotICAgICAg
ICAgICAgICAgICAgICAgYm9vdF9tb2R1bGVfa2luZF9hc19zdHJpbmcobW9kcy0+bW9kdWxlW2ld
LmtpbmQpKTsKKyAgICAgICAgICAgICAgICBpLAorICAgICAgICAgICAgICAgIG1vZHMtPm1vZHVs
ZVtpXS5zdGFydCwKKyAgICAgICAgICAgICAgICBtb2RzLT5tb2R1bGVbaV0uc3RhcnQgKyBtb2Rz
LT5tb2R1bGVbaV0uc2l6ZSwKKyAgICAgICAgICAgICAgICBib290X21vZHVsZV9raW5kX2FzX3N0
cmluZyhtb2RzLT5tb2R1bGVbaV0ua2luZCkpOwogCiAgICAgbnJfcnN2ZCA9IGZkdF9udW1fbWVt
X3JzdihkZXZpY2VfdHJlZV9mbGF0dGVuZWQpOwogICAgIGZvciAoIGkgPSAwOyBpIDwgbnJfcnN2
ZDsgaSsrICkKQEAgLTM3Miw4ICszNzIsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWFybHlfcHJp
bnRfaW5mbyh2b2lkKQogICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgIC8qIGZkdF9nZXRf
bWVtX3JzdiByZXR1cm5zIGxlbmd0aCAqLwogICAgICAgICBlICs9IHM7Ci0gICAgICAgIHByaW50
aygiIFJFU1ZEWyVkXTogJSJQUklwYWRkciIgLSAlIlBSSXBhZGRyIlxuIiwKLSAgICAgICAgICAg
ICAgICAgICAgIGksIHMsIGUpOworICAgICAgICBwcmludGsoIiBSRVNWRFslZF06ICUiUFJJcGFk
ZHIiIC0gJSJQUklwYWRkciJcbiIsIGksIHMsIGUpOwogICAgIH0KICAgICBwcmludGsoIlxuIik7
CiAgICAgZm9yICggaSA9IDAgOyBpIDwgY21kcy0+bnJfbW9kczsgaSsrICkKLS0gCjIuMTcuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
