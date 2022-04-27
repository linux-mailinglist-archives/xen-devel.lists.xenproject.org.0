Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA521512334
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 21:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315427.533976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njno9-0005D9-5L; Wed, 27 Apr 2022 19:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315427.533976; Wed, 27 Apr 2022 19:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njno9-0005An-2K; Wed, 27 Apr 2022 19:58:41 +0000
Received: by outflank-mailman (input) for mailman id 315427;
 Wed, 27 Apr 2022 19:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1njno8-0005Ah-0e
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 19:58:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d6280a1-c664-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 21:58:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D2F261C63;
 Wed, 27 Apr 2022 19:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3A9C385A7;
 Wed, 27 Apr 2022 19:58:35 +0000 (UTC)
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
X-Inumbo-ID: 6d6280a1-c664-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651089515;
	bh=0skaRe9/dTpo0sKl70O40y9fwBoxLUIQiejabbKpoeM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZTunomGBONXA8LYD835RR55spnj95HGCcCIhPk1cw/B3kLg3/frNfIMiOgrvVC8x8
	 I4AXd9u6PGgxblzbyq1E1NVit+6/lkQe9uOPcUqPMMN35xIROBQVcplR0r2euLJU96
	 KJlPsiugvkDyTE/4xfblsEFxQVjNA3wViygvK4/ZCsUh6ii3lp3HYarZYz6l7rIfgu
	 zB+NEUp6qXBsWTseL8V4Op0fbClbh3TxjPrAT8Enzm+/WnJDHd4ogRJWR5oY+v7TYC
	 +RpTEvEGDQy3KyaimaMSVxh+ppiRXFM1f5in88dySPdBkaKDY2UGd7DKacFqoymJov
	 e8DX6gWsBh7RA==
Date: Wed, 27 Apr 2022 12:58:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: jbeulich@suse.com, andrew.cooper3@citrix.com, julien@xen.org, 
    Bertrand.Marquis@arm.com, roger.pau@citrix.com, george.dunlap@citrix.com, 
    xen-devel@lists.xenproject.org, Artem_Mygaiev@epam.com
Subject: Re: Xen MISRA C meeting
In-Reply-To: <alpine.DEB.2.22.394.2204251730000.915916@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2204271255570.915916@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2204251730000.915916@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Apr 2022, Stefano Stabellini wrote:
> Hi all,
> 
> I would like to schedule a meeting to discuss Xen and MISRA C with the
> Xen community. I have a proposal on how to make progress in terms of
> MISRA C adoption in Xen and I would like to get your feedback on it.
> 
> The meeting is open to anybody. The Xen x86 and ARM maintainers' input
> is required to make progress, please fill the Doodle poll by the end of
> Wed Apr 27 if possible.
> 
> https://doodle.com/meeting/participate/id/elY67vja
> 
> If no slots work in the Doodle poll for everyone we could consider
> re-using the Xen Community call slot (it is one of the Doodle poll
> slots).

Thank you all for participating. The best option available is Tuesday
May 3 at 8AM California / 4PM UK / 5PM Europe. Sorry for the people that
are not going to be able to attend, but I'll make sure to send out
detailed notes to xen-devel after the meeting.

I'll send out a meeting invite with the Zoom link.

I am looking forward to it!

