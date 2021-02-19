Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A4431FCC3
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 17:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86960.163688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8IM-00063P-Ae; Fri, 19 Feb 2021 16:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86960.163688; Fri, 19 Feb 2021 16:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8IM-000630-7W; Fri, 19 Feb 2021 16:06:18 +0000
Received: by outflank-mailman (input) for mailman id 86960;
 Fri, 19 Feb 2021 16:06:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8IJ-00062t-VP
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:06:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8IJ-00048Q-SZ
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:06:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8IJ-0007jo-QD
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:06:15 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lD8IG-0001GV-IL; Fri, 19 Feb 2021 16:06:12 +0000
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
	bh=zhtwyNPYJpdzEYbBgenSUE5dcpa0r2iqJkD+QVTI2Z4=; b=4Ph/+81mfUCdLlOYZHUoJfteMf
	6hoK/4IWwtoE8wQQAkXaN8gLi1rRsbxrSISyFLYiL7IXOIXFNS5zaGNECDgZaXPxJtO4SfCRcSOdj
	WAFrAGaN7vfAwkbq2uT3OX8/wRjjTsrWenjxvX7OW2AzuXUs7cE7ZDt1vHBLl3ydqJtM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24623.57844.337638.750772@mariner.uk.xensource.com>
Date: Fri, 19 Feb 2021 16:06:12 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Claudemir Todo Bom <claudemir@todobom.com>,
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v3 0/4] x86/time: calibration rendezvous adjustments
In-Reply-To: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
References: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v3 0/4] x86/time: calibration rendezvous adjustments"):
> The middle two patches are meant to address a regression reported on
> the list under "Problems with APIC on versions 4.9 and later (4.8
> works)". In the course of analyzing output from a debugging patch I
> ran into another anomaly again, which I thought I should finally try
> to address. Hence patch 1. Patch 4 is new in v3 and RFC for now.

For patches 1-3:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

