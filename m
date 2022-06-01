Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F78A53ABB0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 19:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340632.565714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRz9-0005e3-Or; Wed, 01 Jun 2022 17:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340632.565714; Wed, 01 Jun 2022 17:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRz9-0005cE-Lo; Wed, 01 Jun 2022 17:18:19 +0000
Received: by outflank-mailman (input) for mailman id 340632;
 Wed, 01 Jun 2022 17:18:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nwRz7-0005bh-R3
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 17:18:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nwRz7-0005kw-Ea; Wed, 01 Jun 2022 17:18:17 +0000
Received: from [54.239.6.189] (helo=[192.168.4.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nwRz7-0002YG-6q; Wed, 01 Jun 2022 17:18:17 +0000
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
	bh=6EqGH4PhuIX4ekocWd8ywkuKfIykr81tpWgzIleeCTU=; b=K+ueR1Y+YCcUMCIY4zN2TcKUCk
	vod268SPGYnyql1lCZCrh8PM80jOf2XU7BfDadqi0CY/muv/2s9bg7iw30G3uqfy6I2im3Vr68jJp
	iHOuqOVZPwS7zFaPSGHckh0iQXnyh9uDGHFB40YTXXnpTW7+jrtDd1CHIKxI79uRBEV4=;
Message-ID: <d6369ba7-4794-18dd-edcf-ae68ef927b97@xen.org>
Date: Wed, 1 Jun 2022 18:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/2] docs/misra: introduce rules.rst
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com,
 Bertrand.Marquis@arm.com, George.Dunlap@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2205311816170.1905099@ubuntu-linux-20-04-desktop>
 <20220601014402.2293524-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220601014402.2293524-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 01/06/2022 02:44, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Introduce a list of MISRA C rules that apply to the Xen hypervisor. The
> list is in RST format.
> 
> Specify that rules deviations need to be documented. Introduce a
> documentation tag for in-code comments to mark them as deviations. Also
> mention that other documentation mechanisms are work-in-progress.
> 
> Add a mention of the new list to CODING_STYLE.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

