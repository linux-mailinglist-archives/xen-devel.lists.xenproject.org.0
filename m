Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E3A2F1908
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64936.114862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyygS-0001gX-25; Mon, 11 Jan 2021 15:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64936.114862; Mon, 11 Jan 2021 15:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyygR-0001g8-Ut; Mon, 11 Jan 2021 15:00:39 +0000
Received: by outflank-mailman (input) for mailman id 64936;
 Mon, 11 Jan 2021 15:00:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyygQ-0001g2-Fs
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:00:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyygQ-0006KP-BX
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:00:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyygQ-0006kS-AU
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:00:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kyygN-0003uB-4o; Mon, 11 Jan 2021 15:00:35 +0000
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
	bh=52iqesxvb2TX5g3pwH2QtROtLe6SDQ+EE7+0us7+jRM=; b=mQlDu1ZfUWHRBRWw0o+pyvuF8z
	xFgVyYT2kHeMPTXrxIKWxvM4lYy7/QbmCfSkamLcoLWoMSczJuVT63jnvduVscMbHPnkRBT5k7aHD
	r8AbWLXTGxY7MxAhZ4GCe67Tm1TAd+KEmkex+N63CORssl2EWJIXKIhUqRy/Oe2Ux3YM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24572.26642.803938.622698@mariner.uk.xensource.com>
Date: Mon, 11 Jan 2021 15:00:34 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libxenstat: ensure strnlen() declaration is visible
In-Reply-To: <ae0d2084-75d7-bcd9-33bc-54b846dd5681@suse.com>
References: <ae0d2084-75d7-bcd9-33bc-54b846dd5681@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] tools/libxenstat: ensure strnlen() declaration is visible"):
> Its guard was updated such that it is visible by default when POSIX 2008
> was adopted by glibc. It's not visible by default on older glibc.
> 
> Fixes: 40fe714ca424 ("tools/libs/stat: use memcpy instead of strncpy in getBridge")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

