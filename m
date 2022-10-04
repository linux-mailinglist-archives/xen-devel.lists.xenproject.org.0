Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E0D5F4727
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 18:08:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415694.660325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkT3-0006A3-HW; Tue, 04 Oct 2022 16:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415694.660325; Tue, 04 Oct 2022 16:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkT3-00067q-Ei; Tue, 04 Oct 2022 16:08:25 +0000
Received: by outflank-mailman (input) for mailman id 415694;
 Tue, 04 Oct 2022 16:08:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+z6g=2F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ofkT1-00067g-8m
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 16:08:23 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c403796d-43fe-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 18:08:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BDD62CE10EC;
 Tue,  4 Oct 2022 16:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799C9C433C1;
 Tue,  4 Oct 2022 16:08:14 +0000 (UTC)
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
X-Inumbo-ID: c403796d-43fe-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664899695;
	bh=Q9+9JGpyxi1fLq3uWb5W7vWerwlabA2Ce6TBCNzr9nY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GxZAPorQjmt6cdaELQcGvGGyNTW7uS6da91pp4YrMAbEx6qlR85yHy8NC8N0xm0pm
	 r3KoAIIBQPDYI9o/BeVGoKIdRqoKURJMprl5P1CrzyVfa3JLPWih+Ab7sTVGmlvnaI
	 CIQc3yrGnpZYDVIyNm7cMsh/ZfOaxxBOwDQaScjz2CQOOn7/a13AyTuTUOZnDjJHkY
	 o1traqO5+x1DYDzxQe4DGsyv9dk+TArNvtIbdnt7CAgp1kGM+LlQ6n6dDyhL/b6G2X
	 YAqEuzAbf0Z3tKY67QZHalRogaRiaX5MfUzEBlq8ZcuFzAa9yrksq/TSzAzp6KRp9v
	 XWwbL0F2S06Lg==
Date: Tue, 4 Oct 2022 09:08:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dega kiran <degakiran05@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, ulien Grall <julien@xen.org>
Subject: Re: Free Rtos porting on XEN
In-Reply-To: <CADY+DPLf10UtUWE7Y9zZvN0NRFkGtV7ah3dg8t4wYWrF=8R2LQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210040908020.3073309@ubuntu-linux-20-04-desktop>
References: <CADY+DPLf10UtUWE7Y9zZvN0NRFkGtV7ah3dg8t4wYWrF=8R2LQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1271568247-1664899429=:3073309"
Content-ID: <alpine.DEB.2.22.394.2210040903570.3073309@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1271568247-1664899429=:3073309
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2210040903571.3073309@ubuntu-linux-20-04-desktop>

Hi Dega,

AMD/Xilinx has a FreeRTOS port that works on Xen (at least on Xilinx
boards). The code is public and open source although typically to build
it you'd need the Vitis SDK.

The code itself is available here:
https://github.com/Xilinx/embeddedsw
https://github.com/Xilinx/embeddedsw/tree/master/ThirdParty/bsp/freertos10_xilinx

Also see:
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842141/FreeRTOS

I hope this helps.

Cheers,

Stefano

On Tue, 4 Oct 2022, dega kiran wrote:
> Hi ,
> I am trying to port FREERtos on XEN . But not getting any concrete information for porting.
> 
> I am following https://github.com/GaloisInc/FreeRTOS-Xen
> 
> but getting a lot of errors.
> 
> Please Let me know how to follow the porting process.
> 
> 
> Thank you,
> Dega.
> 
> 
> 
--8323329-1271568247-1664899429=:3073309--

