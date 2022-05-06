Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E117851D98D
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 15:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323164.544767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyFc-0007DZ-Tv; Fri, 06 May 2022 13:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323164.544767; Fri, 06 May 2022 13:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyFc-0007AI-QJ; Fri, 06 May 2022 13:44:08 +0000
Received: by outflank-mailman (input) for mailman id 323164;
 Fri, 06 May 2022 13:44:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmyFb-0007A8-H1
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 13:44:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmyFa-0007i3-MR; Fri, 06 May 2022 13:44:06 +0000
Received: from [54.239.6.185] (helo=[192.168.5.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmyFa-0002iG-G3; Fri, 06 May 2022 13:44:06 +0000
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
	bh=QG9hHc8bsKRmRzxolbMqsjFmvuikn1laUWKe+oLth6k=; b=LY8vBAUKgTfdLm0RYsYi8NkTKM
	ixrCnTiBL4kUtP2ywCm6LiW+Y6PHWksy4aCLeg+K+W77XOlSQ4s+X9/z7cik2IDM7V7GO3P3kYKw9
	jQiTozZ70NC22puYZQB/YkOBHYqp0IyRiqWPAOLjQRXoW5ecNyL/efYIA9fAkQjhDJhE=;
Message-ID: <20ab3107-a548-450c-0c2c-98be53f6270b@xen.org>
Date: Fri, 6 May 2022 14:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] build: silence future GNU ld warning about executable
 stacks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
 <1905d86c-6363-c6b0-97b3-beb91aca9055@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1905d86c-6363-c6b0-97b3-beb91aca9055@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

You say future, has this option been merged or still in discussion on 
the ML?

On 06/05/2022 14:38, Jan Beulich wrote:
> While for C files the compiler is supposed to arrange for emitting
> respective information, for assembly sources we're responsible ourselves.

Is this a preventive measure, or you have seen it in action?

Cheers,

-- 
Julien Grall

