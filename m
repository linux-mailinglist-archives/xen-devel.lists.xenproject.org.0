Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27603D7BBB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:33:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPjt-0005eV-Om; Tue, 15 Oct 2019 16:32:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPjs-0005dg-4C
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:32:00 +0000
X-Inumbo-ID: 4f6dd48e-ef69-11e9-9397-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f6dd48e-ef69-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:31:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3628D316D8D1;
 Tue, 15 Oct 2019 16:31:59 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25ED519C58;
 Tue, 15 Oct 2019 16:31:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:57 +0200
Message-Id: <20191015162705.28087-25-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 15 Oct 2019 16:31:59 +0000 (UTC)
Subject: [Xen-devel] [PATCH 24/32] hw/i386/pc: Remove kvm_i386.h include
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

QnkgZXh0cmFjdGluZyBwY19nc2lfY3JlYXRlKCkgYW5kIHBjX2k4MjU5X2NyZWF0ZSgpIHdlIHJl
bW92ZWQKdGhlIGFjY2VzcyB0byAia3ZtX2kzODYuaCIgZnJvbSB0aGUgbWFjaGluZSBjb2RlLiBX
ZSBjYW4gbm93CnJlbW92ZSBpdC4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody9pMzg2L3BjX3BpaXguYyB8IDEgLQogaHcv
aTM4Ni9wY19xMzUuYyAgfCAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9ody9pMzg2L3BjX3BpaXguYyBiL2h3L2kzODYvcGNfcGlpeC5jCmluZGV4IDBh
NzE5M2EzY2MuLjViMzVmZjA0YzcgMTAwNjQ0Ci0tLSBhL2h3L2kzODYvcGNfcGlpeC5jCisrKyBi
L2h3L2kzODYvcGNfcGlpeC5jCkBAIC01Nyw3ICs1Nyw2IEBACiAjZW5kaWYKICNpbmNsdWRlICJt
aWdyYXRpb24vZ2xvYmFsX3N0YXRlLmgiCiAjaW5jbHVkZSAibWlncmF0aW9uL21pc2MuaCIKLSNp
bmNsdWRlICJrdm1faTM4Ni5oIgogI2luY2x1ZGUgInN5c2VtdS9udW1hLmgiCiAKICNkZWZpbmUg
TUFYX0lERV9CVVMgMgpkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9wY19xMzUuYyBiL2h3L2kzODYvcGNf
cTM1LmMKaW5kZXggZjRmYjlhMDJiYS4uMmU1ZDY4MjFmYiAxMDA2NDQKLS0tIGEvaHcvaTM4Ni9w
Y19xMzUuYworKysgYi9ody9pMzg2L3BjX3EzNS5jCkBAIC0zNiw3ICszNiw2IEBACiAjaW5jbHVk
ZSAiaHcvdGltZXIvbWMxNDY4MThydGMuaCIKICNpbmNsdWRlICJody94ZW4veGVuLmgiCiAjaW5j
bHVkZSAic3lzZW11L2t2bS5oIgotI2luY2x1ZGUgImt2bV9pMzg2LmgiCiAjaW5jbHVkZSAiaHcv
a3ZtL2Nsb2NrLmgiCiAjaW5jbHVkZSAiaHcvcGNpLWhvc3QvcTM1LmgiCiAjaW5jbHVkZSAiaHcv
cWRldi1wcm9wZXJ0aWVzLmgiCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
