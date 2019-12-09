Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248F8117FC3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 06:32:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieY5o-0003lL-Bs; Tue, 10 Dec 2019 05:29:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=poO8=Z7=google.com=ndesaulniers@srs-us1.protection.inumbo.net>)
 id 1ieQG2-0002Im-6B
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 21:07:54 +0000
X-Inumbo-ID: f6e198a2-1ac7-11ea-a1e1-bc764e2007e4
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6e198a2-1ac7-11ea-a1e1-bc764e2007e4;
 Mon, 09 Dec 2019 21:07:53 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id s64so1005651pgb.9
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 13:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K+eNXnjIau7cgWUnA3a2Cqn1U1V3PjkPxI5SSOqsokA=;
 b=N66gVvBqkf/IjPQJvFj30UwukfXdt7TOhv82tZT0Y1uUriBCsQn852PcFt58pbGqRp
 4gI4geMvYZAbnsP3cmY1HBIBfrePAAtWS2G2tDjmxVQrTuAXyr/GKlD+3jAmfHJ+x3mN
 nUbzjuk6TRlU2f/oY17DgyGFu2HHkF3EtxYivNULwN0EdRBe/tWmUNxjY+sABJZClkXu
 swMlYnD9n+MlEt5Z1j016kwLNcmGyJ2Kq0vCYcJ8ZgSnrSDEuCuiLHXWhqen6acZN7MY
 eTomNjbMQhZ5O3+bSXk2fvVW1quzeUl8aXog4mBOHVo/c9yhU3uKAenXTgNeqKN6+EI+
 yOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+eNXnjIau7cgWUnA3a2Cqn1U1V3PjkPxI5SSOqsokA=;
 b=Z39fYq3OQh0YpCJUWfes5n36vrB5Xu1jdAdfS4blhn6mcXaDsxuBxkBUrDmEJbzPUm
 79XYWAuzXw9VuWgFQxqc6YeoIwPw9ISj6J08pDA5Cg99/bJEBaFhAZ2Yr+6Uwb6OUzuo
 +QkxxqQu8YjTvqpE5jy6ndwLn04qU2WTktsz7m5CWJH/uJF0sTzxDaakboWPQMpJ5hz8
 3tqareziZ5Gh8GLqiweiuzlm/8oxAH/Pw0eKLgrT/h2CNXtrxWMo4xzYubptu2Bu1p7w
 AQmT4TGFxBpJzlWCag1gmVH8/OcdwLyD91DxrbNx7mriUq0CVzzinsMrg4tvY7tCHZnz
 GMoQ==
X-Gm-Message-State: APjAAAUzMjEf3HHjHFVQKE9cJ/DcNFpdhFJpnmr3A4XCSrvqTwDTPJFW
 VdqX3avwWEbBLXvKaWzl+J8R0bY2FW0nnmeN0H05TQ==
X-Google-Smtp-Source: APXvYqxUFVcNRk0/nAhQuNe2/SnfwtMmBoobRu1zKuYgYL2LWWtIcBKJdlZgzI3AQuAYyh7coP7wm3PK/UOBY/C2Cag=
X-Received: by 2002:a65:590f:: with SMTP id f15mr20478238pgu.381.1575925672294; 
 Mon, 09 Dec 2019 13:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20191209201444.33243-1-natechancellor@gmail.com>
In-Reply-To: <20191209201444.33243-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Dec 2019 13:07:41 -0800
Message-ID: <CAKwvOdmrGGn6f+XBOO3GCm-jVftLsFTUXdbhS9_iJVY03XqCjA@mail.gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Approved-At: Tue, 10 Dec 2019 05:29:50 +0000
Subject: Re: [Xen-devel] [PATCH] xen/blkfront: Adjust indentation in
 xlvbd_alloc_gendisk
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
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgOSwgMjAxOSBhdCAxMjoxNCBQTSBOYXRoYW4gQ2hhbmNlbGxvcgo8bmF0ZWNo
YW5jZWxsb3JAZ21haWwuY29tPiB3cm90ZToKPgo+IENsYW5nIHdhcm5zOgo+Cj4gLi4vZHJpdmVy
cy9ibG9jay94ZW4tYmxrZnJvbnQuYzoxMTE3OjQ6IHdhcm5pbmc6IG1pc2xlYWRpbmcgaW5kZW50
YXRpb247Cj4gc3RhdGVtZW50IGlzIG5vdCBwYXJ0IG9mIHRoZSBwcmV2aW91cyAnaWYnIFstV21p
c2xlYWRpbmctaW5kZW50YXRpb25dCj4gICAgICAgICAgICAgICAgIG5yX3BhcnRzID0gUEFSVFNf
UEVSX0RJU0s7Cj4gICAgICAgICAgICAgICAgIF4KPiAuLi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtm
cm9udC5jOjExMTU6Mzogbm90ZTogcHJldmlvdXMgc3RhdGVtZW50IGlzIGhlcmUKPiAgICAgICAg
ICAgICAgICAgaWYgKGVycikKPiAgICAgICAgICAgICAgICAgXgo+Cj4gVGhpcyBpcyBiZWNhdXNl
IHRoZXJlIGlzIGEgc3BhY2UgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGlzIGxpbmU7IHJlbW92ZQo+
IGl0IHNvIHRoYXQgdGhlIGluZGVudGF0aW9uIGlzIGNvbnNpc3RlbnQgYWNjb3JkaW5nIHRvIHRo
ZSBMaW51eCBrZXJuZWwKPiBjb2Rpbmcgc3R5bGUgYW5kIGNsYW5nIG5vIGxvbmdlciB3YXJucy4K
Pgo+IFdoaWxlIHdlIGFyZSBoZXJlLCB0aGUgcHJldmlvdXMgbGluZSBoYXMgc29tZSB0cmFpbGlu
ZyB3aGl0ZXNwYWNlOyBjbGVhbgo+IHRoYXQgdXAgYXMgd2VsbC4KPgo+IEZpeGVzOiBjODBhNDIw
OTk1ZTcgKCJ4ZW4tYmxrZnJvbnQ6IGhhbmRsZSBYZW4gbWFqb3IgbnVtYmVycyBvdGhlciB0aGFu
IFhFTlZCRCIpCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51
eC9pc3N1ZXMvNzkxCj4gU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFu
Y2VsbG9yQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyB8
IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgYi9kcml2ZXJz
L2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4gaW5kZXggYTc0ZDAzOTEzODIyLi5jMDJiZTA2YzUyOTkg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+ICsrKyBiL2RyaXZl
cnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPiBAQCAtMTExMyw4ICsxMTEzLDggQEAgc3RhdGljIGlu
dCB4bHZiZF9hbGxvY19nZW5kaXNrKGJsa2lmX3NlY3Rvcl90IGNhcGFjaXR5LAoKV2hpbGUgeW91
J3JlIGhlcmUsIHdvdWxkIHlvdSBwbGVhc2UgYWxzbyByZW1vdmluZyB0aGUgc2luZ2xlIHNwYWNl
CmJlZm9yZSB0aGUgbGFiZWxzIGluIHRoaXMgZnVuY3Rpb24/CgpJbiB2aW06CgovXiBbYS16QS1a
XQoKdHVybnMgdXAgNSBsYWJlbHMgd2l0aCB0aGlzLgoKPiAgICAgICAgIGlmICghVkRFVl9JU19F
WFRFTkRFRChpbmZvLT52ZGV2aWNlKSkgewo+ICAgICAgICAgICAgICAgICBlcnIgPSB4ZW5fdHJh
bnNsYXRlX3ZkZXYoaW5mby0+dmRldmljZSwgJm1pbm9yLCAmb2Zmc2V0KTsKPiAgICAgICAgICAg
ICAgICAgaWYgKGVycikKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+IC0g
ICAgICAgICAgICAgICBucl9wYXJ0cyA9IFBBUlRTX1BFUl9ESVNLOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiBlcnI7Cj4gKyAgICAgICAgICAgICAgIG5yX3BhcnRzID0gUEFSVFNf
UEVSX0RJU0s7Cj4gICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICBtaW5vciA9IEJM
S0lGX01JTk9SX0VYVChpbmZvLT52ZGV2aWNlKTsKPiAgICAgICAgICAgICAgICAgbnJfcGFydHMg
PSBQQVJUU19QRVJfRVhUX0RJU0s7Cj4gLS0KPiAyLjI0LjAKPgo+IC0tCj4gWW91IHJlY2VpdmVk
IHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdy
b3VwcyAiQ2xhbmcgQnVpbHQgTGludXgiIGdyb3VwLgo+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhp
cyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwg
dG8gY2xhbmctYnVpbHQtbGludXgrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbS4KPiBUbyB2
aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2ds
ZS5jb20vZC9tc2dpZC9jbGFuZy1idWlsdC1saW51eC8yMDE5MTIwOTIwMTQ0NC4zMzI0My0xLW5h
dGVjaGFuY2VsbG9yJTQwZ21haWwuY29tLgoKCgotLSAKVGhhbmtzLAp+TmljayBEZXNhdWxuaWVy
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
