Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E533980EC59
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 13:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653057.1019304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD27e-0001wB-8J; Tue, 12 Dec 2023 12:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653057.1019304; Tue, 12 Dec 2023 12:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD27e-0001uC-5b; Tue, 12 Dec 2023 12:44:26 +0000
Received: by outflank-mailman (input) for mailman id 653057;
 Tue, 12 Dec 2023 12:44:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD27d-0001ro-4N
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 12:44:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD27c-0006dL-W1; Tue, 12 Dec 2023 12:44:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD27c-0003P6-PP; Tue, 12 Dec 2023 12:44:24 +0000
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
	bh=J0Lab8Y6ujlrX1CMImkJgjnJ9LhYTyEWYsyqTRvaxIg=; b=spxQ73u/q6ZfyFW7FPeNhQIrwE
	WF9S9MJnMh+tS4LNekz3bHzbaPLZWdK5AsuX8jVPRP5pzovb2khosAJlqyCzLM7u5HKdD2Meb5beu
	xXC7jH7WO2ZCHFVL2bdzK2khc2hggjje8nmtwxqzE08lxz2eJDt4L8i7DCPRLOEdCWOs=;
Message-ID: <1669c051-a716-4965-98ae-593929555c72@xen.org>
Date: Tue, 12 Dec 2023 12:44:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] xen/spinlock: reduce lock profile ifdefs
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231212094725.22184-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 12/12/2023 09:47, Juergen Gross wrote:
> With some small adjustments to the LOCK_PROFILE_* macros some #ifdefs
> can be dropped from spinlock.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

