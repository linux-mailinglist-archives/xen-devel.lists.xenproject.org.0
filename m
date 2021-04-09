Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9847E359E84
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 14:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107813.206071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUq9y-0007Df-Au; Fri, 09 Apr 2021 12:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107813.206071; Fri, 09 Apr 2021 12:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUq9y-0007DG-7U; Fri, 09 Apr 2021 12:22:50 +0000
Received: by outflank-mailman (input) for mailman id 107813;
 Fri, 09 Apr 2021 12:22:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rPLO=JG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUq9x-0007DB-09
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 12:22:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c96cce45-fd19-4e98-8fc4-b40f9c0c958d;
 Fri, 09 Apr 2021 12:22:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0FF7B0A5;
 Fri,  9 Apr 2021 12:22:46 +0000 (UTC)
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
X-Inumbo-ID: c96cce45-fd19-4e98-8fc4-b40f9c0c958d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617970966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGwkuAaiagC17JwNpRZAwtlb7e56L/Fn/UJmCC7muYo=;
	b=N32ueEd/asB0qyuTybSllk9RzpKdJhDjy1niuAkQOeR2Y4p0j25fzsF4g3WzDdfdGpcoi1
	ZF3OFxCbmWDJVxSFTR0FpIPmtYrb0mL+9FYDvs3n0f6OLzzqCHK0Z0Hrd/j7RK1fihCx0O
	c2CRcy4kblADoJ8U406Nv3fyS3nRKBs=
Subject: Re: [xen-unstable-smoke test] 160853: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-160853-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7e1cea3-3332-d2df-5e06-beb6820370e3@suse.com>
Date: Fri, 9 Apr 2021 14:22:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <osstest-160853-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.04.2021 13:53, osstest service owner wrote:
> flight 160853 xen-unstable-smoke real [real]
> flight 160857 xen-unstable-smoke real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/160853/
> http://logs.test-lab.xenproject.org/osstest/logs/160857/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 160803

This (and a few more similar ones) has been failing in non-smoke
flights as well for a while. Therefore I don't think I need to be
concerned ... No idea though what the plan is to address the
failures there (which might then also help the one here).

Jan

