Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE4163303
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 10:45:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hklh4-0007AQ-UI; Tue, 09 Jul 2019 08:41:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AxFz=VG=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hklh3-0007AL-TS
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 08:41:45 +0000
X-Inumbo-ID: 60b267a9-a225-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 60b267a9-a225-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 08:41:44 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d24so9620977ljg.8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2019 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NCsMDWdhHqZtwRwQ6PNLfw280LznH3Mhnn8HSHFK/uU=;
 b=Ihe1/jQz8cYppZZNzfZOH9lwhukgEQiqqwKy7un7XxlRJ9kEycjvRccRsiwoC8g9yx
 Jb+LjZsbjgwIHLbUOfVXAatpBWy0xXhlHELVrXWrb5AI4X32+kcWz1+EKu505kU05SA3
 EQu7u7NNj6gBanHzFQMjEtRp447FMjZHH3zadz8O6cMThtxBWQFoZHrd4xC68bO9njFY
 1Zc7husaR0IWtTtAyXxfnvcoC0QjHCJE4QqsJrCo774ZSAKEqjakE9neUSDj0ejSmg+c
 2/PTW/SlBfYstXzdGSpv5rxJew8FHsPybqpiDLTI87vOSVixle4aQmXL/zrpD96hdEO2
 K9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NCsMDWdhHqZtwRwQ6PNLfw280LznH3Mhnn8HSHFK/uU=;
 b=dJDvzz4MDBJX/MBeCy0WFTPwg9sH0S3/EQlq86UdoMx2ZvPVDJNTT6OT1sCKt0Gp6Y
 5ut03oGyO0lbiHz8e+PPQ6mRn3g5/QgX9DYrRKgFOzgWoqhgKqXuyI5obDTxpgjxMaSe
 ZZ2lG81/wDXbtG8F1dzbhWVRSvxYoEj6a4ZyBvCwFukKOvfyd1lRztkiQZmQvqPLcHis
 6NgLwMUFKUf4UTE8iKkBAbWgPrXwBGfVLsDoXyM5eGOTU1VZ5z0dwQoQcWzR8OLIg4rF
 S5/KFWg08ccCvgyLNjqnoD2IjWRA/QNI7zfGfpb3UPFen9zXZxuHP8xMCrJ6GnruOUaD
 iR1A==
X-Gm-Message-State: APjAAAXYimYhoLDe/vmLyJW26UxvbBHAu700JnqZCRHIixpZoxD07kuU
 y+A0YiF/3/BrHaEvUjimgcpw75T+WB8=
X-Google-Smtp-Source: APXvYqzsZvXMDmi4Q8YBgkx/7HUllRKllxHWHIew+GJxDPrqIHfO5TeZAsIFGW1eXLXIboJ1wwXxBQ==
X-Received: by 2002:a2e:9155:: with SMTP id q21mr12893276ljg.198.1562661702376; 
 Tue, 09 Jul 2019 01:41:42 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m25sm3185996lfp.97.2019.07.09.01.41.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 01:41:41 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  9 Jul 2019 11:41:16 +0300
Message-Id: <20190709084116.11488-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xen/doc: Improve Dom0-less documentation
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
VmlrdG9yIE1pdGluIDx2aWt0b3JfbWl0aW5AZXBhbS5jb20+Ci0tLQogZG9jcy9mZWF0dXJlcy9k
b20wbGVzcy5wYW5kb2MgfCA1OCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9jIGIvZG9jcy9mZWF0dXJlcy9kb20w
bGVzcy5wYW5kb2MKaW5kZXggZTA3NmUzNzM5ZS4uZDRmNDRiNTUwMiAxMDA2NDQKLS0tIGEvZG9j
cy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MKKysrIGIvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5w
YW5kb2MKQEAgLTQwLDggKzQwLDggQEAgdG8gYm9vdC4gRm9yIGV4YW1wbGUgaWYgdGhpcyBpcyB0
aGUgYm9vdGNtZCBmb3IgWGVuIGFuZCBEb20wOgogCiAgICAgYm9vdG0gMHgxNDAwMDAwIDB4OTAw
MDAwMCAweDEyODAwMDAKIAotSWYgd2Ugd2FudCB0byBhZGQgb25lIERvbVUgd2l0aCBJbWFnZS1E
b21VwqBhcyB0aGUgRG9tVSBrZXJuZWwKLWFuZMKgcmFtZGlzay1Eb21VwqBhcyBEb21VIHJhbWRp
c2s6CitJZiB3ZSB3YW50IHRvIGFkZCBvbmUgRG9tVSB3aXRoIEltYWdlLURvbVUgYXMgdGhlIERv
bVUga2VybmVsCithbmQgcmFtZGlzay1Eb21VIGFzIERvbVUgcmFtZGlzazoKIAogICAgIHRmdHBi
IDB4MTI4MDAwMCB4ZW4uZHRiCiAgICAgdGZ0cGIgMHg4MDAwMCB4ZW4tSW1hZ2UKQEAgLTYxLDI1
ICs2MSwyNyBAQCB0aGUgcHJlc2VuY2Ugb2YgdGhlIGFkZGl0aW9uYWwgVk0gYW5kIGl0cyBjb25m
aWd1cmF0aW9uLiBJdCBpcyBkb25lIHZpYQogZGV2aWNlIHRyZWUgYWRkaW5nIGEgbm9kZSB1bmRl
ciAvY2hvc2VuIGFzIGZvbGxvd3M6CiAKICAgICBkb21VMSB7Ci0gICAgwqAgwqAgY29tcGF0aWJs
ZSA9ICJ4ZW4sZG9tYWluIjsKLSAgICDCoCDCoCBtZW1vcnkgPSA8MHgyMDAwMD47Ci0gICAgIMKg
IMKgY3B1cyA9IDE7Ci0gICAgwqDCoCDCoHZwbDAxMTsKLQotICAgIMKgIMKgIG1vZHVsZUAyMDAw
MDAwIHsKLSAgICDCoCDCoCDCoCDCoCBjb21wYXRpYmxlID0gIm11bHRpYm9vdCxrZXJuZWwiLCAi
bXVsdGlib290LG1vZHVsZSI7Ci0gICAgwqAgwqAgwqAgwqAgcmVnID0gPDB4MjAwMDAwMCAweGZm
ZmZmZj47Ci0gICAgwqAgwqAgwqAgwqAgYm9vdGFyZ3MgPSAiY29uc29sZT10dHlBTUEwIjsKLSAg
ICDCoCDCoCB9OwotCi0gICAgwqAgwqAgbW9kdWxlQDMwMDAwMDAwIHsKLSAgICDCoCDCoCDCoCDC
oCBjb21wYXRpYmxlID0gIm11bHRpYm9vdCxyYW1kaXNrIiwgIm11bHRpYm9vdCxtb2R1bGUiOwot
ICAgIMKgIMKgIMKgIMKgIHJlZyA9IDwweDMwMDAwMDAgMHhmZmZmZmY+OwotICAgIMKgIMKgIH07
CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4MDAwMDAwMDE+OworICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwweDAwMDAwMDAxPjsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJ4ZW4sZG9tYWluIjsK
KyAgICAgICAgbWVtb3J5ID0gPDB4MjAwMDA+OworICAgICAgICBjcHVzID0gMTsKKyAgICAgICAg
dnBsMDExOworCisgICAgICAgIG1vZHVsZUAyMDAwMDAwIHsKKyAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAibXVsdGlib290LGtlcm5lbCIsICJtdWx0aWJvb3QsbW9kdWxlIjsKKyAgICAgICAgICAg
IHJlZyA9IDwweDIwMDAwMDAgMHhmZmZmZmY+OworICAgICAgICAgICAgYm9vdGFyZ3MgPSAiY29u
c29sZT10dHlBTUEwIjsKKyAgICAgICAgfTsKKworICAgICAgICBtb2R1bGVAMzAwMDAwMDAgewor
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3QscmFtZGlzayIsICJtdWx0aWJvb3Qs
bW9kdWxlIjsKKyAgICAgICAgICAgIHJlZyA9IDwweDMwMDAwMDAgMHhmZmZmZmY+OworICAgICAg
ICB9OwogICAgIH07CiAKLVdoZXJlIG1lbW9yeSBpcyB0aGUgbWVtb3J5IG9mIHRoZSBWTSBpbiBL
QnMsIGNwdXPCoGlzIHRoZSBudW1iZXIgb2YKLWNwdXMuwqBtb2R1bGVAMjAwMDAwMCBhbmTCoG1v
ZHVsZUAzMDAwMDAwIGFkdmVydGlzZSB3aGVyZSB0aGUga2VybmVsIGFuZAorV2hlcmUgbWVtb3J5
IGlzIHRoZSBtZW1vcnkgb2YgdGhlIFZNIGluIEtCcywgY3B1cyBpcyB0aGUgbnVtYmVyIG9mCitj
cHVzLiBtb2R1bGVAMjAwMDAwMCBhbmQgbW9kdWxlQDMwMDAwMDAgYWR2ZXJ0aXNlIHdoZXJlIHRo
ZSBrZXJuZWwgYW5kCiByYW1kaXNrIGFyZSBpbiBtZW1vcnkuCiAKIFNlZSBkb2NzL21pc2MvYXJt
L2RldmljZS10cmVlL2Jvb3RpbmcudHh0IGZvciBtb3JlIGluZm9ybWF0aW9uLgpAQCAtMTExLDMg
KzExMywyMSBAQCBsaW1pdGF0aW9uczoKICAgdGhlIFhlbiBjb21tYW5kIGxpbmUuIFRoZSBOVUxM
IHNjaGVkdWxlciBhdXRvbWF0aWNhbGx5IGFzc2lnbnMgYW5kCiAgIHBpbnMgdkNQVXMgdG8gcENQ
VXMsIGJ1dCB0aGUgdkNQVS1wQ1BVIGFzc2lnbm1lbnRzIGNhbm5vdCBiZQogICBjb25maWd1cmVk
LgorCitOb3RlcworLS0tLS0KKworLSAneGwgY29uc29sZScgY29tbWFuZCB3aWxsIG5vdCBhdHRh
Y2ggdG8gdGhlIGRvbWFpbidzIGNvbnNvbGUgaW4gY2FzZQorICBvZiBkb20wbGVzcy4gRG9tVSBh
cmUgZG9tYWlucyBjcmVhdGVkIGJ5IFhlbiAoc2ltaWxhciB0byBEb20wKSBhbmQKKyAgdGhlcmVm
b3JlIHRoZXkgYXJlIGFsbCBtYW5hZ2VkIGJ5IFhlbiBhbmQgc29tZSBvZiB0aGUgY29tbWFuZHMg
bWF5IG5vdCB3b3JrLgorCisgIEEgdXNlciBpcyBhbGxvd2VkIHRvIGNvbmZpZ3VyZSB0aGUga2V5
IHNlcXVlbmNlIHRvIHN3aXRjaCBpbnB1dC4KKyAgUHJlc3NpbmcgdGhlIFhlbiAiY29uc3dpdGNo
IiAoQ3RybC1BIGJ5IGRlZmF1bHQpIHRocmVlIHRpbWVzCisgIHN3aXRjaGVzIGlucHV0IGluIGNh
c2Ugb2YgZG9tMGxlc3MgbW9kZS4KKworLSBEb21haW5zIGNyZWF0ZWQgYnkgWGVuIHdpbGwgaGF2
ZSBubyBuYW1lIGF0IGJvb3QuIERvbWFpbi0wIGhhcyBhIG5hbWUKKyAgdGhhbmtzIHRvIHRoZSBo
ZWxwZXIgeGVuLWluaXQtZG9tMCBjYWxsZWQgYXQgYm9vdCBieSB0aGUgaW5pdHNjcmlwdC4KKyAg
SWYgeW91IHdhbnQgdG8gc2V0dXAgRG9tVSBuYW1lLCB0aGVuIHlvdSB3aWxsIGhhdmUgdG8gY3Jl
YXRlIHRoZSB4ZW5zdG9yZQorICBub2RlIGFzc29jaWF0ZWQuIEJ5IGRlZmF1bHQgRG9tVSBuYW1l
cyBhcmUgc2hvd24gYXMgJyhudWxsKScgaW4gdGhlCisgIHhsIGRvbWFpbnMgbGlzdC4KKwotLSAK
Mi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
