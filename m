Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F31506537
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 08:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307793.523107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nghoo-0002ek-3u; Tue, 19 Apr 2022 06:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307793.523107; Tue, 19 Apr 2022 06:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nghon-0002ce-Va; Tue, 19 Apr 2022 06:58:33 +0000
Received: by outflank-mailman (input) for mailman id 307793;
 Tue, 19 Apr 2022 06:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uEip=U5=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nghom-0002bg-Bq
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 06:58:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1f351a45-bfae-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 08:58:31 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ABAE1042;
 Mon, 18 Apr 2022 23:58:30 -0700 (PDT)
Received: from [10.57.11.171] (unknown [10.57.11.171])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB9DF3F766;
 Mon, 18 Apr 2022 23:58:27 -0700 (PDT)
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
X-Inumbo-ID: 1f351a45-bfae-11ec-8fbe-03012f2f19d4
Message-ID: <622c2361-c8e2-eca8-14b3-1051845bba59@arm.com>
Date: Tue, 19 Apr 2022 08:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V6 1/2] xen/arm: Add i.MX lpuart driver
Content-Language: en-US
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, sstabellini@kernel.org,
 julien@xen.org, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>, Henry Wang <Henry.Wang@arm.com>
References: <20220419043927.23542-1-peng.fan@oss.nxp.com>
 <20220419043927.23542-2-peng.fan@oss.nxp.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220419043927.23542-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Peng,

On 19.04.2022 06:39, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX LPUART Documentation:
> https://www.nxp.com/webapp/Download?colCode=IMX8QMIEC
> Chatper 13.6 Low Power Universal Asynchronous Receiver/
> Transmitter (LPUART)
> 
> Tested-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

