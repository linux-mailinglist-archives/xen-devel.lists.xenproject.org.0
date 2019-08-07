Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C67184C27
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 14:58:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvLSt-0000r6-J3; Wed, 07 Aug 2019 12:54:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rMfM=WD=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1hvLSs-0000qx-92
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:54:50 +0000
X-Inumbo-ID: 88686638-b912-11e9-b4b2-735cbf5a8a60
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88686638-b912-11e9-b4b2-735cbf5a8a60;
 Wed, 07 Aug 2019 12:54:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s3so81704290wms.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 05:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qxz+qOxxiF4zyH6SFPksO+z9p6DoRe1NfIyM1b8xgLo=;
 b=b9LmazQjHGNKOuoG0SoMVvAwg7t/6/dJ639Oj9nWjog4SzQk6SjS0r6CvQf3HnL851
 klVGj0HGmjLCKFcAsLQ9090gmXeNY24NZiQvtxgag9yxrIre1RUZTKHb7MDDXTvf2yeF
 FazaOMxWt4Y/zgDReWUDxV3Gn4TTg8zFuK/1HU2ijgWqhKw8v5tWWSK0qjQqc6HmiDq3
 Eu6KEZfh+lfmoPG6gNI4MsbTx8424lHW2ZurnBk+JYF6ULt6PO0d8PmE1VpG5dKRCenh
 lbLXW7rYfWDn2vskpUrMRJRjoo2nkAizkU2lynalB2NR6zaD18d3sKeF4PHP4VXu24IB
 RSRw==
X-Gm-Message-State: APjAAAVn4iC2jYwr0WDndzPFW3K9A+nNP3aQtGMjo+le8dr1GCrf6O7X
 V+r41bDZ0+EPkYJ6oeP1ovM2DA==
X-Google-Smtp-Source: APXvYqx61lLaCyYesDNdvwewasVUT/A65a9cVj8wjHg2wQ+UynM0qhk2bBNGpqeZ28ZkTv8fSSNq8A==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr10411525wmc.175.1565182485721; 
 Wed, 07 Aug 2019 05:54:45 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id q18sm113799140wrw.36.2019.08.07.05.54.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 05:54:45 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
 <1565181666201.26324@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0523c403-bdae-bb5d-8996-20b57cd5d7cf@redhat.com>
Date: Wed, 7 Aug 2019 14:54:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565181666201.26324@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, sagark@eecs.berkeley.edu, mst@redhat.com,
 green@moxielogic.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, pbonzini@redhat.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, mreitz@redhat.com, pburton@wavecomp.com,
 marex@denx.de, robh@kernel.org, hare@suse.com, gxt@mprc.pku.edu.cn,
 berto@igalia.com, proljc@gmail.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de, david@redhat.com,
 magnus.damm@gmail.com, yuval.shaia@oracle.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, hpoussin@reactos.org, joel@jms.id.au,
 marcel.apfelbaum@gmail.com, anthony.perard@citrix.com,
 marcandre.lureau@redhat.com, david@gibson.dropbear.id.au, balrogg@gmail.com,
 jasowang@redhat.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org, jcd@tribudubois.net,
 sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 sstabellini@kernel.org, jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 imammedo@redhat.com, xen-devel@lists.xenproject.org, shorne@gmail.com,
 andrew.smirnov@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, xiaoguangrong.eric@gmail.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, lersek@redhat.com, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 i.mitsyanko@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC83LzE5IDI6NDEgUE0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiBPbiA4LzcvMTkg
ODozNyBQTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gCj4+wqBJJ20gY29uZnVz
ZWQgSSB0aGluayBJIGFscmVhZHkgcmV2aWV3ZWQgdmFyaW91cyBwYXRjaGVzIG9mIHlvdXIgcHJl
dmlvdXMKPiDigIs+wqBzZXJpZXMgYnV0IGRvbid0IHNlZSBteSBSZXZpZXdlZC1ieSB0YWdzLuKA
iz4KPiBBcG9sb2dpZXMgUGhpbGlwcGUhwqBJIGFtIHRoZSBjb25mdXNlZCBvbmUgaGVyZSA9Lwo+
IAo+IFdpbGwgYXBwZW5kLgo+IAo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9ywqB0aGUgcmV2aWV3
cyBhbmQgcWVtdS1kZXZlbCBuZXdiaWXCoHRpcHMgc28gZmFyLiBJCj4gaGF2ZcKgZmVsdCB2ZXJ5
IHdlbGNvbWUuCgpXZWxsIGZvciBhIG5ld2JpZSB5b3UgZGlkIGFuIGltcHJlc3NpdmUgc2VyaWVz
IQoKVGhlICdSZXZpZXdlZC1ieScgb3IgJ1Rlc3RlZC1ieScgdGFncyBoZWxwIHRoZSBtYWludGFp
bmVycyB0byBwcm9jZXNzCnBhdGNoZXMuCgpTaW5jZSByZXZpZXdpbmcgYSBzZXJpZXMgaXMgdGlt
ZS1jb25zdW1pbmcsIGlmIHlvdSBpdGVyYXRlIG92ZXIgYSBzZXJpZXMKd2l0aG91dCBjaGFuZ2lu
ZyBzb21lIHBhdGNocywgeW91IHNob3VsZCBjb2xsZWN0IGFuZCBhbWVuZCB0aGUgdGFncyB0aGUK
cmV2aWV3ZXJzIGdhdmUgeW91LCB0aGlzIHdheSBpdCBoZWxwcyB0aGVtIGtlZXAgdHJhY2sgb2Yg
cGF0Y2hlcwpyZXZpZXdlZCBhbmQgcGF0Y2hlcyB3YWl0aW5nIGZvciByZXZpZXcuCgpJbiBteSBj
YXNlIEkgZmluZCBpdCB2ZXJ5IGNvbmZ1c2Ugd2hlbiBJIGxvb2sgYXQgYSBwYXRjaCBJIGFscmVh
ZHkgZ2F2ZQpteSBSLWIgdGFnIGFuZCB0aGUgdGFnIGlzIG5vdCBoZXJlLCBJIHJlLXJldmlldyB0
aGUgcGF0Y2ggbG9va2luZyBmb3IKZGlmZmVyZW5jZXMuCgpPZnRlbiBhIHJldmlld2VyIGFza3Mg
Zm9yIGVhc3kgY2hhbmdlcywgYW5kIHVzZXMgIndpdGggdGhpcyBjaGFuZ2VzOgpSLWIiLiBJZiB5
b3UgYWRkcmVzc2VzIGhpcyBjb21tZW50cyB5b3UgY2FuIHRoZW4gYWRkIGhpcyB0YWcgaW4gdGhl
IG5leHQKdmVyc2lvbi4KCklmIHlvdSBzcGxpdCBhIHJldmlld2VkIHBhdGNoIGluIHZhcmlvdXMs
IGl0IGlzIGFsc28gT0sgdG8ga2VlcCB0aGUgdGFncwppbiBhbGwgdGhlIHNwbGl0dGVkIHBhdGNo
ZXMuCgpSZWdhcmRzLAoKUGhpbC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
