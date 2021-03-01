Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E41F327C6F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 11:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91432.172878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGg0J-00080r-Qi; Mon, 01 Mar 2021 10:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91432.172878; Mon, 01 Mar 2021 10:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGg0J-00080U-NV; Mon, 01 Mar 2021 10:42:19 +0000
Received: by outflank-mailman (input) for mailman id 91432;
 Mon, 01 Mar 2021 10:42:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGg0I-00080P-2E
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 10:42:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGg0H-0006Ae-Tq
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 10:42:17 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGg0H-0000PH-R9
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 10:42:17 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGg0E-0003xI-G7; Mon, 01 Mar 2021 10:42:14 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=kXXWbCgjSJs0IRrH/59fj5mBp1lN/CcyDE0xepKa8XU=; b=nBpZLuPZlGGWH8R84Ga3hFuqqY
	wqRFczGGE9n8SkUkx0T690RNPLR6CpqgCMAaNKYkr0JVMWQeI1qgGXDyqHVFxVi1kmOhT1vXa/pQ4
	VdnvutVK84wX0qhiWkbEy1c2S79Bj8D6x6E4T9kBcP1IUHAJwHDM1gVtxVXcC0NESMEc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24636.50438.204769.9038@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 10:42:14 +0000
To: committers@xenproject.org
CC: xen-devel@lists.xenproject.org
Subject: Commit moratorium for Xen 4.15.0-rc1
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I am going to be cutting this RC shortly.  So please don't commit
anything now, even fixes which already have a release-ack.

Ian.

