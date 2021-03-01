Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C9832832E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 17:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91774.173132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlBJ-0000f7-1Y; Mon, 01 Mar 2021 16:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91774.173132; Mon, 01 Mar 2021 16:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlBI-0000ej-UX; Mon, 01 Mar 2021 16:14:00 +0000
Received: by outflank-mailman (input) for mailman id 91774;
 Mon, 01 Mar 2021 16:14:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGlBI-0000ee-9w
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:14:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGlBI-0003n8-8i
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:14:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGlBI-0001iM-7p
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:14:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGlBE-0004o6-VF; Mon, 01 Mar 2021 16:13:57 +0000
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
	bh=SvujKVnHxX+c+pmZGpFcUGlU7CNVNkeTfmMhkQE7tlY=; b=o927IR/gKZ3HoCU4mcIdL3DioD
	sQSfoDGfPkTElFn8rNOcRpMmy8966sV1wjzz/XYf11zFdQsTagZyjesFwHesRvr1FFMiLPozv/GyQ
	QGrByC9JTlZhD9+IvADwfJrZBtwhre8Hh3RPwTKS5Y+chcoaARdlXnkw9O2LxCq2z4JI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.4804.738599.535374@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 16:13:56 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.15] cirrus-ci: Drop obsolete dependency
In-Reply-To: <20210226124647.19596-1-andrew.cooper3@citrix.com>
References: <20210226124647.19596-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15] cirrus-ci: Drop obsolete dependency"):
> markdown as a dependency was dropped in 4.12
> 
> Fixes: 5d94433a66 ("cirrus-ci: introduce some basic FreeBSD testing")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

