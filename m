Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F81283CF0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 18:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3072.8892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPTo0-0001JR-TX; Mon, 05 Oct 2020 16:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3072.8892; Mon, 05 Oct 2020 16:57:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPTo0-0001J2-Q4; Mon, 05 Oct 2020 16:57:44 +0000
Received: by outflank-mailman (input) for mailman id 3072;
 Mon, 05 Oct 2020 16:57:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xs+r=DM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kPTnz-0001Ix-3K
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 16:57:43 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd98541b-8cb4-4a42-b0c4-6cd8362b1a9e;
 Mon, 05 Oct 2020 16:57:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d4so204023wmd.5
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2020 09:57:42 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id x64sm196528wmg.33.2020.10.05.09.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 09:57:40 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xs+r=DM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kPTnz-0001Ix-3K
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 16:57:43 +0000
X-Inumbo-ID: bd98541b-8cb4-4a42-b0c4-6cd8362b1a9e
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bd98541b-8cb4-4a42-b0c4-6cd8362b1a9e;
	Mon, 05 Oct 2020 16:57:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d4so204023wmd.5
        for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2020 09:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bRHjBIvdCGyfM/Qx4IKnQpmpZIdhFFKc33TES6qzM4s=;
        b=mVCNr4IoUO4909YwWBlnEHJRFP8zxmIWAbhFtNTK+orpn7HCp1tSropu2VSzD9mg64
         pwmOI8SyKmGIkv1bnnoBWSJNnzOZQZHixYRluj74DzcU9Ep1sriGhK/v4WN2wEsseo+P
         0aZtlbfyc82vSOaGEv/tjYr01PjxxtfMYHZRr7u2Pe+t7jMyTBGNyj0iv2onSZaA8JHz
         eEB+m0Q3py4ntvmNBXmn7FeRijxsQTLP4p5KBOW1EaVwDyiduYh1YagrU0u8Pg9qs/s4
         M9v/drzdBQh521Zu6OS/K6KU5lole6D0JGG+Zgls28y8uBexuAXRQAN3p+BWb7Nz9g+7
         doRQ==
X-Gm-Message-State: AOAM533RCDfOioeWLcpVxnvbDi3Js68gfhAQVU+LOWFWJh7xgGV4Yp8V
	6lqm4KKwujXfYSV4wM9KqmI=
X-Google-Smtp-Source: ABdhPJxwysuMFLyks/xE5EJLKMGvQ4J5feEFQTw7W1edJt/1APyjzCQOGdDV5jfs+aOILE+XFSlkZw==
X-Received: by 2002:a1c:3283:: with SMTP id y125mr301580wmy.61.1601917061534;
        Mon, 05 Oct 2020 09:57:41 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id x64sm196528wmg.33.2020.10.05.09.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 09:57:40 -0700 (PDT)
Date: Mon, 5 Oct 2020 16:57:39 +0000
From: Wei Liu <wl@xen.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] tool/libx: Fix libxenlight gcc warning
Message-ID: <20201005165739.yoogabodz4dxrr6q@liuwe-devbox-debian-v2>
References: <cover.1601913536.git.bertrand.marquis@arm.com>
 <1c0b3a351e20e31093b5f59edd7fafeac1ceb75c.1601913536.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c0b3a351e20e31093b5f59edd7fafeac1ceb75c.1601913536.git.bertrand.marquis@arm.com>
User-Agent: NeoMutt/20180716

On Mon, Oct 05, 2020 at 05:02:49PM +0100, Bertrand Marquis wrote:
> Fix gcc10 compilation warning about uninitialized variable by setting
> it to 0.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Wei Liu <wl@xen.org>

