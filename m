Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D48FFB9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 12:08:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyZ7d-0005HW-O2; Fri, 16 Aug 2019 10:06:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gc0g=WM=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1hyZ7b-0005HL-Qo
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 10:06:11 +0000
X-Inumbo-ID: 77167972-c00d-11e9-8bb3-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77167972-c00d-11e9-8bb3-12813bfff9fa;
 Fri, 16 Aug 2019 10:06:08 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j16so1001235wrr.8
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2019 03:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4nmllPcEhYaEJs68tgHuQ5qqmn++ZDafoOXvJZcokHk=;
 b=bSJHoIbGGIBDFSgjDlvcALz80MQc5NG56BWiDelnFCrwQVWgAVGcmLNRYaJVE3qIts
 zh5iz4/ci20EprZUp4GCPtPeguhmjZQo87ONEV5dso9X8Aa6Jy6eMTu8Pr4WyjBpYe75
 8ASbbISmYQ5OVOVgjjcItIza44V+UKk+kQegqLAyQpK3FQvogQ75l5z2jyv0lIlSb2jx
 DIQ97Es2kqmKhygB9LyuY6ZHJ6GcTKvTiAP/so7fhWxCBawSOCawehdsrPdi2d6wHPRL
 NkNJRW9KctwOtG9mAADTPRttWluPMuXKFWZf6Qyyl/ed48HirZ7q0m1dKuHIZ1w7J4/w
 H0jA==
X-Gm-Message-State: APjAAAXGWMkS0fNgBMUq/V5IYlVha9mYQ8x0RnojaTyEP+LcRVKWKh+2
 r8DLcxlDvCEhLcRxwzzgpDLSew==
X-Google-Smtp-Source: APXvYqz+oIj1oEb5S9Wcb1SdPyATJ1ItG3ZInp8JTtTW+nFG+aYKAl8f6PS/MrJCfAiBLINYgwP9ow==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr9597279wrm.12.1565949967319;
 Fri, 16 Aug 2019 03:06:07 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id u130sm8566224wmg.28.2019.08.16.03.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2019 03:06:06 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565940916012.8169@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <22d6f51c-c734-3976-2fc1-34c9c74a075e@redhat.com>
Date: Fri, 16 Aug 2019 12:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565940916012.8169@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 27/42] hw/pci-host: Declare
 device little or big endian
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, balrogg@gmail.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 amarkovic@wavecomp.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, lersek@redhat.com,
 Andrew.Baumann@microsoft.com, mreitz@redhat.com, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 jslaby@suse.cz, marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNi8xOSA5OjM1IEFNLCB0b255Lm5ndXllbkBidC5jb20gd3JvdGU6Cj4gRm9yIGVhY2gg
ZGV2aWNlIGRlY2xhcmVkIHdpdGggREVWSUNFX05BVElWRV9FTkRJQU4sIGZpbmQgdGhlIHNldCBv
Zgo+IHRhcmdldHMgZnJvbSB0aGUgc2V0IG9mIHRhcmdldC9ody8qL2RldmljZS5vLgo+IAo+IElm
IHRoZSBzZXQgb2YgdGFyZ2V0cyBhcmUgYWxsIGxpdHRsZSBvciBhbGwgYmlnIGVuZGlhbiwgcmUt
ZGVjbGFyZQo+IHRoZSBkZXZpY2UgZW5kaWFubmVzcyBhcyBERVZJQ0VfTElUVExFX0VORElBTiBv
ciBERVZJQ0VfQklHX0VORElBTgo+IHJlc3BlY3RpdmVseS4KPiAKPiBUaGlzICpuYWl2ZSogZGVk
dWN0aW9uIG1heSByZXN1bHQgaW4gZ2VudWluZWx5IG5hdGl2ZSBlbmRpYW4gZGV2aWNlcwo+IGJl
aW5nIGluY29ycmVjdGx5IGRlY2xhcmVkIGFzIGxpdHRsZSBvciBiaWcgZW5kaWFuLCBidXQgc2hv
dWxkIG5vdAo+IGludHJvZHVjZSByZWdyZXNzaW9ucyBmb3IgY3VycmVudCB0YXJnZXRzLgo+IAo+
IFRoZXNlIGRldmljZXMgc2hvdWxkIGJlIHJlLWRlY2xhcmVkIGFzIERFVklDRV9OQVRJVkVfRU5E
SUFOIGlmIDEpIGl0Cj4gaGFzIGEgbmV3IHRhcmdldCB3aXRoIGFuIG9wcG9zaXRlIGVuZGlhbiBv
ciAyKSBzb21lb25lIGluZm9ybWVkIGtub3dzCj4gYmV0dGVyID0pCj4gCj4gU2lnbmVkLW9mZi1i
eTogVG9ueSBOZ3V5ZW4gPHRvbnkubmd1eWVuQGJ0LmNvbT4KPiAtLS0KPiDCoGh3L3BjaS1ob3N0
L3EzNS5jIMKgIMKgIMKgIHwgMiArLQo+IMKgaHcvcGNpLWhvc3QvdmVyc2F0aWxlLmMgfCA0ICsr
LS0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9xMzUuYyBiL2h3L3BjaS1ob3N0L3EzNS5jCj4g
aW5kZXggMGEwMTBiZS4uZmQyMGY3MiAxMDA2NDQKPiAtLS0gYS9ody9wY2ktaG9zdC9xMzUuYwo+
ICsrKyBiL2h3L3BjaS1ob3N0L3EzNS5jCj4gQEAgLTI4OCw3ICsyODgsNyBAQCBzdGF0aWMgdm9p
ZCB0c2VnX2JsYWNraG9sZV93cml0ZSh2b2lkICpvcGFxdWUsCj4gaHdhZGRyIGFkZHIsIHVpbnQ2
NF90IHZhbCwKPiDCoHN0YXRpYyBjb25zdCBNZW1vcnlSZWdpb25PcHMgdHNlZ19ibGFja2hvbGVf
b3BzID0gewo+IMKgIMKgIMKgLnJlYWQgPSB0c2VnX2JsYWNraG9sZV9yZWFkLAo+IMKgIMKgIMKg
LndyaXRlID0gdHNlZ19ibGFja2hvbGVfd3JpdGUsCj4gLSDCoCDCoC5lbmRpYW5uZXNzID0gREVW
SUNFX05BVElWRV9FTkRJQU4sCj4gKyDCoCDCoC5lbmRpYW5uZXNzID0gREVWSUNFX0xJVFRMRV9F
TkRJQU4sCgpPSy4KCj4gwqAgwqAgwqAudmFsaWQubWluX2FjY2Vzc19zaXplID0gMSwKPiDCoCDC
oCDCoC52YWxpZC5tYXhfYWNjZXNzX3NpemUgPSA0LAo+IMKgIMKgIMKgLmltcGwubWluX2FjY2Vz
c19zaXplID0gNCwKPiBkaWZmIC0tZ2l0IGEvaHcvcGNpLWhvc3QvdmVyc2F0aWxlLmMgYi9ody9w
Y2ktaG9zdC92ZXJzYXRpbGUuYwo+IGluZGV4IDc5MWIzMjEuLmU3MDE3ZjMgMTAwNjQ0Cj4gLS0t
IGEvaHcvcGNpLWhvc3QvdmVyc2F0aWxlLmMKPiArKysgYi9ody9wY2ktaG9zdC92ZXJzYXRpbGUu
Ywo+IEBAIC0yNDAsNyArMjQwLDcgQEAgc3RhdGljIHVpbnQ2NF90IHBjaV92cGJfcmVnX3JlYWQo
dm9pZCAqb3BhcXVlLAo+IGh3YWRkciBhZGRyLAo+IMKgc3RhdGljIGNvbnN0IE1lbW9yeVJlZ2lv
bk9wcyBwY2lfdnBiX3JlZ19vcHMgPSB7Cj4gwqAgwqAgwqAucmVhZCA9IHBjaV92cGJfcmVnX3Jl
YWQsCj4gwqAgwqAgwqAud3JpdGUgPSBwY2lfdnBiX3JlZ193cml0ZSwKPiAtIMKgIMKgLmVuZGlh
bm5lc3MgPSBERVZJQ0VfTkFUSVZFX0VORElBTiwKPiArIMKgIMKgLmVuZGlhbm5lc3MgPSBERVZJ
Q0VfTElUVExFX0VORElBTiwKPiDCoCDCoCDCoC52YWxpZCA9IHsKPiDCoCDCoCDCoCDCoCDCoC5t
aW5fYWNjZXNzX3NpemUgPSA0LAo+IMKgIMKgIMKgIMKgIMKgLm1heF9hY2Nlc3Nfc2l6ZSA9IDQs
Cj4gQEAgLTMwNiw3ICszMDYsNyBAQCBzdGF0aWMgdWludDY0X3QgcGNpX3ZwYl9jb25maWdfcmVh
ZCh2b2lkICpvcGFxdWUsCj4gaHdhZGRyIGFkZHIsCj4gwqBzdGF0aWMgY29uc3QgTWVtb3J5UmVn
aW9uT3BzIHBjaV92cGJfY29uZmlnX29wcyA9IHsKPiDCoCDCoCDCoC5yZWFkID0gcGNpX3ZwYl9j
b25maWdfcmVhZCwKPiDCoCDCoCDCoC53cml0ZSA9IHBjaV92cGJfY29uZmlnX3dyaXRlLAo+IC0g
wqAgwqAuZW5kaWFubmVzcyA9IERFVklDRV9OQVRJVkVfRU5ESUFOLAo+ICsgwqAgwqAuZW5kaWFu
bmVzcyA9IERFVklDRV9MSVRUTEVfRU5ESUFOLAoKRWggaGFyZCB0byBzYXksIFBDSSBpcyBub3Qg
Y2xlYXIgYWJvdXQgZW5kaWFuZXNzLi4uCgo+IMKgfTsKPiDCoAo+IMKgc3RhdGljIGludCBwY2lf
dnBiX21hcF9pcnEoUENJRGV2aWNlICpkLCBpbnQgaXJxX251bSkKPiAtLcKgCj4gMS44LjMuMQo+
IAo+IOKAiwo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
