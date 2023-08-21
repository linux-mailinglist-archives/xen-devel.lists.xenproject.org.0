Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 550EF78250A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587337.918685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXzsA-0004vt-KF; Mon, 21 Aug 2023 08:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587337.918685; Mon, 21 Aug 2023 08:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXzsA-0004sm-Go; Mon, 21 Aug 2023 08:02:50 +0000
Received: by outflank-mailman (input) for mailman id 587337;
 Mon, 21 Aug 2023 08:02:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qXzs9-0004sd-GT
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 08:02:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qXzs9-0007vi-0V; Mon, 21 Aug 2023 08:02:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qXzs8-0001PI-SC; Mon, 21 Aug 2023 08:02:48 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=/m+sXyxsV/3JaBAvTAsFNEPjvjKy1KO2kE4TwuBSvfI=; b=KdVR9lgVYL071c1E+hZlXAKZhV
	FtssnzZKeKA8dHlOaztXo3c/ypMV1OIYSWGxDs5WKnGQ8HgSbNYTXK+IzfGbjsUhtUdT2+hbMdmTZ
	z2DLZvA3nmMWxaA5159zcEI7wOnkQrWKtP9zcQZgsPdNzo86VSc0n2DD83xmt+A09wts=;
Message-ID: <47ec3b42-f3d6-4877-8b8e-e9eff76af2ff@xen.org>
Date: Mon, 21 Aug 2023 09:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] tools/xenstore: move xenstored sources into dedicated
 directory
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230818140848.20220-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230818140848.20220-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 18/08/2023 15:08, Juergen Gross wrote:
> In tools/xenstore there are living xenstored and xenstore clients.
> They are no longer sharing anything apart from the "xenstore" in their
> names.
> 
> Move the xenstored sources into a new directory tools/xenstored while
> dropping the "xenstored_" prefix from their names. This will make it
> clearer that xenstore clients and xenstored are independent from each
> other.
> 
> In order to avoid two very similar named directories below tools,
> rename tools/xenstore to tools/xs-clients.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

