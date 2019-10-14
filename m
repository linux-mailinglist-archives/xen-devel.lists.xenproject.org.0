Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8828D6549
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:34:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1Lc-0000ep-PU; Mon, 14 Oct 2019 14:29:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1La-0000eQ-W3
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:29:19 +0000
X-Inumbo-ID: 0157b7f4-ee8f-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0157b7f4-ee8f-11e9-beca-bc764e2007e4;
 Mon, 14 Oct 2019 14:29:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B16E7190C018;
 Mon, 14 Oct 2019 14:29:17 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC02E600CD;
 Mon, 14 Oct 2019 14:28:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:38 +0200
Message-Id: <20191014142246.4538-13-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 14 Oct 2019 14:29:18 +0000 (UTC)
Subject: [Xen-devel] [PATCH 12/20] hw/acpi/cpu_hotplug: Include
 "hw/pci/pci.h"
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

aHcvYWNwaS9jcHVfaG90cGx1Zy5jIGNhbGxzIHBjaV9hZGRyZXNzX3NwYWNlX2lvKCkuIEluY2x1
ZGUKImh3L3BjaS9wY2kuaCIgd2hpY2ggZGVjbGFyZXMgaXQuCgpUaGlzIGZpeGVzICh3aGVuIG1v
ZGlmeWluZyB1bnJlbGF0ZWQgaGVhZGVycyk6CgogIGh3L2FjcGkvY3B1X2hvdHBsdWcuYzoxMDM6
Mjg6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAncGNpX2FkZHJlc3Nf
c3BhY2VfaW8nIGlzIGludmFsaWQgaW4gQzk5IFstV2Vycm9yLC1XaW1wbGljaXQtZnVuY3Rpb24t
ZGVjbGFyYXRpb25dCiAgICAgIE1lbW9yeVJlZ2lvbiAqcGFyZW50ID0gcGNpX2FkZHJlc3Nfc3Bh
Y2VfaW8oUENJX0RFVklDRShncGVfY3B1LT5kZXZpY2UpKTsKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QHJlZGhhdC5jb20+Ci0tLQogaHcvYWNwaS9jcHVfaG90cGx1Zy5jIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9ody9hY3BpL2NwdV9ob3RwbHVnLmMg
Yi9ody9hY3BpL2NwdV9ob3RwbHVnLmMKaW5kZXggNmU4MjkzYWFjOS4uN2ZiNjVkOTA2NSAxMDA2
NDQKLS0tIGEvaHcvYWNwaS9jcHVfaG90cGx1Zy5jCisrKyBiL2h3L2FjcGkvY3B1X2hvdHBsdWcu
YwpAQCAtMTQsNiArMTQsNyBAQAogI2luY2x1ZGUgInFhcGkvZXJyb3IuaCIKICNpbmNsdWRlICJo
dy9jb3JlL2NwdS5oIgogI2luY2x1ZGUgImh3L2kzODYvcGMuaCIKKyNpbmNsdWRlICJody9wY2kv
cGNpLmgiCiAjaW5jbHVkZSAicWVtdS9lcnJvci1yZXBvcnQuaCIKIAogI2RlZmluZSBDUFVfRUpF
Q1RfTUVUSE9EICJDUEVKIgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
