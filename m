Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA86310CF3
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 21:00:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLuPN-0001xb-GS; Wed, 01 May 2019 18:56:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=o36U=TB=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hLuPM-0001xW-Dk
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 18:56:44 +0000
X-Inumbo-ID: dc491008-6c42-11e9-843c-bc764e045a96
Received: from mail-yw1-xc32.google.com (unknown [2607:f8b0:4864:20::c32])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dc491008-6c42-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 18:56:43 +0000 (UTC)
Received: by mail-yw1-xc32.google.com with SMTP id s66so8982509ywg.8
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 11:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=L0OAIA7YLj2eMA8UELwZHqQ4ywqQDpjdorIFNS5gqC0=;
 b=dZWtcsmxe3v1ARh0Gb1yHIMDjKh/oEG/J5eFAy2Bg1JhRdnhSgOm9L0KIquyhYLU3o
 7jS4DBV8N4E66UJv85wbE+sXw4yTNvW85SkQ5688sGDwB/1qrYzprH8oXJYB9WRqBNVB
 sq1u6WQKB500J+XCgCHrPobuYPG6qX8dbMCUShH+U7sKxk1DAyVWpGMqEHplv9l24Gzh
 MwjnmgyS1fE/QLyb8NHo8wpH3qSc8hsN56WXD/YWPeFD6Eb4LYIi4R09ytXDL4Htu3KL
 XZ1sG1D2dSVOlVoBgWqlrKAnbed7cE0QCPQtSdLhWqXT7/1vPJRm6X4ef/uHsJIRkpf4
 K+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=L0OAIA7YLj2eMA8UELwZHqQ4ywqQDpjdorIFNS5gqC0=;
 b=tlX5RiU8J+XzVihcab7VLiw13fTuEwcJGB8bVskhqgW1KHjjTvLO6tF0Z8RVecm0IF
 9TaXbcQFHB71Hgu80IkJOlitpb+8qmivlAMMKp1PnuaPnbPebA5gb3PT7P5q+dAM3l0p
 FFFkL1kVS+upOwuEnr7r6fxowECTJexbO58ZKBDA0oDPHJjeDBrOoXIdn5wLyr9pvuUC
 SzgDD6QB0AH+gqYN1SnEUdK3dfGzkzB5P/MXh9RfPNfzlUp/gVb8SyFWW2//d9h4Ii9y
 3fmKmCC/XnuuzFXsJlo8PbiTHtmhD06iUfzKiH3IbR7bg2W/Bu2yONwUK+7s06mwMAb8
 Ierw==
X-Gm-Message-State: APjAAAXk9TC+BMSJlmIhGtU4yhWmGHA0KAB+s/j0feTRBV6zitbPOpEr
 ZjmmzOVx0Jre4G29+JkaVFo=
X-Google-Smtp-Source: APXvYqyeACHUiwZ3ZiKGVApYOgxHwxO0pwLa86A4pUaXLbx+sWjAd0dq0fo36IS60X0VjiZ78qoVvw==
X-Received: by 2002:a0d:d487:: with SMTP id
 w129mr49925631ywd.182.1556737002771; 
 Wed, 01 May 2019 11:56:42 -0700 (PDT)
Received: from [100.64.77.67] ([173.245.206.154])
 by smtp.gmail.com with ESMTPSA id y85sm285313ywa.7.2019.05.01.11.56.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 11:56:42 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16E227)
In-Reply-To: <6C8757E6-5421-4082-81E1-C08CE7CEB992@xenproject.org>
Date: Wed, 1 May 2019 14:56:41 -0400
Message-Id: <D2399ED4-2A4C-4837-A1E8-F0CF61D90FF7@gmail.com>
References: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com>
 <DB7FD117-5AFE-4D4E-8BA6-A08475E48923@gmail.com>
 <6C8757E6-5421-4082-81E1-C08CE7CEB992@xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Xen-devel] [VOTE] tagging for operational messages sent to
 xen-devel@ (was Re: Xen 4.13 Development Update)
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Pu Wen <puwen@hygon.cn>,
 Luwei Kang <luwei.kang@intel.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBNYXkgMSwgMjAxOSwgYXQgMTQ6MzcsIExhcnMgS3VydGggPGxhcnMua3VydGgueGVuQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gCj4gUmljaCwKPiBhcyBub2JvZHkgcmVwbGllZCB0byB0aGUgbWFp
bCwgSSBhbSBpbmNsaW5lZCB0byBkaXNtaXNzIHRoZSBwcm9wb3NhbCBvZiBBTk4gZm9yIG5vdwo+
IExhcnMKCldoYXQgZG8geW91IHRoaW5rIGFib3V0IHRoZSBzdWdnZXN0aW9uIHRvIGFwcGx5IGEg
dGFnICgiQU5OT1VOQ0UiPykgZm9yIGVtYWlscyB0aGF0IGFyZSBtaXJyb3JlZCB0byB4ZW4tZGV2
ZWwgZnJvbSB0aGUgLWFubm91bmNlIG1haWxpbmcgbGlzdD8gIEphbiBjb21tZW50ZWQgb24gdGhh
dCBzdWdnZXN0aW9uIGluIGEgc2VwYXJhdGUgdGhyZWFkLgoKUmljaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
