Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DE15658F5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 16:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360408.589772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8NRK-0008Ar-Nf; Mon, 04 Jul 2022 14:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360408.589772; Mon, 04 Jul 2022 14:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8NRK-000887-K8; Mon, 04 Jul 2022 14:52:42 +0000
Received: by outflank-mailman (input) for mailman id 360408;
 Mon, 04 Jul 2022 14:52:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xLCI=XJ=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1o8NRK-00083E-35
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 14:52:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9d413ef-fba8-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 16:52:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D307C616C3;
 Mon,  4 Jul 2022 14:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E2FC341C7;
 Mon,  4 Jul 2022 14:52:36 +0000 (UTC)
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
X-Inumbo-ID: e9d413ef-fba8-11ec-a8e4-439420d8e422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656946357;
	bh=LIYr9+dvUPXHdqT57p+QLfFXRhEoMDsFddMZtxJOwQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TEj+veg8Ns/HOQMd5827fiNjKDfi9hkTTGO+KliDeinMA9axI/rLwZgxqAwFDBIwX
	 GE655zV5svDtt4tKZuyOkfFmOQNUp2JhGId6qJIusWuDmzyBZDQ2RQf6cvvM4h0+L8
	 t02R5wSQ+YrYkgTLPyprkSqU2eN8UCHCfqNKs6Z0=
Date: Mon, 4 Jul 2022 16:52:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	stable@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: Hopefully correct backports for gntdev deadlock
Message-ID: <YsL+sntDIAtkruRb@kroah.com>
References: <20220701000951.5072-1-demi@invisiblethingslab.com>
 <a66f85f9-6182-ea1e-bb9b-18ac04d0ecea@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a66f85f9-6182-ea1e-bb9b-18ac04d0ecea@suse.com>

On Mon, Jul 04, 2022 at 03:46:12PM +0200, Juergen Gross wrote:
> On 01.07.22 02:09, Demi Marie Obenour wrote:
> > This backports "xen/gntdev: Avoid blocking in unmap_grant_pages()" to
> > the various stable trees, hopefully correctly.
> > 
> 
> I have reviewed all backports and they seem correct to me.
> 
> Greg, I'm fine with you adding the backports to the related stable
> branches.

Thanks, now queued up.

greg k-h

