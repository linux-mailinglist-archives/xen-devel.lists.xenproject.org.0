Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1286B3803BE
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 08:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127237.239088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhRaK-0004Jh-SR; Fri, 14 May 2021 06:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127237.239088; Fri, 14 May 2021 06:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhRaK-0004Go-PO; Fri, 14 May 2021 06:46:08 +0000
Received: by outflank-mailman (input) for mailman id 127237;
 Fri, 14 May 2021 06:46:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2xF=KJ=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1lhRaJ-0004GP-G4
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 06:46:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df222eb5-2d68-4ab5-946f-28489d10fe21;
 Fri, 14 May 2021 06:46:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EFC061447;
 Fri, 14 May 2021 06:46:05 +0000 (UTC)
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
X-Inumbo-ID: df222eb5-2d68-4ab5-946f-28489d10fe21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620974766;
	bh=LNWmhn0/F3I4Twb0AdNvtSFD/SzwC6jAdWvk+gwCZBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uzzpqMGgIXuJr7hx6CQqXRdBPKKVsMTrvIIkpwFFbwVDTtYHqNCe/yPEPrVV8UEAL
	 3hNZMO4oMAtJ2oG/vj2XYjiACDAP4egVyT0+ig0Nx2RKPsY1vw1irU7hw1fQYufOyV
	 4Jy1cf/CC5HV8+waMQMi7t8pk6sO5xt1+SSx5aNM=
Date: Fri, 14 May 2021 08:46:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Connor Davis <connojdavis@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	xen-devel@lists.xenproject.org, Lee Jones <lee.jones@linaro.org>,
	Jann Horn <jannh@google.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Douglas Anderson <dianders@chromium.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Petr Mladek <pmladek@suse.com>, Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [PATCH v2 0/4] Support xen-driven USB3 debug capability
Message-ID: <YJ4cqntf7YdZCOPk@kroah.com>
References: <cover.1620950220.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1620950220.git.connojdavis@gmail.com>

On Thu, May 13, 2021 at 06:56:47PM -0600, Connor Davis wrote:
> Hi all,
> 
> This goal of this series is to allow the USB3 debug capability (DbC) to be
> safely used by xen while linux runs as dom0.

Patch 2/4 does not seem to be showing up anywhere, did it get lost?

thanks,

greg k-h

