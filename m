Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A35D35593C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 18:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106107.202892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lToc9-0003jf-C0; Tue, 06 Apr 2021 16:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106107.202892; Tue, 06 Apr 2021 16:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lToc9-0003jG-8Y; Tue, 06 Apr 2021 16:31:41 +0000
Received: by outflank-mailman (input) for mailman id 106107;
 Tue, 06 Apr 2021 16:31:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lToc7-0003jB-PU
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 16:31:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lToc7-0002eU-Mz
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 16:31:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lToc7-0006i6-KW
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 16:31:39 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lToc4-000811-9E; Tue, 06 Apr 2021 17:31:36 +0100
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
	bh=yoi0DlQX49mHY3ElqjcYVLqJZg+coJloMqEGIAB7ugk=; b=y2tjISL8AVUX1nETtU77nBi5gK
	Me53wAH2hmNQvYEgGTl6arJJtgGGLJ77SfCQvrKHu1h5yFH/WSY3zJ+fXBGwrjBk4n/gkrT6wQGrD
	owTsVlyIVRdI6R3kjmK6x7EI79epYZCMPueiCfqPx0Z+FLmhE3jeEEydegsaKVfzl6CA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24684.36071.972895.582321@mariner.uk.xensource.com>
Date: Tue, 6 Apr 2021 17:31:35 +0100
To: George Dunlap <george.dunlap@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH for-4.15 1/7] CHANGELOG.md: Mention XEN_SCRIPT_DIR
In-Reply-To: <20210401133827.362216-1-george.dunlap@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

George Dunlap writes ("[PATCH for-4.15 1/7] CHANGELOG.md: Mention XEN_SCRIPT_DIR"):
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>

