Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371EA359537
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 08:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107617.205641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUkQ7-0003W1-2u; Fri, 09 Apr 2021 06:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107617.205641; Fri, 09 Apr 2021 06:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUkQ6-0003Vf-VJ; Fri, 09 Apr 2021 06:15:06 +0000
Received: by outflank-mailman (input) for mailman id 107617;
 Fri, 09 Apr 2021 06:15:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rPLO=JG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUkQ5-0003VY-Fa
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 06:15:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 751a24b0-5e9e-4705-b9a4-9cadbd12a288;
 Fri, 09 Apr 2021 06:15:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD3A2AE37;
 Fri,  9 Apr 2021 06:15:03 +0000 (UTC)
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
X-Inumbo-ID: 751a24b0-5e9e-4705-b9a4-9cadbd12a288
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617948903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zsXqUAdMsV5ntImpl/gjnEK/9yXIo1A3Acs4h2mHiM=;
	b=SFRFCcc3B/knEWz0T06IJxOmHhPvTIIBD8ZR3Chr9ieK580wlx5E+9fPY8Iy5fOKEX/jF+
	WBnVCPWgSKpzpO1XJYsiDBLOQV5gwXUHEPTnTdjEjX7dOG+ghNNSkXEJ4LPLzRYD5Ztwll
	t1Xb2Yc2l6coZnD5BZzAgU8H6g5ZRek=
Subject: Re: [xen-4.12-testing test] 160807: regressions - FAIL
To: Ian Jackson <iwj@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <osstest-160807-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab7b9698-9740-f4f1-7107-40f5cd95212d@suse.com>
Date: Fri, 9 Apr 2021 08:15:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <osstest-160807-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.04.2021 21:37, osstest service owner wrote:
> flight 160807 xen-4.12-testing real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/160807/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-armhf                     <job status>                 broken  in 160709
>  build-armhf                4 host-install(4) broken in 160709 REGR. vs. 159418
>  test-amd64-amd64-xl-qcow2 19 guest-localmigrate/x10 fail in 160709 REGR. vs. 159418

The failure of this or ...

> Tests which are failing intermittently (not blocking):
>  test-amd64-amd64-libvirt-pair 22 guests-nbd-mirror/debian fail in 160709 pass in 160807
>  test-amd64-amd64-xl-qcow2    18 guest-saverestore.2        fail pass in 160709

... this step (the latter being a prereq to the former) has been
ongoing since the middle of March, on just this branch. The
primary suspect imo is a bad backport of the XSA-368 fix, as the
very first failure (flight 160128) was with just this and the
gcc11 build fix. As this continues to take up osstest resources,
could one of you look into this more closely? From my looking at
it I can't exclude this is merely bad luck (it might be the
previously observed "guest fails to signal readiness for
suspending"), but since prior pushes didn't get delayed for this
long I'm not sure at all.

Jan

