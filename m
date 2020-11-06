Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A582A91CC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 09:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20498.46417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaxSH-00057E-7G; Fri, 06 Nov 2020 08:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20498.46417; Fri, 06 Nov 2020 08:50:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaxSH-00056q-42; Fri, 06 Nov 2020 08:50:45 +0000
Received: by outflank-mailman (input) for mailman id 20498;
 Fri, 06 Nov 2020 08:50:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaxSG-00056l-7P
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 08:50:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69d4a2d1-5ffc-452d-a942-5fcfb4a539b7;
 Fri, 06 Nov 2020 08:50:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B729AB8F;
 Fri,  6 Nov 2020 08:50:42 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaxSG-00056l-7P
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 08:50:44 +0000
X-Inumbo-ID: 69d4a2d1-5ffc-452d-a942-5fcfb4a539b7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 69d4a2d1-5ffc-452d-a942-5fcfb4a539b7;
	Fri, 06 Nov 2020 08:50:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604652642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9oX95/HNDAsnsACCUA+gSWI27///UQmU0uf7P335ms=;
	b=A6GClXKqFCXB1jLSXiIt3iZrfQGPCTz0aMrkzORWLkNySVzcPkCREg7IOEXJLdMg2hQDfR
	IyLPquQe/c81ZYnBRmAmWlnJuMaQL4HqWSN222vAENuRGc9Ai27bcYOAkFYOVKl1Q71lBv
	nSNAnNpyEykPQEu7qmjC4AW0sPj6IRY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9B729AB8F;
	Fri,  6 Nov 2020 08:50:42 +0000 (UTC)
Subject: Re: preparations for 4.14.1
To: Julien Grall <julien@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5aa0791a-db56-8f5a-51a1-5863748ce7f1@suse.com>
 <6b67e93b-1dff-ff31-457d-400cf33cd4b6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f5aa1f3-fb63-bb38-bb96-497c47a1e920@suse.com>
Date: Fri, 6 Nov 2020 09:50:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6b67e93b-1dff-ff31-457d-400cf33cd4b6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.11.2020 09:45, Julien Grall wrote:
> On 04/11/2020 10:12, Jan Beulich wrote:
>> the release is due in a couple of weeks time. Please point out
>> backports you find missing from the respective staging branch,
>> but which you consider relevant. (Ian: Please double check
>> there are indeed no tools side backports needed here.)
> 
> Would it be possible to consider the backport mentioned [1]? For 
> convenience, this is:
> 
> d25cc3ec93eb "libxl: workaround gcc 10.2 maybe-uninitialized warning"
> 
> In addition, I would like to request a backport for:
> 
> fff1b7f50e75 "libxl: fix -Werror=stringop-truncation in
> libxl__prepare_sockaddr_un"
> 
> Both patches are necessary to get Xen building with newer GCC.

While I support the request, it really should have gone to Ian.
Ian - please consider.

Jan

