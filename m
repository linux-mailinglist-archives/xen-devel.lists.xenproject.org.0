Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69ABD7B8D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:30:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPgq-0003Me-Kk; Tue, 15 Oct 2019 16:28:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPgp-0003M8-By
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:28:51 +0000
X-Inumbo-ID: dee7d412-ef68-11e9-9396-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dee7d412-ef68-11e9-9396-12813bfff9fa;
 Tue, 15 Oct 2019 16:28:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2EED13E2AF;
 Tue, 15 Oct 2019 16:28:50 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25C5A19C5B;
 Tue, 15 Oct 2019 16:28:41 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:40 +0200
Message-Id: <20191015162705.28087-8-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 15 Oct 2019 16:28:50 +0000 (UTC)
Subject: [Xen-devel] [PATCH 07/32] MAINTAINERS: Keep PIIX4 South Bridge
 separate from PC Chipsets
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoZSBQSUlY
NCBTb3V0aGJyaWRnZSBpcyBub3QgdXNlZCBieSB0aGUgUEMgbWFjaGluZSwKYnV0IGJ5IHRoZSBN
YWx0YSBib2FyZCAoTUlQUykuIEFkZCBhIG5ldyBzZWN0aW9uIHRvCmtlZXAgaXQgY292ZXJlZC4K
ClN1Z2dlc3RlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KU2lnbmVk
LW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KLS0tCiBN
QUlOVEFJTkVSUyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5k
ZXggZmU0ZGM1MWIwOC4uYzlmNjI1ZmMyZSAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIv
TUFJTlRBSU5FUlMKQEAgLTEyMzAsNyArMTIzMCw2IEBAIEY6IGh3L3BjaS1ob3N0L3EzNS5jCiBG
OiBody9wY2ktaG9zdC9wYW0uYwogRjogaW5jbHVkZS9ody9wY2ktaG9zdC9xMzUuaAogRjogaW5j
bHVkZS9ody9wY2ktaG9zdC9wYW0uaAotRjogaHcvaXNhL3BpaXg0LmMKIEY6IGh3L2lzYS9scGNf
aWNoOS5jCiBGOiBody9pMmMvc21idXNfaWNoOS5jCiBGOiBody9hY3BpL3BpaXg0LmMKQEAgLTE3
MTYsNiArMTcxNSwxMiBAQCBGOiBody9kaXNwbGF5L2VkaWQqCiBGOiBpbmNsdWRlL2h3L2Rpc3Bs
YXkvZWRpZC5oCiBGOiBxZW11LWVkaWQuYwogCitQSUlYNCBTb3V0aCBCcmlkZ2UgKGk4MjM3MUFC
KQorTTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgorTTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KK1M6IE1haW50YWluZWQKK0Y6IGh3
L2lzYS9waWl4NC5jCisKIEZpcm13YXJlIGNvbmZpZ3VyYXRpb24gKGZ3X2NmZykKIE06IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KIFI6IExhc3psbyBFcnNlayA8
bGVyc2VrQHJlZGhhdC5jb20+Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
