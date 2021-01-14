Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D82F6565
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 17:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67351.120076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l058s-0000nc-5M; Thu, 14 Jan 2021 16:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67351.120076; Thu, 14 Jan 2021 16:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l058s-0000nD-1S; Thu, 14 Jan 2021 16:06:34 +0000
Received: by outflank-mailman (input) for mailman id 67351;
 Thu, 14 Jan 2021 16:06:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l058q-0000n8-IY
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 16:06:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l058q-0007gD-EN
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 16:06:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l058q-0004P2-Cv
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 16:06:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l058o-0004Qh-Cu; Thu, 14 Jan 2021 16:06:30 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=QSffFpridiz8SJOviu02FWI6tE+HzILu38jOC6gDPSs=; b=fn/3hh4XnRXuEVt+rTPdKJbWrJ
	AkhDAyUDrDNou/5pLjdk9jJPnhG69Z8z/ZGq6qHWPcVJBtiiHJnniag8a6UeoGAG97v4lDFiotM2M
	FA6r666igzAaSk2Db/NrIcpbIUfqPKppkhqw4CrO8HJqfAkfmjkj0+JVgkLZceWAdwME=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24576.27654.137226.608671@mariner.uk.xensource.com>
Date: Thu, 14 Jan 2021 16:06:30 +0000
To: xen-devel@lists.xenproject.org,
    committers@xenproject.org
Subject: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
In-Reply-To: <24567.7198.846779.557032@mariner.uk.xensource.com>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

The last posting date for new feature patches for Xen 4.15 is
tomorrow. [1]  We seem to be getting a reasonable good flood of stuff
trying to meet this deadline :-).

Patches for new fetures posted after tomorrow will be deferred to the
next Xen release after 4.15.  NB the primary responsibility for
driving a feature's progress to meet the release schedule, lies with
the feature's proponent(s).


  As a reminder, here is the release schedule:
+ (unchanged information indented with spaces):

   Friday 15th January    Last posting date

       Patches adding new features should be posted to the mailing list
       by this cate, although perhaps not in their final version.

   Friday 29th January    Feature freeze

       Patches adding new features should be committed by this date.
       Straightforward bugfixes may continue to be accepted by
       maintainers.

   Friday 12th February **tentatve**   Code freeze

       Bugfixes only, all changes to be approved by the Release Manager.

   Week of 12th March **tentative**    Release
       (probably Tuesday or Wednesday)

  Any patches containing substantial refactoring are to treated as
  new features, even if they intent is to fix bugs.

  Freeze exceptions will not be routine, but may be granted in
  exceptional cases for small changes on the basis of risk assessment.
  Large series will not get exceptions.  Contributors *must not* rely on
  getting, or expect, a freeze exception.

+ New or improved tests (supposing they do not involve refactoring,
+ even build system reorganisation), and documentation improvements,
+ will generally be treated as bugfixes.

  The codefreeze and release dates are provisional and will be adjusted
  in the light of apparent code quality etc.

  If as a feature proponent you feel your feature is at risk and there
  is something the Xen Project could do to help, please consult me or
  the Community Manager.  In such situations please reach out earlier
  rather than later.


In my last update I asked this:

> If you are working on a feature you want in 4.15 please let me know
> about it.  Ideally I'd like a little stanza like this:
> 
> S: feature name
> O: feature owner (proponent) name
> E: feature owner (proponent) email address
> P: your current estimate of the probability it making 4.15, as a %age
> 
> But free-form text is OK too.  Please reply to this mail.

I received one mail.  Thanks to Oleksandr Andrushchenko for his update
on the following feeature:

  IOREQ feature (+ virtio-mmio) on Arm
  https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg87002.html

  Julien Grall <julien@xen.org>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

I see that V4 of this series was just posted.  Thanks, Oleksandr.
I'll make a separate enquiry about your series.

I think if people don't find the traditional feature tracking useful,
I will try to assemble Release Notes information later, during the
freeze, when fewer people are rushing to try to meet the deadlines.


Thanks,
Ian.


[1] The precise nominal cutoff time is 2020-01-14 23:59:00 in time
zone International Date Line West
  https://en.wikipedia.org/wiki/UTC%E2%88%9212:00
based on the timestamp recorded in the earliest Received: line
inserted by lists.xenproject.org, in the message containing the
last-received patch of the series.

