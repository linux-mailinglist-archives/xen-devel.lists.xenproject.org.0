Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA02B454D4C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 19:37:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226979.392423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnPns-0005VI-Ky; Wed, 17 Nov 2021 18:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226979.392423; Wed, 17 Nov 2021 18:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnPns-0005Se-HQ; Wed, 17 Nov 2021 18:37:04 +0000
Received: by outflank-mailman (input) for mailman id 226979;
 Wed, 17 Nov 2021 18:37:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnPnq-0005SY-U2
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 18:37:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnPnq-0006i0-Rl
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 18:37:02 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnPnq-0005Fn-Ql
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 18:37:02 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mnPnl-0006YP-EZ; Wed, 17 Nov 2021 18:36:57 +0000
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
	bh=PDDgpZGQiCZnny5tv94ByOtLb5U7NPHA7iWyCo9dTZk=; b=R8FWbogJeMcZttRbj0ZNE8cTBM
	u3KdtwEjzCKHu3ClaZHV0xfsyfqbcolPYAint42yCkM69/B+jSUtjl8VXlvov+ct3XejsP0AuCCqq
	YBMNTSk1YLOeqsiSx1wmUJh+wTD8IB7SFIsz96fPu5t+87df163UxgQRZPWTfIUQHRoo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24981.19400.547111.994160@mariner.uk.xensource.com>
Date: Wed, 17 Nov 2021 18:36:56 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <amc96@srcf.net>,
    <xen-devel@lists.xenproject.org>,
    "Jan  Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH for-4.16] efi: fix alignment of function parameters in
 compat mode [and 1 more messages]
In-Reply-To: <YZU0fIm7pLAc/z7n@Air-de-Roger>
References: <20211117153350.19823-1-roger.pau@citrix.com>
	<1927a35e-9902-bee8-f7f2-ab8463043d8e@srcf.net>
	<24981.10327.56927.848136@mariner.uk.xensource.com>
	<YZU0fIm7pLAc/z7n@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH for-4.16] efi: fix alignment of function parameters in compat mode [and 1 more messages]"):
> On Wed, Nov 17, 2021 at 04:05:43PM +0000, Ian Jackson wrote:
> > Andrew Cooper writes ("Re: [PATCH for-4.16] efi: fix alignment of function parameters in compat mode"):
> > > This will compile, but the caller won't get any data back unless you 
> > > copy the opposite way here...
> > 
> > Well spotted.  I feel quite the fool!
> 
> Indeed. Will send a fixed version tomorrow. Would you like me to keep
> the release ack Ian?

Yes, please.

Ian.

