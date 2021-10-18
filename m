Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E533431E5B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212318.370153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcT9V-0002FM-Cw; Mon, 18 Oct 2021 13:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212318.370153; Mon, 18 Oct 2021 13:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcT9V-0002D3-A3; Mon, 18 Oct 2021 13:58:09 +0000
Received: by outflank-mailman (input) for mailman id 212318;
 Mon, 18 Oct 2021 13:58:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcT9T-0002Cx-CE
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:58:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcT9T-0006Km-8u
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:58:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcT9T-0008G9-7x
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:58:07 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcT9N-00065B-OT; Mon, 18 Oct 2021 14:58:01 +0100
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
	bh=Au1K67xP+k2yvgLe6WaBnRqLuOlvNFFfEExbWSfQ8Q4=; b=yOWXpMA8JkAASelG6OZFn+pPZV
	NwAtFacjddXpGOAKHxxUYlx5j+KSYkbz2lvqmTwa4GdptITnAXperQijp6sh02Ua/sfwMypQnvW2w
	UnDLDh5Y03dQFF197PXeeeFDKIi36zWTy0Qn+wYwudQ6unzw46YGgCkouA57uyTbUJ28=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24941.32105.341239.774328@mariner.uk.xensource.com>
Date: Mon, 18 Oct 2021 14:58:01 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Jane  Malalane <jane.malalane@citrix.com>
Subject: Re: [PATCH for-4.16] tests/resource: Extend to check that the grant
 frames are mapped correctly
In-Reply-To: <f25e1fdb-90fb-7273-243d-e197eb9e2f92@citrix.com>
References: <20211018100848.10612-1-jane.malalane@citrix.com>
	<f25e1fdb-90fb-7273-243d-e197eb9e2f92@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH for-4.16] tests/resource: Extend to check that the grant frames are mapped correctly"):
> On 18/10/2021 11:08, Jane Malalane wrote:
> > Previously, we checked that we could map 40 pages with nothing
> > complaining. Now we're adding extra logic to check that those 40
> > frames are "correct".
> >
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> 
> Ian:  I'd like this to be considered for 4.16.  It is extending an
> existing test case with better error detection.
> 
> It was a task I didn't get around to at the time, because of the 4.15
> release freeze...  How time flies.
> 
> Anyway, it is very low risk to the release, and 0 risk for anyone who
> doesn't run the tests...

Of course.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

