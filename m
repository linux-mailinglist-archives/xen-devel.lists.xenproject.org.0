Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4284DC696
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:53:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSea-0006F7-W7; Fri, 18 Oct 2019 13:50:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLSeZ-0006ES-EE
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:50:51 +0000
X-Inumbo-ID: 446b6688-f1ae-11e9-93f5-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 446b6688-f1ae-11e9-93f5-12813bfff9fa;
 Fri, 18 Oct 2019 13:50:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8635951EF6;
 Fri, 18 Oct 2019 13:50:38 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AE1360BF1;
 Fri, 18 Oct 2019 13:50:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:48 +0200
Message-Id: <20191018134754.16362-15-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 18 Oct 2019 13:50:38 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 14/20] hw/pci-host/piix: Move RCR_IOPORT
 register definition
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoZSBSQ1Jf
SU9QT1JUIHJlZ2lzdGVyIGJlbG9uZ3MgdG8gdGhlIFBJSVggY2hpcHNldC4KTW92ZSB0aGUgZGVm
aW5pdGlvbiB0byAicGlpeC5oIiwgYW5kIHByZXBlbmQgdGhlIFBJSVggcHJlZml4LgoKUmV2aWV3
ZWQtYnk6IEFsZWtzYW5kYXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0t
CnYyOiBwcmVwZW5kIFBJSVggcHJlZml4IChBbGVrc2FuZGFyKQotLS0KIGh3L2kzODYvYWNwaS1i
dWlsZC5jICAgICAgICAgIHwgMiArLQogaHcvcGNpLWhvc3QvcGlpeC5jICAgICAgICAgICAgfCA3
ICsrKystLS0KIGluY2x1ZGUvaHcvaTM4Ni9wYy5oICAgICAgICAgIHwgNiAtLS0tLS0KIGluY2x1
ZGUvaHcvc291dGhicmlkZ2UvcGlpeC5oIHwgNiArKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9hY3Bp
LWJ1aWxkLmMgYi9ody9pMzg2L2FjcGktYnVpbGQuYwppbmRleCA1NmM0MjdmNzcyLi40NzhjYTI5
ODc0IDEwMDY0NAotLS0gYS9ody9pMzg2L2FjcGktYnVpbGQuYworKysgYi9ody9pMzg2L2FjcGkt
YnVpbGQuYwpAQCAtMjA5LDcgKzIwOSw3IEBAIHN0YXRpYyB2b2lkIGFjcGlfZ2V0X3BtX2luZm8o
TWFjaGluZVN0YXRlICptYWNoaW5lLCBBY3BpUG1JbmZvICpwbSkKIAogICAgIC8qIFRoZSBhYm92
ZSBuZWVkIG5vdCBiZSBjb25kaXRpb25hbCBvbiBtYWNoaW5lIHR5cGUgYmVjYXVzZSB0aGUgcmVz
ZXQgcG9ydAogICAgICAqIGhhcHBlbnMgdG8gYmUgdGhlIHNhbWUgb24gUElJWCAocGMpIGFuZCBJ
Q0g5IChxMzUpLiAqLwotICAgIFFFTVVfQlVJTERfQlVHX09OKElDSDlfUlNUX0NOVF9JT1BPUlQg
IT0gUkNSX0lPUE9SVCk7CisgICAgUUVNVV9CVUlMRF9CVUdfT04oSUNIOV9SU1RfQ05UX0lPUE9S
VCAhPSBQSUlYX1JDUl9JT1BPUlQpOwogCiAgICAgLyogRmlsbCBpbiBvcHRpb25hbCBzMy9zNCBy
ZWxhdGVkIHByb3BlcnRpZXMgKi8KICAgICBvID0gb2JqZWN0X3Byb3BlcnR5X2dldF9xb2JqZWN0
KG9iaiwgQUNQSV9QTV9QUk9QX1MzX0RJU0FCTEVELCBOVUxMKTsKZGlmZiAtLWdpdCBhL2h3L3Bj
aS1ob3N0L3BpaXguYyBiL2h3L3BjaS1ob3N0L3BpaXguYwppbmRleCAzMjkyNzAzZGU3Li42NTQ4
ZDlhNGI1IDEwMDY0NAotLS0gYS9ody9wY2ktaG9zdC9waWl4LmMKKysrIGIvaHcvcGNpLWhvc3Qv
cGlpeC5jCkBAIC0yNyw2ICsyNyw3IEBACiAjaW5jbHVkZSAiaHcvaXJxLmgiCiAjaW5jbHVkZSAi
aHcvcGNpL3BjaS5oIgogI2luY2x1ZGUgImh3L3BjaS9wY2lfaG9zdC5oIgorI2luY2x1ZGUgImh3
L3NvdXRoYnJpZGdlL3BpaXguaCIKICNpbmNsdWRlICJody9xZGV2LXByb3BlcnRpZXMuaCIKICNp
bmNsdWRlICJody9pc2EvaXNhLmgiCiAjaW5jbHVkZSAiaHcvc3lzYnVzLmgiCkBAIC04Nyw3ICs4
OCw3IEBAIHR5cGVkZWYgc3RydWN0IFBJSVgzU3RhdGUgewogICAgIC8qIFJlc2V0IENvbnRyb2wg
UmVnaXN0ZXIgY29udGVudHMgKi8KICAgICB1aW50OF90IHJjcjsKIAotICAgIC8qIElPIG1lbW9y
eSByZWdpb24gZm9yIFJlc2V0IENvbnRyb2wgUmVnaXN0ZXIgKFJDUl9JT1BPUlQpICovCisgICAg
LyogSU8gbWVtb3J5IHJlZ2lvbiBmb3IgUmVzZXQgQ29udHJvbCBSZWdpc3RlciAoUElJWF9SQ1Jf
SU9QT1JUKSAqLwogICAgIE1lbW9yeVJlZ2lvbiByY3JfbWVtOwogfSBQSUlYM1N0YXRlOwogCkBA
IC02OTUsOCArNjk2LDggQEAgc3RhdGljIHZvaWQgcGlpeDNfcmVhbGl6ZShQQ0lEZXZpY2UgKmRl
diwgRXJyb3IgKiplcnJwKQogCiAgICAgbWVtb3J5X3JlZ2lvbl9pbml0X2lvKCZkLT5yY3JfbWVt
LCBPQkpFQ1QoZGV2KSwgJnJjcl9vcHMsIGQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICJw
aWl4My1yZXNldC1jb250cm9sIiwgMSk7Ci0gICAgbWVtb3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9u
X292ZXJsYXAocGNpX2FkZHJlc3Nfc3BhY2VfaW8oZGV2KSwgUkNSX0lPUE9SVCwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZC0+cmNyX21lbSwgMSk7CisgICAgbWVt
b3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9uX292ZXJsYXAocGNpX2FkZHJlc3Nfc3BhY2VfaW8oZGV2
KSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQSUlYX1JDUl9JT1BP
UlQsICZkLT5yY3JfbWVtLCAxKTsKIAogICAgIHFlbXVfcmVnaXN0ZXJfcmVzZXQocGlpeDNfcmVz
ZXQsIGQpOwogfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9pMzg2L3BjLmggYi9pbmNsdWRlL2h3
L2kzODYvcGMuaAppbmRleCA4NDgwNzhiYWNjLi4yNjI4ZGU4YjcyIDEwMDY0NAotLS0gYS9pbmNs
dWRlL2h3L2kzODYvcGMuaAorKysgYi9pbmNsdWRlL2h3L2kzODYvcGMuaApAQCAtMjYwLDEyICsy
NjAsNiBAQCB0eXBlZGVmIHN0cnVjdCBQQ0lJNDQwRlhTdGF0ZSBQQ0lJNDQwRlhTdGF0ZTsKIAog
I2RlZmluZSBUWVBFX0lHRF9QQVNTVEhST1VHSF9JNDQwRlhfUENJX0RFVklDRSAiaWdkLXBhc3N0
aHJvdWdoLWk0NDBGWCIKIAotLyoKLSAqIFJlc2V0IENvbnRyb2wgUmVnaXN0ZXI6IFBDSS1hY2Nl
c3NpYmxlIElTQS1Db21wYXRpYmxlIFJlZ2lzdGVyIGF0IGFkZHJlc3MKLSAqIDB4Y2Y5LCBwcm92
aWRlZCBieSB0aGUgUENJL0lTQSBicmlkZ2UgKFBJSVgzIFBDSSBmdW5jdGlvbiAwLCA4MDg2Ojcw
MDApLgotICovCi0jZGVmaW5lIFJDUl9JT1BPUlQgMHhjZjkKLQogUENJQnVzICppNDQwZnhfaW5p
dChjb25zdCBjaGFyICpob3N0X3R5cGUsIGNvbnN0IGNoYXIgKnBjaV90eXBlLAogICAgICAgICAg
ICAgICAgICAgICBQQ0lJNDQwRlhTdGF0ZSAqKnBpNDQwZnhfc3RhdGUsIGludCAqcGlpeF9kZXZm
biwKICAgICAgICAgICAgICAgICAgICAgSVNBQnVzICoqaXNhX2J1cywgcWVtdV9pcnEgKnBpYywK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvc291dGhicmlkZ2UvcGlpeC5oIGIvaW5jbHVkZS9ody9z
b3V0aGJyaWRnZS9waWl4LmgKaW5kZXggYWRkMzUyNDU2Yi4uZTQ5ZDRhNmJiZSAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9ody9zb3V0aGJyaWRnZS9waWl4LmgKKysrIGIvaW5jbHVkZS9ody9zb3V0aGJy
aWRnZS9waWl4LmgKQEAgLTE4LDYgKzE4LDEyIEBAIEkyQ0J1cyAqcGlpeDRfcG1faW5pdChQQ0lC
dXMgKmJ1cywgaW50IGRldmZuLCB1aW50MzJfdCBzbWJfaW9fYmFzZSwKICAgICAgICAgICAgICAg
ICAgICAgICBxZW11X2lycSBzY2lfaXJxLCBxZW11X2lycSBzbWlfaXJxLAogICAgICAgICAgICAg
ICAgICAgICAgIGludCBzbW1fZW5hYmxlZCwgRGV2aWNlU3RhdGUgKipwaWl4NF9wbSk7CiAKKy8q
CisgKiBSZXNldCBDb250cm9sIFJlZ2lzdGVyOiBQQ0ktYWNjZXNzaWJsZSBJU0EtQ29tcGF0aWJs
ZSBSZWdpc3RlciBhdCBhZGRyZXNzCisgKiAweGNmOSwgcHJvdmlkZWQgYnkgdGhlIFBDSS9JU0Eg
YnJpZGdlIChQSUlYMyBQQ0kgZnVuY3Rpb24gMCwgODA4Njo3MDAwKS4KKyAqLworI2RlZmluZSBQ
SUlYX1JDUl9JT1BPUlQgMHhjZjkKKwogZXh0ZXJuIFBDSURldmljZSAqcGlpeDRfZGV2OwogCiBE
ZXZpY2VTdGF0ZSAqcGlpeDRfY3JlYXRlKFBDSUJ1cyAqcGNpX2J1cywgSVNBQnVzICoqaXNhX2J1
cywKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
