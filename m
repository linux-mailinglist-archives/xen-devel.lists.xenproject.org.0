Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B5825E0F2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 19:36:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEFd2-0006Bi-TG; Fri, 04 Sep 2020 17:36:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oaZu=CN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kEFd2-0006B5-2E
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 17:36:00 +0000
X-Inumbo-ID: a49032a3-73fa-4c69-bad0-d0f1ec57711b
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a49032a3-73fa-4c69-bad0-d0f1ec57711b;
 Fri, 04 Sep 2020 17:35:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w5so7527261wrp.8
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2020 10:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+zT6TAnfRzC64wZ6w58AordLuF96MIhgesOtRWyfYIA=;
 b=qX8dVVPmO+IsKBn+8diXjwu5IqfRjlIc8EGmvjfJhqUlG+gBAA1nPWuffkoXGtloUV
 yKwQv4rg2d/Q/NYxBP30l7nNGXEnVg9HMo4H2vSyCU4Rzkec3BXcEVHEpvomHFmz3oml
 DKPy4EcuT/wqMcs9zyz/QrqgymnebYNjhMQ7oe279IpVfDqCodnHbKsAVHTLcfVTHWP2
 hx2YOxAvxrWiQuPMnNpXvaOyZqWtYETXyWGqTB1sYwVdpL0625cF3KKB38bYGXEQ+jc6
 PLyWH5Qy9qnR1EWSprDJ3Fy50xA+/Xu45W1wFsp2tj3qXR/RWv44WeFSRL9wE7ieVUec
 jNMg==
X-Gm-Message-State: AOAM532SGpLbR1HBU9YwMXgEJSZk0BRPxQyiD2Rn0shB8zF3by8L8Aho
 46o5ELzk/GuDnzA0ztgrnS0=
X-Google-Smtp-Source: ABdhPJzVo+tBfXnkbdudJO2lQzB/qV0zYsEgiBNhb2ZVzvd5hwzUl85eLs/NS8V58OOgf2SIV344UA==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr9163115wrt.255.1599240954421; 
 Fri, 04 Sep 2020 10:35:54 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id r14sm12606110wrc.41.2020.09.04.10.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 10:35:53 -0700 (PDT)
Date: Fri, 4 Sep 2020 17:35:52 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable test] 153602: regressions - FAIL [and 1 more
 messages]
Message-ID: <20200904173552.upzzbos6hkbvn3t7@liuwe-devbox-debian-v2>
References: <233c6207-4724-55b0-3c92-84251edfc5b2@suse.com>
 <20200904160034.11456-1-iwj@xenproject.org>
 <osstest-153602-mainreport@xen.org>
 <1bdbf90f-2150-cb86-63a2-37e5148ec34e@suse.com>
 <24401.5895.115731.487189@mariner.uk.xensource.com>
 <52d2bdeb-ccde-9d9d-9f62-24571e9e4c15@suse.com>
 <565646cc-2833-d34e-2bc3-eb920ac7f140@suse.com>
 <24402.28756.378598.517505@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24402.28756.378598.517505@mariner.uk.xensource.com>
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

On Fri, Sep 04, 2020 at 05:50:28PM +0100, Ian Jackson wrote:
> Jan Beulich writes ("Re: [xen-unstable test] 153602: regressions - FAIL"):
> > Actually, with also reverting 8d990807ec2c in the main tree (along with
> > effectively reverting e013e8514389, which comes down to the same as Ian
> > suggested for 165f3afbfc3d), and with its future re-installment at the
> > same time bumping the mini-os commit to use, things ought to work I
> > would think. That would then be the same model again as used for
> > qemu-trad.
> 
> I implemented this here:
> 
> Ian Jackson writes ("[PATCH] minios: Revert recent change and revert to working minios"):
> > Currently, xen.git#staging does not build in many environments because
> > of issues with minios master.  This regression was introduced in an
> > uncontrolled manner by an update to mini-os.git#master.
> 
> I don't have any formal acks for this but, having build-tested it, I
> am going to push it now, because the build is broken.

Thanks for handling this.

Wei.

> 
> Ian.

