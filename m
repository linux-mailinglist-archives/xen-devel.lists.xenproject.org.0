Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E5B1735FC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 12:22:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7dgG-0001zP-GN; Fri, 28 Feb 2020 11:19:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=srFd=4Q=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1j7dgF-0001zK-Ik
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 11:19:43 +0000
X-Inumbo-ID: 37994190-5a1c-11ea-b7e8-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37994190-5a1c-11ea-b7e8-bc764e2007e4;
 Fri, 28 Feb 2020 11:19:42 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id d62so2460403oia.11
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2020 03:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/41nq/s1Zf55rfLl2V9ZXClj6+IQ6ILd/tEc3fKBv1w=;
 b=ho0vDzmJbQ9Bdn4jkV6SZT2cdMc0y2aoZEmzi7PZifw7+mQD79ysvfNug/bkUMYC8C
 mjLBW1F2GDlm+rcrh0B5VPQTZtnQfZfognVkPM69jtpZoCdYDA4wKPvXCFahupuzRK0I
 OnT4Hsz1CHaxuFD8Vv9MmX/4xfQ8K2PmPSfx/7/g+Fnq77vLex031iJ9vSkfZOUaK6Gt
 KujVzWdWwHYWXP9r1jbkcfHSPo8FEzUmSa0ImneaTwbaX2TuFtfgeGwMqqwEqDvjdkWE
 BtLR+SlseatPVGk9Gnda4cP4erVP3B+5y8bqJG3O0b9dx5HNsQXslFUXq9ET6/+o5aS6
 1Wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/41nq/s1Zf55rfLl2V9ZXClj6+IQ6ILd/tEc3fKBv1w=;
 b=dl23auymuHph+lhdIbErTQXrXzmKwuehqe6+gV+7hOdZzxKSxswj2zl8RXMy8bK9MX
 J4djsxtHYMtnYqLMyv56b4UFquacgUooK3oGOnf3ma1e3BcK/OwJIyIC83HVdtAmRn3P
 ZQvKVHMyQGdApaNUuinrkcKrscmi4WkG+Wwt1rWiGyShjQiVfkCTfitsQ0R40Nul317n
 ZR7vxRcn5ZtoM2Nu9o/iC81sCH/LQF+gN/Uk+ZfvLRO7Uc5qsQhBcs9hpZLAxtA4sr6D
 J/Zt+8AnSWQjljDXkYGvrE3tdRtMzqPG1Tse2BlQ6zP4HGPEtox1dJ6/mVjbMyvucSoZ
 0/Xw==
X-Gm-Message-State: APjAAAXhBM54FLJbVKRaHNgrFAA5GQTu4fxgh1VZ7qaK3jy3ZSeGtjnk
 JzRNlnTo5cLl8zo13cLoLUob0BZxjNmiiNsr79VNqg==
X-Google-Smtp-Source: APXvYqwN7UFS1OPGuIHSdFJfG9v4cI73cxPvD8tJDAKhaXtKdsbFbCf/fghZEIao4BSdbJHkxicVvGcrcgA/iqtExq0=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr2646050oie.146.1582888782411; 
 Fri, 28 Feb 2020 03:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20200227121645.2601280-1-anthony.perard@citrix.com>
In-Reply-To: <20200227121645.2601280-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 11:19:31 +0000
Message-ID: <CAFEAcA_QBM5YUZGVFZ3oH3_Sry3Z5p0PyqR+DV2Vk-pcqEURWQ@mail.gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [PULL 0/3] Xen queue 2020-02-27
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
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyNyBGZWIgMjAyMCBhdCAxMjoxNiwgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCBkYjczNmUwNDM3YWE2ZmQ3YzFiN2U0NTk5YzE3Zjk2MTlhYjZiODM3Ogo+Cj4gICBNZXJn
ZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1vdGVzL2JvbnppbmkvdGFncy9mb3ItdXBzdHJl
YW0nIGludG8gc3RhZ2luZyAoMjAyMC0wMi0yNSAxMzozMToxNiArMDAwMCkKPgo+IGFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRwczovL3hlbmJpdHMueGVu
Lm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC9xZW11LWRtLmdpdCB0YWdzL3B1bGwteGVuLTIw
MjAwMjI3Cj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNWQ0Yzk1NDkzMWJhNjI2
NjFjNmExYmMxNmNlNjA0YTAxMmExMDAwNzoKPgo+ICAgTWVtb3J5OiBPbmx5IGNhbGwgcmFtYmxv
Y2tfcHRyIHdoZW4gbmVlZGVkIGluIHFlbXVfcmFtX3dyaXRlYmFjayAoMjAyMC0wMi0yNyAxMTo1
MDozMCArMDAwMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBYZW4gcXVldWUgMjAyMC0wMi0yNwo+Cj4gKiBmaXgg
Zm9yIHhlbi1ibG9jawo+ICogZml4IGluIGV4ZWMuYyBmb3IgbWlncmF0aW9uIG9mIHhlbiBndWVz
dAo+ICogb25lIGNsZWFudXAgcGF0Y2gKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkFwcGxpZWQsIHRoYW5rcy4KClBs
ZWFzZSB1cGRhdGUgdGhlIGNoYW5nZWxvZyBhdCBodHRwczovL3dpa2kucWVtdS5vcmcvQ2hhbmdl
TG9nLzUuMApmb3IgYW55IHVzZXItdmlzaWJsZSBjaGFuZ2VzLgoKLS0gUE1NCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
