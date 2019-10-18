Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB1DC697
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:53:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSeu-0006Rt-O0; Fri, 18 Oct 2019 13:51:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLSet-0006RL-Iw
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:51:11 +0000
X-Inumbo-ID: 57af7bb0-f1ae-11e9-93f5-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57af7bb0-f1ae-11e9-93f5-12813bfff9fa;
 Fri, 18 Oct 2019 13:51:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A594C308449B;
 Fri, 18 Oct 2019 13:51:10 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6ECF60BF1;
 Fri, 18 Oct 2019 13:50:56 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:51 +0200
Message-Id: <20191018134754.16362-18-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 18 Oct 2019 13:51:10 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 17/20] hw/pci-host/piix: Fix code style issues
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

V2Ugd2lsbCBtb3ZlIHRoaXMgY29kZSwgZml4IGl0cyBzdHlsZSBmaXJzdC4KClJldmlld2VkLWJ5
OiBBbGVrc2FuZGFyIE1hcmtvdmljIDxhbWFya292aWNAd2F2ZWNvbXAuY29tPgpTaWduZWQtb2Zm
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcv
cGNpLWhvc3QvcGlpeC5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L3BjaS1ob3N0L3BpaXguYyBiL2h3
L3BjaS1ob3N0L3BpaXguYwppbmRleCA5NWIwNDEyMmZhLi4xNTQ0YzQ3MjZiIDEwMDY0NAotLS0g
YS9ody9wY2ktaG9zdC9waWl4LmMKKysrIGIvaHcvcGNpLWhvc3QvcGlpeC5jCkBAIC0xMzMsOSAr
MTMzLDEwIEBAIHN0YXRpYyBQQ0lJTlR4Um91dGUgcGlpeDNfcm91dGVfaW50eF9waW5fdG9faXJx
KHZvaWQgKm9wYXF1ZSwgaW50IHBjaV9pbnR4KTsKIHN0YXRpYyB2b2lkIHBpaXgzX3dyaXRlX2Nv
bmZpZ194ZW4oUENJRGV2aWNlICpkZXYsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDMyX3QgYWRkcmVzcywgdWludDMyX3QgdmFsLCBpbnQgbGVuKTsKIAotLyogcmV0dXJuIHRo
ZSBnbG9iYWwgaXJxIG51bWJlciBjb3JyZXNwb25kaW5nIHRvIGEgZ2l2ZW4gZGV2aWNlIGlycQot
ICAgcGluLiBXZSBjb3VsZCBhbHNvIHVzZSB0aGUgYnVzIG51bWJlciB0byBoYXZlIGEgbW9yZSBw
cmVjaXNlCi0gICBtYXBwaW5nLiAqLworLyoKKyAqIFJldHVybiB0aGUgZ2xvYmFsIGlycSBudW1i
ZXIgY29ycmVzcG9uZGluZyB0byBhIGdpdmVuIGRldmljZSBpcnEKKyAqIHBpbi4gV2UgY291bGQg
YWxzbyB1c2UgdGhlIGJ1cyBudW1iZXIgdG8gaGF2ZSBhIG1vcmUgcHJlY2lzZSBtYXBwaW5nLgor
ICovCiBzdGF0aWMgaW50IHBjaV9zbG90X2dldF9waXJxKFBDSURldmljZSAqcGNpX2RldiwgaW50
IHBjaV9pbnR4KQogewogICAgIGludCBzbG90X2FkZGVuZDsKLS0gCjIuMjEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
