Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC73214C
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2019 02:40:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXEUW-0000nG-Le; Sun, 02 Jun 2019 00:36:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uFtn=UB=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hXEUV-0000nB-1J
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2019 00:36:51 +0000
X-Inumbo-ID: 802b0412-84ce-11e9-9206-3759f872ad36
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 802b0412-84ce-11e9-9206-3759f872ad36;
 Sun, 02 Jun 2019 00:36:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559435806; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=gEjP1HD4hZW8G/gTkMZuO+2X3D4Z55MogS8d2j1etdI=;
 b=n4BISxYy/qCBdTMT7Xm+IcOBRAI8gstmDGXvJa89Bay+2ybe5B7ZkV3kM4ZymEglM600jJR0
 O3XENK25J1Fa49F8j6Cgz8sbq8CqLEZtEQkJyoBczClsOP7Xk5ZHbelBjFiaAqBA+dlbd8B7
 yZN3KCDrSnnl+r09kX1DxuqBGe4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mxa.mailgun.org with ESMTP id 5cf31a1d.7f3ed888ed30-smtp-out-n03;
 Sun, 02 Jun 2019 00:36:45 -0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id d7so1287544lfb.10
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jun 2019 17:36:44 -0700 (PDT)
X-Gm-Message-State: APjAAAULVAJqlyOR05DRMBmNeymu+wnSqlLZDSC6SDv6+C6Mg4b0w4YN
 337q4MH3yPppj0AsGMSIdYQAVrVuTKIHM0QdQ2s=
X-Google-Smtp-Source: APXvYqyVmQ75wSq+tIEZZ4kIomFjmK3wfKXtNYbZaHxmalrToPtqPrBMEGCI/H3uYbG5oCMGDH3D5u23FiydJvhG8sk=
X-Received: by 2002:ac2:429a:: with SMTP id m26mr8730206lfh.152.1559435803032; 
 Sat, 01 Jun 2019 17:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <c772d59cc1505001555927609351e3ecb849b315.1559224640.git.ppircalabu@bitdefender.com>
In-Reply-To: <c772d59cc1505001555927609351e3ecb849b315.1559224640.git.ppircalabu@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sat, 1 Jun 2019 18:36:07 -0600
X-Gmail-Original-Message-ID: <CABfawh=DwxDwAgn0HS7Y9uM4PR8TRtw9ipLOyY-RnWHqBN91ag@mail.gmail.com>
Message-ID: <CABfawh=DwxDwAgn0HS7Y9uM4PR8TRtw9ipLOyY-RnWHqBN91ag@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] 
	=?utf-8?b?W1BBVENIIDMvOV0gdm1fZXZlbnQ6IE1ha2Ug4oCY?=
	=?utf-8?b?bG9jYWzigJkgZnVuY3Rpb25zIOKAmHN0YXRpY+KAmQ==?=
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgODoxOCBBTSBQZXRyZSBQaXJjYWxhYnUKPHBwaXJjYWxh
YnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPgo+IHZtX2V2ZW50X2dldF9yZXNwb25zZSwgdm1f
ZXZlbnRfcmVzdW1lLCBhbmQgdm1fZXZlbnRfbWFya19hbmRfcGF1c2UgYXJlCj4gdXNlZCBvbmx5
IGluIHhlbi9jb21tb24vdm1fZXZlbnQuYy4KPgo+IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNh
bGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+CgpBY2tlZC1ieTogVGFtYXMgSyBMZW5n
eWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
