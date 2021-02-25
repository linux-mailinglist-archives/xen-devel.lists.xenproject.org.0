Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7535F324F6E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 12:49:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89681.169124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFF93-0006qi-Cw; Thu, 25 Feb 2021 11:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89681.169124; Thu, 25 Feb 2021 11:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFF93-0006qN-9s; Thu, 25 Feb 2021 11:49:25 +0000
Received: by outflank-mailman (input) for mailman id 89681;
 Thu, 25 Feb 2021 11:49:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFF91-0006qE-VU
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 11:49:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFF91-0007gs-T2
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 11:49:23 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFF91-0005Ou-R3
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 11:49:23 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lFF8y-0001Iv-CQ; Thu, 25 Feb 2021 11:49:20 +0000
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
	bh=JKGe0tQNVfYsDa0X9Le36lM2G383Bbq0PEjFEDxMFLc=; b=Yfgg+XikABNqNHt5EpauRBueq3
	NNVZBsi1iTJ7zwHiTQoNQfGreLNur027ajPxZ4mT9apXoHVE9Uid21RBTpYhz8zftCG9nZ9iCBRT7
	T8ehO5N+0Emi1IOOeCRkbvWzK6Du83h74E5TqGNT2HT4xyuQKJEW/ER9rZbTOZ/2iZcA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24631.36543.997035.838556@mariner.uk.xensource.com>
Date: Thu, 25 Feb 2021 11:49:19 +0000
To: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH][4.15] tools: Fix typo in xc_vmtrace_set_option comment
In-Reply-To: <3e81757428750eb351ea9d938bf0770026be4c33.1614253079.git.hubert.jasudowicz@cert.pl>
References: <3e81757428750eb351ea9d938bf0770026be4c33.1614253079.git.hubert.jasudowicz@cert.pl>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Hubert Jasudowicz writes ("[PATCH][4.15] tools: Fix typo in xc_vmtrace_set_option comment"):
> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

