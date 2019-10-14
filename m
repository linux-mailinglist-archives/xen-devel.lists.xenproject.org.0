Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E472D6512
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:25:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1GG-0007ty-Nn; Mon, 14 Oct 2019 14:23:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1GF-0007tq-6d
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:23:47 +0000
X-Inumbo-ID: 39e59fd8-ee8e-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39e59fd8-ee8e-11e9-beca-bc764e2007e4;
 Mon, 14 Oct 2019 14:23:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2E2BB3086228;
 Mon, 14 Oct 2019 14:23:43 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A45FB600CD;
 Mon, 14 Oct 2019 14:23:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:27 +0200
Message-Id: <20191014142246.4538-2-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 14 Oct 2019 14:23:43 +0000 (UTC)
Subject: [Xen-devel] [PATCH 01/20] vl: Add missing "hw/boards.h" include
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

dmwuYyBjYWxscyBtYWNoaW5lX3VzYigpIGRlY2xhcmVkIGluICJody9ib2FyZHMuaCIuIEluY2x1
ZGUgaXQuCgpUaGlzIGZpeGVzICh3aGVuIG1vZGlmeWluZyB1bnJlbGF0ZWQgaGVhZGVycyk6Cgog
IHZsLmM6MTI4MzoxMDogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdt
YWNoaW5lX3VzYicgaXMgaW52YWxpZCBpbiBDOTkgWy1XZXJyb3IsLVdpbXBsaWNpdC1mdW5jdGlv
bi1kZWNsYXJhdGlvbl0KICAgICAgaWYgKCFtYWNoaW5lX3VzYihjdXJyZW50X21hY2hpbmUpKSB7
CiAgICAgICAgICAgXgogIHZsLmM6MTI4MzoxMDogZXJyb3I6IHRoaXMgZnVuY3Rpb24gZGVjbGFy
YXRpb24gaXMgbm90IGEgcHJvdG90eXBlIFstV2Vycm9yLC1Xc3RyaWN0LXByb3RvdHlwZXNdCiAg
dmwuYzoxMjgzOjIyOiBlcnJvcjogdXNlIG9mIHVuZGVjbGFyZWQgaWRlbnRpZmllciAnY3VycmVu
dF9tYWNoaW5lJwogICAgICBpZiAoIW1hY2hpbmVfdXNiKGN1cnJlbnRfbWFjaGluZSkpIHsKICAg
ICAgICAgICAgICAgICAgICAgICBeCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogdmwuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdmwuYyBiL3ZsLmMKaW5kZXggMDAyYmY0OTE5
ZS4uZTg1YjMxZGYxYiAxMDA2NDQKLS0tIGEvdmwuYworKysgYi92bC5jCkBAIC0yNSw2ICsyNSw3
IEBACiAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgogI2luY2x1ZGUgInFlbXUtY29tbW9uLmgiCiAj
aW5jbHVkZSAicWVtdS91bml0cy5oIgorI2luY2x1ZGUgImh3L2JvYXJkcy5oIgogI2luY2x1ZGUg
Imh3L3FkZXYtcHJvcGVydGllcy5oIgogI2luY2x1ZGUgInFhcGkvZXJyb3IuaCIKICNpbmNsdWRl
ICJxZW11LXZlcnNpb24uaCIKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
