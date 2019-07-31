Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98457BB52
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 10:15:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsjhP-0003Aw-Rt; Wed, 31 Jul 2019 08:11:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mXbA=V4=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hsjhN-0003Ar-UX
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 08:11:02 +0000
X-Inumbo-ID: ba8fa511-b36a-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ba8fa511-b36a-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 08:10:59 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m23so64620679lje.12
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 01:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xsINnE21/z12OwlHqK0OoKpO3sGIVxy04XBcQbkMZ60=;
 b=LywT52jhGYQ+Un9le1tytfl0DY8mJKyD+qqoAV4bZ5I3MaqOi86emtoS0GPRCLzf6b
 7arlwrLZlblI84UFHW7wKuvXMMffFWc9RnQHlZ71rx+Ss045yFkXb8iv9JYjC13QMslE
 +tQWMd6YnvXCKDk5fMh66nGM3PtyDlkXMRXvuq01VhLG8qIhrm0Y33XVwsemSlebWev8
 O6XH7jLmBqzPV/vtb1EKC/qyxHvCLKoI8qcUYBH3FcnCkxl+kaAQ0TRGwN16PUVoLWJT
 GhAh1w2Ndb2yS2ZSsJsMD/S/7MHlOvT+/AqS+4iU1vBKfRKIoSRYz2+IYa1vLI90UHOs
 Ir4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xsINnE21/z12OwlHqK0OoKpO3sGIVxy04XBcQbkMZ60=;
 b=DthcgI9O3IW9V4zmP/RbptRXxDG9kYSdUpI8XNvA/pc0RWtwHEuv2Vp4Ez3e7z6pJu
 Y2rOjbY2Wq0OXzFEMLSkuTu9ZmWJtN/RxV93dca/0D2DH+jrt8konl5Kx+yDxRs2fywd
 c9pXnB9rgp7B79w2UhX7tdFS0bDw4TpOQm8v6rCwP2ipaY0iv+9o+uSs1PcLOdBwdYA3
 BdH6rghJO0KilYgKPtWN0lCpnQSVT9zjFJ5fi1nkkzRqwdADNVpYpDqoqLNfgAbC/19L
 X7N+/qS8shyezFQcfhn3KlphQ0l7W9xiF1AwtK+0LX3K7+7LsfNsoBNgVErI8JbYxLNY
 e+Ug==
X-Gm-Message-State: APjAAAUJVWH4x3EZc6UF7Yixm6I2NuYhCqTS0vLKFw3O4sHx1OViN8AO
 ZrHfuwFgYoZmniWI/GRk6BhveCE2gwU=
X-Google-Smtp-Source: APXvYqw9M5AiEPuzLLcYbAMrDeiLAcPaMDuwaYWE9Do5YmOA7j7kPHUyG6775OmQdjh9wPr3ievsyw==
X-Received: by 2002:a2e:7c15:: with SMTP id x21mr18951ljc.55.1564560658133;
 Wed, 31 Jul 2019 01:10:58 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id w21sm11720548lfl.84.2019.07.31.01.10.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 01:10:57 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 31 Jul 2019 11:10:41 +0300
Message-Id: <20190731081041.25256-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4] xen/doc: Improve Dom0-less documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

LSBDaGFuZ2VkIHVucHJpbnRhYmxlIGNoYXJhY3RlcnMgd2l0aCAlcy9cJXhBMC8gL2cKICBTbyBh
bGwgdGhlIHNwYWNlcyBhcmUgMHgyMCBub3cuCgotIEFkZGVkIGFkZHJlc3MtY2VsbHMgYW5kIHNp
emUtY2VsbHMgdG8gY29uZmlndXJhdGlvbiBleGFtcGxlLgogIFRoaXMgcmVzb2x2ZXMgdGhlIGRv
bTBsZXNzIGJvb3QgaXNzdWUgaW4gY2FzZSBvZiBhcm02NC4KCi0gQWRkZWQgc29tZSBub3RlcyBh
Ym91dCB4bCB0b29scyB1c2FnZSBpbiBjYXNlIG9mIGRvbTBsZXNzLgoKU2lnbmVkLW9mZi1ieTog
VmlrdG9yIE1pdGluIDx2aWt0b3JfbWl0aW5AZXBhbS5jb20+Ci0tLQp2NCB1cGRhdGVzOgogICAt
IGZpeGVkIGNwdXMgPDE+OwogICAtIGFkZGVkIG1lbW9yeSBzaXplIG5vdGU7CiAgIC0gY2hhbmdl
ZCBzb21lIG51bWJlcnMgdG8gZGVjaW1hbDsKCi0tLQogZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5w
YW5kb2MgfCA2MSArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Rv
Y3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9jIGIvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5k
b2MKaW5kZXggZTA3NmUzNzM5ZS4uYTJjOTVkMWZkNCAxMDA2NDQKLS0tIGEvZG9jcy9mZWF0dXJl
cy9kb20wbGVzcy5wYW5kb2MKKysrIGIvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MKQEAg
LTQwLDggKzQwLDggQEAgdG8gYm9vdC4gRm9yIGV4YW1wbGUgaWYgdGhpcyBpcyB0aGUgYm9vdGNt
ZCBmb3IgWGVuIGFuZCBEb20wOgoKICAgICBib290bSAweDE0MDAwMDAgMHg5MDAwMDAwIDB4MTI4
MDAwMAoKLUlmIHdlIHdhbnQgdG8gYWRkIG9uZSBEb21VIHdpdGggSW1hZ2UtRG9tVcKgYXMgdGhl
IERvbVUga2VybmVsCi1hbmTCoHJhbWRpc2stRG9tVcKgYXMgRG9tVSByYW1kaXNrOgorSWYgd2Ug
d2FudCB0byBhZGQgb25lIERvbVUgd2l0aCBJbWFnZS1Eb21VIGFzIHRoZSBEb21VIGtlcm5lbAor
YW5kIHJhbWRpc2stRG9tVSBhcyBEb21VIHJhbWRpc2s6CgogICAgIHRmdHBiIDB4MTI4MDAwMCB4
ZW4uZHRiCiAgICAgdGZ0cGIgMHg4MDAwMCB4ZW4tSW1hZ2UKQEAgLTYxLDI3ICs2MSwzMiBAQCB0
aGUgcHJlc2VuY2Ugb2YgdGhlIGFkZGl0aW9uYWwgVk0gYW5kIGl0cyBjb25maWd1cmF0aW9uLiBJ
dCBpcyBkb25lIHZpYQogZGV2aWNlIHRyZWUgYWRkaW5nIGEgbm9kZSB1bmRlciAvY2hvc2VuIGFz
IGZvbGxvd3M6CgogICAgIGRvbVUxIHsKLSAgICDCoCDCoCBjb21wYXRpYmxlID0gInhlbixkb21h
aW4iOwotICAgIMKgIMKgIG1lbW9yeSA9IDwweDIwMDAwPjsKLSAgICAgwqAgwqBjcHVzID0gMTsK
LSAgICDCoMKgIMKgdnBsMDExOwotCi0gICAgwqAgwqAgbW9kdWxlQDIwMDAwMDAgewotICAgIMKg
IMKgIMKgIMKgIGNvbXBhdGlibGUgPSAibXVsdGlib290LGtlcm5lbCIsICJtdWx0aWJvb3QsbW9k
dWxlIjsKLSAgICDCoCDCoCDCoCDCoCByZWcgPSA8MHgyMDAwMDAwIDB4ZmZmZmZmPjsKLSAgICDC
oCDCoCDCoCDCoCBib290YXJncyA9ICJjb25zb2xlPXR0eUFNQTAiOwotICAgIMKgIMKgIH07Ci0K
LSAgICDCoCDCoCBtb2R1bGVAMzAwMDAwMDAgewotICAgIMKgIMKgIMKgIMKgIGNvbXBhdGlibGUg
PSAibXVsdGlib290LHJhbWRpc2siLCAibXVsdGlib290LG1vZHVsZSI7Ci0gICAgwqAgwqAgwqAg
wqAgcmVnID0gPDB4MzAwMDAwMCAweGZmZmZmZj47Ci0gICAgwqAgwqAgfTsKKyAgICAgICAgI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDE+OworICAgICAgICBj
b21wYXRpYmxlID0gInhlbixkb21haW4iOworICAgICAgICBtZW1vcnkgPSA8MCA1MjQyODg+Owor
ICAgICAgICBjcHVzID0gPDE+OworICAgICAgICB2cGwwMTE7CisKKyAgICAgICAgbW9kdWxlQDIw
MDAwMDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIiwgIm11
bHRpYm9vdCxtb2R1bGUiOworICAgICAgICAgICAgcmVnID0gPDB4MjAwMDAwMCAweGZmZmZmZj47
CisgICAgICAgICAgICBib290YXJncyA9ICJjb25zb2xlPXR0eUFNQTAiOworICAgICAgICB9Owor
CisgICAgICAgIG1vZHVsZUAzMDAwMDAwMCB7CisgICAgICAgICAgICBjb21wYXRpYmxlID0gIm11
bHRpYm9vdCxyYW1kaXNrIiwgIm11bHRpYm9vdCxtb2R1bGUiOworICAgICAgICAgICAgcmVnID0g
PDB4MzAwMDAwMCAweGZmZmZmZj47CisgICAgICAgIH07CiAgICAgfTsKCi1XaGVyZSBtZW1vcnkg
aXMgdGhlIG1lbW9yeSBvZiB0aGUgVk0gaW4gS0JzLCBjcHVzwqBpcyB0aGUgbnVtYmVyIG9mCi1j
cHVzLsKgbW9kdWxlQDIwMDAwMDAgYW5kwqBtb2R1bGVAMzAwMDAwMCBhZHZlcnRpc2Ugd2hlcmUg
dGhlIGtlcm5lbCBhbmQKK1doZXJlIG1lbW9yeSBpcyB0aGUgbWVtb3J5IG9mIHRoZSBWTSBpbiBL
QnMsIGNwdXMgaXMgdGhlIG51bWJlciBvZgorY3B1cy4gbW9kdWxlQDIwMDAwMDAgYW5kIG1vZHVs
ZUAzMDAwMDAwIGFkdmVydGlzZSB3aGVyZSB0aGUga2VybmVsIGFuZAogcmFtZGlzayBhcmUgaW4g
bWVtb3J5LgoKK05vdGU6IHRoZSBzaXplIHNwZWNpZmllZCBzaG91bGQgZXhhY3RseSBtYXRjaCB0
aGUgc2l6ZSBvZiB0aGUgS2VybmVsL2luaXRyYW1mcy4KK090aGVyd2lzZSwgdGhleSBtYXkgYmUg
dW51c2FibGUgaW4gWGVuIChmb3IgaW5zdGFuY2UgaWYgdGhleSBhcmUgY29tcHJlc3NlZCkuCisK
IFNlZSBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0IGZvciBtb3JlIGluZm9y
bWF0aW9uLgoKIExpbWl0YXRpb25zCkBAIC0xMTEsMyArMTE2LDIxIEBAIGxpbWl0YXRpb25zOgog
ICB0aGUgWGVuIGNvbW1hbmQgbGluZS4gVGhlIE5VTEwgc2NoZWR1bGVyIGF1dG9tYXRpY2FsbHkg
YXNzaWducyBhbmQKICAgcGlucyB2Q1BVcyB0byBwQ1BVcywgYnV0IHRoZSB2Q1BVLXBDUFUgYXNz
aWdubWVudHMgY2Fubm90IGJlCiAgIGNvbmZpZ3VyZWQuCisKK05vdGVzCistLS0tLQorCistICd4
bCBjb25zb2xlJyBjb21tYW5kIHdpbGwgbm90IGF0dGFjaCB0byB0aGUgZG9tYWluJ3MgY29uc29s
ZSBpbiBjYXNlCisgIG9mIGRvbTBsZXNzLiBEb21VIGFyZSBkb21haW5zIGNyZWF0ZWQgYnkgWGVu
IChzaW1pbGFyIHRvIERvbTApIGFuZAorICB0aGVyZWZvcmUgdGhleSBhcmUgYWxsIG1hbmFnZWQg
YnkgWGVuIGFuZCBzb21lIG9mIHRoZSBjb21tYW5kcyBtYXkgbm90IHdvcmsuCisKKyAgQSB1c2Vy
IGlzIGFsbG93ZWQgdG8gY29uZmlndXJlIHRoZSBrZXkgc2VxdWVuY2UgdG8gc3dpdGNoIGlucHV0
LgorICBQcmVzc2luZyB0aGUgWGVuICJjb25zd2l0Y2giIChDdHJsLUEgYnkgZGVmYXVsdCkgdGhy
ZWUgdGltZXMKKyAgc3dpdGNoZXMgaW5wdXQgaW4gY2FzZSBvZiBkb20wbGVzcyBtb2RlLgorCist
IERvbWFpbnMgY3JlYXRlZCBieSBYZW4gd2lsbCBoYXZlIG5vIG5hbWUgYXQgYm9vdC4gRG9tYWlu
LTAgaGFzIGEgbmFtZQorICB0aGFua3MgdG8gdGhlIGhlbHBlciB4ZW4taW5pdC1kb20wIGNhbGxl
ZCBhdCBib290IGJ5IHRoZSBpbml0c2NyaXB0LgorICBJZiB5b3Ugd2FudCB0byBzZXR1cCBEb21V
IG5hbWUsIHRoZW4geW91IHdpbGwgaGF2ZSB0byBjcmVhdGUgdGhlIHhlbnN0b3JlCisgIG5vZGUg
YXNzb2NpYXRlZC4gQnkgZGVmYXVsdCBEb21VIG5hbWVzIGFyZSBzaG93biBhcyAnKG51bGwpJyBp
biB0aGUKKyAgeGwgZG9tYWlucyBsaXN0LgorCi0tCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
