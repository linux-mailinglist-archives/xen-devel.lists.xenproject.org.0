Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20373776D71
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 03:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581773.911172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTuJI-0005Tk-E3; Thu, 10 Aug 2023 01:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581773.911172; Thu, 10 Aug 2023 01:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTuJI-0005Qr-AZ; Thu, 10 Aug 2023 01:17:56 +0000
Received: by outflank-mailman (input) for mailman id 581773;
 Thu, 10 Aug 2023 01:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TqLc=D3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTuJH-0005Qg-66
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 01:17:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba1bef79-371b-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 03:17:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DBBE63AFF;
 Thu, 10 Aug 2023 01:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4852FC433C7;
 Thu, 10 Aug 2023 01:17:50 +0000 (UTC)
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
X-Inumbo-ID: ba1bef79-371b-11ee-b283-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691630270;
	bh=D0FGSftZn0DqRZGQRsIFnVzrT8ifJsbvF8WcTidNFKc=;
	h=Date:From:To:cc:Subject:From;
	b=vGt1lAl3DMlGPfxPuux/bJPf/+F/u1jSSzj7faBkETvxvwfAKVUJltV0/m0xiLtKu
	 9tzNFEW3V2XaxzWEzZ+HT4SIxPMlkHePn+OZQvVU2lTdzO3gPapJjPWSPs0Reo7TIB
	 SZEp3nWyp0yNIjqpam+UfRxEIA9cVUPoj0Ax8UY3G8MQB2U03uD8K6OWLt5Pp+lYwW
	 2QJPF3KgMg7Ahm3v4kuhMBX7CzhPy837g0jriHcmINyR+x8RrzvwTdkGXM3prjX660
	 vm8GIFRBbIImASzhTx6eDayvOxX0I/rBQXh3eVTyTwLdV9IzSWhO/+RkM0tMI53E+o
	 GOE5Datt18HsQ==
Date: Wed, 9 Aug 2023 18:17:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: michal.orzel@amd.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, cardoe@cardoe.com
Subject: [PATCH 0/2] automation: upgrade Alpine to 3.18
Message-ID: <alpine.DEB.2.22.394.2308091814450.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This short series introduces a painless upgrade to Alpine 3.18, given
that 3.12 is EOL.

Proof that it works:
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/961413389

Cheers,

Stefano

