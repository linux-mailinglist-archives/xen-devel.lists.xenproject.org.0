Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE618FF94
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 12:00:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyYzu-0003zw-UQ; Fri, 16 Aug 2019 09:58:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gc0g=WM=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1hyYzt-0003zo-RI
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 09:58:13 +0000
X-Inumbo-ID: 5a580fb8-c00c-11e9-8bb3-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a580fb8-c00c-11e9-8bb3-12813bfff9fa;
 Fri, 16 Aug 2019 09:58:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s18so999600wrn.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2019 02:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Foo7mqc4L4owvltcL+chmVAdJxdrnYoZDMnBcLnmc5c=;
 b=Ror6Xpp4eYr6ky3x2EqIAV7FNYSuQJczmKCFoF7bgMqtcGE/MaUFuzSj+1jAZBeSP+
 1JabYpDGU/ZmxljdzgRKUyXb3WiYngsaKz0DZ+pMwS7UxvR1BR8QKjWUUizhdUPH7L0i
 S6+7Bvnb8jIvZ4kcQu6DUfCNwYjyEjfunEg36ItvddYNqytWyE3MfOBehqPE70+yc+yT
 CkcNW2Wi7n6rH068pDJC+7lf7TDnKUhQBauRLvt5VTxM5KkbszpzpNTdo+ECP7iFR+cv
 0ZB1wlf6kTkKtEkVzHB2+EIDEHMmy2eu7BEsN4FeirH3ijZS3+Prbn1YHmylUn94OP6Z
 m3Og==
X-Gm-Message-State: APjAAAUXUjstaYp2GKagGq+sck5iTEV6jUVqaAREUHkn8+X5OUnnqLrA
 p3tv1hy2UseKaHbmlhCYR/ehlw==
X-Google-Smtp-Source: APXvYqxEtH9z2rQcNW2PoiyLykUukmpcl5g1WXvMOKgN8N7tudUZZZ63JDl5GzOk7+ZQwUPBP9c8/A==
X-Received: by 2002:adf:82d4:: with SMTP id 78mr9141289wrc.85.1565949489545;
 Fri, 16 Aug 2019 02:58:09 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id z1sm5419150wrp.51.2019.08.16.02.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2019 02:58:08 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
Date: Fri, 16 Aug 2019 11:58:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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

SGkgVG9ueSwKCk9uIDgvMTYvMTkgODoyOCBBTSwgdG9ueS5uZ3V5ZW5AYnQuY29tIHdyb3RlOgo+
IFRoaXMgcGF0Y2hzZXQgaW1wbGVtZW50cyB0aGUgSUUgKEludmVydCBFbmRpYW4pIGJpdCBpbiBT
UEFSQ3Y5IE1NVSBUVEUuCj4gCj4gdjc6ClsuLi5dCj4gLSBSZS1kZWNsYXJlZCBtYW55IG5hdGl2
ZSBlbmRpYW4gZGV2aWNlcyBhcyBsaXR0bGUgb3IgYmlnIGVuZGlhbi4gVGhpcyBpcyB3aHkKPiAg
IHY3IGhhcyArMTYgcGF0Y2hlcy4KCldoeSBhcmUgeW91IGRvaW5nIHRoYXQ/IFdoYXQgaXMgdGhl
IHJhdGlvbmFsPwoKQW55aG93IGlmIHRoaXMgbm90IHJlcXVpcmVkIGJ5IHlvdXIgc2VyaWVzLCB5
b3Ugc2hvdWxkIHNwbGl0IGl0IG91dCBvZgppdCwgYW5kIHNlbmQgaXQgb24geW91ciBwcmluY2lw
YWwgY2hhbmdlcyBhcmUgbWVyZ2VkLgpJJ20gd29ycmllZCBiZWNhdXNlIHRoaXMgdGhlc2UgbmV3
IHBhdGNoZXMgaW52b2x2ZSBtYW55IHN1YnN5c3RlbXMgKHRodXMKbWFpbnRhaW5lcnMpIGFuZCBy
ZXZpZXdpbmcgdGhlbSB3aWxsIG5vdyB0YWtlIGEgZmFpciBhbW91bnQgb2YgdGltZS4KCj4gRm9y
IGVhY2ggZGV2aWNlIGRlY2xhcmVkIHdpdGggREVWSUNFX05BVElWRV9FTkRJQU4sIGZpbmQgdGhl
IHNldCBvZgo+IHRhcmdldHMgZnJvbSB0aGUgc2V0IG9mIHRhcmdldC9ody8qL2RldmljZS5vLgo+
Cj4gSWYgdGhlIHNldCBvZiB0YXJnZXRzIGFyZSBhbGwgbGl0dGxlIG9yIGFsbCBiaWcgZW5kaWFu
LCByZS1kZWNsYXJlCj4gdGhlIGRldmljZSBlbmRpYW5uZXNzIGFzIERFVklDRV9MSVRUTEVfRU5E
SUFOIG9yIERFVklDRV9CSUdfRU5ESUFOCj4gcmVzcGVjdGl2ZWx5LgoKSWYgb25seSBsaXR0bGUg
ZW5kaWFuIHRhcmdldHMgdXNlIGEgZGV2aWNlLCB0aGF0IGRvZXNuJ3QgbWVhbiB0aGUgZGV2aWNl
CmlzIGRlc2lnbmVkIGluIGxpdHRsZSBlbmRpYW4uLi4KClRoZW4gaWYgYSBiaWcgZW5kaWFuIHRh
cmdldCBwbGFuIHRvIHVzZSB0aGlzIGRldmljZSwgaXQgd2lsbCByZXF1aXJlCm1vcmUgd29yayBh
bmQgeW91IG1pZ2h0IGhhdmUgaW50cm9kdWNlZCByZWdyZXNzaW9ucy4uLgoKSSdtIG5vdCBzdXJl
IHRoaXMgaXMgYSBzYWZlIG1vdmUuCgo+IFRoaXMgKm5haXZlKiBkZWR1Y3Rpb24gbWF5IHJlc3Vs
dCBpbiBnZW51aW5lbHkgbmF0aXZlIGVuZGlhbiBkZXZpY2VzCj4gYmVpbmcgaW5jb3JyZWN0bHkg
ZGVjbGFyZWQgYXMgbGl0dGxlIG9yIGJpZyBlbmRpYW4sIGJ1dCBzaG91bGQgbm90Cj4gaW50cm9k
dWNlIHJlZ3Jlc3Npb25zIGZvciBjdXJyZW50IHRhcmdldHMuCgpSZWdhcmRzLAoKUGhpbC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
