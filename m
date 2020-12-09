Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EF52D4678
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48474.85743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn26x-0004KO-IM; Wed, 09 Dec 2020 16:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48474.85743; Wed, 09 Dec 2020 16:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn26x-0004Jz-Ek; Wed, 09 Dec 2020 16:14:39 +0000
Received: by outflank-mailman (input) for mailman id 48474;
 Wed, 09 Dec 2020 16:14:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BAt3=FN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kn26v-0004Ju-UU
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:14:37 +0000
Received: from mail-wm1-f43.google.com (unknown [209.85.128.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 124e8341-ec5f-4dc9-a087-ea1204aeca61;
 Wed, 09 Dec 2020 16:14:37 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id q75so2252953wme.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Dec 2020 08:14:36 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w12sm5020797wre.57.2020.12.09.08.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 08:14:35 -0800 (PST)
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
X-Inumbo-ID: 124e8341-ec5f-4dc9-a087-ea1204aeca61
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YGNj/RJq/kpRiFkbtXCcstj9h5lvfO5GHNpbdotNTlM=;
        b=U+Z3oZHBkLeWr/LKdA4q3SPT0arc7T0dLFwL68bEG1NiDULmWijs9+6Np02jga2NBK
         +81XLtK/Bu9lKQmDHI0Ehww7MbbJ4f5iPotF+DqtrG6TMa1pZid+HPIjWEOQA2KQNTLT
         iqrTNkmo4wlauIcZ56reJdCBMb6qw8be/y39pSsYv32s7ZxyM86NNBXX6giKZhBIJH8H
         rQzBprfC/pUlPmoJImS7iDPVfdoXVggdKBca+P70hH9uW4IHk0+L/cPkZ4wtnmR2NGUL
         REqb4DffBVf2wQZ5Unyjsx6XhOt3uL4MOIDCZFvMKSRtBbXTyXnTw0jGJPPoaZuVO3Q/
         uvEQ==
X-Gm-Message-State: AOAM532OE9roW70POAz6b6kyiNg4cJXS6/kzO5rAaeXBGfPRdIols686
	L0tj5ej+EU3Oer8zZQGooqQ=
X-Google-Smtp-Source: ABdhPJyNIldCrLbq7aNFDJGeBbz+5kwI3WZL3iPwc23RtFhK3VNh6SCliJZ6xIK8+T5E5jb+VxZMtQ==
X-Received: by 2002:a1c:6208:: with SMTP id w8mr3561720wmb.96.1607530476246;
        Wed, 09 Dec 2020 08:14:36 -0800 (PST)
Date: Wed, 9 Dec 2020 16:14:33 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, famzheng@amazon.com, cardoe@cardoe.com,
	wl@xen.org, Bertrand.Marquis@arm.com, julien@xen.org,
	andrew.cooper3@citrix.com
Subject: Re: [PATCH v6 00/25] xl / libxl: named PCI pass-through devices
Message-ID: <20201209161433.d7xpx5zwtikd3fmk@liuwe-devbox-debian-v2>
References: <160746448732.12203.10647684023172140005@600e7e483b3a>
 <alpine.DEB.2.21.2012081702420.20986@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2012081702420.20986@sstabellini-ThinkPad-T480s>
User-Agent: NeoMutt/20180716

On Tue, Dec 08, 2020 at 05:02:50PM -0800, Stefano Stabellini wrote:
> The pipeline failed because the "fedora-gcc-debug" build failed with a
> timeout: 
> 
> ERROR: Job failed: execution took longer than 1h0m0s seconds
> 
> given that all the other jobs passed (including the other Fedora job), I
> take this failed because the gitlab-ci x86 runners were overloaded?
> 

The CI system is configured to auto-scale as the number of jobs grows.
The limit is set to 10 (VMs) at the moment.

https://gitlab.com/xen-project/xen-gitlab-ci/-/commit/832bfd72ea3a227283bf3df88b418a9aae95a5a4

I haven't looked at the log, but the number of build jobs looks rather
larger than when we get started. Maybe the limit of 10 is not good
enough?

Wei.

