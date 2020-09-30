Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90B27E403
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 10:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.499.1605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXi7-0005gA-Ef; Wed, 30 Sep 2020 08:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499.1605; Wed, 30 Sep 2020 08:43:39 +0000
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
	id 1kNXi7-0005fl-BG; Wed, 30 Sep 2020 08:43:39 +0000
Received: by outflank-mailman (input) for mailman id 499;
 Wed, 30 Sep 2020 08:43:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I3vy=DH=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNXi5-0005ff-UB
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:43:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cadff79-e4e5-4130-8649-f341e0498265;
 Wed, 30 Sep 2020 08:43:37 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNXi2-0004eJ-FY; Wed, 30 Sep 2020 08:43:34 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNXi1-0004Eq-Bw; Wed, 30 Sep 2020 08:43:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=I3vy=DH=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNXi5-0005ff-UB
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:43:37 +0000
X-Inumbo-ID: 3cadff79-e4e5-4130-8649-f341e0498265
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3cadff79-e4e5-4130-8649-f341e0498265;
	Wed, 30 Sep 2020 08:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=yL68zVzNmp3FpbLz7U1l7/0jiFVQ+/XSTL5Jj3LUjOY=; b=tyArxPwfeTVP9whKznOXuf+3q4
	JN4TbiTrZ7ujslMVEEp30hREcKP+ksrQteyKbRSoJTazfsQ8q6RD+uNR0VJHPdmkayrkIwNCJvkBA
	QH1y0/nTpi/eMHVGAmWyD2m27Ez5Qi0Foeu+LgPzD9ckhVSBxPmsYgX5mFN7+Si/1b/M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNXi2-0004eJ-FY; Wed, 30 Sep 2020 08:43:34 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNXi1-0004Eq-Bw; Wed, 30 Sep 2020 08:43:33 +0000
Subject: Re: [PATCH 09/12] evtchn: move FIFO-private struct declarations
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <de54075d-2d2f-e4ca-8252-c6f333571027@suse.com>
 <c96bc8b8-6399-596e-27bf-1b5f1d634dad@xen.org>
 <8a753b1c-e1d0-058d-c31d-f69498165311@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cb954cc4-ff96-63ad-e550-697a7d7c7ed4@xen.org>
Date: Wed, 30 Sep 2020 09:43:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <8a753b1c-e1d0-058d-c31d-f69498165311@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/09/2020 13:49, Jan Beulich wrote:
> On 29.09.2020 14:26, Julien Grall wrote:
>> On 28/09/2020 12:00, Jan Beulich wrote:
>>> There's no need to expose them.
>>
>> We are going to need them for LiveUpdate and Non-cooperative Live
>> Migration as the save/restore is happening outside of event_fifo.c.
>>
>> This is because we tried to keep all the save/restore code in a separate
>> directory.
> 
> I'm afraid I don't view this as a reason for the change not to be made
> right now. If, when, and in what shape LU will hit upstream is unknown
> at the moment (unless I've missed some indication of a time line).

I was merely pointing out long term use case as I vaguely remember a 
discussion in the past to avoid short term change.

> In
> fact, if we didn't expose things like the ones here to far too wide an
> "audience", I wonder whether ... >
>> Although, I could also see pros for scatter save/restore across the code
>> base.
> 
> ... you wouldn't have chosen this route anyway, just to avoid exposing
> items widely that are supposed to be (almost) private.

I would still chose that route because it helps to keep all the 
save/restore code in one place. FWIW, this follows what HVM context does 
today.

Anyway, as I said, this I can see pros/cons for each. So at least this 
discussion clarify the preferred approach.

For the patch itself:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

