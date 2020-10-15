Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE4628EE86
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 10:32:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7144.18731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSyfb-0002gL-8e; Thu, 15 Oct 2020 08:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7144.18731; Thu, 15 Oct 2020 08:31:31 +0000
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
	id 1kSyfb-0002fz-4y; Thu, 15 Oct 2020 08:31:31 +0000
Received: by outflank-mailman (input) for mailman id 7144;
 Thu, 15 Oct 2020 08:31:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSyfZ-0002fu-BL
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:31:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9156eed4-90c9-4cba-94f3-18733ad634a3;
 Thu, 15 Oct 2020 08:31:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CDA9ADA8;
 Thu, 15 Oct 2020 08:31:27 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSyfZ-0002fu-BL
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:31:29 +0000
X-Inumbo-ID: 9156eed4-90c9-4cba-94f3-18733ad634a3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9156eed4-90c9-4cba-94f3-18733ad634a3;
	Thu, 15 Oct 2020 08:31:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602750687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ns9oVh6yhg+6fHG7ZCeGchxxhOro3pKFxjEtP6+3YIk=;
	b=uHh03yTmb2k+zMkdMLr7Khbeu6NJ5JKWbHa+Xt69WsWIPNh5nIcov/0w8AHqW5h7QXSRcI
	JBAODbCVtIvFKpwiiOsg6do0LkMEtUi5kgXPh2M+tuzqQ1r5qIx+1MJuzlKS1w2KeCn7qo
	RVcDBAwvfn3uVC3QQah5nfiBbXgK81o=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9CDA9ADA8;
	Thu, 15 Oct 2020 08:31:27 +0000 (UTC)
Subject: Re: [xen-unstable-smoke test] 155811: regressions - FAIL
To: xen-devel@lists.xenproject.org
References: <osstest-155811-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>
Message-ID: <06d74ec9-948c-dc89-10a3-171dd364e97f@suse.com>
Date: Thu, 15 Oct 2020 10:31:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <osstest-155811-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.10.2020 22:41, osstest service owner wrote:
> flight 155811 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/155811/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 155805

Looks like the changes to tools/include/xen/ population have
increased the chances of running into the race (or some similar
one) reported by Olaf in "races in toolstack build":

make[5]: Entering directory '/home/osstest/build.155810.build-amd64/xen/tools/include'
make -C xen-foreign
make[6]: Entering directory '/home/osstest/build.155810.build-amd64/xen/tools/include/xen-foreign'
mkdir -p xen/libelf acpi
ln -s /home/osstest/build.155810.build-amd64/xen/tools/include/../../xen/include/public/COPYING xen/
ln -s /home/osstest/build.155810.build-amd64/xen/tools/include/../../xen/include/public/*.h xen/
xg_main.c:52:10: fatal error: xen/sys/privcmd.h: No such file or directory
 #include <xen/sys/privcmd.h>
          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [/home/osstest/build.155810.build-amd64/xen/tools/debugger/gdbsx/xg/../../../../tools/Rules.mk:145: xg_main.o] Error 1
make[4]: *** Waiting for unfinished jobs....
ln -s /home/osstest/build.155810.build-amd64/xen/tools/include/../../xen/include/public/*/ xen/
ln -s ../xen-sys/Linux xen/sys

Obviously recursing into tools/include/ needs to precede any other
recursion underneath tools/. Or wait - this is a bogus 2nd recursion
into tools/include/, there's an appropriate one very early in the
build. I guess it's

make[4]: Leaving directory '/home/osstest/build.155810.build-amd64/xen/tools/debugger/gdbsx/gx'
make -C xg
make[4]: Entering directory '/home/osstest/build.155810.build-amd64/xen/tools/debugger/gdbsx/xg'
make -C ../../../include

Jan

