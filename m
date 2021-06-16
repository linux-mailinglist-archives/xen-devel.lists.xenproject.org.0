Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ED23A9ED5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 17:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143406.264325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXKx-0003TM-MD; Wed, 16 Jun 2021 15:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143406.264325; Wed, 16 Jun 2021 15:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXKx-0003QH-IE; Wed, 16 Jun 2021 15:20:15 +0000
Received: by outflank-mailman (input) for mailman id 143406;
 Wed, 16 Jun 2021 15:20:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltXKw-0003Py-42
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 15:20:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltXKu-0004wd-Mc; Wed, 16 Jun 2021 15:20:12 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltXKu-0001dm-Dz; Wed, 16 Jun 2021 15:20:12 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=2fPoTx6uDZ5idqHNU3a1FlscP88oQauxf4LJ1kncppk=; b=r3HTH4FiJz+nlT00CNnZPTjLfj
	OyUMIQlNRVryk4xizL4wEFxDwM3gfhFu+Db3xVXZmzzUMtvt8OwjvvmJo1GMQ8////BUJkHwW6BME
	kX3awF9uEh3Z/GrtH2L66mVGgnmNcWZXeDkTXOkTHYIhY+fL/A8EomtjDjFuEbF8xxZ8=;
Subject: Re: [PATCH] code-of-conduct.rst: Add Stefano Stabellini as a Conduct
 Team member
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Owen Smith <owen.smith@citrix.com>,
 Chandrika Srinivasan <chandrika.srinivasan@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Konstantina Chremmou <konstantina.chremmou@citrix.com>,
 Rob Hoes <Rob.Hoes@citrix.com>, "Li Zhang (3P)" <Li.Zhang@citrix.com>
References: <20210616151826.224793-1-george.dunlap@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <64a77547-a942-7da6-5ab9-478c612e52e9@xen.org>
Date: Wed, 16 Jun 2021 17:20:08 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616151826.224793-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi George,

On 16/06/2021 17:18, George Dunlap wrote:
> With my upcoming leave, Ian will be the only person actively on the
> Conduct Team.  Stefano has volunteered to join the team, so that there
> are at least two members.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> Membership of the Conduct Team is a global XenProject decision,
> and so needs a vote of the leadership of all active projects.
> 
> Please vote by replying to this email with +2 / +1 / 0 / -1 / -2, in
> accordance with https://xenproject.org/developers/governance/#project-decisions .

+2

Acked-by: Julien Grall <julien@xen.org>

Cheers,

> 
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Owen Smith <owen.smith@citrix.com>
> CC: Chandrika Srinivasan <chandrika.srinivasan@citrix.com>,
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Konstantina Chremmou <konstantina.chremmou@citrix.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
> CC: "Li Zhang (3P)" <Li.Zhang@citrix.com>
> ---
>   source/code-of-conduct.rst | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/source/code-of-conduct.rst b/source/code-of-conduct.rst
> index 4cb33da..963d605 100644
> --- a/source/code-of-conduct.rst
> +++ b/source/code-of-conduct.rst
> @@ -81,6 +81,7 @@ sub-project. The current list of Conduct Team members is:
>   
>   * George Dunlap <george dot dunlap at citrix dot com>
>   * Ian Jackson <ian dot jackson at citrix dot com>
> +* Stefano Stabellini <sstabellini at kernel dot org>
>   
>   Conduct Team members are changed by proposing a change to this document,
>   posted on all sub-project lists, followed by a formal global vote as outlined
> 

-- 
Julien Grall

