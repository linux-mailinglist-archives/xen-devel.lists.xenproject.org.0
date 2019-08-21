Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DC6977BA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 13:08:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0ORP-00046Y-Lp; Wed, 21 Aug 2019 11:06:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DRqx=WR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i0ORO-00046T-5Q
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 11:06:10 +0000
X-Inumbo-ID: adaefac8-c403-11e9-8980-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adaefac8-c403-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 11:06:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g67so1699637wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2019 04:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=GJjnDvu0yu/w/lN8qgoXtocVJiGjxd6j2gyR46oNMdw=;
 b=YQL1G4HtJ+yPzUA7KLru1b2EK4GHyQWAnuomJtpZ40g5Ca5HaPs20IcglZ7x9cprs3
 mTJADYmB6L0hqzYe8TicE8ys+5Q66I1J/RCyzS2KxdjL7GvlZ9pCg02Gmxeo+whPdJkL
 m0i4fxINnIvTYXaHP3qhxL7kZhRyckSL643fwbcQ39RZ9Iqg0llxBqRZFj3f0YqfrMww
 +wxaN2LKmrtPqiLFyU6ltNIoXiZFJZiEdTyDAKxP9v8bi22JCjZkOSboP3E9VIDp5riX
 EdrOnd1KjHAA6illymyEyWzqspr5g+qXY5HbrvvQf0MVU/FmYHQ10JCbR6RMsFPYrrVC
 P41g==
X-Gm-Message-State: APjAAAWlE5ClF745jyRg8F3ZI9jotsWZ70DypOw4KSEBtIKYnMYnK1bI
 AM9UlELvSqRHb5SWOVGhDag=
X-Google-Smtp-Source: APXvYqyfr0Nj2YjrQ8TvzKLRpLb1Jqz3ppFlWLgs4GrvUK5Jkm/djV+7KclIVE+Kql9x3jXXjm6HJw==
X-Received: by 2002:a05:600c:23d1:: with SMTP id
 p17mr5205514wmb.175.1566385568632; 
 Wed, 21 Aug 2019 04:06:08 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id x20sm47841888wrg.10.2019.08.21.04.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 04:06:07 -0700 (PDT)
Date: Wed, 21 Aug 2019 11:06:06 +0000
From: Wei Liu <wl@xen.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190821110606.damuavyfh4kj6voj@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190820021241.30843-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820021241.30843-1-marmarek@invisiblethingslab.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] python: do not report handled EAGAIN error
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDQ6MTI6NDFBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IG1hdGNoX3dhdGNoX2J5X3Rva2VuKCkgd2hlbiByZXR1cm5z
IGFuIGVycm9yLCBzZXRzIGFsc28gZXhjZXB0aW9uIHdpdGhpbgo+IHB5dGhvbi4gVGhpcyBpcyBn
ZW5lcmFsbHkgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLCBidXQgd2hlbgo+IHhzcHlfcmVhZF93YXRj
aCgpIGhhbmRsZSBFQUdBSU4gZXJyb3IgaW50ZXJuYWxseSwgdGhlIGV4Y2VwdGlvbiBuZWVkcyB0
bwo+IGJlIGNsZWFyZWQuIE90aGVyd2lzZSBpdCB3aWxsIGZhaWwgbGlrZSB0aGlzOgo+IAo+ICAg
ICB4ZW4ubG93bGV2ZWwueHMuRXJyb3I6ICgxMSwgJ1Jlc291cmNlIHRlbXBvcmFyaWx5IHVuYXZh
aWxhYmxlJykKPiAKPiAgICAgVGhlIGFib3ZlIGV4Y2VwdGlvbiB3YXMgdGhlIGRpcmVjdCBjYXVz
ZSBvZiB0aGUgZm9sbG93aW5nIGV4Y2VwdGlvbjoKPiAKPiAgICAgVHJhY2ViYWNrIChtb3N0IHJl
Y2VudCBjYWxsIGxhc3QpOgo+ICAgICAgICguLi4pCj4gICAgICAgICByZXN1bHQgPSBzZWxmLmhh
bmRsZS5yZWFkX3dhdGNoKCkKPiAgICAgU3lzdGVtRXJyb3I6IDxtZXRob2QgJ3JlYWRfd2F0Y2gn
IG9mICd4ZW4ubG93bGV2ZWwueHMueHMnIG9iamVjdHM+IHJldHVybmVkIGEgcmVzdWx0IHdpdGgg
YW4gZXJyb3Igc2V0Cj4gCj4gRml4ZXMgZjZlMTAyMzQxMiAicHl0aG9uOiBFeHRyYWN0IHJlZ2lz
dGVyZWQgd2F0Y2ggc2VhcmNoIGxvZ2ljIGZyb20geHNweV9yZWFkX3dhdGNoKCkiCj4gU2lnbmVk
LW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0
aGluZ3NsYWIuY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
