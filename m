Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488F5F0034
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 15:45:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS038-0002Q1-08; Tue, 05 Nov 2019 14:43:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FZ3L=Y5=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1iS036-0002Pn-CP
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 14:43:12 +0000
X-Inumbo-ID: 96d6700c-ffda-11e9-a19a-12813bfff9fa
Received: from mout.kundenserver.de (unknown [212.227.126.135])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96d6700c-ffda-11e9-a19a-12813bfff9fa;
 Tue, 05 Nov 2019 14:43:11 +0000 (UTC)
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MNOZO-1iHcpa0A94-00OnFO; Tue, 05 Nov 2019 15:43:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Tue,  5 Nov 2019 15:42:46 +0100
Message-Id: <20191105144247.10301-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105144247.10301-1-laurent@vivier.eu>
References: <20191105144247.10301-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:6lLJMzjHAvmf+zbwEIjFaYmgyD4Xp9wj/yXBg2phAoLtjGTLNyf
 jFjRccWeRNCD3ubmrfEp6pKPVm7zFgjB+CKCqYNlLfEM0oSrYgQF1m5aP+VPUibYsU/asll
 l0BTqu8MMLy2rC5IlFC/P74gFDbdiPqYjDS81gLzgE669CpGIkKZX6QpwL+i+h9nd3ihAHs
 k0aU8H/oBeIugwumgO8KA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9IzBdaTOrfc=:WVe7Hft7P5ufdiP75OVziB
 x8KctqAt8Cv13LcM75gj++4dutEn1v6LhQCSchEOYg+3tcCUGhIt50OpmFgITwSRxocBrT6e1
 bLP2HAWKwgcU66M482GnlsGwKAOwQSJubLVIpHxdSfMoOFUbTgySaV4aNsT8/NXQ44Ekpb6dj
 fkHmWUkptVIFOgHWCV8k7MOqOuGhzS4yhquR6JINooEiJtgAdBX7i7cYnis4JxR90Rq7mGqcm
 r8TB5sXsaFdr2oMLgWl23Fv+1rChP4I+6k371AwGaZIom+FcxtKUVlK9SnhPQErgGNMr0eaKv
 exQ23WnT7L0Q80b1ybigTikE0TmleJRNc/kVNs/6G0L9AQ6yIZpFpWoDb8rBApCbyt4ShbJPU
 ANLd4+KPQn2ALCD9oXPCD7JYQEAmtSclO/2X9fYeMaRedVAseex7WifatctvkBWGZ1NbpXfpD
 VJAmA+VGKVzMy1hC7r8S19oX6SnbiFpS6KrzdL+UBRPD6cYUfU1TMWr53tI+RSeydqA6CF7d+
 cI0ZBSSQ+ydwV0IgBhHd90uy2gMyoxuwEn2wacAXtC6zUy/R8Hdu1de7EpV6skhW6Dzb+TXyq
 nHnuwiwgIrNcSkeEn44cN7ThC6TWlXbVEo2lK+e/FtwcX2dLjRb9+7BAMOFpVcc1jnv03IeI6
 Y2l5mm0yZ489zSr+dbjUHxYaHF2spJzvD7vxmkeDD3V//U+togeiqoOm5AXdQJAcBcH1zAy3D
 b6tewJkju/xecXIYUa9kGmGwLWBWI1IMTK2wQ6W8+NQpz2/P78nHKQuxG6cQwqQI/rPdhAViP
 QWZcUcoFU7WV3kHIckvdm551ETQMMONk8tpB6dkM4yh7dSXhZjSapaolihSSiV7SlsFh/jcva
 rfBzTogkwOQAHn9mOXYA==
Subject: [Xen-devel] [PULL 3/4] qom: Fix error message in
 object_class_property_add()
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
 Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9yZz4KClRoZSBlcnJvciBtZXNzYWdlIGluIG9i
amVjdF9jbGFzc19wcm9wZXJ0eV9hZGQoKSB3YXMgY29waWVkIGZyb20Kb2JqZWN0X3Byb3BlcnR5
X2FkZCgpIGluIGNvbW1pdCAxNmJmN2Y1MjJhMmZmLiBDbGFyaWZ5IHRoYXQgaXQgaXMKYWJvdXQg
YSBjbGFzcywgbm90IGFuIG9iamVjdC4KCldoaWxlIGhlcmUsIGhhdmUgdGhlIGZvcm1hdCBzdHJp
bmcgaW4gYm90aCBmdW5jdGlvbnMgdG8gZml0IGluIGEKc2luZ2xlIGxpbmUgZm9yIGJldHRlciBn
cmVwLWFiaWxpdHksIGRlc3BpdGUgdGhlIGNoZWNrcGF0Y2ggd2FybmluZy4KClNpZ25lZC1vZmYt
Ynk6IEdyZWcgS3VyeiA8Z3JvdWdAa2FvZC5vcmc+ClJldmlld2VkLWJ5OiBMYXVyZW50IFZpdmll
ciA8bGF1cmVudEB2aXZpZXIuZXU+Ck1lc3NhZ2UtSWQ6IDwxNTcyODczODM1OTEuMjM0OTQyLjMx
MTg0MDU5MzUxOTA1ODQ5MC5zdGdpdEBiYWhpYS50bHNsYWIuaWJtLmNvbT4KU2lnbmVkLW9mZi1i
eTogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgotLS0KIHFvbS9vYmplY3QuYyB8
IDEwICsrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcW9tL29iamVjdC5jIGIvcW9tL29iamVjdC5jCmluZGV4IDZm
YTljNjE5ZmFjNC4uZDUxYjU3ZmJhMTFlIDEwMDY0NAotLS0gYS9xb20vb2JqZWN0LmMKKysrIGIv
cW9tL29iamVjdC5jCkBAIC0xMTA2LDkgKzExMDYsOCBAQCBvYmplY3RfcHJvcGVydHlfYWRkKE9i
amVjdCAqb2JqLCBjb25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICp0eXBlLAogICAgIH0KIAog
ICAgIGlmIChvYmplY3RfcHJvcGVydHlfZmluZChvYmosIG5hbWUsIE5VTEwpICE9IE5VTEwpIHsK
LSAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAiYXR0ZW1wdCB0byBhZGQgZHVwbGljYXRlIHByb3Bl
cnR5ICclcyciCi0gICAgICAgICAgICAgICAgICAgIiB0byBvYmplY3QgKHR5cGUgJyVzJykiLCBu
YW1lLAotICAgICAgICAgICAgICAgICAgIG9iamVjdF9nZXRfdHlwZW5hbWUob2JqKSk7CisgICAg
ICAgIGVycm9yX3NldGcoZXJycCwgImF0dGVtcHQgdG8gYWRkIGR1cGxpY2F0ZSBwcm9wZXJ0eSAn
JXMnIHRvIG9iamVjdCAodHlwZSAnJXMnKSIsCisgICAgICAgICAgICAgICAgICAgbmFtZSwgb2Jq
ZWN0X2dldF90eXBlbmFtZShvYmopKTsKICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgfQogCkBA
IC0xMTM5LDkgKzExMzgsOCBAQCBvYmplY3RfY2xhc3NfcHJvcGVydHlfYWRkKE9iamVjdENsYXNz
ICprbGFzcywKICAgICBPYmplY3RQcm9wZXJ0eSAqcHJvcDsKIAogICAgIGlmIChvYmplY3RfY2xh
c3NfcHJvcGVydHlfZmluZChrbGFzcywgbmFtZSwgTlVMTCkgIT0gTlVMTCkgewotICAgICAgICBl
cnJvcl9zZXRnKGVycnAsICJhdHRlbXB0IHRvIGFkZCBkdXBsaWNhdGUgcHJvcGVydHkgJyVzJyIK
LSAgICAgICAgICAgICAgICAgICAiIHRvIG9iamVjdCAodHlwZSAnJXMnKSIsIG5hbWUsCi0gICAg
ICAgICAgICAgICAgICAgb2JqZWN0X2NsYXNzX2dldF9uYW1lKGtsYXNzKSk7CisgICAgICAgIGVy
cm9yX3NldGcoZXJycCwgImF0dGVtcHQgdG8gYWRkIGR1cGxpY2F0ZSBwcm9wZXJ0eSAnJXMnIHRv
IGNsYXNzICh0eXBlICclcycpIiwKKyAgICAgICAgICAgICAgICAgICBuYW1lLCBvYmplY3RfY2xh
c3NfZ2V0X25hbWUoa2xhc3MpKTsKICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgfQogCi0tIAoy
LjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
