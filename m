Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED63227EA13
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703.2346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcJs-0003LM-Hn; Wed, 30 Sep 2020 13:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703.2346; Wed, 30 Sep 2020 13:38:56 +0000
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
	id 1kNcJs-0003Ky-El; Wed, 30 Sep 2020 13:38:56 +0000
Received: by outflank-mailman (input) for mailman id 703;
 Wed, 30 Sep 2020 13:38:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNcJq-0003Kr-EF
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:38:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c714c8c3-aec9-40a7-adc6-39cd5fc121bf;
 Wed, 30 Sep 2020 13:38:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF255B159;
 Wed, 30 Sep 2020 13:38:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNcJq-0003Kr-EF
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:38:54 +0000
X-Inumbo-ID: c714c8c3-aec9-40a7-adc6-39cd5fc121bf
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c714c8c3-aec9-40a7-adc6-39cd5fc121bf;
	Wed, 30 Sep 2020 13:38:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601473133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mr/AoLAzGM3F4QinZpJ2o4EB+KF5twpMCivP0NRQIKo=;
	b=oEixotqXTGrrM/CZJPqg4ANuAZeZO2vepuKs4uDgO/5Nbb+rrXWcRA/vKztH5jaqEV4it3
	9gGqCnra1vHVl1SWwTLAnKHqt+mcacubT38jBgQ092wueOihuUGqfgxZgapQsY+tsMC0U0
	EmSdEN70CLtcgyqcJ0/zUibzjgWgZ8o=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DF255B159;
	Wed, 30 Sep 2020 13:38:52 +0000 (UTC)
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy document
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Rich Persaud <persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20200930125736.95203-1-george.dunlap@citrix.com>
 <9b67dd36-4216-9480-57ec-5b453eae0036@suse.com>
 <E1835B50-28EA-45DC-BDB6-F1047FF96F41@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7db61b4d-9a9e-4206-fadb-8c9c37b032b4@suse.com>
Date: Wed, 30 Sep 2020 15:38:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <E1835B50-28EA-45DC-BDB6-F1047FF96F41@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.09.2020 15:29, George Dunlap wrote:
> The list above was made by trying to make sense of the table in the link above (https://www.suse.com/lifecycle/).  I think it’s important to have references such that the release manager can easily update this list every release.  Do you think you could provide a better link?

I don't think I can; the link is good for what we want, I think.
When expanding the individual version lines, information on the
life times of the service packs is shown, and I think that's all
we need here.

Jan

