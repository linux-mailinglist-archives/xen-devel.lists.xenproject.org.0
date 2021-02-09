Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C1F31544D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 17:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83334.154804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WC4-0008D3-MN; Tue, 09 Feb 2021 16:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83334.154804; Tue, 09 Feb 2021 16:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WC4-0008Ce-J9; Tue, 09 Feb 2021 16:48:52 +0000
Received: by outflank-mailman (input) for mailman id 83334;
 Tue, 09 Feb 2021 16:48:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WC3-0008CZ-Su
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:48:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WC3-0002m1-SA
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:48:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WC3-0004Pk-R4
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:48:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9WC0-0005to-Kq; Tue, 09 Feb 2021 16:48:48 +0000
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
	bh=zPW2ABlkHfszLjqeThttAOSm5mlmwRyifQb60Y/TTrY=; b=iqSGhW7QezZDTXFDJef3HQMGEj
	J/A+Ze5Y9nO5ZWVkRp1qZkUWMokvun7BZdBgwR0MmJGLs7lLI8G/x16MumB7RbEUOFcoBNr+FM+w9
	POQ6CE6qehpuly4QAXIU7QLgwXqs2oHv5W6WX+V/cSb4YoHeTwixGiq+4LFCVk+sv+8Q=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24610.48368.426558.75373@mariner.uk.xensource.com>
Date: Tue, 9 Feb 2021 16:48:48 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210209 1/4] tools: move CONFIG_DIR and XEN_CONFIG_DIR in paths.m4
In-Reply-To: <20210209154536.10851-2-olaf@aepfle.de>
References: <20210209154536.10851-1-olaf@aepfle.de>
	<20210209154536.10851-2-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210209 1/4] tools: move CONFIG_DIR and XEN_CONFIG_DIR in paths.m4"):
> Upcoming changes need to reuse XEN_CONFIG_DIR.
> 
> In its current location the assignment happens too late. Move it up
> in the file, along with CONFIG_DIR. Their only dependency is
> sysconfdir, which may also be adjusted in this file.

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

