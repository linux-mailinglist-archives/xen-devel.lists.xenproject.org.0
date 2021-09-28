Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F2441ADB1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 13:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197909.351154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVB5p-0008Ue-HH; Tue, 28 Sep 2021 11:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197909.351154; Tue, 28 Sep 2021 11:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVB5p-0008SZ-Dq; Tue, 28 Sep 2021 11:16:13 +0000
Received: by outflank-mailman (input) for mailman id 197909;
 Tue, 28 Sep 2021 11:16:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s6b1=OS=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mVB5n-0008ST-HU
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 11:16:11 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id dd2e4523-fac9-46a5-9eaa-cd0e35859312;
 Tue, 28 Sep 2021 11:16:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E0FE6D;
 Tue, 28 Sep 2021 04:16:09 -0700 (PDT)
Received: from [10.57.20.114] (unknown [10.57.20.114])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB4563F7B4;
 Tue, 28 Sep 2021 04:16:06 -0700 (PDT)
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
X-Inumbo-ID: dd2e4523-fac9-46a5-9eaa-cd0e35859312
Subject: Re: [PATCH v2 01/11] vpci: Make vpci registers removal a dedicated
 function
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-2-andr2000@gmail.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <81b67339-08a5-402f-a60f-8db89a4e59da@arm.com>
Date: Tue, 28 Sep 2021 13:15:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210923125501.234252-2-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This is in preparation for dynamic assignment of the vpci register
> handlers depending on the domain: hwdom or guest.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v1:
>  - constify struct pci_dev where possible
> ---
>  xen/drivers/vpci/vpci.c | 7 ++++++-
>  xen/include/xen/vpci.h  | 2 ++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
Reviewed-by: Michal Orzel <michal.orzel@arm.com>


