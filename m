Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A7793900B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 15:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761967.1172043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtIE-0003FI-CE; Mon, 22 Jul 2024 13:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761967.1172043; Mon, 22 Jul 2024 13:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtIE-0003DT-9V; Mon, 22 Jul 2024 13:41:34 +0000
Received: by outflank-mailman (input) for mailman id 761967;
 Mon, 22 Jul 2024 13:41:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1sVtIC-0003DJ-SJ
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 13:41:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1sVtIA-0007Fe-AT; Mon, 22 Jul 2024 13:41:30 +0000
Received: from lfbn-lyo-1-451-148.w2-7.abo.wanadoo.fr ([2.7.43.148] helo=l14)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1sVtI9-0005HA-W9; Mon, 22 Jul 2024 13:41:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=ZQ3yuCyW7oGCmUZgCtdulyZAcEyi1gwrXbvhd4tNHaI=; b=vDtNx+NL5fTC33JyOZfYraFRMn
	BPPpU6MqULN0SbdVGZh1ZJPv+rwWUdQjnLSCyIhp9z6F0xKuGwFkYuxE4jMU+oK8NDrABdp5c7TZO
	ArTU5Yoa9KB5RW+Klj5UXk0beV6rF6xBVp86Se8NNQyJG1FWGwzYVRHkK0I3vwLA4nF0=;
Date: Mon, 22 Jul 2024 15:41:27 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [linux-linus test] 186932: regressions - FAIL
Message-ID: <Zp5hh9nuCIVbdOG7@l14>
References: <osstest-186932-mainreport@xen.org>
 <39d87a30-7722-45ec-bc13-11111eb46483@suse.com>
 <Zp5YpOt42lATLwQX@l14>
 <b9a9f515-71c6-4219-8493-df890da7fcb4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9a9f515-71c6-4219-8493-df890da7fcb4@suse.com>

On Mon, Jul 22, 2024 at 03:06:07PM +0200, Jan Beulich wrote:
> On 22.07.2024 15:03, Anthony PERARD wrote:
> > On Mon, Jul 22, 2024 at 09:05:43AM +0200, Jan Beulich wrote:
> >> On 22.07.2024 06:56, osstest service owner wrote:
> >>> flight 186932 linux-linus real [real]
> >>> http://logs.test-lab.xenproject.org/osstest/logs/186932/
> >>>
> >>> Regressions :-(
> >>>
> >>> Tests which did not succeed and are blocking,
> >>> including tests which could not be run:
> >>>  test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 186827
> >>>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 186827
> >>
> >> There looks to be a basic problem as of flight 186925, yet a brief look at one
> >> of the logs doesn't really give any hint other than the system perhaps simply
> >> being slow. Ideas, anyone?
> > 
> > Well, yes, it's really slow to reach having a running ssh server. If I
> > let the machine boot, there's two reason in the log for the long time:
> > 
> > Jul 22 11:44:25.216867 Waiting for /dev to be fully populated...Timed out for waiting the udev queue being empty.
> > Jul 22 11:46:25.469002 done (timeout).
> > 
> > Jul 22 11:46:29.103350 Configuring network interfaces...
> > Jul 22 11:46:32.127350 ^@Timed out for waiting the udev queue being empty.
> 
> Yet both of these instances of timing out look suspiciously like a regression
> (in or caused by the kernel)?

Yes, no timeout in the logs of previous runs. So it's likely a
regression in Linux, between f83e38fc9f10 and 3c3ff7be9729.
http://logs.test-lab.xenproject.org/osstest/results/history/test-arm64-arm64-xl/linux-linus.html

-- 
Anthony PERARD

