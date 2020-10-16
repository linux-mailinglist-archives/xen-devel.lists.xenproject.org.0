Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C397A29064B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 15:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8085.21530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTPmh-0006jW-8f; Fri, 16 Oct 2020 13:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8085.21530; Fri, 16 Oct 2020 13:28:39 +0000
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
	id 1kTPmh-0006j6-54; Fri, 16 Oct 2020 13:28:39 +0000
Received: by outflank-mailman (input) for mailman id 8085;
 Fri, 16 Oct 2020 13:28:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWFt=DX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kTPmf-0006iz-3R
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:28:37 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95324b5f-d30d-4433-ba3f-6a51da44eaf3;
 Fri, 16 Oct 2020 13:28:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i1so2960976wro.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 06:28:36 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n66sm2731489wmb.35.2020.10.16.06.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 06:28:34 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rWFt=DX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kTPmf-0006iz-3R
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:28:37 +0000
X-Inumbo-ID: 95324b5f-d30d-4433-ba3f-6a51da44eaf3
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 95324b5f-d30d-4433-ba3f-6a51da44eaf3;
	Fri, 16 Oct 2020 13:28:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i1so2960976wro.1
        for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 06:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pj6FiS/1OvmJAiCK2mjsDrJ5Mxj1XafohpUchGS06KI=;
        b=glQoW26fzc+e1v0rCpV2TJgcPU21uCGzMB/ISZUNRr9ZCzevegnAcTWQe9vpLYooNR
         3gmnSD2C2v60guodIEDtKryXbGDa3IzWylPxUd1jw0Yqvxf8thth5i069kodY6SOoczx
         DkpE/eH3X3Hvy3H6+8Ypce/eI1BbVZPuLr66yYIgoXXQcZvHi58BvEtN2qURIkBRSqG+
         y09gIPGt9OmhwCryo7KSBbDM8+XyQwUSrkwpD2VRot02PI7RghWAJCqJBjcCFeWlCcqm
         493PKFKa7msOIR94dhjthwpqyYo3/E5QOg+CbjY6uCiGnlw8fXKmJFBK8cCSNGCllVL6
         3y3g==
X-Gm-Message-State: AOAM531GV71ShRvK2UfeCPbJiF2Sax4dwx2zpPUaSEAJIzNBsxV/NFzN
	43T9uXJfhu9pv/lugf5klM0=
X-Google-Smtp-Source: ABdhPJwZjyNl2jRrQ9wwWJX2gk9ewl8P6HgpBzCOF1u2nk9A80f6P1zCVASahTvR8c3+R6sIPrlaeA==
X-Received: by 2002:a5d:5743:: with SMTP id q3mr3904354wrw.167.1602854915404;
        Fri, 16 Oct 2020 06:28:35 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id n66sm2731489wmb.35.2020.10.16.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 06:28:34 -0700 (PDT)
Date: Fri, 16 Oct 2020 13:28:33 +0000
From: Wei Liu <wl@xen.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] tools/xenpmd: Fix gcc10 snprintf warning
Message-ID: <20201016132833.fadg2dtj2q6pshrj@liuwe-devbox-debian-v2>
References: <14ac4900dcf4fb9b45ce4f5e3d60de7f7e3602ab.1602753323.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14ac4900dcf4fb9b45ce4f5e3d60de7f7e3602ab.1602753323.git.bertrand.marquis@arm.com>
User-Agent: NeoMutt/20180716

On Thu, Oct 15, 2020 at 10:16:09AM +0100, Bertrand Marquis wrote:
> Add a check for snprintf return code and ignore the entry if we get an
> error. This should in fact never happen and is more a trick to make gcc
> happy and prevent compilation errors.
> 
> This is solving the following gcc warning when compiling for arm32 host
> platforms with optimization activated:
> xenpmd.c:92:37: error: '%s' directive output may be truncated writing
> between 4 and 2147483645 bytes into a region of size 271
> [-Werror=format-truncation=]
> 
> This is also solving the following Debian bug:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=970802
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Wei Liu <wl@xen.org>

