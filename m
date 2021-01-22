Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F21230073C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 16:29:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72873.131361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yNY-0001Tw-N6; Fri, 22 Jan 2021 15:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72873.131361; Fri, 22 Jan 2021 15:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yNY-0001TY-Jb; Fri, 22 Jan 2021 15:29:40 +0000
Received: by outflank-mailman (input) for mailman id 72873;
 Fri, 22 Jan 2021 15:29:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yNX-0001TQ-NO
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:29:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yNX-0001wO-MX
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:29:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yNX-00071Q-Kx
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:29:39 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2yNU-00045O-Gd; Fri, 22 Jan 2021 15:29:36 +0000
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
	bh=phupDh7VSaamLV5940mLdhpgsZThjFmGBfAgjs8LqrI=; b=mi05+rQtgnAr0MkYyuokbkE8xs
	DT+bJhFzUPu4R6dXKv1UULCbLtyWpnAif85FD36RFh6PosFnnyq47SI1PfCcmrxYnwiXbusWflOJU
	Ye9bsY82K8McvstDgxnwA7zc+5tgUMyVq7NJowSvM8HDWf1iRKrN2z9Mhw4n2jj/LGqE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Message-ID: <24586.61280.280629.133286@mariner.uk.xensource.com>
Date: Fri, 22 Jan 2021 15:29:36 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
    Wei Liu <wl@xen.org>,
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v7 07/10] tools/libxc: Add xc_vmtrace_* functions
In-Reply-To: <20210121212718.2441-8-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
	<20210121212718.2441-8-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v7 07/10] tools/libxc: Add xc_vmtrace_* functions"):
> From: Micha³ Leszczyñski <michal.leszczynski@cert.pl>
> 
> Add functions in libxc that use the new XEN_DOMCTL_vmtrace interface.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

