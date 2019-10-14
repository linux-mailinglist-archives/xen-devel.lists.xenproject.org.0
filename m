Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74037D6519
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1Hp-0008BH-Vn; Mon, 14 Oct 2019 14:25:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1Ho-0008B5-Ly
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:25:24 +0000
X-Inumbo-ID: 75c8fbda-ee8e-11e9-937f-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75c8fbda-ee8e-11e9-937f-12813bfff9fa;
 Mon, 14 Oct 2019 14:25:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AAB8044BCF;
 Mon, 14 Oct 2019 14:25:23 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD8DF600CD;
 Mon, 14 Oct 2019 14:24:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:31 +0200
Message-Id: <20191014142246.4538-6-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 14 Oct 2019 14:25:23 +0000 (UTC)
Subject: [Xen-devel] [PATCH 05/20] hw/timer: Remove unused "ui/console.h"
 header
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

VGhlIHRpbWVyIG1vZGVscyBkb24ndCBuZWVkIGFueXRoaW5nIGZyb20gInVpL2NvbnNvbGUuaCIu
ClJlbW92ZSBpdC4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGls
bWRAcmVkaGF0LmNvbT4KLS0tCiBody90aW1lci9ocGV0LmMgICAgIHwgMSAtCiBody90aW1lci90
d2w5MjIzMC5jIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvaHcvdGltZXIvaHBldC5jIGIvaHcvdGltZXIvaHBldC5jCmluZGV4IDFkZGFlNGU3ZDcu
LjQ3NzJjY2NmZTMgMTAwNjQ0Ci0tLSBhL2h3L3RpbWVyL2hwZXQuYworKysgYi9ody90aW1lci9o
cGV0LmMKQEAgLTI3LDcgKzI3LDYgQEAKICNpbmNsdWRlICJxZW11L29zZGVwLmgiCiAjaW5jbHVk
ZSAiaHcvaTM4Ni9wYy5oIgogI2luY2x1ZGUgImh3L2lycS5oIgotI2luY2x1ZGUgInVpL2NvbnNv
bGUuaCIKICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiCiAjaW5jbHVkZSAicWVtdS9lcnJvci1yZXBv
cnQuaCIKICNpbmNsdWRlICJxZW11L3RpbWVyLmgiCmRpZmYgLS1naXQgYS9ody90aW1lci90d2w5
MjIzMC5jIGIvaHcvdGltZXIvdHdsOTIyMzAuYwppbmRleCA2M2JkMTNkMmNhLi5kMDAxMWJlODll
IDEwMDY0NAotLS0gYS9ody90aW1lci90d2w5MjIzMC5jCisrKyBiL2h3L3RpbWVyL3R3bDkyMjMw
LmMKQEAgLTI3LDcgKzI3LDYgQEAKICNpbmNsdWRlICJtaWdyYXRpb24vcWVtdS1maWxlLXR5cGVz
LmgiCiAjaW5jbHVkZSAibWlncmF0aW9uL3Ztc3RhdGUuaCIKICNpbmNsdWRlICJzeXNlbXUvc3lz
ZW11LmgiCi0jaW5jbHVkZSAidWkvY29uc29sZS5oIgogI2luY2x1ZGUgInFlbXUvYmNkLmgiCiAj
aW5jbHVkZSAicWVtdS9tb2R1bGUuaCIKIAotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
