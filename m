Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB7163482C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 21:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447291.703354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZsy-00051i-Pg; Tue, 22 Nov 2022 20:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447291.703354; Tue, 22 Nov 2022 20:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZsy-0004yK-MU; Tue, 22 Nov 2022 20:28:52 +0000
Received: by outflank-mailman (input) for mailman id 447291;
 Tue, 22 Nov 2022 20:28:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxZsx-0004yE-J3
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 20:28:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZsx-0007wd-Ct; Tue, 22 Nov 2022 20:28:51 +0000
Received: from [54.239.6.190] (helo=[192.168.0.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZsx-00041F-7k; Tue, 22 Nov 2022 20:28:51 +0000
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
	bh=QgVWXI4WMQiN9uNmu/rzhQzisfB1DR/xcOqqgXRAHJs=; b=ThSIttcHL4GyVJgC1/aHt3kCmM
	HW3SNAvifcbJmlGyLjkpIr1TALjnjuCRjyeBrrwSM7O+YJ8X1f7FJXu2s6OOmngLmDvkISq15oicp
	5DDh/6eM40Flh4e+SOpV5BQY8sQehzaMDb+FPkUVoTpmPbzyxgg9NkSo9wpU3OthyUkg=;
Message-ID: <5b239d4e-a75f-dccf-e4cd-232b623325f4@xen.org>
Date: Tue, 22 Nov 2022 21:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 1/3] xen/arm: Drop early_uart_init macro from
 debug-meson.inc
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221118114618.20754-1-michal.orzel@amd.com>
 <20221118114618.20754-2-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221118114618.20754-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 18/11/2022 11:46, Michal Orzel wrote:
> early_uart_init macro is only used if CONFIG_EARLY_UART_INIT is set.
> This config option depends on EARLY_UART_PL011, so there is no point
> in defining it for MESON, especially if it is empty. Remove it and adapt
> the existing comment.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall

