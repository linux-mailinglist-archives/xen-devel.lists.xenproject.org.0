Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ABA32ED44
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 15:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93766.177018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIBag-00071v-OK; Fri, 05 Mar 2021 14:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93766.177018; Fri, 05 Mar 2021 14:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIBag-00071W-Kg; Fri, 05 Mar 2021 14:38:06 +0000
Received: by outflank-mailman (input) for mailman id 93766;
 Fri, 05 Mar 2021 14:38:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIBae-00071R-LE
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 14:38:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIBae-00086J-J7
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 14:38:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIBae-0007du-GF
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 14:38:04 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIBaZ-0000Dv-Og; Fri, 05 Mar 2021 14:37:59 +0000
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
	bh=hBMdAiyuWqXTpvFW6O/BDdSDnZWGiXULNTEl4t9KdEc=; b=24AWhZvhJI5E54w0ShIlk0ZXht
	reJRBekaReyDWvPW9LbqzB7YwVhLFrRNwF/2ftYRvtG5vzI8PZcpSmBp3No89h5S3voGZagw1Hwdz
	bDutCSMSC9VPT0n/LW2UBaZQ+GGYv39+X1fmCAnweF0gjD7q/JUzZ8WVv5na10Nfz6Ek=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24642.16967.563767.105312@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 14:37:59 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>,
    xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Increase the
 maximum number of parameters
In-Reply-To: <eb65580f-0b6b-717c-f599-73dc32d790cf@suse.com>
References: <20210305121029.7047-1-julien@xen.org>
	<24642.12417.651929.972294@mariner.uk.xensource.com>
	<eb65580f-0b6b-717c-f599-73dc32d790cf@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jürgen Groß writes ("Re: [PATCH for-4.15] tools/xenstored: liveupdate: Increase the maximum number of parameters"):
> This is the max number of 0 delimited string parameters. Especially the
> stubdom case needs a binary blob (with length, of course) as parameter,
> and the number of 0 bytes in this data is just limited by the allowed
> payload length.
> 
> See the comment in line 111 of xenstored_control.c.

AFAICT this "live-update" command is variadic.  So why is this
parameter set here it all then ?

Ian.

