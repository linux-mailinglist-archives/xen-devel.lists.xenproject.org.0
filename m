Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F3E7F5EC9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 13:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639685.997303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68Xi-00005w-Vo; Thu, 23 Nov 2023 12:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639685.997303; Thu, 23 Nov 2023 12:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68Xi-0008Vp-T1; Thu, 23 Nov 2023 12:10:50 +0000
Received: by outflank-mailman (input) for mailman id 639685;
 Thu, 23 Nov 2023 12:10:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r68Xh-0008Vj-UE
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 12:10:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r68Xh-0000z0-GG; Thu, 23 Nov 2023 12:10:49 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.16.119]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r68Xh-0002qL-62; Thu, 23 Nov 2023 12:10:49 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=OLST0NWFdQ9shqrCawlV1BK1r6ZD8DsWJMv4PdGyG1s=; b=eXteD45xVDLcqduKh6KpmZmjfS
	ItpGBnpNlZ5CMFgDkPhFC7LqlXuPr72DDYnUULshPlV9C+D7jiNZl+oYSbpgsvgKabg539BGCDPcH
	0Rr0u6fa2VqyrYySYZ5FEtu8QqTpqYyM8uo1H2xc1klxZNV0dPrxYqmY3KoMfdG0pPrI=;
Message-ID: <ba5839c9-c7fd-4ac4-99d4-8083e5bd409c@xen.org>
Date: Thu, 23 Nov 2023 12:10:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Drop image_name from efi_arch_handle_cmdline()
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20231123113712.1933421-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231123113712.1933421-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 23/11/2023 11:37, Andrew Cooper wrote:
> With all architectures no longer wanting an image name in the command line
> handling, drop the parameter and forgo making one up.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I am not sure if you need one Ack for the change in arm/efi/efi-boot.h. 
If you do:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

