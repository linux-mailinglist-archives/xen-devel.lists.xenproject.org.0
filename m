Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B5508C3C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309456.525722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhCMD-0002ii-QD; Wed, 20 Apr 2022 15:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309456.525722; Wed, 20 Apr 2022 15:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhCMD-0002fS-Mm; Wed, 20 Apr 2022 15:35:05 +0000
Received: by outflank-mailman (input) for mailman id 309456;
 Wed, 20 Apr 2022 15:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Avzr=U6=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1nhCMC-0002es-J6
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:35:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7167e8f9-c0bf-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 17:35:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06C54618E5;
 Wed, 20 Apr 2022 15:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99049C385A1;
 Wed, 20 Apr 2022 15:34:59 +0000 (UTC)
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
X-Inumbo-ID: 7167e8f9-c0bf-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650468900;
	bh=uDbXPsQLU9tElHGZJOcUaYQxeuzg8LGzzXxfnfZ3DUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2XUPnrrd1R/EP512qBRWnWZ0CQzmEE6Dw1iC59OeDJXdfO3GGWuRLKz6WcqoeDl5D
	 ktQyyZiQMLceQAGZedyyRmhJKRXY6OJaEc4CrysGnOOyPPwAqL1T0Nl7QeGyvTwzTw
	 /8GKcnxqRD8SZj/o8/zLVJkX/GPJSmuHrvdGtQuU=
Date: Wed, 20 Apr 2022 17:34:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/18] xen/usb: switch xen-hcd to use INVALID_GRANT_REF
Message-ID: <YmAoIPJYoq65uybr@kroah.com>
References: <20220420150942.31235-1-jgross@suse.com>
 <20220420150942.31235-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420150942.31235-5-jgross@suse.com>

On Wed, Apr 20, 2022 at 05:09:28PM +0200, Juergen Gross wrote:
> Instead of using a private macro for an invalid grant reference use
> the common one.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/usb/host/xen-hcd.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

