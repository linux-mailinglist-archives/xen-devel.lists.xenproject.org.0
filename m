Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072DF2A60A4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18946.44076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFFF-0000vg-T1; Wed, 04 Nov 2020 09:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18946.44076; Wed, 04 Nov 2020 09:38:21 +0000
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
	id 1kaFFF-0000vH-Pm; Wed, 04 Nov 2020 09:38:21 +0000
Received: by outflank-mailman (input) for mailman id 18946;
 Wed, 04 Nov 2020 09:38:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kaFFE-0000vC-9Y
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:38:20 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06bfd912-67c2-401c-9cf5-db3581bc9792;
 Wed, 04 Nov 2020 09:38:19 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaFFB-00012z-8E; Wed, 04 Nov 2020 09:38:17 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaFFB-0001gp-0t; Wed, 04 Nov 2020 09:38:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kaFFE-0000vC-9Y
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:38:20 +0000
X-Inumbo-ID: 06bfd912-67c2-401c-9cf5-db3581bc9792
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 06bfd912-67c2-401c-9cf5-db3581bc9792;
	Wed, 04 Nov 2020 09:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=gZf0BTVhX+vIA3VdG7OBgsKPbP8EWYIWiotMMRtLN/8=; b=vwl02Uat5R48voil+73l6kqrrH
	XslAY/zx+H0sg4qmo8YJT/epqdNIs+6KNQlm8qHGMmP8xOVu9jcI++snJCjUAaSNqxlYSBvW9sIK0
	dpaTNFLJ7rbpOO8JGnOhPkgIHgWiEG8FtYHQT/HSEZPcJxEHAzVl+JLaRRhOpHKhgTyQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaFFB-00012z-8E; Wed, 04 Nov 2020 09:38:17 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaFFB-0001gp-0t; Wed, 04 Nov 2020 09:38:17 +0000
Subject: Re: [PATCH v3 2/3] xen/locking: harmonize spinlocks and rwlocks
 regarding preemption
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201104081549.3712-1-jgross@suse.com>
 <20201104081549.3712-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7adebd65-af5c-a265-cb4e-7dbddf790c3f@xen.org>
Date: Wed, 4 Nov 2020 09:38:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104081549.3712-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/11/2020 08:15, Juergen Gross wrote:
> Spinlocks and rwlocks behave differently in the try variants regarding
> preemption: rwlocks are switching preemption off before testing the
> lock, while spinlocks do so only after the first check.
> 
> Modify _spin_trylock() to disable preemption before testing the lock
> to be held in order to be preemption-ready.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

