Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14BD7BCC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:35:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPlJ-0006MS-Cz; Tue, 15 Oct 2019 16:33:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPlI-0006M1-BN
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:33:28 +0000
X-Inumbo-ID: 83fb29fe-ef69-11e9-bbab-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83fb29fe-ef69-11e9-bbab-bc764e2007e4;
 Tue, 15 Oct 2019 16:33:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61EB97BDA9;
 Tue, 15 Oct 2019 16:33:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F265B4100;
 Tue, 15 Oct 2019 16:33:15 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:27:04 +0200
Message-Id: <20191015162705.28087-32-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 15 Oct 2019 16:33:27 +0000 (UTC)
Subject: [Xen-devel] [PATCH 31/32] hw/pci-host: Rename incorrectly named
 'piix' as 'i440fx'
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KCldlIG1vdmVk
IGFsbCB0aGUgUElJWDMgc291dGhicmlkZ2UgY29kZSBvdXQgb2YgaHcvcGNpLWhvc3QvcGlpeC5j
LAppdCBub3cgb25seSBjb250YWlucyBpNDQwRlggbm9ydGhicmlkZ2UgY29kZS4KUmVuYW1lIGl0
IHRvIG1hdGNoIHRoZSBjaGlwc2V0IG1vZGVsbGVkLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIE1BSU5UQUlORVJTICAgICAg
ICAgICAgICAgICAgICAgIHwgMiArLQogaHcvaTM4Ni9LY29uZmlnICAgICAgICAgICAgICAgICAg
fCAyICstCiBody9wY2ktaG9zdC9LY29uZmlnICAgICAgICAgICAgICB8IDIgKy0KIGh3L3BjaS1o
b3N0L01ha2VmaWxlLm9ianMgICAgICAgIHwgMiArLQogaHcvcGNpLWhvc3Qve3BpaXguYyA9PiBp
NDQwZnguY30gfCAwCiA1IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKIHJlbmFtZSBody9wY2ktaG9zdC97cGlpeC5jID0+IGk0NDBmeC5jfSAoMTAwJSkKCmRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDQ4NDVmNDdkOTMuLjFi
Yzk5NTliOGEgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0x
MjI1LDcgKzEyMjUsNyBAQCBNOiBNYXJjZWwgQXBmZWxiYXVtIDxtYXJjZWwuYXBmZWxiYXVtQGdt
YWlsLmNvbT4KIFM6IFN1cHBvcnRlZAogRjogaW5jbHVkZS9ody9pMzg2LwogRjogaHcvaTM4Ni8K
LUY6IGh3L3BjaS1ob3N0L3BpaXguYworRjogaHcvcGNpLWhvc3QvaTQ0MGZ4LmMKIEY6IGh3L3Bj
aS1ob3N0L3EzNS5jCiBGOiBody9wY2ktaG9zdC9wYW0uYwogRjogaW5jbHVkZS9ody9wY2ktaG9z
dC9pNDQwZnguaApkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9LY29uZmlnIGIvaHcvaTM4Ni9LY29uZmln
CmluZGV4IDU4OWQ3NWUyNmEuLmNmZTk0YWVkZTcgMTAwNjQ0Ci0tLSBhL2h3L2kzODYvS2NvbmZp
ZworKysgYi9ody9pMzg2L0tjb25maWcKQEAgLTYwLDcgKzYwLDcgQEAgY29uZmlnIEk0NDBGWAog
ICAgIHNlbGVjdCBQQ19QQ0kKICAgICBzZWxlY3QgUENfQUNQSQogICAgIHNlbGVjdCBBQ1BJX1NN
QlVTCi0gICAgc2VsZWN0IFBDSV9QSUlYCisgICAgc2VsZWN0IFBDSV9JNDQwRlgKICAgICBzZWxl
Y3QgUElJWDMKICAgICBzZWxlY3QgSURFX1BJSVgKICAgICBzZWxlY3QgRElNTQpkaWZmIC0tZ2l0
IGEvaHcvcGNpLWhvc3QvS2NvbmZpZyBiL2h3L3BjaS1ob3N0L0tjb25maWcKaW5kZXggMzk3MDQz
YjI4OS4uYjBhYTgzNTFjNCAxMDA2NDQKLS0tIGEvaHcvcGNpLWhvc3QvS2NvbmZpZworKysgYi9o
dy9wY2ktaG9zdC9LY29uZmlnCkBAIC0yOCw3ICsyOCw3IEBAIGNvbmZpZyBQQ0lfU0FCUkUKICAg
ICBzZWxlY3QgUENJCiAgICAgYm9vbAogCi1jb25maWcgUENJX1BJSVgKK2NvbmZpZyBQQ0lfSTQ0
MEZYCiAgICAgYm9vbAogICAgIHNlbGVjdCBQQ0kKICAgICBzZWxlY3QgUEFNCmRpZmYgLS1naXQg
YS9ody9wY2ktaG9zdC9NYWtlZmlsZS5vYmpzIGIvaHcvcGNpLWhvc3QvTWFrZWZpbGUub2Jqcwpp
bmRleCBhOWNkM2UwMjJkLi5lZmQ3NTJiNzY2IDEwMDY0NAotLS0gYS9ody9wY2ktaG9zdC9NYWtl
ZmlsZS5vYmpzCisrKyBiL2h3L3BjaS1ob3N0L01ha2VmaWxlLm9ianMKQEAgLTEzLDcgKzEzLDcg
QEAgY29tbW9uLW9iai0kKENPTkZJR19WRVJTQVRJTEVfUENJKSArPSB2ZXJzYXRpbGUubwogCiBj
b21tb24tb2JqLSQoQ09ORklHX1BDSV9TQUJSRSkgKz0gc2FicmUubwogY29tbW9uLW9iai0kKENP
TkZJR19GVUxPTkcpICs9IGJvbml0by5vCi1jb21tb24tb2JqLSQoQ09ORklHX1BDSV9QSUlYKSAr
PSBwaWl4Lm8KK2NvbW1vbi1vYmotJChDT05GSUdfUENJX0k0NDBGWCkgKz0gaTQ0MGZ4Lm8KIGNv
bW1vbi1vYmotJChDT05GSUdfUENJX0VYUFJFU1NfUTM1KSArPSBxMzUubwogY29tbW9uLW9iai0k
KENPTkZJR19QQ0lfRVhQUkVTU19HRU5FUklDX0JSSURHRSkgKz0gZ3BleC5vCiBjb21tb24tb2Jq
LSQoQ09ORklHX1BDSV9FWFBSRVNTX1hJTElOWCkgKz0geGlsaW54LXBjaWUubwpkaWZmIC0tZ2l0
IGEvaHcvcGNpLWhvc3QvcGlpeC5jIGIvaHcvcGNpLWhvc3QvaTQ0MGZ4LmMKc2ltaWxhcml0eSBp
bmRleCAxMDAlCnJlbmFtZSBmcm9tIGh3L3BjaS1ob3N0L3BpaXguYwpyZW5hbWUgdG8gaHcvcGNp
LWhvc3QvaTQ0MGZ4LmMKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
