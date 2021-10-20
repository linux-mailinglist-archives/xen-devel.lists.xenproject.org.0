Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEAF434D75
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 16:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213963.372345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdCUc-0002Fm-O4; Wed, 20 Oct 2021 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213963.372345; Wed, 20 Oct 2021 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdCUc-0002Cm-Kq; Wed, 20 Oct 2021 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 213963;
 Wed, 20 Oct 2021 14:22:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdCUb-0002Cg-88
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 14:22:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdCUa-0006uU-Uo
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 14:22:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdCUa-0003ge-Tl
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 14:22:56 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mdCUU-0003yH-7p; Wed, 20 Oct 2021 15:22:50 +0100
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
	bh=l07FE9kwsV71KqdkgrWo71pdjbY0thKVx0EQh2/c0eU=; b=y8aHh+2nPd3bjtX6taQ5okhido
	aYbAT2AhD1efmEWTACMNs3zFeZT3DGJTSs10hO8xJq8/tJCGCMzQ9QeI80zBD59Jop/93zuv+x7lX
	khUJ224cW7iFX9tru7jNxY1s2/ZMwWXbtHPoPCgt2s74O8eCH01q9clGo3j/q2TNw73g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24944.9785.888660.632099@mariner.uk.xensource.com>
Date: Wed, 20 Oct 2021 15:22:49 +0100
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
    Hongda Deng <Hongda.Deng@arm.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v3] xen/arm: vgic to ignore GICD ICPENDRn registers access
In-Reply-To: <d8b62ee4-f782-439e-1f37-01d8616a8566@xen.org>
References: <20211020101021.9793-1-Hongda.Deng@arm.com>
	<87512F00-48DA-4E66-B3A8-47F48B9C6A87@arm.com>
	<24944.6620.647052.30281@mariner.uk.xensource.com>
	<d8b62ee4-f782-439e-1f37-01d8616a8566@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v3] xen/arm: vgic to ignore GICD ICPENDRn registers access"):
> TL;DR: This is a bug fix and I agree that this should be included in 4.16.

Thank you very much for the detailed and helpful reply.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

