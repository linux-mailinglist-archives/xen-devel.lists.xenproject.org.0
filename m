Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF8BD710
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 06:18:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCyj0-0000Pi-Pl; Wed, 25 Sep 2019 04:16:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4a6=XT=suse.de=nsaenzjulienne@srs-us1.protection.inumbo.net>)
 id 1iCpIz-0000EC-Ch
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 18:12:53 +0000
X-Inumbo-ID: ec33552e-def6-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ec33552e-def6-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 18:12:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3AA7DAEF1;
 Tue, 24 Sep 2019 18:12:51 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org
Date: Tue, 24 Sep 2019 20:12:32 +0200
Message-Id: <20190924181244.7159-2-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2019 04:16:20 +0000
Subject: [Xen-devel] [PATCH 01/11] of: address: clean-up unused variable in
 of_dma_get_range()
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
Cc: f.fainelli@gmail.com, mbrugger@suse.com, wahrenst@gmx.net,
 james.quinlan@broadcom.com, robin.murphy@arm.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

J2xlbicgaW4gb2ZfZG1hX2dldF9yYW5nZSgpIGlzIHVzZWQgdG8gY2hlY2sgdGhlICdkbWEtcmFu
Z2VzJyBwcm9wZXJ0eQpsZW5ndGguIEFmdGVyIHRoZSBmYWN0LCBzb21lIGNhbGN1bGF0aW9ucyBh
cmUgcnVuIG9uIHRoZSB2YXJpYWJsZSB0byBiZQp0aGVuIGxlZnQgdW51c2VkLgoKU2lnbmVkLW9m
Zi1ieTogTmljb2xhcyBTYWVueiBKdWxpZW5uZSA8bnNhZW56anVsaWVubmVAc3VzZS5kZT4KLS0t
CgogZHJpdmVycy9vZi9hZGRyZXNzLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvYWRkcmVz
cy5jIGIvZHJpdmVycy9vZi9hZGRyZXNzLmMKaW5kZXggOTc4NDI3YTlkNWU2Li4wZjg5ODc1NjE5
OWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvb2YvYWRkcmVzcy5jCisrKyBiL2RyaXZlcnMvb2YvYWRk
cmVzcy5jCkBAIC05MjIsNyArOTIyLDcgQEAgaW50IG9mX2RtYV9nZXRfcmFuZ2Uoc3RydWN0IGRl
dmljZV9ub2RlICpucCwgdTY0ICpkbWFfYWRkciwgdTY0ICpwYWRkciwgdTY0ICpzaXoKIHsKIAlz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBvZl9ub2RlX2dldChucCk7CiAJY29uc3QgX19iZTMy
ICpyYW5nZXMgPSBOVUxMOwotCWludCBsZW4sIG5hZGRyLCBuc2l6ZSwgcG5hOworCWludCBuYWRk
ciwgbnNpemUsIHBuYTsKIAlpbnQgcmV0ID0gMDsKIAl1NjQgZG1hYWRkcjsKIApAQCAtOTMxLDYg
KzkzMSw3IEBAIGludCBvZl9kbWFfZ2V0X3JhbmdlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIHU2
NCAqZG1hX2FkZHIsIHU2NCAqcGFkZHIsIHU2NCAqc2l6CiAKIAl3aGlsZSAoMSkgewogCQlzdHJ1
Y3QgZGV2aWNlX25vZGUgKnBhcmVudDsKKwkJaW50IGxlbjsKIAogCQluYWRkciA9IG9mX25fYWRk
cl9jZWxscyhub2RlKTsKIAkJbnNpemUgPSBvZl9uX3NpemVfY2VsbHMobm9kZSk7CkBAIC05NjIs
OCArOTYzLDYgQEAgaW50IG9mX2RtYV9nZXRfcmFuZ2Uoc3RydWN0IGRldmljZV9ub2RlICpucCwg
dTY0ICpkbWFfYWRkciwgdTY0ICpwYWRkciwgdTY0ICpzaXoKIAkJZ290byBvdXQ7CiAJfQogCi0J
bGVuIC89IHNpemVvZih1MzIpOwotCiAJcG5hID0gb2Zfbl9hZGRyX2NlbGxzKG5vZGUpOwogCiAJ
LyogZG1hLXJhbmdlcyBmb3JtYXQ6Ci0tIAoyLjIzLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
