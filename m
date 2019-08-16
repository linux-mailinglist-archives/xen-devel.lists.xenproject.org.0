Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE7F8FFB6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 12:07:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyZ5x-00053N-74; Fri, 16 Aug 2019 10:04:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gc0g=WM=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1hyZ5v-00053C-GL
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 10:04:27 +0000
X-Inumbo-ID: 38534f08-c00d-11e9-b90c-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38534f08-c00d-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 10:04:22 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z23so3606909wmf.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2019 03:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aT2ZNqO8zTsrWM08AT1iJSt0ruEVkb9Rhd643qEZv5I=;
 b=hTpmpDE3J9P+gkhBtjWk2Ur/zeXR2UhvAag4P+rasaoNiuRJd1qsENTDpJErqKpg15
 e3ESuz5UhMfUbrD+OsONc6EeOA5zXlT1GV8SVDuDqBauGAmPDMaOvpMhBseTnM+qf6kF
 iq25BdFQd35ehG6l/xJQ1U9QQZ2nWoa6Zl+fLzmyLi/tLFfbQ3YaweYBy1SHjWG92Jyo
 Hs7PrjHZGEyuHv4GvZN/hXY5hpXInGwRHk+ik8WeSQkewHUcN5z9l9L47oUY9vMI0ncD
 EpwmMlrQpYxYuaUfZl4X/HktG9Ny0zJ1PyYcu1qf9YfzVypdzEfxDWyCcZrepZmx8/3j
 3bsw==
X-Gm-Message-State: APjAAAVGnTLHUaHkx7P1rKwRn32OqW9QWWzelTp/uR+o8fQZeI5MZ95f
 wr3N0kIAF5IXZYoXzGIoS0oPzQ==
X-Google-Smtp-Source: APXvYqz9FADqlGfQPhtp/alJQ2mzQsnVjtWV9tZBB1zOh/6/Xv4Sb2y94Nz96D17mVSCds+06pXYRw==
X-Received: by 2002:a1c:a101:: with SMTP id k1mr6684861wme.98.1565949861986;
 Fri, 16 Aug 2019 03:04:21 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id r190sm5336299wmf.0.2019.08.16.03.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2019 03:04:21 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565940884636.2215@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <989277a4-7f07-aaaf-f963-ee769e0efd00@redhat.com>
Date: Fri, 16 Aug 2019 12:04:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565940884636.2215@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 25/42] hw/misc: Declare
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

T24gOC8xNi8xOSA5OjM0IEFNLCB0b255Lm5ndXllbkBidC5jb20gd3JvdGU6Cj4gRm9yIGVhY2gg
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
eTogVG9ueSBOZ3V5ZW4gPHRvbnkubmd1eWVuQGJ0LmNvbT4KPiAtLS0KPiDCoGh3L21pc2MvYTlz
Y3UuYyDCoCDCoHwgMiArLQo+IMKgaHcvbWlzYy9hcHBsZXNtYy5jIHwgNiArKystLS0KPiDCoGh3
L21pc2MvYXJtMTFzY3UuYyB8IDIgKy0KPiDCoGh3L21pc2MvYXJtX2wyeDAuYyB8IDIgKy0KPiDC
oGh3L21pc2MvcHV2M19wbS5jIMKgfCAyICstCj4gwqA1IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvbWlzYy9hOXNjdS5j
IGIvaHcvbWlzYy9hOXNjdS5jCj4gaW5kZXggNDMwN2YwMC4uM2RlOGNkMyAxMDA2NDQKPiAtLS0g
YS9ody9taXNjL2E5c2N1LmMKPiArKysgYi9ody9taXNjL2E5c2N1LmMKPiBAQCAtOTQsNyArOTQs
NyBAQCBzdGF0aWMgdm9pZCBhOV9zY3Vfd3JpdGUodm9pZCAqb3BhcXVlLCBod2FkZHIgb2Zmc2V0
LAo+IMKgc3RhdGljIGNvbnN0IE1lbW9yeVJlZ2lvbk9wcyBhOV9zY3Vfb3BzID0gewo+IMKgIMKg
IMKgLnJlYWQgPSBhOV9zY3VfcmVhZCwKPiDCoCDCoCDCoC53cml0ZSA9IGE5X3NjdV93cml0ZSwK
PiAtIMKgIMKgLmVuZGlhbm5lc3MgPSBERVZJQ0VfTkFUSVZFX0VORElBTiwKPiArIMKgIMKgLmVu
ZGlhbm5lc3MgPSBERVZJQ0VfTElUVExFX0VORElBTiwKClVoLCBJIGRvdWJ0IHRoYXQuCgo+IMKg
fTsKPiDCoAo+IMKgc3RhdGljIHZvaWQgYTlfc2N1X3Jlc2V0KERldmljZVN0YXRlICpkZXYpCj4g
ZGlmZiAtLWdpdCBhL2h3L21pc2MvYXBwbGVzbWMuYyBiL2h3L21pc2MvYXBwbGVzbWMuYwo+IGlu
ZGV4IDJkN2ViM2MuLjZjOTFmMjkgMTAwNjQ0Cj4gLS0tIGEvaHcvbWlzYy9hcHBsZXNtYy5jCj4g
KysrIGIvaHcvbWlzYy9hcHBsZXNtYy5jCj4gQEAgLTI4NSw3ICsyODUsNyBAQCBzdGF0aWMgdm9p
ZCBxZGV2X2FwcGxlc21jX2lzYV9yZXNldChEZXZpY2VTdGF0ZSAqZGV2KQo+IMKgc3RhdGljIGNv
bnN0IE1lbW9yeVJlZ2lvbk9wcyBhcHBsZXNtY19kYXRhX2lvX29wcyA9IHsKPiDCoCDCoCDCoC53
cml0ZSA9IGFwcGxlc21jX2lvX2RhdGFfd3JpdGUsCj4gwqAgwqAgwqAucmVhZCA9IGFwcGxlc21j
X2lvX2RhdGFfcmVhZCwKPiAtIMKgIMKgLmVuZGlhbm5lc3MgPSBERVZJQ0VfTkFUSVZFX0VORElB
TiwKPiArIMKgIMKgLmVuZGlhbm5lc3MgPSBERVZJQ0VfTElUVExFX0VORElBTiwKPiDCoCDCoCDC
oC5pbXBsID0gewo+IMKgIMKgIMKgIMKgIMKgLm1pbl9hY2Nlc3Nfc2l6ZSA9IDEsCj4gwqAgwqAg
wqAgwqAgwqAubWF4X2FjY2Vzc19zaXplID0gMSwKPiBAQCAtMjk1LDcgKzI5NSw3IEBAIHN0YXRp
YyBjb25zdCBNZW1vcnlSZWdpb25PcHMgYXBwbGVzbWNfZGF0YV9pb19vcHMgPSB7Cj4gwqBzdGF0
aWMgY29uc3QgTWVtb3J5UmVnaW9uT3BzIGFwcGxlc21jX2NtZF9pb19vcHMgPSB7Cj4gwqAgwqAg
wqAud3JpdGUgPSBhcHBsZXNtY19pb19jbWRfd3JpdGUsCj4gwqAgwqAgwqAucmVhZCA9IGFwcGxl
c21jX2lvX2NtZF9yZWFkLAo+IC0gwqAgwqAuZW5kaWFubmVzcyA9IERFVklDRV9OQVRJVkVfRU5E
SUFOLAo+ICsgwqAgwqAuZW5kaWFubmVzcyA9IERFVklDRV9MSVRUTEVfRU5ESUFOLAo+IMKgIMKg
IMKgLmltcGwgPSB7Cj4gwqAgwqAgwqAgwqAgwqAubWluX2FjY2Vzc19zaXplID0gMSwKPiDCoCDC
oCDCoCDCoCDCoC5tYXhfYWNjZXNzX3NpemUgPSAxLAo+IEBAIC0zMDUsNyArMzA1LDcgQEAgc3Rh
dGljIGNvbnN0IE1lbW9yeVJlZ2lvbk9wcyBhcHBsZXNtY19jbWRfaW9fb3BzID0gewo+IMKgc3Rh
dGljIGNvbnN0IE1lbW9yeVJlZ2lvbk9wcyBhcHBsZXNtY19lcnJfaW9fb3BzID0gewo+IMKgIMKg
IMKgLndyaXRlID0gYXBwbGVzbWNfaW9fZXJyX3dyaXRlLAo+IMKgIMKgIMKgLnJlYWQgPSBhcHBs
ZXNtY19pb19lcnJfcmVhZCwKPiAtIMKgIMKgLmVuZGlhbm5lc3MgPSBERVZJQ0VfTkFUSVZFX0VO
RElBTiwKPiArIMKgIMKgLmVuZGlhbm5lc3MgPSBERVZJQ0VfTElUVExFX0VORElBTiwKPiDCoCDC
oCDCoC5pbXBsID0gewo+IMKgIMKgIMKgIMKgIMKgLm1pbl9hY2Nlc3Nfc2l6ZSA9IDEsCj4gwqAg
wqAgwqAgwqAgwqAubWF4X2FjY2Vzc19zaXplID0gMSwKCkJlaW5nIGlvcG9ydCwgdGhpcyBvbmUg
bWlnaHQgYmUgT0suCgo+IGRpZmYgLS1naXQgYS9ody9taXNjL2FybTExc2N1LmMgYi9ody9taXNj
L2FybTExc2N1LmMKPiBpbmRleCA4NDI3NWRmLi41OWZkN2MwIDEwMDY0NAo+IC0tLSBhL2h3L21p
c2MvYXJtMTFzY3UuYwo+ICsrKyBiL2h3L21pc2MvYXJtMTFzY3UuYwo+IEBAIC01Nyw3ICs1Nyw3
IEBAIHN0YXRpYyB2b2lkIG1wY29yZV9zY3Vfd3JpdGUodm9pZCAqb3BhcXVlLCBod2FkZHIgb2Zm
c2V0LAo+IMKgc3RhdGljIGNvbnN0IE1lbW9yeVJlZ2lvbk9wcyBtcGNvcmVfc2N1X29wcyA9IHsK
PiDCoCDCoCDCoC5yZWFkID0gbXBjb3JlX3NjdV9yZWFkLAo+IMKgIMKgIMKgLndyaXRlID0gbXBj
b3JlX3NjdV93cml0ZSwKPiAtIMKgIMKgLmVuZGlhbm5lc3MgPSBERVZJQ0VfTkFUSVZFX0VORElB
TiwKPiArIMKgIMKgLmVuZGlhbm5lc3MgPSBERVZJQ0VfTElUVExFX0VORElBTiwKCkkgZG9uJ3Qg
dGhpbmsgc28sCgo+IMKgfTsKPiDCoAo+IMKgc3RhdGljIHZvaWQgYXJtMTFfc2N1X3JlYWxpemUo
RGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQo+IGRpZmYgLS1naXQgYS9ody9taXNjL2Fy
bV9sMngwLmMgYi9ody9taXNjL2FybV9sMngwLmMKPiBpbmRleCBiODhmNDBhLi43MmVjZjQ2IDEw
MDY0NAo+IC0tLSBhL2h3L21pc2MvYXJtX2wyeDAuYwo+ICsrKyBiL2h3L21pc2MvYXJtX2wyeDAu
Ywo+IEBAIC0xNTcsNyArMTU3LDcgQEAgc3RhdGljIHZvaWQgbDJ4MF9wcml2X3Jlc2V0KERldmlj
ZVN0YXRlICpkZXYpCj4gwqBzdGF0aWMgY29uc3QgTWVtb3J5UmVnaW9uT3BzIGwyeDBfbWVtX29w
cyA9IHsKPiDCoCDCoCDCoC5yZWFkID0gbDJ4MF9wcml2X3JlYWQsCj4gwqAgwqAgwqAud3JpdGUg
PSBsMngwX3ByaXZfd3JpdGUsCj4gLSDCoCDCoC5lbmRpYW5uZXNzID0gREVWSUNFX05BVElWRV9F
TkRJQU4sCj4gKyDCoCDCoC5lbmRpYW5uZXNzID0gREVWSUNFX0xJVFRMRV9FTkRJQU4sCgpuZWl0
aGVyIGhlcmUsIGJ1dCBQZXRlciB3aWxsIGNvbmZpcm0uCgo+IMKgIH07Cj4gwqAKPiDCoHN0YXRp
YyB2b2lkIGwyeDBfcHJpdl9pbml0KE9iamVjdCAqb2JqKQo+IGRpZmYgLS1naXQgYS9ody9taXNj
L3B1djNfcG0uYyBiL2h3L21pc2MvcHV2M19wbS5jCj4gaW5kZXggYjUzOGI0YS4uY2Q4MmI2OSAx
MDA2NDQKPiAtLS0gYS9ody9taXNjL3B1djNfcG0uYwo+ICsrKyBiL2h3L21pc2MvcHV2M19wbS5j
Cj4gQEAgLTExOCw3ICsxMTgsNyBAQCBzdGF0aWMgY29uc3QgTWVtb3J5UmVnaW9uT3BzIHB1djNf
cG1fb3BzID0gewo+IMKgIMKgIMKgIMKgIMKgLm1pbl9hY2Nlc3Nfc2l6ZSA9IDQsCj4gwqAgwqAg
wqAgwqAgwqAubWF4X2FjY2Vzc19zaXplID0gNCwKPiDCoCDCoCDCoH0sCj4gLSDCoCDCoC5lbmRp
YW5uZXNzID0gREVWSUNFX05BVElWRV9FTkRJQU4sCj4gKyDCoCDCoC5lbmRpYW5uZXNzID0gREVW
SUNFX0xJVFRMRV9FTkRJQU4sCgpUaGlzIG9uZSBJIGNhbid0IHRlbGwuCgo+IMKgfTsKPiDCoAo+
IMKgc3RhdGljIHZvaWQgcHV2M19wbV9yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9yICoq
ZXJycCkKPiAtLcKgCj4gMS44LjMuMQo+IAo+IOKAiwo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
