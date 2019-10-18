Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39688DC68C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:52:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSce-0004n3-99; Fri, 18 Oct 2019 13:48:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLScc-0004mk-Lr
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:48:50 +0000
X-Inumbo-ID: 0394d1d8-f1ae-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0394d1d8-f1ae-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 13:48:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8DF1F4ACDF;
 Fri, 18 Oct 2019 13:48:49 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E50A60BF1;
 Fri, 18 Oct 2019 13:48:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:38 +0200
Message-Id: <20191018134754.16362-5-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 18 Oct 2019 13:48:49 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 04/20] Revert "irq: introduce
 qemu_irq_proxy()"
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoaXMgZnVu
Y3Rpb24gaXNuJ3QgdXNlZCBhbnltb3JlLgoKVGhpcyByZXZlcnRzIGNvbW1pdCAyMmVjMzI4M2Vm
YmE5YmEwNzkyNzkwZGE3ODZkNjc3NmQ4M2YyYTkyLgoKUmV2aWV3ZWQtYnk6IFRob21hcyBIdXRo
IDx0aHV0aEByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8ZjRidWdAYW1zYXQub3JnPgotLS0KIGh3L2NvcmUvaXJxLmMgICAgfCAxNCAtLS0tLS0tLS0t
LS0tLQogaW5jbHVkZS9ody9pcnEuaCB8ICA1IC0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L2NvcmUvaXJxLmMgYi9ody9jb3JlL2lycS5jCmlu
ZGV4IDdjYzAyOTVkMGUuLmZiMzA0NWI5MTIgMTAwNjQ0Ci0tLSBhL2h3L2NvcmUvaXJxLmMKKysr
IGIvaHcvY29yZS9pcnEuYwpAQCAtMTIwLDIwICsxMjAsNiBAQCBxZW11X2lycSBxZW11X2lycV9z
cGxpdChxZW11X2lycSBpcnExLCBxZW11X2lycSBpcnEyKQogICAgIHJldHVybiBxZW11X2FsbG9j
YXRlX2lycShxZW11X3NwbGl0aXJxLCBzLCAwKTsKIH0KIAotc3RhdGljIHZvaWQgcHJveHlfaXJx
X2hhbmRsZXIodm9pZCAqb3BhcXVlLCBpbnQgbiwgaW50IGxldmVsKQotewotICAgIHFlbXVfaXJx
ICoqdGFyZ2V0ID0gb3BhcXVlOwotCi0gICAgaWYgKCp0YXJnZXQpIHsKLSAgICAgICAgcWVtdV9z
ZXRfaXJxKCgqdGFyZ2V0KVtuXSwgbGV2ZWwpOwotICAgIH0KLX0KLQotcWVtdV9pcnEgKnFlbXVf
aXJxX3Byb3h5KHFlbXVfaXJxICoqdGFyZ2V0LCBpbnQgbikKLXsKLSAgICByZXR1cm4gcWVtdV9h
bGxvY2F0ZV9pcnFzKHByb3h5X2lycV9oYW5kbGVyLCB0YXJnZXQsIG4pOwotfQotCiB2b2lkIHFl
bXVfaXJxX2ludGVyY2VwdF9pbihxZW11X2lycSAqZ3Bpb19pbiwgcWVtdV9pcnFfaGFuZGxlciBo
YW5kbGVyLCBpbnQgbikKIHsKICAgICBpbnQgaTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvaXJx
LmggYi9pbmNsdWRlL2h3L2lycS5oCmluZGV4IGZlNTI3ZjZmNTEuLjI0YmEwZWNlMTEgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvaHcvaXJxLmgKKysrIGIvaW5jbHVkZS9ody9pcnEuaApAQCAtNTEsMTEg
KzUxLDYgQEAgcWVtdV9pcnEgcWVtdV9pcnFfaW52ZXJ0KHFlbXVfaXJxIGlycSk7CiAgKi8KIHFl
bXVfaXJxIHFlbXVfaXJxX3NwbGl0KHFlbXVfaXJxIGlycTEsIHFlbXVfaXJxIGlycTIpOwogCi0v
KiBSZXR1cm5zIGEgbmV3IElSUSBzZXQgd2hpY2ggY29ubmVjdHMgMToxIHRvIGFub3RoZXIgSVJR
IHNldCwgd2hpY2gKLSAqIG1heSBiZSBzZXQgbGF0ZXIuCi0gKi8KLXFlbXVfaXJxICpxZW11X2ly
cV9wcm94eShxZW11X2lycSAqKnRhcmdldCwgaW50IG4pOwotCiAvKiBGb3IgaW50ZXJuYWwgdXNl
IGluIHF0ZXN0LiAgU2ltaWxhciB0byBxZW11X2lycV9zcGxpdCwgYnV0IG9wZXJhdGluZwogICAg
b24gYW4gZXhpc3RpbmcgdmVjdG9yIG9mIHFlbXVfaXJxLiAgKi8KIHZvaWQgcWVtdV9pcnFfaW50
ZXJjZXB0X2luKHFlbXVfaXJxICpncGlvX2luLCBxZW11X2lycV9oYW5kbGVyIGhhbmRsZXIsIGlu
dCBuKTsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
