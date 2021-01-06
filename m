Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CF92EBD24
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 12:26:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62443.110602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6xV-0003Ai-4Z; Wed, 06 Jan 2021 11:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62443.110602; Wed, 06 Jan 2021 11:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6xV-0003AJ-1L; Wed, 06 Jan 2021 11:26:33 +0000
Received: by outflank-mailman (input) for mailman id 62443;
 Wed, 06 Jan 2021 11:26:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4R3a=GJ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kx6xT-0003AC-Me
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:26:31 +0000
Received: from mail-wr1-f45.google.com (unknown [209.85.221.45])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f295ae1-1c30-4637-8228-8ab2d64e2a58;
 Wed, 06 Jan 2021 11:26:30 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r7so2098255wrc.5
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jan 2021 03:26:30 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z15sm2766406wrv.67.2021.01.06.03.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 03:26:29 -0800 (PST)
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
X-Inumbo-ID: 3f295ae1-1c30-4637-8228-8ab2d64e2a58
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QER+uR60B8vpH4a2oHu+YzYFXWZKnKKZY0x2bDJKkos=;
        b=pTG3ATaTnHhe4IxAG1JqSiPSBiHa4QLXNyCurL4t7EnCOl1xqou2ALDhY4FcTE0PCg
         D4g5aejGsJ0bEpDzUFUCJICzVHxPs1w0EHGAGi9c4vKHuao6RfMGTpjkmpXLr6lA8mR6
         WDJe5DAqLZ+sdgqpy/7ZpAzVC+HUxdqaoPDkP3bmPG3s7sEx38xgTZeYgHGqvcGISuG2
         dbas2uXfcryT8UuOp8Kjz3I8F5G+LJnnkvht38rgMnDw+xKp6AoSGA90XbClRay7EltN
         P3x5yfbZ64q0C2wLiGRSlwjgk49XmNh75t+EPIUejz4IocUSspwLZil8LPYjFD3AWmPK
         +SoA==
X-Gm-Message-State: AOAM533MDG38vwU/7dnUom45iKVwEp/HO+lc5Jd8WyrejgN1dDp68ikU
	rglX0FTv6yQABK8YJ7Vt/pI=
X-Google-Smtp-Source: ABdhPJwqfUYxTVHYsdRyetrrSqW4F9Zx7CFwWgmHwyIfdQM4lbDATIzokXy1vhVrFaMELsKBUIeDuA==
X-Received: by 2002:adf:902a:: with SMTP id h39mr3801106wrh.147.1609932390171;
        Wed, 06 Jan 2021 03:26:30 -0800 (PST)
Date: Wed, 6 Jan 2021 11:26:28 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, Olaf Hering <olaf@aepfle.de>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC10 [and
 1 more messages]
Message-ID: <20210106112628.h7rh4wpnnzf2htbj@liuwe-devbox-debian-v2>
References: <osstest-158191-mainreport@xen.org>
 <20210104115223.25403-1-olaf@aepfle.de>
 <20210105115708.aq2nfk3x4cnizzws@liuwe-devbox-debian-v2>
 <24565.40383.481245.649560@mariner.uk.xensource.com>
 <20210106112534.7hot2rbicv56nei4@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106112534.7hot2rbicv56nei4@liuwe-devbox-debian-v2>
User-Agent: NeoMutt/20180716

On Wed, Jan 06, 2021 at 11:25:34AM +0000, Wei Liu wrote:
> On Wed, Jan 06, 2021 at 11:23:43AM +0000, Ian Jackson wrote:
> > Wei Liu writes ("Re: [PATCH v1] tools: ipxe: update for fixing build with GCC10"):
> > > On Mon, Jan 04, 2021 at 12:52:23PM +0100, Olaf Hering wrote:
> > > > Update to v1.21.1 to fix build in Tumbleweed, which has been broken
> > > > since months due to lack of new release.
> > > > 
> > > > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> > > 
> > > Acked-by: Wei Liu <wl@xen.org>
> > ...
> > > > -IPXE_GIT_TAG := 1dd56dbd11082fb622c2ed21cfaced4f47d798a6
> > > > +IPXE_GIT_TAG := 988d2c13cdf0f0b4140685af35ced70ac5b3283c
> > 
> > Unfortunately this broke the build, but it's not really your fault:
> > 
> > osstest service owner writes ("[xen-unstable-smoke test] 158191: regressions - FAIL"):
> > > Tests which did not succeed and are blocking,
> > > including tests which could not be run:
> > >  build-amd64                   6 xen-build                fail REGR. vs. 158134
> > 
> > --2021-01-06 01:27:19--  http://xenbits.xen.org/xen-extfiles/ipxe-git-988d2c13cdf0f0b4140685af35ced70ac5b3283c.tar.gz
> > Resolving cache (cache)... 172.16.148.6
> > Connecting to cache (cache)|172.16.148.6|:3128... connected.
> > Proxy request sent, awaiting response... 404 Not Found
> > 
> > We currently insist on having have a tarball.
> > 
> > That means someone (me, I guess) has to do a "git archive" and put the
> > resulting tarball in the right place on xenbits.  Unfortunately this
> > is still manual, but we don't update ipxe very often.
> > 
> 
> Wouldn't the build host just fetch from the upstream git tree? That's
> why I didn't ask you to make a tarball -- I was waiting to see if this
> could pass osstest before asking.
> 

Never mind. It seems that I have missed the change of requirement...

Wei.

