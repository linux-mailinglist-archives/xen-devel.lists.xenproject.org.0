Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23953055E2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 09:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75833.136647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gKD-0008Gz-4N; Wed, 27 Jan 2021 08:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75833.136647; Wed, 27 Jan 2021 08:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gKD-0008Gd-18; Wed, 27 Jan 2021 08:37:17 +0000
Received: by outflank-mailman (input) for mailman id 75833;
 Wed, 27 Jan 2021 08:37:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4gKC-0008GY-2y
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 08:37:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 513d3f93-d549-499e-83e9-9fadc054b175;
 Wed, 27 Jan 2021 08:37:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C495B756;
 Wed, 27 Jan 2021 08:37:14 +0000 (UTC)
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
X-Inumbo-ID: 513d3f93-d549-499e-83e9-9fadc054b175
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611736634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCZynYYTAdRKROo8DEMR/Z5uC5YJ4nhJyuhyu0F2Gzo=;
	b=RcR3TgnLl3l6vpi2jFGjwudFMFhYC3RKTBP4uQ0GfOKxHnnBEmx7mEy73TL4MKk69BXTwW
	0PoblkINJ9yjVqkvobF+wCw/eLcYxgjgZ00Qs+hKeNS5GLy8hFCieSvHCI9ZcMFtnGx1oE
	4sPAimewZ79oCuSOCG4Z7/v/exwzKQM=
Subject: Re: [PATCH] Fix error: array subscript has type 'char'
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Manuel Bouyer <bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
 <20210114122912.GA2522@antioche.eu.org>
 <1af2b532-4dce-29cf-94ae-ad0c399ecbce@suse.com>
 <20210114141615.GA9157@mail.soc.lip6.fr>
 <20210126174415.GA21858@mail.soc.lip6.fr>
 <24592.22685.67161.585056@mariner.uk.xensource.com>
 <2452d5cb-90ba-a4c4-a5e4-3070c5a676d2@suse.com>
Message-ID: <27ec4834-ebf2-2121-47f7-470083d03a3f@suse.com>
Date: Wed, 27 Jan 2021 09:37:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2452d5cb-90ba-a4c4-a5e4-3070c5a676d2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.01.2021 09:31, Jan Beulich wrote:
> But yes, I'm not the maintainer of this code, so if you're
> happy with such risks, so be it.

And actually I was only partly right here - there's one hunk
here affecting code I'm the maintainer just as much as you
are. At least there I'd like to ask that ...

> For the record, to me the less risky approach here would seem
> to have been to make use of compilers allowing to choose
> whether plain char is signed or unsigned, and force it to
> unsigned for at least the affected components.

... this be considered as an alternative, before I maybe
withdraw my de-facto nak.

(To amend my earlier reply: Such a command line option
addition could then also be properly commented, to explain
the particular need for the option.)

Jan

