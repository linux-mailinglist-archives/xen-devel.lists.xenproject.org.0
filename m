Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360C712F92D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 15:27:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inNsN-0003Ep-HB; Fri, 03 Jan 2020 14:24:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inNsL-0003E5-Nk
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 14:24:29 +0000
X-Inumbo-ID: bb8aea08-2e34-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb8aea08-2e34-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 14:24:21 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z7so42511234wrl.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 06:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0V3JhRs4n9wAikt4VOUumjii0NOcmYXvUT4e1iN5MC0=;
 b=XgvvSZYqJne1VbK3OBjYZRCsHTcxRNNAzAQCYbiXRrqMYRHPut2aoDTc7EyKlJ9ACX
 t6pd6S1bfcLOehxa1+TYNHDloRpr9nN7f9MNP2yoYB4677j1iUbvhomaNhvj4zyMUk7x
 j6g+5K14ci7V7rwK0ukhAN5IadGinCOKoSPtMFhuwAluzJ13ZAH2ddryTaJktbeIDNa3
 6baKsO/iJXZQcI3mhs+kVRyzYsYGLTxt0K7scskaTPbS3iCZDoAcfMEjYG1IwQEyn9s7
 5Y2z+ioHm4BLRRMUx4/tZOjQ69vfkWNGEjzsRqEBHI5c+2FeBpkqOhXCQ82ngY3ACnfi
 7JCg==
X-Gm-Message-State: APjAAAUrAZqmYqxBcdqwqjZ/s4NnAT9qmrTqXibkjvCuaHgLWF/AHWBd
 j9v255un0REKfNZfeKO0UhSinZqwy4W+hg==
X-Google-Smtp-Source: APXvYqxJA60LSkRwCiWTPauvlP/RsZsE/VPokmqlUCf/cQvAXhAYjXNw/AceJZDVnnw+T4Qp5NI7Sg==
X-Received: by 2002:adf:f491:: with SMTP id l17mr86974672wro.149.1578061460517; 
 Fri, 03 Jan 2020 06:24:20 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z124sm12855174wmc.20.2020.01.03.06.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 06:24:19 -0800 (PST)
Date: Fri, 3 Jan 2020 14:24:18 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200103142418.5nprxpgzajn4y3bp@debian>
References: <20191219144217.305851-1-anthony.perard@citrix.com>
 <20191219144217.305851-2-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219144217.305851-2-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH 1/2] tools: Allow to make
 *-dir-force-update without ./configure
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
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMDI6NDI6MTZQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhpcyBhbHNvIGFsbG93cyB0byBydW4gYG1ha2Ugc3JjLXRhcmJhbGxgIHdpdGhv
dXQgZmlyc3QgaGF2aW5nIHRvIHJ1bgo+IGAuL2NvbmZpZ3VyZWAuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpBY2tlZC1ieTog
V2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
