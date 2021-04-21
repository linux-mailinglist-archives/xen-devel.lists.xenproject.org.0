Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA298367063
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 18:43:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114896.219038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZFw2-00043i-OT; Wed, 21 Apr 2021 16:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114896.219038; Wed, 21 Apr 2021 16:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZFw2-00043J-LQ; Wed, 21 Apr 2021 16:42:42 +0000
Received: by outflank-mailman (input) for mailman id 114896;
 Wed, 21 Apr 2021 16:42:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZFw0-00043E-GC
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 16:42:40 +0000
Received: from mail-wm1-f53.google.com (unknown [209.85.128.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f7c3aad-da0c-423d-8a09-c049f02782bd;
 Wed, 21 Apr 2021 16:42:39 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id y204so21161133wmg.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 09:42:39 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c16sm3520490wrm.93.2021.04.21.09.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 09:42:38 -0700 (PDT)
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
X-Inumbo-ID: 4f7c3aad-da0c-423d-8a09-c049f02782bd
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0YpwlqFkcdBa5ITQPtCb0MJqzgFpJOQmRCg3NbwtzEM=;
        b=rb8IX8qe+MnzQOEkjg2rWqD72QWaz5ak0UAInZwA1LQFbiRKY8NrxehoAk0DlzcBUs
         r5JQ6A2rmlokbBzRPOAdVkuJeEq1B9950K6NlBqnpslhpp9ytlhbr1zm08OSMoGoMP4k
         ttQU2DOHfi1gIEIjz2vzMpCKLcYXS7w1tx/Bz5HuYEciF7KSCDAbkvBBoNKfqm5DBj3f
         AR1L50uZUdcCUV9C2CUxV71vT/nHQ880KYkP5Jtm+PUVdro4BsT3vZJqdf5OYKskn7sw
         cGHMMo2OtvCirt+Z5ceXXovZdF2If1JgbL8jSc/hISxudvd3G8mYIbmR1pm2feW9nwTO
         ZIqQ==
X-Gm-Message-State: AOAM532XCn4PgcNG29YzJnNuFlqBUMFReQHxENzINycdc2/dpXwuCuqJ
	sKR6FKn2Eopgw3PuNE3Iw94=
X-Google-Smtp-Source: ABdhPJzfCzALqWYTfpbCZ/HzaKebSjy2Bq7LbG/eat2xye2WRZavkjmFCIf5IG3ZfTLZ3J8/06l9YQ==
X-Received: by 2002:a1c:b6c4:: with SMTP id g187mr10548787wmf.119.1619023358982;
        Wed, 21 Apr 2021 09:42:38 -0700 (PDT)
Date: Wed, 21 Apr 2021 16:42:37 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 15/21] libs/guest: obtain a compatible cpu policy from
 two input ones
Message-ID: <20210421164237.im72bpddu52oruzw@liuwe-devbox-debian-v2>
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-16-roger.pau@citrix.com>
 <20210421102239.tlesqrxsplk5vthm@liuwe-devbox-debian-v2>
 <YIAL+bTKvPsAfM2a@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YIAL+bTKvPsAfM2a@Air-de-Roger>

On Wed, Apr 21, 2021 at 01:26:49PM +0200, Roger Pau Monné wrote:
> On Wed, Apr 21, 2021 at 10:22:39AM +0000, Wei Liu wrote:
> > On Tue, Apr 13, 2021 at 04:01:33PM +0200, Roger Pau Monne wrote:
> > > Introduce a helper to obtain a compatible cpu policy based on two
> > > input cpu policies. Currently this is done by and'ing all CPUID leaves
> > > and MSR entries, except for MSR_ARCH_CAPABILITIES which has the RSBA
> > > bit or'ed.
> > > 
> > 
> > I thought canonical source for compatibility was to be put into the
> > hypervisor, thus all this functionality would be in the hypervisor. Am I
> > misremembering?
> 
> Andrew said something similar on v1, but I'm not able to figure how
> this would be used by the hypervisor.
> 
> It's my understating that the toolstack will attempt to generate a CPU
> policy and forward it to the hypervisor, which will either accept or
> reject it based on the capabilities of the system. I'm not sure I see
> why we would need to give the hypervisor two policies in order to
> generate a resulting compatible one - it should all be done by the
> toolstack AFAICT.
> 
> If there's a use case for this being in the hypervisor I'm happy to
> add it there, but so far I haven't been able to come up with one
> myself, and hence I don't see the need to make the code available.

I have no opinion here. Just wanted to get on the same page.

Thanks for the explanation.

Wei.

> 
> Thanks, Roger.

