Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4641F733E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 12:40:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU7yt-0003Ns-98; Mon, 11 Nov 2019 11:35:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bh9Y=ZD=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iU7ys-0003Nn-97
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 11:35:38 +0000
X-Inumbo-ID: 6154dcba-0477-11ea-b678-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6154dcba-0477-11ea-b678-bc764e2007e4;
 Mon, 11 Nov 2019 11:35:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s5so3146463wrw.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2019 03:35:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f6mCYMM7fHu6YWn8mqOZmEZ+0mFnR7Yv4yCdLmISueo=;
 b=Plw0NJ2tWvVE05czGDon7boOxm0xhxRVRi0pXPMmiK9kQPBlUKvkWHqx9Vz1/kSFWI
 i34+3wJyW2LAZ0tjjD7grLEvUpvTE4IE7iVcHXcrBFGrZa/biM8o0nhJiXAXjaHXzxiQ
 pAY6q7kCNpNAo8itDgGCxIOafc2azlSwKsCXLZFxSi+QzzF4OSSSs0qqiRSgViGFRNel
 duqizgrfIwK6UsOtmkby0/Bz92h5fKo4xpKxRwzGv5eiGAEWqnw/fpAuX9GVik3JZyQQ
 s0e5aXAy8v9/skJVuB0lbxmf6ZaPyT+Q8Q9ufnl3r18Fl8fUNxNVkn9DosGwEgtWLPG9
 sMrw==
X-Gm-Message-State: APjAAAXg/Qj5uB9o4OgXnlrZfCWf5+1hJ4jUzRQJufOzpbfDO6McUx9L
 ZxFkscqfuzNBYAsbGXXZf/c=
X-Google-Smtp-Source: APXvYqzRhJX6k7oRnOzLMkKCf3jJP+gZqHgAsEHyA1fyY5DszHA6W9Jy0f0CBKsFcORhXaZZiv8tNA==
X-Received: by 2002:adf:9c81:: with SMTP id d1mr7594234wre.144.1573472136516; 
 Mon, 11 Nov 2019 03:35:36 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id v9sm14131103wrs.95.2019.11.11.03.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 03:35:35 -0800 (PST)
Date: Mon, 11 Nov 2019 11:35:34 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20191111113534.zno2uqsj4sznmlat@debian>
References: <20191108190952.22163-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108190952.22163-1-sstabellini@kernel.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] Introduce a description of a new optional
 tag for Backports
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
Cc: lars.kurth@citrix.com, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jbeulich@suse.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTE6MDk6NTJBTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5z
dGFiZWxsaW5pQHhpbGlueC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
