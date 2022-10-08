Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F7C5F8178
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 02:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418359.663137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogxV8-000380-MD; Sat, 08 Oct 2022 00:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418359.663137; Sat, 08 Oct 2022 00:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogxV8-00035M-J6; Sat, 08 Oct 2022 00:15:34 +0000
Received: by outflank-mailman (input) for mailman id 418359;
 Sat, 08 Oct 2022 00:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZrwE=2J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogxV6-00035E-TF
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 00:15:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51292a78-469e-11ed-964a-05401a9f4f97;
 Sat, 08 Oct 2022 02:15:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AFF060EB7;
 Sat,  8 Oct 2022 00:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7A1C433C1;
 Sat,  8 Oct 2022 00:15:27 +0000 (UTC)
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
X-Inumbo-ID: 51292a78-469e-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665188128;
	bh=66MHEqgacifMYHlGPJDL6vHpddMit9yKPTRA+6tWWlg=;
	h=Date:From:To:cc:Subject:From;
	b=PiUavO+l63Z10gGUDX9yI0EUvRRUaraIWQduPdARl/uCJ1Zh6CSJHFaOjYSIXKo8e
	 0+BLm3DbCDN5qrNnM9Q5f4emg6buFulkbaONh65tSfmO1TdLwcU9Qvl/x5LKocKQ6z
	 KWJCkQDLh6hg8Pq32Jy/Yj279tlQQfOTr37zo+KMM9ofjI8ZMMXv4hUZHEloh97P9H
	 WwFVo1Mi3RPWRzhNqrSLz/5qAQBPB5MMfjcfFbdrX4TJaMQk5WX9axfPqwnXp3tQor
	 FRY06+1LoGeDaicSJcYqlq1rRtPNiYfnunR+Z6qgEZn8hOSqfPE8MjovXuQNkuTnZh
	 PeAtTFidAZWsQ==
Date: Fri, 7 Oct 2022 17:15:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, jbeulich@suse.com, 
    george.dunlap@citrix.com, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
Subject: [PATCH v3 0/4] introduce SPDX
Message-ID: <alpine.DEB.2.22.394.2210071710070.3690179@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This small series introduces SPDX tags to Xen:

1) add a mention to SPDX in CODING_STYLE
2) add a LICENSES directory with licenses and SPDX tags
3) adds the SPDX single-line comment to arch/arm/*.c

Note that arch/arm/*.c is just a start. Also, to make the changes as
mechanical as possible I restricted myself to:
- adding the single-line comment at the top of the file
- removing the copyright lines (when present) from the top of the file
  header

I purposedly restrained myself to do other cleanups to the headers: this
series already touches many files and I prefer to keep these changes as
mechanical as possible. Further improvements (style improvement,
removing what's left of the header, removing copyright lines, etc.) can
be done with subsequent patches more easily.

License changes are not intentional.

Cheers,

Stefano

