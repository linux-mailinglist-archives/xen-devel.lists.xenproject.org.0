Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B33571F1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 18:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106817.204241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAn4-0002nR-DQ; Wed, 07 Apr 2021 16:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106817.204241; Wed, 07 Apr 2021 16:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAn4-0002n1-9r; Wed, 07 Apr 2021 16:12:26 +0000
Received: by outflank-mailman (input) for mailman id 106817;
 Wed, 07 Apr 2021 16:12:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUAn3-0002mw-DS
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 16:12:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUAn3-0000tt-AO
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 16:12:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUAn3-00023u-8V
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 16:12:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lUAmx-0005BJ-5B; Wed, 07 Apr 2021 17:12:19 +0100
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
	bh=h/d/PKBiJh1UD5ptvk2ftxxSZVOMD5M19GXLqBilFqY=; b=W1OD5+PhR9ZiRkiFTInF/1yEKg
	IJ+kd8w/+9e9BQscihHZAjSzHzpou/MjXEDs2H35xwX4vzwSYA4qI0lJSLyL2B5hvorcY+BdydIVd
	xn4bQPFP/c4e/G3uMbbkaI1oXsnY+ZZ7K5DE9sbSIvQuigCVYqChjbA4pBKWCnYe83cA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24685.55778.953134.793523@mariner.uk.xensource.com>
Date: Wed, 7 Apr 2021 17:12:18 +0100
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>,
    Luca Fancellu <Luca.Fancellu@arm.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Chen <Wei.Chen@arm.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano  Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
In-Reply-To: <9B8BD2C5-297C-4BE3-8476-5D10699712E2@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
	<20210406103603.8530-4-luca.fancellu@arm.com>
	<7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
	<0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
	<24685.52599.234444.705703@mariner.uk.xensource.com>
	<03084EF9-F130-41F7-9D8D-9AF86A87717F@arm.com>
	<8b0fafe2-989e-5a5a-05ec-f55e096e4b54@xen.org>
	<9B8BD2C5-297C-4BE3-8476-5D10699712E2@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Bertrand Marquis writes ("Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h"):
> Somehow in the documentation when you have a union you will need to document that it is a union and the possible entries.

I would expect to find the documentation for an anonymous struct or
union folded into the documentation of the containing structure, just
as it is in the source.

> One way or an other most standards like MISRA are forbidding anonymous entries as they cannot be referred to.

An anonymous union or struct like this is always the type of a single
field in a containing aggegate type.  So if one needs to speak of it,
one can specify the container's type and the field.  So it *can* be
named.

I am assuming we don't have *unused* anonymous structs and unions.

Ian.

