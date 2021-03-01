Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B911732832A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 17:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91768.173109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGl9X-0000RN-DH; Mon, 01 Mar 2021 16:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91768.173109; Mon, 01 Mar 2021 16:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGl9X-0000Qy-A4; Mon, 01 Mar 2021 16:12:11 +0000
Received: by outflank-mailman (input) for mailman id 91768;
 Mon, 01 Mar 2021 16:12:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGl9V-0000Qr-9f
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:12:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGl9V-0003lN-8t
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:12:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGl9V-0001bD-7e
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:12:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGl9S-0004nU-2p; Mon, 01 Mar 2021 16:12:06 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=W3370fIQGpW7ie29cqRDW7F4D27s3A36roKk5XpbwBg=; b=65YraLKsdJANDd/uPkIierFEIT
	tj93ciOFsLhzs+xw3XkNpXg9QbOX21C1bu5Lpc+9HfbDoYwopsjsbf9e/FU/Bcbz+OChDTI/ezYzZ
	EVvyKlrWxH4QcKI19en4Pznvz0c5vHZZupM1hG+T5bzDY9NE0k8QX2y+3TM/s7t3wpyo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.4693.875561.826546@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 16:12:05 +0000
To: committers@xenproject.org,
    xen-devel@lists.xenproject.org
Subject: Re: Commit moratorium for Xen 4.15.0-rc1
In-Reply-To: <24636.50438.204769.9038@mariner.uk.xensource.com>
References: <24636.50438.204769.9038@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Commit moratorium for Xen 4.15.0-rc1"):
> I am going to be cutting this RC shortly.  So please don't commit
> anything now, even fixes which already have a release-ack.

The moratorium is lifted.  You may commit patches again.  Note that
the freeze is still in force: every change needs a release-ack.

Thanks,
Ian.


