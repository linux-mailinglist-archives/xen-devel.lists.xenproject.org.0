Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BF43FC929
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175800.320145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL4Hh-0003PO-Vy; Tue, 31 Aug 2021 13:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175800.320145; Tue, 31 Aug 2021 13:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL4Hh-0003Mk-RW; Tue, 31 Aug 2021 13:58:41 +0000
Received: by outflank-mailman (input) for mailman id 175800;
 Tue, 31 Aug 2021 13:58:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL4Hg-0003Me-I1
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:58:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL4Hg-00076I-FU
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:58:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL4Hg-0003lV-ED
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:58:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mL4Hd-0005P3-4U; Tue, 31 Aug 2021 14:58:37 +0100
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
	bh=sy6Veb1ZYI9g8dOersGmVdHHB08yWWdL10o1SduQ7rw=; b=GgE9l99DRa6wqBHo5JhHpctQB/
	d7I5jEHOe1nybGTqoOpg3ZzgtB5Nvbe+dGxivPJSBcVl38e4pJ5QF7uCXttuJFgeoIGieQ/19CHjE
	xbGX4vDCoWIUwXlwYfHfiXAJnyWHGa1+FN6V4yaWBgOHdEr6JroUbkmOt6+m66Pdnoec=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24878.13708.826632.607786@mariner.uk.xensource.com>
Date: Tue, 31 Aug 2021 14:58:36 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] Config.mk: update OVMF to edk2-stable202108
In-Reply-To: <20210831123637.22647-1-anthony.perard@citrix.com>
References: <20210831123637.22647-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("[XEN PATCH] Config.mk: update OVMF to edk2-stable202108"):
> Update to the latest stable tag.

Thanks.  I am OK with this but I think we should hold off committing
it until the XSA fallout has been sorted.

Ian.

