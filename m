Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16727FDE8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1199.4032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwHj-0001Ij-0b; Thu, 01 Oct 2020 10:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199.4032; Thu, 01 Oct 2020 10:58:02 +0000
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
	id 1kNwHi-0001IK-SU; Thu, 01 Oct 2020 10:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1199;
 Thu, 01 Oct 2020 10:58:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNwHi-0001ID-3o
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:58:02 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffffc56b-aa11-4110-9b88-07263098518f;
 Thu, 01 Oct 2020 10:58:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m6so5162644wrn.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:58:01 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q15sm8212783wrr.8.2020.10.01.03.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 03:58:00 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNwHi-0001ID-3o
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:58:02 +0000
X-Inumbo-ID: ffffc56b-aa11-4110-9b88-07263098518f
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ffffc56b-aa11-4110-9b88-07263098518f;
	Thu, 01 Oct 2020 10:58:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m6so5162644wrn.0
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JXGMFEmYY83EHbsXJJPiEpwV2Khmtulu6FOAUZZx04A=;
        b=bISffOZMOjdX6uzw86Tun3IXlQIo2cOWaSflxxIFi70GelPA9aBft8a2no1uAGuI/q
         aldbnZ8cvv5hy6zI4f+mYxsw/8RHAclhXozhXQGVRwdiGTCIKwFKTngBG/vx3HqxytEv
         PXA2byUqWvAfIY3HtfenL/mMqXfgY3tjGoldIGeq38jt4sjlxJXxELTNBi/yPWBz6nTA
         i5GIktfbX1K93oLbwnCq2Zs7fMEu8x7UaDojAkg3Cvi9y2d3T2HgbjVseDsNK7gH3Z1j
         uWwINaVDVwSOb4ZV5YE8bZfDowLIJfaWyykitbnfS9hPDdfJfOE0yifdd3hG4eh8jwoh
         kzGA==
X-Gm-Message-State: AOAM532snDoQNWBFZOhXLTIImyPB6DEfbHkx3rsTmTpBvR1+nwsKzgdC
	Fca+4j+uI65OKQ06Ye0w2as=
X-Google-Smtp-Source: ABdhPJzLvpdzOpN2WAdA8DuW8oTWuAj33IBdqntKaPAnC5m+GT+ZV/j4b0HgjcxY1Da+PM5rIyBw/Q==
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr8269104wrq.151.1601549880514;
        Thu, 01 Oct 2020 03:58:00 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id q15sm8212783wrr.8.2020.10.01.03.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:58:00 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:57:58 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 6/8] xen/xsm: Drop xsm_hvm_param_nested()
Message-ID: <20201001105758.ung7wpw2klgcpmq6@liuwe-devbox-debian-v2>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930134248.4918-7-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 30, 2020 at 02:42:46PM +0100, Andrew Cooper wrote:
> The sole caller has been removed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

