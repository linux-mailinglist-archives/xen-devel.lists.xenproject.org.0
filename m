Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AF34B2913
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 16:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270565.464892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIXqF-0002yF-9a; Fri, 11 Feb 2022 15:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270565.464892; Fri, 11 Feb 2022 15:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIXqF-0002wQ-6P; Fri, 11 Feb 2022 15:28:11 +0000
Received: by outflank-mailman (input) for mailman id 270565;
 Fri, 11 Feb 2022 15:28:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nIXqD-0002wI-LZ
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 15:28:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIXqC-0002GZ-Lo; Fri, 11 Feb 2022 15:28:08 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.30.126]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIXqC-0001hU-FZ; Fri, 11 Feb 2022 15:28:08 +0000
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
	bh=07OLUu5EaiN7izujrTb3pRsmPF4oJCmfCQr7UHmVJ7s=; b=ivVihV/5VTvamBlCIwQd+zEzaq
	C2rzSGJurOSyLuP9vJBOX20F56mIMponNcar2gegbi8wqNITgb434dB4DTu5G4z/FEQd9TiUjDULY
	csUYS3N7Er66ZU02OaQD3N1wmpoKG+a2Pv92mb1zuruWrkXX6t39PGvmQVN7AQoTZS8I=;
Message-ID: <49b3abe8-39e7-5b74-0471-8b65aa234ee3@xen.org>
Date: Fri, 11 Feb 2022 15:28:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v6 13/13] xen/arm: account IO handlers for emulated PCI
 MSI-X
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, artem_mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-14-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220204063459.680961-14-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 04/02/2022 06:34, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> At the moment, we always allocate an extra 16 slots for IO handlers
> (see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
> MSI-X registers we need to explicitly tell that we have additional IO
> handlers, so those are accounted.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

