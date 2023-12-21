Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305E181BED2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 20:10:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659115.1028570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGOQl-0007d4-TM; Thu, 21 Dec 2023 19:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659115.1028570; Thu, 21 Dec 2023 19:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGOQl-0007ZU-Q3; Thu, 21 Dec 2023 19:10:03 +0000
Received: by outflank-mailman (input) for mailman id 659115;
 Thu, 21 Dec 2023 19:10:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rGOQj-0007I9-QU
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 19:10:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGOQi-0007h5-Lh; Thu, 21 Dec 2023 19:10:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGOQi-0006Vp-Gh; Thu, 21 Dec 2023 19:10:00 +0000
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
	bh=awxLosYEArdYkC84owfVgaP6FIp2h4OPdyNJX6xllZw=; b=q2JnQgpJY/owj20XFEbtqgyPIA
	kCQj5DZU2QjiZcmka4FqpIIOJPVY4Vo5iNd4BLbi0mylPEJf8a64sranIlD+3Sd4J89CUFUOrvf1A
	PMaVJUlXQJlNorZ/GITroggVUPTUXyfvJBT3kAGXiqepdUWE6jfO+Eoiq1oVe8VXOFpA=;
Message-ID: <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
Date: Thu, 21 Dec 2023 19:09:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] xen/asm-generic: introduce stub header numa.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 20/12/2023 14:08, Oleksii Kurochko wrote:
> <asm/numa.h> is common through some archs so it is moved
> to asm-generic.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

I think this patch will need to be rebased on top of the lastest staging 
as this should clash with 51ffb3311895.

Cheers,

-- 
Julien Grall

