Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D22A98F1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 16:58:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20933.47008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb480-0004DL-68; Fri, 06 Nov 2020 15:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20933.47008; Fri, 06 Nov 2020 15:58:16 +0000
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
	id 1kb480-0004Cw-1s; Fri, 06 Nov 2020 15:58:16 +0000
Received: by outflank-mailman (input) for mailman id 20933;
 Fri, 06 Nov 2020 15:58:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kb47y-0004Cp-UT
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:58:14 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6bead1b-d79b-4be8-ae88-e697c5c35bbc;
 Fri, 06 Nov 2020 15:58:14 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 10so1140457wml.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 07:58:14 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id j9sm2695399wrp.59.2020.11.06.07.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:58:12 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kb47y-0004Cp-UT
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:58:14 +0000
X-Inumbo-ID: a6bead1b-d79b-4be8-ae88-e697c5c35bbc
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a6bead1b-d79b-4be8-ae88-e697c5c35bbc;
	Fri, 06 Nov 2020 15:58:14 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 10so1140457wml.2
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 07:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XlizrOFuqlAfbRVAxzGG1DFw9jrD4DJZPaRu188MR24=;
        b=obpdrcLJRheAiEZmFBWHU0JIyicQx/JQosXtgCGI6yseSTSlSAGrUxFt+RtOs8suVD
         EaBjPxClFAUW6eLldnBA59RCp8TqqG1ESsdEHCHWeas5b9+QZ76D1gd6C1MiooolJPlk
         AWJJb9y0OKAh2IPvXci6Tg0+4CC+CLNunDkySQD6UfMxZZIu16U7AGDu4Z8GajKeOBc4
         O/rqemwPomsKsYiif9J3quth1X0HQg1UXhd3nvbNVerG2fY1HjfqH7iYzFBX8t6ggN5W
         YfNxTJP+PFzOiLTtIZ1nyC2BodwU6MU6YXJ3dtAcVx4fsDFwp8qzDhuGy1HC3JHP+oWq
         8rnw==
X-Gm-Message-State: AOAM533vd00bZlT4AK+NphVcL860tzqOFtyvGGPWfxk00L/FkPq2fDVT
	LiIBQjIhqOF47bHiXflJNKw=
X-Google-Smtp-Source: ABdhPJzR48xSbooA4brDVQjvjaagZIsj7lfyyMwsX5NCPmavvUS0Le9UW2w3GcnIkXI7XBNj9Pw+fw==
X-Received: by 2002:a1c:6a11:: with SMTP id f17mr289879wmc.24.1604678293390;
        Fri, 06 Nov 2020 07:58:13 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id j9sm2695399wrp.59.2020.11.06.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 07:58:12 -0800 (PST)
Date: Fri, 6 Nov 2020 15:58:11 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] docs/xl: fix cpupool-cpu-remove
Message-ID: <20201106155811.uwqbjh7byzb4d6d4@liuwe-devbox-debian-v2>
References: <20201106130518.26875-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106130518.26875-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Fri, Nov 06, 2020 at 02:05:17PM +0100, Olaf Hering wrote:
> The cpu-pool must be specified.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Wei Liu <wl@xen.org>

