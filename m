Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56390143479
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 00:34:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itgWr-0001WR-9l; Mon, 20 Jan 2020 23:32:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JMHZ=3J=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1itgWq-0001WK-5X
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 23:32:20 +0000
X-Inumbo-ID: 197ebecc-3bdd-11ea-b833-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 197ebecc-3bdd-11ea-b833-bc764e2007e4;
 Mon, 20 Jan 2020 23:32:19 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id i23so634828lfo.7
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 15:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qCkm7lqj5Vu8R42V1P6amkuYFU8R31EGhSVxNInu42U=;
 b=m4tzAPxtGlk2f64gFcOoa2RlXA3k/KcDEQ5lXw+TPyio9nzKhEac66ima9+kUTiprR
 FpzvhwDTsnE3X2doKglG8ExeovBu5WRWKepwPdyLmIcRxn/yaeEWwe/W5Je0kA6QmoAH
 zs0KQH3BxxzP5s1vGG8NwCXdVh8NuepjL3d+mo41fRd5+kHJs5KT9ym0zWUNbYGQdzfU
 6uuH6WkQ75hboaGKR53/WvU/d41/Mnt0+hJSX8eChBQ3vZNWsrYMkhSPAaGdJnLT2ZVO
 Rgq0nJCjK6nF/vE18NhALcU21grhP665qKFhAi35+OIKup0tAbWljpFqtbPiWhHjNGpw
 Ylxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qCkm7lqj5Vu8R42V1P6amkuYFU8R31EGhSVxNInu42U=;
 b=kJRP+KhEBN4lPnWrvSP6+3+cAWjI0/cJWklWvGJxgGeIsDwldBlCaOryoNP/a7cBkk
 fLKWYV/KkPvY7MvBVvgLwpokzZZ6eIVPPiUoPzfbQl3cs+tcRWUshiwUopov7Uel45oP
 9+BdJ1Rsy0LZ1sYNjg3JzeGtf0791sSfxz3DEegI2O478GHylR29FJoUTEMRW/3khy7X
 K2vvcYGRjkAmIULO9+LVTLGDifx+P1xSb8eF9FThcw2tTjkqaj1uRIgyxcERwV0P7EIx
 tpD2ksOGHIN4eArjtzBfUyjaBQYHqXtvI+IBal420TnjKyHgGzg7MmzBke1XiYkxzK7e
 jnlA==
X-Gm-Message-State: APjAAAW7M2QFatI66MKq19/HheU/fRmyiBUftDwuucBCVVMscf6a3pS/
 V+q0KvMoozM8NfvADq+HybTpXIawPh6qqB3Lfao=
X-Google-Smtp-Source: APXvYqx6lJHfsBzs3HNOaefyGjz8wT7sltGyqYSLDJKiGMDfKBmksQhnv6mC6w8T0E1G4enY++qRwLslQZcPCm7cyVE=
X-Received: by 2002:ac2:4109:: with SMTP id b9mr929574lfi.9.1579563138644;
 Mon, 20 Jan 2020 15:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-3-george.dunlap@citrix.com>
In-Reply-To: <20200117155734.1067550-3-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Mon, 20 Jan 2020 18:32:06 -0500
Message-ID: <CAEBZRSd6Vg+Y9yMAV8x+2ScV3E-sROiwSksx33AZyk8p1U3xfQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 3/8] go/xenlight: More informative error
 messages
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBJZiBhbiBlcnJvciBpcyBlbmNvdW50ZXJlZCBkZWVwIGluIGEgY29tcGxpY2F0ZWQgZGF0YSBz
dHJ1Y3R1cmUsIGl0J3MKPiBvZnRlbiBkaWZmaWN1bHQgdG8gdGVsbCB3aGVyZSB0aGUgZXJyb3Ig
YWN0dWFsbHkgaXMuICBNYWtlIHRoZSBlcnJvcgo+IG1lc3NhZ2UgZnJvbSB0aGUgZ2VuZXJhdGVk
IHRvQygpIGFuZCBmcm9tQygpIHN0cnVjdHVyZXMgbW9yZQo+IGluZm9ybWF0aXZlIGJ5IHRhZ2dp
bmcgd2hpY2ggZmllbGQgYmVpbmcgY29udmVydGVkIGVuY291bnRlcmVkIHRoZQo+IGVycm9yLiAg
VGhpcyB3aWxsIGhhdmUgdGhlIGVmZmVjdCBvZiBnaXZpbmcgYSAic3RhY2sgdHJhY2UiIG9mIHRo
ZQo+IGZhaWx1cmUgaW5zaWRlIGEgbmVzdGVkIGRhdGEgc3RydWN0dXJlLgo+Cj4gTkIgdGhhdCBt
eSB2ZXJzaW9uIG9mIHB5dGhvbiBpbnNpc3RzIG9uIHJlb3JkZXJpbmcgYSBjb3VwbGUgb2Ygc3dp
dGNoCj4gc3RhdGVtZW50cyBmb3Igc29tZSByZWFzb247IEluIG90aGVyIHBhdGNoZXMgSSd2ZSBy
ZXZlcnRlZCB0aG9zZQo+IGNoYW5nZXMsIGJ1dCBpbiB0aGlzIGNhc2UgaXQncyBtb3JlIGRpZmZp
Y3VsdCBiZWNhdXNlIHRoZXkgaW50ZXJhY3QKPiB3aXRoIGFjdHVhbCBjb2RlIGNoYW5nZXMuICBJ
J2xsIGxlYXZlIHRoaXMgaGVyZSBmb3Igbm93LCBhcyB3ZSdyZQo+IGdvaW5nIHRvIHJlbW92ZSBo
ZWxwZXJzLmdlbi5nbyBmcm9tIGJlaW5nIHRyYWNrZWQgYnkgZ2l0IGF0IHNvbWUgcG9pbnQKPiBp
biB0aGUgbmVhciBmdXR1cmUgYW55d2F5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IE5pY2sgUm9zYnJvb2sg
PHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
