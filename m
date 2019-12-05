Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8AF1146FE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 19:38:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icvvO-0007mI-Cf; Thu, 05 Dec 2019 18:32:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4RYm=Z3=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1icvvN-0007mB-Fi
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 18:32:25 +0000
X-Inumbo-ID: 94abb39e-178d-11ea-8235-12813bfff9fa
Received: from mail-lj1-f196.google.com (unknown [209.85.208.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94abb39e-178d-11ea-8235-12813bfff9fa;
 Thu, 05 Dec 2019 18:32:24 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 21so4780739ljr.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2019 10:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bUVxGVGVCp1DD6Uq6ZY6/gJdjQGwYxOM2SALVBkrctQ=;
 b=Yxj3TXxTU9ixmmXcLS7PGUcv21j366g6leD4D+xqofpLwKHvUy7yi14dqouBsWFiNj
 g7AzbwNdUJmj5czaiSDvx8kJKnkJIwy5O96BRp/pEcq/GU8/GlnPRy4h0lkad8bfGkA2
 JG70GK0RxdcAp4hlbdg8K4lygY5MsOgOZM+RqTjFLDe8juHSahFlnADc5D7HxX3PlPB7
 iSDG761uIFdIMIbv/coj4QAhCW28Z8xoaapgqElqduyLW6GuvJWBkmi5X79+to8h83wZ
 58GNFxS8ChB/sUFvEsBahYbQM3+u9EG25mC9Kwzp4Yy0sBhuVnQgTVpmvgrG7OPSa/P3
 ddwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bUVxGVGVCp1DD6Uq6ZY6/gJdjQGwYxOM2SALVBkrctQ=;
 b=QN2xtgbLb0rl4c3LNsHDKkpsCJhISgVtbUZvKkbF+z9AFeROPTCn3VBfd9Gbfj5r8E
 tK12DwhthTXMcUadjEDfnO4LmyvFJiA/QQOlY/XFGH2rm9xketcipgAUC50cAf4NQPST
 i1S0KLSv8G3xmtqgZjln/7FsDqFpKOnpe/hn4eDzWULRJ2B6qxWrknFrlBsij7W7I5Ec
 8L3MFfRIGNyBEdBq8D1UyNu6xHtP5wmB4eFBeiWbdilcOudJ6yL9YlouFN8hIg/7xKRM
 KGmlPkFjlRumzpc6Yn+d+qNSIBDNPYCX+hBud1qXRgZnIrmYheHxY+MyFJdH5w/22gUh
 9SmA==
X-Gm-Message-State: APjAAAWSATGxzSaaw7akpEjO48J3A1++9OMcA4HXZ1+7rEd8n0DHiOOj
 t79TF4Q9aIn+3slbRfjlaeu2tGhY7lEpOnATVAI=
X-Google-Smtp-Source: APXvYqxvTNL1FYZQG9vCArKcqvtCaclgicV8xXSbkJ0ANs42foUg3hxVK9Kmxj+leibbwkb2p7hqHhMZft5iN6jhwLs=
X-Received: by 2002:a2e:8916:: with SMTP id d22mr6474483lji.19.1575570743401; 
 Thu, 05 Dec 2019 10:32:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <472334f58bc435e505ad6bc392426960630fb060.1573840474.git.rosbrookn@ainfosec.com>
 <0ab13f6e-2dcf-ebbb-4d14-ee87c816701d@citrix.com>
 <CAEBZRSe=8vW7qj5fbU7dTpPYTtuR5j1PTbiV0=tYnGvkcahG8w@mail.gmail.com>
 <ffe83eb5-ed94-d594-71f9-bef80377fc09@citrix.com>
In-Reply-To: <ffe83eb5-ed94-d594-71f9-bef80377fc09@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 5 Dec 2019 13:32:12 -0500
Message-ID: <CAEBZRSeDwnC=iMpRfMV4Qvqtqyp+aS=Wn8cgkaE7A8_UNjmpLg@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 15/22] golang/xenlight: begin C to Go
 type marshaling
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBTbyBmaXJzdCBvZiBhbGwsIEkgbm90aWNlZCB0aGF0IHRoZSBtYXJzaGFsbGluZyBjb2RlIGZv
ciBVbmlvbiBzdHJ1Y3RzCj4gZG9lcyB3aGF0IEkgc3VnZ2VzdC4gOi0pCgpZZWFoIEkgcmVhbGl6
ZWQgdGhhdC4gSSBtdXN0IGhhdmUgZmlndXJlZCBvdXQgdGhhdCBteSBwcmV2aW91cyB3YXkKd2Fz
bid0IG5lY2Vzc2FyeSwgYnV0IGZvcmdvdCB0byBnbyBiYWNrIGFuZCBjaGFuZ2UgaXQuCgo+IEkn
bSBub3Qgc3VwZXItc3Ryb25nIG9uIHRoaXMsIHNvIEkgZG9uJ3Qgd2FudCB0byBiaWtlLXNoZWQu
ICBCdXQgSSB0aGluawo+IHRoZSB3YXkgeW91IGdlbmVyYXRlIHRoZSBtYXJzaGFsbGluZyBjb2Rl
IGZvciB0aGUgdW5pb24gc3RydWN0cyBpcyBiZXR0ZXI6Cj4KPiAgICAgICAgIGlmIGVyciA6PSB4
LlBhZS5mcm9tQygmdG1wLnBhZSk7IGVyciAhPSBuaWwgewo+ICAgICAgICAgICAgICAgICByZXR1
cm4gZXJyCj4gICAgICAgICB9CgpJJ2xsIGNoYW5nZSBpdC4gSSdkIHByZWZlciBub3QgdG8gaGF2
ZSB0aG9zZSBpbmNvbnNpc3RlbmNpZXMgaW4gdGhlCmNvZGUgZ2VuZXJhdGlvbi4KClRoYW5rcywK
LU5SCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
