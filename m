Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353C30257F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 14:31:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74076.133135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l41x9-0000kk-5f; Mon, 25 Jan 2021 13:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74076.133135; Mon, 25 Jan 2021 13:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l41x9-0000kM-2A; Mon, 25 Jan 2021 13:30:47 +0000
Received: by outflank-mailman (input) for mailman id 74076;
 Mon, 25 Jan 2021 13:30:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l41x7-0000kH-LC
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 13:30:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l41x7-00054a-Iz
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 13:30:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l41x7-0002ku-Ho
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 13:30:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l41x4-0003jt-Cq; Mon, 25 Jan 2021 13:30:42 +0000
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
	bh=Iv4jpjcvd1L5nSES/wOe66FXplE6+pTG5K1V9NhdwpU=; b=rpD31hK+Yugy9JNGmLNdAj9TDP
	MLhz2Irv6SPiNNUR5ahi9LVXkQjditwE/68wSLB7KtujfEhiQEc0mdGcOauWmw054EKgBYVt3TNT4
	G4uAmPARGqb/xX3y8HQAOrJm6UvCFivhaiK2q6xBUa94Ri5X42Zxp88v3Qf7sOmwsGAY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24590.51202.158693.704888@mariner.uk.xensource.com>
Date: Mon, 25 Jan 2021 13:30:42 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/5] libxenguest: "standardize" LZO kernel
 decompression code
In-Reply-To: <95a3532c-20b3-1e9d-a316-7b20b8473622@suse.com>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
	<4fb01879-4b9c-e711-ecd0-39b0e4d50878@suse.com>
	<20210121150233.elijzzfud3cftrjm@liuwe-devbox-debian-v2>
	<24590.45734.945505.310666@mariner.uk.xensource.com>
	<95a3532c-20b3-1e9d-a316-7b20b8473622@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2 3/5] libxenguest: "standardize" LZO kernel decompression code"):
> On 25.01.2021 12:59, Ian Jackson wrote:
> > I don't mind throwing in the DOMPRINTF too.
> 
> Am I fine to transliterate this into R-a-b?

Err, yes, sorry, should have been more explicit.

Ian.

