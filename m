Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39446D297F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 22:32:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517035.802027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piLQK-0000OJ-UM; Fri, 31 Mar 2023 20:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517035.802027; Fri, 31 Mar 2023 20:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piLQK-0000Kz-RP; Fri, 31 Mar 2023 20:32:36 +0000
Received: by outflank-mailman (input) for mailman id 517035;
 Fri, 31 Mar 2023 20:32:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1piLQI-0000J9-LS
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 20:32:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1piLQH-00011L-Vg; Fri, 31 Mar 2023 20:32:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1piLQH-0006Jz-Q8; Fri, 31 Mar 2023 20:32:33 +0000
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
	bh=ERiYcRs86MRhRTn4Jl9K3fKZEYKy3WCKex3NCAihrsI=; b=nTprS005e4QcEWq8hEgnHce06o
	95OAHT3V0qNwb0TSyEqdux56LpTHgeNgdPk+MWPJl7zgD6lo6FD43RKqVRvvzlqwCQ6QgUMBiRZqy
	KXLoUCv+6lHRDmJWkceINfGCCuxadE0Mzg7oo3kINSpktaARLvKl07WiK3w4mETn4hrA=;
Message-ID: <875899c3-1ff0-e14f-d3f0-fa99c8ed7cbc@xen.org>
Date: Fri, 31 Mar 2023 21:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v9 2/5] xen/arm: remove unused defines in <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1680086655.git.oleksii.kurochko@gmail.com>
 <b1f14f37c933fb4185d85b0ecf6fe9794ce81970.1680086655.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b1f14f37c933fb4185d85b0ecf6fe9794ce81970.1680086655.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 29/03/2023 11:50, Oleksii Kurochko wrote:
> The following defines BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH,
> BUG_LINE_HI_WIDTH aren't used in ARM so could be purged
> as unused.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

