Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA46BBA48
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 19:18:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCRwe-0006KI-Pf; Mon, 23 Sep 2019 17:16:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kgmz=XS=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iCQzH-0000w4-7a
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 16:14:55 +0000
X-Inumbo-ID: 45b68542-de1d-11e9-9604-12813bfff9fa
Received: from relay.sw.ru (unknown [185.231.240.75])
 by localhost (Halon) with ESMTPS
 id 45b68542-de1d-11e9-9604-12813bfff9fa;
 Mon, 23 Sep 2019 16:14:52 +0000 (UTC)
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQx1-0001Fp-PU; Mon, 23 Sep 2019 19:12:35 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Mon, 23 Sep 2019 19:12:31 +0300
Message-Id: <20190923161231.22028-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 17:16:12 +0000
Subject: [Xen-devel] [RFC v2 9/9] fix-compilation: includes
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
Cc: stefanha@redhat.com, codyprime@gmail.com, jan.kiszka@siemens.com,
 eblake@redhat.com, berto@igalia.com, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, pasic@linux.ibm.com,
 hpoussin@reactos.org, anthony.perard@citrix.com, samuel.thibault@ens-lyon.org,
 philmd@redhat.com, green@moxielogic.com, lvivier@redhat.com,
 ehabkost@redhat.com, xiechanglong.d@gmail.com, pl@kamp.de, dgilbert@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 ronniesahlberg@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 vsementsov@virtuozzo.com, andrew@aj.id.au, crwulff@gmail.com,
 sundeep.lkml@gmail.com, michael@walle.cc, qemu-ppc@nongnu.org,
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, fam@euphon.net,
 peter.maydell@linaro.org, sheepdog@lists.wpkg.org, david@redhat.com,
 palmer@sifive.com, thuth@redhat.com, jcmvbkbc@gmail.com, den@openvz.org,
 hare@suse.com, sstabellini@kernel.org, arei.gonglei@huawei.com,
 marcel.apfelbaum@gmail.com, namei.unix@gmail.com, atar4qemu@gmail.com,
 farman@linux.ibm.com, amit@kernel.org, sw@weilnetz.de, groug@kaod.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org, cohuck@redhat.com,
 amarkovic@wavecomp.com, aurelien@aurel32.net, pburton@wavecomp.com,
 sagark@eecs.berkeley.edu, jasowang@redhat.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, ari@tuxera.com,
 quintela@redhat.com, mdroth@linux.vnet.ibm.com, lersek@redhat.com,
 borntraeger@de.ibm.com, antonynpavlov@gmail.com, dillaman@redhat.com,
 joel@jms.id.au, xen-devel@lists.xenproject.org, integration@gluster.org,
 balrogg@gmail.com, rjones@redhat.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, mst@redhat.com,
 mark.cave-ayland@ilande.co.uk, v.maffione@gmail.com, marex@denx.de,
 armbru@redhat.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, pavel.dovgaluk@ispras.ru, g.lettieri@iet.unipi.it,
 rizzo@iet.unipi.it, david@gibson.dropbear.id.au, akrowiak@linux.ibm.com,
 berrange@redhat.com, xiaoguangrong.eric@gmail.com, pmorel@linux.ibm.com,
 wencongyang2@huawei.com, jcd@tribudubois.net, pbonzini@redhat.com,
 stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SG1tLiBTaG91bGQgd2UgYWxsb3cgZW1wdHkgc3R1YnMgd2l0aCBlcnJwIHBhcmFtZXRlciB3aXRo
b3V0IGNhbGxpbmcKbmV3IG1hY3JvPwoKT3IsIGp1c3QgYXBwbHkgdGhpcyBjb21taXQgYmVmb3Jl
IGF1dG8tZ2VuZXJhdGVkIGNvbW1pdC4KClNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIFNlbWVudHNv
di1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4KLS0tCiB0YXJnZXQvcHBjL2t2
bV9wcGMuaCAgICAgICAgfCAyICsrCiB0YXJnZXQvczM5MHgvY3B1X21vZGVscy5oICAgfCAxICsK
IGh3L2kzODYva3ZtL2FwaWMuYyAgICAgICAgICB8IDEgKwogaHcvbWlzYy9hcm0xMXNjdS5jICAg
ICAgICAgIHwgMSArCiBody9taXNjL21wczItc2NjLmMgICAgICAgICAgfCAxICsKIGh3L3BjaS1i
cmlkZ2UvZGVjLmMgICAgICAgICB8IDEgKwogcWFwaS9xYXBpLWRlYWxsb2MtdmlzaXRvci5jIHwg
MSArCiBzdHVicy94ZW4taHZtLmMgICAgICAgICAgICAgfCAxICsKIDggZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L3BwYy9rdm1fcHBjLmggYi90YXJn
ZXQvcHBjL2t2bV9wcGMuaAppbmRleCA4MDdjMjQ1ZTkwLi5mNjM2NmMxOWFhIDEwMDY0NAotLS0g
YS90YXJnZXQvcHBjL2t2bV9wcGMuaAorKysgYi90YXJnZXQvcHBjL2t2bV9wcGMuaApAQCAtOSw2
ICs5LDggQEAKICNpZm5kZWYgS1ZNX1BQQ19ICiAjZGVmaW5lIEtWTV9QUENfSAogCisjaW5jbHVk
ZSAicWFwaS9lcnJvci5oIgorCiAjZGVmaW5lIFRZUEVfSE9TVF9QT1dFUlBDX0NQVSBQT1dFUlBD
X0NQVV9UWVBFX05BTUUoImhvc3QiKQogCiAjaWZkZWYgQ09ORklHX0tWTQpkaWZmIC0tZ2l0IGEv
dGFyZ2V0L3MzOTB4L2NwdV9tb2RlbHMuaCBiL3RhcmdldC9zMzkweC9jcHVfbW9kZWxzLmgKaW5k
ZXggNTMyOTA0NWE3MS4uMDYyMTYxYzVmYSAxMDA2NDQKLS0tIGEvdGFyZ2V0L3MzOTB4L2NwdV9t
b2RlbHMuaAorKysgYi90YXJnZXQvczM5MHgvY3B1X21vZGVscy5oCkBAIC0xNiw2ICsxNiw3IEBA
CiAjaW5jbHVkZSAiY3B1X2ZlYXR1cmVzLmgiCiAjaW5jbHVkZSAiZ2VuLWZlYXR1cmVzLmgiCiAj
aW5jbHVkZSAiaHcvY29yZS9jcHUuaCIKKyNpbmNsdWRlICJxYXBpL2Vycm9yLmgiCiAKIC8qIHN0
YXRpYyBDUFUgZGVmaW5pdGlvbiAqLwogc3RydWN0IFMzOTBDUFVEZWYgewpkaWZmIC0tZ2l0IGEv
aHcvaTM4Ni9rdm0vYXBpYy5jIGIvaHcvaTM4Ni9rdm0vYXBpYy5jCmluZGV4IGQxMjViMzcwZjQu
LmNhZGY3NWI3MWMgMTAwNjQ0Ci0tLSBhL2h3L2kzODYva3ZtL2FwaWMuYworKysgYi9ody9pMzg2
L2t2bS9hcGljLmMKQEAgLTE4LDYgKzE4LDcgQEAKICNpbmNsdWRlICJzeXNlbXUvaHdfYWNjZWwu
aCIKICNpbmNsdWRlICJzeXNlbXUva3ZtLmgiCiAjaW5jbHVkZSAidGFyZ2V0L2kzODYva3ZtX2kz
ODYuaCIKKyNpbmNsdWRlICJxYXBpL2Vycm9yLmgiCiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1f
YXBpY19zZXRfcmVnKHN0cnVjdCBrdm1fbGFwaWNfc3RhdGUgKmthcGljLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJlZ19pZCwgdWludDMyX3QgdmFsKQpkaWZmIC0t
Z2l0IGEvaHcvbWlzYy9hcm0xMXNjdS5jIGIvaHcvbWlzYy9hcm0xMXNjdS5jCmluZGV4IGJlZmM4
NWYzMjEuLjljMWZlYzc4MjUgMTAwNjQ0Ci0tLSBhL2h3L21pc2MvYXJtMTFzY3UuYworKysgYi9o
dy9taXNjL2FybTExc2N1LmMKQEAgLTEzLDYgKzEzLDcgQEAKICNpbmNsdWRlICJody9xZGV2LXBy
b3BlcnRpZXMuaCIKICNpbmNsdWRlICJxZW11L2xvZy5oIgogI2luY2x1ZGUgInFlbXUvbW9kdWxl
LmgiCisjaW5jbHVkZSAicWFwaS9lcnJvci5oIgogCiBzdGF0aWMgdWludDY0X3QgbXBjb3JlX3Nj
dV9yZWFkKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIG9mZnNldCwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgc2l6ZSkKZGlmZiAtLWdpdCBhL2h3L21pc2MvbXBzMi1zY2Mu
YyBiL2h3L21pc2MvbXBzMi1zY2MuYwppbmRleCBmMmEwMGQzMjM1Li5jNDFlNzc2OTk2IDEwMDY0
NAotLS0gYS9ody9taXNjL21wczItc2NjLmMKKysrIGIvaHcvbWlzYy9tcHMyLXNjYy5jCkBAIC0y
Niw2ICsyNiw3IEBACiAjaW5jbHVkZSAiaHcvcmVnaXN0ZXJmaWVsZHMuaCIKICNpbmNsdWRlICJo
dy9taXNjL21wczItc2NjLmgiCiAjaW5jbHVkZSAiaHcvcWRldi1wcm9wZXJ0aWVzLmgiCisjaW5j
bHVkZSAicWFwaS9lcnJvci5oIgogCiBSRUczMihDRkcwLCAwKQogUkVHMzIoQ0ZHMSwgNCkKZGlm
ZiAtLWdpdCBhL2h3L3BjaS1icmlkZ2UvZGVjLmMgYi9ody9wY2ktYnJpZGdlL2RlYy5jCmluZGV4
IGZiZTc4MTQ3NGUuLjA2NDQ1ZTA1NDUgMTAwNjQ0Ci0tLSBhL2h3L3BjaS1icmlkZ2UvZGVjLmMK
KysrIGIvaHcvcGNpLWJyaWRnZS9kZWMuYwpAQCAtMzEsNiArMzEsNyBAQAogI2luY2x1ZGUgImh3
L3BjaS9wY2lfaG9zdC5oIgogI2luY2x1ZGUgImh3L3BjaS9wY2lfYnJpZGdlLmgiCiAjaW5jbHVk
ZSAiaHcvcGNpL3BjaV9idXMuaCIKKyNpbmNsdWRlICJxYXBpL2Vycm9yLmgiCiAKIC8qIGRlYnVn
IERFQyAqLwogLy8jZGVmaW5lIERFQlVHX0RFQwpkaWZmIC0tZ2l0IGEvcWFwaS9xYXBpLWRlYWxs
b2MtdmlzaXRvci5jIGIvcWFwaS9xYXBpLWRlYWxsb2MtdmlzaXRvci5jCmluZGV4IDNlZTRjN2Ey
ZTcuLmUyNjVlMjkyMzQgMTAwNjQ0Ci0tLSBhL3FhcGkvcWFwaS1kZWFsbG9jLXZpc2l0b3IuYwor
KysgYi9xYXBpL3FhcGktZGVhbGxvYy12aXNpdG9yLmMKQEAgLTE2LDYgKzE2LDcgQEAKICNpbmNs
dWRlICJxYXBpL2RlYWxsb2MtdmlzaXRvci5oIgogI2luY2x1ZGUgInFhcGkvcW1wL3FudWxsLmgi
CiAjaW5jbHVkZSAicWFwaS92aXNpdG9yLWltcGwuaCIKKyNpbmNsdWRlICJxYXBpL2Vycm9yLmgi
CiAKIHN0cnVjdCBRYXBpRGVhbGxvY1Zpc2l0b3IKIHsKZGlmZiAtLWdpdCBhL3N0dWJzL3hlbi1o
dm0uYyBiL3N0dWJzL3hlbi1odm0uYwppbmRleCA4NDBhMmEwZDA5Li4zNTBjNzYyYzY0IDEwMDY0
NAotLS0gYS9zdHVicy94ZW4taHZtLmMKKysrIGIvc3R1YnMveGVuLWh2bS5jCkBAIC0xMiw2ICsx
Miw3IEBACiAjaW5jbHVkZSAiaHcveGVuL3hlbi5oIgogI2luY2x1ZGUgImV4ZWMvbWVtb3J5Lmgi
CiAjaW5jbHVkZSAicWFwaS9xYXBpLWNvbW1hbmRzLW1pc2MuaCIKKyNpbmNsdWRlICJxYXBpL2Vy
cm9yLmgiCiAKIGludCB4ZW5fcGNpX3Nsb3RfZ2V0X3BpcnEoUENJRGV2aWNlICpwY2lfZGV2LCBp
bnQgaXJxX251bSkKIHsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
