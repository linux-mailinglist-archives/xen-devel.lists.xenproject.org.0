Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ACABF536
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:44:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUyJ-00025c-6x; Thu, 26 Sep 2019 14:42:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDUyH-000253-D4
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:42:17 +0000
X-Inumbo-ID: d5c69c12-e06b-11e9-bf31-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by localhost (Halon) with ESMTPS
 id d5c69c12-e06b-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 14:42:16 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so3095858wme.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 07:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JB7+Jxh6BLWQT9E7co2ikbgYRZdx+IspHRzemxNgVRg=;
 b=ot0a0rNFqn/A720LYafXEX/GZhnJkYvsEsvok1y5wCdJsnXEKD2cfHWq91QVrsfm+z
 1KTKmExuKh6TIN0QdPgS0nmtIETVTN6HK64RGs3y1KJRvuf1H2ktdjGnEhRDg9Mb/n6R
 pAJyulZX7YI3oyNtVRrDvx269Q0vR0PCoJicSVXV486oaDMxrohHuqPngFFGxj2vYivw
 xPMz9YmwtjMpUxg2gU+Wvoby8DD0n7Zsht8UCfQk3+JJ597JRisBkqBGn9GSfmpvvitI
 /NNhFonPqj0Hs8nYTD49uOUxqsm0Wnu3NJ70OiSnGMw1+dVAY6RARSc2fzP4tud3Vl5I
 Kjzw==
X-Gm-Message-State: APjAAAV6vfhqgtF4OIHgrnC/6kH466RxENUsccjOa4Ee4rBRhITfxvhw
 NhodafACOfgEuUGbIN8cR6E=
X-Google-Smtp-Source: APXvYqxI4BERvlS/wiEHwfX3i78ZiiEWZPyQlZ27jrLwFKeo4X/WFkd1CSnEM4R5s6dZZ9HM6ksCbA==
X-Received: by 2002:a1c:6607:: with SMTP id a7mr3471482wmc.125.1569508936093; 
 Thu, 26 Sep 2019 07:42:16 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id e3sm3475621wme.39.2019.09.26.07.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 07:42:15 -0700 (PDT)
Date: Thu, 26 Sep 2019 15:42:14 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926144214.i6ff7ub6xlycpei4@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <50268efd2bd6bdf4e1508218e7f1ec9b8776ea72.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50268efd2bd6bdf4e1508218e7f1ec9b8776ea72.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 76/84] x86/setup: also clear the
 permission bits in the dummy 1:1 mapping.
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
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6MzlBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCgpB
c3N1bWluZyB3ZSBlbmQgdXAga2VlcGluZyB0aG9zZSBjYWxscywgdGhpcyBwYXRjaCBzaG91bGQg
YmUgc3F1YXNoZWQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
