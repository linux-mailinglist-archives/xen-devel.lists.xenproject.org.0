Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1792EBD32
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 12:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62449.110615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx76O-0004HX-1x; Wed, 06 Jan 2021 11:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62449.110615; Wed, 06 Jan 2021 11:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx76N-0004H8-Ue; Wed, 06 Jan 2021 11:35:43 +0000
Received: by outflank-mailman (input) for mailman id 62449;
 Wed, 06 Jan 2021 11:35:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kx76M-0004H3-Q2
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:35:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kx76M-0007VN-Mm
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:35:42 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kx76M-0002o8-L0
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:35:42 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kx76H-0005nU-Uk; Wed, 06 Jan 2021 11:35:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=D2WOdfSSF1w2FEiysorHtjDievcQMPKHtDh1z+APteU=; b=61zDBTpxnSCxor/GkFiAs9fZ2H
	tY+hOOFCxi5SXu7hFjmqPPqUMFdSyrTdg/yI/Joa5E2Pli7o9MUXXpmiN8+ZyOha+OS+JQyzn2fCx
	FxNToex/7geOepOA8HUTtwOhprgZlSLKErgWTllEThxWRQuQQu6rq+ixlZ8v8MUHjhic=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24565.41097.737993.339167@mariner.uk.xensource.com>
Date: Wed, 6 Jan 2021 11:35:37 +0000
To: Wei Liu <wl@xen.org>
Cc: Ilaf Hering <olaf@aepfle.de>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC10 [and
 1 more messages]
In-Reply-To: <20210106112628.h7rh4wpnnzf2htbj@liuwe-devbox-debian-v2>
References: <osstest-158191-mainreport@xen.org>
	<20210104115223.25403-1-olaf@aepfle.de>
	<20210105115708.aq2nfk3x4cnizzws@liuwe-devbox-debian-v2>
	<24565.40383.481245.649560@mariner.uk.xensource.com>
	<20210106112534.7hot2rbicv56nei4@liuwe-devbox-debian-v2>
	<20210106112628.h7rh4wpnnzf2htbj@liuwe-devbox-debian-v2>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Wei Liu writes ("Re: [PATCH v1] tools: ipxe: update for fixing build with GCC10 [and 1 more messages]"):
> On Wed, Jan 06, 2021 at 11:25:34AM +0000, Wei Liu wrote:
> > Wouldn't the build host just fetch from the upstream git tree? That's
> > why I didn't ask you to make a tarball -- I was waiting to see if this
> > could pass osstest before asking.

The build system's ability to do that has been nobbled in osstest for
a very long time.

> Never mind. It seems that I have missed the change of requirement...

I don't think there has been a change.  But it's been a long time
since we did an ipxe update.

Ian.

