Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6632653378C
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 09:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336903.561343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntldV-0006tT-2l; Wed, 25 May 2022 07:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336903.561343; Wed, 25 May 2022 07:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntldU-0006r1-W3; Wed, 25 May 2022 07:40:52 +0000
Received: by outflank-mailman (input) for mailman id 336903;
 Wed, 25 May 2022 07:40:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntldT-0006qr-A1
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 07:40:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntldS-0002aq-Kc; Wed, 25 May 2022 07:40:50 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntldS-0002O6-Ek; Wed, 25 May 2022 07:40:50 +0000
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
	bh=FbqPwK/F59CJPJU/xH7emql9on3Xx84dOcWQmx5jnOk=; b=uR71a27Kiv8gju7cxjnBqj0/n+
	gpm+26p5fxlMtUU3nfUaZVQ0D7AZk26cVvKUs0K9B0bHlzPtNpZohfUn84pWGQtoBmL+lj7P/r8a3
	b2AMpAsLItfKOj1EAfgashuqN6o6SBNKMj27NicMP5WMZiCXNPGtsHU1HhhD9xu7VQ4M=;
Message-ID: <a938b2e2-63cd-9659-2204-f622d7df2b98@xen.org>
Date: Wed, 25 May 2022 08:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] docs/misra: add Rule 5.1
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com,
 Bertrand.Marquis@arm.com, George.Dunlap@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-2-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220525003505.304617-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/05/2022 01:35, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Add Rule 5.1, with the additional note that the character limit for Xen
> is 63 characters.

63 is a bit an odd numbers. Why not 64?

> 
> The max length identifiers found by ECLAIR are:
> 
> __mitigate_spectre_bhb_clear_insn_start
> domain_pause_by_systemcontroller_nosync
> 
> Both of them are 40 characters long. A limit of 63 characters work for
> the existing code.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Regardless what I wrote above:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

