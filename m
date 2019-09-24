Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F6BBD71A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 06:19:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCyj2-0000S1-N4; Wed, 25 Sep 2019 04:16:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4a6=XT=suse.de=nsaenzjulienne@srs-us1.protection.inumbo.net>)
 id 1iCpJE-0000Fn-1j
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 18:13:08 +0000
X-Inumbo-ID: f2101d6a-def6-11e9-9625-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f2101d6a-def6-11e9-9625-12813bfff9fa;
 Tue, 24 Sep 2019 18:13:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4A5C4ABBD;
 Tue, 24 Sep 2019 18:13:01 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Date: Tue, 24 Sep 2019 20:12:39 +0200
Message-Id: <20190924181244.7159-9-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2019 04:16:20 +0000
Subject: [Xen-devel] [PATCH 08/11] dts: arm64: layerscape: add dma-ranges
 property to pcie nodes
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
Cc: Mark Rutland <mark.rutland@arm.com>, f.fainelli@gmail.com,
 mbrugger@suse.com, wahrenst@gmx.net, james.quinlan@broadcom.com,
 robin.murphy@arm.com, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGJ1cyBiZWhpbmQgdGhlIGJvYXJkJ3MgUENJZSBjb3JlIGhhcyBETUEgYWRkcmVzc2luZyBs
aW1pdGF0aW9ucy4gQWRkCmFuIGVtcHR5ICdkbWEtcmFuZ2VzJyBwcm9wZXJ0eSBvbiBhbGwgUENJ
ZSBidXMgZGVzY3JpcHRpb25zIHRvIGluZm9ybQp0aGUgT0YgY29yZSB0aGF0IGEgdHJhbnNsYXRp
b24gaXMgZHVlIGZ1cnRoZXIgZG93biB0aGUgbGluZS4KClNpZ25lZC1vZmYtYnk6IE5pY29sYXMg
U2FlbnogSnVsaWVubmUgPG5zYWVuemp1bGllbm5lQHN1c2UuZGU+Ci0tLQoKIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczIwOHhhLmR0c2kgfCA0ICsrKysKIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHMyMDh4YS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWxzMjA4eGEuZHRzaQppbmRleCBmZDYwMzZiNzg2NWMuLjJjNDFjZmM2NmJiOSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMjA4eGEuZHRzaQorKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMyMDh4YS5kdHNpCkBAIC02NDAs
NiArNjQwLDcgQEAKIAkJCSNzaXplLWNlbGxzID0gPDI+OwogCQkJZGV2aWNlX3R5cGUgPSAicGNp
IjsKIAkJCWRtYS1jb2hlcmVudDsKKwkJCWRtYS1yYW5nZXM7CiAJCQludW0tdmlld3BvcnQgPSA8
Nj47CiAJCQlidXMtcmFuZ2UgPSA8MHgwIDB4ZmY+OwogCQkJbXNpLXBhcmVudCA9IDwmaXRzPjsK
QEAgLTY2MSw2ICs2NjIsNyBAQAogCQkJI3NpemUtY2VsbHMgPSA8Mj47CiAJCQlkZXZpY2VfdHlw
ZSA9ICJwY2kiOwogCQkJZG1hLWNvaGVyZW50OworCQkJZG1hLXJhbmdlczsKIAkJCW51bS12aWV3
cG9ydCA9IDw2PjsKIAkJCWJ1cy1yYW5nZSA9IDwweDAgMHhmZj47CiAJCQltc2ktcGFyZW50ID0g
PCZpdHM+OwpAQCAtNjgyLDYgKzY4NCw3IEBACiAJCQkjc2l6ZS1jZWxscyA9IDwyPjsKIAkJCWRl
dmljZV90eXBlID0gInBjaSI7CiAJCQlkbWEtY29oZXJlbnQ7CisJCQlkbWEtcmFuZ2VzOwogCQkJ
bnVtLXZpZXdwb3J0ID0gPDI1Nj47CiAJCQlidXMtcmFuZ2UgPSA8MHgwIDB4ZmY+OwogCQkJbXNp
LXBhcmVudCA9IDwmaXRzPjsKQEAgLTcwMyw2ICs3MDYsNyBAQAogCQkJI3NpemUtY2VsbHMgPSA8
Mj47CiAJCQlkZXZpY2VfdHlwZSA9ICJwY2kiOwogCQkJZG1hLWNvaGVyZW50OworCQkJZG1hLXJh
bmdlczsKIAkJCW51bS12aWV3cG9ydCA9IDw2PjsKIAkJCWJ1cy1yYW5nZSA9IDwweDAgMHhmZj47
CiAJCQltc2ktcGFyZW50ID0gPCZpdHM+OwotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
