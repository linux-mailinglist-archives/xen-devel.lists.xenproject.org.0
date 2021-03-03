Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5F32B8B5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 15:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92859.175068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHSml-0005zQ-0s; Wed, 03 Mar 2021 14:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92859.175068; Wed, 03 Mar 2021 14:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHSmk-0005z4-Tn; Wed, 03 Mar 2021 14:47:34 +0000
Received: by outflank-mailman (input) for mailman id 92859;
 Wed, 03 Mar 2021 14:47:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHSmj-0005yz-D1
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 14:47:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHSmj-000290-95
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 14:47:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHSmj-0004tH-81
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 14:47:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHSmf-0002Jc-Sv; Wed, 03 Mar 2021 14:47:29 +0000
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
	bh=Ot4Yx/xN/Ozx9OX9CMmq+oFuLVqtAULwfs6UtmfkIXw=; b=2NBYccBzEcSzAxPfxDgxzOFHb2
	EePnRH1cHEwb/bGmkc4GZAEByNkgVpmbbC9ntbJRCquQ07oubFlQyTJ4N1LTmiqd85B8bCszxLC3x
	xS0jYS7z/ArvB4E7Ak0UDLGMWHdiIdFn3C8CZuEumbbeSqMZH78b6ofxGvKw/da/F1yA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24639.41345.637093.963846@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 14:47:29 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Doug Goldstein <cardoe@cardoe.com>,
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH for-4.15] automation: allow doing hypervisor only builds
In-Reply-To: <20210303143316.16840-1-roger.pau@citrix.com>
References: <20210303143316.16840-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] automation: allow doing hypervisor only builds"):
> For things like randconfig there's no need to do a full Xen build, a
> hypervisor build only will be much faster and will achieve the same
> level of testing, as randconfig only changes the hypervisor build
> options.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> I think it might be good to get this in ASAP in order to reduce the
> load of the gitlab CI loop.
> 
> Release wise the worse that could happen is that gitlab testing is
> broken by this, but I've already done a run myself:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

