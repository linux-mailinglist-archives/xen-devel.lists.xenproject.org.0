Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD8F2B08D
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 10:47:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVBEa-0006ll-5w; Mon, 27 May 2019 08:43:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+lSn=T3=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1hVBEY-0006lg-91
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 08:43:54 +0000
X-Inumbo-ID: 8cefbc3c-805b-11e9-b1c1-3bf978804e6c
Received: from mail-ot1-f68.google.com (unknown [209.85.210.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cefbc3c-805b-11e9-b1c1-3bf978804e6c;
 Mon, 27 May 2019 08:43:50 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id r10so14158435otd.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2019 01:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SPyeTzPFoh+1jcHD1T6EeO+I9ugNzJgCyHNSVSPB+Tc=;
 b=Kz+YlLsg2AqZl6L/jOAOhkO72zQPM2wK72Tn84ykMMYqyYs47yTjbldZwE46+7Akc/
 3cqVyeNcTeqZ0wfTbmuPBxmrq9eV1NPt2PNPFAGgTFZPfI5BC79iwvJUpywaQTUNpd3g
 M3FCJTfw4Dthic8ikf3yWq3jveBvIpVWsffm7eiyeE1L6JHtKFAfoB2xmwwKSvGhWPpT
 iKZxtCIqs5y5quF6yD2NjKYft/Ls/QrIqegAD6kRRcC6ZmlcDd33ktfPNTb2mPCUJryf
 w+4OIFrOtE3JUO5UGz7mro6366Sh02ZhCOmdQ/N9xI5v2llhm7F5/ssekREYdNQNK+xG
 thAw==
X-Gm-Message-State: APjAAAVp2zPhCGrN7GQseCVCpDPn+z8yN9gci7ZvGVZFWwAPiE37rZ82
 0grqTgcDiulVKsSw+WRm1EBts4RB77YOzq9aj1s=
X-Google-Smtp-Source: APXvYqxIlLFH84yhUFerMj/YlUDBNDBRTGJTxhPDFRXnfvuo7mYZbz39ugxbhoZlfat/iRijWwRpROWfadWrjYSeMCE=
X-Received: by 2002:a9d:7dd5:: with SMTP id k21mr43860970otn.167.1558946630255; 
 Mon, 27 May 2019 01:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558362030.git.mchehab+samsung@kernel.org>
 <4fd1182b4a41feb2447c7ccde4d7f0a6b3c92686.1558362030.git.mchehab+samsung@kernel.org>
In-Reply-To: <4fd1182b4a41feb2447c7ccde4d7f0a6b3c92686.1558362030.git.mchehab+samsung@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 May 2019 10:43:39 +0200
Message-ID: <CAJZ5v0iiSo=yoyZTt6ddf5fBRGy1wSvzmA-ZaHH33nivkSp22Q@mail.gmail.com>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [Xen-devel] [PATCH 10/10] docs: fix broken documentation links
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
Cc: kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-i2c <linux-i2c@vger.kernel.org>, linux-kselftest@vger.kernel.org,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 the arch/x86 maintainers <x86@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 "open list:EDAC-CORE" <linux-edac@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgNDo0OCBQTSBNYXVybyBDYXJ2YWxobyBDaGVoYWIKPG1j
aGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE1vc3RseSBkdWUgdG8geDg2IGFu
ZCBhY3BpIGNvbnZlcnNpb24sIHNldmVyYWwgZG9jdW1lbnRhdGlvbgo+IGxpbmtzIGFyZSBzdGls
bCBwb2ludGluZyB0byB0aGUgb2xkIGZpbGUuIEZpeCB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTog
TWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KCkZvciB0
aGUgQUNQSSBwYXJ0OgoKQWNrZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwuai53eXNv
Y2tpQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
