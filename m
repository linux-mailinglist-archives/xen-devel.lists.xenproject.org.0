Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA51030779F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:05:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77061.139367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l57vV-0003Cb-8r; Thu, 28 Jan 2021 14:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77061.139367; Thu, 28 Jan 2021 14:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l57vV-0003CC-5q; Thu, 28 Jan 2021 14:05:37 +0000
Received: by outflank-mailman (input) for mailman id 77061;
 Thu, 28 Jan 2021 14:05:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l57vT-0003C5-Py
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:05:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l57vS-00073P-R8
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:05:34 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l57vS-0005JF-QE
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:05:34 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l57vP-0004R7-FC; Thu, 28 Jan 2021 14:05:31 +0000
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
	bh=eFON/BXp4kU1WSGP4fKvH/3i5uJhouBgupno89bBNPo=; b=SHassZpRsYFVTtjvgjWAPLuWLW
	/JMHg2XkS3g1tOaUoJjI2YN/3dCUJCQIlqqPuY1Z0hBdXX3EBmB+7YotLPWnoGphYXZrFZ395OZQA
	ewYFgL/HtRg/jEvqa4GJtNBE6x0X3XAeQRZtrmwqGNdTcREtL75L5XWgZbYR6cOuuw9I=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24594.50346.556569.476826@mariner.uk.xensource.com>
Date: Thu, 28 Jan 2021 14:05:30 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD hotplug: Introduce locking functions
In-Reply-To: <20210127192922.GA26055@mail.soc.lip6.fr>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<20210112181242.1570-3-bouyer@antioche.eu.org>
	<24593.36178.400654.382841@mariner.uk.xensource.com>
	<20210127192922.GA26055@mail.soc.lip6.fr>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH] NetBSD hotplug: Introduce locking functions"):
> thanks, but I submitted a v2 patch which uses a locking.sh derived
> from the linux one, based on your feedback.
> Should I add your Reviewed-by to the v2 ?

Sorry, yes, please.

Ian.

