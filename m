Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB70D7B9D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:31:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPhV-0003gl-Un; Tue, 15 Oct 2019 16:29:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPhU-0003g4-DT
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:29:32 +0000
X-Inumbo-ID: f735eed2-ef68-11e9-bbab-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f735eed2-ef68-11e9-bbab-bc764e2007e4;
 Tue, 15 Oct 2019 16:29:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 29DBC2102;
 Tue, 15 Oct 2019 16:29:31 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CA0F19C58;
 Tue, 15 Oct 2019 16:29:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:44 +0200
Message-Id: <20191015162705.28087-12-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 15 Oct 2019 16:29:31 +0000 (UTC)
Subject: [Xen-devel] [PATCH 11/32] Revert "irq: introduce qemu_irq_proxy()"
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoaXMgZnVu
Y3Rpb24gaXNuJ3QgdXNlZCBhbnltb3JlLgoKVGhpcyByZXZlcnRzIGNvbW1pdCAyMmVjMzI4M2Vm
YmE5YmEwNzkyNzkwZGE3ODZkNjc3NmQ4M2YyYTkyLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KLS0tCiBody9jb3JlL2lycS5jICAgIHwg
MTQgLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvaHcvaXJxLmggfCAgNSAtLS0tLQogMiBmaWxlcyBj
aGFuZ2VkLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9jb3JlL2lycS5jIGIvaHcv
Y29yZS9pcnEuYwppbmRleCA3Y2MwMjk1ZDBlLi5mYjMwNDViOTEyIDEwMDY0NAotLS0gYS9ody9j
b3JlL2lycS5jCisrKyBiL2h3L2NvcmUvaXJxLmMKQEAgLTEyMCwyMCArMTIwLDYgQEAgcWVtdV9p
cnEgcWVtdV9pcnFfc3BsaXQocWVtdV9pcnEgaXJxMSwgcWVtdV9pcnEgaXJxMikKICAgICByZXR1
cm4gcWVtdV9hbGxvY2F0ZV9pcnEocWVtdV9zcGxpdGlycSwgcywgMCk7CiB9CiAKLXN0YXRpYyB2
b2lkIHByb3h5X2lycV9oYW5kbGVyKHZvaWQgKm9wYXF1ZSwgaW50IG4sIGludCBsZXZlbCkKLXsK
LSAgICBxZW11X2lycSAqKnRhcmdldCA9IG9wYXF1ZTsKLQotICAgIGlmICgqdGFyZ2V0KSB7Ci0g
ICAgICAgIHFlbXVfc2V0X2lycSgoKnRhcmdldClbbl0sIGxldmVsKTsKLSAgICB9Ci19Ci0KLXFl
bXVfaXJxICpxZW11X2lycV9wcm94eShxZW11X2lycSAqKnRhcmdldCwgaW50IG4pCi17Ci0gICAg
cmV0dXJuIHFlbXVfYWxsb2NhdGVfaXJxcyhwcm94eV9pcnFfaGFuZGxlciwgdGFyZ2V0LCBuKTsK
LX0KLQogdm9pZCBxZW11X2lycV9pbnRlcmNlcHRfaW4ocWVtdV9pcnEgKmdwaW9faW4sIHFlbXVf
aXJxX2hhbmRsZXIgaGFuZGxlciwgaW50IG4pCiB7CiAgICAgaW50IGk7CmRpZmYgLS1naXQgYS9p
bmNsdWRlL2h3L2lycS5oIGIvaW5jbHVkZS9ody9pcnEuaAppbmRleCBmZTUyN2Y2ZjUxLi4yNGJh
MGVjZTExIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L2lycS5oCisrKyBiL2luY2x1ZGUvaHcvaXJx
LmgKQEAgLTUxLDExICs1MSw2IEBAIHFlbXVfaXJxIHFlbXVfaXJxX2ludmVydChxZW11X2lycSBp
cnEpOwogICovCiBxZW11X2lycSBxZW11X2lycV9zcGxpdChxZW11X2lycSBpcnExLCBxZW11X2ly
cSBpcnEyKTsKIAotLyogUmV0dXJucyBhIG5ldyBJUlEgc2V0IHdoaWNoIGNvbm5lY3RzIDE6MSB0
byBhbm90aGVyIElSUSBzZXQsIHdoaWNoCi0gKiBtYXkgYmUgc2V0IGxhdGVyLgotICovCi1xZW11
X2lycSAqcWVtdV9pcnFfcHJveHkocWVtdV9pcnEgKip0YXJnZXQsIGludCBuKTsKLQogLyogRm9y
IGludGVybmFsIHVzZSBpbiBxdGVzdC4gIFNpbWlsYXIgdG8gcWVtdV9pcnFfc3BsaXQsIGJ1dCBv
cGVyYXRpbmcKICAgIG9uIGFuIGV4aXN0aW5nIHZlY3RvciBvZiBxZW11X2lycS4gICovCiB2b2lk
IHFlbXVfaXJxX2ludGVyY2VwdF9pbihxZW11X2lycSAqZ3Bpb19pbiwgcWVtdV9pcnFfaGFuZGxl
ciBoYW5kbGVyLCBpbnQgbik7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
