Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CFEB16188
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 15:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064007.1429752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh6sO-0003YG-11; Wed, 30 Jul 2025 13:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064007.1429752; Wed, 30 Jul 2025 13:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh6sN-0003W1-UZ; Wed, 30 Jul 2025 13:29:47 +0000
Received: by outflank-mailman (input) for mailman id 1064007;
 Wed, 30 Jul 2025 13:29:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uh6sM-0003Vu-DS
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 13:29:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh6sL-009A2z-1s;
 Wed, 30 Jul 2025 13:29:45 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh6sL-00Gx2p-0v;
 Wed, 30 Jul 2025 13:29:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=UZf48GBdfAGvjbBZ+Umvu60CdCDqhoM/exrVcOHrM74=; b=R09vHi3FFeJy43lB/GRE6J5MHS
	7YFU3dafWYMZoR11IGpkzSxkvXZqFkKt0dcX6a730HeHUwosFsQDRyJr/yl/nWL26D85OWBJVGh9U
	e9W+95/t8nUCbDSm3mYaO1mb37RjMT/FhUUDG46JPg4z89pa29mFunL6w+HGj2Vp1YO0=;
Date: Wed, 30 Jul 2025 15:29:42 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v5 09/10] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Message-ID: <aIoeRugMIju0kdM8@l14>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <9f4a137980a0ee72f0f03d55176ca178c4b90126.1753184487.git.oleksii_moisieiev@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f4a137980a0ee72f0f03d55176ca178c4b90126.1753184487.git.oleksii_moisieiev@epam.com>

On Tue, Jul 22, 2025 at 11:41:41AM +0000, Oleksii Moisieiev wrote:
> This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
> (TF-A) which provides SCMI interface with multi-agnet support, as shown
> below.

[...]

> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  docs/man/xl.cfg.5.pod.in                    |  13 +
>  tools/libs/light/libxl_arm.c                |   4 +
>  tools/libs/light/libxl_types.idl            |   4 +-
>  tools/xl/xl_parse.c                         |  12 +

For the tools:
Acked-by: Anthony PERARD <anthony.perard@vates.tech> # tools

Thanks,

-- 
Anthony PERARD

