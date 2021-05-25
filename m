Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59260390631
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 18:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132274.246787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llZZ8-0001H4-UE; Tue, 25 May 2021 16:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132274.246787; Tue, 25 May 2021 16:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llZZ8-0001EX-Qj; Tue, 25 May 2021 16:05:58 +0000
Received: by outflank-mailman (input) for mailman id 132274;
 Tue, 25 May 2021 16:05:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+lfR=KU=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1llZZ6-0001ER-P0
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 16:05:57 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad65a4c6-14b2-4ab5-8fc6-5de64259b205;
 Tue, 25 May 2021 16:05:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z17so32818687wrq.7
 for <xen-devel@lists.xenproject.org>; Tue, 25 May 2021 09:05:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h15sm11169638wmq.1.2021.05.25.09.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 09:05:52 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ad65a4c6-14b2-4ab5-8fc6-5de64259b205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=f7DBrUo3wL4Qpwwbs5pU+Y2UR7h2QKSlSLVfoQUFNMI=;
        b=B3DENF8eoHhecWAFNQVLS2JEamnemU33gyvaAri/jUlxzebGZ65BPV0vBbEDgtL0i2
         ktvkA4hfm35xWOsU0Qpu7M/Khpm+8vhn3XskgiCo4rDbB3tRmN4WHjCEACwUXqYx4FeY
         Jtta5hNrcC+yqioS0IajWgJ26ctB5Cv70tzOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=f7DBrUo3wL4Qpwwbs5pU+Y2UR7h2QKSlSLVfoQUFNMI=;
        b=mR6TH5hXQ75ahc9/8AnjIFdk2lr/XNKDVuwClGvcE0rOjMilqAMm4sG92STPxRTbh5
         kN7Fg7H3tGkAmgawySR7b9vQGqOX+vc86P7TrOevdtVMyQDt6HPkgVBuJPvAZs97porf
         pMY6KhfotRQmR48Yne+ElsXx9Zx8lVgl8gLiE7ESFxfAylSqV2MLNzaAiE6pU7TMKU7S
         c1pD7/lgMWpOG4n86r5o3BVa8IekRnkWOk3dCbVqhJrd0vHu/eK7EtNV1LBO5DNsN6if
         /SYO7NK1mwsQc2048YMYiDY3ls/syjzWSamrYOOA1q1B40cR4Dd27dFfGoK5bEJeIW+2
         TSEQ==
X-Gm-Message-State: AOAM531MJ70EbVxiLSUNxz2zfIvv1nclUoTlh3M6J8HxETNIdR3098rp
	txPpnQoYY50gQ1Ap4ac2++7uxg==
X-Google-Smtp-Source: ABdhPJzmCQM+KdUAXONpPffkFRK0K5WklaT15aqWUiMtaXWooOfXUGpF52ocgwjNDKESzlRppx+OrQ==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr28170569wru.90.1621958753771;
        Tue, 25 May 2021 09:05:53 -0700 (PDT)
Date: Tue, 25 May 2021 18:05:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emma Anholt <emma@anholt.net>, David Lechner <david@lechnology.com>,
	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb
 is the default
Message-ID: <YK0gXjANguasJLu5@phenom.ffwll.local>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
 <0b2b3fd7-7740-4c4e-78a5-142a6e9892ea@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b2b3fd7-7740-4c4e-78a5-142a6e9892ea@tronnes.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 

On Fri, May 21, 2021 at 04:09:13PM +0200, Noralf Trønnes wrote:
> 
> 
> Den 21.05.2021 11.09, skrev Daniel Vetter:
> > Goes through all the drivers and deletes the default hook since it's
> > the default now.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Acked-by: Noralf Trønnes <noralf@tronnes.org>

Can you perhaps also look at the prep patch right before this one?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

