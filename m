Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCC68D0D9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 12:40:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxqeV-0007Hh-4s; Wed, 14 Aug 2019 10:37:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qws=WK=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hxqeT-0007Hb-Ew
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 10:37:09 +0000
X-Inumbo-ID: 7756f914-be7f-11e9-898d-b770b37252c1
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7756f914-be7f-11e9-898d-b770b37252c1;
 Wed, 14 Aug 2019 10:37:08 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v15so4145101wml.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2019 03:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qDR0PdJRS0OGbpXXpILg0gHuUvCcXME3SNXWvWcgsCI=;
 b=DCFoIfyA/2D9GdcqkczO7iv5yB/QJObjPiLWsyMNJyJXx7t4MQA3jfczYR3By/aCGn
 /N4YyXGb/33DANYvuxkTdnHRyGVyKTYyud3FV5JwscFt+7W/TbfWpO73Pfr5d5lcXxIY
 9ttSkwtDKo3ASfgrthh5gsuDnIVpCNcoOKaVBB1ylcygmAZiUWCaboKjWDvlu6Y3kGaA
 Ijzpo/czC40kHIHGJz3x65lcubwQWTt8MkWNR2sJFjznxFlpSLqNCvsmlij3BVfOZ/yL
 /6M1wUFIBphqG0WDyYU7rw9OSEzjVVfjk2SOTia3Md5DqlC+yOR3yv30BNWJJck62W5r
 l20g==
X-Gm-Message-State: APjAAAVnC4rsnp+CvTy4hwmILnHcIH+kE3ZucvOAGglwQsl2PMJO0yyN
 i+9et6SSqv9hJ44hohBQGe0=
X-Google-Smtp-Source: APXvYqzfgtG8N6m9AUvd+bD5WoNNRpzt0qOB5jeOQD0HOW9MeBmwHXzGJUh0zcx29pRrtg/ISljX0g==
X-Received: by 2002:a1c:1f4e:: with SMTP id f75mr7564829wmf.137.1565779028052; 
 Wed, 14 Aug 2019 03:37:08 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id s64sm8139229wmf.16.2019.08.14.03.37.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 03:37:07 -0700 (PDT)
Date: Wed, 14 Aug 2019 10:37:05 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190814103705.pwvw4bm53marmhiz@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190813120117.22528-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813120117.22528-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/tss: Fix clang build following c/s
 7888440625
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDE6MDE6MTdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBDbGFuZy0zLjUgZnJvbSBEZWJpYW4gSmVzc2llIGZhaWxzIHdpdGg6Cj4gCj4gICBz
bXBib290LmM6ODI5OjI5OiBlcnJvcjogc3RhdGVtZW50IGV4cHJlc3Npb24gbm90IGFsbG93ZWQg
YXQgZmlsZSBzY29wZQo+ICAgICAgICAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKHRoaXNfY3B1KHRz
c19wYWdlKSkgIT0gUEFHRV9TSVpFKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
Cj4gICAvbG9jYWwveGVuLmdpdC94ZW4vaW5jbHVkZS9hc20vcGVyY3B1Lmg6MTQ6Nzogbm90ZTog
ZXhwYW5kZWQgZnJvbSBtYWNybwo+ICAgICAgICAgICAndGhpc19jcHUnCj4gICAgICAgKCpSRUxP
Q19ISURFKCZwZXJfY3B1X18jI3ZhciwgZ2V0X2NwdV9pbmZvKCktPnBlcl9jcHVfb2Zmc2V0KSkK
PiAgICAgICAgIF4KPiAgIC9sb2NhbC94ZW4uZ2l0L3hlbi9pbmNsdWRlL3hlbi9jb21waWxlci5o
Ojk4OjM6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8KPiAgICAgICAgICAgJ1JFTE9DX0hJREUn
Cj4gICAgICh7IHVuc2lnbmVkIGxvbmcgX19wdHI7ICAgICAgICAgICAgICAgICAgICAgICBcCj4g
ICAgIF4KPiAgIC9sb2NhbC94ZW4uZ2l0L3hlbi9pbmNsdWRlL3hlbi9saWIuaDoyNjo1Mzogbm90
ZTogZXhwYW5kZWQgZnJvbSBtYWNybwo+ICAgICAgICAgICAnQlVJTERfQlVHX09OJwo+ICAgI2Rl
ZmluZSBCVUlMRF9CVUdfT04oY29uZCkgKCh2b2lkKUJVSUxEX0JVR19PTl9aRVJPKGNvbmQpKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4K
PiAgIC9sb2NhbC94ZW4uZ2l0L3hlbi9pbmNsdWRlL3hlbi9saWIuaDoyNTo1Nzogbm90ZTogZXhw
YW5kZWQgZnJvbSBtYWNybwo+ICAgICAgICAgICAnQlVJTERfQlVHX09OX1pFUk8nCj4gICAjZGVm
aW5lIEJVSUxEX0JVR19PTl9aRVJPKGNvbmQpIHNpemVvZihzdHJ1Y3QgeyBpbnQ6LSEhKGNvbmQp
OyB9KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeCj4gICAxIGVycm9yIGdlbmVyYXRlZC4KPiAgIC9sb2NhbC94ZW4uZ2l0L3hlbi9S
dWxlcy5tazoyMDI6IHJlY2lwZSBmb3IgdGFyZ2V0ICdzbXBib290Lm8nIGZhaWxlZAo+IAo+IFRo
aXMgaXMgb2J2aW91c2x5IGEgY29tcGlsZXIgYnVnIGJlY2F1c2UgdGhlIEJVSUxEX0JVR19PTigp
IGlzIG5vdCBhdCBmaWxlCj4gc2NvcGUuICBIb3dldmVyLCBpdCBjYW4gYmUgd29ya2VkIGFyb3Vu
ZCBieSB1c2luZyBhIGxvY2FsIHZhcmlhYmxlLgo+IAo+IFNwb3R0ZWQgYnkgR2l0bGFiIENJLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
