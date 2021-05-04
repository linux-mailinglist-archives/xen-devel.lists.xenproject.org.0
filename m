Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE8D3726E1
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 10:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121976.230016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldq1K-0002m4-3L; Tue, 04 May 2021 08:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121976.230016; Tue, 04 May 2021 08:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldq1J-0002lf-WF; Tue, 04 May 2021 08:03:06 +0000
Received: by outflank-mailman (input) for mailman id 121976;
 Tue, 04 May 2021 08:03:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldq1I-0002lY-9m
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 08:03:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc110e49-9b37-4006-9adb-39b99282f19b;
 Tue, 04 May 2021 08:03:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C746AAFF0;
 Tue,  4 May 2021 08:03:02 +0000 (UTC)
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
X-Inumbo-ID: dc110e49-9b37-4006-9adb-39b99282f19b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620115382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=706C+Rr0FDuR3T16GiMyOKirxaTctxt7XOLLnVP5JrU=;
	b=MAHd+U5Zc6o7yjzJdLmIDjhzdz3fZA1WUs/bjpZ0nJc7S0Uoa55lPxvk7Z/YQdM56nzmvC
	iDpml+U1HndK0MG9FTZukdTdm++l0Rqmo+r8XbV/nWYrPXCm6Gyhc+h9rSA4kbst3mOXNp
	TWkBpS6UDVEHLrwsnnh3LT5SN/6xyb0=
Subject: Re: [PATCH 10/13] libxc: Add xc_set_cpufreq_hwp
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-11-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <398aa86f-13e4-e5d4-29d6-4491a05c920a@suse.com>
Date: Tue, 4 May 2021 10:03:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-11-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> Add xc_set_cpufreq_hwp to allow calling xen_systctl_pm_op
> SET_CPUFREQ_HWP.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> 
> ---
> Am I allowed to do set_hwp = *set_hwp struct assignment?

I'm puzzled by the question - why would you not be?

Jan

