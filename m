Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3945F39D2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 01:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415073.659559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofUqH-0004HO-IU; Mon, 03 Oct 2022 23:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415073.659559; Mon, 03 Oct 2022 23:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofUqH-0004E1-Em; Mon, 03 Oct 2022 23:27:21 +0000
Received: by outflank-mailman (input) for mailman id 415073;
 Mon, 03 Oct 2022 23:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KKGU=2E=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ofUqF-0004Dv-Gh
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 23:27:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb683119-4372-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 01:27:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6983B8167B;
 Mon,  3 Oct 2022 23:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C24C433D6;
 Mon,  3 Oct 2022 23:27:14 +0000 (UTC)
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
X-Inumbo-ID: eb683119-4372-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664839635;
	bh=n1G1gKmijZk8mLRTr/oFoNUHjS+2c8WH/ZowSIQldAE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DxT5XRQ0+JH4SpAzRDJlvB7LwsQEudN+zn41Y5N+M5KSlwMxt9+Ro4+XH8r5zl3H7
	 69pfVCGIgSsWl/yiIo1c2Fuyp0Zk7KZW/esRQoP+DNLQM63fL7AKfVM0JEyfEetbix
	 XdTQA+l3/k4EKMHXxIuP+043DofwgDujBYGm78tfu0MQdoV7uwdUdtDz3L8HPYv0fy
	 Qfthbr/BVSG0DXj7G6oeaI5BVm5Ea+2o3QLtdCLnGCA1lUWtPt6ozEJnVMnW8mcyJ7
	 B9HHrek4LMhHEDDE5HsepxAirc2Jp37sAnK7z/ngGh10GUo9QFV9Z4CMy32lrEKX0X
	 m3OVV5OEHA8pg==
Date: Mon, 3 Oct 2022 16:27:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: sarath chandu <ksc2093@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Artem_Mygaiev@epam.com, Bertrand.Marquis@arm.com
Subject: Re:Xen compatability and performance for imx8qm target with Andriod
 Auto as Guest Os
In-Reply-To: <CAFWs62=ZPLF6RTQawKH=5ofEtBsXf-hmUq+TPEX=b2Uwj1P=0g@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210031624531.3073309@ubuntu-linux-20-04-desktop>
References: <CAFWs62=ZPLF6RTQawKH=5ofEtBsXf-hmUq+TPEX=b2Uwj1P=0g@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2057666157-1664839503=:3073309"
Content-ID: <alpine.DEB.2.22.394.2210031625090.3073309@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2057666157-1664839503=:3073309
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2210031625091.3073309@ubuntu-linux-20-04-desktop>

Hi Sarath,

I am CCing Artem who might have more info on how to get Android to boot
on Xen.

From a Linux kernel perspective, you only need to enable CONFIG_XEN and
CONFIG_HVC_XEN in the kernel config and it should be able to boot.

Cheers,

Stefano


On Mon, 3 Oct 2022, sarath chandu wrote:
> Hi Team,
> I am trying to port xen hypervisor on i.MX8QM EVK. Planning to port xen-image as DOM0,
> Automotive Grade Linux as guest1 & Automotive Android as guest2.
> Can you please guide me with the steps for porting android as a guest?
> What are the drivers & packages that need to be included to achieve this?
> Looking forward to hearing from you.
--8323329-2057666157-1664839503=:3073309--

