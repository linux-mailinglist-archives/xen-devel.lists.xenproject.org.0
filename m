Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C2BBC9C4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:06:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClQk-00051H-UX; Tue, 24 Sep 2019 14:04:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IFUW=XT=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iClQj-00050d-2z
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:04:37 +0000
X-Inumbo-ID: 3d7b3fbe-ded4-11e9-97fb-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::2])
 by localhost (Halon) with ESMTPS
 id 3d7b3fbe-ded4-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569333875;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=T9s9NtO9OB4r/h4Xfn5sQa8tUjL463W0NB1znGOmaEY=;
 b=n0Nw8V/vx72KoKlacDSRQpf+AkOvodMs5Z0N0tvqhIleIPe5w7HHbpsphQ9dtWLNPC
 frDkAaHnCoivs3zBTI4oP4g8gqqs0RQYA2XynrSELVf2VeDZ+fUH6mBPxV3Dq29QKARY
 WT+M5CYEW0P9rbjja4YQbkv9qUxZ7LcabF52JykFGvHtamKTUX54Qvz07gw3CkbocDqQ
 b+l/ejdQNXWCRcUuMCR5nTYytfXBJheAlirxZon0h6Wll5+SlEjq/pivc+nOmFFc4e9J
 eV5BkQTQNPZ1MRMNND7MM2bCV2yJFZRQ4uy5m2/Dkr8DYZqsEstXGjiFSuHrpY7a8XQg
 dmlg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3KJf+j/F"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v8OE3O1mh
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 24 Sep 2019 16:03:24 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 16:03:12 +0200
Message-Id: <20190924140319.11303-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190924140319.11303-1-olaf@aepfle.de>
References: <20190924140319.11303-1-olaf@aepfle.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH RESEND v1 1/8] stubdom/vtpm: include stdio.h for
 declaration of printf
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Olaf Hering <olaf@aepfle.de>, Quan Xu <quan.xu0@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZ1bmN0aW9uIHJlYWRfdnRwbWJsayB1c2VzIHByaW50ZigzKSwgYnV0IHN0ZGlvLmggaXMg
bm90IGluY2x1ZGVkCmluIHRoaXMgZmlsZS4gVGhpcyByZXN1bHRzIGluIGEgd2FybmluZyBmcm9t
IGdjYy03OgoKdnRwbWJsay5jOiBJbiBmdW5jdGlvbiAncmVhZF92dHBtYmxrJzoKdnRwbWJsay5j
OjMyMjo3OiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAncHJpbnRm
JyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgICAgIHByaW50ZigiRXhwZWN0
ZWQ6ICIpOwp2dHBtYmxrLmM6MzIyOjc6IHdhcm5pbmc6IGluY29tcGF0aWJsZSBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBidWlsdC1pbiBmdW5jdGlvbiAncHJpbnRmJwp2dHBtYmxrLmM6MzIyOjc6
IG5vdGU6IGluY2x1ZGUgJzxzdGRpby5oPicgb3IgcHJvdmlkZSBhIGRlY2xhcmF0aW9uIG9mICdw
cmludGYnCgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Ci0tLQog
c3R1YmRvbS92dHBtL3Z0cG1ibGsuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvc3R1YmRvbS92dHBtL3Z0cG1ibGsuYyBiL3N0dWJkb20vdnRwbS92
dHBtYmxrLmMKaW5kZXggZmU1MjlhYjVhYy4uNjgxZjBjMDFiNiAxMDA2NDQKLS0tIGEvc3R1YmRv
bS92dHBtL3Z0cG1ibGsuYworKysgYi9zdHViZG9tL3Z0cG0vdnRwbWJsay5jCkBAIC0yMCw2ICsy
MCw3IEBACiAjaW5jbHVkZSA8dW5pc3RkLmg+CiAjaW5jbHVkZSA8ZXJybm8uaD4KICNpbmNsdWRl
IDxmY250bC5oPgorI2luY2x1ZGUgPHN0ZGlvLmg+CiAKIC8qRW5jcnlwdGlvbiBrZXkgYW5kIGJs
b2NrIHNpemVzICovCiAjZGVmaW5lIEJMS1NaIDE2CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
