Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D34D7B84
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:30:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPfp-00033e-7u; Tue, 15 Oct 2019 16:27:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPfo-00033K-0g
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:27:48 +0000
X-Inumbo-ID: b86b4c1a-ef68-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b86b4c1a-ef68-11e9-beca-bc764e2007e4;
 Tue, 15 Oct 2019 16:27:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D8FE52A09AA;
 Tue, 15 Oct 2019 16:27:45 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACF8119C69;
 Tue, 15 Oct 2019 16:27:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:36 +0200
Message-Id: <20191015162705.28087-4-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 15 Oct 2019 16:27:46 +0000 (UTC)
Subject: [Xen-devel] [PATCH 03/32] mc146818rtc: move structure to header file
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

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKV2UgYXJlIG5v
dyBhYmxlIHRvIGVtYmVkIGEgdGltZXIgaW4gYW5vdGhlciBvYmplY3QuCgpBY2tlZC1ieTogTWlj
aGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFBhb2xvIEJvbnppbmkg
PHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEhlcnbDqSBQb3Vzc2luZWF1IDxo
cG91c3NpbkByZWFjdG9zLm9yZz4KTWVzc2FnZS1JZDogPDIwMTcxMjE2MDkwMjI4LjI4NTA1LTQt
aHBvdXNzaW5AcmVhY3Rvcy5vcmc+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody90aW1lci9tYzE0NjgxOHJ0Yy5jICAgICAg
ICAgfCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvaHcvdGltZXIv
bWMxNDY4MThydGMuaCB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9ody90aW1lci9tYzE0NjgxOHJ0Yy5jIGIvaHcvdGltZXIvbWMxNDY4MThydGMuYwppbmRl
eCA2Y2IzNzg3NTFiLi5lNDBiNTRlNzQzIDEwMDY0NAotLS0gYS9ody90aW1lci9tYzE0NjgxOHJ0
Yy5jCisrKyBiL2h3L3RpbWVyL21jMTQ2ODE4cnRjLmMKQEAgLTcxLDM2ICs3MSw2IEBACiAjZGVm
aW5lIFJUQ19DTE9DS19SQVRFICAgICAgICAgICAgMzI3NjgKICNkZWZpbmUgVUlQX0hPTERfTEVO
R1RIICAgICAgICAgICAoOCAqIE5BTk9TRUNPTkRTX1BFUl9TRUNPTkQgLyAzMjc2OCkKIAotI2Rl
ZmluZSBNQzE0NjgxOF9SVEMob2JqKSBPQkpFQ1RfQ0hFQ0soUlRDU3RhdGUsIChvYmopLCBUWVBF
X01DMTQ2ODE4X1JUQykKLQotdHlwZWRlZiBzdHJ1Y3QgUlRDU3RhdGUgewotICAgIElTQURldmlj
ZSBwYXJlbnRfb2JqOwotCi0gICAgTWVtb3J5UmVnaW9uIGlvOwotICAgIE1lbW9yeVJlZ2lvbiBj
b2FsZXNjZWRfaW87Ci0gICAgdWludDhfdCBjbW9zX2RhdGFbMTI4XTsKLSAgICB1aW50OF90IGNt
b3NfaW5kZXg7Ci0gICAgaW50MzJfdCBiYXNlX3llYXI7Ci0gICAgdWludDY0X3QgYmFzZV9ydGM7
Ci0gICAgdWludDY0X3QgbGFzdF91cGRhdGU7Ci0gICAgaW50NjRfdCBvZmZzZXQ7Ci0gICAgcWVt
dV9pcnEgaXJxOwotICAgIGludCBpdF9zaGlmdDsKLSAgICAvKiBwZXJpb2RpYyB0aW1lciAqLwot
ICAgIFFFTVVUaW1lciAqcGVyaW9kaWNfdGltZXI7Ci0gICAgaW50NjRfdCBuZXh0X3BlcmlvZGlj
X3RpbWU7Ci0gICAgLyogdXBkYXRlLWVuZGVkIHRpbWVyICovCi0gICAgUUVNVVRpbWVyICp1cGRh
dGVfdGltZXI7Ci0gICAgdWludDY0X3QgbmV4dF9hbGFybV90aW1lOwotICAgIHVpbnQxNl90IGly
cV9yZWluamVjdF9vbl9hY2tfY291bnQ7Ci0gICAgdWludDMyX3QgaXJxX2NvYWxlc2NlZDsKLSAg
ICB1aW50MzJfdCBwZXJpb2Q7Ci0gICAgUUVNVVRpbWVyICpjb2FsZXNjZWRfdGltZXI7Ci0gICAg
TG9zdFRpY2tQb2xpY3kgbG9zdF90aWNrX3BvbGljeTsKLSAgICBOb3RpZmllciBzdXNwZW5kX25v
dGlmaWVyOwotICAgIFFMSVNUX0VOVFJZKFJUQ1N0YXRlKSBsaW5rOwotfSBSVENTdGF0ZTsKLQog
c3RhdGljIHZvaWQgcnRjX3NldF90aW1lKFJUQ1N0YXRlICpzKTsKIHN0YXRpYyB2b2lkIHJ0Y191
cGRhdGVfdGltZShSVENTdGF0ZSAqcyk7CiBzdGF0aWMgdm9pZCBydGNfc2V0X2Ntb3MoUlRDU3Rh
dGUgKnMsIGNvbnN0IHN0cnVjdCB0bSAqdG0pOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody90aW1l
ci9tYzE0NjgxOHJ0Yy5oIGIvaW5jbHVkZS9ody90aW1lci9tYzE0NjgxOHJ0Yy5oCmluZGV4IGZl
NmVkNjNmNzEuLjBmMWM4ODZlNWIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvdGltZXIvbWMxNDY4
MThydGMuaAorKysgYi9pbmNsdWRlL2h3L3RpbWVyL21jMTQ2ODE4cnRjLmgKQEAgLTEsMTAgKzEs
NDMgQEAKICNpZm5kZWYgTUMxNDY4MThSVENfSAogI2RlZmluZSBNQzE0NjgxOFJUQ19ICiAKKyNp
bmNsdWRlICJxYXBpL3FhcGktdHlwZXMtbWlzYy5oIgorI2luY2x1ZGUgInFlbXUvcXVldWUuaCIK
KyNpbmNsdWRlICJxZW11L3RpbWVyLmgiCiAjaW5jbHVkZSAiaHcvaXNhL2lzYS5oIgogI2luY2x1
ZGUgImh3L3RpbWVyL21jMTQ2ODE4cnRjX3JlZ3MuaCIKIAogI2RlZmluZSBUWVBFX01DMTQ2ODE4
X1JUQyAibWMxNDY4MThydGMiCisjZGVmaW5lIE1DMTQ2ODE4X1JUQyhvYmopIE9CSkVDVF9DSEVD
SyhSVENTdGF0ZSwgKG9iaiksIFRZUEVfTUMxNDY4MThfUlRDKQorCit0eXBlZGVmIHN0cnVjdCBS
VENTdGF0ZSB7CisgICAgSVNBRGV2aWNlIHBhcmVudF9vYmo7CisKKyAgICBNZW1vcnlSZWdpb24g
aW87CisgICAgTWVtb3J5UmVnaW9uIGNvYWxlc2NlZF9pbzsKKyAgICB1aW50OF90IGNtb3NfZGF0
YVsxMjhdOworICAgIHVpbnQ4X3QgY21vc19pbmRleDsKKyAgICBpbnQzMl90IGJhc2VfeWVhcjsK
KyAgICB1aW50NjRfdCBiYXNlX3J0YzsKKyAgICB1aW50NjRfdCBsYXN0X3VwZGF0ZTsKKyAgICBp
bnQ2NF90IG9mZnNldDsKKyAgICBxZW11X2lycSBpcnE7CisgICAgaW50IGl0X3NoaWZ0OworICAg
IC8qIHBlcmlvZGljIHRpbWVyICovCisgICAgUUVNVVRpbWVyICpwZXJpb2RpY190aW1lcjsKKyAg
ICBpbnQ2NF90IG5leHRfcGVyaW9kaWNfdGltZTsKKyAgICAvKiB1cGRhdGUtZW5kZWQgdGltZXIg
Ki8KKyAgICBRRU1VVGltZXIgKnVwZGF0ZV90aW1lcjsKKyAgICB1aW50NjRfdCBuZXh0X2FsYXJt
X3RpbWU7CisgICAgdWludDE2X3QgaXJxX3JlaW5qZWN0X29uX2Fja19jb3VudDsKKyAgICB1aW50
MzJfdCBpcnFfY29hbGVzY2VkOworICAgIHVpbnQzMl90IHBlcmlvZDsKKyAgICBRRU1VVGltZXIg
KmNvYWxlc2NlZF90aW1lcjsKKyAgICBOb3RpZmllciBjbG9ja19yZXNldF9ub3RpZmllcjsKKyAg
ICBMb3N0VGlja1BvbGljeSBsb3N0X3RpY2tfcG9saWN5OworICAgIE5vdGlmaWVyIHN1c3BlbmRf
bm90aWZpZXI7CisgICAgUUxJU1RfRU5UUlkoUlRDU3RhdGUpIGxpbms7Cit9IFJUQ1N0YXRlOwog
CiBJU0FEZXZpY2UgKm1jMTQ2ODE4X3J0Y19pbml0KElTQUJ1cyAqYnVzLCBpbnQgYmFzZV95ZWFy
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBxZW11X2lycSBpbnRlcmNlcHRfaXJxKTsK
LS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
