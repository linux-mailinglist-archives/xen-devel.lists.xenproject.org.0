Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFC3376323
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 11:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123902.233774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lex9A-0008Pd-AU; Fri, 07 May 2021 09:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123902.233774; Fri, 07 May 2021 09:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lex9A-0008Ms-6q; Fri, 07 May 2021 09:51:48 +0000
Received: by outflank-mailman (input) for mailman id 123902;
 Fri, 07 May 2021 09:51:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lex98-0008Mm-Fv
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 09:51:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lex98-0004Uj-D7
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 09:51:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lex98-0001VO-C9
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 09:51:46 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lex95-0006Yk-1i; Fri, 07 May 2021 10:51:43 +0100
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
	bh=O7hDt9LQn4hn+QaJ1ujSB3S61m9ILuUEVtCZVqhdcLA=; b=BsfAtd5DHgdsDXubZ4+3yJUx71
	ZY+w+Fja72bP6m+9IV+C0BpUZRG9y+EtHKgw26COggLnfeMogpCPMcipoL2dwlBWAqqO4+RwTzpDS
	h0pmkwmFP6gaC2KCw++e3OA4fPw28dcyq6/tPhy6SO5SkIcrNU/pfW89cu21SShsAXKg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24725.3502.744677.621162@mariner.uk.xensource.com>
Date: Fri, 7 May 2021 10:51:42 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [xen-4.12-testing test] 161776: regressions - FAIL
In-Reply-To: <d0e817e2-4097-239a-ee16-95f23e9ca52d@suse.com>
References: <osstest-161776-mainreport@xen.org>
	<24724.6389.95487.1868@mariner.uk.xensource.com>
	<d0e817e2-4097-239a-ee16-95f23e9ca52d@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-4.12-testing test] 161776: regressions - FAIL"):
> I did consider this as an option, but I don't think it's this simple.
> Neither 4.11 and older nor 4.13 and newer exhibit such behavior. In
> fact in 4.12 we appear to see pushes blocked now because there was a
> success of this test once, in flight 159418. So while this may not
> be a regression within 4.12 (and hence a force push may still be an
> appropriate step), there is something wrong there with 4.12, I would
> say. It being out of (general) support may of course mean we want to
> leave it at that. Better, for the remaining time the branch is in
> security-only maintenance state, would of course be to identify the
> (presumably) missing backport ... Of course that's easy to say for
> me, because I don't think I would realistically be the one to
> undertake such an exercise.

Hrm.  For now I have force pushed it as I suggested.

Ian.

