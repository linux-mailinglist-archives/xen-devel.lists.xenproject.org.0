Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA611E816
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:21:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifneq-000071-C5; Fri, 13 Dec 2019 16:19:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifnep-00006g-BS
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:19:11 +0000
X-Inumbo-ID: 4abf1109-1dc4-11ea-8f6f-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4abf1109-1dc4-11ea-8f6f-12813bfff9fa;
 Fri, 13 Dec 2019 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576253950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MoaYblDuqaOu06Ol7lC33g4xxfLM5QgSZVl86kdLlTs=;
 b=jOL+8O01ioOVAn+nJqsnlB8CnD136wRL03MH+F/KmE2PsPlYwIMMgFK2FLanYKMIZPXT0M
 41uOE/1jswil5VlJRxP5kDIkgKtpNEorZjoXy3etMA0VGMNVWlGS48vQYx582Y/NDOgdMf
 kOg3Un4hsvyPFTIBgRcrHwU9ZKeiyro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-7VHFUSGePyuNHDhuMawR8g-1; Fri, 13 Dec 2019 11:19:08 -0500
X-MC-Unique: 7VHFUSGePyuNHDhuMawR8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2D1A801E70;
 Fri, 13 Dec 2019 16:19:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E7D019C4F;
 Fri, 13 Dec 2019 16:18:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:46 +0100
Message-Id: <20191213161753.8051-6-philmd@redhat.com>
In-Reply-To: <20191213161753.8051-1-philmd@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 05/12] hw/i386/ich9: Remove unused include
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlICJwY2llX2hvc3QuaCIgaGVhZGVyIGlzIHVzZWQgYnkgZGV2aWNlcyBwcm92aWRpbmcgYSBQ
Q0ktZSBidXMsCnVzdWFsbHkgTm9ydGggQnJpZGdlcy4gVGhlIElDSDkgaXMgYSBTb3V0aCBCcmlk
Z2UuClNpbmNlIHdlIGRvbid0IG5lZWQgdGhpcyBoZWFkZXIsIGRvIG5vdCBpbmNsdWRlIGl0LgoK
U2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29t
PgotLS0KIGluY2x1ZGUvaHcvaTM4Ni9pY2g5LmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9pMzg2L2ljaDkuaCBiL2luY2x1ZGUv
aHcvaTM4Ni9pY2g5LmgKaW5kZXggNzJlODAzZjZlMi4uZWViNzlhYzFmZSAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9ody9pMzg2L2ljaDkuaAorKysgYi9pbmNsdWRlL2h3L2kzODYvaWNoOS5oCkBAIC03
LDcgKzcsNiBAQAogI2luY2x1ZGUgImh3L2lzYS9hcG0uaCIKICNpbmNsdWRlICJody9pMzg2L2lv
YXBpYy5oIgogI2luY2x1ZGUgImh3L3BjaS9wY2kuaCIKLSNpbmNsdWRlICJody9wY2kvcGNpZV9o
b3N0LmgiCiAjaW5jbHVkZSAiaHcvcGNpL3BjaV9icmlkZ2UuaCIKICNpbmNsdWRlICJody9hY3Bp
L2FjcGkuaCIKICNpbmNsdWRlICJody9hY3BpL2ljaDkuaCIKLS0gCjIuMjEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
