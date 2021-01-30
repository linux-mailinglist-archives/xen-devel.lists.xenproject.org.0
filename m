Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB9309632
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 16:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78930.143691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5s7E-0006IF-7V; Sat, 30 Jan 2021 15:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78930.143691; Sat, 30 Jan 2021 15:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5s7E-0006Hq-3d; Sat, 30 Jan 2021 15:24:48 +0000
Received: by outflank-mailman (input) for mailman id 78930;
 Sat, 30 Jan 2021 15:24:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5C/p=HB=linuxfoundation.org=gregkh@kernel.org>)
 id 1l5s7C-0006Hk-5H
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 15:24:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9200cb69-81a2-46a5-994c-b42526dff8e2;
 Sat, 30 Jan 2021 15:24:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A24D164DED;
 Sat, 30 Jan 2021 15:24:43 +0000 (UTC)
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
X-Inumbo-ID: 9200cb69-81a2-46a5-994c-b42526dff8e2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1612020284;
	bh=LwThvucIGjOLsQSrFOF+2+R/stZNcgbNkWB9sGB3MNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zB8KJqu42VGvEtCYwZfH5dPPfnMfxDp+++khYsxBrwOEv1DHvc5FcLFCcNp9Cn+bM
	 yS8oZdFX9Id45ebW3iC5YCXo4MqPmdijq1PYSY3hwycnr5GjKLekKsuWi5roPw90Q0
	 t3pKcXB9h1R1c/tzsQTEEoAmm8xBFvdp7HaAfj0E=
Date: Sat, 30 Jan 2021 16:24:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.19.y] xen/privcmd: allow fetching resource sizes
Message-ID: <YBV6OeEQwG0gLEfY@kroah.com>
References: <YBPlDmlJTK78clC3@kroah.com>
 <20210129122215.19482-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129122215.19482-1-roger.pau@citrix.com>

On Fri, Jan 29, 2021 at 01:22:15PM +0100, Roger Pau Monne wrote:
> commit ef3a575baf53571dc405ee4028e26f50856898e7 upstream.
> 

Now queued up, thanks.

greg k-h

