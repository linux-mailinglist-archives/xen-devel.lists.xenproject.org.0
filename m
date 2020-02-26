Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFCA170410
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:15:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6zJl-0007gp-6C; Wed, 26 Feb 2020 16:13:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zHJv=4O=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1j6zJj-0007gh-GV
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 16:13:48 +0000
X-Inumbo-ID: f6ee7c2e-58b2-11ea-aba8-bc764e2007e4
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6ee7c2e-58b2-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582733625;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=q0Ih2C2sVJuZoTdwzWs4JECiqZuu+Qy/n22yYEHo4qE=;
 b=pDkcF8Fze7zKuUoUn/SNBnHAoAQ2DSP8vP+QOi034G9LMssOC1oJ1qUZY8PItIMzhY
 UwEHGEkQTXabEKhwGDhkThO3BK8yt5sx5SyG+fkEVKaU/FpQH6LjaTT+0AQkqQSL4YPk
 rdaHCDfqaI02D3uxAclYGRqQ4p2ZFyUYGkZAtDv3x77Wo9VdYlqbYGb1HpKxhSUZD7EX
 gAbZ1K8F8N+8LQEp5AseHdO/INfW4QvpCD4iJCX/cxqW7nIjOBvE0bPGm7WwN8IwRLlx
 b5ANKt5YMsWde7cd6qNjWJ0mn5ylKY3ObNJz/kQuG39ucUcoLqBHBmR6x7ZL+2FA4TSQ
 xaKw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznLRsvz6zGrN/JP2665"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.12 AUTH)
 with ESMTPSA id 605caew1QGDiinh
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Feb 2020 17:13:44 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 26 Feb 2020 17:13:39 +0100
Message-Id: <20200226161339.634-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] domctl: fix typo in comment
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

QWRkIG1pc3NpbmcgJ2EnIHRvIHNoYXJpbmcuCgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8
b2xhZkBhZXBmbGUuZGU+Ci0tLQogeGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0
bC5oCmluZGV4IGZlYzZmNmZkZDEuLjFhZDM0YzM1ZWIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9kb21jdGwuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKQEAgLTg0
MSw3ICs4NDEsNyBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9nZGJzeF9kb21zdGF0dXMgewogICogaW4g
dGhlIHVuc2hhcmUgcGF0aC4gWEVOTUVNX3NoYXJpbmdfb3BfcmVzdW1lIGlzIHVzZWQgdG8gd2Fr
ZSB1cAogICogdmNwdXMgdGhhdCBjb3VsZCBub3QgdW5zaGFyZS4KICAqCi0gKiBOb3RlIHRoYXQg
c2hyaW5nIGNhbiBiZSB0dXJuZWQgb24gKGFzIHBlciB0aGUgZG9tY3RsIGJlbG93KQorICogTm90
ZSB0aGF0IHNoYXJpbmcgY2FuIGJlIHR1cm5lZCBvbiAoYXMgcGVyIHRoZSBkb21jdGwgYmVsb3cp
CiAgKiAqd2l0aG91dCogdGhpcyByaW5nIGJlaW5nIHNldHVwLgogICovCiAjZGVmaW5lIFhFTl9E
T01DVExfVk1fRVZFTlRfT1BfU0hBUklORyAgICAgICAgICAgMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
