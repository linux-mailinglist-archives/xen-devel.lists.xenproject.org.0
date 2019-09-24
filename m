Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9922BD71B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 06:19:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCyj4-0000Uv-Ga; Wed, 25 Sep 2019 04:16:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4a6=XT=suse.de=nsaenzjulienne@srs-us1.protection.inumbo.net>)
 id 1iCpJO-0000H7-EJ
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 18:13:18 +0000
X-Inumbo-ID: f13de1b0-def6-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f13de1b0-def6-11e9-b588-bc764e2007e4;
 Tue, 24 Sep 2019 18:13:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4F0DAF03;
 Tue, 24 Sep 2019 18:12:59 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Date: Tue, 24 Sep 2019 20:12:38 +0200
Message-Id: <20190924181244.7159-8-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2019 04:16:20 +0000
Subject: [Xen-devel] [PATCH 07/11] dts: arm64: layerscape: add dma-ranges
 property to qoric-mc node
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

cW9yaXEtbWMncyBkcG1hY3MgRE1BIGNvbmZpZ3VyYXRpb24gaXMgaW5oZXJpdGVkIGZyb20gdGhl
aXIgcGFyZW50IG5vZGUsCndoaWNoIGFjdHMgYSBidXMgaW4gdGhpcyByZWdhcmQuIFNvIGZhciBp
dCBtYWtlZCBhbGwgZGV2aWNlcyBhcwpkbWEtY29oZXJlbnQgYnV0IG5vIGRtYS1yYW5nZXMgcmVj
b21tZW5kYXRpb24gaXMgbWFkZS4KClRoZSB0cnV0aCBpcyB0aGF0IHRoZSB1bmRlcmx5aW5nIGlu
dGVyY29ubmVjdCBoYXMgRE1BIGNvbnN0cmFpbnRzLCBzbwphZGQgYW4gZW1wdHkgZG1hLXJhbmdl
cyBpbiBxb3JpcS1tYydzIG5vZGUgaW4gb3JkZXIgZm9yIERUJ3MgRE1BCmNvbmZpZ3VyYXRpb24g
Y29kZSB0byBnZXQgdGhlIERNQSBjb25zdHJhaW50cyBmcm9tIGl0LgoKU2lnbmVkLW9mZi1ieTog
Tmljb2xhcyBTYWVueiBKdWxpZW5uZSA8bnNhZW56anVsaWVubmVAc3VzZS5kZT4KLS0tCgogYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA4OGEuZHRzaSB8IDEgKwogYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMjA4eGEuZHRzaSB8IDEgKwogYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEuZHRzaSB8IDEgKwogMyBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHMxMDg4YS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWxzMTA4OGEuZHRzaQppbmRleCBjNjc2ZDA3NzE3NjIuLmYwZDBiNjE0NWI3MiAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA4OGEuZHRzaQorKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDg4YS5kdHNpCkBAIC02OTgs
NiArNjk4LDcgQEAKIAkJCSAgICAgIDwweDAwMDAwMDAwIDB4MDgzNDAwMDAgMCAweDQwMDAwPjsg
LyogTUMgY29udHJvbCByZWcgKi8KIAkJCW1zaS1wYXJlbnQgPSA8Jml0cz47CiAJCQlpb21tdS1t
YXAgPSA8MCAmc21tdSAwIDA+OwkvKiBUaGlzIGlzIGZpeGVkLXVwIGJ5IHUtYm9vdCAqLworCQkJ
ZG1hLXJhbmdlczsKIAkJCWRtYS1jb2hlcmVudDsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDM+Owog
CQkJI3NpemUtY2VsbHMgPSA8MT47CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHMyMDh4YS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWxzMjA4eGEuZHRzaQppbmRleCA3YTBiZThlYWE4NGEuLmZkNjAzNmI3ODY1YyAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMjA4eGEuZHRzaQorKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMyMDh4YS5kdHNpCkBAIC0zNDAs
NiArMzQwLDcgQEAKIAkJCSAgICAgIDwweDAwMDAwMDAwIDB4MDgzNDAwMDAgMCAweDQwMDAwPjsg
LyogTUMgY29udHJvbCByZWcgKi8KIAkJCW1zaS1wYXJlbnQgPSA8Jml0cz47CiAJCQlpb21tdS1t
YXAgPSA8MCAmc21tdSAwIDA+OwkvKiBUaGlzIGlzIGZpeGVkLXVwIGJ5IHUtYm9vdCAqLworCQkJ
ZG1hLXJhbmdlczsKIAkJCWRtYS1jb2hlcmVudDsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDM+Owog
CQkJI3NpemUtY2VsbHMgPSA8MT47CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWx4MjE2MGEuZHRzaQppbmRleCA0MDhlMGVjZGNlNmEuLjM3MzViYjEzOWNiMiAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEuZHRzaQorKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNpCkBAIC04Njgs
NiArODY4LDcgQEAKIAkJCW1zaS1wYXJlbnQgPSA8Jml0cz47CiAJCQkvKiBpb21tdS1tYXAgcHJv
cGVydHkgaXMgZml4ZWQgdXAgYnkgdS1ib290ICovCiAJCQlpb21tdS1tYXAgPSA8MCAmc21tdSAw
IDA+OworCQkJZG1hLXJhbmdlczsKIAkJCWRtYS1jb2hlcmVudDsKIAkJCSNhZGRyZXNzLWNlbGxz
ID0gPDM+OwogCQkJI3NpemUtY2VsbHMgPSA8MT47Ci0tIAoyLjIzLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
