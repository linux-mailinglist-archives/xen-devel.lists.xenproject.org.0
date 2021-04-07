Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7FB35700B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 17:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106758.204138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9xm-0004du-5o; Wed, 07 Apr 2021 15:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106758.204138; Wed, 07 Apr 2021 15:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9xm-0004dW-1R; Wed, 07 Apr 2021 15:19:26 +0000
Received: by outflank-mailman (input) for mailman id 106758;
 Wed, 07 Apr 2021 15:19:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lU9xk-0004bs-GS
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 15:19:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lU9xk-0007uo-Ea
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 15:19:24 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lU9xk-000672-Cq
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 15:19:24 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lU9xf-00052w-GE; Wed, 07 Apr 2021 16:19:19 +0100
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
	bh=GvpGue6hK6WrmBsnSv9fYunLo++JeTdS38KgxlgCwQg=; b=46+vTlPvBDg6DfU+G4/s5qbdfk
	lNqznKpe3erOISxB7GnNkKt0qlIjmIRdVD7OKm53mgK895BSRKyGnY9JATF/Xw3PTEjKVLdy1bECK
	zZ1fyJ30HFlez6g5In5lTdG6ayxpW4AWKrjcmp3/R6jZXDgPGGUqahKmyGQ1s8hDrEtk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <24685.52599.234444.705703@mariner.uk.xensource.com>
Date: Wed, 7 Apr 2021 16:19:19 +0100
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Julien Grall <julien@xen.org>,
    xen-devel@lists.xenproject.org,
    Bertrand Marquis <bertrand.marquis@arm.com>,
    wei.chen@arm.com,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
In-Reply-To: <0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
	<20210406103603.8530-4-luca.fancellu@arm.com>
	<7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
	<0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Luca Fancellu writes ("Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h"):
> The problem is that Doxygen can’t generate proper documentation for anonymous union/structure, it ends up with warning and/or producing wrong documentation like
> changing names or giving field description to the wrong field.

This does not seem like it would be an impossibly hard feature to add
to doxygen.

Ian.

