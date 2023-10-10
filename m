Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EA97BFF6F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 16:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615077.956244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqDtm-0006R4-NK; Tue, 10 Oct 2023 14:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615077.956244; Tue, 10 Oct 2023 14:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqDtm-0006PN-KD; Tue, 10 Oct 2023 14:39:50 +0000
Received: by outflank-mailman (input) for mailman id 615077;
 Tue, 10 Oct 2023 14:39:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qqDtl-0006PH-7d
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 14:39:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqDtk-0003b4-Vb; Tue, 10 Oct 2023 14:39:48 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.104.160]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqDtk-0007Rz-P0; Tue, 10 Oct 2023 14:39:48 +0000
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
	bh=Gn+PXlKkr9bLmBg/Rq5v0W9MnQmb7tahUjtLRIWRdr8=; b=PzT+iaRkB960+ccJCY40jFN7M8
	LscD1HNTkOldCEazfWSYYqMoz2d/JiRW8IVqzrJDtsVIvAUwopwTl6fnCj2l607bsR1vvOrnFHRFL
	as4rkty5hPhS/CH/BvZ4OIgH1t3q7oSzBgoX93xouUjbsFJr+EAgaOe3ZwlHawpG6Mm4=;
Message-ID: <18f2879b-a4cb-43bc-9c70-7141200e331d@xen.org>
Date: Tue, 10 Oct 2023 15:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] get_maintainer: Add THE REST for sections with
 reviewers only
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231006135406.52750-1-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231006135406.52750-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 06/10/2023 14:54, Anthony PERARD wrote:
> Sometime, a contributer would like to be CCed on part of the changes,
> and it could happen that we end-up with a section that doesn't have
> any maintainer, but a Ack from a maintainer would still be needed.
> 
> Rework get_maintainer so if there's no maintainers beside THE REST, it
> doesn't drop THE REST emails.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

