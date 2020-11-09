Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD402AC2BB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 18:44:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22782.49205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcBDH-0007eO-Pe; Mon, 09 Nov 2020 17:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22782.49205; Mon, 09 Nov 2020 17:44:19 +0000
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
	id 1kcBDH-0007dz-MP; Mon, 09 Nov 2020 17:44:19 +0000
Received: by outflank-mailman (input) for mailman id 22782;
 Mon, 09 Nov 2020 17:44:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wB/=EP=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kcBDG-0007du-7f
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 17:44:18 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a36829f3-757d-4a32-815a-b7bced826d62;
 Mon, 09 Nov 2020 17:44:17 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kcBDC-00036g-Rq; Mon, 09 Nov 2020 17:44:14 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kcBDC-0006OZ-Kg; Mon, 09 Nov 2020 17:44:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5wB/=EP=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kcBDG-0007du-7f
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 17:44:18 +0000
X-Inumbo-ID: a36829f3-757d-4a32-815a-b7bced826d62
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a36829f3-757d-4a32-815a-b7bced826d62;
	Mon, 09 Nov 2020 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=P2gXSBFISjxCjNa9a0EzzOOqarUXYUyO3s6dL9m0hMY=; b=bwVlSRH8g7XF+rr7TYKzE+6VMe
	9uCDk5zqNh79/ag3Ytm8kPlVN7TmWzs0OPAUwrVmmJdfIL9ZAjFQpekrYIy+7pl93jB/dyWG5vQs7
	LW5rrCkXe1jwDlHiJQtq+qSe3ClDRS/tPoYY/6UIUbScWkaZzvmJeDrZuVROGTm/TBSU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kcBDC-00036g-Rq; Mon, 09 Nov 2020 17:44:14 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kcBDC-0006OZ-Kg; Mon, 09 Nov 2020 17:44:14 +0000
Subject: Re: [PATCH v6 2/3] xen/evtchn: rework per event channel lock
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201109163826.13035-1-jgross@suse.com>
 <20201109163826.13035-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bf53714c-ad49-13f5-147c-de225b775d42@xen.org>
Date: Mon, 9 Nov 2020 17:44:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109163826.13035-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 09/11/2020 16:38, Juergen Gross wrote:
> Currently the lock for a single event channel needs to be taken with
> interrupts off, which causes deadlocks in some cases.
> 
> Rework the per event channel lock to be non-blocking for the case of
> sending an event and removing the need for disabling interrupts for
> taking the lock.
> 
> The lock is needed for avoiding races between event channel state
> changes (creation, closing, binding) against normal operations (set
> pending, [un]masking, priority changes).
> 
> Use a rwlock, but with some restrictions:
> 
> - Changing the state of an event channel (creation, closing, binding)
>    needs to use write_lock(), with ASSERT()ing that the lock is taken as
>    writer only when the state of the event channel is either before or
>    after the locked region appropriate (either free or unbound).
> 
> - Sending an event needs to use read_trylock() mostly, in case of not
>    obtaining the lock the operation is omitted. This is needed as
>    sending an event can happen with interrupts off (at least in some
>    cases).
> 
> - Dumping the event channel state for debug purposes is using
>    read_trylock(), too, in order to avoid blocking in case the lock is
>    taken as writer for a long time.
> 
> - All other cases can use read_lock().
> 
> Fixes: e045199c7c9c54 ("evtchn: address races with evtchn_reset()")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

