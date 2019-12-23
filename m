Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273C1129593
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 12:39:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijM0F-0004uK-Fq; Mon, 23 Dec 2019 11:35:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mcnY=2N=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1ijM0D-0004uF-EI
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 11:35:57 +0000
X-Inumbo-ID: 5d8ad1ee-2578-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d8ad1ee-2578-11ea-88e7-bc764e2007e4;
 Mon, 23 Dec 2019 11:35:48 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y11so16273524wrt.6
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 03:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HLf7UDzjHO46QZ+r4g/DQtLvnK9ZgG13FP1Rb0ijduQ=;
 b=hByPU2rDE3cv8YI3tMVIfddMIUIXd7mJH6aaYOSYTxI3Zhnpus9YTDIlbVBNRARQSK
 bo1P4dmWr0rZLxbSu645NmSYYzN23AcbhPDAkrFvUR69ThrsDk2PkcW86rwcvzcRMDN9
 vVk5/1kC7WXJ9dEVTgG2jk7sgHIC8UnuuAZXRYUafNo5MTx6wHDxvB7f8OIqlBhH2mJA
 1FunSj1omu+kCLV8SCYkiKxIULY7ipTe3j0Hxr3tZpW5WslZZz8gQYPhDJaIkPVlkXXc
 Vp15ZYX8cpJyt4NL9XuihdAMdmqxAXmUxqmiOvVemxe6awjhSX0dydz7cyt/ujCCvNSS
 jleg==
X-Gm-Message-State: APjAAAX9gxvszcC3h8MXsD2HQM7hoDz3en4PR355xpmToLC060y0+zLA
 7/lNg1le9iqD8a0+5t52eho=
X-Google-Smtp-Source: APXvYqz93/AcG8Tzkn6CEiCbg3U9AEeAW5KZcv3jLL8eB1/yo9AokuwM9YpW25WmFlKY/8HxY5MEzA==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr31296335wrr.74.1577100948094; 
 Mon, 23 Dec 2019 03:35:48 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id c15sm20231097wrt.1.2019.12.23.03.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 03:35:47 -0800 (PST)
Date: Mon, 23 Dec 2019 11:35:45 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191223113545.nwugg7lsorttunuu@debian>
References: <20191223095923.2458-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191223095923.2458-1-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH net-next] xen-netback: support dynamic
 unbind/bind
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

T24gTW9uLCBEZWMgMjMsIDIwMTkgYXQgMDk6NTk6MjNBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgpbLi4uXSAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJm
YWNlLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwo+IGluZGV4IGYxNWJh
M2RlNjE5NS4uMGM4YTAyYTFlYWQ3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRi
YWNrL2ludGVyZmFjZS5jCj4gKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNl
LmMKPiBAQCAtNTg1LDYgKzU4NSw3IEBAIGludCB4ZW52aWZfY29ubmVjdF9jdHJsKHN0cnVjdCB4
ZW52aWYgKnZpZiwgZ3JhbnRfcmVmX3QgcmluZ19yZWYsCj4gIAlzdHJ1Y3QgbmV0X2RldmljZSAq
ZGV2ID0gdmlmLT5kZXY7Cj4gIAl2b2lkICphZGRyOwo+ICAJc3RydWN0IHhlbl9uZXRpZl9jdHJs
X3NyaW5nICpzaGFyZWQ7Cj4gKwlSSU5HX0lEWCByc3BfcHJvZCwgcmVxX3Byb2Q7Cj4gIAlpbnQg
ZXJyOwo+ICAKPiAgCWVyciA9IHhlbmJ1c19tYXBfcmluZ192YWxsb2MoeGVudmlmX3RvX3hlbmJ1
c19kZXZpY2UodmlmKSwKPiBAQCAtNTkzLDcgKzU5NCwxNCBAQCBpbnQgeGVudmlmX2Nvbm5lY3Rf
Y3RybChzdHJ1Y3QgeGVudmlmICp2aWYsIGdyYW50X3JlZl90IHJpbmdfcmVmLAo+ICAJCWdvdG8g
ZXJyOwo+ICAKPiAgCXNoYXJlZCA9IChzdHJ1Y3QgeGVuX25ldGlmX2N0cmxfc3JpbmcgKilhZGRy
Owo+IC0JQkFDS19SSU5HX0lOSVQoJnZpZi0+Y3RybCwgc2hhcmVkLCBYRU5fUEFHRV9TSVpFKTsK
PiArCXJzcF9wcm9kID0gUkVBRF9PTkNFKHNoYXJlZC0+cnNwX3Byb2QpOwo+ICsJcmVxX3Byb2Qg
PSBSRUFEX09OQ0Uoc2hhcmVkLT5yZXFfcHJvZCk7Cj4gKwo+ICsJQkFDS19SSU5HX0FUVEFDSCgm
dmlmLT5jdHJsLCBzaGFyZWQsIHJzcF9wcm9kLCBYRU5fUEFHRV9TSVpFKTsKPiArCj4gKwllcnIg
PSAtRUlPOwo+ICsJaWYgKHJlcV9wcm9kIC0gcnNwX3Byb2QgPiBSSU5HX1NJWkUoJnZpZi0+Y3Ry
bCkpCj4gKwkJZ290byBlcnJfdW5tYXA7CgpJIHRoaW5rIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8g
YXR0YWNoIHRoZSByaW5nIGFmdGVyIHRoaXMgY2hlY2sgaGFzIGJlZW4KZG9uZSwgYnV0IEkgY2Fu
IHNlZSB5b3Ugd2FudCB0byBzdHJ1Y3R1cmUgY29kZSBsaWtlIHRoaXMgdG8gcmV1c2UgdGhlCnVu
bWFwIGVycm9yIHBhdGguCgpTbzoKClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1QGtlcm5l
bC5vcmc+CgpOaWNlIHdvcmsgYnR3LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
