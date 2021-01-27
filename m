Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED3F306020
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:48:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76191.137379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n3O-0003X7-L6; Wed, 27 Jan 2021 15:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76191.137379; Wed, 27 Jan 2021 15:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n3O-0003Wi-Hr; Wed, 27 Jan 2021 15:48:22 +0000
Received: by outflank-mailman (input) for mailman id 76191;
 Wed, 27 Jan 2021 15:48:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n3M-0003WW-SR
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:48:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n3M-0000kE-Qr
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:48:20 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n3M-00022v-Q9
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:48:20 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4n3I-0001e3-6A; Wed, 27 Jan 2021 15:48:16 +0000
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
	bh=PI+hG9NVN+A7MAXc/JCmbOhIAVsEMucd6F4dZzcaxa8=; b=Yw1T7KULfEHO7S/8Z8bbZ0yIib
	KDU/upKqi8nl2thpZEeFZieg6ZVW4M2JtiQ6BL/czluJyTd+v6oSwGBtE5Y0K3Pxw7nUqlPjIKlro
	ggn+Umgil0FxZrSy19EiZ2/5OhBjWwZJpFkcJNtOwFY5PfwfQaL22HWldh399oOOei2w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24593.35647.975254.988331@mariner.uk.xensource.com>
Date: Wed, 27 Jan 2021 15:48:15 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: MAINTAINERS vs libxl
In-Reply-To: <c427c7f7-05ed-e537-76c2-c900a753755d@suse.com>
References: <c427c7f7-05ed-e537-76c2-c900a753755d@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("MAINTAINERS vs libxl"):
> In commit 032a96e5ef38 tools/libxl/ was split into
> tools/libs/light/ and tools/libs/guest/. Wasn't the latter
> rather meant to be tools/libs/util/, as that's the other part
> of what had previously resided under tools/libxl/?

I think so, yes.

Ian.

