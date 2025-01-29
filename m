Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D76A21923
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 09:36:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878954.1289163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td3Z3-0003lD-SW; Wed, 29 Jan 2025 08:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878954.1289163; Wed, 29 Jan 2025 08:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td3Z3-0003io-PS; Wed, 29 Jan 2025 08:36:49 +0000
Received: by outflank-mailman (input) for mailman id 878954;
 Wed, 29 Jan 2025 08:36:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StUP=UV=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1td3Z2-0003ii-Bs
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 08:36:48 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c655b58-de1c-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 09:36:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 65540A4162B;
 Wed, 29 Jan 2025 08:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FABC4CED3;
 Wed, 29 Jan 2025 08:36:44 +0000 (UTC)
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
X-Inumbo-ID: 2c655b58-de1c-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738139804;
	bh=VW2r6/JfcXBwlJAM+bj3qoZydV8ADfVuANDZWaGlq1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0Szo1OP12RiVurJQJGyYYgqz6jPTKmhBt+YSI0rGbppuJQsW0C73y5fq1TtdVjv/
	 2/Jiy69mXaiswLMODjxzA/Ztcwsldv26K2UY920wT3S6CPdVh7lu21ptcTlJrqdeqt
	 b1rezmUmtUpPfyx6LBojtI0hxPdT+u8aG50sNHXU=
Date: Wed, 29 Jan 2025 09:35:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	stable@vger.kernel.org
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
Message-ID: <2025012919-series-chaps-856e@gregkh>
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>

On Wed, Jan 29, 2025 at 02:03:51PM +0530, Harshvardhan Jha wrote:
> Hi All,
> 
> +stable
> 
> There seems to be some formatting issues in my log output. I have
> attached it as a file.

Confused, what are you wanting us to do here in the stable tree?

thanks,

greg k-h

