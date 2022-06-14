Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB87F54B4B6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 17:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349161.575347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18XX-0001WF-Gl; Tue, 14 Jun 2022 15:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349161.575347; Tue, 14 Jun 2022 15:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18XX-0001UP-DV; Tue, 14 Jun 2022 15:33:11 +0000
Received: by outflank-mailman (input) for mailman id 349161;
 Tue, 14 Jun 2022 15:33:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o18XW-0001UJ-CV
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 15:33:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o18XV-0001qN-R4; Tue, 14 Jun 2022 15:33:09 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.23.240]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o18XV-0000dZ-Io; Tue, 14 Jun 2022 15:33:09 +0000
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
	bh=OfPHCdnZMQ6ZJuBl/dZXc34n9FyO1XG/uU1BNTxl4zs=; b=mAmg+3WoSRr6r2hXAnJzuccEye
	ghvDwxKyKGLauWfaiRFw5et/KS4ScvUcrPMHEnoKulnUuVOLfUbBVg0r7ns7PU/ehrc0Jr9Nq/jLo
	pfa8sr7xf7sdxq+qBcp8MbVGwvTuM/IwyLBSuJei6i+zZxcdqEsmVHSLBisReCOFQyco=;
Message-ID: <31fcaef6-668f-9923-ea22-8520e70d7d74@xen.org>
Date: Tue, 14 Jun 2022 16:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] tools/xenstore: simplify loop handling connection I/O
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220614153152.25919-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220614153152.25919-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/06/2022 16:31, Juergen Gross wrote:
> The loop handling input and output of connections of xenstored is
> open coding list_for_each_entry_safe() in an incredibly complicated
> way.
> 
> Use list_for_each_entry_safe() instead, making it much more clear how
> the code is working.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

