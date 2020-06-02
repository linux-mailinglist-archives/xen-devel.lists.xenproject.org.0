Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA811EB7E7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:07:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg2tL-0003Te-90; Tue, 02 Jun 2020 09:07:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVk0=7P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jg2tJ-0003TY-LD
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:07:25 +0000
X-Inumbo-ID: 790ce602-a4b0-11ea-abaf-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 790ce602-a4b0-11ea-abaf-12813bfff9fa;
 Tue, 02 Jun 2020 09:07:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c3so2524670wru.12
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 02:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bCtDczNiIvM6dn7XFsIWZta7yPzY8mB6emd9+VqAWQA=;
 b=XijJhpqa0EFASp6djiIX0/lZ/rTR2Ceww8YFiw44Ii3ZfRxu1vC82nUVFVPDMs/1xl
 ahuZwGh9NGfiu0yfbxvcNqvTPyy/c7kVCTn0BzFKE6wWfBmTofPvUGsgbuqGGDAUV+om
 RBdft/MKE6lZg5TOkmJRN0zqbMM+3C3zXue9mWP1HyKGbnp05anaXJNbIrJLPWbqkway
 NCwqWTppWM3f0VNg0UE3m3sBQaMPts2J+b89exo9XjVT59ev0dy/2fIjpx9oYv81z0te
 bnco8DA4779IrUKsbzAQsCKAQadXa0DV+khtM9d7g452dsilNngToCBJRj2J2g7eLRyy
 Uf8w==
X-Gm-Message-State: AOAM532HAnJY2y6oglzR+QTGaW6+BjRmucO36cw43OpZMqiAhrf7cgv1
 rfTqvIyrHhhSGrvhAGnMO/k=
X-Google-Smtp-Source: ABdhPJzamQgOM6bbB9fIxfy3bNy9BxSvHtSAcgK2Q8eJEDWcf0q2qgNDTEVWFIzEtOIHa24XGsDSqQ==
X-Received: by 2002:adf:ef47:: with SMTP id c7mr27502156wrp.57.1591088843647; 
 Tue, 02 Jun 2020 02:07:23 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w10sm2665858wrp.16.2020.06.02.02.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 02:07:23 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:07:21 +0000
From: Wei Liu <wl@xen.org>
To: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 0/3] Automation: improve openSUSE containers + podman
Message-ID: <20200602090721.r62ho7cagazgr2ji@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <158827088416.19371.17008531228521109457.stgit@Palanthas>
 <86969ba1ea7e270267cfaa3408a89b55c86b3dca.camel@suse.com>
 <78e986122386915cacba8b4c3b572a460f9622e1.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78e986122386915cacba8b4c3b572a460f9622e1.camel@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 12:20:25PM +0200, Dario Faggioli wrote:
> On Thu, 2020-05-21 at 09:43 +0200, Dario Faggioli wrote:
> > On Thu, 2020-04-30 at 20:27 +0200, Dario Faggioli wrote:
> > > Hello,
> > > 
> > > This short series contains some improvements for building Xen in
> > > openSUSE containers. In fact, the build dependencies inside the
> > > Tumbleweed container are updated and more handy helpers are added,
> > > in
> > > containerize, for referring to both Leap and Tumbleweed containers.
> > > 
> > > In addition to that, in patch 3, the containerize script is
> > > enhanced
> > > so
> > > that it is now possible to use podman, instead of docker. Rootless
> > > mode
> > > for podman also works (provided the system is properly configured)
> > > which,
> > > IMO, is rather nice.
> > > 
> > > Docker of course continue to work, and is kept as the default.
> > > 
> > Ping?
> >
> Ping^2? :-D
> 
> Adding Wei. get-maintainers.pl seems told me I should no Cc him, so I
> dind't, but I've seen automation/ stuff Acked-by him recently, so...

I think these are good improvements, so in Doug's absence:

Acked-by: Wei Liu <wl@xen.org>

You can already push to the container registries right?

Cc Paul. Gitlab CI is not gating pushes. I think there is very low risk
involved in committing this series during freeze.


> 
> Thanks and Regards
> -- 
> Dario Faggioli, Ph.D
> http://about.me/dario.faggioli
> Virtualization Software Engineer
> SUSE Labs, SUSE https://www.suse.com/
> -------------------------------------------------------------------
> <<This happens because _I_ choose it to happen!>> (Raistlin Majere)
> 



