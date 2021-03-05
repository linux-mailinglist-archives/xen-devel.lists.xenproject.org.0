Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A1C32EC09
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93696.176790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIASo-0006ix-QD; Fri, 05 Mar 2021 13:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93696.176790; Fri, 05 Mar 2021 13:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIASo-0006iY-Mm; Fri, 05 Mar 2021 13:25:54 +0000
Received: by outflank-mailman (input) for mailman id 93696;
 Fri, 05 Mar 2021 13:25:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIASn-0006iP-CQ
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:25:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIASn-0006it-Bi
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:25:53 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIASn-0001t0-Ar
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:25:53 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIASj-0008Ot-Li; Fri, 05 Mar 2021 13:25:49 +0000
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
	bh=TR33K6zlYTlf0L931+VL20bYC5fZ2PKK1LMzinsc2yo=; b=RPSR7y+ux50jNb8wqgTSICsLN0
	TLcRLyLhZg3+yK1o041xTuH/sA8GKX5pbZ3/ZYHJ3IOBn0oPohbqopYNbKJedj176VqqWdm61Da2v
	Z9WoYQj36vaiFOLmEOcr6DTu+ISxL+zIjwA4DahsNzweOVEjq325XwvsFXq9TSozN4lc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24642.12637.396968.875901@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 13:25:49 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/3] tools/libxentoolcore: Fill in LIBHEADERS
In-Reply-To: <20210305124949.6719-2-andrew.cooper3@citrix.com>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
	<20210305124949.6719-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 1/3] tools/libxentoolcore: Fill in LIBHEADERS"):
> c/s 4664034cd replaced a glob over include/*.h with an expectation that
> LIBHEADER was suitably set for libraries which didn't have a single,
> consistently named, header file.
> 
> This wasn't true for xentoolcore, which lost xentoolcore_internal.h as a
> consequence, and failed an API/ABI check vs 4.14
> 
> Fixes: 4664034cd ("tools/libs: move official headers to common directory")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

