Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68DE32B912
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 17:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92891.175131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU1x-0006XN-Hq; Wed, 03 Mar 2021 16:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92891.175131; Wed, 03 Mar 2021 16:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU1x-0006X0-Eo; Wed, 03 Mar 2021 16:07:21 +0000
Received: by outflank-mailman (input) for mailman id 92891;
 Wed, 03 Mar 2021 16:07:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU1v-0006Wv-Fo
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:07:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU1v-0003yS-7i
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:07:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU1v-00058q-5U
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:07:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHU1r-0002UN-Q7; Wed, 03 Mar 2021 16:07:15 +0000
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
	bh=Jap/lmAbctN+mtVe0fGTv7j6G5xaS53ElkXV5yjKUP0=; b=LQbOFzLzD6cCBk1L0xoR+WUEy/
	4cWTR1gy03kg7daBVubyr1uWEFImx7wG6BcvvQIRZW0SaqW8NC4yihU0t9sO0gkUTlBT46CNBaXja
	D5U8Zeo07EXFp18ZwrI6/5oInMoQUrHNf5UNiSB/Yc58g+uCa8lhZ9bdJtbgyAxJ2lXs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.46131.485802.8646@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 16:07:15 +0000
To: Norbert Manthey <nmanthey@amazon.de>
Cc: <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Julien Grall <jgrall@amazon.co.uk>,
    Michael Kurth <mku@amazon.de>
Subject: [PATCH XENSTORE v1 01/10] xenstore: add missing NULL check
In-Reply-To: <20210226144144.9252-2-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
	<20210226144144.9252-2-nmanthey@amazon.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Norbert Manthey writes ("[PATCH XENSTORE v1 01/10] xenstore: add missing NULL check"):
> In case of allocation error, we should not dereference the obtained
> NULL pointer. Hence, fail early.
> 
> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.
> 
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
> Reviewed-by: Thomas Friebel <friebelt@amazon.de>
> Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

