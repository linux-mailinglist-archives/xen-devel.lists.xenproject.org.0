Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B817AD652E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:30:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1Kv-0000VR-BG; Mon, 14 Oct 2019 14:28:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1Ku-0000VB-7F
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:28:36 +0000
X-Inumbo-ID: e7d1b88e-ee8e-11e9-bbab-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7d1b88e-ee8e-11e9-bbab-bc764e2007e4;
 Mon, 14 Oct 2019 14:28:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 052D510F2E89;
 Mon, 14 Oct 2019 14:28:35 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F361600CD;
 Mon, 14 Oct 2019 14:28:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:37 +0200
Message-Id: <20191014142246.4538-12-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Mon, 14 Oct 2019 14:28:35 +0000 (UTC)
Subject: [Xen-devel] [PATCH 11/20] hw/hppa/machine: Include "net/net.h"
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

aHcvaHBwYS9tYWNoaW5lLmMgdXNlcyBOSUNJbmZvIHZhcmlhYmxlcyB3aGljaCBhcmUgZGVjbGFy
ZWQgaW4KIm5ldC9uZXQuaCIuIEluY2x1ZGUgaXQuCgpUaGlzIGZpeGVzICh3aGVuIG1vZGlmeWlu
ZyB1bnJlbGF0ZWQgaGVhZGVycyk6CgogIGh3L2hwcGEvbWFjaGluZS5jOjEyNjoyMTogZXJyb3I6
IHVzZSBvZiB1bmRlY2xhcmVkIGlkZW50aWZpZXIgJ25iX25pY3MnCiAgICAgIGZvciAoaSA9IDA7
IGkgPCBuYl9uaWNzOyBpKyspIHsKICAgICAgICAgICAgICAgICAgICAgIF4KICBody9ocHBhL21h
Y2hpbmUuYzoxMjc6MzA6IGVycm9yOiB1c2Ugb2YgdW5kZWNsYXJlZCBpZGVudGlmaWVyICduZF90
YWJsZScKICAgICAgICAgIHBjaV9uaWNfaW5pdF9ub2ZhaWwoJm5kX3RhYmxlW2ldLCBwY2lfYnVz
LCAiZTEwMDAiLCBOVUxMKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KClNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0t
CiBody9ocHBhL21hY2hpbmUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvaHcvaHBwYS9tYWNoaW5lLmMgYi9ody9ocHBhL21hY2hpbmUuYwppbmRl
eCA3ZTIzNjc1NDI5Li42YzU1ZWQwYWYxIDEwMDY0NAotLS0gYS9ody9ocHBhL21hY2hpbmUuYwor
KysgYi9ody9ocHBhL21hY2hpbmUuYwpAQCAtMjAsNiArMjAsNyBAQAogI2luY2x1ZGUgInFlbXUv
dW5pdHMuaCIKICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiCiAjaW5jbHVkZSAicWVtdS9sb2cuaCIK
KyNpbmNsdWRlICJuZXQvbmV0LmgiCiAKICNkZWZpbmUgTUFYX0lERV9CVVMgMgogCi0tIAoyLjIx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
