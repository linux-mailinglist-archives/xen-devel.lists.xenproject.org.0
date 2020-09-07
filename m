Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1960525FBE4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:14:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFHuj-0007Gv-6o; Mon, 07 Sep 2020 14:14:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFHui-0007Gp-Ec
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:14:32 +0000
X-Inumbo-ID: d7e89078-913f-4002-9b37-65c04ed7c980
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7e89078-913f-4002-9b37-65c04ed7c980;
 Mon, 07 Sep 2020 14:14:31 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w5so15974176wrp.8
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 07:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JN+kND8h4NbUWLD9LIr2pEJXEQDuut8qoPQv9yvisw4=;
 b=d/R/Cb1oYpLNflRcm4aBQL7/M0QEdCnB/dDEjkrEyl/PxgbnrRk/kgUEBDKvTicXm9
 B3ovtz/Z97Qr7pb8MEhkWXsfP6dThhVnAYkLowsmOaTadcWJIFa3GiDo8CJPaokDibug
 wfSh68df4+53q31RW9cbHI6/jPQgo+Bl2Rqp5L0RKpp/afWOkPP+jMlhloxw3Yp3nip+
 5yp4pgSagcFwpcUdGswiv+eniKg8LY1j0ePkg6jx6qD5hXSov5Ep/KTwaWHKb1Dz0oL5
 Y1MbWr6NHi8SVgukTavFCUElk40K6cXKuzo0c8g0PSJdwBTZuiOUYl73NtVnbfauOu/I
 7uOA==
X-Gm-Message-State: AOAM5336mGnLRXijeXFMZZzTogUupT59r+CJzev5NmDlPnuXANDYsnfZ
 LhwNiHreFHny5t7CI/tSIvY=
X-Google-Smtp-Source: ABdhPJzc9Zk9ha2Y8Ke2GgjYllr1MYVpGsYToVxR77lqWhblVLlLxCsk+WP+Tn4qXxAsdJ0DCmuCAQ==
X-Received: by 2002:adf:ca06:: with SMTP id o6mr21150660wrh.181.1599488070646; 
 Mon, 07 Sep 2020 07:14:30 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id x24sm29596593wrd.53.2020.09.07.07.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 07:14:30 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:14:28 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] minios: use more recent commit for building xen unstable
Message-ID: <20200907141428.e2fotwt4ruxolkzz@liuwe-devbox-debian-v2>
References: <20200907114814.15620-1-jgross@suse.com>
 <20200907114814.15620-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907114814.15620-2-jgross@suse.com>
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

On Mon, Sep 07, 2020 at 01:48:14PM +0200, Juergen Gross wrote:
> Commit 82c3d15c903aa43 ("minios: Revert recent change and revert to
> working minios") switched the used commit for the build of Xen unstable
> from master to a rather old commit (the one used for Xen 4.13 instead
> of the last one without a known problem).
> 
> Switch to Mini-OS commit 051b87bb9c196 instead, which doesn't contain
> the problematic modification being reason for switching away from
> master.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

