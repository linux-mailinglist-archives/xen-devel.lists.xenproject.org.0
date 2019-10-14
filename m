Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D21D654B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1OU-0001zp-Bu; Mon, 14 Oct 2019 14:32:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1OS-0001zX-OY
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:32:16 +0000
X-Inumbo-ID: 6b5b215e-ee8f-11e9-8aca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b5b215e-ee8f-11e9-8aca-bc764e2007e4;
 Mon, 14 Oct 2019 14:32:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A9DD7308FBB4;
 Mon, 14 Oct 2019 14:32:15 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8E70600CD;
 Mon, 14 Oct 2019 14:31:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:45 +0200
Message-Id: <20191014142246.4538-20-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 14 Oct 2019 14:32:15 +0000 (UTC)
Subject: [Xen-devel] [PATCH 19/20] hw/pci-host/q35: Remove unused includes
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

T25seSBxMzUuYyByZXF1aXJlcyBkZWNsYXJhdGlvbnMgZnJvbSAiaHcvaTM4Ni9wYy5oIiwgbW92
ZSBpdCB0aGVyZS4KUmVtb3ZlIGFsbCB0aGUgaW5jbHVkZXMgbm90IHVzZWQgYnkgInEzNS5oIi4K
ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNv
bT4KLS0tCiBody9wY2ktaG9zdC9xMzUuYyAgICAgICAgIHwgMSArCiBpbmNsdWRlL2h3L3BjaS1o
b3N0L3EzNS5oIHwgNyAtLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L3BjaS1ob3N0L3EzNS5jIGIvaHcvcGNpLWhv
c3QvcTM1LmMKaW5kZXggMTU4ZDI3MGI5Zi4uOTE4ODQzZDM3MyAxMDA2NDQKLS0tIGEvaHcvcGNp
LWhvc3QvcTM1LmMKKysrIGIvaHcvcGNpLWhvc3QvcTM1LmMKQEAgLTI5LDYgKzI5LDcgQEAKICAq
LwogCiAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgorI2luY2x1ZGUgImh3L2kzODYvcGMuaCIKICNp
bmNsdWRlICJody9wY2ktaG9zdC9xMzUuaCIKICNpbmNsdWRlICJody9xZGV2LXByb3BlcnRpZXMu
aCIKICNpbmNsdWRlICJtaWdyYXRpb24vdm1zdGF0ZS5oIgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9o
dy9wY2ktaG9zdC9xMzUuaCBiL2luY2x1ZGUvaHcvcGNpLWhvc3QvcTM1LmgKaW5kZXggNzlhODhk
NjdiMS4uNTM0ZDkwZGJhZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody9wY2ktaG9zdC9xMzUuaAor
KysgYi9pbmNsdWRlL2h3L3BjaS1ob3N0L3EzNS5oCkBAIC0yMiwxNiArMjIsOSBAQAogI2lmbmRl
ZiBIV19RMzVfSAogI2RlZmluZSBIV19RMzVfSAogCi0jaW5jbHVkZSAiaHcvaXNhL2lzYS5oIgot
I2luY2x1ZGUgImh3L3N5c2J1cy5oIgotI2luY2x1ZGUgImh3L2kzODYvcGMuaCIKLSNpbmNsdWRl
ICJody9pc2EvYXBtLmgiCiAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgogI2luY2x1ZGUgImh3L3Bj
aS9wY2llX2hvc3QuaCIKLSNpbmNsdWRlICJody9hY3BpL2FjcGkuaCIKLSNpbmNsdWRlICJody9h
Y3BpL2ljaDkuaCIKICNpbmNsdWRlICJody9wY2ktaG9zdC9wYW0uaCIKLSNpbmNsdWRlICJody9p
Mzg2L2ludGVsX2lvbW11LmgiCiAjaW5jbHVkZSAicWVtdS9yYW5nZS5oIgogCiAjZGVmaW5lIFRZ
UEVfUTM1X0hPU1RfREVWSUNFICJxMzUtcGNpaG9zdCIKLS0gCjIuMjEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
