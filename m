Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B321B41DFDB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 19:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200142.354553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVze1-00021q-6u; Thu, 30 Sep 2021 17:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200142.354553; Thu, 30 Sep 2021 17:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVze1-0001z0-3h; Thu, 30 Sep 2021 17:14:53 +0000
Received: by outflank-mailman (input) for mailman id 200142;
 Thu, 30 Sep 2021 17:14:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVzdz-0001yu-HL
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 17:14:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVzdz-0004vB-Bu
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 17:14:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVzdz-0005Ow-Aw
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 17:14:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mVzdx-00032o-Hz; Thu, 30 Sep 2021 18:14:49 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=f8Z/iv8ikt50TQ2giy3eqC2D+ZjICP3qy3UB9SpVY1E=; b=ZpWq96sG3Aom96HX9i2cKRTBZk
	aTK2vx09sELiAgqm5tn24vhdcJzpUUrYMH3gen5wrCWRvNlUJs6kQnRQog/XjORjYVTo3I5kuhc8u
	7Npb7Z/Q2dKus/k5frvgL28bmDqb1OIlp4n7UXLU9a/sCboDH5xsXMhIEGp92+YrX3hU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24917.61577.291999.406078@mariner.uk.xensource.com>
Date: Thu, 30 Sep 2021 18:14:49 +0100
To: xen-devel@lists.xenproject.org,
    committers@xenproject.org
Subject: Re: osstest down, PDU failure
In-Reply-To: <24916.53633.593814.456485@mariner.uk.xensource.com>
References: <24916.14069.358118.417330@mariner.uk.xensource.com>
	<24916.53633.593814.456485@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

We have staff on site and are going to replace some PDUs.  There will
be some incomplete flight reports and then an outage.  I'm not sure
when service will be restored...

Ian.

