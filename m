Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6612E99383D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 22:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812427.1225174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuN1-0008Ah-Em; Mon, 07 Oct 2024 20:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812427.1225174; Mon, 07 Oct 2024 20:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuN1-00087Z-CF; Mon, 07 Oct 2024 20:30:19 +0000
Received: by outflank-mailman (input) for mailman id 812427;
 Mon, 07 Oct 2024 20:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QHG9=RD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sxuMz-00087T-Fm
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 20:30:17 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5f9ec23-84ea-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 22:30:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8E084A404A3;
 Mon,  7 Oct 2024 20:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035B4C4CEC6;
 Mon,  7 Oct 2024 20:30:13 +0000 (UTC)
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
X-Inumbo-ID: f5f9ec23-84ea-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728333014;
	bh=sgKV1X920oNJ4s7lMbLjM0/ZB0gWwAgObClo78OlrU0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tM1wYyEQTqcVQ9K4lpt3SwSJM9GKwiezURPL0kmTXNgR8x2lH8D43x4ccCxebnrbl
	 W7+4kObsrhTLFGpMrmWFuIfmKR3ETbIpfg0n1yLVcrYpeT91R+OQOhP5TSzLDfA75X
	 2C6LBaMt0QxISscCdCZGGQZWSuygcmeriPCZxxD8G4pcLtF9PFBVdfGvCT/rbpCu3A
	 NoucO+ZzPJTds3uitYDQFtJkkaVBy1gc3RVopJ4plCl7rSdUe0nEpyd7H1T/1lRshJ
	 yt8YBIPfl1A9RH9hKzauBYry2qCXXBoMyhduQxft+zUERRUlA45r1O4Dkp0DrJKxHN
	 gelpaqB9dT7kA==
Date: Mon, 7 Oct 2024 13:30:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: use python-3.11 in Leap container
In-Reply-To: <a831b390-5136-40fd-8bc3-2b373ec0ec84@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2410071329270.3512606@ubuntu-linux-20-04-desktop>
References: <20241007152518.1416-1-olaf@aepfle.de> <a831b390-5136-40fd-8bc3-2b373ec0ec84@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1729065238-1728333014=:3512606"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1729065238-1728333014=:3512606
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 7 Oct 2024, Andrew Cooper wrote:
> On 07/10/2024 4:25 pm, Olaf Hering wrote:
> > python311 is available since Leap 15.4 as additional Python variant.
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

assuming it doesn't break the build:
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> I'm tempted to take and deploy this immediately.  Leap is already not
> building QEMU, and this patch doesn't change.

I am OK with that
--8323329-1729065238-1728333014=:3512606--

