Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113372282E8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 16:57:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxthn-0006Kf-5R; Tue, 21 Jul 2020 14:57:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxthl-0006Ka-M8
 for xen-devel@lists.xen.org; Tue, 21 Jul 2020 14:57:17 +0000
X-Inumbo-ID: 773fe0e5-cb62-11ea-854e-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 773fe0e5-cb62-11ea-854e-bc764e2007e4;
 Tue, 21 Jul 2020 14:57:16 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f18so3189247wml.3
 for <xen-devel@lists.xen.org>; Tue, 21 Jul 2020 07:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LOlGQAylj/bktB5kZkda1IhNG5IUhgBwPGrWWAm6nI0=;
 b=fx78ZDlihtvtUHjiURg7h+i8yxMJ2ozp1t84UnA+oIQ123lbxIMG4d1141qOvrwu6C
 FaLvxpn4diG42+6mg6Ujuzs5XGNbLJfjF/5KK6qVAVPa2CSYBNKh7F40nvEDr95Bn7dA
 SQptRKrW4Q4xnXKmXk0kqAZxKlogBvEiitSMnlQcPwbngPrCqcTWuQWhPZbKbZiVU3jr
 MB6Oaaaek7C65dVM6E3eHpgWnvmG76cYSNA1JBcHmeM1ZnI+7bLd9cuNIxYCHWbej2hi
 E2C2xZEU4vb6TBbvGma20Gi6lHPKfC9PJQkI7/4e/7Ognxt4vUf+3fm5RTD4+o7wEQBi
 k3sA==
X-Gm-Message-State: AOAM530fi8TfBYEbOyuPLxczmMk4G9GMYRYELODwb2iYUxFlnMK7CCmB
 A5cvp2wiZQvJenjoW/ku5ZY=
X-Google-Smtp-Source: ABdhPJxzgjx8qg9R+/Yi7q0fFZYZgSloya9pLO9rbJ3vN91ZpoodgTA6OS3qd8Zx7juC04TOJw+YyQ==
X-Received: by 2002:a1c:bcd4:: with SMTP id m203mr4377232wmf.124.1595343435808; 
 Tue, 21 Jul 2020 07:57:15 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id x13sm2248179wro.64.2020.07.21.07.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 07:57:15 -0700 (PDT)
Date: Tue, 21 Jul 2020 14:57:14 +0000
From: Wei Liu <wl@xen.org>
To: Elliott Mitchell <ehem+xen@m5p.com>
Subject: Re: [PATCH 1/2] Partially revert "Cross-compilation fixes."
Message-ID: <20200721145714.bkvhu4meuhrwqcnj@liuwe-devbox-debian-v2>
References: <20200718033121.GA88869@mattapan.m5p.com>
 <20200721122645.qcens4lqq5vcnmz4@liuwe-devbox-debian-v2>
 <20200721144410.GA23640@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721144410.GA23640@mattapan.m5p.com>
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
Cc: dave@recoil.org, ian.jackson@eu.citrix.com, christian.lindig@citrix.com,
 Wei Liu <wl@xen.org>, xen-devel@lists.xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 21, 2020 at 07:44:10AM -0700, Elliott Mitchell wrote:
> On Tue, Jul 21, 2020 at 12:26:45PM +0000, Wei Liu wrote:
> > On Fri, Jul 17, 2020 at 08:31:21PM -0700, Elliott Mitchell wrote:
> > > This partially reverts commit 16504669c5cbb8b195d20412aadc838da5c428f7.
> > 
> > Ok, so this commit is really old.
> 
> Yup.  It will still be visible in `git blame tools/examples/Makefile`,
> but everywhere else has had commits stacked on top.
> 
> > > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > > ---
> > > Doesn't look like much of 16504669c5cbb8b195d20412aadc838da5c428f7
> > > actually remains due to passage of time.
> > > 
> > > Of the 3, both Python and pygrub appear to mostly be building just fine
> > > cross-compiling.  The OCAML portion is being troublesome, this is going
> > > to cause bug reports elsewhere soon.  The OCAML portion though can
> > > already be disabled by setting OCAML_TOOLS=n and shouldn't have this
> > > extra form of disabling.
> > 
> > The reasoning here is fine by me. And it should be part of the commit
> > message.
> > 
> > I would like to also add "tools: prefix to the subject line:
> > 
> >   tools: Partially revert "Cross-compilation fixes."
> > 
> > If you agree with these changes, no action is required from you. I can
> > handle everything while committing.
> 
> Fine by me.

Your two patches have been applied to staging. Thanks.

Wei.

