Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597126A2ADD
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 17:49:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501794.773555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVxjY-00079X-6C; Sat, 25 Feb 2023 16:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501794.773555; Sat, 25 Feb 2023 16:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVxjY-00076o-3X; Sat, 25 Feb 2023 16:49:16 +0000
Received: by outflank-mailman (input) for mailman id 501794;
 Sat, 25 Feb 2023 16:49:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVxjX-00076i-6m
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 16:49:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVxjW-0004IB-Ky; Sat, 25 Feb 2023 16:49:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVxjW-0002w5-Fn; Sat, 25 Feb 2023 16:49:14 +0000
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
	bh=scvV+1qPNTIcjEH+FOHsFTwHlFli9wheXqx+sCdBL9g=; b=zU9jvI+jCDh1kuXj26EuXWIQdt
	4yiTQQlFkfCl/Si1pZcWeN1Zy2aZm8OzuycKsuBTMkih2HsegU/vrWaPS5S4nKWV49vJOgUCLtVR+
	7+hWqZ6DvqKzC/grgV1o2HVEqqwlNYJdyec9aQfYT0BX8UH9Ix+p7QUwvRaruNWJtroA=;
Message-ID: <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
Date: Sat, 25 Feb 2023 16:49:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic implementation
 of bug.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 24/02/2023 11:31, Oleksii Kurochko wrote:
> The following changes were made:
> * make GENERIC_BUG_FRAME mandatory for ARM

I have asked in patch #1 but will ask it again because I think this 
should be recorded in the commit message. Can you outline why it is not 
possible to completely switch to the generic version?

Cheers,

-- 
Julien Grall

