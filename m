Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4A561E8D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 14:39:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkSsO-0003I5-85; Mon, 08 Jul 2019 12:36:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tA2P=VF=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hkSsN-0003I0-3M
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 12:36:11 +0000
X-Inumbo-ID: f666d72c-a17c-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f666d72c-a17c-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 12:36:10 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k18so15716290ljc.11
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2019 05:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GZoG1KtPYtC6yW7gvss4ZWEMmcA2S/pE2GGo7tuIv1g=;
 b=ahECgXrlKRQOxriMPkS1GaIKUW0YQZe1o+wgZ1WDeKtgOlKYPUmSY6/Df5lylt28gg
 LuhtdR7iM2SY6HznU0vgbFRhsHArAj92u/DBV7O2vOs/HDU802iZSWwQbAkzP92hfR7b
 L2VMf+3ZDivVfu5SAb9PjJNUdErM4xubYazCEyBMfop4JavRX/5mzDkHtIm0jriZ2sco
 YhudbRuhkQxv0Vc++aFga6LvFaEEA0hXLdv73HpLuYk5rw4a8gTUeNHcKBjPBXTumWy0
 X93ill6aMPUkTD/Uq48bbY+stUHhHXDMw2W/thYPsnuM2vWAR4W7srTvKL1cse57nNkV
 tPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GZoG1KtPYtC6yW7gvss4ZWEMmcA2S/pE2GGo7tuIv1g=;
 b=DppvyQpwIeCS/KP9RXBdE9fqfd8QDyGlVZym5BThsLD/6tjctohqQByNr4cAnNV22x
 YuBaWuP9jIAhlda7XVR9yxl9xCh0AB5MfzPLuqieEMiKyITTo0sEdEDZ5wdMFD2NCXiY
 lsPmUwNma7UFfg1QI+vb4mzSpvG3LYemXXHsUOzGVkV8jpFklUN/2TrMyff215UWkk2Z
 Bs6oVAhy9wQnRkGpqJVKWHQvXiL3P2SrEwvdnwQZTSLvChSDRjaSQFV8easVmoOWh26b
 fiD+z2OFDe7ARk1T0bCmwYYkJI3pSj48qxZGXNZUc2NaxxC5C6MMDGlI8BBpnTqKxyAx
 ijKg==
X-Gm-Message-State: APjAAAWktrIj8SZrkvWAWvZNILaFDNR3rJ0Ul1jRBasJ7ebrU9RyoKyt
 YCdzv0OLKwTN0oZKNh6sCWAduH4JUfg=
X-Google-Smtp-Source: APXvYqxSFMP1feE2Af4AEbdGrxd21/cFw38Oz7raoaX4qF+7+yZaqGEprGN+0Rrbz2IDZTImuZOYgQ==
X-Received: by 2002:a2e:8802:: with SMTP id x2mr10106419ljh.200.1562589368399; 
 Mon, 08 Jul 2019 05:36:08 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id q6sm3645335lji.70.2019.07.08.05.36.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 05:36:07 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  8 Jul 2019 15:35:45 +0300
Message-Id: <20190708123545.19406-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] Improve Dom0-less documentation
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

VXBkYXRlZCBjb25maWd1cmF0aW9uIGV4YW1wbGUgYWNjb3JkaW5nIHRvIGFybTY0CmFuZCBhZGRl
ZCBtb3JlIGNhc2VzIGFib3V0IGtub3duIHhsIGxpbWl0YXRpb25zLgoKU2lnbmVkLW9mZi1ieTog
VmlrdG9yIE1pdGluIDx2aWt0b3JfbWl0aW5AZXBhbS5jb20+Ci0tLQogZG9jcy9mZWF0dXJlcy9k
b20wbGVzcy5wYW5kb2MgfCAyOSArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MgYi9kb2NzL2ZlYXR1cmVzL2RvbTBsZXNzLnBh
bmRvYwppbmRleCBlMDc2ZTM3MzllLi45NjE4MTM2OTZmIDEwMDY0NAotLS0gYS9kb2NzL2ZlYXR1
cmVzL2RvbTBsZXNzLnBhbmRvYworKysgYi9kb2NzL2ZlYXR1cmVzL2RvbTBsZXNzLnBhbmRvYwpA
QCAtNjIsMTkgKzYyLDE5IEBAIGRldmljZSB0cmVlIGFkZGluZyBhIG5vZGUgdW5kZXIgL2Nob3Nl
biBhcyBmb2xsb3dzOgogCiAgICAgZG9tVTEgewogICAgIMKgIMKgIGNvbXBhdGlibGUgPSAieGVu
LGRvbWFpbiI7Ci0gICAgwqAgwqAgbWVtb3J5ID0gPDB4MjAwMDA+OworICAgIMKgIMKgIG1lbW9y
eSA9IDwweDAgMHgyMDAwMD47CiAgICAgIMKgIMKgY3B1cyA9IDE7CiAgICAgwqDCoCDCoHZwbDAx
MTsKIAogICAgIMKgIMKgIG1vZHVsZUAyMDAwMDAwIHsKICAgICDCoCDCoCDCoCDCoCBjb21wYXRp
YmxlID0gIm11bHRpYm9vdCxrZXJuZWwiLCAibXVsdGlib290LG1vZHVsZSI7Ci0gICAgwqAgwqAg
wqAgwqAgcmVnID0gPDB4MjAwMDAwMCAweGZmZmZmZj47CisgICAgwqAgwqAgwqAgwqAgcmVnID0g
PDB4MCAweDIwMDAwMDAgMHgwIDB4ZmZmZmZmPjsKICAgICDCoCDCoCDCoCDCoCBib290YXJncyA9
ICJjb25zb2xlPXR0eUFNQTAiOwogICAgIMKgIMKgIH07CiAKICAgICDCoCDCoCBtb2R1bGVAMzAw
MDAwMDAgewogICAgIMKgIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAibXVsdGlib290LHJhbWRpc2si
LCAibXVsdGlib290LG1vZHVsZSI7Ci0gICAgwqAgwqAgwqAgwqAgcmVnID0gPDB4MzAwMDAwMCAw
eGZmZmZmZj47CisgICAgwqAgwqAgwqAgwqAgcmVnID0gPDB4MCAweDMwMDAwMDAgMHgwIDB4ZmZm
ZmZmPjsKICAgICDCoCDCoCB9OwogICAgIH07CiAKQEAgLTkwLDEyICs5MCwyNSBAQCBMaW1pdGF0
aW9ucwogRG9tYWlucyBzdGFydGVkIGJ5IFhlbiBhdCBib290IHRpbWUgY3VycmVudGx5IGhhdmUg
dGhlIGZvbGxvd2luZwogbGltaXRhdGlvbnM6CiAKLS0gVGhleSBjYW5ub3QgYmUgcHJvcGVybHkg
c2h1dGRvd24gb3IgcmVib290ZWQgdXNpbmcgeGwuIElmIG9uZSBvZiB0aGVtCi0gIGNyYXNoZXMs
IHRoZSB3aG9sZSBwbGF0Zm9ybSBzaG91bGQgYmUgcmVib290ZWQuCi0KIC0gU29tZSB4bCBvcGVy
YXRpb25zIG1pZ2h0IG5vdCB3b3JrIGFzIGV4cGVjdGVkLiB4bCBpcyBtZWFudCB0byBiZSB1c2Vk
Ci0gIHdpdGggZG9tYWlucyB0aGF0IGhhdmUgYmVlbiBjcmVhdGVkIGJ5IGl0LiBVc2luZyB4bCB3
aXRoIGRvbWFpbnMKLSAgc3RhcnRlZCBieSBYZW4gYXQgYm9vdCBtaWdodCBub3Qgd29yayBhcyBl
eHBlY3RlZC4KKyAgd2l0aCBkb21haW5zIHRoYXQgaGF2ZSBiZWVuIGNyZWF0ZWQgYnkgaXQ6CisK
KyAgICAtPiBVc2luZyB4bCB3aXRoIGRvbWFpbnMgc3RhcnRlZCBieSBYZW4gYXQgYm9vdCBtaWdo
dCBub3Qgd29yaworICAgICAgIGFzIGV4cGVjdGVkLgorCisgICAgLT4gVGhleSBjYW5ub3QgYmUg
cHJvcGVybHkgc2h1dGRvd24gb3IgcmVib290ZWQgdXNpbmcgeGwuCisgICAgICAgSWYgb25lIG9m
IHRoZW0gY3Jhc2hlcywgdGhlIHdob2xlIHBsYXRmb3JtIHNob3VsZCBiZSByZWJvb3RlZC4KKwor
ICAgIC0+ICd4bCBjb25zb2xlJyBjb21tYW5kIHdpbGwgbm90IHN3aXRjaCBjb25zb2xlIGlucHV0
LgorICAgICAgIFR5cGUgJ0NUUkwtYScgdGhyZWUgdGltZXMgdG8gc3dpdGNoIGlucHV0IGluIGNh
c2Ugb2YgZG9tMGxlc3MgbW9kZS4KKworICAgIC0+ICd4bCBsaXN0JyBwcmludHMgdGhlIGxpc3Qg
b2YgZG9tYWlucy4KKyAgICAgICBIb3dldmVyIERvbVUgbmFtZXMgYXJlIHNob3duIGFzICcobnVs
bCknIGluIHRoZSBsaXN0LiBGb3IgZXhhbXBsZToKKworICAgICAgICByb290QGRvbTA6fiMgeGwg
bGlzdAorICAgICAgICBOYW1lICAgICAgICAgICAgICAgICAgICAgICAgIElEICAgTWVtIFZDUFVz
ICAgICAgU3RhdGUgICBUaW1lKHMpCisgICAgICAgIERvbWFpbi0wICAgICAgICAgICAgICAgICAg
ICAgIDAgICAyNTYgICAgIDQgICAgIHItLS0tLSAgICAgICA2LjIKKyAgICAgICAgKG51bGwpICAg
ICAgICAgICAgICAgICAgICAgICAgMSAgIDI1NiAgICAgMSAgICAgLWItLS0tICAgICAgIDEuNwog
CiAtIFRoZSBHSUMgdmVyc2lvbiBpcyB0aGUgbmF0aXZlIHZlcnNpb24uIEluIGFic2VuY2Ugb2Yg
b3RoZXIKICAgaW5mb3JtYXRpb24sIHRoZSBHSUMgdmVyc2lvbiBleHBvc2VkIHRvIHRoZSBkb21h
aW5zIHN0YXJ0ZWQgYnkgWGVuIGF0Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
