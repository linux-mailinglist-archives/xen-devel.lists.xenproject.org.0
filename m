Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38876BF552
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:56:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDV9h-0003af-1U; Thu, 26 Sep 2019 14:54:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDV9f-0003aY-Ra
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:54:03 +0000
X-Inumbo-ID: 7adbe1d4-e06d-11e9-bf31-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by localhost (Halon) with ESMTPS
 id 7adbe1d4-e06d-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 14:54:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h7so2840623wrw.8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 07:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d9cQgfYQunicgBNba8Et+vWo/CsFktBs4FrK2ImiYp0=;
 b=cbfOgQ6nh2pv+cTjW3hffQkfcjDje2+7jCxvAn7O9ByoEbUe9c/PQZrEsH3ApBqLvn
 YL+YLuV2E2XPuMZ0+r+9Edp2fo01DBSE1MTSlygWNE+/KmK8kvEyGLPf/4skh1P7mITJ
 ndKUhLKYIahTGpk5XcZp1KXSicWiScIzKlIJZaZgFmR+mHRkMs1QqfbIs733nJv23w+j
 8Qf+3/SGyB3WyMJWcVl8Lbl/SCpsXtjhNfZV0/xKKhdAdNDPdL7WnzSY0ZBsUJG/lqDH
 rJ8q9q6ZDu+7/ZxWgc2UVSidXFuwjXnT24JOdqXF4edQ1eGsyWP5yu4zChnS8oUcUsDW
 Tr+A==
X-Gm-Message-State: APjAAAWEGDzt3srU7yMPKGqAxYFW7nzjz6pL7mjU4orKpEkByb79hHdz
 zEsyOW8ndlShqVZHnufUDjk=
X-Google-Smtp-Source: APXvYqytH+w1Ypx2Rm0W8j8ty5kvdJ+fUT6iiUGhw13LI7WFianCh6aH5cRsCDoZDT1eMcAYvG6tHA==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr3231462wrt.28.1569509642604;
 Thu, 26 Sep 2019 07:54:02 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id z125sm5255829wme.37.2019.09.26.07.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 07:54:02 -0700 (PDT)
Date: Thu, 26 Sep 2019 15:54:00 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926145400.7y2sptr2rs6ytuzo@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <efa85559fd4972ae664b36683cd9ece6950f2aa1.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efa85559fd4972ae664b36683cd9ece6950f2aa1.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 78/84] Revert "x86/smpboot: use xenheap
 pages for rpts in smpboot."
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6NDFBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
V2UgaGF2ZSBwcm9wZXJseSBoYW5kbGVkICh1biltYXBwaW5nIG9mIHBhZ2VzIGluIHJlc3RvcmVf
YWxsX2d1ZXN0cy4KPiBUaGlzIGhhY2sgaXMgbm8gbG9uZ2VyIHJlcXVpcmVkLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+CgpJZiB5b3UgcmVhcnJh
bmdlIHRoaXMgc2VyaWVzICBhIGJpdCB5b3UgZG9uJ3QgbmVlZCB0aGlzIGFuZCB0aGUgcGF0Y2gg
aXQKcmV2ZXJ0cyBpbiB0aGUgZmlyc3QgcGxhY2UsIEkgdGhpbmsuCgpXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
