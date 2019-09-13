Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B9DB2368
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 17:32:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8nV4-00017B-OJ; Fri, 13 Sep 2019 15:28:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0APj=XI=kernel.org=wei.liu@srs-us1.protection.inumbo.net>)
 id 1i8nV3-000176-Dx
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 15:28:41 +0000
X-Inumbo-ID: 29d1a058-d63b-11e9-95ae-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29d1a058-d63b-11e9-95ae-12813bfff9fa;
 Fri, 13 Sep 2019 15:28:40 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E67F208C2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2019 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568388520;
 bh=y6gVoSPeyEbRyda+ibEtbvEXeVxaYpe+xbTa7TiEgYI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bw3x0H7Na1yXZ3aRDDjTO6mTByF+b2Zsv4Iv0tBrc9o8Yq/7GAJtgmF1g7yKYmGfn
 WS+QZu5v54hdPMmHhDXqsR0Ly1dxNYyzGzBxIWNufJnylsJPFsS3mQwvdSWvlciLsM
 k5niJI0Vk5LwENzlNFpKFW9KPsxPCg17CgQB7li8=
Received: by mail-qt1-f170.google.com with SMTP id j1so21648308qth.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2019 08:28:40 -0700 (PDT)
X-Gm-Message-State: APjAAAUp6tdd842y0hWpwT+tFABFqFP28/orSg1wgKfHvFCNa2dOpDme
 vWcLx47jaP8djbcCEkalrbGQ26CiYxz1pcOj/iQ=
X-Google-Smtp-Source: APXvYqzZ2LKKLGm7/ohlbW6kF0/Ipz0GRfejg+oJV/YyJWQRZJqu6mgLfaijOoxXd8Fu4NUtRyMX4buHios8TmQvWdE=
X-Received: by 2002:a0c:9082:: with SMTP id p2mr5914578qvp.197.1568388519162; 
 Fri, 13 Sep 2019 08:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190913124727.3277-1-paul.durrant@citrix.com>
In-Reply-To: <20190913124727.3277-1-paul.durrant@citrix.com>
From: Wei Liu <wei.liu@kernel.org>
Date: Fri, 13 Sep 2019 16:28:34 +0100
X-Gmail-Original-Message-ID: <CAHd7Wqw6bQbzR2gvzGM+bBgVQ8HHQPCBJppSWWqHT7S7Dp27qg@mail.gmail.com>
Message-ID: <CAHd7Wqw6bQbzR2gvzGM+bBgVQ8HHQPCBJppSWWqHT7S7Dp27qg@mail.gmail.com>
To: Paul Durrant <paul.durrant@citrix.com>
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
Cc: netdev@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxMyBTZXAgMjAxOSBhdCAxMzo0NywgUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBNeSBDaXRyaXggZW1haWwgYWRkcmVzcyB3aWxsIGV4cGly
ZSBzaG9ydGx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
