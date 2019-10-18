Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E15DC685
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:51:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSc6-0004fP-7c; Fri, 18 Oct 2019 13:48:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLSc4-0004fA-FI
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:48:16 +0000
X-Inumbo-ID: ef0268de-f1ad-11e9-bbab-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef0268de-f1ad-11e9-bbab-bc764e2007e4;
 Fri, 18 Oct 2019 13:48:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E50093086E26;
 Fri, 18 Oct 2019 13:48:14 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29AE560BF4;
 Fri, 18 Oct 2019 13:48:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:35 +0200
Message-Id: <20191018134754.16362-2-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 18 Oct 2019 13:48:15 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 01/20] MAINTAINERS: Keep PIIX4 South Bridge
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoZSBQSUlY
NCBTb3V0aGJyaWRnZSBpcyBub3QgdXNlZCBieSB0aGUgUEMgbWFjaGluZSwKYnV0IGJ5IHRoZSBN
YWx0YSBib2FyZCAoTUlQUykuIEFkZCBhIG5ldyBzZWN0aW9uIHRvCmtlZXAgaXQgY292ZXJlZC4K
ClN1Z2dlc3RlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KUmV2aWV3
ZWQtYnk6IEFsZWtzYW5kYXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+Ci0tLQog
TUFJTlRBSU5FUlMgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmlu
ZGV4IGZlNGRjNTFiMDguLmM5ZjYyNWZjMmUgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBi
L01BSU5UQUlORVJTCkBAIC0xMjMwLDcgKzEyMzAsNiBAQCBGOiBody9wY2ktaG9zdC9xMzUuYwog
RjogaHcvcGNpLWhvc3QvcGFtLmMKIEY6IGluY2x1ZGUvaHcvcGNpLWhvc3QvcTM1LmgKIEY6IGlu
Y2x1ZGUvaHcvcGNpLWhvc3QvcGFtLmgKLUY6IGh3L2lzYS9waWl4NC5jCiBGOiBody9pc2EvbHBj
X2ljaDkuYwogRjogaHcvaTJjL3NtYnVzX2ljaDkuYwogRjogaHcvYWNwaS9waWl4NC5jCkBAIC0x
NzE2LDYgKzE3MTUsMTIgQEAgRjogaHcvZGlzcGxheS9lZGlkKgogRjogaW5jbHVkZS9ody9kaXNw
bGF5L2VkaWQuaAogRjogcWVtdS1lZGlkLmMKIAorUElJWDQgU291dGggQnJpZGdlIChpODIzNzFB
QikKK006IEhlcnbDqSBQb3Vzc2luZWF1IDxocG91c3NpbkByZWFjdG9zLm9yZz4KK006IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+CitTOiBNYWludGFpbmVkCitGOiBo
dy9pc2EvcGlpeDQuYworCiBGaXJtd2FyZSBjb25maWd1cmF0aW9uIChmd19jZmcpCiBNOiBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+CiBSOiBMYXN6bG8gRXJzZWsg
PGxlcnNla0ByZWRoYXQuY29tPgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
