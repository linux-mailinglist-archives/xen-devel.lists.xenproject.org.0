Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F8143283
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 20:40:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itcqU-0006V9-Gs; Mon, 20 Jan 2020 19:36:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aT4h=3J=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1itcqT-0006V4-1F
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 19:36:21 +0000
X-Inumbo-ID: 21f5ff6e-3bbc-11ea-aecd-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21f5ff6e-3bbc-11ea-aecd-bc764e2007e4;
 Mon, 20 Jan 2020 19:36:20 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j26so262539ljc.12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 11:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wSTQFYqMm6W3SnK91hzu3JLJdjh/hwj0KWVEaa0YhVM=;
 b=sbIctBzyZdo++BjzlLSGmx+nQhSpbMUVTFxbYUnMhiM0YorUP05B7jXnfdSz5fIxgE
 e243sJabCAr6RvU08JQcW2ZeNWMeYC7OCrwsgtj/2lVlAElPjJGdsVORRvYP0M+/Zs4T
 HjQCqmBEWAlOPvQYmaGFwECMi1+QgCgxlvTueettCUHDP1QrNMixX/HMGJ9itLdUkjop
 h9jXf8ZRtv0nJ3AYNJ+NbCa1s57cl4QjYy63De/t4xPeS69TtPDVq+3mNYKKb9G4VD4S
 xScasdcQjtTNHc9g0YWIjlnxHqZ6ps4qgwEUlKrBqMdgODS2/kxKcKg7EWitDnyAoc5d
 a7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wSTQFYqMm6W3SnK91hzu3JLJdjh/hwj0KWVEaa0YhVM=;
 b=WSOTBczFHzm1abNNvij8UL2t8tlipTKR35DqcTc3uJD5hMROiWwFCkYxcC/9FE2jnK
 i2rKoHhjTOQCkKq7OC70cN1ptewjh3Y0ELo0PIqIiJC2r8p3USJ5L1L9GmrIGHNyuR4L
 R+u62abRKAjy+8jj09VZCFR6q4kn2PPQBoPHZ9MKigrr/jr2XpbvKz8HXPk0+dHlq5os
 iNpGI8tAd++DpokvSVxCkfoTLuABrKl+uEhov3IleNZy1bB2JJW1KXfV0kGUcagTdUOI
 k9DsVyMeDUfGEuy9zXl6Ho6vpYhivsF7/SQJHZuW7+QVwG/kcOfLcm8g8hYU6Ez19uVg
 kzHw==
X-Gm-Message-State: APjAAAVB32iOe1BFN/ZdHqNbSOqB+jRLc3a14lVpzd1+iJTo1kjcSYTV
 f91x5fLWgwQhYbCyqWYdRaLWV1faLyQbCmXL0Ps=
X-Google-Smtp-Source: APXvYqzKn6EZQ8hrZCZKo+8aPqzusaaUjTIpwgK8wvalgILhMbBt5/TfeRVm0+DbgAF9NrNwGXrf7ivistSh1vZupng=
X-Received: by 2002:a2e:5357:: with SMTP id t23mr14653474ljd.227.1579548979344; 
 Mon, 20 Jan 2020 11:36:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <cd76e3559f841d3072558d9c603dc686f67d54c1.1579055705.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cd76e3559f841d3072558d9c603dc686f67d54c1.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Jan 2020 14:36:08 -0500
Message-ID: <CAKf6xptXYOwWu8V-mZh5H5o+gi-O01AmAw9PEuYVu0opUCpH3A@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 06/16] libxl: write qemu arguments into
 separate xenstore keys
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgOTo0MSBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gVGhpcyBhbGxv
d3MgdXNpbmcgYXJndW1lbnRzIHdpdGggc3BhY2VzLCBsaWtlIC1hcHBlbmQsIHdpdGhvdXQKPiBu
b21pbmF0aW5nIGFueSBzcGVjaWFsICJzZXBhcmF0b3IiIGNoYXJhY3Rlci4KPgo+IFNpZ25lZC1v
ZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhp
bmdzbGFiLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYzOgo+ICAtIHByZXZpb3VzIHZlcnNpb24g
b2YgdGhpcyBwYXRjaCAibGlieGw6IHVzZSBceDFiIHRvIHNlcGFyYXRlIHFlbXUKPiAgICBhcmd1
bWVudHMgZm9yIGxpbnV4IHN0dWJkb21haW4iIHVzZWQgc3BlY2lmaWMgbm9uLXByaW50YWJsZQo+
ICAgIHNlcGFyYXRvciwgYnV0IGl0IHdhcyByZWplY3RlZCBhcyB4ZW5zdG9yZSBkb2Vzbid0IGNv
cGUgd2VsbCB3aXRoCj4gICAgbm9uLXByaW50YWJsZSBjaGFycwo+IC0tLQoKVGhlIGNvZGUgbG9v
a3MgZ29vZC4KClJldmlld2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+
CgpPbmUgdGhvdWdodCBJIGhhdmUgaXMgZG1hcmdzIGlzIGEgc3RyaW5nIGZvciBtaW5pLW9zIGFu
ZCBhIGRpcmVjdG9yeQpmb3IgbGludXggc3R1YmRvbS4gIEl0J3MgdG9vbHN0YWNrIG1hbmFnZWQs
IHNvIGl0J3Mgbm90IGEgcHJvYmxlbS4KQnV0IHdvdWxkIGEgZGlmZmVyZW50IHhlbnN0b3JlIG5v
ZGUgYmUgbGVzcyBzdXJwcmlzaW5nIHRvIGh1bWFucz8KClJlZ2FyZHMsCkphc29uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
