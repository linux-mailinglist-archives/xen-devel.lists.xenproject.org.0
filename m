Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BAADC692
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:53:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSfR-0006lE-Qs; Fri, 18 Oct 2019 13:51:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLSfR-0006kt-5G
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:51:45 +0000
X-Inumbo-ID: 6bae826e-f1ae-11e9-93f5-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bae826e-f1ae-11e9-93f5-12813bfff9fa;
 Fri, 18 Oct 2019 13:51:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3CB12307D986;
 Fri, 18 Oct 2019 13:51:44 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B09C60BF1;
 Fri, 18 Oct 2019 13:51:33 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:54 +0200
Message-Id: <20191018134754.16362-21-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 18 Oct 2019 13:51:44 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 20/20] hw/pci-host/i440fx: Remove the last
 PIIX3 traces
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

VGhlIFBJSVgzIGlzIG5vdCB0aWVkIHRvIHRoZSBpNDQwRlggYW5kIGNhbiBldmVuIGJlIHVzZWQg
d2l0aG91dCBpdC4KTW92ZSBpdHMgY3JlYXRpb24gdG8gdGhlIG1hY2hpbmUgY29kZSAocGNfcGlp
eC5jKS4KV2UgaGF2ZSBub3cgcmVtb3ZlZCB0aGUgbGFzdCB0cmFjZSBvZiBzb3V0aGJyaWRnZSBj
b2RlIGluIHRoZSBpNDQwRlgKbm9ydGhicmlkZ2UuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvaTM4Ni9wY19waWl4LmMg
ICAgICAgICAgICB8IDggKysrKysrKy0KIGh3L3BjaS1ob3N0L2k0NDBmeC5jICAgICAgICAgfCA4
IC0tLS0tLS0tCiBpbmNsdWRlL2h3L3BjaS1ob3N0L2k0NDBmeC5oIHwgMyArLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9o
dy9pMzg2L3BjX3BpaXguYyBiL2h3L2kzODYvcGNfcGlpeC5jCmluZGV4IDExYjhkZTA0OWYuLmY2
ZTcxOTZhODIgMTAwNjQ0Ci0tLSBhL2h3L2kzODYvcGNfcGlpeC5jCisrKyBiL2h3L2kzODYvcGNf
cGlpeC5jCkBAIC0xOTksMTQgKzE5OSwyMCBAQCBzdGF0aWMgdm9pZCBwY19pbml0MShNYWNoaW5l
U3RhdGUgKm1hY2hpbmUsCiAgICAgfQogCiAgICAgaWYgKHBjbWMtPnBjaV9lbmFibGVkKSB7Cisg
ICAgICAgIFBJSVgzU3RhdGUgKnBpaXgzOworCiAgICAgICAgIHBjaV9idXMgPSBpNDQwZnhfaW5p
dChob3N0X3R5cGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfdHlwZSwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZpNDQwZnhfc3RhdGUsICZwaWl4M19kZXZmbiwg
JmlzYV9idXMsIHBjbXMtPmdzaSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZpNDQw
Znhfc3RhdGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzeXN0ZW1fbWVtb3J5LCBz
eXN0ZW1faW8sIG1hY2hpbmUtPnJhbV9zaXplLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGNtcy0+YmVsb3dfNGdfbWVtX3NpemUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwY21zLT5hYm92ZV80Z19tZW1fc2l6ZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBjaV9tZW1vcnksIHJhbV9tZW1vcnkpOwogICAgICAgICBwY21zLT5idXMgPSBwY2lfYnVzOwor
CisgICAgICAgIHBpaXgzID0gcGlpeDNfY3JlYXRlKHBjaV9idXMsICZpc2FfYnVzKTsKKyAgICAg
ICAgcGlpeDMtPnBpYyA9IHBjbXMtPmdzaTsKKyAgICAgICAgcGlpeDNfZGV2Zm4gPSBwaWl4My0+
ZGV2LmRldmZuOwogICAgIH0gZWxzZSB7CiAgICAgICAgIHBjaV9idXMgPSBOVUxMOwogICAgICAg
ICBpNDQwZnhfc3RhdGUgPSBOVUxMOwpkaWZmIC0tZ2l0IGEvaHcvcGNpLWhvc3QvaTQ0MGZ4LmMg
Yi9ody9wY2ktaG9zdC9pNDQwZnguYwppbmRleCA3OWVjZDU4YTJiLi5mMjcxMzExMDJkIDEwMDY0
NAotLS0gYS9ody9wY2ktaG9zdC9pNDQwZnguYworKysgYi9ody9wY2ktaG9zdC9pNDQwZnguYwpA
QCAtMjcsNyArMjcsNiBAQAogI2luY2x1ZGUgImh3L3BjaS9wY2kuaCIKICNpbmNsdWRlICJody9w
Y2kvcGNpX2hvc3QuaCIKICNpbmNsdWRlICJody9wY2ktaG9zdC9pNDQwZnguaCIKLSNpbmNsdWRl
ICJody9zb3V0aGJyaWRnZS9waWl4LmgiCiAjaW5jbHVkZSAiaHcvcWRldi1wcm9wZXJ0aWVzLmgi
CiAjaW5jbHVkZSAiaHcvc3lzYnVzLmgiCiAjaW5jbHVkZSAicWFwaS9lcnJvci5oIgpAQCAtMjcy
LDggKzI3MSw2IEBAIHN0YXRpYyB2b2lkIGk0NDBmeF9yZWFsaXplKFBDSURldmljZSAqZGV2LCBF
cnJvciAqKmVycnApCiAKIFBDSUJ1cyAqaTQ0MGZ4X2luaXQoY29uc3QgY2hhciAqaG9zdF90eXBl
LCBjb25zdCBjaGFyICpwY2lfdHlwZSwKICAgICAgICAgICAgICAgICAgICAgUENJSTQ0MEZYU3Rh
dGUgKipwaTQ0MGZ4X3N0YXRlLAotICAgICAgICAgICAgICAgICAgICBpbnQgKnBpaXgzX2RldmZu
LAotICAgICAgICAgICAgICAgICAgICBJU0FCdXMgKippc2FfYnVzLCBxZW11X2lycSAqcGljLAog
ICAgICAgICAgICAgICAgICAgICBNZW1vcnlSZWdpb24gKmFkZHJlc3Nfc3BhY2VfbWVtLAogICAg
ICAgICAgICAgICAgICAgICBNZW1vcnlSZWdpb24gKmFkZHJlc3Nfc3BhY2VfaW8sCiAgICAgICAg
ICAgICAgICAgICAgIHJhbV9hZGRyX3QgcmFtX3NpemUsCkBAIC0yODYsNyArMjgzLDYgQEAgUENJ
QnVzICppNDQwZnhfaW5pdChjb25zdCBjaGFyICpob3N0X3R5cGUsIGNvbnN0IGNoYXIgKnBjaV90
eXBlLAogICAgIFBDSUJ1cyAqYjsKICAgICBQQ0lEZXZpY2UgKmQ7CiAgICAgUENJSG9zdFN0YXRl
ICpzOwotICAgIFBJSVgzU3RhdGUgKnBpaXgzOwogICAgIFBDSUk0NDBGWFN0YXRlICpmOwogICAg
IHVuc2lnbmVkIGk7CiAgICAgSTQ0MEZYU3RhdGUgKmk0NDBmeDsKQEAgLTMzOSwxMCArMzM1LDYg
QEAgUENJQnVzICppNDQwZnhfaW5pdChjb25zdCBjaGFyICpob3N0X3R5cGUsIGNvbnN0IGNoYXIg
KnBjaV90eXBlLAogICAgICAgICAgICAgICAgICBQQU1fRVhQQU5fU0laRSk7CiAgICAgfQogCi0g
ICAgcGlpeDMgPSBwaWl4M19jcmVhdGUoYiwgaXNhX2J1cyk7Ci0gICAgcGlpeDMtPnBpYyA9IHBp
YzsKLSAgICAqcGlpeDNfZGV2Zm4gPSBwaWl4My0+ZGV2LmRldmZuOwotCiAgICAgcmFtX3NpemUg
PSByYW1fc2l6ZSAvIDggLyAxMDI0IC8gMTAyNDsKICAgICBpZiAocmFtX3NpemUgPiAyNTUpIHsK
ICAgICAgICAgcmFtX3NpemUgPSAyNTU7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3BjaS1ob3N0
L2k0NDBmeC5oIGIvaW5jbHVkZS9ody9wY2ktaG9zdC9pNDQwZnguaAppbmRleCBlMzI3ZjliZjg3
Li5mNTRlNjQ2NmU0IDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3BjaS1ob3N0L2k0NDBmeC5oCisr
KyBiL2luY2x1ZGUvaHcvcGNpLWhvc3QvaTQ0MGZ4LmgKQEAgLTIyLDggKzIyLDcgQEAgdHlwZWRl
ZiBzdHJ1Y3QgUENJSTQ0MEZYU3RhdGUgUENJSTQ0MEZYU3RhdGU7CiAjZGVmaW5lIFRZUEVfSUdE
X1BBU1NUSFJPVUdIX0k0NDBGWF9QQ0lfREVWSUNFICJpZ2QtcGFzc3Rocm91Z2gtaTQ0MEZYIgog
CiBQQ0lCdXMgKmk0NDBmeF9pbml0KGNvbnN0IGNoYXIgKmhvc3RfdHlwZSwgY29uc3QgY2hhciAq
cGNpX3R5cGUsCi0gICAgICAgICAgICAgICAgICAgIFBDSUk0NDBGWFN0YXRlICoqcGk0NDBmeF9z
dGF0ZSwgaW50ICpwaWl4X2RldmZuLAotICAgICAgICAgICAgICAgICAgICBJU0FCdXMgKippc2Ff
YnVzLCBxZW11X2lycSAqcGljLAorICAgICAgICAgICAgICAgICAgICBQQ0lJNDQwRlhTdGF0ZSAq
KnBpNDQwZnhfc3RhdGUsCiAgICAgICAgICAgICAgICAgICAgIE1lbW9yeVJlZ2lvbiAqYWRkcmVz
c19zcGFjZV9tZW0sCiAgICAgICAgICAgICAgICAgICAgIE1lbW9yeVJlZ2lvbiAqYWRkcmVzc19z
cGFjZV9pbywKICAgICAgICAgICAgICAgICAgICAgcmFtX2FkZHJfdCByYW1fc2l6ZSwKLS0gCjIu
MjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
