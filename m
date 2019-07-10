Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80664031
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 07:02:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl4gd-0002xi-Af; Wed, 10 Jul 2019 04:58:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p8cy=VH=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hl4gb-0002xd-Ux
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 04:58:34 +0000
X-Inumbo-ID: 5d34a1f6-a2cf-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5d34a1f6-a2cf-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 04:58:32 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x3so628790lfc.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2019 21:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tzhHu3osufUDNS3MMblcipEpmxzgWRGZQwGlKC3tQHY=;
 b=cvpUN0tGRgtUlFiHmlNwLYam/3U/DmO0cp8xnndArKyQ6r/hYN9ZDOonE368MnrI33
 TeEFzxc5vsZl+tCK85TN7oKs/j8e66VlUv4tpbevT3r/tecNpXftTyH50w4wABtvSmz0
 RGHsLvOAFN+jAnP41a9TwjxNs0Edm6lhtZm28LOVzovsH31/LJY5aIUNlInp2/Xsf3RV
 qwN7XLuVBgnMtKAD45SQiCXA6mNpcn2nhs9uq3ym6fSlqcKAJTQO9OL5E7lbNa3XQeUX
 xtAoByiijjVjX4i2mbSrH+XtLiEvt4xHYOJjXkJg9xkXYG4TxYNFW4e0CvD9aGuUHiY5
 aTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tzhHu3osufUDNS3MMblcipEpmxzgWRGZQwGlKC3tQHY=;
 b=NPfJTPDPdFPr5KJQ7Vz3kSbpneEdIFbwxjwOS7yxiy+C2a5LN/XNQqII5E4guUdEBf
 qc0KU5B1hM+BP6pQozWXPkJMhl4K0RKt8/RLG08dnlAIofHqzV21dPYluh2T4cQjP776
 n4Gy6wyJ5S89KVFMaIV+tVz7z9gRTqEyRYEf10HGJGNZwJP8E32V/cLyZ5WjVS5I+/PO
 YUZWPkWIpEctuZdl9bhzX5XobX+uqFgHsqf0Xvcglb9Ne9QYlNWDCbwLg0Flp2LboMm7
 by7jFTPiyu614NlhY0zyIBYI/MwUegEEEyewfn+vqBI9x4DlYr56dPuleIjEKVBUZVcy
 qrpw==
X-Gm-Message-State: APjAAAWPtLlid65kVi2HpIO8wi7wQlXKY5PMWM7Yr3HCTzcmqkT+9hcV
 uux4EdlutuQSkUOC/zRXRMtJ/Fuky18=
X-Google-Smtp-Source: APXvYqzADh3z/Lu0o2/3V08aatUuDoA+KpvhpMTFiKKyrmV24TfbLg5jqa6YlssB+QIVTGzkh+vFKQ==
X-Received: by 2002:ac2:596c:: with SMTP id h12mr13768344lfp.101.1562734710825; 
 Tue, 09 Jul 2019 21:58:30 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id q4sm250232lje.99.2019.07.09.21.58.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 21:58:30 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 10 Jul 2019 07:57:37 +0300
Message-Id: <20190710045737.27389-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v2] xen/doc: update ARM warning about testing
 gcov on arm
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXBkYXRlIEFSTSBjb2RlIGNvdmVyYWdlIHdhcm5pbmcgYWJvdXQgdGVzdGluZyBnY292IG9uIGFy
bQoKU2lnbmVkLW9mZi1ieTogVmlrdG9yIE1pdGluIDx2aWt0b3JfbWl0aW5AZXBhbS5jb20+Cgot
LS0KdjI6CiAgIHVwZGF0ZWQgb25seSBwYXJ0IG9mIHRoZSB3YXJuaW5nIHJlbGF0ZWQgdG8gdGVz
dGluZyBvbiBBUk0KCi0tLQogZG9jcy9oeXBlcnZpc29yLWd1aWRlL2NvZGUtY292ZXJhZ2UucnN0
IHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kb2NzL2h5cGVydmlzb3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3Qg
Yi9kb2NzL2h5cGVydmlzb3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3QKaW5kZXggM2NlYmYyZDk2
ZS4uNmM3NTUyZDY5MSAxMDA2NDQKLS0tIGEvZG9jcy9oeXBlcnZpc29yLWd1aWRlL2NvZGUtY292
ZXJhZ2UucnN0CisrKyBiL2RvY3MvaHlwZXJ2aXNvci1ndWlkZS9jb2RlLWNvdmVyYWdlLnJzdApA
QCAtOCw5ICs4LDggQEAgc28gc29tZSBleHRyYSBzdGVwcyBhcmUgcmVxdWlyZWQgdG8gY29sbGVj
dCBhbmQgcHJvY2VzcyB0aGUgZGF0YS4KIAogLi4gd2FybmluZzo6CiAKLSAgQ292ZXJhZ2UgaGFz
IG9ubHkgYmVlbiB0ZXN0ZWQgb24geDg2IGF0IHRoZSBtb21lbnQuICBBUk0gZG9lc24ndCBjdXJy
ZW50bHkKLSAgYm9vdCB3aGVuIHRoZSBmaW5hbCBiaW5hcnkgZXhjZWVkcyAyTUIgaW4gc2l6ZSwg
YW5kIHRoZSBjb3ZlcmFnZSBidWlsZCB0ZW5kcwotICB0byBleGNlZWRzIHRoaXMgbGltaXQuCisg
IEFSTSBkb2Vzbid0IGN1cnJlbnRseSBib290IHdoZW4gdGhlIGZpbmFsIGJpbmFyeSBleGNlZWRz
IDJNQiBpbiBzaXplLAorICBhbmQgdGhlIGNvdmVyYWdlIGJ1aWxkIHRlbmRzIHRvIGV4Y2VlZCB0
aGlzIGxpbWl0LgogCiAKIENvbXBpbGluZyBYZW4KLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
