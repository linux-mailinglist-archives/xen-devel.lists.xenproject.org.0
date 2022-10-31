Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9036361312E
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 08:24:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432679.685356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opP9M-0004fD-Lm; Mon, 31 Oct 2022 07:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432679.685356; Mon, 31 Oct 2022 07:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opP9M-0004cz-J7; Mon, 31 Oct 2022 07:24:00 +0000
Received: by outflank-mailman (input) for mailman id 432679;
 Mon, 31 Oct 2022 07:23:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eVFZ=3A=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1opP9L-0004cg-DZ
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 07:23:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb22addb-58ec-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 08:23:57 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B15C60FF8;
 Mon, 31 Oct 2022 07:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79924C433C1;
 Mon, 31 Oct 2022 07:23:55 +0000 (UTC)
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
X-Inumbo-ID: fb22addb-58ec-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667201035;
	bh=/l+bnPa+QpO2aKJ1A1iRYqzj0CbaaJY5jam4oQUCoSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRkFDgMKqIQ4lED1kKnYIKCcFBuVk1Zi0YPILaM1iY5qbtHyYN3ri3myorYz7IcQu
	 wvMWiZgVCgHAxcJVbOmuFF9ZVhve3VJ3O04Luq6l+RPJsNhrG1WDS5CUO5xHA4svuj
	 G5WWNLvDlTguUdrqyOBSaCZSE9cZyQu5ymYMZNgY=
Date: Mon, 31 Oct 2022 08:24:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Sasha Levin <sashal@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/3] Stable backports of gntdev fixes
Message-ID: <Y194Q9lH3ye4jJOU@kroah.com>
References: <20221030071243.1580-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221030071243.1580-1-demi@invisiblethingslab.com>

On Sun, Oct 30, 2022 at 03:12:40AM -0400, Demi Marie Obenour wrote:
> I backported the recent gntdev patches to stable branches before 5.15.
> The first patch is a prerequisite for the other backports.  The second
> patch should apply cleanly to all stable branches, but the third only
> applies to 5.10 as it requires mmu_interval_notifier_insert_locked().

Patches 1 and 2 now queued up, see my comments on 3.

thanks,

greg k-h

