Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40A56C793
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jul 2022 08:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363737.594440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA42p-0007Ja-4V; Sat, 09 Jul 2022 06:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363737.594440; Sat, 09 Jul 2022 06:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA42p-0007Hf-1J; Sat, 09 Jul 2022 06:34:23 +0000
Received: by outflank-mailman (input) for mailman id 363737;
 Sat, 09 Jul 2022 06:34:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dTtf=XO=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1oA42n-0007HZ-RK
 for xen-devel@lists.xenproject.org; Sat, 09 Jul 2022 06:34:21 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28c7ac30-ff51-11ec-924f-1f966e50362f;
 Sat, 09 Jul 2022 08:34:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AA552CE2E97;
 Sat,  9 Jul 2022 06:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956ECC3411C;
 Sat,  9 Jul 2022 06:34:12 +0000 (UTC)
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
X-Inumbo-ID: 28c7ac30-ff51-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657348453;
	bh=2uTm3WC6wxy89V7V/4cci/5HmlCO92Cyj+BDgD/BNfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCBWD3s4U8kA4iVEWKblTdkSCNRCHOfNLpLNLmDlorBjcJyIIsm6Gg0jieTau6y2+
	 8NJEmjoY7DtJ39rJgF+Ovd3Vjg3gGv+U+Cq/3gBKuYUi2DOiWvfQBqfzG06nMU2Qu+
	 8UgwaK/hNQT6DH23pMYCoeHk+UPWkW14mhefAbi0=
Date: Sat, 9 Jul 2022 08:34:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>,
	Linux kernel regressions <regressions@lists.linux.dev>,
	stable@vger.kernel.org,
	Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: gntdev warning fixes
Message-ID: <YskhYmJFg2KgYF3n@kroah.com>
References: <20220708163750.2005-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708163750.2005-1-demi@invisiblethingslab.com>

On Fri, Jul 08, 2022 at 12:37:44PM -0400, Demi Marie Obenour wrote:
> The recent gntdev fixes introduced two incorrect WARN_ON()s, which
> triggered immediately on my system.  Patches for master and all
> supported stable versions follow.
> 
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

