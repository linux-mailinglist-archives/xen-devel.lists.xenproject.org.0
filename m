Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5D37DCFA9
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 15:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625865.975597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxq79-0005Lx-FK; Tue, 31 Oct 2023 14:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625865.975597; Tue, 31 Oct 2023 14:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxq79-0005Ju-CJ; Tue, 31 Oct 2023 14:53:07 +0000
Received: by outflank-mailman (input) for mailman id 625865;
 Tue, 31 Oct 2023 14:53:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxq77-0005JS-GD
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:53:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxq75-0005m1-Ih; Tue, 31 Oct 2023 14:53:03 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.9.249]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxq75-00031U-5K; Tue, 31 Oct 2023 14:53:03 +0000
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
	bh=NPot+qUmIkk9Y770acfuNaFpWkQZXJKej5geO2NJa/4=; b=7LyPnpKrihg94sAMxcKEIk54qw
	98d6Fv30oramqI+Da8tRfxluxMARbQYRaYCFeLnKBBv5682VGMMFMhe+hZqPCmOsZQtIP7dX9Ur5t
	eAIPuUaanMYzjBXk4V8qg19PH6RJTqyH5Yye89CDPmDbl4ceJ6GG55YDgG47ZO2dyz+8=;
Message-ID: <69678277-027c-499a-9702-9400c78c2e21@xen.org>
Date: Tue, 31 Oct 2023 14:53:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] CHANGELOG.md: Start new "unstable" section
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Chen <wei.chen@arm.com>
References: <20231031144925.2416266-1-Henry.Wang@arm.com>
 <20231031144925.2416266-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231031144925.2416266-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 31/10/2023 14:49, Henry Wang wrote:
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

