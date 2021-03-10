Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3953341CF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 16:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96191.181782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK10a-0001Us-8f; Wed, 10 Mar 2021 15:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96191.181782; Wed, 10 Mar 2021 15:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK10a-0001UT-5D; Wed, 10 Mar 2021 15:44:24 +0000
Received: by outflank-mailman (input) for mailman id 96191;
 Wed, 10 Mar 2021 15:44:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK10Y-0001UO-Dn
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:44:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK10Y-0004rz-9q
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:44:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK10Y-00062q-8H
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:44:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lK10U-0006bB-WE; Wed, 10 Mar 2021 15:44:19 +0000
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
	bh=AVawnhUgiSgn4PUQFg8OlfOcIbePn+icAYr2WAmLf4Y=; b=y46zuqSydbXM4McI9gUJ/Yj+VL
	GfQZkX7RqLaBExa2ukk5UI88ehsQ2degD4T10M+8XEskh6Rw5hCra11dd/qZEe5pbKh/3PoNMdDs5
	nR/5ly7Zdc71wXPTgrfRBQZby96CWHYAo+7bXsC20B7Ix/ZtwX2aGjW3DW3VmFMChU5c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24648.59730.735948.801324@mariner.uk.xensource.com>
Date: Wed, 10 Mar 2021 15:44:18 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
In-Reply-To: <04a54768-e1ae-4fc4-caf4-50327920a4e7@citrix.com>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
	<24648.57971.488443.593050@mariner.uk.xensource.com>
	<04a54768-e1ae-4fc4-caf4-50327920a4e7@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard from public API"):
> Thanks, but you already release acked it.  This is the requested update
> including the documentation change.

Oh yes so I did.

Ian.

