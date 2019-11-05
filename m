Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D898AF0024
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 15:45:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS03K-0002Uo-Tb; Tue, 05 Nov 2019 14:43:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FZ3L=Y5=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1iS03I-0002Tx-OR
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 14:43:24 +0000
X-Inumbo-ID: 97523084-ffda-11e9-adbe-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.126.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97523084-ffda-11e9-adbe-bc764e2007e4;
 Tue, 05 Nov 2019 14:43:12 +0000 (UTC)
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7v18-1iWxrR1i5q-0053TC; Tue, 05 Nov 2019 15:42:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Tue,  5 Nov 2019 15:42:43 +0100
Message-Id: <20191105144247.10301-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ts98NfmfLnlsGeB7aeJ8lq36UwPs48GJqE0eLgOW0C9sAWmiD0o
 A+bEsOAg3Py4/VEjzLFyHEeW7gV4jDIo9Qxq+PKmuFAtCyaNV0Xu+iyYd2cmQRurTGwwZyD
 eAbdmiUQv/wMO1FDdYmuB7ZWXrh6SeWel3GrRu37pSYrriexBpdho5bC3O5k0ZEUpqCwCuM
 PHbrzpTPBN7148ETqrsPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HiWFcm3zl4c=:9Havqf+6M3eDHoN+3p5uq/
 S/DOD4piNU4EaSkrAYOo2HCCpmKaEdPxO69KJV9sSJvIl0qTxqse6tdHd2A/v9Egq2LDYzKZ+
 CMado3YPPoSGwAibKayV2kfqUbfwcCZW71G2M4cp2UNB2BbBdv6hDARJmUUJObXLQw6xb948J
 ifhlkmHnw70f+Yne2CuyoZjyotn60Jb1sttZiM24BtRiuR+HzRO4d+PqsR576oix8q/QxH5TB
 /2O1s/M1M5aCyhYgl+jYx/wW63Qgs6oXsA95KY+np4rAgIXDmB/FwTtUFvdGu3/qDm0n4Zms5
 L4WCcocizQ+Gbw/Xt4/xhjL/v0iJ1TUSe/DVGpOopUMKCH+BqCIPH70FGx01DB7R1ziDZCQxG
 MQqJBwWhUujr0d+jLvGSGOvQffG9uLdTzAIpknwYGjiB3HHBtRwCwGxJlkFeo5vXgsLvVoJYE
 BA7TIU8QDXaockqseH2kdE9h3zVOi02jjzadX1NbrJEOyfzdermQnt9jykdDbGWAMOCsXTg9N
 lLBPTpFAUDf9XYuKr7RtkVgvAwzQBPUt/86dWR/TKE5J0AtmK5YS9DQmxzq3ySO7pPdDIjNeJ
 SyTHkq4JPv157lZdN2+Z/7PiaHBmWdMs+MR2X0D5RkLPZDUX69xJTMoyvwHz2nbt8del5xw0x
 9O/U5EgBA5Jptz+hxkU8T2y+jWwdAiDk58VKgjA8kRQbXkI/wNhMs2r8jl0+1yUC1CtfG3XGk
 3C0oa/3Fi5zUUKHkOedbJMPy01xbbo0Mj2QB+0QO8ZB5G4puCEOdsmUtZbh/O4E/eE5OtZ4M3
 CJ4NNEtgjAoOREhJWhx8QClAVZnUgbzsQFEOykmIANRJKdEsTZYk4l9xJgT7P1uDEwOdGbuzk
 SssoIYkyNKfVWjPRnpUkIa7kSycgYAeae6eer+wk8=
Subject: [Xen-devel] [PULL 0/4] Trivial branch patches
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 Claudio Fontana <claudio.fontana@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzNjYwOWI0ZmEzNmYwYWM5MzQ4NzQz
NzE4NzQ0MTZmNzUzM2E1NDA4OgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL3BhbG1lci90YWdzL3BhbG1lci1mb3ItbWFzdGVyLTQuMi1zZjEnIGludG8gc3RhZ2luZyAo
MjAxOS0xMS0wMiAxNzo1OTowMyArMDAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0OgoKICBnaXQ6Ly9naXRodWIuY29tL3Zpdmllci9xZW11LmdpdCB0YWdzL3RyaXZp
YWwtYnJhbmNoLXB1bGwtcmVxdWVzdAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGEz
N2EzNmExMWI1ODRlMDgzYjFjNTc4ZjFkNjBlNmUwZjc4NzhkNWY6CgogIGdsb2JhbDogU3F1YXNo
ICd0aGUgdGhlJyAoMjAxOS0xMS0wNSAxNTowNjowOSArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KVHJpdmlhbCBm
aXhlcyAoMjAxOTExMDUpCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpEci4gRGF2aWQgQWxhbiBHaWxiZXJ0ICgxKToKICBn
bG9iYWw6IFNxdWFzaCAndGhlIHRoZScKCkdyZWcgS3VyeiAoMSk6CiAgcW9tOiBGaXggZXJyb3Ig
bWVzc2FnZSBpbiBvYmplY3RfY2xhc3NfcHJvcGVydHlfYWRkKCkKClBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpICgyKToKICBody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBBdm9pZCBjcmFzaCB3aGVu
IHdyaXRpbmcgdG8gUG5QIHJlZ2lzdGVycwogIGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEZp
eCA4LWJpdCBhY2Nlc3NlcwoKIGRpc2FzL2xpYnZpeGwvdml4bC9pbnZhbHNldC5oICAgICAgIHwg
IDIgKy0KIGRvY3MvaW50ZXJvcC9wci1oZWxwZXIucnN0ICAgICAgICAgIHwgIDIgKy0KIGRvY3Mv
c3BlY3MvcHBjLXNwYXByLWhvdHBsdWcudHh0ICAgIHwgIDIgKy0KIGRvY3Mvc3BlY3MvcHBjLXhp
dmUucnN0ICAgICAgICAgICAgIHwgIDIgKy0KIGRvY3Mvc3BlY3MvdHBtLnR4dCAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KIGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnAuYyAgICAgICAgIHwgMTIg
KysrKysrKysrKysrCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vYmxraWYuaCB8ICAyICst
CiBxb20vb2JqZWN0LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKystLS0tLS0KIHNj
cmlwdHMvZHVtcC1ndWVzdC1tZW1vcnkucHkgICAgICAgIHwgIDIgKy0KIDkgZmlsZXMgY2hhbmdl
ZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
