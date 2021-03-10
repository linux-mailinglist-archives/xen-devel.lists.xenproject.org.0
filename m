Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15A333B78
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 12:32:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96014.181421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJx4S-0000ly-V7; Wed, 10 Mar 2021 11:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96014.181421; Wed, 10 Mar 2021 11:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJx4S-0000lZ-Rp; Wed, 10 Mar 2021 11:32:08 +0000
Received: by outflank-mailman (input) for mailman id 96014;
 Wed, 10 Mar 2021 11:32:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJx4R-0000lU-27
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:32:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJx4R-0000Fx-0O
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:32:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJx4Q-0003Zp-Vo
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:32:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lJx4C-0005tS-N5; Wed, 10 Mar 2021 11:31:52 +0000
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
	bh=3Un91V9mT+3jhV0L99sF4vWuC7pYDdUNg+YmlbA4p/s=; b=fONOfWeWRHyS+O2XSmMFIl/9So
	G6CGcnh4tuEGsDIZy8/f3lwJ517DftDnrqpqvepdH3LTLtrU56YRob9SABo7I9Qoja8hoGrjAi8J2
	NoJyxWiC+2wrCsIlAJNa3dfVuuSp0nKGrzc7NrhtB2+l7e30CCqLBcMtBw4n2/H59tZQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24648.44584.312512.639736@mariner.uk.xensource.com>
Date: Wed, 10 Mar 2021 11:31:52 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall  <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    xen-devel@lists.xenproject.org,
    Elliott Mitchell <ehem+xen@m5p.com>
Subject: Re: [PATCH for-4.15] arm: replace typeof() with __typeof__()
In-Reply-To: <e8c826f7-8bf5-fb5d-c1ec-97d8ba1d79d0@suse.com>
References: <202103092114.129LEgZp059925@m5p.com>
	<eaef1b6d-db89-945a-e8be-2b3f9145780c@citrix.com>
	<e8c826f7-8bf5-fb5d-c1ec-97d8ba1d79d0@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH for-4.15] arm: replace typeof() with __typeof__()"):
> On 09.03.2021 22:27, Andrew Cooper wrote:
> > This wants backporting as a build fix, so should be considered for 4.15
> > at this point.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

