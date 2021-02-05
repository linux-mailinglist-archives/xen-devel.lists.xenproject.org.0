Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E206C310D4A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 16:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81818.151255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83Eq-0000aM-8q; Fri, 05 Feb 2021 15:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81818.151255; Fri, 05 Feb 2021 15:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83Eq-0000Zx-5Y; Fri, 05 Feb 2021 15:41:40 +0000
Received: by outflank-mailman (input) for mailman id 81818;
 Fri, 05 Feb 2021 15:41:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l83Eo-0000Zs-L6
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:41:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l83Eo-0000dy-HS
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:41:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l83Eo-0002s4-G5
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:41:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l83El-00030N-4V; Fri, 05 Feb 2021 15:41:35 +0000
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
	bh=i5r1kT9l6nzTnQb8KcgXr4DsHfbpXhigJZttROLTS9Y=; b=GUzsyOf/XTSpG2XbWB1kULcCqn
	1ezV8TsU1ISBCkbVL/Dh7i6XbCn3ehR4qq5Kam2diw1UpmEIkJqNKBwzXQ7b4UM3WD/KZpTILxXYE
	HonL3obWGZ0cZ21UQXPjyQdBS5FwXqXMombUromy9LGfiF9SdPFJEaPIXp4IlhNN0ing=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24605.26414.914939.725856@mariner.uk.xensource.com>
Date: Fri, 5 Feb 2021 15:41:34 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15] tools/configure: add bison as mandatory
In-Reply-To: <20210205115327.4086-1-roger.pau@citrix.com>
References: <20210205115327.4086-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] tools/configure: add bison as mandatory"):
> Bison is now mandatory when the pvshim build is enabled in order to
> generate the Kconfig.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Please re-run autogen.sh after applying.
> 
> Fallout from this patch can lead to broken configure script being
> generated or bison not detected correctly, but those will be cached
> quite quickly by the automated testing.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Reviewed-by: Ian Jackson <iwj@xenproject.org>

I've read the rest of the thread and I prefer Roger's version of this
patch.

Thanks,
Ian.

