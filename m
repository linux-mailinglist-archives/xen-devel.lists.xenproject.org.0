Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2496AD6527
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:29:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1Gd-0007xE-1F; Mon, 14 Oct 2019 14:24:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1Gb-0007x3-4L
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:24:09 +0000
X-Inumbo-ID: 481bf733-ee8e-11e9-937f-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 481bf733-ee8e-11e9-937f-12813bfff9fa;
 Mon, 14 Oct 2019 14:24:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 112BA3086228;
 Mon, 14 Oct 2019 14:24:08 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B130D600CD;
 Mon, 14 Oct 2019 14:23:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:28 +0200
Message-Id: <20191014142246.4538-3-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 14 Oct 2019 14:24:08 +0000 (UTC)
Subject: [Xen-devel] [PATCH 02/20] hw/southbridge/ich9: Removed unused
 headers
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIElDSDkgY2hpcHNldCBpcyBub3QgWDg2L1BDIHNwZWNpZmljLgoKVGhlc2UgZmlsZXMgZG9u
J3QgdXNlIGFueXRoaW5nIGRlY2xhcmVkIGJ5IHRoZSAiaHcvaTM4Ni9wYy5oIgpvciAiaHcvaTM4
Ni9pb2FwaWMuaCIgaGVhZGVycy4gUmVtb3ZlIHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvYWNwaS9pY2g5LmMg
ICAgICAgICB8IDEgLQogaHcvaXNhL2xwY19pY2g5LmMgICAgICB8IDIgLS0KIGluY2x1ZGUvaHcv
aTM4Ni9pY2g5LmggfCAxIC0KIDMgZmlsZXMgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9ody9hY3BpL2ljaDkuYyBiL2h3L2FjcGkvaWNoOS5jCmluZGV4IDIwMzRkZDc0OWUu
LmZkZDBhNmM3OWUgMTAwNjQ0Ci0tLSBhL2h3L2FjcGkvaWNoOS5jCisrKyBiL2h3L2FjcGkvaWNo
OS5jCkBAIC0yNyw3ICsyNyw2IEBACiAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgogI2luY2x1ZGUg
InFhcGkvZXJyb3IuaCIKICNpbmNsdWRlICJxYXBpL3Zpc2l0b3IuaCIKLSNpbmNsdWRlICJody9p
Mzg2L3BjLmgiCiAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgogI2luY2x1ZGUgIm1pZ3JhdGlvbi92
bXN0YXRlLmgiCiAjaW5jbHVkZSAicWVtdS90aW1lci5oIgpkaWZmIC0tZ2l0IGEvaHcvaXNhL2xw
Y19pY2g5LmMgYi9ody9pc2EvbHBjX2ljaDkuYwppbmRleCAxN2MyOTJlMzA2Li42MWNlZTJhZTNh
IDEwMDY0NAotLS0gYS9ody9pc2EvbHBjX2ljaDkuYworKysgYi9ody9pc2EvbHBjX2ljaDkuYwpA
QCAtMzUsMTAgKzM1LDggQEAKICNpbmNsdWRlICJody9pc2EvaXNhLmgiCiAjaW5jbHVkZSAiaHcv
c3lzYnVzLmgiCiAjaW5jbHVkZSAibWlncmF0aW9uL3Ztc3RhdGUuaCIKLSNpbmNsdWRlICJody9p
Mzg2L3BjLmgiCiAjaW5jbHVkZSAiaHcvaXJxLmgiCiAjaW5jbHVkZSAiaHcvaXNhL2FwbS5oIgot
I2luY2x1ZGUgImh3L2kzODYvaW9hcGljLmgiCiAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgogI2lu
Y2x1ZGUgImh3L3BjaS9wY2lfYnJpZGdlLmgiCiAjaW5jbHVkZSAiaHcvaTM4Ni9pY2g5LmgiCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2h3L2kzODYvaWNoOS5oIGIvaW5jbHVkZS9ody9pMzg2L2ljaDku
aAppbmRleCA3MmU4MDNmNmUyLi5hOThkMTBiMjUyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L2kz
ODYvaWNoOS5oCisrKyBiL2luY2x1ZGUvaHcvaTM4Ni9pY2g5LmgKQEAgLTUsNyArNSw2IEBACiAj
aW5jbHVkZSAiaHcvc3lzYnVzLmgiCiAjaW5jbHVkZSAiaHcvaTM4Ni9wYy5oIgogI2luY2x1ZGUg
Imh3L2lzYS9hcG0uaCIKLSNpbmNsdWRlICJody9pMzg2L2lvYXBpYy5oIgogI2luY2x1ZGUgImh3
L3BjaS9wY2kuaCIKICNpbmNsdWRlICJody9wY2kvcGNpZV9ob3N0LmgiCiAjaW5jbHVkZSAiaHcv
cGNpL3BjaV9icmlkZ2UuaCIKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
