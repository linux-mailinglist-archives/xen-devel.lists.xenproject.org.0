Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039CA2EBD20
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 12:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62434.110575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6wd-0002xP-DL; Wed, 06 Jan 2021 11:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62434.110575; Wed, 06 Jan 2021 11:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6wd-0002x4-9z; Wed, 06 Jan 2021 11:25:39 +0000
Received: by outflank-mailman (input) for mailman id 62434;
 Wed, 06 Jan 2021 11:25:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4R3a=GJ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kx6wb-0002ww-Ua
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:25:37 +0000
Received: from mail-wr1-f49.google.com (unknown [209.85.221.49])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 331c559e-cfa5-4e7e-be8b-e9940876ce31;
 Wed, 06 Jan 2021 11:25:37 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d26so2060642wrb.12
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jan 2021 03:25:37 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id m18sm2681855wrw.43.2021.01.06.03.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 03:25:35 -0800 (PST)
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
X-Inumbo-ID: 331c559e-cfa5-4e7e-be8b-e9940876ce31
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IWnYHJb8WD71Gbpdq+hKTfbGb8q1qY4p/dGrfy7N2SY=;
        b=ANuU7lIL7QGN22YgL0gOe3LtvOxo3HXj0hBL4B+5c1mdvda0300Y2YXvOZk96/PrMS
         xKUHc7IcigirOjbFqQGrpbEghLb/OP7gVnTSew4tQHHTR5Jq3mcmi8zkEeywdAL7+wfE
         p8X+mM+++WCMoCoChMhqwW4Fm7gBJpU0beCvnPxhbs/eD9cqWpb0kggr9EARvPN2can/
         ErN8y0VzPWxXIS8rLozJey9eSjpVQLhxWdQ4llCOYZpStsB+cGG1tUkO1ZRwl+PkAmvL
         wWH5GiNn5vt20Nf87It2fzpqVWybuaxq5Zu4OhwA+94gGVhDqSBa2ZVtyoDq3UyVG7BX
         xdnw==
X-Gm-Message-State: AOAM533cXirbEv88sLJcpDtkMUp4iL7VO2q0upvh8i9lEAN7by28bqDr
	sP1YEGDF9jp5xk/i/dSkmeA=
X-Google-Smtp-Source: ABdhPJwdJCSwjPQz/d3YELH4jaV62xwWdNSbb8pq2BBMjTyUK5jFWfMIgO1faw5IqwGnhGPHe2eX2A==
X-Received: by 2002:adf:d085:: with SMTP id y5mr3953229wrh.41.1609932336314;
        Wed, 06 Jan 2021 03:25:36 -0800 (PST)
Date: Wed, 6 Jan 2021 11:25:34 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, Olaf Hering <olaf@aepfle.de>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC10 [and
 1 more messages]
Message-ID: <20210106112534.7hot2rbicv56nei4@liuwe-devbox-debian-v2>
References: <osstest-158191-mainreport@xen.org>
 <20210104115223.25403-1-olaf@aepfle.de>
 <20210105115708.aq2nfk3x4cnizzws@liuwe-devbox-debian-v2>
 <24565.40383.481245.649560@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24565.40383.481245.649560@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716

On Wed, Jan 06, 2021 at 11:23:43AM +0000, Ian Jackson wrote:
> Wei Liu writes ("Re: [PATCH v1] tools: ipxe: update for fixing build with GCC10"):
> > On Mon, Jan 04, 2021 at 12:52:23PM +0100, Olaf Hering wrote:
> > > Update to v1.21.1 to fix build in Tumbleweed, which has been broken
> > > since months due to lack of new release.
> > > 
> > > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> > 
> > Acked-by: Wei Liu <wl@xen.org>
> ...
> > > -IPXE_GIT_TAG := 1dd56dbd11082fb622c2ed21cfaced4f47d798a6
> > > +IPXE_GIT_TAG := 988d2c13cdf0f0b4140685af35ced70ac5b3283c
> 
> Unfortunately this broke the build, but it's not really your fault:
> 
> osstest service owner writes ("[xen-unstable-smoke test] 158191: regressions - FAIL"):
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  build-amd64                   6 xen-build                fail REGR. vs. 158134
> 
> --2021-01-06 01:27:19--  http://xenbits.xen.org/xen-extfiles/ipxe-git-988d2c13cdf0f0b4140685af35ced70ac5b3283c.tar.gz
> Resolving cache (cache)... 172.16.148.6
> Connecting to cache (cache)|172.16.148.6|:3128... connected.
> Proxy request sent, awaiting response... 404 Not Found
> 
> We currently insist on having have a tarball.
> 
> That means someone (me, I guess) has to do a "git archive" and put the
> resulting tarball in the right place on xenbits.  Unfortunately this
> is still manual, but we don't update ipxe very often.
> 

Wouldn't the build host just fetch from the upstream git tree? That's
why I didn't ask you to make a tarball -- I was waiting to see if this
could pass osstest before asking.

> I have made the tarball now.

Thanks.

Wei.

> 
> Ian.

