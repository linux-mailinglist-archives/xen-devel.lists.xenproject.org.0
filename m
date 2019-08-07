Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2472C849E9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:44:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJOk-0006Ln-Ab; Wed, 07 Aug 2019 10:42:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hAF0=WD=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1hvJOj-0006Lh-Jq
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:42:25 +0000
X-Inumbo-ID: 09fa4e72-b900-11e9-8470-1f40cb4f7fce
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09fa4e72-b900-11e9-8470-1f40cb4f7fce;
 Wed, 07 Aug 2019 10:42:23 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f17so79466175wme.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 03:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RK6l3NcbPdkNrqzfgxFAPB3AcnYTmuMm/yEayizkoGM=;
 b=CPU/Fp/O+cTfksvL0ktUBnztRwO5QHWTCNks26O4704dcwkP0jYHbjt9TQC0UJFQwF
 c14kdV/91nNNMhPmisG3wpXX4ze0jQxJqXjxs/2L7TOuTHS2XZZspdmt6Jyy/TyU9dpz
 ScdaHftIArVyl54b9krRSh2b1c87xPl8K54uOghT2mPKp9jH43jtQJ+KwCiy1KUYl/xw
 wNVkLcoBUOVtZ0Y/JzFm7EOAJ2IU5MuKNBUatNAYpSmdcBbshysIoj2YKRNc87aHN1b4
 f3ZZjicc1WBDxujLAcRvMaCu0ZQ5e3OxtjIrDQWYBStkPTJHNsSi5rytu5sVn/FyucDK
 K1oQ==
X-Gm-Message-State: APjAAAVm39+KUg/X2O+LddnIf+wHiifyrebdwceboFxTZtoRIqvPoNWP
 CB7g2eCAP1Nn+Z8jJT60G+OTSw==
X-Google-Smtp-Source: APXvYqy9hj4IVv4iNb7hdS8YWvrZpBE1Hrpzca1t19wjkLc7WPMgYH2QNsu2RpzXYBzClduT/WHecQ==
X-Received: by 2002:a7b:c215:: with SMTP id x21mr10171537wmi.38.1565174542531; 
 Wed, 07 Aug 2019 03:42:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id c3sm92411304wrx.19.2019.08.07.03.42.19
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 03:42:21 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166668830.25608@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <962f4d91-c1c4-7e97-5297-11c546d823f0@redhat.com>
Date: Wed, 7 Aug 2019 12:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166668830.25608@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 15/26] build: Correct
 non-common common-obj-* to obj-*
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 andrew@aj.id.au, kbastian@mail.uni-paderborn.de, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 andrew.smirnov@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 imammedo@redhat.com, aurelien@aurel32.net, stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDgvMTkgMTA6MzEsIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiBQcmVwYXJhdGlv
biBmb3IgcmVwbGFjaW5nIGRldmljZV9lbmRpYW4gd2l0aCBNZW1PcC4KPiAKPiBEZXZpY2UgcmVh
bGl6aW5nIGNvZGUgd2l0aCBNZW1vclJlZ2lvbk9wcyBlbmRpYW5uZXNzIGFzCj4gREVWSUNFX05B
VElWRV9FTkRJQU4gaXMgbm90IGNvbW1vbiBjb2RlLgo+IAo+IENvcnJlY3RlZCBkZXZpY2VzIHdl
cmUgaWRlbnRpZmllZCBieSBtYWtpbmcgdGhlIGRlY2xhcmF0aW9uIG9mCj4gREVWSUNFX05BVElW
RV9FTkRJQU4gY29uZGl0aW9uYWwgdXBvbiBORUVEX0NQVV9IIGFuZCB0aGVuIGxpc3RpbmcKPiB3
aGF0IGZhaWxlZCB0byBjb21waWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRvbnkgTmd1eWVuIDx0
b255Lm5ndXllbkBidC5jb20+CgpUaGUgZ2VuZXJhbCBhcHByb2FjaCBtYWtlcyBzZW5zZS4gIEhv
d2V2ZXIsIG1vc3Qgb2YgdGhlc2Ugc2hvdWxkIG5vdCBiZQpERVZJQ0VfTkFUSVZFX0VORElBTi4g
IEkgY2FuIGhlbHAgd2l0aCBzb21lIG9mIHRoZW0uCgpQYW9sbwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
