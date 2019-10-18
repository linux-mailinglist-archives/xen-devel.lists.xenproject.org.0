Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C813DC699
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:54:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSfI-0006fL-H5; Fri, 18 Oct 2019 13:51:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLSfG-0006eM-Rt
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:51:34 +0000
X-Inumbo-ID: 6535eb98-f1ae-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6535eb98-f1ae-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 13:51:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5F55F3073880;
 Fri, 18 Oct 2019 13:51:33 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3F5560BF1;
 Fri, 18 Oct 2019 13:51:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:53 +0200
Message-Id: <20191018134754.16362-20-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 18 Oct 2019 13:51:33 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 19/20] hw/pci-host: Rename incorrectly named
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KCldlIG1vdmVk
IGFsbCB0aGUgUElJWDMgc291dGhicmlkZ2UgY29kZSBvdXQgb2YgaHcvcGNpLWhvc3QvcGlpeC5j
LAppdCBub3cgb25seSBjb250YWlucyBpNDQwRlggbm9ydGhicmlkZ2UgY29kZS4KUmVuYW1lIGl0
IHRvIG1hdGNoIHRoZSBjaGlwc2V0IG1vZGVsbGVkLgoKUmV2aWV3ZWQtYnk6IEFsZWtzYW5kYXIg
TWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KIGh3L2kzODYvS2NvbmZpZyAgICAgICAgICAgICAgICAg
IHwgMiArLQogaHcvcGNpLWhvc3QvS2NvbmZpZyAgICAgICAgICAgICAgfCAyICstCiBody9wY2kt
aG9zdC9NYWtlZmlsZS5vYmpzICAgICAgICB8IDIgKy0KIGh3L3BjaS1ob3N0L3twaWl4LmMgPT4g
aTQ0MGZ4LmN9IHwgMAogNSBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCiByZW5hbWUgaHcvcGNpLWhvc3Qve3BpaXguYyA9PiBpNDQwZnguY30gKDEwMCUpCgpk
aWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA0ODQ1ZjQ3ZDkzLi4x
YmM5OTU5YjhhIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAt
MTIyNSw3ICsxMjI1LDcgQEAgTTogTWFyY2VsIEFwZmVsYmF1bSA8bWFyY2VsLmFwZmVsYmF1bUBn
bWFpbC5jb20+CiBTOiBTdXBwb3J0ZWQKIEY6IGluY2x1ZGUvaHcvaTM4Ni8KIEY6IGh3L2kzODYv
Ci1GOiBody9wY2ktaG9zdC9waWl4LmMKK0Y6IGh3L3BjaS1ob3N0L2k0NDBmeC5jCiBGOiBody9w
Y2ktaG9zdC9xMzUuYwogRjogaHcvcGNpLWhvc3QvcGFtLmMKIEY6IGluY2x1ZGUvaHcvcGNpLWhv
c3QvaTQ0MGZ4LmgKZGlmZiAtLWdpdCBhL2h3L2kzODYvS2NvbmZpZyBiL2h3L2kzODYvS2NvbmZp
ZwppbmRleCA1ODlkNzVlMjZhLi5jZmU5NGFlZGU3IDEwMDY0NAotLS0gYS9ody9pMzg2L0tjb25m
aWcKKysrIGIvaHcvaTM4Ni9LY29uZmlnCkBAIC02MCw3ICs2MCw3IEBAIGNvbmZpZyBJNDQwRlgK
ICAgICBzZWxlY3QgUENfUENJCiAgICAgc2VsZWN0IFBDX0FDUEkKICAgICBzZWxlY3QgQUNQSV9T
TUJVUwotICAgIHNlbGVjdCBQQ0lfUElJWAorICAgIHNlbGVjdCBQQ0lfSTQ0MEZYCiAgICAgc2Vs
ZWN0IFBJSVgzCiAgICAgc2VsZWN0IElERV9QSUlYCiAgICAgc2VsZWN0IERJTU0KZGlmZiAtLWdp
dCBhL2h3L3BjaS1ob3N0L0tjb25maWcgYi9ody9wY2ktaG9zdC9LY29uZmlnCmluZGV4IDM5NzA0
M2IyODkuLmIwYWE4MzUxYzQgMTAwNjQ0Ci0tLSBhL2h3L3BjaS1ob3N0L0tjb25maWcKKysrIGIv
aHcvcGNpLWhvc3QvS2NvbmZpZwpAQCAtMjgsNyArMjgsNyBAQCBjb25maWcgUENJX1NBQlJFCiAg
ICAgc2VsZWN0IFBDSQogICAgIGJvb2wKIAotY29uZmlnIFBDSV9QSUlYCitjb25maWcgUENJX0k0
NDBGWAogICAgIGJvb2wKICAgICBzZWxlY3QgUENJCiAgICAgc2VsZWN0IFBBTQpkaWZmIC0tZ2l0
IGEvaHcvcGNpLWhvc3QvTWFrZWZpbGUub2JqcyBiL2h3L3BjaS1ob3N0L01ha2VmaWxlLm9ianMK
aW5kZXggYTljZDNlMDIyZC4uZWZkNzUyYjc2NiAxMDA2NDQKLS0tIGEvaHcvcGNpLWhvc3QvTWFr
ZWZpbGUub2JqcworKysgYi9ody9wY2ktaG9zdC9NYWtlZmlsZS5vYmpzCkBAIC0xMyw3ICsxMyw3
IEBAIGNvbW1vbi1vYmotJChDT05GSUdfVkVSU0FUSUxFX1BDSSkgKz0gdmVyc2F0aWxlLm8KIAog
Y29tbW9uLW9iai0kKENPTkZJR19QQ0lfU0FCUkUpICs9IHNhYnJlLm8KIGNvbW1vbi1vYmotJChD
T05GSUdfRlVMT05HKSArPSBib25pdG8ubwotY29tbW9uLW9iai0kKENPTkZJR19QQ0lfUElJWCkg
Kz0gcGlpeC5vCitjb21tb24tb2JqLSQoQ09ORklHX1BDSV9JNDQwRlgpICs9IGk0NDBmeC5vCiBj
b21tb24tb2JqLSQoQ09ORklHX1BDSV9FWFBSRVNTX1EzNSkgKz0gcTM1Lm8KIGNvbW1vbi1vYmot
JChDT05GSUdfUENJX0VYUFJFU1NfR0VORVJJQ19CUklER0UpICs9IGdwZXgubwogY29tbW9uLW9i
ai0kKENPTkZJR19QQ0lfRVhQUkVTU19YSUxJTlgpICs9IHhpbGlueC1wY2llLm8KZGlmZiAtLWdp
dCBhL2h3L3BjaS1ob3N0L3BpaXguYyBiL2h3L3BjaS1ob3N0L2k0NDBmeC5jCnNpbWlsYXJpdHkg
aW5kZXggMTAwJQpyZW5hbWUgZnJvbSBody9wY2ktaG9zdC9waWl4LmMKcmVuYW1lIHRvIGh3L3Bj
aS1ob3N0L2k0NDBmeC5jCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
