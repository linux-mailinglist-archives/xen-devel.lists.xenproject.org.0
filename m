Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D46DA4D151
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 02:58:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900734.1308644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpHXu-0000SV-ME; Tue, 04 Mar 2025 01:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900734.1308644; Tue, 04 Mar 2025 01:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpHXu-0000Qf-IW; Tue, 04 Mar 2025 01:58:10 +0000
Received: by outflank-mailman (input) for mailman id 900734;
 Tue, 04 Mar 2025 01:58:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBJn=VX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpHXu-0000QZ-1A
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 01:58:10 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1df6f9cc-f89c-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 02:58:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ED647A4522F;
 Tue,  4 Mar 2025 01:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A44C4CEE8;
 Tue,  4 Mar 2025 01:58:05 +0000 (UTC)
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
X-Inumbo-ID: 1df6f9cc-f89c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741053486;
	bh=7+eaKZP7MifaLKf+jE4z9qzQDfr6TvV7XBH4GX+i5uQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kV9JP0EpM/H8YxIEgmoBnL08nQ1j+J89LXgr6t5eSviqvWO354UDdyFNVVyF/4ops
	 wZKFUB8E1JN6MHvVwvXv+VvRgpsCd8hMZaa0WkWoKFviG1FtpM9w7Cq7G+sofT8qb0
	 QDeb9Boe7cluHYBWAhEUBsu2qH2RbDJHnYgdyITuSu8t0udj+oP6oPaVi1deHLRgyR
	 daBMCylJmVlekwtYOMKjPjv9kWMkJUThTyTpZV6VcT4qWWPZRKLICpXwYN6sNgMTTQ
	 4fjtRuVL/QAbuuKRXYXvLPkZCwrYSzG6JqkBOLwLCyr7/8+J69lw7C9tsXZhmasmBq
	 ygc56wbRIvLbQ==
Date: Mon, 3 Mar 2025 17:58:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Lira, Victor M" <VictorM.Lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, anthony@xenproject.org
Subject: Re: [RFC] CI: GitLab automatic pipeline deletion
In-Reply-To: <e93f215e-06c0-4a65-8e74-e849659541cc@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503031757510.1303386@ubuntu-linux-20-04-desktop>
References: <e93f215e-06c0-4a65-8e74-e849659541cc@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Good idea, I set it to 1 month

On Mon, 24 Feb 2025, Lira, Victor M wrote:
> Hello all,
> 
> We have discussed before the issue of Xen Project GitLab storage. The recent
> update to GitLab has the option to delete pipelines after a specified time
> from
> 1 day up to 1 year. By default it is disabled, meaning never deleted. I think
> we should consider enabling because it could help reduce the amount of storage
> being used, for example, by the job logs in xen-project/hardware/xen.
> 
> Here is an example of the data which could be freed in pipelines older than
> one
> year:
> https://gitlab.com/xen-project/hardware/xen/-/pipelines/951185943
> 
> https://docs.gitlab.com/ci/pipelines/settings/#automatic-pipeline-cleanup
> 
> Victor
> 

