Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831F636D509
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 11:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119159.225550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgrY-0003uN-44; Wed, 28 Apr 2021 09:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119159.225550; Wed, 28 Apr 2021 09:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgrY-0003ty-0v; Wed, 28 Apr 2021 09:52:08 +0000
Received: by outflank-mailman (input) for mailman id 119159;
 Wed, 28 Apr 2021 09:52:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbgrW-0003tr-Cw
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 09:52:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf4fffd1-0243-43b4-973b-ae8db2d7cda4;
 Wed, 28 Apr 2021 09:52:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D10FFB007;
 Wed, 28 Apr 2021 09:52:04 +0000 (UTC)
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
X-Inumbo-ID: bf4fffd1-0243-43b4-973b-ae8db2d7cda4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619603524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NSaixhNho0gXUt4ASqiIgTLsOmmMP8aSVtHmnkBVMGI=;
	b=UR9kkPz+1pplOpoId8EMo53BEBz7zkvxNJFhH25kUSAy+Iotkh2J7RzYBmXFOPfwnE5GWw
	pLrXPucIqW6YZPX+qbYO1OKmZkW5D2jwTP+coYYDVaMZPlVN/OUy756Ozhfp9qNHF0R8VF
	JM0bTFXY4NGU/urNRbX8LM/i6Q6diSk=
Subject: Re: [xen-unstable test] 161480: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-161480-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8504719d-09ca-d1ff-275b-b67efb0c0689@suse.com>
Date: Wed, 28 Apr 2021 11:52:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <osstest-161480-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.04.2021 00:58, osstest service owner wrote:
> flight 161480 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/161480/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-arm64                   6 xen-build                fail REGR. vs. 161470

Interesting:

cc: internal compiler error: Segmentation fault signal terminated program cc1
Please submit a full bug report,
with preprocessed source if appropriate.
See <file:///usr/share/doc/gcc-8/README.Bugs> for instructions.
make: *** [/home/osstest/build.161480.build-arm64/xen/tools/qemu-xen-dir/rules.mak:69: util/qemu-sockets.o] Error 4

Jan

