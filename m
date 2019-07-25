Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C1F750BE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 16:18:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqeX9-0004bC-8f; Thu, 25 Jul 2019 14:15:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Wb5=VW=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hqeX7-0004b7-Cc
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 14:15:49 +0000
X-Inumbo-ID: b2b31287-aee6-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b2b31287-aee6-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 14:15:48 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x25so48231390ljh.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2019 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6t3Mg1O9zSVMtXkdAai2DbqNpCv4e42Os50x1oTrYWQ=;
 b=YYtv+w+QUoGDWMZAGrEeKP6pvWOZM9qBo/UHgsT4OG4ZNSN/0KOA5S0hoUN2z5h/5Y
 KM6uIPtzxJUr+/5D+QL7pKKYIQP2Zq9MFzEneMYrr245zgjUf7mLfuW9rTEUdGg625SG
 HeBshYpwWI6XEg4vE1chwbL12WCWe5V2sIjBsVIr+GI7fMyRqyHSbGimeTWDq7lvqtZD
 YNxjyJYLZGE47O9/0XXhH5H21HkgUJ6yEmY5tXp4o4bUNp7FvJg0wTAc+y45Tj6dS8X2
 34uU1mp9vsvZcI1rKR+wYnBsFJKOBa9lEiGCsOpIQR99OinHeBHmAFnSz+ox8XD6JYUg
 O4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6t3Mg1O9zSVMtXkdAai2DbqNpCv4e42Os50x1oTrYWQ=;
 b=ALKBWfVkEtZwjn/WB3L2tKb/kcmOf01GYs0VsWZUbuD/zouhW6FCvK+pjMopFBs6Kl
 a2Ps7qRTjVsowiAL7H8euyiyQvOCu+oshNjhCkurtJ0y0Oi2H054eEzbTy5mqW9zn7ag
 j6iyu8cMvYfFURP4Pk2MvRY0QOY+z7TbeVuXYeabHhGguMPB5wjFddwmoUuS51MKPBOr
 san3VLqoYlwyO07kSOr65A4yoUL4Wsd/m8dgIcxAfDrcaFJDD+3NrxfJPVSvnyf/FOVh
 SsNmhA6KkWJSGqSFsqI0iFGdHUfzVFe1CM58YfnyfSzcqgk4AS8nt4gY7IdGQyEEmZIQ
 VM6Q==
X-Gm-Message-State: APjAAAVdCainnA4K1IJICOhZf3mam434f6hCyQjnM5xkX6JRV11SEO/0
 vsgy+KrCKtjdPWMRIt29YcR40uj/JfhhuNCc/ESS9qz5
X-Google-Smtp-Source: APXvYqwd4ea+KFEjJvajXNH4W/fWLJW2Dxh72wmYExU+JDxJH7ovOaZnwRpUGYrIb39CYiObbYvJUc6OaYevqCvAb4s=
X-Received: by 2002:a2e:8945:: with SMTP id b5mr45136358ljk.93.1564064146544; 
 Thu, 25 Jul 2019 07:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
In-Reply-To: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Thu, 25 Jul 2019 19:45:09 +0530
Message-ID: <CABHD4K87Z8QWtga6+FmkFXzJcot+WHH4KS7x-g1wOir8V2-tcQ@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] [RFC PATCH 0/2] XEN booting on i.MX8M platform
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, peng.fan@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiBTYXQsIEp1biA4LCAyMDE5IGF0IDE6NDYgQU0gQW1pdCBTaW5naCBUb21hciA8YW1p
dHRvbWVyMjVAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIHRyaWVzIHRvIGVuYWJs
ZSBYRU4gYm9vdGluZyBvbiBpLk1YIDhNUXVhZCBBcHBsaWNhdGlvbnMgUHJvY2Vzc29yc1sxXS4K
Pgo+IFBhdGNoLXNldCBpbmNsdWRlcyBkcml2ZXIgZm9yIFVBUlQgY29udHJvbGxlciBmb3VuZCBv
biBpLk1YOE1RIFNvQyBhbmQgZGVidWcgY29kZQo+IGZvciBlYXJseXByaW50ayBzdXBwb3J0Lgo+
CkdlbnRsZSBQaW5nLgoKVGhhbmtzCi1BbWl0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
