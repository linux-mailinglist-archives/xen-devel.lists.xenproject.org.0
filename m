Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E57CDDED
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 11:04:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHOti-0006k2-K6; Mon, 07 Oct 2019 09:01:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hoFu=YA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iHOtg-0006jI-IP
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 09:01:40 +0000
X-Inumbo-ID: 11c88630-e8e1-11e9-97a8-12813bfff9fa
Received: from mail-lj1-f194.google.com (unknown [209.85.208.194])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11c88630-e8e1-11e9-97a8-12813bfff9fa;
 Mon, 07 Oct 2019 09:01:38 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id d1so12703469ljl.13
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 02:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LSI6j5+BqLjE2fXhCdjWIbZ1SMys/wRTuZOGLx9ndVU=;
 b=qmS4PpcJEEciga/qlfUjTpJf0T9lhpdwRtjgBrG8MaJQvX1rNj+WEWrElStnKQ9Ubm
 l2YnfBP2J3lQOeWiEzJ7GeBzVp5/jn/Yr/95S5OyZTDvFyVs7dvwpJ+rE7WM1+8tCtPg
 ssA5sCIuptTbTC5BWlxuQPYxjOFeyw2mclKd89OFVS0On2rQriM94mkaovN1Labz2E1L
 J9VmeDKxLhZEROMK3LDHp4TQUdxchL1DDmLX6/CDKVhlXETgrFaqMN9uRUnz8j1M7TmM
 UmDD9+VX9dq9WP9SQa0j0nL2axHXySNj65qCR4y11waVYloUruFLMu3bHR4o7NasTyao
 STqw==
X-Gm-Message-State: APjAAAX5DRkTOcLLg1QXTeqMcalmFMqZcTi5RH/t2BFxqLKEiUThPVHQ
 DhBhQI5SD/8aeI9cQ3PFx9FrvHgG
X-Google-Smtp-Source: APXvYqzfEFn7xL40hyE3kDNfXb/x6U+K8pWu3THS248fXHiNikjkc3uag/f25TcFq8yBWJUfajejHg==
X-Received: by 2002:a2e:8107:: with SMTP id d7mr17292821ljg.2.1570438896592;
 Mon, 07 Oct 2019 02:01:36 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id l7sm2961053lji.46.2019.10.07.02.01.36
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2019 02:01:36 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id r134so8648754lff.12
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 02:01:36 -0700 (PDT)
X-Received: by 2002:ac2:5983:: with SMTP id w3mr15735638lfn.121.1570438895929; 
 Mon, 07 Oct 2019 02:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <EABA07C5-13F3-4D78-BDB9-21A4B5C5772E@citrix.com>
 <20191004085728.ba4tpw6gfvhcaowz@debian>
 <1B611AEA-677A-47CF-8F6D-BA811F0D5330@citrix.com>
In-Reply-To: <1B611AEA-677A-47CF-8F6D-BA811F0D5330@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Mon, 7 Oct 2019 10:01:20 +0100
X-Gmail-Original-Message-ID: <CAK9nU=pUpSfOJrh7cOjVZmCsgfr79C2txdqYUyfvrQCxQweCnA@mail.gmail.com>
Message-ID: <CAK9nU=pUpSfOJrh7cOjVZmCsgfr79C2txdqYUyfvrQCxQweCnA@mail.gmail.com>
To: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Xen-devel] [PATCH for-4.13] docs: update all URLs in man pages
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCA3IE9jdCAyMDE5IGF0IDA5OjEzLCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJp
eC5jb20+IHdyb3RlOgo+Cj4KPgo+IO+7v09uIDA0LzEwLzIwMTksIDA5OjU3LCAiV2VpIExpdSIg
PHdsQHhlbi5vcmc+IHdyb3RlOgo+Cj4gICAgIE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDA0OjEy
OjMwUE0gKzAwMDAsIExhcnMgS3VydGggd3JvdGU6Cj4gICAgID4gU3BlY2lmaWNhbGx5Cj4gICAg
ID4gKiB4ZW4ub3JnIHRvIHhlbnByb2plY3Qub3JnCj4gICAgID4gKiBodHRwIHRvIGh0dHBzCj4g
ICAgID4gKiBSZXBsYWNlZCBwYWdlcyB3aGVyZSBwYWdlIGhhcyBtb3ZlZAo+ICAgICA+ICAgKGlu
Y2x1ZGluZyBvbiB4ZW4gcGFnZXMgYXMgd2VsbCBhcyBleHRlcm5hbCBwYWdlcykKPiAgICAgPiAq
IFJlbW92ZWQgc29tZSBVUkxzIChlLmcuIGRvd25sb2FkcyBmb3IgTGludXggUFYgZHJpdmVycykK
PiAgICAgPgo+ICAgICA+IFRlc3RlZC1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXgu
Y29tPgo+ICAgICA+IFNpZ25lZC1vZmYtYnk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4
LmNvbT4KPgo+ICAgICBEbyB5b3UgaGF2ZSBhIGJyYW5jaCBmb3IgdGhpcyBwYXRjaD8KPgo+IFVu
Zm9ydHVuYXRlbHksIG5vdDogSSBuZXZlciBjcmVhdGVkIGEgcGVyc29uYWwgY29weSBvZiB4ZW4u
Z2l0IG9uIHhlbmJpdHMKPiBSZWFsbHkgc2hvdWxkIGRvIHRoaXMKClBsZWFzZSBkby4gSSBjb3Vs
ZG4ndCByZXBseSB0aGlzIHBhdGNoIGNsZWFubHkuIE5vdCBzdXJlIHdoeSBnaXQKd2Fzbid0IGhh
cHB5IGFib3V0IGl0LgoKV2VpLgoKPiBMYXJzCj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
