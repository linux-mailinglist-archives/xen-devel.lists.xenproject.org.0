Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AC1438006
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 23:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215282.374373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me2VZ-0003aL-MQ; Fri, 22 Oct 2021 21:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215282.374373; Fri, 22 Oct 2021 21:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me2VZ-0003YZ-Hy; Fri, 22 Oct 2021 21:55:25 +0000
Received: by outflank-mailman (input) for mailman id 215282;
 Fri, 22 Oct 2021 21:55:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TWKL=PK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1me2VX-0003YT-NY
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 21:55:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c14528dc-3382-11ec-83d8-12813bfff9fa;
 Fri, 22 Oct 2021 21:55:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1B316103E;
 Fri, 22 Oct 2021 21:55:21 +0000 (UTC)
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
X-Inumbo-ID: c14528dc-3382-11ec-83d8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634939721;
	bh=n+vbdMEFuwTpXUFzHCAvXJPchdixINluQl+quHVNYes=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=til73Gxe6FhbRABVm+GL6Bzr8Wuhr9BXYx0erqbsho7TqHrRdqUV34SGS1gjTX4kx
	 8lBV3QBnAkKvDSfg+RgLcRdg8vZONe9ddBDhvsIklYoLZx6WBtGWggHfCKMqIfDvbN
	 Rqkh+qWFwuaWiQGazlKdyLMXPSovYPeEdMir/knH1M3jvLki/HrKf0E/knMc8c5Cdn
	 BoDDz8b8xLT8xy8VkbTuBtKlD4r33gksbAaH7Ma0qPi4FMGaq9lccDPjUMR9plmt0X
	 G5X41z/14FgdvALUnZ7Hjw3SDJr+16OSsKY5FVR22o7WcgXwnwLf1SaXXxehOOsZHw
	 NcHq256N8EDsg==
Date: Fri, 22 Oct 2021 14:55:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    wl@xen.org, iwj@xenproject.org, andrew.cooper3@citrix.com, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation: actually build with clang for
 ubuntu-focal-clang* jobs
In-Reply-To: <alpine.DEB.2.21.2110220957220.2311@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2110221454060.2311@sstabellini-ThinkPad-T480s>
References: <20211022163644.547018-1-anthony.perard@citrix.com> <alpine.DEB.2.21.2110220957220.2311@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Oct 2021, Stefano Stabellini wrote:
> On Fri, 22 Oct 2021, Anthony PERARD wrote:
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

FYI I verified that the patch doesn't break gitlab-ci so as far as I am
concerned this patch can be committed any time. (I didn't commit it
myself to give more time in case someone might want to provide
additional feedback or voice any concern.)

