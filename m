Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ECAD7B90
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:30:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPg0-000373-Hh; Tue, 15 Oct 2019 16:28:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPfz-00036i-Ib
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:27:59 +0000
X-Inumbo-ID: c00a7180-ef68-11e9-9396-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c00a7180-ef68-11e9-9396-12813bfff9fa;
 Tue, 15 Oct 2019 16:27:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8E843308FFB1;
 Tue, 15 Oct 2019 16:27:58 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5656B19C58;
 Tue, 15 Oct 2019 16:27:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:37 +0200
Message-Id: <20191015162705.28087-5-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 15 Oct 2019 16:27:58 +0000 (UTC)
Subject: [Xen-devel] [PATCH 04/32] mc146818rtc: Move RTC_ISA_IRQ definition
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoZSBJU0Eg
ZGVmYXVsdCBudW1iZXIgZm9yIHRoZSBSVEMgZGV2aWNlcyBpcyBub3QgcmVsYXRlZCB0byBpdHMK
cmVnaXN0ZXJzIG5laXRoZXIuIE1vdmUgdGhpcyBkZWZpbml0aW9uIHRvICJody90aW1lci9tYzE0
NjgxOHJ0Yy5oIi4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGls
bWRAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2h3L3RpbWVyL21jMTQ2ODE4cnRjLmggICAgICB8
IDIgKysKIGluY2x1ZGUvaHcvdGltZXIvbWMxNDY4MThydGNfcmVncy5oIHwgMiAtLQogdGVzdHMv
cnRjLXRlc3QuYyAgICAgICAgICAgICAgICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvdGlt
ZXIvbWMxNDY4MThydGMuaCBiL2luY2x1ZGUvaHcvdGltZXIvbWMxNDY4MThydGMuaAppbmRleCAw
ZjFjODg2ZTViLi4xNzc2MWNmNmQ5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3RpbWVyL21jMTQ2
ODE4cnRjLmgKKysrIGIvaW5jbHVkZS9ody90aW1lci9tYzE0NjgxOHJ0Yy5oCkBAIC0zOSw2ICsz
OSw4IEBAIHR5cGVkZWYgc3RydWN0IFJUQ1N0YXRlIHsKICAgICBRTElTVF9FTlRSWShSVENTdGF0
ZSkgbGluazsKIH0gUlRDU3RhdGU7CiAKKyNkZWZpbmUgUlRDX0lTQV9JUlEgOAorCiBJU0FEZXZp
Y2UgKm1jMTQ2ODE4X3J0Y19pbml0KElTQUJ1cyAqYnVzLCBpbnQgYmFzZV95ZWFyLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBxZW11X2lycSBpbnRlcmNlcHRfaXJxKTsKIHZvaWQgcnRj
X3NldF9tZW1vcnkoSVNBRGV2aWNlICpkZXYsIGludCBhZGRyLCBpbnQgdmFsKTsKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvaHcvdGltZXIvbWMxNDY4MThydGNfcmVncy5oIGIvaW5jbHVkZS9ody90aW1l
ci9tYzE0NjgxOHJ0Y19yZWdzLmgKaW5kZXggYmZiYjU3ZTU3MC4uNjMxZjcxY2ZkOSAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9ody90aW1lci9tYzE0NjgxOHJ0Y19yZWdzLmgKKysrIGIvaW5jbHVkZS9o
dy90aW1lci9tYzE0NjgxOHJ0Y19yZWdzLmgKQEAgLTI3LDggKzI3LDYgQEAKIAogI2luY2x1ZGUg
InFlbXUvdGltZXIuaCIKIAotI2RlZmluZSBSVENfSVNBX0lSUSA4Ci0KICNkZWZpbmUgUlRDX1NF
Q09ORFMgICAgICAgICAgICAgMAogI2RlZmluZSBSVENfU0VDT05EU19BTEFSTSAgICAgICAxCiAj
ZGVmaW5lIFJUQ19NSU5VVEVTICAgICAgICAgICAgIDIKZGlmZiAtLWdpdCBhL3Rlc3RzL3J0Yy10
ZXN0LmMgYi90ZXN0cy9ydGMtdGVzdC5jCmluZGV4IDYzMDliMGVmNmMuLjE4Zjg5NTY5MGYgMTAw
NjQ0Ci0tLSBhL3Rlc3RzL3J0Yy10ZXN0LmMKKysrIGIvdGVzdHMvcnRjLXRlc3QuYwpAQCAtMTUs
NiArMTUsNyBAQAogCiAjaW5jbHVkZSAibGlicXRlc3Qtc2luZ2xlLmgiCiAjaW5jbHVkZSAicWVt
dS90aW1lci5oIgorI2luY2x1ZGUgImh3L3RpbWVyL21jMTQ2ODE4cnRjLmgiCiAjaW5jbHVkZSAi
aHcvdGltZXIvbWMxNDY4MThydGNfcmVncy5oIgogCiAjZGVmaW5lIFVJUF9IT0xEX0xFTkdUSCAg
ICAgICAgICAgKDggKiBOQU5PU0VDT05EU19QRVJfU0VDT05EIC8gMzI3NjgpCi0tIAoyLjIxLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
