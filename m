Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1827F8A35FD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 20:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704927.1101484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvLwr-0002FL-Rb; Fri, 12 Apr 2024 18:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704927.1101484; Fri, 12 Apr 2024 18:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvLwr-0002Cq-ON; Fri, 12 Apr 2024 18:48:29 +0000
Received: by outflank-mailman (input) for mailman id 704927;
 Fri, 12 Apr 2024 18:48:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvpr=LR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rvLwq-0002Ck-H6
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 18:48:28 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f28f0ef-f8fd-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 20:48:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B8D008285559;
 Fri, 12 Apr 2024 13:48:25 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id jltsAkYqeK85; Fri, 12 Apr 2024 13:48:25 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F3B778285A14;
 Fri, 12 Apr 2024 13:48:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bYCYhlLHu1ag; Fri, 12 Apr 2024 13:48:24 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 4F8958285559;
 Fri, 12 Apr 2024 13:48:24 -0500 (CDT)
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
X-Inumbo-ID: 3f28f0ef-f8fd-11ee-b908-491648fe20b8
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F3B778285A14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712947705; bh=kENeRGPhMOykWIxdx17jsL3HY2MzI4Sa6hLn3wzgMEc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=n1BlcvFi8vjRXlxL2/+Dc/u7QZ3LmXAhHr1XCci9X9Lx1U97yonEwg0iAzJObtS2n
	 /qDKgQEYJLTAWRTAfKFHqW9oZxFBOET5xIcZQebTs3dUMeEX2QkYaOpdbvJuN4CY5D
	 do9eKphbU6XzGZMuCPCQtwuAfQNQkYPrM4MoXGRI=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <6bde77da-6ef8-4dc0-8690-6fa50fe47946@raptorengineering.com>
Date: Fri, 12 Apr 2024 13:48:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/link: Introduce a common BUGFRAMES definition
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
 <20240410184217.1482366-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240410184217.1482366-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 4/10/24 1:42 PM, Andrew Cooper wrote:
> Bugframe linkage is identical in all architectures.  This is not surprising
> given that it is (now) only consumed by common/virtual_region.c
> 
> Introduce a common BUGFRAMES define in xen.lds.h ahead of rearranging their
> structure.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

