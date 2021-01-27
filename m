Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76AA3060C2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 17:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76236.137487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nT2-0007il-UC; Wed, 27 Jan 2021 16:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76236.137487; Wed, 27 Jan 2021 16:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nT2-0007iM-Qh; Wed, 27 Jan 2021 16:14:52 +0000
Received: by outflank-mailman (input) for mailman id 76236;
 Wed, 27 Jan 2021 16:14:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nT1-0007iH-NH
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:14:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nT1-0001lL-Lf
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:14:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nT1-0004KQ-Ky
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:14:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4nSy-0001ig-A2; Wed, 27 Jan 2021 16:14:48 +0000
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
	bh=a0Qq3qTh+wSNNeXfF22xR5FKliHZvv1+UEjxy43hIyk=; b=W+ibObAA4TZby2UkOfxcczFAt/
	77AgoPFEgV7eFcEgRhPSenmHy53Jm3doExayOy/LwdYlO9rJRGcaT7ufEqmbQ/+xowEKZFPecvHAs
	LOCQFkjhv3ssZU62y15oOPZ2EsPRTNp58xxwmPpg5YoXHV+YUxCrWn8HxY7zXzjadS6Y=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24593.37240.71682.265115@mariner.uk.xensource.com>
Date: Wed, 27 Jan 2021 16:14:48 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH] MAINTAINERS: correct split libxl paths
In-Reply-To: <c76fdb98-e9b6-81cf-63ca-57d5c18bd0d2@suse.com>
References: <c76fdb98-e9b6-81cf-63ca-57d5c18bd0d2@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] MAINTAINERS: correct split libxl paths"):
> The other half of the originally combined code lives in tools/libs/util/,
> not tools/libs/guest/ (which was split off of libxc).

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

