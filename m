Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D428C3D1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 23:36:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxePR-0001IL-Kn; Tue, 13 Aug 2019 21:32:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxePQ-0001IG-8n
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 21:32:48 +0000
X-Inumbo-ID: e3fc3502-be11-11e9-b1ac-7f050af175b0
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e3fc3502-be11-11e9-b1ac-7f050af175b0;
 Tue, 13 Aug 2019 21:32:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C00B71570;
 Tue, 13 Aug 2019 14:32:45 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F22B13F718;
 Tue, 13 Aug 2019 14:32:44 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 13 Aug 2019 22:32:37 +0100
Message-Id: <20190813213237.4819-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/docs: arm: Update dom0less binding and
 example
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
Cc: viktor_mitin@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGJpbmRpbmcgZm9yIHRoZSBkb20wbGVzcyBtb2R1bGUgZG9lcyBub3QgbWF0Y2ggWGVuIGlt
cGxlbWVudGF0aW9uLgpBbnkgbW9kdWxlIHNob3VsZCBjb250YWluIHRoZSBjb21wYXRpYmxlICJt
dWx0aWJvb3QsbW9kdWxlIiB0byBiZQpyZWNvZ25pemVkLgoKVGhpcyB3YXMgY2xlYXJseSBhbiBv
dmVyc2lnaHQgYXMgb3RoZXIgZXhhbXBsZXMgd2l0aCBYZW4gY29kZSBiYXNlCnByb3ZpZGUgdGhl
IGNvbXBhdGlibGUgIm11bHRpYm9vdCxtb2R1bGUiLgoKU28gZml4IHRoZSBiaW5kaW5nIGFuZCB0
aGUgZXhhbXBsZSBhc3NvY2lhdGVkIHRvIGl0LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQoKQ2M6IHZpa3Rvcl9taXRpbkBlcGFtLmNvbQoK
ICAgIFdlIHByb2JhYmx5IHdhbnQgdG8gY29uc29saWRhdGUgYWxsIHRoZSBkb20wbGVzcyBkb2N1
bWVudGF0aW9uIGluCiAgICBvbmUgcGxhY2UgcmF0aGVyIHRoYW4gaGF2aW5nIHRvIGZpeCBkb2N1
bWF0aW9uIGlzc3VlcyBpbiBhIG11bHRpcGxlCiAgICBwbGFjZXMgb25lIGJ5IG9uZS4KLS0tCiBk
b2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0IHwgMTIgKysrKysrLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgYi9kb2NzL21pc2MvYXJt
L2RldmljZS10cmVlL2Jvb3RpbmcudHh0CmluZGV4IDMxN2E5ZTk2MmEuLjBmYWZhMDFiNWQgMTAw
NjQ0Ci0tLSBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQKKysrIGIvZG9j
cy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dApAQCAtMTYwLDcgKzE2MCw3IEBAIFRo
ZSBrZXJuZWwgc3ViLW5vZGUgaGFzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoKIAogLSBjb21w
YXRpYmxlCiAKLSAgICAibXVsdGlib290LGtlcm5lbCIKKyAgICAibXVsdGlib290LGtlcm5lbCIs
ICJtdWx0aWJvb3QsbW9kdWxlIgogCiAtIHJlZwogCkBAIC0xNzUsNyArMTc1LDcgQEAgVGhlIHJh
bWRpc2sgc3ViLW5vZGUgaGFzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoKIAogLSBjb21wYXRp
YmxlCiAKLSAgICAibXVsdGlib290LHJhbWRpc2siCisgICAgIm11bHRpYm9vdCxyYW1kaXNrIiwg
Im11bHRpYm9vdCxtb2R1bGUiCiAKIC0gcmVnCiAKQEAgLTE5NiwxMyArMTk2LDEzIEBAIGNob3Nl
biB7CiAgICAgICAgIHZwbDAxMTsKIAogICAgICAgICBtb2R1bGVAMHg0YTAwMDAwMCB7Ci0gICAg
ICAgICAgICBjb21wYXRpYmxlID0gIm11bHRpYm9vdCxrZXJuZWwiOworICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIiwgIm11bHRpYm9vdCxtb2R1bGUiOwogICAgICAg
ICAgICAgcmVnID0gPDB4MCAweDRhMDAwMDAwIDB4ZmZmZmZmPjsKICAgICAgICAgICAgIGJvb3Rh
cmdzID0gImNvbnNvbGU9dHR5QU1BMCBpbml0PS9iaW4vc2giOwogICAgICAgICB9OwogCiAgICAg
ICAgIG1vZHVsZUAweDRiMDAwMDAwIHsKLSAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXVsdGli
b290LHJhbWRpc2siOworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3QscmFtZGlz
ayIsICJtdWx0aWJvb3QsbW9kdWxlIjsKICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg0YjAwMDAw
MCAweGZmZmZmZj47CiAgICAgICAgIH07CiAgICAgfTsKQEAgLTIxNSwxMyArMjE1LDEzIEBAIGNo
b3NlbiB7CiAgICAgICAgIGNwdXMgPSA8MT47CiAKICAgICAgICAgbW9kdWxlQDB4NGMwMDAwMDAg
ewotICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIjsKKyAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAibXVsdGlib290LGtlcm5lbCIsICJtdWx0aWJvb3QsbW9kdWxlIjsK
ICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg0YzAwMDAwMCAweGZmZmZmZj47CiAgICAgICAgICAg
ICBib290YXJncyA9ICJjb25zb2xlPXR0eUFNQTAgaW5pdD0vYmluL3NoIjsKICAgICAgICAgfTsK
IAogICAgICAgICBtb2R1bGVAMHg0ZDAwMDAwMCB7Ci0gICAgICAgICAgICBjb21wYXRpYmxlID0g
Im11bHRpYm9vdCxyYW1kaXNrIjsKKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXVsdGlib290
LHJhbWRpc2siLCAibXVsdGlib290LG1vZHVsZSI7CiAgICAgICAgICAgICByZWcgPSA8MHgwIDB4
NGQwMDAwMDAgMHhmZmZmZmY+OwogICAgICAgICB9OwogICAgIH07Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
