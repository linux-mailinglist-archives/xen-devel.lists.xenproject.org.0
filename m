Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0482531CF1C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 18:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85974.160965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4DQ-0001QS-BZ; Tue, 16 Feb 2021 17:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85974.160965; Tue, 16 Feb 2021 17:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4DQ-0001Q3-8G; Tue, 16 Feb 2021 17:32:48 +0000
Received: by outflank-mailman (input) for mailman id 85974;
 Tue, 16 Feb 2021 17:32:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4DO-0001Py-It
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 17:32:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4DO-0005Z6-H1
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 17:32:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4DO-0007Ni-G0
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 17:32:46 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC4DL-0000y9-9c; Tue, 16 Feb 2021 17:32:43 +0000
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
	bh=af7Cjns37ALhTzRlM7EI0Izs1Esi8Vz92QP9PJocfdg=; b=dPkyvy0a6D3j/JoBcHQ55QX+Tl
	31oGZD63ncUQtQ2JB+06WQg7/a2XrKX5avmkC2ufwhEP1zYE17HoYAAljRZDRg6/3kMrKrqZt0OAX
	1dBcxrU7EFNT1AEi4heV1XvlcTln8W7VLQ/RuvhJpxA/RVjvM9imjYWGxPy/GbEdSt+w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24620.443.68948.235522@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 17:32:43 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 09/10] tools/libs: Add rule to generate headers.lst
In-Reply-To: <20210216164816.27948-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-10-andrew.cooper3@citrix.com>
	<20210216164816.27948-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v2 09/10] tools/libs: Add rule to generate headers.lst"):
> abi-dumper needs a list of the public header files for shared objects, and
> only accepts this in the form of a file.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Reviewed-by: Ian Jackson <iwj@xenproject.org>

