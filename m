Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5757598FDD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 00:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389814.626959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOnbI-0007aZ-BQ; Thu, 18 Aug 2022 22:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389814.626959; Thu, 18 Aug 2022 22:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOnbI-0007Ym-7l; Thu, 18 Aug 2022 22:02:52 +0000
Received: by outflank-mailman (input) for mailman id 389814;
 Thu, 18 Aug 2022 22:02:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2I5=YW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oOnbG-0007Yg-I4
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 22:02:50 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fa60cbb-1f41-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 00:02:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0C688B821F3;
 Thu, 18 Aug 2022 22:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC4FC433D6;
 Thu, 18 Aug 2022 22:02:46 +0000 (UTC)
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
X-Inumbo-ID: 7fa60cbb-1f41-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660860167;
	bh=66MHEqgacifMYHlGPJDL6vHpddMit9yKPTRA+6tWWlg=;
	h=Date:From:To:cc:Subject:From;
	b=BT8XqDlpR1ktZ4f2IzvRbQ1Hr+QH4JIzCP/QqrgfkruoksNRwDY+d/98rgayxqkMH
	 leOIDmK1A88GskCfemXR2ySgM+yUDOL2FHx3lpg1OV/JZXeFXgu+hFKfe3xmyeEsXw
	 HG8C9XwXXxRi+8bse6hplknQF0VrGUSuq2j/65DDzWCvG1cHaB8mjRSYsUEtnF+g2k
	 3A5U5FiNNl+1arVJlqRzkI29vk0p0gapOd0X6atlrQvQTItMp4VUacfT7lvz6ce/CY
	 ZgEVPCIFUF09Z32p8NdsfLHdJk0L5oe1Y/0p4qqTiFz7grWLC+OJtx5auZlThkpas7
	 xuvPSOaworh8w==
Date: Thu, 18 Aug 2022 15:02:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, jbeulich@suse.com, 
    george.dunlap@citrix.com, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
Subject: [PATCH v2 0/3] introduce SPDX
Message-ID: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
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

