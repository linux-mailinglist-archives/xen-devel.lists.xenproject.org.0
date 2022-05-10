Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D4521013
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 10:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325310.547824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noLbn-000385-Bd; Tue, 10 May 2022 08:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325310.547824; Tue, 10 May 2022 08:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noLbn-000356-8S; Tue, 10 May 2022 08:52:43 +0000
Received: by outflank-mailman (input) for mailman id 325310;
 Tue, 10 May 2022 08:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pA66=VS=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1noLbm-000350-34
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 08:52:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8c46bf0c-d03e-11ec-a406-831a346695d4;
 Tue, 10 May 2022 10:52:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9DD211FB;
 Tue, 10 May 2022 01:52:39 -0700 (PDT)
Received: from [10.57.3.29] (unknown [10.57.3.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 877CD3F66F;
 Tue, 10 May 2022 01:52:38 -0700 (PDT)
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
X-Inumbo-ID: 8c46bf0c-d03e-11ec-a406-831a346695d4
Message-ID: <462ed3d7-df90-6d57-90f2-c5991d47a783@arm.com>
Date: Tue, 10 May 2022 10:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] xen/arm: Avoid overflow using MIDR_IMPLEMENTOR_MASK
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220505115906.380416-1-michal.orzel@arm.com>
 <YnO/bIw/bG8hMNx+@arm.com> <a96bc62d-8bf8-1507-5838-8e29297bc775@arm.com>
 <e790fa9f-6b13-112f-6849-24fc46a91a89@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <e790fa9f-6b13-112f-6849-24fc46a91a89@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 10.05.2022 10:27, Julien Grall wrote:
> 
> Therefore, I would simply on top of Origin:
> 
> [The commit ID may be different in linus' tree]
> 
Could you please do that on commit as this is just one line of commit change?

Thanks,
Michal

