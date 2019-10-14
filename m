Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAB9D652A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:29:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1Jc-0000CR-Cw; Mon, 14 Oct 2019 14:27:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1Ja-0000CA-SO
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:27:14 +0000
X-Inumbo-ID: b76bfc54-ee8e-11e9-937f-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b76bfc54-ee8e-11e9-937f-12813bfff9fa;
 Mon, 14 Oct 2019 14:27:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C82C969061;
 Mon, 14 Oct 2019 14:27:13 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70211600CD;
 Mon, 14 Oct 2019 14:26:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:34 +0200
Message-Id: <20191014142246.4538-9-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 14 Oct 2019 14:27:14 +0000 (UTC)
Subject: [Xen-devel] [PATCH 08/20] hw/xen/xen_pt_load_rom: Remove unused
 includes
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

eGVuX3B0X2xvYWRfcm9tLmMgZG9lcyBub3QgdXNlIGFueSBvZiB0aGVzZSBpbmNsdWRlcywgcmVt
b3ZlIHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QHJlZGhhdC5jb20+Ci0tLQogaHcveGVuL3hlbl9wdF9sb2FkX3JvbS5jIHwgNCAtLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody94ZW4veGVuX3B0X2xv
YWRfcm9tLmMgYi9ody94ZW4veGVuX3B0X2xvYWRfcm9tLmMKaW5kZXggMzA3YTVjOTNlMi4uYTUw
YTgwODM3ZSAxMDA2NDQKLS0tIGEvaHcveGVuL3hlbl9wdF9sb2FkX3JvbS5jCisrKyBiL2h3L3hl
bi94ZW5fcHRfbG9hZF9yb20uYwpAQCAtMywxMiArMyw4IEBACiAgKi8KICNpbmNsdWRlICJxZW11
L29zZGVwLmgiCiAjaW5jbHVkZSAicWFwaS9lcnJvci5oIgotI2luY2x1ZGUgImh3L2kzODYvcGMu
aCIKICNpbmNsdWRlICJxZW11L2Vycm9yLXJlcG9ydC5oIgotI2luY2x1ZGUgInVpL2NvbnNvbGUu
aCIKICNpbmNsdWRlICJody9sb2FkZXIuaCIKLSNpbmNsdWRlICJtb25pdG9yL21vbml0b3IuaCIK
LSNpbmNsdWRlICJxZW11L3JhbmdlLmgiCiAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgogI2luY2x1
ZGUgInhlbl9wdC5oIgogCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
