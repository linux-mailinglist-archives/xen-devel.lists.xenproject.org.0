Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC0D530C83
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 12:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335755.559942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt50v-0002ew-3h; Mon, 23 May 2022 10:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335755.559942; Mon, 23 May 2022 10:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt50v-0002cX-12; Mon, 23 May 2022 10:10:13 +0000
Received: by outflank-mailman (input) for mailman id 335755;
 Mon, 23 May 2022 10:10:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nt50u-0002cR-2i
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 10:10:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nt50t-0004q8-Ov; Mon, 23 May 2022 10:10:11 +0000
Received: from [54.239.6.189] (helo=[192.168.27.249])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nt50t-0005UP-JP; Mon, 23 May 2022 10:10:11 +0000
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
	bh=NrNGLlysh4CwZvmcEHWxtNCj64YCukx3HAn9Z5exPz0=; b=vZFxneiqvz7wckdqTLohyN2D9K
	BtiNwF72tAvqPTYDnft57sLm1aEkzONnkdz85G309dNgu22ok7enA8bWY0JEees69dk6zZ87fH8ef
	nILQuEi4Dy0s7rpGyGGLp57qouHOCd3BdS0DJZzLTcERa8f8EkhDiY7vZSCOQ3t7Foww=;
Message-ID: <d45db393-175f-dae8-f570-b5b469f16afc@xen.org>
Date: Mon, 23 May 2022 11:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 3/6] arm64/find_next_bit: Remove ext2_swab()
To: Lin Liu <lin.liu@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1653295437.git.lin.liu@citrix.com>
 <906b399ee86969fb86304c60c3b725326620d50f.1653295437.git.lin.liu@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <906b399ee86969fb86304c60c3b725326620d50f.1653295437.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/05/2022 10:52, Lin Liu wrote:
> ext2 has nothing to do with this logic.  Clean up the code with
> xen/byteswap.h which now has an unsigned long helper.

It looks like my comment in v3 wasn't addressed. This could possibly be 
done on commit if there are no other version.

> 
> No functional change.
> 
> Signed-off-by: Lin Liu <lin.liu@citrix.com>

You forgot to carry the tags from Andrew and I.

Cheers,

-- 
Julien Grall

