Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E52688A4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:40:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHky8-0000yO-Vh; Mon, 14 Sep 2020 09:40:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hQe=CX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kHky7-0000yC-OS
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:40:15 +0000
X-Inumbo-ID: 2a818889-ed56-4390-a459-73d0404fd811
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a818889-ed56-4390-a459-73d0404fd811;
 Mon, 14 Sep 2020 09:40:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a9so10546017wmm.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 02:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=JOVHVpj8HDdhDjRGNrwDZ5dHwxl8UCHWeqvrXY0nuGc=;
 b=SFx3OEVwBlrhvS7dpmQpf8tOVlvYGTJ9jhAGnIzkrJ/dNwG0GDpUSB+5GaEFOcatWy
 v5lkalRONFUzX+rCpuxDKbFAiHRgssGt/n9uVc2KsInuNrRBBFx0MRZiPm8RoOfFmC/I
 /OodLLokz2siAd8wy/ykKV6Yyp2cmT61K8T4htvQ/XmsK+IauAPinub9sT1yQ2E7DXCT
 vCtey+65+eGiBbvUG+oWBDxjEwGjdVCAcSD61yfVae9yix4Lx8WwNXqY3LFPg1gvCk1s
 79Z15JsM/Gjr9F2X31mvlvLzreO8h//4NhcqnmPpLDpumQLWXe5B1QZns2WLs1OfkNp4
 PjsQ==
X-Gm-Message-State: AOAM530w85n/Sidkey9sgITFdJ33RW6YbQMAsANjXSfkElZD7XIt12eO
 2ypZXshV5LqB6EqH+FcK6jM=
X-Google-Smtp-Source: ABdhPJzsMPrJFM6k3mKfJhqRDEMak6cksWzUcq8D56KzHe1kLX2CgPkVHxk1bi2q7G7FBlcn+3Dtdg==
X-Received: by 2002:a1c:2e17:: with SMTP id u23mr14896164wmu.73.1600076403842; 
 Mon, 14 Sep 2020 02:40:03 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q186sm19593242wma.45.2020.09.14.02.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 02:40:03 -0700 (PDT)
Date: Mon, 14 Sep 2020 09:40:01 +0000
From: Wei Liu <wl@xen.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] tools/build: fix python xc bindings
Message-ID: <20200914094001.r37bp3b7m2uqjgf5@liuwe-devbox-debian-v2>
References: <20200912135807.28293-1-jgross@suse.com>
 <20200914093541.nfs3ajzuh4hqu5lq@liuwe-devbox-debian-v2>
 <20200914093819.GF1482@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914093819.GF1482@mail-itl>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 14, 2020 at 11:38:19AM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, Sep 14, 2020 at 09:35:42AM +0000, Wei Liu wrote:
> > On Sat, Sep 12, 2020 at 03:58:07PM +0200, Juergen Gross wrote:
> > > Commit 7c273ffdd0e91 ("tools/python: drop libxenguest from setup.py")
> > > was just wrong: there is one function from libxenguest used in the
> > > bindings, so readd the library again.
> > > 
> > > While at it remove the unused PATH_LIBXL setting.
> > > 
> > > Fixes: 7c273ffdd0e91 ("tools/python: drop libxenguest from setup.py")
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > 
> > Acked-by: Wei Liu <wl@xen.org>
> 
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 

Thanks for the quick turnaround, Marek.

