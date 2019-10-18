Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD3EDC680
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:51:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLScn-0004pr-Ib; Fri, 18 Oct 2019 13:49:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLScl-0004p8-HP
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:48:59 +0000
X-Inumbo-ID: 08f531f4-f1ae-11e9-93f5-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08f531f4-f1ae-11e9-93f5-12813bfff9fa;
 Fri, 18 Oct 2019 13:48:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 889DFC057F2C;
 Fri, 18 Oct 2019 13:48:58 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51D6460BF1;
 Fri, 18 Oct 2019 13:48:50 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:39 +0200
Message-Id: <20191018134754.16362-6-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 18 Oct 2019 13:48:58 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 05/20] piix4: Rename PIIX4 object to piix4-isa
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

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKT3RoZXIgcGlp
eDQgcGFydHMgYXJlIGFscmVhZHkgbmFtZWQgcGlpeDQtaWRlIGFuZCBwaWl4NC11c2ItdWhjaS4K
ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgpB
Y2tlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEhlcnbDqSBQ
b3Vzc2luZWF1IDxocG91c3NpbkByZWFjdG9zLm9yZz4KTWVzc2FnZS1JZDogPDIwMTcxMjE2MDkw
MjI4LjI4NTA1LTE1LWhwb3Vzc2luQHJlYWN0b3Mub3JnPgpSZXZpZXdlZC1ieTogQWxla3NhbmRh
ciBNYXJrb3ZpYyA8YW1hcmtvdmljQHdhdmVjb21wLmNvbT4KW1BNRDogcmViYXNlZF0KU2lnbmVk
LW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0K
IGh3L2lzYS9waWl4NC5jICAgICAgIHwgMSAtCiBody9taXBzL21pcHNfbWFsdGEuYyB8IDIgKy0K
IGluY2x1ZGUvaHcvaXNhL2lzYS5oIHwgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvaXNhL3BpaXg0LmMgYi9ody9p
c2EvcGlpeDQuYwppbmRleCA5YzM3Yzg1YWUyLi5hYzkzODNhNjU4IDEwMDY0NAotLS0gYS9ody9p
c2EvcGlpeDQuYworKysgYi9ody9pc2EvcGlpeDQuYwpAQCAtNDUsNyArNDUsNiBAQCB0eXBlZGVm
IHN0cnVjdCBQSUlYNFN0YXRlIHsKICAgICB1aW50OF90IHJjcjsKIH0gUElJWDRTdGF0ZTsKIAot
I2RlZmluZSBUWVBFX1BJSVg0X1BDSV9ERVZJQ0UgIlBJSVg0IgogI2RlZmluZSBQSUlYNF9QQ0lf
REVWSUNFKG9iaikgXAogICAgIE9CSkVDVF9DSEVDSyhQSUlYNFN0YXRlLCAob2JqKSwgVFlQRV9Q
SUlYNF9QQ0lfREVWSUNFKQogCmRpZmYgLS1naXQgYS9ody9taXBzL21pcHNfbWFsdGEuYyBiL2h3
L21pcHMvbWlwc19tYWx0YS5jCmluZGV4IDdkMjVhYjZjMjMuLmU0OTliN2E2YmIgMTAwNjQ0Ci0t
LSBhL2h3L21pcHMvbWlwc19tYWx0YS5jCisrKyBiL2h3L21pcHMvbWlwc19tYWx0YS5jCkBAIC0x
NDE0LDcgKzE0MTQsNyBAQCB2b2lkIG1pcHNfbWFsdGFfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hp
bmUpCiAgICAgaWRlX2RyaXZlX2dldChoZCwgQVJSQVlfU0laRShoZCkpOwogCiAgICAgcGNpID0g
cGNpX2NyZWF0ZV9zaW1wbGVfbXVsdGlmdW5jdGlvbihwY2lfYnVzLCBQQ0lfREVWRk4oMTAsIDAp
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSwgIlBJSVg0
Iik7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlLCBUWVBF
X1BJSVg0X1BDSV9ERVZJQ0UpOwogICAgIGRldiA9IERFVklDRShwY2kpOwogICAgIGlzYV9idXMg
PSBJU0FfQlVTKHFkZXZfZ2V0X2NoaWxkX2J1cyhkZXYsICJpc2EuMCIpKTsKICAgICBwaWl4NF9k
ZXZmbiA9IHBjaS0+ZGV2Zm47CmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2lzYS9pc2EuaCBiL2lu
Y2x1ZGUvaHcvaXNhL2lzYS5oCmluZGV4IDAxOGFkYTRmNmYuLjc5ZjcwM2ZkNmMgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvaHcvaXNhL2lzYS5oCisrKyBiL2luY2x1ZGUvaHcvaXNhL2lzYS5oCkBAIC0x
NDcsNCArMTQ3LDYgQEAgc3RhdGljIGlubGluZSBJU0FCdXMgKmlzYV9idXNfZnJvbV9kZXZpY2Uo
SVNBRGV2aWNlICpkKQogICAgIHJldHVybiBJU0FfQlVTKHFkZXZfZ2V0X3BhcmVudF9idXMoREVW
SUNFKGQpKSk7CiB9CiAKKyNkZWZpbmUgVFlQRV9QSUlYNF9QQ0lfREVWSUNFICJwaWl4NC1pc2Ei
CisKICNlbmRpZgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
