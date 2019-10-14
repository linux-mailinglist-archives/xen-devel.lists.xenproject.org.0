Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B481AD6547
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:34:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1Na-0001lb-KM; Mon, 14 Oct 2019 14:31:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1NZ-0001lO-Oa
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:31:21 +0000
X-Inumbo-ID: 4a903c34-ee8f-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a903c34-ee8f-11e9-beca-bc764e2007e4;
 Mon, 14 Oct 2019 14:31:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AA45476525;
 Mon, 14 Oct 2019 14:31:20 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 995CB60126;
 Mon, 14 Oct 2019 14:30:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:43 +0200
Message-Id: <20191014142246.4538-18-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 14 Oct 2019 14:31:20 +0000 (UTC)
Subject: [Xen-devel] [PATCH 17/20] hw/acpi: Include "hw/mem/nvdimm.h"
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

Qm90aCBpY2g5LmMgYW5kIHBpaXg0LmMgdXNlIG1ldGhvZHMvZGVmaW5pdGlvbnMgZGVjbGFyZWQg
aW4gdGhlCk5WRElNTSBkZXZpY2UgaGVhZGVyLiBJbmNsdWRlIGl0LgoKVGhpcyBmaXhlcyAod2hl
biBtb2RpZnlpbmcgdW5yZWxhdGVkIGhlYWRlcnMpOgoKICBody9hY3BpL2ljaDkuYzo1MDc6NDY6
IGVycm9yOiB1c2Ugb2YgdW5kZWNsYXJlZCBpZGVudGlmaWVyICdUWVBFX05WRElNTScKICAgICAg
ICBpZiAob2JqZWN0X2R5bmFtaWNfY2FzdChPQkpFQ1QoZGV2KSwgVFlQRV9OVkRJTU0pKSB7CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICBody9hY3BpL2lj
aDkuYzo1MDg6MTM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnbnZk
aW1tX2FjcGlfcGx1Z19jYicgaXMgaW52YWxpZCBpbiBDOTkgWy1XZXJyb3IsLVdpbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgICAgICAgICAgbnZkaW1tX2FjcGlfcGx1Z19jYihob3Rw
bHVnX2RldiwgZGV2KTsKICAgICAgICAgICAgXgogIGh3L2FjcGkvcGlpeDQuYzo0MDM6NDY6IGVy
cm9yOiB1c2Ugb2YgdW5kZWNsYXJlZCBpZGVudGlmaWVyICdUWVBFX05WRElNTScKICAgICAgICBp
ZiAob2JqZWN0X2R5bmFtaWNfY2FzdChPQkpFQ1QoZGV2KSwgVFlQRV9OVkRJTU0pKSB7CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICBody9hY3BpL3BpaXg0
LmM6NDA0OjEzOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ252ZGlt
bV9hY3BpX3BsdWdfY2InIGlzIGludmFsaWQgaW4gQzk5IFstV2Vycm9yLC1XaW1wbGljaXQtZnVu
Y3Rpb24tZGVjbGFyYXRpb25dCiAgICAgICAgICAgIG52ZGltbV9hY3BpX3BsdWdfY2IoaG90cGx1
Z19kZXYsIGRldik7CiAgICAgICAgICAgIF4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody9hY3BpL2ljaDkuYyAgfCAxICsK
IGh3L2FjcGkvcGlpeDQuYyB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9ody9hY3BpL2ljaDkuYyBiL2h3L2FjcGkvaWNoOS5jCmluZGV4IGZkZDBh
NmM3OWUuLjRlNzQyODRiNjUgMTAwNjQ0Ci0tLSBhL2h3L2FjcGkvaWNoOS5jCisrKyBiL2h3L2Fj
cGkvaWNoOS5jCkBAIC0zOSw2ICszOSw3IEBACiAKICNpbmNsdWRlICJody9pMzg2L2ljaDkuaCIK
ICNpbmNsdWRlICJody9tZW0vcGMtZGltbS5oIgorI2luY2x1ZGUgImh3L21lbS9udmRpbW0uaCIK
IAogLy8jZGVmaW5lIERFQlVHCiAKZGlmZiAtLWdpdCBhL2h3L2FjcGkvcGlpeDQuYyBiL2h3L2Fj
cGkvcGlpeDQuYwppbmRleCA1NzQyYzNkZjg3Li4xMWEzZTMzZTViIDEwMDY0NAotLS0gYS9ody9h
Y3BpL3BpaXg0LmMKKysrIGIvaHcvYWNwaS9waWl4NC5jCkBAIC0zOSw2ICszOSw3IEBACiAjaW5j
bHVkZSAiaHcvYWNwaS9jcHUuaCIKICNpbmNsdWRlICJody9ob3RwbHVnLmgiCiAjaW5jbHVkZSAi
aHcvbWVtL3BjLWRpbW0uaCIKKyNpbmNsdWRlICJody9tZW0vbnZkaW1tLmgiCiAjaW5jbHVkZSAi
aHcvYWNwaS9tZW1vcnlfaG90cGx1Zy5oIgogI2luY2x1ZGUgImh3L2FjcGkvYWNwaV9kZXZfaW50
ZXJmYWNlLmgiCiAjaW5jbHVkZSAiaHcveGVuL3hlbi5oIgotLSAKMi4yMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
