Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CAC506513
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 08:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307785.523084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nghnP-0001lw-A3; Tue, 19 Apr 2022 06:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307785.523084; Tue, 19 Apr 2022 06:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nghnP-0001jN-70; Tue, 19 Apr 2022 06:57:07 +0000
Received: by outflank-mailman (input) for mailman id 307785;
 Tue, 19 Apr 2022 06:57:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uEip=U5=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nghnO-0001jH-CP
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 06:57:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id eb2c8f8d-bfad-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 08:57:04 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DCAF1042;
 Mon, 18 Apr 2022 23:57:04 -0700 (PDT)
Received: from [10.57.11.171] (unknown [10.57.11.171])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B47343F766;
 Mon, 18 Apr 2022 23:57:01 -0700 (PDT)
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
X-Inumbo-ID: eb2c8f8d-bfad-11ec-8fbe-03012f2f19d4
Message-ID: <c8b9385b-1b91-9009-f5f7-991ce5f3ecd5@arm.com>
Date: Tue, 19 Apr 2022 08:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V6 2/2] xen/arm: Add i.MX lpuart early printk support
Content-Language: en-US
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, sstabellini@kernel.org,
 julien@xen.org, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>
References: <20220419043927.23542-1-peng.fan@oss.nxp.com>
 <20220419043927.23542-3-peng.fan@oss.nxp.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220419043927.23542-3-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Peng,

On 19.04.2022 06:39, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

In the v5, I gave you R-by and Bertrand gave A-by so you should have
carried them as you haven't done any modificiation in this patch since v5.

Anyway,
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

