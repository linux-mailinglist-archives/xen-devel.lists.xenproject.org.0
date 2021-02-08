Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96532313B5F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 18:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82998.153613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9AcW-0004Ll-LL; Mon, 08 Feb 2021 17:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82998.153613; Mon, 08 Feb 2021 17:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9AcW-0004LO-IC; Mon, 08 Feb 2021 17:46:44 +0000
Received: by outflank-mailman (input) for mailman id 82998;
 Mon, 08 Feb 2021 17:46:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9AcU-0004LJ-Gn
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:46:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9AcU-0000uh-CP
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:46:42 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9AcU-0000Tm-AJ
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:46:42 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9AcP-00038n-Dr; Mon, 08 Feb 2021 17:46:37 +0000
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
	bh=HqbDYQzq5ylB3pQh2NMNQTh6lR+3mFRbwfdeXQvQ5Tw=; b=mWJetaJ44hqn2vsjYUr1Eu6sFV
	SuZLzMMRa4oKrTS/8DxnJTJg47U8RD6hmrBIa44UYEMVlRA6U+pIJMGJTF7a2AWoSB/9hGr2jEHo+
	tW2mD4Z28+AHST2FOOGXkZTIyOltqB2R2CmBpTPu3ARHfX3WcRLq5J1AXC0fu38h5x9c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.30973.166445.944436@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 17:46:37 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>,
    Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210111 15/39] tools/guest: save: move batch_pfns
In-Reply-To: <20210111174224.24714-16-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-16-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210111 15/39] tools/guest: save: move batch_pfns"):
> The batch_pfns array is already allocated in advance.
> Move it into the preallocated area.

I think these patche really need a review from someone who understands
the migration code.  Ideally, Andy, who unfortunately has been very
busy.

I doubt this is going to make it for 4.15 :-( but maybe Andy or
someone else has an opinion.

Thanks,
Ian.

