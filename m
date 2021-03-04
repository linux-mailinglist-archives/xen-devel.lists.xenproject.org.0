Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C551632D510
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 15:15:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93273.176075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHokk-00056g-Bb; Thu, 04 Mar 2021 14:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93273.176075; Thu, 04 Mar 2021 14:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHokk-00056H-8L; Thu, 04 Mar 2021 14:14:58 +0000
Received: by outflank-mailman (input) for mailman id 93273;
 Thu, 04 Mar 2021 14:14:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHoki-00056C-95
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 14:14:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHoki-0004Me-6B
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 14:14:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHoki-0002u4-3C
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 14:14:56 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHoke-0005Q1-P0; Thu, 04 Mar 2021 14:14:52 +0000
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
	bh=ilTSBOQcaJfKfwwLDwvDkIwXAN/2O/+CIOpiTgfqddc=; b=NCwx4WE+loLVX4C9Q15Vqrf9x0
	HJx7vtf+2sQ6c0V/qTTkop/NNUmP3PgDwuK/7lun5HVEccsCsmTv5SoDcyx5uxlskRQsERHGEsCBi
	3yBhxFqjB5e0HHQPcsGNBgy66Nt66wE322ej+MBt+dcjqBszTe6LSN84vCVOC7BIEVZU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24640.60252.467968.279717@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 14:14:52 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] tools/libxendevicemodel: Strip __XEN_TOOLS__ header guard
In-Reply-To: <20210304130319.10719-1-andrew.cooper3@citrix.com>
References: <20210304130319.10719-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15] tools/libxendevicemodel: Strip __XEN_TOOLS__ header guard"):
> This is inappropriate for the header file of a standalone library with stable
> API and ABI.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>

