Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F059414B905
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:31:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRqw-0002Y9-1W; Tue, 28 Jan 2020 14:28:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VmX/=3R=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iwRqt-0002X9-OV
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:28:27 +0000
X-Inumbo-ID: 6f8d1e00-41da-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f8d1e00-41da-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 14:28:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 91255ACF2;
 Tue, 28 Jan 2020 14:28:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 Jan 2020 15:28:18 +0100
Message-Id: <20200128142818.27200-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200128142818.27200-1-jgross@suse.com>
References: <20200128142818.27200-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 3/3] xenstore: remove not applicable control
 commands in stubdom
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBydW4gaW4gYSBzdHViZG9tIGVudmlyb25tZW50IFhlbnN0b3JlIGNhbid0IHNlbGVjdCBh
IGxvZ2ZpbGUgb3IKZW1pdCBtZW1vcnkgc3RhdGlzdGljcyB0byBhIHNwZWNpZmljIGZpbGUuCgpT
byByZW1vdmUgb3IgbW9kaWZ5IHRob3NlIGNvbnRyb2wgY29tbWFuZHMgYWNjb3JkaW5nbHkuCgpT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogdG9vbHMv
eGVuc3RvcmUveGVuc3RvcmVkX2NvbnRyb2wuYyB8IDE4ICsrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfY29udHJvbC5jIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvbnRyb2wu
YwppbmRleCBlNGI4YWE5NWFiLi44ZDQ4YWI0ODIwIDEwMDY0NAotLS0gYS90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfY29udHJvbC5jCisrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb250
cm9sLmMKQEAgLTYxLDYgKzYxLDE5IEBAIHN0YXRpYyBpbnQgZG9fY29udHJvbF9sb2codm9pZCAq
Y3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwKIAlyZXR1cm4gMDsKIH0KIAorI2lmZGVmIF9f
TUlOSU9TX18KK3N0YXRpYyBpbnQgZG9fY29udHJvbF9tZW1yZXBvcnQodm9pZCAqY3R4LCBzdHJ1
Y3QgY29ubmVjdGlvbiAqY29ubiwKKwkJCQljaGFyICoqdmVjLCBpbnQgbnVtKQoreworCWlmIChu
dW0pCisJCXJldHVybiBFSU5WQUw7CisKKwl0YWxsb2NfcmVwb3J0X2Z1bGwoTlVMTCwgc3Rkb3V0
KTsKKworCXNlbmRfYWNrKGNvbm4sIFhTX0NPTlRST0wpOworCXJldHVybiAwOworfQorI2Vsc2UK
IHN0YXRpYyBpbnQgZG9fY29udHJvbF9sb2dmaWxlKHZvaWQgKmN0eCwgc3RydWN0IGNvbm5lY3Rp
b24gKmNvbm4sCiAJCQkgICAgICBjaGFyICoqdmVjLCBpbnQgbnVtKQogewpAQCAtMTE0LDYgKzEy
Nyw3IEBAIHN0YXRpYyBpbnQgZG9fY29udHJvbF9tZW1yZXBvcnQodm9pZCAqY3R4LCBzdHJ1Y3Qg
Y29ubmVjdGlvbiAqY29ubiwKIAlzZW5kX2Fjayhjb25uLCBYU19DT05UUk9MKTsKIAlyZXR1cm4g
MDsKIH0KKyNlbmRpZgogCiBzdGF0aWMgaW50IGRvX2NvbnRyb2xfcHJpbnQodm9pZCAqY3R4LCBz
dHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwKIAkJCSAgICBjaGFyICoqdmVjLCBpbnQgbnVtKQpAQCAt
MTMyLDggKzE0NiwxMiBAQCBzdGF0aWMgaW50IGRvX2NvbnRyb2xfaGVscCh2b2lkICosIHN0cnVj
dCBjb25uZWN0aW9uICosIGNoYXIgKiosIGludCk7CiBzdGF0aWMgc3RydWN0IGNtZF9zIGNtZHNb
XSA9IHsKIAl7ICJjaGVjayIsIGRvX2NvbnRyb2xfY2hlY2ssICIiIH0sCiAJeyAibG9nIiwgZG9f
Y29udHJvbF9sb2csICJvbnxvZmYiIH0sCisjaWZkZWYgX19NSU5JT1NfXworCXsgIm1lbXJlcG9y
dCIsIGRvX2NvbnRyb2xfbWVtcmVwb3J0LCAiIiB9LAorI2Vsc2UKIAl7ICJsb2dmaWxlIiwgZG9f
Y29udHJvbF9sb2dmaWxlLCAiPGZpbGU+IiB9LAogCXsgIm1lbXJlcG9ydCIsIGRvX2NvbnRyb2xf
bWVtcmVwb3J0LCAiWzxmaWxlPl0iIH0sCisjZW5kaWYKIAl7ICJwcmludCIsIGRvX2NvbnRyb2xf
cHJpbnQsICI8c3RyaW5nPiIgfSwKIAl7ICJoZWxwIiwgZG9fY29udHJvbF9oZWxwLCAiIiB9LAog
fTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
