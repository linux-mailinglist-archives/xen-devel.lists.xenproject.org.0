Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12252A02A2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 11:16:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15607.38605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYRS2-00006k-FB; Fri, 30 Oct 2020 10:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15607.38605; Fri, 30 Oct 2020 10:16:06 +0000
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
	id 1kYRS2-00006L-CA; Fri, 30 Oct 2020 10:16:06 +0000
Received: by outflank-mailman (input) for mailman id 15607;
 Fri, 30 Oct 2020 10:16:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYRS0-00006G-Df
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:16:04 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5715d58d-7577-48f3-b5d1-72c57d17e4b6;
 Fri, 30 Oct 2020 10:16:02 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYRRw-0005JZ-34; Fri, 30 Oct 2020 10:16:00 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYRRv-0005Zh-QY; Fri, 30 Oct 2020 10:15:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYRS0-00006G-Df
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:16:04 +0000
X-Inumbo-ID: 5715d58d-7577-48f3-b5d1-72c57d17e4b6
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5715d58d-7577-48f3-b5d1-72c57d17e4b6;
	Fri, 30 Oct 2020 10:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=MOBA07TmFYDEnYKOgbL2LdhdBhbwVYFi4gsjIRISL3k=; b=tAfUCq4RTpq1sndTPox5scQitC
	TzT2TsWIZSLZGkv5LVOLeHsXCY8mdHRhBiBv/mqzhM5ltL66noA1UjgCT68/I49JvZGktXPsQSNOz
	KUmuJg4vE76NBHPH2wAijDtthVDzQrYcezt+3Ka4kgCdzU4ud50pFjhJBEGOCAX0m86o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYRRw-0005JZ-34; Fri, 30 Oct 2020 10:16:00 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYRRv-0005Zh-QY; Fri, 30 Oct 2020 10:15:59 +0000
Subject: Re: [PATCH v2 1/8] evtchn: avoid race in get_xen_consumer()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <9ecafa4d-db5b-20a2-3a9d-6a6cda91252c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <95627ffb-74e5-25f8-08d9-b7420d50b6dd@xen.org>
Date: Fri, 30 Oct 2020 10:15:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9ecafa4d-db5b-20a2-3a9d-6a6cda91252c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/10/2020 15:08, Jan Beulich wrote:
> There's no global lock around the updating of this global piece of data.
> Make use of cmpxchgptr() to avoid two entities racing with their
> updates.
> 
> While touching the functionality, mark xen_consumers[] read-mostly (or
> else the if() condition could use the result of cmpxchgptr(), writing to
> the slot unconditionally).
> 
> The use of cmpxchgptr() here points out (by way of clang warning about
> it) that its original use of const was slightly wrong. Adjust the
> placement, or else undefined behavior of const qualifying a function
> type will result.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

