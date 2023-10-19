Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17DF7CECDA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 02:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618845.963043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtH41-0003SD-Ow; Thu, 19 Oct 2023 00:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618845.963043; Thu, 19 Oct 2023 00:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtH41-0003PE-Lq; Thu, 19 Oct 2023 00:39:01 +0000
Received: by outflank-mailman (input) for mailman id 618845;
 Thu, 19 Oct 2023 00:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtH41-0003P8-65
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 00:39:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e41280ee-6e17-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 02:38:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E517618EA;
 Thu, 19 Oct 2023 00:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5ADC433C7;
 Thu, 19 Oct 2023 00:38:56 +0000 (UTC)
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
X-Inumbo-ID: e41280ee-6e17-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697675937;
	bh=3p2eNKsp+RZLgZJNpenHd8/mHUMfhC/dXO9hXn9r/KI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ap2wym640smzN/rbj9Fq89Ne13IL5RgHddI+v3ZmTH2T/W04ii7VHLwOxBV30UPAM
	 DZIRoP95NTvi3ccMH5qZq5D/1cRb6s5FLQoauS8+3vPSQfpfKGH56W1pzRfTv+Ts/5
	 tHcpRLQ/PA6YYcD+fdEx7eVOgGy7HwDx/do0zjj3pZQtVZLOuncxko0zibh6RklSOC
	 UOGfu9xsPvYE5uvEJJEdBCn0fQYtjn9wJpG1eJ9y0vUgn30CD3hyTrOQoxVmR0y2dP
	 sL7MX48HyoFjcfYhDtud5pAFsyraHsoP4LXIqft9cQRQDS9qy9ScI7IO9epa2p1iOT
	 rohG/9UGz4dgg==
Date: Wed, 18 Oct 2023 17:38:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2] arm/gic: add missing parameter names and uniform
 function declarations
In-Reply-To: <f22122c2b82f704dff17a455877c213940b54cc7.1697633691.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310181738480.965337@ubuntu-linux-20-04-desktop>
References: <f22122c2b82f704dff17a455877c213940b54cc7.1697633691.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Oct 2023, Federico Serafini wrote:
> Add missing parameter names and remove inconsistencies between GICv3
> and GICv2. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


