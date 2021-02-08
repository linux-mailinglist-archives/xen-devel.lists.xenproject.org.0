Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EF331386D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 16:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82932.153438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98m5-0008S9-Nc; Mon, 08 Feb 2021 15:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82932.153438; Mon, 08 Feb 2021 15:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98m5-0008Rn-KZ; Mon, 08 Feb 2021 15:48:29 +0000
Received: by outflank-mailman (input) for mailman id 82932;
 Mon, 08 Feb 2021 15:48:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98m4-0008Ri-Hy
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:48:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98m4-0006mu-GS
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:48:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98m4-0004qT-Dx
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:48:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l98m1-0002pw-3W; Mon, 08 Feb 2021 15:48:25 +0000
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
	bh=q9msgAeqseQIu4nuQh6AjKQUlAj36K5h2z1Obf9CJbc=; b=zvd9tMxEknUF8I95kIF5e23zRO
	iHrR568OmWAn71O7h6G0eHlK9fTbBFg7y/NHk0eIOjk4g8bBs5uHy/2II15FGwiyDH9FIp8DRFkEH
	ECFGItMKNsmfdNFkgsp3fnr3CZfIl/gkWjIP9plCS7gqGmE8zmEfpVVuZAR4ZnImNAD0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.23880.634537.769933@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 15:48:24 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210111 02/39] xl: use proper name for bash_completion file
In-Reply-To: <20210111174224.24714-3-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-3-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210111 02/39] xl: use proper name for bash_completion file"):
> Files in the bash-completion dirs should be named like the commands,
> without suffix. Without this change 'xl' will not be recognized as a
> command with completion support if BASH_COMPLETION_DIR is set to
> /usr/share/bash-completion/completions.
> 
> Fixes commit 9136a919b19929ecb242ef327053d55d824397df

This was committed already.

Ian.

