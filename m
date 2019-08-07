Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685E68496B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:25:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJ5c-0004Hw-Nd; Wed, 07 Aug 2019 10:22:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hAF0=WD=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1hvJ5b-0004Hd-8Q
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:22:39 +0000
X-Inumbo-ID: 4702c78f-b8fd-11e9-8980-bc764e045a96
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4702c78f-b8fd-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 10:22:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v19so79443006wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 03:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0XSyHvDMekjafpUZd/bGO/uyC3MKHMOWHaWq6AQGhdI=;
 b=Qa/cAcleTqw0CAD4xZVlKAtYU/qA+MaIlzkCulWRTJCRUbOHypH7bBELKKRivKqndZ
 H1q1GyJXwfMJzPSJZHNnk9GLbVkZH5MngKEps/TvYuhBorAZ6EtriQRf/pccz+6w9H8O
 g7wjmWlKYrTKRfRnwSYEW3jckhA0Fuc3+YsAMk59DZ/HneG6MDmz0FRHqDmhwIfbPqQC
 sUAbtnRIhvDMQMZCJwMs4Fxp42il/szvj0UZ9xqrM/hcv1GqLA0J1pqvU6VZPbs8Yit9
 hEdYZP9owLumUYO3saDPOFzicE82dQgSKW/fF2va2wYODPNDt7AIyN9vr15NpKKZmvP4
 oOZA==
X-Gm-Message-State: APjAAAXWshdvjXvK8burKH7OzLiby81w+WkjDSl3d65NRYats0zbYOyM
 WcYLwY+z0TpnY2tKc3mcnqeOkw==
X-Google-Smtp-Source: APXvYqyVdY+KG9VE8VYjZChr/Tap/FiuNTb/CIypvYv6TYC5AN3XTQir8qL5hSYXXEgG+OiXanVDmA==
X-Received: by 2002:a05:600c:10ce:: with SMTP id
 l14mr9662688wmd.118.1565173356318; 
 Wed, 07 Aug 2019 03:22:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id c15sm12952891wrb.80.2019.08.07.03.22.32
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 03:22:35 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166771281.2734@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <efbf3560-76d3-62ba-0f8f-3e8ca8686f1d@redhat.com>
Date: Wed, 7 Aug 2019 12:22:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166771281.2734@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 19/26] exec: Delete
 DEVICE_HOST_ENDIAN
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

T24gMDcvMDgvMTkgMTA6MzIsIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiArI2lmIGRlZmlu
ZWQoSE9TVF9XT1JEU19CSUdFTkRJQU4pCj4gKyDCoCDCoC5lbmRpYW5uZXNzID0gTU9fQkUsCj4g
KyNlbHNlCj4gKyDCoCDCoC5lbmRpYW5uZXNzID0gTU9fTEUsCj4gKyNlbmRpZgoKSG9zdCBlbmRp
YW5uZXNzIGlzIGp1c3QgMCwgaXNuJ3QgaXQ/CgpQYW9sbwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
