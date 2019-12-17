Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD2123035
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:25:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihEh6-0001Oa-5Z; Tue, 17 Dec 2019 15:23:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J1Kd=2H=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1ihEh5-0001OQ-9v
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 15:23:27 +0000
X-Inumbo-ID: 27144604-20e1-11ea-b6f1-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27144604-20e1-11ea-b6f1-bc764e2007e4;
 Tue, 17 Dec 2019 15:23:18 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so3626808wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 07:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j8BDIpO9Zy1hRZoBINSyR5TXnQqjD5E22aWmsf8ruxo=;
 b=EOvJbl7NTCtUgs0M4U39yav8KYf9cbuT87vIHFfZqat3vPqEiREoMUl4rhSEr6sk0c
 PhDGGZqKb0virMHk1GZqtrVKISx1DRGPmyPp2HdKQSWEc+c0BtnEe1Cyp6iD5kU74A7f
 q11rmVoiTuYU2hOjT+VMmkZbJVsEQCzBWSipqxY3J0RWiyz8QTEqCkC4rzFb1WWGHoM4
 WFObw08ceZa64oAH3MMB4gaY7zk/mbM+z3K72ZaAsOqQOTHzs0SOeJNfXGIIKWOJgPkp
 kM2bB3LLWuu8BQ1ATQuaowkoLCois1jmq5BHF1EN62tFsYj52vuFQprodu/lKACj+fgG
 1x3w==
X-Gm-Message-State: APjAAAW7mY7kw/k9SKQcvpMjEIi6zwTsKzDAusN6EKO9Oj98C5P0U5mr
 4zAxGKz/mAAagmWzKtKoGvg=
X-Google-Smtp-Source: APXvYqxykdupmaaJlCGhZTu9d3ZjUfBJpeEMVH/5yMAA143BPmfWgEIabGlr18MOEXLHNQaeKr3mGA==
X-Received: by 2002:a7b:c051:: with SMTP id u17mr6042189wmc.174.1576596197992; 
 Tue, 17 Dec 2019 07:23:17 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id w13sm25989787wru.38.2019.12.17.07.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 07:23:17 -0800 (PST)
Date: Tue, 17 Dec 2019 15:23:15 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191217152315.gxsi4idfxnmloe6u@debian>
References: <20191217133218.27085-1-pdurrant@amazon.com>
 <20191217133218.27085-3-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217133218.27085-3-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMDE6MzI6MTdQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmFzIHRoZSBjb21tZW50IGFib3ZlIHRoZSBmdW5jdGlvbiBzdGF0ZXMuCj4gCj4g
VGhlIHN3aXRjaCB0byBJbml0aWFsaXNpbmcgYXQgdGhlIHN0YXJ0IG9mIHRoZSBmdW5jdGlvbiBp
cyBzb21ld2hhdCBib2d1cwo+IGFzIHRoZSB0b29sc3RhY2sgd2lsbCBoYXZlIHNldCB0aGF0IGlu
aXRpYWwgc3RhdGUgYW55d2F5LiBUbyBiZWhhdmUKPiBjb3JyZWN0bHksIGEgYmFja2VuZCBzaG91
bGQgc3dpdGNoIHRvIEluaXRXYWl0IG9uY2UgaXQgaGFzIHNldCB1cCBhbGwKPiB4ZW5zdG9yZSB2
YWx1ZXMgdGhhdCBtYXkgYmUgcmVxdWlyZWQgYnkgYSBpbml0aWFsaXNpbmcgZnJvbnRlbmQuIFRo
aXMKPiBwYXRjaCBjYWxscyBiYWNrZW5kX3N3aXRjaF9zdGF0ZSgpIHRvIG1ha2UgdGhlIHRyYW5z
aXRpb24gYXQgdGhlCj4gYXBwcm9wcmlhdGUgcG9pbnQuCj4gCj4gTk9URTogYmFja2VuZF9zd2l0
Y2hfc3RhdGUoKSBpZ25vcmVzIGVycm9ycyBmcm9tIHhlbmJ1c19zd2l0Y2hfc3RhdGUoKQo+ICAg
ICAgIGFuZCBzbyB0aGlzIHBhdGNoIHJlbW92ZXMgYW4gZXJyb3IgcGF0aCBmcm9tIG5ldGJhY2tf
cHJvYmUoKS4gVGhpcwo+ICAgICAgIG1lYW5zIGEgZmFpbHVyZSB0byBjaGFuZ2Ugc3RhdGUgYXQg
dGhpcyBzdGFnZSAoaW4gdGhlIGFic2VuY2Ugb2YKPiAgICAgICBvdGhlciBmYWlsdXJlcykgd2ls
bCBsZWF2ZSB0aGUgZGV2aWNlIGluc3RhbnRpYXRlZC4gVGhpcyBpcyBoaWdobHkKPiAgICAgICB1
bmxpa2xleSB0byBoYXBwZW4gYXMgYSBmYWlsdXJlIHRvIGNoYW5nZSBzdGF0ZSB3b3VsZCBpbmRp
Y2F0ZSBhCj4gICAgICAgZmFpbHVyZSB0byB3cml0ZSB0byB4ZW5zdG9yZSwgYW5kIHRoYXQgd2ls
bCB0cmlnZ2VyIG90aGVyIGVycm9yCj4gICAgICAgcGF0aHMuIEFsc28sIGEgJ3N0dWNrJyBkZXZp
Y2UgY2FuIHN0aWxsIGJlIGNsZWFuZWQgdXAgdXNpbmcgJ3VuYmluZCcKPiAgICAgICBpbiBhbnkg
Y2FzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5j
b20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdUBrZXJuZWwub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
