Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A068D7B9F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:31:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPh5-0003T7-UE; Tue, 15 Oct 2019 16:29:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPh4-0003Sg-MD
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:29:06 +0000
X-Inumbo-ID: e7f89dc0-ef68-11e9-bbab-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f89dc0-ef68-11e9-bbab-bc764e2007e4;
 Tue, 15 Oct 2019 16:29:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A2FDA18C8320;
 Tue, 15 Oct 2019 16:29:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FCEF19C58;
 Tue, 15 Oct 2019 16:28:50 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:41 +0200
Message-Id: <20191015162705.28087-9-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 15 Oct 2019 16:29:05 +0000 (UTC)
Subject: [Xen-devel] [PATCH 08/32] piix4: rename some variables in realize
 function
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKUElJWDQgc3Ry
dWN0dXJlIGlzIG5vdyAncycKUENJIGRldmljZSBpcyBub3cgJ3BjaV9kZXYnCkRldmljZVN0YXRl
IGlzIG5vdyAnZGV2JwoKQWNrZWQtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5j
b20+CkFja2VkLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBIZXJ2w6kgUG91c3NpbmVhdSA8aHBvdXNzaW5AcmVhY3Rvcy5vcmc+Ck1lc3NhZ2Ut
SWQ6IDwyMDE3MTIxNjA5MDIyOC4yODUwNS02LWhwb3Vzc2luQHJlYWN0b3Mub3JnPgpTaWduZWQt
b2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQog
aHcvaXNhL3BpaXg0LmMgfCAxMyArKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L2lzYS9waWl4NC5jIGIv
aHcvaXNhL3BpaXg0LmMKaW5kZXggMzI5NDA1NmNkNS4uNDIwMjI0M2U0MSAxMDA2NDQKLS0tIGEv
aHcvaXNhL3BpaXg0LmMKKysrIGIvaHcvaXNhL3BpaXg0LmMKQEAgLTg4LDE2ICs4OCwxNyBAQCBz
dGF0aWMgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uIHZtc3RhdGVfcGlpeDQgPSB7CiAgICAgfQog
fTsKIAotc3RhdGljIHZvaWQgcGlpeDRfcmVhbGl6ZShQQ0lEZXZpY2UgKmRldiwgRXJyb3IgKipl
cnJwKQorc3RhdGljIHZvaWQgcGlpeDRfcmVhbGl6ZShQQ0lEZXZpY2UgKnBjaV9kZXYsIEVycm9y
ICoqZXJycCkKIHsKLSAgICBQSUlYNFN0YXRlICpkID0gUElJWDRfUENJX0RFVklDRShkZXYpOwor
ICAgIERldmljZVN0YXRlICpkZXYgPSBERVZJQ0UocGNpX2Rldik7CisgICAgUElJWDRTdGF0ZSAq
cyA9IERPX1VQQ0FTVChQSUlYNFN0YXRlLCBkZXYsIHBjaV9kZXYpOwogCi0gICAgaWYgKCFpc2Ff
YnVzX25ldyhERVZJQ0UoZCksIHBjaV9hZGRyZXNzX3NwYWNlKGRldiksCi0gICAgICAgICAgICAg
ICAgICAgICBwY2lfYWRkcmVzc19zcGFjZV9pbyhkZXYpLCBlcnJwKSkgeworICAgIGlmICghaXNh
X2J1c19uZXcoZGV2LCBwY2lfYWRkcmVzc19zcGFjZShwY2lfZGV2KSwKKyAgICAgICAgICAgICAg
ICAgICAgIHBjaV9hZGRyZXNzX3NwYWNlX2lvKHBjaV9kZXYpLCBlcnJwKSkgewogICAgICAgICBy
ZXR1cm47CiAgICAgfQotICAgIHBpaXg0X2RldiA9ICZkLT5kZXY7Ci0gICAgcWVtdV9yZWdpc3Rl
cl9yZXNldChwaWl4NF9yZXNldCwgZCk7CisgICAgcGlpeDRfZGV2ID0gcGNpX2RldjsKKyAgICBx
ZW11X3JlZ2lzdGVyX3Jlc2V0KHBpaXg0X3Jlc2V0LCBzKTsKIH0KIAogaW50IHBpaXg0X2luaXQo
UENJQnVzICpidXMsIElTQUJ1cyAqKmlzYV9idXMsIGludCBkZXZmbikKLS0gCjIuMjEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
