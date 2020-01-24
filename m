Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB1148F74
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 21:41:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv5jn-0007Me-EG; Fri, 24 Jan 2020 20:39:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4CoJ=3N=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1iv5jm-0007MV-Hy
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 20:39:30 +0000
X-Inumbo-ID: 99dfa270-3ee9-11ea-9fd7-bc764e2007e4
Received: from sonic310-24.consmr.mail.ne1.yahoo.com (unknown [66.163.186.205])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99dfa270-3ee9-11ea-9fd7-bc764e2007e4;
 Fri, 24 Jan 2020 20:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1579898361; bh=7q7216kQRgaLVmDItbdh/lq6zwlNVJKPQ+HL/82wgvM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=YESLbDnn1QDFWEinFQftcxhtXIU36LsH2mVSlvDtmNorhySWqCLgE+vONuMF0V92cyK0lOkG3FPyAVVkpS3pR08XP7akJ40xUCjRj4qLNoFhVDuPoQptegRDP2RgaU4of+3qpWui7k8EjQKSsCoBAFdpORAcCY0rbRSRo7z3eusAy1DOhOtsOn1z5mYRrkxvY8/cre9FhFmfh20C92IgIgzm0A2d7eLxfa31h7aeJffzZzeiJyeZ/pj+v41FFxedZOqK1VrimfZCD76OJ97+Rf5LRZjzkdIP73rd3pn3AnNxvnXAiFIBrxG+oNsu77SzdEn+QmpfiPj3kbv9oX1qQg==
X-YMail-OSG: pDuWuqEVM1nygDEuwDhJ55OhBuU2C5Sv7BZK3fKxTjz2jasdegCe5jm4LvYRQKo
 o8k72CjYOAK6761jPaKRzuBS3olNKpXmWdwMkQLbGRG9LfLsAOpaJxv0UsCDM9FP7mDHZ5KGPM6G
 hYWjVuhc3chdb7Z7KcVwgrxsuZvZSWbNLZ9tAEncy6XxW.hz0Wa4ddz7Mh.yLvsmtXNBNkxPH1pI
 K4g.3XXAzGbwEtVQdY8cYmlitv21QUcII.AVBE66P3ftcaHjm96nxxf0AvZIaazXErcmzNHhCntL
 ytXOfcyZlwBojJvtFOEJuWm4PfhTXQvrNUUf15kINuUddLdJO5P45yp9z4pSmwXTscKdreQR6V6H
 hNZR0e1LZEUz1dOcxP3369wE.gnlJ0Gk1Oy_qXNMoZyh3RE1anmdxvekTWlz0hWCMyrxrPIZI1GU
 TZxubLKeOrs_c1Yz19eLuf7YHugWugqoDXe2Jqj0iX9IRCyCXP8DAoOQZ5sdku.uPD.WAETHRcuU
 H2k0ESDM0p5S7TM0.jdPQsYko4I9R76uBz.d4EEGKB6foImiarcpTIklO2i1OHEEFbcr5roW3tJY
 D0WclDnJVZ21hgKllMPA7QPFpmDDgheMjTj5S7prR2327.F58uiZ4pVYAxbdQ42m3emPajtNf3s3
 zPf7TJSy7MrOG97X3FYLYi4wH_HrdBr1_35ugh3VbfJUF9PkKZBkYY8O463s6UEKyOFhAlo17jSg
 dkIbjJcXNYMY3_3Qze3CRrgPNOwWyrmQVZ3MRaVVDgpploq1aq0qOpb73GcAr2tFizq9sBAldCi5
 tAlIBfTF5wlx_HbckQBYxwZwQi2wqN9vAiBCU79bLdDMXfOkrRqSpu.HM8Eu6nA5T_qWQr_9Ev9U
 MgEV_3mHsSJTEd8k2IHLG4xNQ2RpNPA6kr0ye.H4ptoItJb996rEGX1UBuoakv3d.6HgGi2uPkEs
 taolhn7mFGgFDJeQozbkwtdE_K1s.qPOK_XniYidusnI_0bS2h5TEWfFYdpQ9XMfd5FNMXvMtOfP
 j5dra6kvyfaQQvXolTUcXW46.EceIzEcWxDNF6Nwl5iaRPTuCxcUWUPdSbxUhBaa.muYFsBaKAIC
 Vxatm6c.NazFt68TFSFruatxm0pm1s0IOb8okFjds8h8R4oe8YHy.0dl9sPS5XrJSzESTiV8cong
 Lw1JGlGwtgkqCrxot3XAA.L1hKNd1qjQvaGGXIqEZtziNUeIXDJVW9C99cOz.Ux88LjAHk8FdnuJ
 gFF4QA9QKYs_uaExhs44JZlklJQT.7wo8oWWxLFcU620olNjNSKt8UvXOMytSDCbGkXRTdZmLEiT
 NoE_NW4qFKMnFb4TBVIuLepvfQYn0aDztZkAKX3XN6EY-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ne1.yahoo.com with HTTP; Fri, 24 Jan 2020 20:39:21 +0000
Date: Fri, 24 Jan 2020 20:36:44 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <155246651.949762.1579898204892@mail.yahoo.com>
In-Reply-To: <CAKf6xpvEpmCtF_7qr4XwJhJYHYj1=M=0KmxUNXXuTEYRGP9VAg@mail.gmail.com>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
 <CAKf6xpvEpmCtF_7qr4XwJhJYHYj1=M=0KmxUNXXuTEYRGP9VAg@mail.gmail.com>
MIME-Version: 1.0
X-Mailer: WebService/1.1.14873 YMailNorrin Mozilla/5.0 (X11; Ubuntu;
 Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0
Subject: Re: [Xen-devel] HVM Driver Domain
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=83=C2=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IGJ1aWxkZXIgPSAiaHZtIgo+ID4gbmFtZSA9ICJ1YnVudHUtZG9tZW50LWh2bSIKCj4gVGhp
cyBuYW1lLi4uCgo+ID4gdmlmID0gWyAnYmFja2VuZD11YnVudHUtZG9tbmV0LWh2bSxicmlkZ2U9
eGVuYnIxJyBdCgo+IC4uLmFuZCB0aGlzIG5hbWUgZG9uJ3QgbWF0Y2guCgoKSmFzb24sCgpUaGFu
a3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJIGZlZWwgdmVyeSBzdHVwaWQuIEhvd2V2ZXIsIHRo
ZSBwcm9ibGVtIGlzIG5vdCBzb2x2ZWQgeWV0LCBidXQgSSB3YXMgYWJsZSB0byBnZXQgdG8gdGhl
IG5leHQgc3RlcCB3aXRoIGRldmQgc3VnZ2VzdGVkIGJ5IFJvZ2VyLiBJIHdpbGwga2VlcCB5b3Ug
aW4gQ0Mgd2hlbiBJIHJlcGx5IFJvZ2VyIHdpdGggYSBkZXRhaWxlZCBsb2cuCgpSZWdhcmRzLApN
ZWhyYWIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
