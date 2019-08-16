Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A2A901F4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:49:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybeF-00047R-D8; Fri, 16 Aug 2019 12:48:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5V6G=WM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hybeC-00046y-Qc
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 12:48:00 +0000
X-Inumbo-ID: 1400df0a-c024-11e9-aee9-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1400df0a-c024-11e9-aee9-bc764e2007e4;
 Fri, 16 Aug 2019 12:48:00 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p77so3124108wme.0
 for <xen-devel@lists.xen.org>; Fri, 16 Aug 2019 05:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JCzh3JyOyDDlOjM0vEoH4YhuUoQz7xLwWCYQ3Ocp1lA=;
 b=XTRA3nOGVr+wxXfpkD6Flx0luX5/Vp3XEAOtdpEnrD0ztfIjVno3I8zxKLVEE3Pfpj
 wq0gfvFvUtfSLMrwZAaTbXd9uxLzBfGwiaEnPcpr0AstjfjBbDqoqXOeT+uTxXFks7VK
 vxiL6Gmw5lj/56dVRFKoV9IZnpl1qCsZOEF7suam76MFvPLhJt1sO2/MJcYDhHrr2kvP
 ybYACTyXCuNX7HeA4Q+XOYkM/dCDMwcHzYHG7yxEzurlVSA+95iTDyJuXhHJiBANpVqZ
 nGzVGQyT7mCC7wEpS6j8f9gBe1uA4FHZ+BZ43vJPiZrgRoVp63CwS3qlhjgdbHCMHTge
 Ysfg==
X-Gm-Message-State: APjAAAVzmCbgkNuXuEHPzxEOusuc5DVrlYhojerxSWr9dSycl4qvuaqb
 d4qQ70iXCRJF6TAaVlrs2pM=
X-Google-Smtp-Source: APXvYqzwblo0PO0RZD+GQGWZn01fzDXxkLePsWn/m0NX3eaugXQs1++SUtcPeFW9GpI689QluF6uZg==
X-Received: by 2002:a1c:be19:: with SMTP id o25mr7022067wmf.54.1565959679580; 
 Fri, 16 Aug 2019 05:47:59 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id n9sm8779247wrp.54.2019.08.16.05.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:47:59 -0700 (PDT)
Date: Fri, 16 Aug 2019 12:47:57 +0000
From: Wei Liu <wl@xen.org>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190816124757.fkhtymt2grnaobcp@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190416125832.32881-3-wipawel@amazon.de>
 <20190815094400.126289-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815094400.126289-1-wipawel@amazon.de>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [livepatch: independ. modules 3/3] python: Add XC
 binding for Xen build ID
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, mpohlack@amazon.de,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDk6NDQ6MDBBTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogd3JvdGU6Cj4gRXh0ZW5kIHRoZSBsaXN0IG9mIHhjKCkgb2JqZWN0IG1ldGhvZHMgd2l0
aCBhZGRpdGlvbmFsIG9uZSB0byBkaXNwbGF5Cj4gWGVuJ3MgYnVpbGRpZC4gVGhlIGltcGxlbWVu
dGF0aW9uIGZvbGxvd3MgdGhlIGxpYnhsIGltcGxlbWVudGF0aW9uCj4gKGUuZy4gbWF4IGJ1aWxk
aWQgc2l6ZSBhc3N1bXB0aW9uIGJlaW5nIFhDX1BBR0VfU0laRSkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5
OiBNYXJ0aW4gTWF6ZWluIDxhbWF6ZWluQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogQW5kcmEt
SXJpbmEgUGFyYXNjaGl2IDxhbmRyYXByc0BhbWF6b24uY29tPgo+IFJldmlld2VkLWJ5OiBOb3Ji
ZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KCkknbSBhIGJpdCBjb25mdXNlZCBieSB0
aGUgdGFnIGluIHRoZSBzdWJqZWN0IGxpbmUuIFdoaWNoIHNlcmllcyBkb2VzCnRoaXMgcGF0Y2gg
YmVsb25nIHRvPwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
