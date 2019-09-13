Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38405B2366
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 17:31:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8nVi-0001AI-3I; Fri, 13 Sep 2019 15:29:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0APj=XI=kernel.org=wei.liu@srs-us1.protection.inumbo.net>)
 id 1i8nVg-0001AB-8c
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 15:29:20 +0000
X-Inumbo-ID: 410bc050-d63b-11e9-95ae-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 410bc050-d63b-11e9-95ae-12813bfff9fa;
 Fri, 13 Sep 2019 15:29:19 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1281020693
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2019 15:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568388559;
 bh=uU/QWtP+Cn7/ELIT1pAg5+DQ8xTZWPdZYy9cQiqiwlQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=enGvBUt7MYpCCjc1IkeAG5KzfaJ2gitV2P+fzLyt8kvNf88ap1/ggXWYNDGNmHCKb
 6Y98C+qGTb8POodJLJLF1CEY1YtByQFYoYRR7uJpKmM0ueOP0KN3t5+8+eyc5vBKkp
 RO/i1JTXJ5BA8EzfJ2qamBOQ05D2uEsvhLHFab5I=
Received: by mail-qt1-f176.google.com with SMTP id r15so34356891qtn.12
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2019 08:29:19 -0700 (PDT)
X-Gm-Message-State: APjAAAVMxoVXg9E78y606Agg2jEYrPpxw4NtGKLkU5+CWAdc4Z3FQDc5
 ASGvnjUOarevNN3HqKM2BAsv4rnCwe04VW1HcJA=
X-Google-Smtp-Source: APXvYqwGPkNp+87dl1Llp+qnth62NH2mikGIKyxuLczzlnQkguulByWHhuj05E4fYpl+g0mqfhUx6cna/7bP0Ev+M6c=
X-Received: by 2002:a0c:9051:: with SMTP id o75mr31723879qvo.147.1568388558243; 
 Fri, 13 Sep 2019 08:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190913124727.3277-1-paul.durrant@citrix.com>
 <CAHd7Wqw6bQbzR2gvzGM+bBgVQ8HHQPCBJppSWWqHT7S7Dp27qg@mail.gmail.com>
In-Reply-To: <CAHd7Wqw6bQbzR2gvzGM+bBgVQ8HHQPCBJppSWWqHT7S7Dp27qg@mail.gmail.com>
From: Wei Liu <wei.liu@kernel.org>
Date: Fri, 13 Sep 2019 16:29:13 +0100
X-Gmail-Original-Message-ID: <CAHd7Wqw_aoftSS=RQG9v5pDypfBwvZe9zJAPBifggNDTo=xXpw@mail.gmail.com>
Message-ID: <CAHd7Wqw_aoftSS=RQG9v5pDypfBwvZe9zJAPBifggNDTo=xXpw@mail.gmail.com>
To: Wei Liu <wei.liu@kernel.org>
Subject: Re: [Xen-devel] [PATCH net-next] MAINTAINERS: xen-netback: update
 my email address
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
Cc: netdev@vger.kernel.org, Paul Durrant <paul.durrant@citrix.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxMyBTZXAgMjAxOSBhdCAxNjoyOCwgV2VpIExpdSA8d2VpLmxpdUBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIEZyaSwgMTMgU2VwIDIwMTkgYXQgMTM6NDcsIFBhdWwgRHVycmFudCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE15IENpdHJpeCBlbWFpbCBh
ZGRyZXNzIHdpbGwgZXhwaXJlIHNob3J0bHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBE
dXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPgo+IEFja2VkLWJ5OiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgoKT3IgcmF0aGVyOgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXVAa2VybmVs
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
