Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC4F50079B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 09:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304516.519169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neuHH-0004oj-9Y; Thu, 14 Apr 2022 07:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304516.519169; Thu, 14 Apr 2022 07:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neuHH-0004la-6a; Thu, 14 Apr 2022 07:52:31 +0000
Received: by outflank-mailman (input) for mailman id 304516;
 Thu, 14 Apr 2022 07:52:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iU0v=UY=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1neuHF-0004lO-Rb
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 07:52:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d4eecd6e-bbc7-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 09:52:28 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FBA5139F;
 Thu, 14 Apr 2022 00:52:28 -0700 (PDT)
Received: from [10.57.9.215] (unknown [10.57.9.215])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DB9E3F73B;
 Thu, 14 Apr 2022 00:52:25 -0700 (PDT)
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
X-Inumbo-ID: d4eecd6e-bbc7-11ec-a405-831a346695d4
Message-ID: <8fd66fe7-e5ea-7aab-50ed-f95ab3ccd8fc@arm.com>
Date: Thu, 14 Apr 2022 09:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V5 2/2] xen/arm: Add i.MX lpuart early printk support
Content-Language: en-US
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, sstabellini@kernel.org,
 julien@xen.org, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>
References: <20220414074452.14419-1-peng.fan@oss.nxp.com>
 <20220414074452.14419-3-peng.fan@oss.nxp.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220414074452.14419-3-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 14.04.2022 09:44, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

