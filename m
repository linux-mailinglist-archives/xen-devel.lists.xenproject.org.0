Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB23D27FDDD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1191.3984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwFA-0000mE-PH; Thu, 01 Oct 2020 10:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191.3984; Thu, 01 Oct 2020 10:55:24 +0000
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
	id 1kNwFA-0000lq-LS; Thu, 01 Oct 2020 10:55:24 +0000
Received: by outflank-mailman (input) for mailman id 1191;
 Thu, 01 Oct 2020 10:55:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNwF8-0000lb-Vu
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:55:23 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63d146d4-b5be-4c8c-b82d-01a716981bf8;
 Thu, 01 Oct 2020 10:55:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k15so5125258wrn.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:55:22 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id t16sm2977793wmi.18.2020.10.01.03.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 03:55:20 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNwF8-0000lb-Vu
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:55:23 +0000
X-Inumbo-ID: 63d146d4-b5be-4c8c-b82d-01a716981bf8
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 63d146d4-b5be-4c8c-b82d-01a716981bf8;
	Thu, 01 Oct 2020 10:55:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k15so5125258wrn.10
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7NEmW18qKW/Lt+bOZTfoQ7sXNngWHPAc1cKQm0Bllf4=;
        b=gtFWXPzzP1QV9XoORSr23bJN9J2QO2Fe1IxB7GkNPUkCKf2/1jC4082ffPA8tTJmMa
         LvCkuCZNXhC5wG2YSZgwHriwg4Ln5DQYp5RksyzWfxlfSi12EsfPn4KUqyxOGnRxW/H0
         ZM3jBDK3r8sDUEX2C4QNtcagbLp+YgCSodkxHRaQ3ip9DQyeyEpi+24rUsCcDgGEqIC3
         4qhOOuBEIJSa1URsU+meeSm+4D1mAjNU/wTulg+7qgpUcXlsaU81z0ZNbfO4FI7Uvis/
         g46Z3NTgL/nrij2aC+08mA3+RskEuyQUB06NRjZEuVhSigid4socBtXPXhowpkdjgJQs
         /bWQ==
X-Gm-Message-State: AOAM53063HVm6az9zv9qKqKd16TUBSQ0TTCanX9AO55G12odvfby7kA9
	tKVKirH7pCS8BHNn3lSvqIg=
X-Google-Smtp-Source: ABdhPJzAvaNwaA2eDu6aLqCQgdSsWIX2fX85ot72QR93lbKv0BNQOVqnzJnprfe5H57cVzQmjs8TNg==
X-Received: by 2002:adf:a3d4:: with SMTP id m20mr8835398wrb.29.1601549721445;
        Thu, 01 Oct 2020 03:55:21 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id t16sm2977793wmi.18.2020.10.01.03.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:55:20 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:55:19 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] xen/domctl: Simplify DOMCTL_CDF_ checking logic
Message-ID: <20201001105519.mqguww6gqk5rwasy@liuwe-devbox-debian-v2>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930134248.4918-3-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 30, 2020 at 02:42:42PM +0100, Andrew Cooper wrote:
> Introduce some local variables to make the resulting logic easier to follow.
> Join the two IOMMU checks in sanitise_domain_config().  Tweak some of the
> terminology for better accuracy.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Wei Liu <wl@xen.org>

