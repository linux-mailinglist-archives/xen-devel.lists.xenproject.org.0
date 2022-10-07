Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2B25F7E9C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 22:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418277.663052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogtqx-0000K1-RE; Fri, 07 Oct 2022 20:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418277.663052; Fri, 07 Oct 2022 20:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogtqx-0000HE-Oc; Fri, 07 Oct 2022 20:21:51 +0000
Received: by outflank-mailman (input) for mailman id 418277;
 Fri, 07 Oct 2022 20:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FwH6=2I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogtqx-0000H8-2o
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 20:21:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abac773d-467d-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 22:21:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D21A361747;
 Fri,  7 Oct 2022 20:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793CAC433D6;
 Fri,  7 Oct 2022 20:21:46 +0000 (UTC)
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
X-Inumbo-ID: abac773d-467d-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665174107;
	bh=9OcpNfdxowuCuZpBtOE0r/z8WUxNp3Cb1zXxvRedLZ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O/5nKnWWHEwNOyrth2TImx6RE2uH9RnaPalmza1/8vqf4V7CuJAuyWMAh4U468hEW
	 SHUrPxdmriFufGxVTwFo5d9XRYNSzDgoZkAP6L6POUK+5ZVvzmS3OeIrzCBbMFQ88p
	 0IqP0s6y/AEpv3/F14tNkAy8ZPLVGfySA5iwj04Yk/Qf4XBzBweSFgK8gODqXBt7I4
	 aMTW6PAKOy2iHNjz7w4hjXhRM/IYXbx5jiSho5WGXKkV8z4YjF88rexbbMx+vPwhGd
	 DP0O9BibbLQrdbteFBRNMP3mhjCGCoqOp94igA8mB/d5Axi1ObhFcsQjrpDIM24HDO
	 o747B5esXoCYQ==
Date: Fri, 7 Oct 2022 13:21:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dega kiran <degakiran05@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    mubin.sayyed@amd.com
Subject: Re: Free Rtos porting on XEN
In-Reply-To: <CADY+DPK7HQBYCPNoRf5KW6Zaqx6bF8fUrtywiR49zXiWkiC+zw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210071316300.3690179@ubuntu-linux-20-04-desktop>
References: <CADY+DPLf10UtUWE7Y9zZvN0NRFkGtV7ah3dg8t4wYWrF=8R2LQ@mail.gmail.com> <CADY+DPK7HQBYCPNoRf5KW6Zaqx6bF8fUrtywiR49zXiWkiC+zw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1388137786-1665173905=:3690179"
Content-ID: <alpine.DEB.2.22.394.2210071318580.3690179@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1388137786-1665173905=:3690179
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2210071318581.3690179@ubuntu-linux-20-04-desktop>

Hi Dega,

For Xen on Raspberry PI 4, that should work out of the box now and there
are a few users on xen-devel that got it to work successfully recently.
One of the documents that describes how to get Xen to run on RPi4 in
details is the following, although it is 2 years old now:
https://xenproject.org/2020/09/29/xen-on-raspberry-pi-4-adventures/

Specifically for FreeRTOS, I cannot help as I don't have any experience
with FreeRTOS outside of Xilinx boards. However, it might help you
to begin with Xilinx FreeRTOS, which is known to work on Xen, then try
to see how to port it to RPi4. The link I provided
(https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842141/FreeRTOS)
should have detailed information about Xilinx FreeRTOS.

Cheers,

Stefano



On Fri, 7 Oct 2022, dega kiran wrote:
> Hi Stefano Stabellini ,
> Thanks for the reply.
> 
> We are currently working on Raspberry PI 4 can you help us how we can port Xen with FreeRtos on Raspberry PI4.
> 
> Is there any reference I can go through for porting Xen with FreeRtos on Raspberry PI4.?
> 
> 
> Thanks and regards,
> Dega. 
> 
> On Tue, Oct 4, 2022 at 9:48 AM dega kiran <degakiran05@gmail.com> wrote:
>       Hi ,
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
--8323329-1388137786-1665173905=:3690179--

