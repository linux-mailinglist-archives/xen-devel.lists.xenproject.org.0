Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845A5F8A68
	for <lists+xen-devel@lfdr.de>; Sun,  9 Oct 2022 11:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418963.663682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohSrR-0000AH-VB; Sun, 09 Oct 2022 09:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418963.663682; Sun, 09 Oct 2022 09:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohSrR-00008J-R2; Sun, 09 Oct 2022 09:44:41 +0000
Received: by outflank-mailman (input) for mailman id 418963;
 Sun, 09 Oct 2022 09:44:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ohSrQ-00008D-CI
 for xen-devel@lists.xenproject.org; Sun, 09 Oct 2022 09:44:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohSrP-0003SI-AB; Sun, 09 Oct 2022 09:44:39 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohSrP-0001de-4A; Sun, 09 Oct 2022 09:44:39 +0000
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
	bh=3S5qYAgvcTTdYqX4l2hUDGN/8uOp8UEssYg3PCAUQkY=; b=2w7OmDgDWWllenQslaFkGg7oz/
	bHaAnJJck8fqTIc7HmA/ybQPB2hzsjU8V8ZI1cot2wBV8SSarRUnS1o+bd4I47otaa8KrEkcujDeM
	WLkvfNc1ZMo/S1/jmxwuEutJg8wuLo6qf8PydndRe1F/3Bm5bVH/0Tr4Vc3jE3Be9K7k=;
Message-ID: <b0039c3c-e220-ee65-0756-43d4ebf4adbb@xen.org>
Date: Sun, 9 Oct 2022 10:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 3/4] add SPDX to arch/arm/*.c
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: wl@xen.org, jbeulich@suse.com, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, roger.pau@citrix.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2210071710070.3690179@ubuntu-linux-20-04-desktop>
 <20221008001544.78302-3-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221008001544.78302-3-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/10/2022 01:15, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Add SPDX license information to all the *.c files under arch/arm.

It would be helpful to explain in the commit messages how the SPDX was 
decided for file with no copyright license:
   - domain_page.c is a split from mm.c. So the license should be 
unfortunatelY GPLv2+
   - all the others are using the default Xen license so GPLv2.

It is also probably worth to mention that existing copyright are 
*replaced* with a SPDX tag.

With that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

