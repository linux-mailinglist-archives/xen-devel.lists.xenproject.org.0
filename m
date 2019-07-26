Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5940768CF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:47:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0XX-0007lu-Q3; Fri, 26 Jul 2019 13:45:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hr0XW-0007lm-UT
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:45:43 +0000
X-Inumbo-ID: a90ce36d-afab-11e9-8980-bc764e045a96
Received: from mail-io1-xd2d.google.com (unknown [2607:f8b0:4864:20::d2d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a90ce36d-afab-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:45:42 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id k8so104928022iot.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 06:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QNp+zH1oealJ9YY880GXRNZEFsO0M//GOpNilRajq/o=;
 b=K3jtC0JQ7A8zraBUOyRQ6EOMulF7l4LPotQczqOM6O8ikQ/StBfhUxdqRKZi+YKYBT
 +J3YI1NBDiCbIOor4BPJ9UtalmLgkUNP1U4m7mHlyDz7thZMjcEhLCsoksZmHtNPFtXE
 ybcrQDCfjXmiHhsEkrzZV6RTHg79dvt5VHpL/90gDp0gENB3HbtlC9m1ToeFyemGYKhy
 1cuCoFZIRW8XRZLFZl4Rl1wk8JjIlPCRnkoA7HielCmYIyRcnB02BvjWwgvC2rwlaX2x
 nQUXVeJBPmiSRdI4rb/vA6EADwEjmKbmy/4HQLPVJis2VMtk3+dEDlBu6b6qEQC4pPuu
 5mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNp+zH1oealJ9YY880GXRNZEFsO0M//GOpNilRajq/o=;
 b=fmQy5c6akHoPqePzGwGNJFCrcVi4f9Q+CAkqXdmAd/wZbsQbdbMpbJB61i0HQPXVMT
 kbIGXzW218l/Gy7iyS3XRimT6l8jDZ/eGTRsGS4rYPKeSvppUVjMUq5VrzvdgmkavCd9
 Z7UaVaEb0CKye/YNTaHznm/MeNOsivWsz1xIwkg6c1d6cgPwDXj/e/vuo7h2+aw0tb3Y
 Y50RrlZAfpnnzdz4wbRq+Bccs6PTbflwg5dJvbineQw7O2WYqiddwxktBXg8Z/TmxQCu
 6YfcEMTfeYejKfyb1E/viSD9k5D29AKCRJu49cmhou7aPj/phuDPNRZgDpzv/JMvAOXz
 hthg==
X-Gm-Message-State: APjAAAWJtQ0e9+SR1OYLROIWflalXJKMPNnoGk2lSVkteoOx9Tger8nV
 nv7XgpSqTnKRoMn7DYL0st9WLW9wpteNEJU9sCA=
X-Google-Smtp-Source: APXvYqxXCZ4MX/arRdZnB7YDHf9MbCT9vII+x6XgXqhpP81pN88rQFh8A2RWo1Qu1Q+/8LlrnlAUl210DVK+3xpri0A=
X-Received: by 2002:a02:16c5:: with SMTP id a188mr99644704jaa.86.1564148741829; 
 Fri, 26 Jul 2019 06:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
 <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
In-Reply-To: <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 26 Jul 2019 16:45:30 +0300
Message-ID: <CAOcoXZbXPys+LjzhwP5f75rcKSXKatmPSaiA+MvVVm0_FWK7GA@mail.gmail.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Xen-devel] Xen Coding style and clang-format
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Committers <committers@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBIaSBWaWt0b3IsCgpIaSBMYXJzLAoKPiB0aGFuayB5b3UgZm9yIHB1dHRpbmcgdGhpcyBtYWls
IHRvZ2V0aGVyIGFuZCBkcml2aW5nIHRoaXMgZm9yd2FyZC4gSSBhZGRlZCBjb21taXR0ZXJzQCBh
cyB3ZWxsIGFzIERvdWcuIEkgYW0gZ29pbmcgdG8gbGV0IG90aGVycyByZXNwb25kIGZpcnN0Lgo+
IEkgYW0gYXNzdW1pbmcgd2UgYXJlIGxvb2tpbmcgZm9yIHNvbWUgdGVzdGluZz8KClllcywgeW91
IGFyZSByaWdodC4KVGhlIGltcGxlbWVudGF0aW9uIGhhcyBiZWVuIHVwZGF0ZWQgYW5kIHJldGVz
dGVkIHdpdGggbmV3ZXIgdmVyc2lvbnMKb2YgY2xhbmcgY29kZS4KV2UgYXJlIGxvb2tpbmcgZm9y
IHNvbWUgdGVzdGluZyBhbmQgZmVlZGJhY2sgdG8gbW92ZSBmb3J3YXJkLgoKPiBJcyB0aGVyZSBh
IHNpbXBsZSBzZXQgb2YgaW5zdHJ1Y3Rpb25zIHRvIGdldCBzdGFydGVkIGFuZCB0ZXN0IHRoZSB0
b29sPwoKWWVzLCBob3dldmVyLCBzaW5jZSB0aGUgY2hhbmdlcyBhcmUgbm90IGludGVncmF0ZWQg
aW50byBjbGFuZy1mb3JtYXQKbWFpbmxpbmUgeWV0LAp0byB0ZXN0IHRoZSB0b29sIGl0IG5lZWRz
IHRvIGNvbXBpbGUgY2xhbmctZm9ybWF0IHRvb2wgd2l0aCB0aGUgcGF0Y2ggZmlyc3QuCgpUaGVy
ZSBhcmUgdHdvIHVzZS1jYXNlcyB3aXRoIGl0OgotIGNsYW5nLWZvcm1hdCBiaW5hcnkgY2FuIGJl
IHVzZWQgYXMtaXMgdG8gY2hlY2sgZ2l2ZW4gZmlsZSBvciBtYW55IGZpbGVzLgpGb3IgZXhhbXBs
ZSwgdGhlIG5leHQgY29tbWFuZCBmb3JtYXRzIGFsbCB4ZW4gKi5jIGZpbGVzIHdpdGggaXQuCmZp
bmQgfi93L3hlbi94ZW4gLW5hbWUgJyouYycgLXByaW50MCB8IHhhcmdzIC0wIC1uIDEgLVAgMTIK
fi93L2xsdm0tcHJvamVjdC9iaW4vY2xhbmctZm9ybWF0IC1pIC1zdHlsZT14ZW4KClNlZSBvdXRw
dXQgZXhhbXBsZSBpbjoKaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3Zpa3Rvci1t
aXRpbi94ZW4tY2xhbmctZm9ybWF0LWV4YW1wbGUvbWFzdGVyLzAwMDEtY2xhbmctZm9ybWF0LWNo
ZWNrcGF0Y2gtb3V0cHV0LWV4YW1wbGUucGF0Y2gKCi0gYW5vdGhlciB1c2UtY2FzZSBpcyB0byBy
dW4gaXQgd2l0aCBjbGFuZy1mb3JtYXQgZGlmZiBjaGVja2VyLApGb3IgZXhhbXBsZSwgdGhlIG5l
eHQgY29tbWFuZCBsaW5lIGNoZWNrcyB0aGUgbGF0ZXN0IGNvbW1pdCBpbiBjYXNlIG9mIGdpdDoK
IGdpdCBkaWZmIC1VMCAtLW5vLWNvbG9yIEhFQUReIHwgY2xhbmctZm9ybWF0LWRpZmYgLXAxCgpU
aGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
