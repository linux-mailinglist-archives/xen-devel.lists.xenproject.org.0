Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC553ED304
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 13:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167281.305345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFafE-0005Pf-U0; Mon, 16 Aug 2021 11:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167281.305345; Mon, 16 Aug 2021 11:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFafE-0005Ls-PN; Mon, 16 Aug 2021 11:20:20 +0000
Received: by outflank-mailman (input) for mailman id 167281;
 Mon, 16 Aug 2021 11:20:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0BJ1=NH=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1mFafD-0005Ed-B2
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 11:20:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2df73ba6-2e98-4fac-932f-aa9f4a275520;
 Mon, 16 Aug 2021 11:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66E7761B5D;
 Mon, 16 Aug 2021 11:20:14 +0000 (UTC)
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
X-Inumbo-ID: 2df73ba6-2e98-4fac-932f-aa9f4a275520
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629112814;
	bh=tvuOcAsTqYNr9qumWqjlIbRaX5HA1Ww35jwIsEFbzNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSuS15gqRTRYtrNyAh5VROOjJ7/FeAEVolJ/HiQCsiiKkFJD9EB1W/P+X4oCEXNyi
	 2JIWdQ+sDNuH2aH3udfvOSevqpV7eaIaXZ5WM+ouNQsolqoN1vLTn99lSmbx6e40Fe
	 wpQuzbUPfvIUkfdVcjXsg/wnPCU2vtIc+1ajx0fg=
Date: Mon, 16 Aug 2021 13:20:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: Request for adding patch to stable-5.13
Message-ID: <YRpJ7O+ftUh1xa+t@kroah.com>
References: <954399ab-d057-47c1-e417-0848a466fed2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <954399ab-d057-47c1-e417-0848a466fed2@suse.com>

On Mon, Aug 16, 2021 at 01:09:52PM +0200, Juergen Gross wrote:
> Greg,
> 
> could you please add upstream commit 05d69d950d9d8 ("xen-blkfront:
> sanitize the removal state machine") to the stable 5.13 kernel?
> 
> The patch seems not to have a "Cc: stable" tag while it fixes an
> issue introduced in 5.13.

Please always cc: stable@vger.kernel.org with these requests in the
future...

Anyway, the commit does not cleanly apply, so we will need a working
backport if you want to see it added to that tree.

thanks,

greg k-h

