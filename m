Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47540DC68D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSeh-0006KF-DF; Fri, 18 Oct 2019 13:50:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLSef-0006J5-8f
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:50:57 +0000
X-Inumbo-ID: 4f1f045c-f1ae-11e9-93f5-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f1f045c-f1ae-11e9-93f5-12813bfff9fa;
 Fri, 18 Oct 2019 13:50:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F10E89B00B;
 Fri, 18 Oct 2019 13:50:56 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAAD960BF1;
 Fri, 18 Oct 2019 13:50:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:50 +0200
Message-Id: <20191018134754.16362-17-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 18 Oct 2019 13:50:56 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 16/20] hw/pci-host/piix: Move i440FX
 declarations to hw/pci-host/i440fx.h
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoZSBody9w
Y2ktaG9zdC9waWl4LmMgY29udGFpbnMgYSBtaXggb2YgUElJWDMgYW5kIGk0NDBGWCBjaGlwc2V0
cwpmdW5jdGlvbnMuIFRvIGJlIGFibGUgdG8gc3BsaXQgaXQsIHdlIG5lZWQgdG8gZXhwb3J0IHNv
bWUKZGVjbGFyYXRpb25zIGZpcnN0LgoKUmV2aWV3ZWQtYnk6IEFsZWtzYW5kYXIgTWFya292aWMg
PGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogaHcvYWNwaS9wY2locC5jICAgICAgICAgICAgICB8ICAyICstCiBody9pMzg2
L3BjX3BpaXguYyAgICAgICAgICAgIHwgIDEgKwogaHcvcGNpLWhvc3QvcGlpeC5jICAgICAgICAg
ICB8ICAxICsKIGluY2x1ZGUvaHcvaTM4Ni9wYy5oICAgICAgICAgfCAyMiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIGluY2x1ZGUvaHcvcGNpLWhvc3QvaTQ0MGZ4LmggfCAzNyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIHN0dWJzL3BjaS1ob3N0LXBpaXguYyAgICAgICAgfCAg
MyArKy0KIDcgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody9wY2ktaG9zdC9pNDQwZnguaAoKZGlmZiAt
LWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNTU2ZjU4YmQ4Yy4uYWRmMDU5
YTE2NCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTEyMjgs
NiArMTIyOCw3IEBAIEY6IGh3L2kzODYvCiBGOiBody9wY2ktaG9zdC9waWl4LmMKIEY6IGh3L3Bj
aS1ob3N0L3EzNS5jCiBGOiBody9wY2ktaG9zdC9wYW0uYworRjogaW5jbHVkZS9ody9wY2ktaG9z
dC9pNDQwZnguaAogRjogaW5jbHVkZS9ody9wY2ktaG9zdC9xMzUuaAogRjogaW5jbHVkZS9ody9w
Y2ktaG9zdC9wYW0uaAogRjogaHcvaXNhL2xwY19pY2g5LmMKZGlmZiAtLWdpdCBhL2h3L2FjcGkv
cGNpaHAuYyBiL2h3L2FjcGkvcGNpaHAuYwppbmRleCA4MmQyOTViNmU4Li44NDEzMzQ4YTMzIDEw
MDY0NAotLS0gYS9ody9hY3BpL3BjaWhwLmMKKysrIGIvaHcvYWNwaS9wY2locC5jCkBAIC0yNyw3
ICsyNyw3IEBACiAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgogI2luY2x1ZGUgImh3L2FjcGkvcGNp
aHAuaCIKIAotI2luY2x1ZGUgImh3L2kzODYvcGMuaCIKKyNpbmNsdWRlICJody9wY2ktaG9zdC9p
NDQwZnguaCIKICNpbmNsdWRlICJody9wY2kvcGNpLmgiCiAjaW5jbHVkZSAiaHcvcGNpL3BjaV9i
cmlkZ2UuaCIKICNpbmNsdWRlICJody9hY3BpL2FjcGkuaCIKZGlmZiAtLWdpdCBhL2h3L2kzODYv
cGNfcGlpeC5jIGIvaHcvaTM4Ni9wY19waWl4LmMKaW5kZXggNDMxOTY1ZDkyMS4uMTFiOGRlMDQ5
ZiAxMDA2NDQKLS0tIGEvaHcvaTM4Ni9wY19waWl4LmMKKysrIGIvaHcvaTM4Ni9wY19waWl4LmMK
QEAgLTI5LDYgKzI5LDcgQEAKICNpbmNsdWRlICJody9sb2FkZXIuaCIKICNpbmNsdWRlICJody9p
Mzg2L3BjLmgiCiAjaW5jbHVkZSAiaHcvaTM4Ni9hcGljLmgiCisjaW5jbHVkZSAiaHcvcGNpLWhv
c3QvaTQ0MGZ4LmgiCiAjaW5jbHVkZSAiaHcvc291dGhicmlkZ2UvcGlpeC5oIgogI2luY2x1ZGUg
Imh3L2Rpc3BsYXkvcmFtZmIuaCIKICNpbmNsdWRlICJody9maXJtd2FyZS9zbWJpb3MuaCIKZGlm
ZiAtLWdpdCBhL2h3L3BjaS1ob3N0L3BpaXguYyBiL2h3L3BjaS1ob3N0L3BpaXguYwppbmRleCAz
OTBmYjljZWJhLi45NWIwNDEyMmZhIDEwMDY0NAotLS0gYS9ody9wY2ktaG9zdC9waWl4LmMKKysr
IGIvaHcvcGNpLWhvc3QvcGlpeC5jCkBAIC0yNyw2ICsyNyw3IEBACiAjaW5jbHVkZSAiaHcvaXJx
LmgiCiAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgogI2luY2x1ZGUgImh3L3BjaS9wY2lfaG9zdC5o
IgorI2luY2x1ZGUgImh3L3BjaS1ob3N0L2k0NDBmeC5oIgogI2luY2x1ZGUgImh3L3NvdXRoYnJp
ZGdlL3BpaXguaCIKICNpbmNsdWRlICJody9xZGV2LXByb3BlcnRpZXMuaCIKICNpbmNsdWRlICJo
dy9pc2EvaXNhLmgiCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2kzODYvcGMuaCBiL2luY2x1ZGUv
aHcvaTM4Ni9wYy5oCmluZGV4IDI2MjhkZThiNzIuLjgzM2JjNjczN2YgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvaHcvaTM4Ni9wYy5oCisrKyBiL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCkBAIC0yNTEsMjgg
KzI1MSw2IEBAIGludCBjbW9zX2dldF9mZF9kcml2ZV90eXBlKEZsb3BweURyaXZlVHlwZSBmZDAp
OwogLyogaHBldC5jICovCiBleHRlcm4gaW50IG5vX2hwZXQ7CiAKLS8qIHBpaXhfcGNpLmMgKi8K
LXN0cnVjdCBQQ0lJNDQwRlhTdGF0ZTsKLXR5cGVkZWYgc3RydWN0IFBDSUk0NDBGWFN0YXRlIFBD
SUk0NDBGWFN0YXRlOwotCi0jZGVmaW5lIFRZUEVfSTQ0MEZYX1BDSV9IT1NUX0JSSURHRSAiaTQ0
MEZYLXBjaWhvc3QiCi0jZGVmaW5lIFRZUEVfSTQ0MEZYX1BDSV9ERVZJQ0UgImk0NDBGWCIKLQot
I2RlZmluZSBUWVBFX0lHRF9QQVNTVEhST1VHSF9JNDQwRlhfUENJX0RFVklDRSAiaWdkLXBhc3N0
aHJvdWdoLWk0NDBGWCIKLQotUENJQnVzICppNDQwZnhfaW5pdChjb25zdCBjaGFyICpob3N0X3R5
cGUsIGNvbnN0IGNoYXIgKnBjaV90eXBlLAotICAgICAgICAgICAgICAgICAgICBQQ0lJNDQwRlhT
dGF0ZSAqKnBpNDQwZnhfc3RhdGUsIGludCAqcGlpeF9kZXZmbiwKLSAgICAgICAgICAgICAgICAg
ICAgSVNBQnVzICoqaXNhX2J1cywgcWVtdV9pcnEgKnBpYywKLSAgICAgICAgICAgICAgICAgICAg
TWVtb3J5UmVnaW9uICphZGRyZXNzX3NwYWNlX21lbSwKLSAgICAgICAgICAgICAgICAgICAgTWVt
b3J5UmVnaW9uICphZGRyZXNzX3NwYWNlX2lvLAotICAgICAgICAgICAgICAgICAgICByYW1fYWRk
cl90IHJhbV9zaXplLAotICAgICAgICAgICAgICAgICAgICByYW1fYWRkcl90IGJlbG93XzRnX21l
bV9zaXplLAotICAgICAgICAgICAgICAgICAgICByYW1fYWRkcl90IGFib3ZlXzRnX21lbV9zaXpl
LAotICAgICAgICAgICAgICAgICAgICBNZW1vcnlSZWdpb24gKnBjaV9tZW1vcnksCi0gICAgICAg
ICAgICAgICAgICAgIE1lbW9yeVJlZ2lvbiAqcmFtX21lbW9yeSk7Ci0KLVBDSUJ1cyAqZmluZF9p
NDQwZngodm9pZCk7Ci0KIC8qIHBjX3N5c2Z3LmMgKi8KIHZvaWQgcGNfc3lzdGVtX2ZsYXNoX2Ny
ZWF0ZShQQ01hY2hpbmVTdGF0ZSAqcGNtcyk7CiB2b2lkIHBjX3N5c3RlbV9maXJtd2FyZV9pbml0
KFBDTWFjaGluZVN0YXRlICpwY21zLCBNZW1vcnlSZWdpb24gKnJvbV9tZW1vcnkpOwpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9ody9wY2ktaG9zdC9pNDQwZnguaCBiL2luY2x1ZGUvaHcvcGNpLWhvc3Qv
aTQ0MGZ4LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZTMyN2Y5YmY4
NwotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUvaHcvcGNpLWhvc3QvaTQ0MGZ4LmgKQEAgLTAs
MCArMSwzNyBAQAorLyoKKyAqIFFFTVUgaTQ0MEZYIE5vcnRoIEJyaWRnZSBFbXVsYXRpb24KKyAq
CisgKiBDb3B5cmlnaHQgKGMpIDIwMDYgRmFicmljZSBCZWxsYXJkCisgKgorICogVGhpcyB3b3Jr
IGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVyc2lvbiAyIG9y
IGxhdGVyLgorICogU2VlIHRoZSBDT1BZSU5HIGZpbGUgaW4gdGhlIHRvcC1sZXZlbCBkaXJlY3Rv
cnkuCisgKgorICovCisKKyNpZm5kZWYgSFdfUENJX0k0NDBGWF9ICisjZGVmaW5lIEhXX1BDSV9J
NDQwRlhfSAorCisjaW5jbHVkZSAiaHcvaHcuaCIKKyNpbmNsdWRlICJody9wY2kvcGNpX2J1cy5o
IgorCit0eXBlZGVmIHN0cnVjdCBQQ0lJNDQwRlhTdGF0ZSBQQ0lJNDQwRlhTdGF0ZTsKKworI2Rl
ZmluZSBUWVBFX0k0NDBGWF9QQ0lfSE9TVF9CUklER0UgImk0NDBGWC1wY2lob3N0IgorI2RlZmlu
ZSBUWVBFX0k0NDBGWF9QQ0lfREVWSUNFICJpNDQwRlgiCisKKyNkZWZpbmUgVFlQRV9JR0RfUEFT
U1RIUk9VR0hfSTQ0MEZYX1BDSV9ERVZJQ0UgImlnZC1wYXNzdGhyb3VnaC1pNDQwRlgiCisKK1BD
SUJ1cyAqaTQ0MGZ4X2luaXQoY29uc3QgY2hhciAqaG9zdF90eXBlLCBjb25zdCBjaGFyICpwY2lf
dHlwZSwKKyAgICAgICAgICAgICAgICAgICAgUENJSTQ0MEZYU3RhdGUgKipwaTQ0MGZ4X3N0YXRl
LCBpbnQgKnBpaXhfZGV2Zm4sCisgICAgICAgICAgICAgICAgICAgIElTQUJ1cyAqKmlzYV9idXMs
IHFlbXVfaXJxICpwaWMsCisgICAgICAgICAgICAgICAgICAgIE1lbW9yeVJlZ2lvbiAqYWRkcmVz
c19zcGFjZV9tZW0sCisgICAgICAgICAgICAgICAgICAgIE1lbW9yeVJlZ2lvbiAqYWRkcmVzc19z
cGFjZV9pbywKKyAgICAgICAgICAgICAgICAgICAgcmFtX2FkZHJfdCByYW1fc2l6ZSwKKyAgICAg
ICAgICAgICAgICAgICAgcmFtX2FkZHJfdCBiZWxvd180Z19tZW1fc2l6ZSwKKyAgICAgICAgICAg
ICAgICAgICAgcmFtX2FkZHJfdCBhYm92ZV80Z19tZW1fc2l6ZSwKKyAgICAgICAgICAgICAgICAg
ICAgTWVtb3J5UmVnaW9uICpwY2lfbWVtb3J5LAorICAgICAgICAgICAgICAgICAgICBNZW1vcnlS
ZWdpb24gKnJhbV9tZW1vcnkpOworCitQQ0lCdXMgKmZpbmRfaTQ0MGZ4KHZvaWQpOworCisjZW5k
aWYKZGlmZiAtLWdpdCBhL3N0dWJzL3BjaS1ob3N0LXBpaXguYyBiL3N0dWJzL3BjaS1ob3N0LXBp
aXguYwppbmRleCA2ZWQ4MWIxZjIxLi45Mzk3NWFkYmZlIDEwMDY0NAotLS0gYS9zdHVicy9wY2kt
aG9zdC1waWl4LmMKKysrIGIvc3R1YnMvcGNpLWhvc3QtcGlpeC5jCkBAIC0xLDUgKzEsNiBAQAog
I2luY2x1ZGUgInFlbXUvb3NkZXAuaCIKLSNpbmNsdWRlICJody9pMzg2L3BjLmgiCisjaW5jbHVk
ZSAiaHcvcGNpLWhvc3QvaTQ0MGZ4LmgiCisKIFBDSUJ1cyAqZmluZF9pNDQwZngodm9pZCkKIHsK
ICAgICByZXR1cm4gTlVMTDsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
