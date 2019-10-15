Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BD4D7BC9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:35:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPlP-0006Qr-Le; Tue, 15 Oct 2019 16:33:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPlO-0006QL-I4
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:33:34 +0000
X-Inumbo-ID: 87b7f70c-ef69-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87b7f70c-ef69-11e9-beca-bc764e2007e4;
 Tue, 15 Oct 2019 16:33:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E87A882FB;
 Tue, 15 Oct 2019 16:33:33 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D044319C5B;
 Tue, 15 Oct 2019 16:33:27 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:27:05 +0200
Message-Id: <20191015162705.28087-33-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 15 Oct 2019 16:33:33 +0000 (UTC)
Subject: [Xen-devel] [PATCH 32/32] hw/pci-host/i440fx: Remove the last PIIX3
 traces
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

VGhlIFBJSVgzIGlzIG5vdCB0aWVkIHRvIHRoZSBpNDQwRlggYW5kIGNhbiBldmVuIGJlIHVzZWQg
d2l0aG91dCBpdC4KTW92ZSBpdHMgY3JlYXRpb24gdG8gdGhlIG1hY2hpbmUgY29kZSAocGNfcGlp
eC5jKS4KV2UgaGF2ZSBub3cgcmVtb3ZlZCB0aGUgbGFzdCB0cmFjZSBvZiBzb3V0aGJyaWRnZSBj
b2RlIGluIHRoZSBpNDQwRlgKbm9ydGhicmlkZ2UuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvaTM4Ni9wY19waWl4LmMg
ICAgICAgICAgICB8IDggKysrKysrKy0KIGh3L3BjaS1ob3N0L2k0NDBmeC5jICAgICAgICAgfCA4
IC0tLS0tLS0tCiBpbmNsdWRlL2h3L3BjaS1ob3N0L2k0NDBmeC5oIHwgMyArLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9o
dy9pMzg2L3BjX3BpaXguYyBiL2h3L2kzODYvcGNfcGlpeC5jCmluZGV4IDhhYzRiZjEyY2EuLmNi
NGY0ZmM5NGMgMTAwNjQ0Ci0tLSBhL2h3L2kzODYvcGNfcGlpeC5jCisrKyBiL2h3L2kzODYvcGNf
cGlpeC5jCkBAIC0xOTAsMTQgKzE5MCwyMCBAQCBzdGF0aWMgdm9pZCBwY19pbml0MShNYWNoaW5l
U3RhdGUgKm1hY2hpbmUsCiAgICAgZ3NpX3N0YXRlID0gcGNfZ3NpX2NyZWF0ZSgmcGNtcy0+Z3Np
LCBwY21jLT5wY2lfZW5hYmxlZCk7CiAKICAgICBpZiAocGNtYy0+cGNpX2VuYWJsZWQpIHsKKyAg
ICAgICAgUElJWDNTdGF0ZSAqcGlpeDM7CisKICAgICAgICAgcGNpX2J1cyA9IGk0NDBmeF9pbml0
KGhvc3RfdHlwZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV90eXBlLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJmk0NDBmeF9zdGF0ZSwgJnBpaXgzX2RldmZuLCAm
aXNhX2J1cywgcGNtcy0+Z3NpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmk0NDBm
eF9zdGF0ZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN5c3RlbV9tZW1vcnksIHN5
c3RlbV9pbywgbWFjaGluZS0+cmFtX3NpemUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwY21zLT5iZWxvd180Z19tZW1fc2l6ZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBjbXMtPmFib3ZlXzRnX21lbV9zaXplLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGNpX21lbW9yeSwgcmFtX21lbW9yeSk7CiAgICAgICAgIHBjbXMtPmJ1cyA9IHBjaV9idXM7CisK
KyAgICAgICAgcGlpeDMgPSBwaWl4M19jcmVhdGUocGNpX2J1cywgJmlzYV9idXMpOworICAgICAg
ICBwaWl4My0+cGljID0gcGNtcy0+Z3NpOworICAgICAgICBwaWl4M19kZXZmbiA9IHBpaXgzLT5k
ZXYuZGV2Zm47CiAgICAgfSBlbHNlIHsKICAgICAgICAgcGNpX2J1cyA9IE5VTEw7CiAgICAgICAg
IGk0NDBmeF9zdGF0ZSA9IE5VTEw7CmRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9pNDQwZnguYyBi
L2h3L3BjaS1ob3N0L2k0NDBmeC5jCmluZGV4IDc5ZWNkNThhMmIuLmYyNzEzMTEwMmQgMTAwNjQ0
Ci0tLSBhL2h3L3BjaS1ob3N0L2k0NDBmeC5jCisrKyBiL2h3L3BjaS1ob3N0L2k0NDBmeC5jCkBA
IC0yNyw3ICsyNyw2IEBACiAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgogI2luY2x1ZGUgImh3L3Bj
aS9wY2lfaG9zdC5oIgogI2luY2x1ZGUgImh3L3BjaS1ob3N0L2k0NDBmeC5oIgotI2luY2x1ZGUg
Imh3L3NvdXRoYnJpZGdlL3BpaXguaCIKICNpbmNsdWRlICJody9xZGV2LXByb3BlcnRpZXMuaCIK
ICNpbmNsdWRlICJody9zeXNidXMuaCIKICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiCkBAIC0yNzIs
OCArMjcxLDYgQEAgc3RhdGljIHZvaWQgaTQ0MGZ4X3JlYWxpemUoUENJRGV2aWNlICpkZXYsIEVy
cm9yICoqZXJycCkKIAogUENJQnVzICppNDQwZnhfaW5pdChjb25zdCBjaGFyICpob3N0X3R5cGUs
IGNvbnN0IGNoYXIgKnBjaV90eXBlLAogICAgICAgICAgICAgICAgICAgICBQQ0lJNDQwRlhTdGF0
ZSAqKnBpNDQwZnhfc3RhdGUsCi0gICAgICAgICAgICAgICAgICAgIGludCAqcGlpeDNfZGV2Zm4s
Ci0gICAgICAgICAgICAgICAgICAgIElTQUJ1cyAqKmlzYV9idXMsIHFlbXVfaXJxICpwaWMsCiAg
ICAgICAgICAgICAgICAgICAgIE1lbW9yeVJlZ2lvbiAqYWRkcmVzc19zcGFjZV9tZW0sCiAgICAg
ICAgICAgICAgICAgICAgIE1lbW9yeVJlZ2lvbiAqYWRkcmVzc19zcGFjZV9pbywKICAgICAgICAg
ICAgICAgICAgICAgcmFtX2FkZHJfdCByYW1fc2l6ZSwKQEAgLTI4Niw3ICsyODMsNiBAQCBQQ0lC
dXMgKmk0NDBmeF9pbml0KGNvbnN0IGNoYXIgKmhvc3RfdHlwZSwgY29uc3QgY2hhciAqcGNpX3R5
cGUsCiAgICAgUENJQnVzICpiOwogICAgIFBDSURldmljZSAqZDsKICAgICBQQ0lIb3N0U3RhdGUg
KnM7Ci0gICAgUElJWDNTdGF0ZSAqcGlpeDM7CiAgICAgUENJSTQ0MEZYU3RhdGUgKmY7CiAgICAg
dW5zaWduZWQgaTsKICAgICBJNDQwRlhTdGF0ZSAqaTQ0MGZ4OwpAQCAtMzM5LDEwICszMzUsNiBA
QCBQQ0lCdXMgKmk0NDBmeF9pbml0KGNvbnN0IGNoYXIgKmhvc3RfdHlwZSwgY29uc3QgY2hhciAq
cGNpX3R5cGUsCiAgICAgICAgICAgICAgICAgIFBBTV9FWFBBTl9TSVpFKTsKICAgICB9CiAKLSAg
ICBwaWl4MyA9IHBpaXgzX2NyZWF0ZShiLCBpc2FfYnVzKTsKLSAgICBwaWl4My0+cGljID0gcGlj
OwotICAgICpwaWl4M19kZXZmbiA9IHBpaXgzLT5kZXYuZGV2Zm47Ci0KICAgICByYW1fc2l6ZSA9
IHJhbV9zaXplIC8gOCAvIDEwMjQgLyAxMDI0OwogICAgIGlmIChyYW1fc2l6ZSA+IDI1NSkgewog
ICAgICAgICByYW1fc2l6ZSA9IDI1NTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvcGNpLWhvc3Qv
aTQ0MGZ4LmggYi9pbmNsdWRlL2h3L3BjaS1ob3N0L2k0NDBmeC5oCmluZGV4IGUzMjdmOWJmODcu
LmY1NGU2NDY2ZTQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvcGNpLWhvc3QvaTQ0MGZ4LmgKKysr
IGIvaW5jbHVkZS9ody9wY2ktaG9zdC9pNDQwZnguaApAQCAtMjIsOCArMjIsNyBAQCB0eXBlZGVm
IHN0cnVjdCBQQ0lJNDQwRlhTdGF0ZSBQQ0lJNDQwRlhTdGF0ZTsKICNkZWZpbmUgVFlQRV9JR0Rf
UEFTU1RIUk9VR0hfSTQ0MEZYX1BDSV9ERVZJQ0UgImlnZC1wYXNzdGhyb3VnaC1pNDQwRlgiCiAK
IFBDSUJ1cyAqaTQ0MGZ4X2luaXQoY29uc3QgY2hhciAqaG9zdF90eXBlLCBjb25zdCBjaGFyICpw
Y2lfdHlwZSwKLSAgICAgICAgICAgICAgICAgICAgUENJSTQ0MEZYU3RhdGUgKipwaTQ0MGZ4X3N0
YXRlLCBpbnQgKnBpaXhfZGV2Zm4sCi0gICAgICAgICAgICAgICAgICAgIElTQUJ1cyAqKmlzYV9i
dXMsIHFlbXVfaXJxICpwaWMsCisgICAgICAgICAgICAgICAgICAgIFBDSUk0NDBGWFN0YXRlICoq
cGk0NDBmeF9zdGF0ZSwKICAgICAgICAgICAgICAgICAgICAgTWVtb3J5UmVnaW9uICphZGRyZXNz
X3NwYWNlX21lbSwKICAgICAgICAgICAgICAgICAgICAgTWVtb3J5UmVnaW9uICphZGRyZXNzX3Nw
YWNlX2lvLAogICAgICAgICAgICAgICAgICAgICByYW1fYWRkcl90IHJhbV9zaXplLAotLSAKMi4y
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
