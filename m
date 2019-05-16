Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44F820599
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:50:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREq0-00041I-UK; Thu, 16 May 2019 11:46:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=388s=TQ=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hREpz-000417-33
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:46:15 +0000
X-Inumbo-ID: 3527a12e-77d0-11e9-8980-bc764e045a96
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3527a12e-77d0-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:46:14 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id r10so3130618otd.4
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 04:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=slMZAE1y7NixVSYih0ZYsCKD6gJ9Y++X06/Kejz/ClQ=;
 b=htVVwYQIv8WoGYKc/GYqfOjf1V8Y9tIsioGxXR0wQr5cF63SbWuRz0ofMc2gL/R3b8
 doJQoB5VZCgeyQVLQMmTkMV6MoEo7v+mUiRM8Fv2qIobU/SooBJrEvgunaSDWnZqEJQq
 w7SSx+84tqrSYibNxJm4pZL8jz8XkuQX144Eg5N7/sEpYA2m9h9qvUUNiGBAudrUf8m0
 7teST8idfNUGCBD5InumAAxHVLtZcCI/2/3JWfrb9xUwF1Ruh4xsRD9sEdBA3suvRjtd
 FA3by/rqMpXjyahyd9zFSK7RNWLslMNYL05NWJ/D7p2RWVmiG/8c+cAAekZb+PmjmgPQ
 /j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=slMZAE1y7NixVSYih0ZYsCKD6gJ9Y++X06/Kejz/ClQ=;
 b=k164nKFEsl7qnOAxhsOn9bYJFlmfzt0nmc1n92ZJMfG00HlrKrDjr94POFh7nqA+dr
 Rn7DiHPkYAh4hND05EqWJfDTysGVZbsv9qgKYMm3eNsbzBa+G1Mg44cismPC6hvCNPNm
 19cAr56nDqFX4u6rpBXHMTILxok1cZwgg4P/4vtpquT/QiHIQnDvAVUHxkxvqevQyhHZ
 llCTrPw72DTsnDekexB4U0JDAOv2h9xBek5nyJ6g15VJP93/J4A1yTLIjZJnbyjI/tsI
 QF3bg4L7j+DPaouARTHa0WTp6OVUyBEeWpynStkm8tbvA+XA+EbfKFAgbwGSSrVaCIds
 Q39w==
X-Gm-Message-State: APjAAAXoceKiKa9quDZIx8m1dRibB60Y9C3HGl6Fc4UjZBPoq9/yshGP
 jpUabPo9lug68JoZyzkjtbJKatB/GOzO9uV0V14=
X-Google-Smtp-Source: APXvYqx7LMJrrD3TIpfUQsc5HZq6jGgKh7ljiYCqaUzTTR352zAHUatrvNXWCfbxgDLIPVwFBsQqtNQJvYEHWK1L06g=
X-Received: by 2002:a9d:6a10:: with SMTP id g16mr29093446otn.203.1558007173520; 
 Thu, 16 May 2019 04:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <1556902928-18682-1-git-send-email-amittomer25@gmail.com>
 <60d23898-7e91-bb59-5bc8-b36d06452f28@gmail.com>
In-Reply-To: <60d23898-7e91-bb59-5bc8-b36d06452f28@gmail.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Thu, 16 May 2019 17:15:36 +0530
Message-ID: <CABHD4K_DybrEQBeG2pn9D68pFoPH9e0ior17uy3A-_mXeSA+cQ@mail.gmail.com>
To: Oleksandr <olekstysh@gmail.com>
Subject: Re: [Xen-devel] [PATCH] xen/arm: Black list everything with a PPI
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGFua3MgZm9yIGhhdmluZyBhIGxvb2sgYXQgaXQuCgpPbiBUaHUsIE1heSAxNiwg
MjAxOSBhdCAxMjoyNSBBTSBPbGVrc2FuZHIgPG9sZWtzdHlzaEBnbWFpbC5jb20+IHdyb3RlOgo+
Cj4KPiBPbiAwMy4wNS4xOSAyMDowMiwgQW1pdCBTaW5naCBUb21hciB3cm90ZToKPgo+IEhpLCBB
bWl0Cj4KPiA+IFhFTiBzaG91bGQgbm90IGZvcndhcmQgUFBJcyB0byBEb20wIGFzIGl0IG9ubHkg
c3VwcG9ydCBTUElzLgo+ID4gT25lIG9mIHNvbHV0aW9uIHRvIHRoaXMgcHJvYmxlbSBpcyB0byBz
a2lwIGFueSBkZXZpY2UgdGhhdAo+ID4gdXNlcyBQUEkgc291cmNlIGNvbXBsZXRlbHkgd2hpbGUg
YnVpbGRpbmcgZG9tYWluIGl0c2VsZi4KPiA+Cj4gPiBUaGlzIHBhdGNoIGdvZXMgdGhyb3VnaCBh
bGwgdGhlIGludGVycnVwdCBzb3VyY2VzIG9mIGRldmljZSBhbmQgc2tpcCBpdAo+ID4gaWYgb25l
IG9mIGludGVycnVwdCBzb3VyY2UgaXMgUFBJLiBJdCBmaXhlcyBYRU4gYm9vdCBvbiBpLk1YOE1R
IGJ5Cj4gPiBza2lwcGluZyBQTVUgbm9kZS4KPiA+Cj4gPiBTdWdnZXN0ZWQtYnk6ICBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQW1pdCBTaW5n
aCBUb21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgICAgICogVGhpcyBy
ZXBsYWNlcyBmb2xsb3dpbmcgcGF0Y2guCj4gPiAgICAgICAgaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMDg5OTg4MS8KPiA+IC0tLQo+ID4gICB4ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMgfCAxNiArKysrKysrKysrKysrKystCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4gaW5k
ZXggZDk4MzY3Ny4uOGY1NDQ3MiAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYwo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiBAQCAtMTM1
Myw3ICsxMzUzLDcgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX25vZGUoc3RydWN0IGRvbWFp
biAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKPiA+ICAgICAgICAgICB7IC8qIHNlbnRp
bmVsICovIH0sCj4gPiAgICAgICB9Owo+ID4gICAgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpj
aGlsZDsKPiA+IC0gICAgaW50IHJlczsKPiA+ICsgICAgaW50IHJlcywgaSwgbmlycSwgaXJxX2lk
Owo+ID4gICAgICAgY29uc3QgY2hhciAqbmFtZTsKPiA+ICAgICAgIGNvbnN0IGNoYXIgKnBhdGg7
Cj4gPgo+ID4gQEAgLTEzOTksNiArMTM5OSwyMCBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVf
bm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+ID4gICAg
ICAgICAgIHJldHVybiAwOwo+ID4gICAgICAgfQo+ID4KPiA+ICsgICAgLyogU2tpcCB0aGUgbm9k
ZSwgdXNpbmcgUFBJIHNvdXJjZSAqLwo+ID4gKyAgICBuaXJxID0gZHRfbnVtYmVyX29mX2lycShu
b2RlKTsKPiA+ICsKPiA+ICsgICAgZm9yICggaSA9IDAgOyBpIDwgbmlycSA7IGkrKyApCj4gPiAr
ICAgIHsKPiA+ICsgICAgICAgIGlycV9pZCA9IHBsYXRmb3JtX2dldF9pcnEobm9kZSwgaSk7Cj4K
PiBEbyB3ZSBuZWVkIHRvIGRvIHNvbWV0aGluZyBoZXJlIGlmIHBsYXRmb3JtX2dldF9pcnEoKSBy
ZXR1cm5zIC0xPwoKWWVhaCwgSSBzaG91bGQgaGF2ZSBkb25lIGl0LiBzb21lIHRoaW5rIGxpa2Ug
Zm9sbG93aW5nOgpodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWJs
b2I7Zj14ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmM7aD1kOTgzNjc3OWQxN2M5MGU4NGI5NGJh
MzJlNGEyMGYwMjgxODlmYzViO2hiPUhFQUQjbDEyODQKCj4gPiArCj4gPiArICAgICAgICBpZiAo
IGlycV9pZCA+PSAxNiAmJiBpcnFfaWQgPCAzMiApCj4gPiArICAgICAgICB7Cj4gPiArICAgICAg
ICAgICAgZHRfZHByaW50aygiIFNraXAgbm9kZSB3aXRoIChQUEkgc291cmNlKVxuIik7Cj4gPiAr
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArICAgICAgICB9Cj4gPiArICAgIH0KPiA+ICsKPiA+
ICAgICAgIC8qCj4gPiAgICAgICAgKiBYZW4gaXMgdXNpbmcgc29tZSBwYXRoIGZvciBpdHMgb3du
IHB1cnBvc2UuIFdhcm4gaWYgYSBub2RlCj4gPiAgICAgICAgKiBhbHJlYWR5IGV4aXN0cyB3aXRo
IHRoZSBzYW1lIHBhdGguCj4KPiBQYXRjaCBsb29rcyBnb29kLiBBbHRob3VnaCBSLUNhciBIMyBz
ZWVtcyB0byBub3QgdXNlIFBQSXMgZm9yIFBNVSwgSQo+IGhhdmUgdGVzdGVkIHlvdXIgcGF0Y2gg
anVzdCB0byBiZSBzdXJlIGl0IHdvdWxkbid0IHNraXAgYW55dGhpbmcgYnkgYQo+IG1pc3Rha2Up
CgpPaywgVGhhbmtzIGZvciB0ZXN0aW5nIGl0LiBJIHdvdWxkIHJlc2VuZCBpdCB3aXRoIGVycm9y
IGNvbmRpdGlvbiBjaGVjay4KCi1UaGFua3MKQW1pdC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
