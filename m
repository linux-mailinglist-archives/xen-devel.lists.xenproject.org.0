Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8683406E3D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 17:34:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184561.333260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOiXl-0000M1-AZ; Fri, 10 Sep 2021 15:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184561.333260; Fri, 10 Sep 2021 15:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOiXl-0000Jy-64; Fri, 10 Sep 2021 15:34:21 +0000
Received: by outflank-mailman (input) for mailman id 184561;
 Fri, 10 Sep 2021 15:34:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOiXj-0000I5-J3
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 15:34:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOiXj-0001VG-II
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 15:34:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOiXj-0001Ly-HT
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 15:34:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mOiXg-0002wW-CN; Fri, 10 Sep 2021 16:34:16 +0100
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
	bh=PY+koOgOtrOY8a+2WMPC2QRjJ2w9TYtusU9QWR9owkg=; b=QFOnpAi3iiazL6XQDIpwh3RKfe
	VTq4Sg7L5FqaXHC1r5oYJCV1mkv61v0h05TPJO2ZtPFZn+hMzV0Vpu/I0oBsO574PdxobeHZWHwLE
	YjIf8x04bbw1uJtdX1LwChz7Frsxw5vKa2Q98Hq/Z20/70uB2aik+1NJJYfPj7VUcz/g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24891.31480.165445.521062@mariner.uk.xensource.com>
Date: Fri, 10 Sep 2021 16:34:16 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>,
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v3 0/3] disable building of pv-grub and qemu-trad per default
In-Reply-To: <20210910055518.562-1-jgross@suse.com>
References: <20210910055518.562-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v3 0/3] disable building of pv-grub and qemu-trad per default"):
> This is a first step of deprecating pv-grub and qemu-trad including
> ioemu-stubdom. Switch the default to not building it.

This is now fully acked.  But can we wait with committing it until we
have a decision about whether to (a) have osstest explicitly enable
the pv-grub and qemu-trad builds (b) have osstest stop testing these
configurations ?

Ian.

