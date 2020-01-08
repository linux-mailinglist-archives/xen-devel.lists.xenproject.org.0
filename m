Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F49013495E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:30:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipF84-0003wU-Un; Wed, 08 Jan 2020 17:28:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cnPU=25=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipF83-0003wP-Bk
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:28:23 +0000
X-Inumbo-ID: 44a2753a-323c-11ea-b861-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44a2753a-323c-11ea-b861-12813bfff9fa;
 Wed, 08 Jan 2020 17:28:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578504502; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=Epek/Sv6CunKtbS1wpqJ0ISqZOOM+dajigSQNVbZe7k=;
 b=V0E53qUc2s6ymRRk6JtOM7YT+cAeXK9QaYoUso1O5fbglM9niX/hr7r1NhJ6BTaN/B3pQv9d
 dMKvu4Aj7AffUxye0Vc/kE9C3cSDZCLn2yg88NX1i1tEHR8zcDNZJfaDjvT0AK+dezHpC/mU
 JYj9Lk3uVaDRV8Z6I+4fa8c8Ry0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mxa.mailgun.org with ESMTP id 5e161123.7f9b9ec566f0-smtp-out-n03;
 Wed, 08 Jan 2020 17:28:03 -0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id z7so4201629wrl.13
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 09:28:02 -0800 (PST)
X-Gm-Message-State: APjAAAVSh0CPYa7Xd65uS4zRXbXb58+O1lSNNgSa2Ze/l7lzwWJEsPDB
 ZlBBicf1hbspMTXoj8ypTYf3RYLFfCJVKmc0EAg=
X-Google-Smtp-Source: APXvYqwjvnVP2Lf13lj+LnEBmpE/ERG9/4vZlgaGRhUTU1TJijg3U8mEfvmdAOTvGV9wd9OQj+8LZu2d6f2RTxw9W84=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr5652460wru.353.1578504481153; 
 Wed, 08 Jan 2020 09:28:01 -0800 (PST)
MIME-Version: 1.0
References: <20200108172428.28672-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200108172428.28672-1-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 8 Jan 2020 10:27:24 -0700
X-Gmail-Original-Message-ID: <CABfawhmz_1FANMBJt2iE5NyOm6UY7BbJrmab1qq8tDbymrzUcg@mail.gmail.com>
Message-ID: <CABfawhmz_1FANMBJt2iE5NyOm6UY7BbJrmab1qq8tDbymrzUcg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2] x86/mem_sharing: Fix RANDCONFIG build
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gOCwgMjAyMCBhdCAxMDoyNCBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IFRyYXZpcyByZXBvcnRzOiBodHRwczovL3RyYXZp
cy1jaS5vcmcvYW5keWhocC94ZW4vam9icy82MzM3NTE4MTEKPgo+ICAgbWVtX3NoYXJpbmcuYzoz
NjE6MTM6IGVycm9yOiAncm1hcF9oYXNfZW50cmllcycgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
ZXJyb3I9dW51c2VkLWZ1bmN0aW9uXQo+ICAgIHN0YXRpYyBib29sIHJtYXBfaGFzX2VudHJpZXMo
Y29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKPiAgICAgICAgICAgICAgICBeCj4gICBjYzE6
IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+Cj4gVGhpcyBoYXBwZW5zIGlu
IGEgcmVsZWFzZSBidWlsZCAoZGlzYWJsZXMgTUVNX1NIQVJJTkdfQVVESVQpIHdoZW4KPiBDT05G
SUdfTUVNX1NIQVJJTkcgaXMgZW5hYmxlZC4KPgo+IEV4cGFuZCBib3RoIHRyaXZpYWwgaGVscGVy
cyBpbnRvIHRoZWlyIHNpbmdsZSBjYWxsc2l0ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MhCgpBY2tlZC1ieTogVGFt
YXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
