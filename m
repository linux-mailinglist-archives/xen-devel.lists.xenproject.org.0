Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E38D6550
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:36:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1Os-00025B-Lf; Mon, 14 Oct 2019 14:32:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1Or-00024q-5v
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:32:41 +0000
X-Inumbo-ID: 79e8016a-ee8f-11e9-937f-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79e8016a-ee8f-11e9-937f-12813bfff9fa;
 Mon, 14 Oct 2019 14:32:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1372C18C891B;
 Mon, 14 Oct 2019 14:32:40 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 545AE600CD;
 Mon, 14 Oct 2019 14:32:16 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:46 +0200
Message-Id: <20191014142246.4538-21-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 14 Oct 2019 14:32:40 +0000 (UTC)
Subject: [Xen-devel] [PATCH 20/20] hw/i386/pc: Clean up includes
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

VmFyaW91cyBoZWFkZXJzIGFyZSBub3QgcmVxdWlyZWQgYnkgaHcvaTM4Ni9wYy5oOgoKIC0gInFl
bXUvcmFuZ2UuaCIKIC0gInFlbXUvYml0bWFwLmgiCiAtICJxZW11L21vZHVsZS5oIgogLSAiZXhl
Yy9tZW1vcnkuaCIKIC0gImh3L3BjaS9wY2kuaCIKIC0gImh3L21lbS9wYy1kaW1tLmgiCiAtICJo
dy9tZW0vbnZkaW1tLmgiCiAtICJuZXQvbmV0LmgiCgpSZW1vdmUgdGhlbS4KCkFkZCAzIGhlYWRl
cnMgdGhhdCB3ZXJlIG1pc3Npbmc6CgogLSAiaHcvaG90cGx1Zy5oIgoKICAgUENNYWNoaW5lU3Rh
dGU6OmFjcGlfZGV2IGlzIG9mIHR5cGUgSG90cGx1Z0hhbmRsZXIKCiAtICJxZW11L25vdGlmeS5o
IgoKICAgUENNYWNoaW5lU3RhdGU6Om1hY2hpbmVfZG9uZSBpcyBvZiB0eXBlIE5vdGlmaWVyCgog
LSAicWFwaS9xYXBpLXR5cGVzLWNvbW1vbi5oIgoKICAgUENNYWNoaW5lU3RhdGU6OnZtcG9ydC9z
bW0gaXMgb2YgdHlwZSBPbk9mZkF1dG8KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2h3L2kzODYvcGMuaCB8IDEy
ICsrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2kzODYvcGMuaCBiL2luY2x1ZGUvaHcvaTM4
Ni9wYy5oCmluZGV4IDZkZjRmNGI2ZmIuLmU1YzJkYzkwODEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
aHcvaTM4Ni9wYy5oCisrKyBiL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCkBAIC0xLDIxICsxLDE1IEBA
CiAjaWZuZGVmIEhXX1BDX0gKICNkZWZpbmUgSFdfUENfSAogCi0jaW5jbHVkZSAiZXhlYy9tZW1v
cnkuaCIKKyNpbmNsdWRlICJxZW11L25vdGlmeS5oIgorI2luY2x1ZGUgInFhcGkvcWFwaS10eXBl
cy1jb21tb24uaCIKICNpbmNsdWRlICJody9ib2FyZHMuaCIKICNpbmNsdWRlICJody9pc2EvaXNh
LmgiCiAjaW5jbHVkZSAiaHcvYmxvY2svZmRjLmgiCiAjaW5jbHVkZSAiaHcvYmxvY2svZmxhc2gu
aCIKLSNpbmNsdWRlICJuZXQvbmV0LmgiCiAjaW5jbHVkZSAiaHcvaTM4Ni9pb2FwaWMuaCIKLQot
I2luY2x1ZGUgInFlbXUvcmFuZ2UuaCIKLSNpbmNsdWRlICJxZW11L2JpdG1hcC5oIgotI2luY2x1
ZGUgInFlbXUvbW9kdWxlLmgiCi0jaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgotI2luY2x1ZGUgImh3
L21lbS9wYy1kaW1tLmgiCi0jaW5jbHVkZSAiaHcvbWVtL252ZGltbS5oIgogI2luY2x1ZGUgImh3
L2FjcGkvYWNwaV9kZXZfaW50ZXJmYWNlLmgiCisjaW5jbHVkZSAiaHcvaG90cGx1Zy5oIgogCiAj
ZGVmaW5lIEhQRVRfSU5UQ0FQICJocGV0LWludGNhcCIKIAotLSAKMi4yMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
