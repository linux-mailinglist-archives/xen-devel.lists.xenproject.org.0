Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF43D6535
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:31:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1M1-0000kR-40; Mon, 14 Oct 2019 14:29:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1Lz-0000jr-57
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:29:43 +0000
X-Inumbo-ID: 0fcaf5e4-ee8f-11e9-937f-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fcaf5e4-ee8f-11e9-937f-12813bfff9fa;
 Mon, 14 Oct 2019 14:29:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 168D7300BEAF;
 Mon, 14 Oct 2019 14:29:42 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28912600CD;
 Mon, 14 Oct 2019 14:29:17 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:39 +0200
Message-Id: <20191014142246.4538-14-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 14 Oct 2019 14:29:42 +0000 (UTC)
Subject: [Xen-devel] [PATCH 13/20] hw/timer/hpet: Include
 "exec/address-spaces.h"
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

aHcvdGltZXIvaHBldC5jIGNhbGxzIGFkZHJlc3Nfc3BhY2Vfc3RsX2xlKCkgZGVjbGFyZWQgaW4K
ImV4ZWMvYWRkcmVzcy1zcGFjZXMuaCIuIEluY2x1ZGUgaXQuCgpUaGlzIGZpeGVzICh3aGVuIG1v
ZGlmeWluZyB1bnJlbGF0ZWQgaGVhZGVycyk6CgogIGh3L3RpbWVyL2hwZXQuYzoyMTA6MzE6IGVy
cm9yOiB1c2Ugb2YgdW5kZWNsYXJlZCBpZGVudGlmaWVyICdhZGRyZXNzX3NwYWNlX21lbW9yeScK
ICAgICAgICAgIGFkZHJlc3Nfc3BhY2Vfc3RsX2xlKCZhZGRyZXNzX3NwYWNlX21lbW9yeSwgdGlt
ZXItPmZzYiA+PiAzMiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+CgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QHJlZGhhdC5jb20+Ci0tLQogaHcvdGltZXIvaHBldC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9ody90aW1lci9ocGV0LmMgYi9ody90aW1lci9o
cGV0LmMKaW5kZXggNDc3MmNjY2ZlMy4uNjU4OWQ2M2ViYiAxMDA2NDQKLS0tIGEvaHcvdGltZXIv
aHBldC5jCisrKyBiL2h3L3RpbWVyL2hwZXQuYwpAQCAtMzUsNiArMzUsNyBAQAogI2luY2x1ZGUg
Imh3L3RpbWVyL21jMTQ2ODE4cnRjLmgiCiAjaW5jbHVkZSAibWlncmF0aW9uL3Ztc3RhdGUuaCIK
ICNpbmNsdWRlICJody90aW1lci9pODI1NC5oIgorI2luY2x1ZGUgImV4ZWMvYWRkcmVzcy1zcGFj
ZXMuaCIKIAogLy8jZGVmaW5lIEhQRVRfREVCVUcKICNpZmRlZiBIUEVUX0RFQlVHCi0tIAoyLjIx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
