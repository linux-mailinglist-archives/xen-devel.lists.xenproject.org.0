Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB259D6530
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:30:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1KP-0000OE-WF; Mon, 14 Oct 2019 14:28:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1KP-0000O5-BP
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:28:05 +0000
X-Inumbo-ID: d557d9b8-ee8e-11e9-8aca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d557d9b8-ee8e-11e9-8aca-bc764e2007e4;
 Mon, 14 Oct 2019 14:28:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F33301017C0F;
 Mon, 14 Oct 2019 14:28:03 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB003600CD;
 Mon, 14 Oct 2019 14:27:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:36 +0200
Message-Id: <20191014142246.4538-11-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Mon, 14 Oct 2019 14:28:04 +0000 (UTC)
Subject: [Xen-devel] [PATCH 10/20] hw/alpha/dp264: Include "net/net.h"
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

aHcvYWxwaGEvZHAyNjQuYyB1c2VzIE5JQ0luZm8gdmFyaWFibGVzIHdoaWNoIGFyZSBkZWNsYXJl
ZCBpbgoibmV0L25ldC5oIi4gSW5jbHVkZSBpdC4KClRoaXMgZml4ZXMgKHdoZW4gbW9kaWZ5aW5n
IHVucmVsYXRlZCBoZWFkZXJzKToKCiAgaHcvYWxwaGEvZHAyNjQuYzo4OToyMTogZXJyb3I6IHVz
ZSBvZiB1bmRlY2xhcmVkIGlkZW50aWZpZXIgJ25iX25pY3MnCiAgICAgIGZvciAoaSA9IDA7IGkg
PCBuYl9uaWNzOyBpKyspIHsKICAgICAgICAgICAgICAgICAgICAgIF4KICBody9hbHBoYS9kcDI2
NC5jOjkwOjMwOiBlcnJvcjogdXNlIG9mIHVuZGVjbGFyZWQgaWRlbnRpZmllciAnbmRfdGFibGUn
CiAgICAgICAgICBwY2lfbmljX2luaXRfbm9mYWlsKCZuZF90YWJsZVtpXSwgcGNpX2J1cywgImUx
MDAwIiwgTlVMTCk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpTaWduZWQtb2Zm
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcv
YWxwaGEvZHAyNjQuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvaHcvYWxwaGEvZHAyNjQuYyBiL2h3L2FscGhhL2RwMjY0LmMKaW5kZXggNTFmZWVl
ODU1OC4uMDEzYTlkMzUxMCAxMDA2NDQKLS0tIGEvaHcvYWxwaGEvZHAyNjQuYworKysgYi9ody9h
bHBoYS9kcDI2NC5jCkBAIC0yMCw2ICsyMCw3IEBACiAjaW5jbHVkZSAiaHcvaXNhL3N1cGVyaW8u
aCIKICNpbmNsdWRlICJody9kbWEvaTgyNTcuaCIKICNpbmNsdWRlICJxZW11L2N1dGlscy5oIgor
I2luY2x1ZGUgIm5ldC9uZXQuaCIKIAogI2RlZmluZSBNQVhfSURFX0JVUyAyCiAKLS0gCjIuMjEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
