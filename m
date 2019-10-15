Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A20D7BCB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:35:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPky-0006CH-F8; Tue, 15 Oct 2019 16:33:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPkw-0006Bi-Hn
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:33:06 +0000
X-Inumbo-ID: 76f6074c-ef69-11e9-8aca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76f6074c-ef69-11e9-8aca-bc764e2007e4;
 Tue, 15 Oct 2019 16:33:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 873AB10C0928;
 Tue, 15 Oct 2019 16:33:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0753419C5B;
 Tue, 15 Oct 2019 16:32:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:27:02 +0200
Message-Id: <20191015162705.28087-30-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Tue, 15 Oct 2019 16:33:05 +0000 (UTC)
Subject: [Xen-devel] [PATCH 29/32] hw/pci-host/piix: Fix code style issues
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

V2Ugd2lsbCBtb3ZlIHRoaXMgY29kZSwgZml4IGl0cyBzdHlsZSBmaXJzdC4KClNpZ25lZC1vZmYt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody9w
Y2ktaG9zdC9waWl4LmMgfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvcGNpLWhvc3QvcGlpeC5jIGIvaHcv
cGNpLWhvc3QvcGlpeC5jCmluZGV4IDBiNWRhNWJjOTQuLjYxZjkxZmY1NjEgMTAwNjQ0Ci0tLSBh
L2h3L3BjaS1ob3N0L3BpaXguYworKysgYi9ody9wY2ktaG9zdC9waWl4LmMKQEAgLTEzMyw5ICsx
MzMsMTAgQEAgc3RhdGljIFBDSUlOVHhSb3V0ZSBwaWl4M19yb3V0ZV9pbnR4X3Bpbl90b19pcnEo
dm9pZCAqb3BhcXVlLCBpbnQgcGNpX2ludHgpOwogc3RhdGljIHZvaWQgcGlpeDNfd3JpdGVfY29u
ZmlnX3hlbihQQ0lEZXZpY2UgKmRldiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50MzJfdCBhZGRyZXNzLCB1aW50MzJfdCB2YWwsIGludCBsZW4pOwogCi0vKiByZXR1cm4gdGhl
IGdsb2JhbCBpcnEgbnVtYmVyIGNvcnJlc3BvbmRpbmcgdG8gYSBnaXZlbiBkZXZpY2UgaXJxCi0g
ICBwaW4uIFdlIGNvdWxkIGFsc28gdXNlIHRoZSBidXMgbnVtYmVyIHRvIGhhdmUgYSBtb3JlIHBy
ZWNpc2UKLSAgIG1hcHBpbmcuICovCisvKgorICogUmV0dXJuIHRoZSBnbG9iYWwgaXJxIG51bWJl
ciBjb3JyZXNwb25kaW5nIHRvIGEgZ2l2ZW4gZGV2aWNlIGlycQorICogcGluLiBXZSBjb3VsZCBh
bHNvIHVzZSB0aGUgYnVzIG51bWJlciB0byBoYXZlIGEgbW9yZSBwcmVjaXNlIG1hcHBpbmcuCisg
Ki8KIHN0YXRpYyBpbnQgcGNpX3Nsb3RfZ2V0X3BpcnEoUENJRGV2aWNlICpwY2lfZGV2LCBpbnQg
cGNpX2ludHgpCiB7CiAgICAgaW50IHNsb3RfYWRkZW5kOwotLSAKMi4yMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
