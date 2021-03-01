Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63BC3286E0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:17:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91819.173270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmAo-0007dO-EZ; Mon, 01 Mar 2021 17:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91819.173270; Mon, 01 Mar 2021 17:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmAo-0007d2-BZ; Mon, 01 Mar 2021 17:17:34 +0000
Received: by outflank-mailman (input) for mailman id 91819;
 Mon, 01 Mar 2021 17:17:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmAm-0007cu-Rk
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:17:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmAm-0004uX-R0
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:17:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmAm-0002Zt-Q4
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:17:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmAj-0004yU-MM; Mon, 01 Mar 2021 17:17:29 +0000
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
	bh=g+MEZypoAgH3TyF2eulc4CLER4DU0JKZS3c5P4t6lyw=; b=VKQletlaYo7uAk3d7RAY2Dr8bP
	aJPk/S8UTZsrBV6cr8Ee90oG7zcGYO8FNRHp5jL2RJjo6NfUBOEHC929m9YyonhT8BAqcY3VVUTPW
	HjbLacQvcwl7Ggi8ho7x499vje0mQ2o/fhxzdOAKI0Jy8VlcukmuyKC19qmJ7Z0t+VKM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.8617.478842.771632@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:17:29 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] tools: Check for abi-compliance-checker in ./configure
In-Reply-To: <20210301170044.23295-2-andrew.cooper3@citrix.com>
References: <20210301170044.23295-1-andrew.cooper3@citrix.com>
	<20210301170044.23295-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 1/3] tools: Check for abi-compliance-checker in ./configure"):
> This will be optional.  No functional change

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

