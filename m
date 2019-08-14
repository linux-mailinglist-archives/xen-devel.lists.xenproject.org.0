Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1CE8D2AD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 14:03:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxrxc-00078T-LB; Wed, 14 Aug 2019 12:01:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qws=WK=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hxrxb-00077a-L3
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 12:00:59 +0000
X-Inumbo-ID: 2b5a99ec-be8b-11e9-ab63-6b14ed5b077e
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b5a99ec-be8b-11e9-ab63-6b14ed5b077e;
 Wed, 14 Aug 2019 12:00:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 31so110871540wrm.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2019 05:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ughtkXIaMDNoOwZ3hJU2IPZY0ADFTA4FcAPnKBcMVCY=;
 b=XyL3KRw5YnYHmYbvRlSJXLHff1BJA1kuLPmwILxSluFhAki08cg5Jl1L2pcBQfIAOC
 8CDD0Pc739ujAVbde4KcPsNnX/wUT1ONTgxvkJLUEG7CO+tFheknYXG9tIKHY/5Ikd9j
 RRncC+09oCwuTCyFiKmyjHbr6o4yNaoD/psdKKHy/7EwkmWEYHxPuSCrDSK7+HTbUNEz
 8YvEJ01WvaF8jCXa/s4/3DTXeCfPlBVhffBfuwQpaBbwtjGGBK43dwCT+WcZmCw28+28
 dWFPJ8I2IAJycbN8TdYEVkT3ELSav5QAlpx/TRJxDwspJKq5OM9MQbWrGV6Z9d9dy82Z
 Ni3A==
X-Gm-Message-State: APjAAAV+VBYpw+XYWfEBdqhjoOVDagkISu5tyfvh7/sXj4dYgUkWt1gX
 G221HVf5Qw8F9QtC65dWM7I=
X-Google-Smtp-Source: APXvYqwgWqxRp2vNfxcHMu9HgRwFGXxtgyz7PqzCvi5K1J6hlMhsMofQRj5gsWTCUe4PyZgQ21OJvg==
X-Received: by 2002:adf:cd11:: with SMTP id w17mr25316298wrm.297.1565784054575; 
 Wed, 14 Aug 2019 05:00:54 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id c12sm9006881wrx.46.2019.08.14.05.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 05:00:54 -0700 (PDT)
Date: Wed, 14 Aug 2019 12:00:52 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190814120052.cyimf6ya3eojpyvp@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190814104404.17739-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814104404.17739-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/boot: Annotate pagetables with
 STT_OBJECT
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

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTE6NDQ6MDRBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKWy4uLl0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9jb25maWcuaCBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmgKPiBpbmRleCAyMmRjNzk1ZWVhLi4zNTcwNTQ0
MWZmIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmgKPiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2NvbmZpZy5oCj4gQEAgLTU2LDYgKzU2LDExIEBACj4gICNkZWZp
bmUgR0xPQkFMKG5hbWUpICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAuZ2xvYmwg
bmFtZTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgIG5hbWU6Cj4gKwo+
ICsjZGVmaW5lIEVORERBVEEobmFtZSkgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAg
ICAudHlwZSBuYW1lLCBTVFRfT0JKRUNUOyAgICAgICAgICAgICAgICAgICAgIFwKCklzbid0IHRo
ZSBjb3JyZWN0IHN5bnRheAoKICAgIC50eXBlIG5hbWUgU1RUX09CSkVDVDsKCj8KClRoZSBjb21t
YSBzaG91bGRuJ3QgYmUgdGhlcmUgYWNjb3JkaW5nIHRvIGFzIG1hbnVhbC4KClRoZSByZXN0IGxv
b2tzIGdvb2QuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
