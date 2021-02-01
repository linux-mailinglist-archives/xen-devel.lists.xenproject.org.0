Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3F530AA52
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 15:59:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79940.145817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ag1-0002Wj-BG; Mon, 01 Feb 2021 14:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79940.145817; Mon, 01 Feb 2021 14:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ag1-0002WK-83; Mon, 01 Feb 2021 14:59:41 +0000
Received: by outflank-mailman (input) for mailman id 79940;
 Mon, 01 Feb 2021 14:59:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ag0-0002WA-33
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:59:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ag0-00046x-2G
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:59:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ag0-0003Wo-1N
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:59:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6afv-0007gD-Cb; Mon, 01 Feb 2021 14:59:35 +0000
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
	bh=B5q6o1TGLLRrNrSxomCbQfBR0hkmteq+1huEep3awn4=; b=3lUNaioN/e5TsKwcIoRWgoTuoQ
	7aBvh8xqoaf3C2geRO/EywgKckWAkCrJn+yTgW9+mjhuQZZe00lLnaCi3t8yDa/jF4A9Kw8cGP9kt
	673cszVZaIz0k1vzayM6rWM0GsQZGWkzYwbE83NiiUfz+yUj8+4UHAbfo4fW18GIynUc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24600.5975.179890.232213@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 14:59:35 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Manuel Bouyer <bouyer@antioche.eu.org>,
    <xen-devel@lists.xenproject.org>,
    Wei  Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/2] Document qemu-ifup on NetBSD
In-Reply-To: <YBfevtNorE5OtQVR@Air-de-Roger>
References: <20210130230300.11664-1-bouyer@netbsd.org>
	<20210130230300.11664-2-bouyer@netbsd.org>
	<YBe6JpR6jOLvYDz6@Air-de-Roger>
	<20210201093747.GA624@antioche.eu.org>
	<YBfevtNorE5OtQVR@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH v3 2/2] Document qemu-ifup on NetBSD"):
> On Mon, Feb 01, 2021 at 10:37:47AM +0100, Manuel Bouyer wrote:
> > Well, as a user, I want to know how the scripts are called, so that I can
> > tune them ...
> 
> Isn't that information on the header of the script? I would expect
> users that want to modify such script will open it and then the header
> should already lists the parameters.
> 
> IMO I would leave the parameters out of this document because we don't
> list them for any other script, so it seems odd to list them for the
> qemu-ifup script only.

I think it is shown there, indeed.  That may not be the best place for
this information.  But maybe putting it somewhere else should be done
systematically rather than ad hoc.  IOW with my maintainer hat on I
don't feel I have a strong opinion.

OTOH from my RM hat

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

since this is a documentation change.

Ian.

