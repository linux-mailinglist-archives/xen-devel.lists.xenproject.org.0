Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D631103F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 19:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81883.151407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l866x-0003t6-4O; Fri, 05 Feb 2021 18:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81883.151407; Fri, 05 Feb 2021 18:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l866x-0003sj-0v; Fri, 05 Feb 2021 18:45:43 +0000
Received: by outflank-mailman (input) for mailman id 81883;
 Fri, 05 Feb 2021 18:45:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l866v-0003se-8z
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 18:45:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l866v-0004BF-6U
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 18:45:41 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l866v-000412-3p
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 18:45:41 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l866r-0003Ns-Ti; Fri, 05 Feb 2021 18:45:37 +0000
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
	bh=ttXgd32hlMCpaFX3vSRQwg+LXtqXxCIbeUaW0PkKeN8=; b=Qrk1JGYPgVugRU2ptQ86Xp7mBu
	RQ4SMtanG+SvWhc0GbHo7YFO7e3N2NWc0Z7gp8wpXJmdnqus7NfwhM0QoS6Ek7LHObAbHTjCa8Wmh
	K1AaDHOCdzry0PJk4U694j6TGV3bqrJV+snH2BoFf3ZJdkyLFMumbP6aEaUR6eMcEmck=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24605.37457.630412.791202@mariner.uk.xensource.com>
Date: Fri, 5 Feb 2021 18:45:37 +0000
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    <wl@xen.org>,
    <anthony.perard@citrix.com>,
    <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH v2 1/2] tools/libxl: pass libxl__domain_build_state to libxl__arch_domain_create
In-Reply-To: <1612382824-20232-1-git-send-email-igor.druzhinin@citrix.com>
References: <1612382824-20232-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Igor Druzhinin writes ("[PATCH v2 1/2] tools/libxl: pass libxl__domain_build_state to libxl__arch_domain_create"):
> No functional change.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

