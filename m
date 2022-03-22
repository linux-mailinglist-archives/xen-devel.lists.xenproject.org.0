Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6C64E4738
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 21:09:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293641.498888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWkoz-0000km-U8; Tue, 22 Mar 2022 20:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293641.498888; Tue, 22 Mar 2022 20:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWkoz-0000hm-Qh; Tue, 22 Mar 2022 20:09:37 +0000
Received: by outflank-mailman (input) for mailman id 293641;
 Tue, 22 Mar 2022 20:09:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWkoy-0000hg-Is
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 20:09:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWkoy-0005kP-4A; Tue, 22 Mar 2022 20:09:36 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.19.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWkox-0006bs-RE; Tue, 22 Mar 2022 20:09:36 +0000
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
	bh=7FgbIZxIfOQ/KiI5+5FUyiS/XJeP/DItj/o3NxXk4DQ=; b=w7OyVG/faTZHnxUBMle5IhXWFk
	gD7+GjSSThCN3Lb+hinJJpEC9CSJ1xb8TUR/xFBuLWny4zCxhwFL767XHp7jcuKwL+QDqgrrCSuvT
	vCMOJ3PWVpyvVqLWFM4KfVMSy6GmUysLoTo9F9Fv90qEAujSxsUtNi0LIZxIDe1riQX0=;
Message-ID: <c44fce8a-753a-3f90-5b1e-f839f0a7cc1f@xen.org>
Date: Tue, 22 Mar 2022 20:09:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 01/11] xen/arm: rename do_phydev_op() to
 do_arm_physdev_op()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220310073420.15622-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/03/2022 07:34, Juergen Gross wrote:
> do_physdev_op() prototypes on Arm and x86 differ in their return type,
> so rename the Arm one in order to prepare using a common generated
> header file.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

