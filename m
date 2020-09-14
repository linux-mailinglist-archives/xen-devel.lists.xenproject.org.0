Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC40126888E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:36:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHktw-0008NC-M7; Mon, 14 Sep 2020 09:35:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hQe=CX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kHktv-0008N6-Jc
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:35:55 +0000
X-Inumbo-ID: 44caeba1-8ba4-4b27-a493-355619003895
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44caeba1-8ba4-4b27-a493-355619003895;
 Mon, 14 Sep 2020 09:35:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c18so17902583wrm.9
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 02:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vqaN0VG1+/GPV85igZKo2JCKCdk+qQdnyX4ONSQ64Ck=;
 b=iBJLZACzfkwKdMhIicA0/LpFGpANGNlfVsUFwW3s5f6CWFLOuKi6kQqRRuKB5P5Lg+
 lqracIMmP0iFFNGtrnMn/Xu5SL8jbzlepeReIX4/H8ELx9pk+PWE1AZHBvV+8YuBao9U
 V4aQQOlurB9B+Gg+aQvsJqUl8VUY2b1ZFwtUDIm1XR7YWXcz+cwe1l24kc7W8HHL7KJi
 PvuMhdRlyxYg8G9l+dC6wM+bgjhv/FPTSoD3r66SnObe21sVqgF2gxRYPfhAPpufAFcp
 XCmhguZUG5OVjg8rHH1caXZbE/y7+kPDxuwl6PX9Sh8Zz4/sWU9fKwejFB4pJnN6I6Ul
 QYYQ==
X-Gm-Message-State: AOAM532YHPyfiEc6ja5tr34ahJYaMVXcupN1sW4Styix3LXwwF3oESLL
 dLJcxAtFPfRh/P1mG3o1fSU=
X-Google-Smtp-Source: ABdhPJx7pk8+yZocOke43uRIBSKHCxcetQAN+RrGvNGl7ClmCQ2e/VrbNNXZVCaurcO+7WCBxqk9Zg==
X-Received: by 2002:a5d:4d82:: with SMTP id b2mr14352400wru.232.1600076144009; 
 Mon, 14 Sep 2020 02:35:44 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q15sm18991529wrr.8.2020.09.14.02.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 02:35:43 -0700 (PDT)
Date: Mon, 14 Sep 2020 09:35:42 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/build: fix python xc bindings
Message-ID: <20200914093541.nfs3ajzuh4hqu5lq@liuwe-devbox-debian-v2>
References: <20200912135807.28293-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200912135807.28293-1-jgross@suse.com>
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

On Sat, Sep 12, 2020 at 03:58:07PM +0200, Juergen Gross wrote:
> Commit 7c273ffdd0e91 ("tools/python: drop libxenguest from setup.py")
> was just wrong: there is one function from libxenguest used in the
> bindings, so readd the library again.
> 
> While at it remove the unused PATH_LIBXL setting.
> 
> Fixes: 7c273ffdd0e91 ("tools/python: drop libxenguest from setup.py")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

Since this blocks osstest and is just putting back old code I want to
commit it as quickly as possible.

