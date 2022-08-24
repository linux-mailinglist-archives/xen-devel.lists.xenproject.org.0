Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB8259F90D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 14:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392496.630882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpD8-0007ex-PE; Wed, 24 Aug 2022 12:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392496.630882; Wed, 24 Aug 2022 12:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpD8-0007cB-ME; Wed, 24 Aug 2022 12:10:18 +0000
Received: by outflank-mailman (input) for mailman id 392496;
 Wed, 24 Aug 2022 12:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZILy=Y4=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1oQpD7-0007c5-RZ
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 12:10:17 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6c6d14b-23a5-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 14:10:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C44BB823B5;
 Wed, 24 Aug 2022 12:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C901C433C1;
 Wed, 24 Aug 2022 12:10:13 +0000 (UTC)
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
X-Inumbo-ID: b6c6d14b-23a5-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661343013;
	bh=F2YLkXUGAvRl48RIOlzNr8FE+/+6p1ERwGx5pTSE3VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1pH/UocznpjiCps8ensqsYUuh19qmlT006/eMPQ3gvPUu6eOHTHt0zXjoqQvngdD1
	 niBCxTh988+N28oSV/So4zv6nyfX8NiycP73fCS0AecxtnvX02Yf5+GG8MTmwTntKu
	 AxiHCRRSpKqRutyAOpKguKlgTG/b9rUhKchZ8Kh4=
Date: Wed, 24 Aug 2022 14:10:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Backport request
Message-ID: <YwYVIgnHnKUnoChu@kroah.com>
References: <f02f8fb3-2e68-a405-aaef-adc769754bd3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f02f8fb3-2e68-a405-aaef-adc769754bd3@suse.com>

On Wed, Aug 24, 2022 at 01:20:22PM +0200, Juergen Gross wrote:
> Hi Greg,
> 
> stable kernels 5.18 and 5.15 seem to be missing upstream patch
> c64cc2802a78 ("x86/entry: Move CLD to the start of the idtentry macro").
> This is a prerequisite patch for 64cbd0acb582 ("x86/entry: Don't call
> error_entry() for XENPV"), which is included in 5.15.y and 5.18.y.
> 
> Could you please take c64cc2802a78 for 5.15 and 5.18?

5.18 is end-of-life, so that's impossible to do now :(

For 5.15.y, the commit does not apply cleanly, can you provide a working
backport?

thanks,

greg k-h

