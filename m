Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65A3CFE84
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jul 2021 18:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158909.292390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5s9x-0007Xz-3X; Tue, 20 Jul 2021 15:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158909.292390; Tue, 20 Jul 2021 15:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5s9w-0007VL-WB; Tue, 20 Jul 2021 15:59:52 +0000
Received: by outflank-mailman (input) for mailman id 158909;
 Tue, 20 Jul 2021 15:59:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m5s9v-0007VF-HI
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 15:59:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m5s9v-0004e2-Es
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 15:59:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m5s9v-0002Lv-EG
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 15:59:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m5s9q-00076G-GN; Tue, 20 Jul 2021 16:59:46 +0100
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
	bh=m6lXHNp84L4qxVdcfu8S6UdlOLXsxk8kwJskYOfOCpI=; b=2bpv9z9PsSjdaFoqb24MW2BJ4Z
	QDxfuQLARhxHuhWCgi4rmj/DKvpeCEklpDFQ46dJTS3on2Rrehy7Q3eWg2y5PDVxCQyC+2wpyKcvi
	ynW0j5iNeN6wHoO0spUHWdLAiixW+z8ryE/4L2G10D4WA0g6eZHDiv5r92kv6rT4CFGE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24822.62194.343959.454998@mariner.uk.xensource.com>
Date: Tue, 20 Jul 2021 16:59:46 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
    <xen-devel@lists.xenproject.org>,
    <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] tests/xs: Check asprintf result
In-Reply-To: <048868ab-3291-70d9-791d-325fc79caccd@citrix.com>
References: <20210718135633.28675-1-jandryuk@gmail.com>
	<24822.56879.260780.652184@mariner.uk.xensource.com>
	<048868ab-3291-70d9-791d-325fc79caccd@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH] tests/xs: Check asprintf result"):
> On 20/07/2021 15:31, Ian Jackson wrote:
> > fixed this (with slightly different style, and despite not mentioning
> > this change in the commit message)
> 
> ?  Literally half of the commit message pertains to this failure.

Sorry, I meant the title, which talks only about Makefile stuff.

Ian.

