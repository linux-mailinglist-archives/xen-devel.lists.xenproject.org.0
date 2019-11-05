Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A46AEFC3B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 12:20:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRwqF-0002Dq-NK; Tue, 05 Nov 2019 11:17:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xSMy=Y5=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iRwqE-0002Dl-A8
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 11:17:42 +0000
X-Inumbo-ID: e1aa0c6e-ffbd-11e9-b678-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1aa0c6e-ffbd-11e9-b678-bc764e2007e4;
 Tue, 05 Nov 2019 11:17:41 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a11so20857376wra.6
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2019 03:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=D5xxzmtKgiuJGv1AB5ySypvKe9MUHFKQakTBK8fIgJI=;
 b=kdl/CHfAo0FzR2hWP6g8jPIhC4wSdonGJjXgHIWDW7npdDZs75Sy9JCGakFV8LeFO4
 3dQ4WD56FN9CXrdGTW6RyZnnptLh88umc8LDO5b9nvEi7hwefjYj0dSWWiNz4tUjSxmg
 aq2jBVYvCLaY6b/J8Cky17vXl/ZJJN9/fCszFbWx+SQV7w1BVBs3V+rm9I7XJve/kSEI
 iNGxTjAym21AJ2rhxpQgz3BL5ZWIFuvpmb0Zg2LSyqY2ZWO77Sl79q8NvkHbBKxjGnFl
 4RggJerii/PkfHWRAe3lzTmTYOEroQ9BuQYx7ocngRqW5hhpVaYa9vniS6ecuU5TgF9f
 6K7g==
X-Gm-Message-State: APjAAAVwI5gytRLV1iB5bHoYd2x0kIHR4jSxsYFf94xkx0LLQQ2I25Cu
 gVI2lTAckjzmSp7rmWctbGE=
X-Google-Smtp-Source: APXvYqxWIpvcDFmFnzxNAB/rQKenEb3a/qb/9c9P8hJm2X/ZIfaTTQ2YJuTzteCxu4U0oKq3baOyPQ==
X-Received: by 2002:adf:e8ce:: with SMTP id k14mr14617608wrn.393.1572952660860; 
 Tue, 05 Nov 2019 03:17:40 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id z14sm8892591wrl.60.2019.11.05.03.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 03:17:40 -0800 (PST)
Date: Tue, 5 Nov 2019 11:17:38 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191105111738.wyjig5tqyc3aq3hn@debian>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-9-liuwe@microsoft.com>
 <20191021100038.GG17494@Air-de-Roger>
 <a7ccb379-a0c6-a282-8e03-dc577b4d34ed@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7ccb379-a0c6-a282-8e03-dc577b4d34ed@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next v2 8/9] x86: be more verbose when
 running on a hypervisor
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDM6MjI6MjRQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMTAuMjAxOSAxMjowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgU2VwIDMwLCAyMDE5IGF0IDA0OjAwOjQyUE0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6Cj4g
Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmgKPiA+PiArKysg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAo+ID4+IEBAIC0zNiw2ICsz
Niw3IEBAIGJvb2wgaHlwZXJ2aXNvcl9wcm9iZSh2b2lkKTsKPiA+PiAgdm9pZCBoeXBlcnZpc29y
X3NldHVwKHZvaWQpOwo+ID4+ICB2b2lkIGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCk7Cj4gPj4g
IHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCk7Cj4gPj4gK2NvbnN0IGNoYXIgKmh5cGVydmlz
b3JfbmFtZSh2b2lkKTsKPiA+PiAgCj4gPj4gICNlbHNlCj4gPj4gIAo+ID4+IEBAIC00NSw2ICs0
Niw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBoeXBlcnZpc29yX3Byb2JlKHZvaWQpIHsgcmV0dXJu
IGZhbHNlOyB9Cj4gPj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQp
IHt9Cj4gPj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpIHt9
Cj4gPj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKSB7fQo+ID4+
ICtzdGF0aWMgaW5saW5lIGNoYXIgKmh5cGVydmlzb3JfbmFtZSh2b2lkKSB7IHJldHVybiBOVUxM
OyB9Cj4gPiAKPiA+IEkgdGhpbmsgeW91IHdhbnQgYW4gQVNTRVJUX1VOUkVBQ0hBQkxFIGhlcmUs
IHNpbmNlIGh5cGVydmlzb3JfbmFtZQo+ID4gc2hvdWxkbid0IGJlIGNhbGxlZCB1bmxlc3MgWGVu
IGhhcyBkZXRlY3RlZCB0aGF0J3MgcnVubmluZyBhcyBhIGd1ZXN0LAo+ID4gd2hpY2ggY2FuIG9u
bHkgaGFwcGVuIGlmIENPTkZJR19HVUVTVCBpcyBzZWxlY3RlZC4KPiAKPiBBbmQgcGxlYXNlIGJy
aW5nIHByb3RvdHlwZSBhbmQgc3R1YiBpbiBzeW5jIHJldHVybi10eXBlLXdpc2UuCgpNaXNzZWQg
dGhpcyBjb21tZW50LgoKSSB3aWxsIGhhbmRsZSB0aGlzIGlmIEkgaGF2ZW4ndCBhbHJlYWR5LgoK
V2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
