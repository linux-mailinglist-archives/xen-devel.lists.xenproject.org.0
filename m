Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF6B12400C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 08:06:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihTNG-0000C0-CH; Wed, 18 Dec 2019 07:03:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dfmg=2I=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1ihTNF-0000Bv-IO
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 07:03:57 +0000
X-Inumbo-ID: 8ef78b40-2164-11ea-88e7-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ef78b40-2164-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 07:03:57 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 2E3AD15039438;
 Tue, 17 Dec 2019 23:03:56 -0800 (PST)
Date: Tue, 17 Dec 2019 23:03:55 -0800 (PST)
Message-Id: <20191217.230355.1103471479325489165.davem@davemloft.net>
To: pdurrant@amazon.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191217133218.27085-3-pdurrant@amazon.com>
References: <20191217133218.27085-1-pdurrant@amazon.com>
 <20191217133218.27085-3-pdurrant@amazon.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 17 Dec 2019 23:03:56 -0800 (PST)
Subject: Re: [Xen-devel] [PATCH net-next 2/3] xen-netback: switch state to
 InitWait at the end of netback_probe()...
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
Cc: xen-devel@lists.xenproject.org, wei.liu@kernel.org, paul@xen.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpEYXRlOiBUdWUsIDE3IERl
YyAyMDE5IDEzOjMyOjE3ICswMDAwCgo+IC4uLmFzIHRoZSBjb21tZW50IGFib3ZlIHRoZSBmdW5j
dGlvbiBzdGF0ZXMuCj4gCj4gVGhlIHN3aXRjaCB0byBJbml0aWFsaXNpbmcgYXQgdGhlIHN0YXJ0
IG9mIHRoZSBmdW5jdGlvbiBpcyBzb21ld2hhdCBib2d1cwo+IGFzIHRoZSB0b29sc3RhY2sgd2ls
bCBoYXZlIHNldCB0aGF0IGluaXRpYWwgc3RhdGUgYW55d2F5LiBUbyBiZWhhdmUKPiBjb3JyZWN0
bHksIGEgYmFja2VuZCBzaG91bGQgc3dpdGNoIHRvIEluaXRXYWl0IG9uY2UgaXQgaGFzIHNldCB1
cCBhbGwKPiB4ZW5zdG9yZSB2YWx1ZXMgdGhhdCBtYXkgYmUgcmVxdWlyZWQgYnkgYSBpbml0aWFs
aXNpbmcgZnJvbnRlbmQuIFRoaXMKPiBwYXRjaCBjYWxscyBiYWNrZW5kX3N3aXRjaF9zdGF0ZSgp
IHRvIG1ha2UgdGhlIHRyYW5zaXRpb24gYXQgdGhlCj4gYXBwcm9wcmlhdGUgcG9pbnQuCj4gCj4g
Tk9URTogYmFja2VuZF9zd2l0Y2hfc3RhdGUoKSBpZ25vcmVzIGVycm9ycyBmcm9tIHhlbmJ1c19z
d2l0Y2hfc3RhdGUoKQo+ICAgICAgIGFuZCBzbyB0aGlzIHBhdGNoIHJlbW92ZXMgYW4gZXJyb3Ig
cGF0aCBmcm9tIG5ldGJhY2tfcHJvYmUoKS4gVGhpcwo+ICAgICAgIG1lYW5zIGEgZmFpbHVyZSB0
byBjaGFuZ2Ugc3RhdGUgYXQgdGhpcyBzdGFnZSAoaW4gdGhlIGFic2VuY2Ugb2YKPiAgICAgICBv
dGhlciBmYWlsdXJlcykgd2lsbCBsZWF2ZSB0aGUgZGV2aWNlIGluc3RhbnRpYXRlZC4gVGhpcyBp
cyBoaWdobHkKPiAgICAgICB1bmxpa2xleSB0byBoYXBwZW4gYXMgYSBmYWlsdXJlIHRvIGNoYW5n
ZSBzdGF0ZSB3b3VsZCBpbmRpY2F0ZSBhCj4gICAgICAgZmFpbHVyZSB0byB3cml0ZSB0byB4ZW5z
dG9yZSwgYW5kIHRoYXQgd2lsbCB0cmlnZ2VyIG90aGVyIGVycm9yCj4gICAgICAgcGF0aHMuIEFs
c28sIGEgJ3N0dWNrJyBkZXZpY2UgY2FuIHN0aWxsIGJlIGNsZWFuZWQgdXAgdXNpbmcgJ3VuYmlu
ZCcKPiAgICAgICBpbiBhbnkgY2FzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+CgpBcHBsaWVkLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
