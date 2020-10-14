Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6059128E391
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 17:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6794.17904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSj0I-00007g-Sg; Wed, 14 Oct 2020 15:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6794.17904; Wed, 14 Oct 2020 15:47:50 +0000
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
	id 1kSj0I-00007D-Oc; Wed, 14 Oct 2020 15:47:50 +0000
Received: by outflank-mailman (input) for mailman id 6794;
 Wed, 14 Oct 2020 15:47:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKJF=DV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kSj0H-00006m-9R
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:47:49 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 801f07c0-5765-4c65-b20f-79ca8f052087;
 Wed, 14 Oct 2020 15:47:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d3so30205wma.4
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 08:47:47 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w1sm5465242wrp.95.2020.10.14.08.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 08:47:45 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TKJF=DV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kSj0H-00006m-9R
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:47:49 +0000
X-Inumbo-ID: 801f07c0-5765-4c65-b20f-79ca8f052087
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 801f07c0-5765-4c65-b20f-79ca8f052087;
	Wed, 14 Oct 2020 15:47:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d3so30205wma.4
        for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 08:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hSs/GN2TnOgkJHJZ69jAe3h9FqrpQAVOKf3fh9GUSVU=;
        b=PUnP/vNlRcmfl1dSlwv6kcTRlOFPcOj75Ykct0y5+lVgSqUzACgtreY659j0PoL4rJ
         8ns9emakFyacrLyiYoPhMr45oPmcXyNUqg/GcZZ7Zimb7EJw20RM8FRdTgfumlbGPn4E
         ne+7dYruKyu1Q/Jp47FYkvJsfUolLWm0omqqOsQ81bpwWKcRmmml8YEtgBZkc2WMMDAa
         8Y3CMLQwnlmQugC+AUWfyRnc5tEUQUVDVzZOCMx3dUEEcbT28GSPPDV0UMXNqzbV9LT0
         ywjn2bug/yiVZzrSpbYxLi3bjfYSqqT+m6DdI4EEw/qlw7v6JtnjMLJmuiu+Uh9PLtmU
         aBKQ==
X-Gm-Message-State: AOAM532bX2T/iAjTAsOmsGxOYBLCr+r2fGeTakWZ6pO78p9Twm6FQso6
	Z0iWWJBI5q2ewNABjx9fdvg=
X-Google-Smtp-Source: ABdhPJzd3kbVnsN4MPM1WM9LsDfrD0jGLOu7MPGp6vKWH8F4VNngJcfrio7NQk8Cqd4ZfMqfZUbK/w==
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr51872wmk.73.1602690466345;
        Wed, 14 Oct 2020 08:47:46 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id w1sm5465242wrp.95.2020.10.14.08.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 08:47:45 -0700 (PDT)
Date: Wed, 14 Oct 2020 15:47:44 +0000
From: Wei Liu <wl@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
	"jgross@suse.com" <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/2] tools/libs/stat: use memcpy instead of strncpy in
 getBridge
Message-ID: <20201014154744.j56skud26v5iwenx@liuwe-devbox-debian-v2>
References: <4ecb03b40b0da6d480e95af1da8289501a3ede0a.1602078276.git.bertrand.marquis@arm.com>
 <A6CDE62A-13F4-491B-BE0B-180657136504@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A6CDE62A-13F4-491B-BE0B-180657136504@arm.com>
User-Agent: NeoMutt/20180716

On Wed, Oct 14, 2020 at 10:58:33AM +0000, Bertrand Marquis wrote:
> Hi,
> 
> Could this be reviewed so that gcc10 issues are fixed ?

I think Juergen's comments have been addressed.

Acked-by: Wei Liu <wl@xen.org>

