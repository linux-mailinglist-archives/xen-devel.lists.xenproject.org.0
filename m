Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B752513FA4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 02:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316842.535935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkEhD-00031b-VU; Fri, 29 Apr 2022 00:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316842.535935; Fri, 29 Apr 2022 00:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkEhD-0002y4-Rp; Fri, 29 Apr 2022 00:41:19 +0000
Received: by outflank-mailman (input) for mailman id 316842;
 Fri, 29 Apr 2022 00:41:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nkEhC-0002iM-PR
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 00:41:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14814c0a-c755-11ec-8fc3-03012f2f19d4;
 Fri, 29 Apr 2022 02:41:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6FED62199;
 Fri, 29 Apr 2022 00:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F9BC385AD;
 Fri, 29 Apr 2022 00:41:15 +0000 (UTC)
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
X-Inumbo-ID: 14814c0a-c755-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651192876;
	bh=3p95qHdfTWDwcx/Qc1VWcALBiwNRhOcOPNJRRosJ71A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nE1EoPNL0VK+o/v90Mx3rHJDcwRf1HlspdQwtVBsJf7k+mpyKmK8frZ1iTRFF6Ns3
	 IIjBkkUMuFzsyVtPg69RBJBlRjxAC5Xzqk+7fBaeJe8TIYu4QZpd6Lc5Ym1MoKh6H7
	 GILkAWC4bB31he/LHESKP78ycssQdOzwI6W80gGDFolVSfew1TEM7hne8juhMjBFQt
	 sBEzDe8fWl/lYrXZFY+UWrynjMibEB4QQX0orJKbugRjOzsCikxS7WDkBEBVtez55H
	 G42+PYsNFAR1qW3FJrPM+P9aIIp51apnj+GHbNzmxUInpeQ7qAnY5xPLzVQp6B78gN
	 7mk3zYZq0xI+g==
Date: Thu, 28 Apr 2022 17:41:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
cc: Roger Pau Monne <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] cirrus-ci: add myself as maintainer
In-Reply-To: <e140ff85-184a-e642-6850-3a14c9ff597f@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2204281315420.915916@ubuntu-linux-20-04-desktop>
References: <20220428095549.91409-1-roger.pau@citrix.com> <e140ff85-184a-e642-6850-3a14c9ff597f@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1958550992-1651177243=:915916"
Content-ID: <alpine.DEB.2.22.394.2204281324350.915916@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1958550992-1651177243=:915916
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2204281324351.915916@ubuntu-linux-20-04-desktop>

On Thu, 28 Apr 2022, Andrew Cooper wrote:
> On 28/04/2022 10:55, Roger Pau Monne wrote:
> > Given the testing done by Cirrus-CI is FreeBSD only introduce a new
> > section in the MAINTAINERS file to cover it and add myself as the
> > maintainer.
> >
> > Requested-by: Stefano Stabellini <sstabellini@kernel.org>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > FWIW, I wouldn't mind it being part of the "Continuous Integration
> > (CI)" section, but I understand maintainers there could prefer a
> > separate section since this is ATM FreeBSD only testing.
> 
> I don't think we have enough review bandwidth to separate things like
> this.  Plenty of changes to CI are dependency tweaks which cover all CI
> files in one go, so wouldn't be directly relevant to being FreeBSD. 
> Also some CI changes need superpowers in other systems.


Today, gitlab-ci and cirrus-ci are entirely different systems: they
don't share any containers or any other artifacts. So my preference is
to have a separate entry in the MAINTAINERS file as Roger did in this
patch. That would be more accurate in terms of roles, responsibilities
and expectations. If someone sends a patch for .cirrus.yml, I definitely
think Roger should be the one to have a look. My recommendation is to go
ahead with this patch. We can always merge the sections in the future if
the CI systems become more integrated.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1958550992-1651177243=:915916--

