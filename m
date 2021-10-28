Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0396F43E103
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 14:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218006.378273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4Ww-0007iX-QN; Thu, 28 Oct 2021 12:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218006.378273; Thu, 28 Oct 2021 12:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4Ww-0007fu-NI; Thu, 28 Oct 2021 12:29:14 +0000
Received: by outflank-mailman (input) for mailman id 218006;
 Thu, 28 Oct 2021 12:29:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg4Wu-0007fm-GE
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 12:29:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg4Wu-0007Cu-AE
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 12:29:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg4Wu-00071j-9L
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 12:29:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mg4Wq-00024G-FP; Thu, 28 Oct 2021 13:29:08 +0100
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
	bh=xTyjn4c3e2yajfXpWQk72ujAhJ/ZYp1EyU1023ShDGE=; b=kOIjz1CvkjWdFb9TqpJfe1Qq/V
	+t9f0jlU/uBEzIfvwtG5ratFQtrWyL4CD/fJkVkkwb9JdbSE0uMPLEH+LrvlsjGkwoKm+5Hr3GYeF
	0gWwhGP+6r436PzlpZZLb6ftWdTxlI8vk93Ei9FoD2c1ubYdBwSDfg0EbxyHkfRdOu/U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24954.38803.851753.366549@mariner.uk.xensource.com>
Date: Thu, 28 Oct 2021 13:29:07 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 0/2] ts-xen-build: explicitly enable/disable
 configure features
In-Reply-To: <822a9317-2ed0-8510-dc31-90ccff5c6c38@suse.com>
References: <20211027170256.18223-1-iwj@xenproject.org>
	<822a9317-2ed0-8510-dc31-90ccff5c6c38@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [OSSTEST PATCH 0/2] ts-xen-build: explicitly enable/disable configure features"):
> Far from being a Perl expert I agree this is a sensible approach and it
> should do the right thing.
> 
> It will still depend on no unsupported option being mentioned in any
> comment, e.g. "# option --enable-foo is no longer supported" will result
> in a wrong positive when testing for feature "foo". In the end this will
> break the build, so it should be easy to detect in case this happens
> some time in the future.
> 
> As there is no way to print out all supported options, this could only
> be solved by adding "--disable-option-checking", which has other
> disadvantages.
> 
> You can add my:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thank you for your detailed review and analysis.

I have pushed this to osstest pretest.

Ian.

