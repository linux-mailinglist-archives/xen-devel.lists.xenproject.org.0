Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A32653F2F2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 02:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342743.567815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyN6j-0005O3-Mn; Tue, 07 Jun 2022 00:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342743.567815; Tue, 07 Jun 2022 00:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyN6j-0005Jy-IN; Tue, 07 Jun 2022 00:30:05 +0000
Received: by outflank-mailman (input) for mailman id 342743;
 Tue, 07 Jun 2022 00:30:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxjK=WO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nyN6h-0004sN-4w
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 00:30:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f813a3b8-e5f8-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 02:30:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89B8BB81C54;
 Tue,  7 Jun 2022 00:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC327C34119;
 Tue,  7 Jun 2022 00:29:59 +0000 (UTC)
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
X-Inumbo-ID: f813a3b8-e5f8-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654561800;
	bh=cWxrmJATm07wUGXJMvWhUjgKxdBBxFXIq1sX3C3q1pk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XG0Spwioyc+myXEVdQEsiIYSawyyHFXG3reRq4/EzZBvrdVmQTLURs+R9hlf5XNj0
	 Jyzfp8irwBQIH5dT1sqYSgyaHXBU9fVPar73Zy4dNqQe7a27yk1/2Dc8q/ZO83PjiU
	 SkZv0zrdp/BfaVXB6Aqe8zS6CuO52sEZOQpcySV0uC6l3SNlSgSDnsKXPF27TVBvp2
	 b5xm1bx7z+OCQqEtba1V5QHS076SDFqA4fogbeWtLuA1aLandUEDxA946EeKdAQHEE
	 ZnJeG+eFKKQnzPBNiWk7L/+Ot3zKtGZe7TzbsgsFb2dciZ+qyrrlULPYcfJwYM3xUC
	 xKBpxKnG4PgUw==
Date: Mon, 6 Jun 2022 17:29:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    jbeulich@suse.com, roger.pau@citrix.com, julien@xen.org, 
    Bertrand.Marquis@arm.com, George.Dunlap@citrix.com
Subject: Re: [PATCH v2 0/2] introduce docs/misra/rules.rst
In-Reply-To: <alpine.DEB.2.22.394.2205311816170.1905099@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2206061728420.277622@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205311816170.1905099@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 May 2022, Stefano Stabellini wrote:
> Hi all,
> 
> This patch series is a follow-up from the MISRA C meeting last Thursday,
> when we went through the list of MISRA C rules on the spreadsheet and
> agreed to accept into the Xen coding style the first ones, starting from
> Dir 2.1 up until Rule 5.1 (except for Rule 2.2) in descending popularity
> order.
> 
> This is the full list of accepted rules so far:
> 
> Dir 2.1
> Dir 4.7
> Dir 4.10
> Dir 4.14
> Rule 1.3
> Rule 3.2
> Rule 5.1
> Rule 6.2
> Rule 8.1
> Rule 8.4
> Rule 8.5
> Rule 8.6
> Rule 8.8
> Rule 8.12
> 
> This short patch series add them as a new document under docs/misra as a
> list in rst format. The file can be used as input to cppcheck using a
> small python script from Bertrand (who will send it to the xen-devel
> separately.)

The two patches are acked and I plan to commit them in a day or two.

