Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54973D7BAA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:32:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPhe-0003kv-8U; Tue, 15 Oct 2019 16:29:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPhc-0003jz-98
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:29:40 +0000
X-Inumbo-ID: fc0f04ac-ef68-11e9-9397-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc0f04ac-ef68-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:29:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 547332D7E1;
 Tue, 15 Oct 2019 16:29:39 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3D1319C58;
 Tue, 15 Oct 2019 16:29:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:45 +0200
Message-Id: <20191015162705.28087-13-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 15 Oct 2019 16:29:39 +0000 (UTC)
Subject: [Xen-devel] [PATCH 12/32] piix4: rename PIIX4 object to piix4-isa
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

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKT3RoZXIgcGlp
eDQgcGFydHMgYXJlIGFscmVhZHkgbmFtZWQgcGlpeDQtaWRlIGFuZCBwaWl4NC11c2ItdWhjaS4K
ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgpB
Y2tlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEhlcnbDqSBQ
b3Vzc2luZWF1IDxocG91c3NpbkByZWFjdG9zLm9yZz4KTWVzc2FnZS1JZDogPDIwMTcxMjE2MDkw
MjI4LjI4NTA1LTE1LWhwb3Vzc2luQHJlYWN0b3Mub3JnPgpbUE1EOiByZWJhc2VkXQpTaWduZWQt
b2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQog
aHcvaXNhL3BpaXg0LmMgICAgICAgfCAxIC0KIGh3L21pcHMvbWlwc19tYWx0YS5jIHwgMiArLQog
aW5jbHVkZS9ody9pc2EvaXNhLmggfCAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9pc2EvcGlpeDQuYyBiL2h3L2lz
YS9waWl4NC5jCmluZGV4IDFjZmM1MTMzNWEuLmMzYTJiZDBkNzAgMTAwNjQ0Ci0tLSBhL2h3L2lz
YS9waWl4NC5jCisrKyBiL2h3L2lzYS9waWl4NC5jCkBAIC00NSw3ICs0NSw2IEBAIHR5cGVkZWYg
c3RydWN0IFBJSVg0U3RhdGUgewogICAgIHVpbnQ4X3QgcmNyOwogfSBQSUlYNFN0YXRlOwogCi0j
ZGVmaW5lIFRZUEVfUElJWDRfUENJX0RFVklDRSAiUElJWDQiCiAjZGVmaW5lIFBJSVg0X1BDSV9E
RVZJQ0Uob2JqKSBcCiAgICAgT0JKRUNUX0NIRUNLKFBJSVg0U3RhdGUsIChvYmopLCBUWVBFX1BJ
SVg0X1BDSV9ERVZJQ0UpCiAKZGlmZiAtLWdpdCBhL2h3L21pcHMvbWlwc19tYWx0YS5jIGIvaHcv
bWlwcy9taXBzX21hbHRhLmMKaW5kZXggN2QyNWFiNmMyMy4uZTQ5OWI3YTZiYiAxMDA2NDQKLS0t
IGEvaHcvbWlwcy9taXBzX21hbHRhLmMKKysrIGIvaHcvbWlwcy9taXBzX21hbHRhLmMKQEAgLTE0
MTQsNyArMTQxNCw3IEBAIHZvaWQgbWlwc19tYWx0YV9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGlu
ZSkKICAgICBpZGVfZHJpdmVfZ2V0KGhkLCBBUlJBWV9TSVpFKGhkKSk7CiAKICAgICBwY2kgPSBw
Y2lfY3JlYXRlX3NpbXBsZV9tdWx0aWZ1bmN0aW9uKHBjaV9idXMsIFBDSV9ERVZGTigxMCwgMCks
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlLCAiUElJWDQi
KTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUsIFRZUEVf
UElJWDRfUENJX0RFVklDRSk7CiAgICAgZGV2ID0gREVWSUNFKHBjaSk7CiAgICAgaXNhX2J1cyA9
IElTQV9CVVMocWRldl9nZXRfY2hpbGRfYnVzKGRldiwgImlzYS4wIikpOwogICAgIHBpaXg0X2Rl
dmZuID0gcGNpLT5kZXZmbjsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvaXNhL2lzYS5oIGIvaW5j
bHVkZS9ody9pc2EvaXNhLmgKaW5kZXggMDE4YWRhNGY2Zi4uNzlmNzAzZmQ2YyAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9ody9pc2EvaXNhLmgKKysrIGIvaW5jbHVkZS9ody9pc2EvaXNhLmgKQEAgLTE0
Nyw0ICsxNDcsNiBAQCBzdGF0aWMgaW5saW5lIElTQUJ1cyAqaXNhX2J1c19mcm9tX2RldmljZShJ
U0FEZXZpY2UgKmQpCiAgICAgcmV0dXJuIElTQV9CVVMocWRldl9nZXRfcGFyZW50X2J1cyhERVZJ
Q0UoZCkpKTsKIH0KIAorI2RlZmluZSBUWVBFX1BJSVg0X1BDSV9ERVZJQ0UgInBpaXg0LWlzYSIK
KwogI2VuZGlmCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
