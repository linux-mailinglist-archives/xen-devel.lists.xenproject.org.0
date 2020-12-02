Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7C42CC25F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 17:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42887.77188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkV6n-0007W7-Nr; Wed, 02 Dec 2020 16:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42887.77188; Wed, 02 Dec 2020 16:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkV6n-0007Vi-KW; Wed, 02 Dec 2020 16:36:01 +0000
Received: by outflank-mailman (input) for mailman id 42887;
 Wed, 02 Dec 2020 16:36:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kkV6m-0007Vb-Sv
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 16:36:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kkV6m-00068N-Qy
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 16:36:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kkV6m-0003z2-PY
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 16:36:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kkV6j-0005on-BI; Wed, 02 Dec 2020 16:35:57 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=zlQiDJR+/Pb9UkxioXvWJdFAT1Utbih89CmWbF+q2JY=; b=p151pceMRr3NSR6RAnGXDPtFx7
	i4cq0fMFFSqmORB3xBTrM89z0r/75yP9iKPsMkhIK1YIUQ4jTG0NhQmFF8U1hKLsSdWhCYiNBH6+7
	aLpKD6powGnY0xW1RVTFr4BSsyMpBIFtvHPSfm9j7twHcAAl5jbnDbxr4OAk9G9pnNs8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24519.49773.66229.841306@mariner.uk.xensource.com>
Date: Wed, 2 Dec 2020 16:35:57 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    committers@xenproject.org,
    George Dunlap <George.Dunlap@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    =?iso-8859-1?Q?J=FCrgen_Gro=DF?=  <jgross@suse.com>,
    Paul Durrant <xadimgnik@gmail.com>,
    Wei Liu <wl@xen.org>,
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: Xen 4.15: Proposed release schedule
In-Reply-To: <a0648b20-54df-850b-2992-35dfbb86b7ca@xen.org>
References: <24510.24778.433048.477008@mariner.uk.xensource.com>
	<24510.25252.447028.364012@mariner.uk.xensource.com>
	<a0648b20-54df-850b-2992-35dfbb86b7ca@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: Xen 4.15: Proposed release schedule"):
> Therefore, would it be possible to push the "Feature Freeze" by week?

Sure.  To expand on that: this was the only comment on my proposal,
and I'm happy to accept such a minor change.

Adjusting the LPD too, but not the other two tentative dates, leads to
this schedule:

   Friday 15th January    Last posting date

     Patches adding new features should be posted to the mailing list
     by this cate, although perhaps not in their final version.

   Friday 29th January   Feature freeze
  
     Patches adding new features should be committed by this date.
     Straightforward bugfixes may continue to be accepted by
     maintainers.

   Friday 12th February **tentatve**   Code freeze

     Bugfixes only, all changes to be approved by the Release Manager.

   Week of 12th March **tentative**   Release
     (probably Tuesday or Wednesday)

Unless anyone has objections, I will declare this official, tomorrow.

Ian.

