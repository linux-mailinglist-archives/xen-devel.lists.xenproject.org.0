Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00FD9A49B5
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 00:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822227.1236218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1va1-0000fl-AY; Fri, 18 Oct 2024 22:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822227.1236218; Fri, 18 Oct 2024 22:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1va1-0000dS-7w; Fri, 18 Oct 2024 22:36:21 +0000
Received: by outflank-mailman (input) for mailman id 822227;
 Fri, 18 Oct 2024 22:36:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1vZz-0000dG-Mv
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 22:36:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vZx-0006e8-7V; Fri, 18 Oct 2024 22:36:17 +0000
Received: from [2a02:8012:3a1:0:11d8:dae4:636f:615c]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vZx-0008U3-0f; Fri, 18 Oct 2024 22:36:17 +0000
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
	bh=l72wswh3gM0440mfeKPFxND8KaRj+ZZWcIjtOt2a7GY=; b=CwyszvKwitVmO+SW1qtALz7SrY
	s82ZueQ3fWX1a86s2+c7a//0Jcj3eNK767QX6nM4NgSOr0QxqVhiCqDsbURmx8TNeUl08gBy9Et11
	41bnTS+AJ/kSSWpPSiCoK3GnF1gt2NNOakX/vlJqVbWA72sA8STQveXDhorYoJiuNi9M=;
Message-ID: <e1897919-69e2-4479-a56f-a532c24a3534@xen.org>
Date: Fri, 18 Oct 2024 23:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Update deprecated SPDX license identifiers
Content-Language: en-GB
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Paul Durrant <paul@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20241018135725.2357572-1-frediano.ziglio@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241018135725.2357572-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/10/2024 14:57, Frediano Ziglio wrote:
> As specified in LICENSES/GPL-2.0:
> - GPL-2.0 -> GPL-2.0-only;
> - GPL-2.0+ -> GPL-2.0-or-later.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

It is committed now.

Cheers,

-- 
Julien Grall

