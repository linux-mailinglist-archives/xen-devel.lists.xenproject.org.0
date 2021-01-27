Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C640306056
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76213.137427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nBv-0004s5-F6; Wed, 27 Jan 2021 15:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76213.137427; Wed, 27 Jan 2021 15:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nBv-0004rg-BW; Wed, 27 Jan 2021 15:57:11 +0000
Received: by outflank-mailman (input) for mailman id 76213;
 Wed, 27 Jan 2021 15:57:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nBu-0004rY-6h
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:57:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nBu-0000uE-4z
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:57:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nBu-0002kD-3q
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:57:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4nBq-0001fV-Ky; Wed, 27 Jan 2021 15:57:06 +0000
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
	bh=rcpAN/7YIaa4FNX8lpnHZeSgOttjkaJniG55WJtExlM=; b=OuDfbdIz3cbvpEs8hOItfbLQ+q
	uo3qWCrYPoSB31p3iyvciZz61kogjaduzsyVYEdRftIKZMgufUx8Gezj6wkHsYybzAF9ZNsdjpmVw
	xnLqhUSBxGf4/m7oAiEb7AcBQP37K53bSovebx+2HFIGg+b5fB0z32ykjt7pcckyrT+I=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24593.36178.400654.382841@mariner.uk.xensource.com>
Date: Wed, 27 Jan 2021 15:57:06 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org,
    Manuel Bouyer <bouyer@netbsd.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD hotplug: Introduce locking functions
In-Reply-To: <20210112181242.1570-3-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<20210112181242.1570-3-bouyer@antioche.eu.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("[PATCH] NetBSD hotplug: Introduce locking functions"):
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> On NetBSD, some block device configuration requires serialisation.
> Introcuce locking functions, and use them in the block script where
> appropriate.

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

