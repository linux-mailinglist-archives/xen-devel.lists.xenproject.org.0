Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F6D419696
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:44:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197031.349971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrrU-00043e-Gq; Mon, 27 Sep 2021 14:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197031.349971; Mon, 27 Sep 2021 14:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrrU-000400-Ck; Mon, 27 Sep 2021 14:44:08 +0000
Received: by outflank-mailman (input) for mailman id 197031;
 Mon, 27 Sep 2021 14:44:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrrT-0003zl-2g
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:44:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrrT-0001Yw-1x
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:44:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrrT-0005aI-19
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:44:07 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mUrrP-0000mB-RV; Mon, 27 Sep 2021 15:44:03 +0100
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
	bh=smCdIbDJaJpow6x6NDDzRkknRgqMXv83TA7sdSVqiyE=; b=367nAY4oilSM3KCSzBjEUMEQ5t
	MplaC4VEWc5E5hD5qiXDhDUMdq2T3DEWONnX85EpWrKSomgFd8d+CgP7lRb311+KtnoPPFWwCZ+31
	K/2XELEBGJ0sCHMIowaGavwIDlKPSJg8jnSdg8IYPxA9mY/wWfy8OkROY4BAraThqUB4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24913.55475.600304.918870@mariner.uk.xensource.com>
Date: Mon, 27 Sep 2021 15:44:03 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/2] tools/xenstore: set oom score for xenstore daemon on Linux
In-Reply-To: <20210927104813.19772-2-jgross@suse.com>
References: <20210927104813.19772-1-jgross@suse.com>
	<20210927104813.19772-2-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v4 1/2] tools/xenstore: set oom score for xenstore daemon on Linux"):
> Xenstored is absolutely mandatory for a Xen host and it can't be
> restarted, so being killed by OOM-killer in case of memory shortage is
> to be avoided.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

