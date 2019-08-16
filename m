Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7298FFAA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 12:04:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyZ3Z-0004u0-O2; Fri, 16 Aug 2019 10:02:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gc0g=WM=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1hyZ3Y-0004tv-Ta
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 10:02:00 +0000
X-Inumbo-ID: e2c2c410-c00c-11e9-8bb3-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2c2c410-c00c-11e9-8bb3-12813bfff9fa;
 Fri, 16 Aug 2019 10:01:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z23so3601010wmf.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2019 03:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GI/EzkhAlPTCaafFlruhK2NwuW2KBxYpRI4/Zpxnrmg=;
 b=C1VpDbvndb1kjpT4y9QZzpoEjlwTyQ4JVVSJvb0P5V+Osc+/WsJRrGuBnlBD91N4X7
 uwen3VpqSN9Z6SIVncR1AgW+HrQyrrzX/UVdNBxyn8yk+nHGMZcTa6cJ7pSI5K1agKGr
 xCn3yq4UNWYWT9bWN//TC/cIZgQqZYYyqosoHpaszU7z0hMHEVIajgopAircL3BKWMx3
 sD+zUFCGjv6nRzPvSBQk4hZXsLaStxHY/NJ/+wfIiWPgPiDkcERCqFvC8Zi/ySDmmbuy
 dtjuM9/obOI8CYpHBiyFcmQz6Geq5gxV7tnKUb1u3+yqin4GSChyOx+D2qi8wPEUyXha
 9FSg==
X-Gm-Message-State: APjAAAVYVbhzKBalygrpREtRK0kW3Mi+/+ZSymFsAl8fQ2Rv7LtnyTX6
 kAJ+1orZ0aNRdjCj1Xs2FcnAmg==
X-Google-Smtp-Source: APXvYqwS1oPGuh1MYBmNdnbpvSjSqeL7XZd0Nrcv421hxIx7FeNdlx5ElrSZzfLyl59b3tGv2uG/Mw==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr6485221wmk.149.1565949718440; 
 Fri, 16 Aug 2019 03:01:58 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id x6sm5463863wrt.63.2019.08.16.03.01.54
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 03:01:57 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565940869312.41180@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <64d9f983-31e3-6921-4e0f-cd630581ec61@redhat.com>
Date: Fri, 16 Aug 2019 12:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565940869312.41180@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 24/42] hw/isa: Declare
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
eTogVG9ueSBOZ3V5ZW4gPHRvbnkubmd1eWVuQGJ0LmNvbT4KPiAtLS0KPiDCoGh3L2lzYS92dDgy
YzY4Ni5jIHwgMiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2h3L2lzYS92dDgyYzY4Ni5jIGIvaHcvaXNhL3Z0ODJj
Njg2LmMKPiBpbmRleCAxMmM0NjA1OTAuLmFkZjY1ZDMgMTAwNjQ0Cj4gLS0tIGEvaHcvaXNhL3Z0
ODJjNjg2LmMKPiArKysgYi9ody9pc2EvdnQ4MmM2ODYuYwo+IEBAIC0xMDgsNyArMTA4LDcgQEAg
c3RhdGljIHVpbnQ2NF90IHN1cGVyaW9faW9wb3J0X3JlYWRiKHZvaWQgKm9wYXF1ZSwKPiBod2Fk
ZHIgYWRkciwgdW5zaWduZWQgc2l6ZSkKPiDCoHN0YXRpYyBjb25zdCBNZW1vcnlSZWdpb25PcHMg
c3VwZXJpb19vcHMgPSB7Cj4gwqAgwqAgwqAucmVhZCA9IHN1cGVyaW9faW9wb3J0X3JlYWRiLAo+
IMKgIMKgIMKgLndyaXRlID0gc3VwZXJpb19pb3BvcnRfd3JpdGViLAo+IC0gwqAgwqAuZW5kaWFu
bmVzcyA9IERFVklDRV9OQVRJVkVfRU5ESUFOLAo+ICsgwqAgwqAuZW5kaWFubmVzcyA9IERFVklD
RV9MSVRUTEVfRU5ESUFOLAoKQmVpbmcgaW9wb3J0LCBvbmUgaXMgcHJvYmFibHkgT0suCgo+IMKg
IMKgIMKgLmltcGwgPSB7Cj4gwqAgwqAgwqAgwqAgwqAubWluX2FjY2Vzc19zaXplID0gMSwKPiDC
oCDCoCDCoCDCoCDCoC5tYXhfYWNjZXNzX3NpemUgPSAxLAo+IC0twqAKPiAxLjguMy4xCj4gCj4g
4oCLCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
