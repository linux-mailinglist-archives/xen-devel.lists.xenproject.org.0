Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE39B7891
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:37:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuip-00023j-JB; Thu, 19 Sep 2019 11:35:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r/sg=XO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iAuio-00023U-7Q
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:35:38 +0000
X-Inumbo-ID: 996366e7-dad1-11e9-9656-12813bfff9fa
Received: from mail-lf1-f68.google.com (unknown [209.85.167.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 996366e7-dad1-11e9-9656-12813bfff9fa;
 Thu, 19 Sep 2019 11:35:37 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id q11so2077711lfc.11
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 04:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HdFMgTt0o61Y5JRYmdFAg4rmmOYfPf8aL7M7cMaBQAw=;
 b=qAcUJe5TPvanYltETHuoWyaTg43w7YjXV8227aZhZUm12/pe84WFwTudB+BOUG1xWs
 bUKUdYGM5Q7VzxYNOxDbFOA/cdFPqnNa6jfU8a+jGKv8dhp+OaKnSJ5JGv0MV1e8rvha
 bRgAMMx0x2nT258pJB68yzBTiOb4trQ2uWKN2l8ljBughT9wyus/B38XnemndXbZ+wVo
 QdrUoJX0N4Dy+a4pBVSdvsj4iZVA1a08xVzU6ulXP3s4QhoDKAqxMZpm5wN492zdJye0
 zRbbfhNEwCcREb9SBTHLrBXaNDqKVLPaSdeQod6Nb87Fh3Di+rSNz8GyW/zL2mrwb3o7
 Ap1Q==
X-Gm-Message-State: APjAAAVkrHzv93sL77T0leookkb1BfRYxaOYjfDItlw3NJi0rzwFcD7g
 6Fn4tLKeijQHPkueF862hETH5HbfzTg=
X-Google-Smtp-Source: APXvYqyHA4MapiZFSa9d7bGvNgmBIJYDjyCOm8nhxw+CpDR8rcDhu5dG9ieDj7E1FC4gnfoX3I1bnA==
X-Received: by 2002:a19:f111:: with SMTP id p17mr4805860lfh.187.1568892936252; 
 Thu, 19 Sep 2019 04:35:36 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178])
 by smtp.gmail.com with ESMTPSA id r75sm1518337lff.7.2019.09.19.04.35.36
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 04:35:36 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id y23so3207925lje.9
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 04:35:35 -0700 (PDT)
X-Received: by 2002:a2e:9f03:: with SMTP id u3mr5253858ljk.140.1568892935873; 
 Thu, 19 Sep 2019 04:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190919111722.iajioonuzqfharaf@debian>
 <CAK9nU=oUVsbJN28BmJ=aHR5UEBNv4CAxLO8xTUqY+__czX40CA@mail.gmail.com>
 <23939.26199.62169.927294@mariner.uk.xensource.com>
In-Reply-To: <23939.26199.62169.927294@mariner.uk.xensource.com>
From: Wei Liu <wl@xen.org>
Date: Thu, 19 Sep 2019 12:35:20 +0100
X-Gmail-Original-Message-ID: <CAK9nU=pDH4K3fxDN8-qb_wMhYy9H6yb9SvzDdkDDn2+kWHFzMw@mail.gmail.com>
Message-ID: <CAK9nU=pDH4K3fxDN8-qb_wMhYy9H6yb9SvzDdkDDn2+kWHFzMw@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH for-4.13] configure: fix print syntax for
 python 3
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxOSBTZXAgMjAxOSBhdCAxMjoyOCwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNp
dHJpeC5jb20+IHdyb3RlOgoKPiBNeSBwcmV2aW91cyByZXBseSBib3VuY2VkIGR1ZSB0byBoZWFk
ZXIgbWFuZ2xpbmcgaW4geW91ciBmaXJzdCBtYWlsLgo+IExldCBtZSB0cnkgYWdhaW46Cj4KPiBU
aGlzIGlzIGdvb2QgaW4gcHJpbmNpcGxlIGJ1dDoKPgo+IENhbiB5b3UgcHJvdmlkZSBhcyBhIGdp
dCBicmFuY2ggPyAgVGhlbiBJIHdpbGwgZ2V0IHRoZSB1bm1hbmdsZWQKPiB2ZXJzaW9uIGFuZCBi
ZSBhYmxlIHRvIHRyeSBpdCBvdXQuCj4KClNlZSBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWIvP3A9cGVvcGxlL2xpdXcveGVuLmdpdDthPWNvbW1pdGRpZmY7aD04NjRjN2ZiNzE1MDM5OTA2
NzYyYzk2MzhmMDRkZGZkOTdjMWFlNTRiCgo+IElhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
