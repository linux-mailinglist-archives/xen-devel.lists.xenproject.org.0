Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 963AB874182
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 21:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689510.1074565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhy5a-0007FO-LO; Wed, 06 Mar 2024 20:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689510.1074565; Wed, 06 Mar 2024 20:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhy5a-0007DP-Ir; Wed, 06 Mar 2024 20:42:10 +0000
Received: by outflank-mailman (input) for mailman id 689510;
 Wed, 06 Mar 2024 20:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z7ZQ=KM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rhy5Z-0007DH-52
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 20:42:09 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feb9a33e-dbf9-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 21:42:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 93561CE18AA;
 Wed,  6 Mar 2024 20:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7652C433C7;
 Wed,  6 Mar 2024 20:41:59 +0000 (UTC)
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
X-Inumbo-ID: feb9a33e-dbf9-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709757720;
	bh=F87rbMZnTbKfZEsOfR1PaoKgqSD8a33z5RdmXGnAvSk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BOXZkDmhAYut609VFoMHNENrQALFu2sz/6zEPx9Tb0DiwVDcYAqXURgXxj9vxciom
	 wNTE2oBiosQWWi3JDmJk9aRfhaodBZOqBgg+M4LfDmn8PrlEu/aYjWO7e/q3J1gIUA
	 2a9QZVvAwuJFYBvJykttMuWKWikBfEnciMyDnenkmMn9PDHSueeeDVDRxvFRtso4XN
	 oGFw1zKE+CErJQ1FgnkxrbGCP4adNYTYGwGqL72UpvTdP3TZYhBa4ftrih3X5G8/R3
	 OM3jvHvZhgx8Tamv2kMwov60lKvwlMHRDsn0jqiMLvGwQiGGxIlSyVpm1zJkm5taVc
	 /xFwPP1NJCHkQ==
Date: Wed, 6 Mar 2024 12:41:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] features.h: Replace hard tabs
In-Reply-To: <20240306185032.103216-2-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2403061241460.853156@ubuntu-linux-20-04-desktop>
References: <20240306185032.103216-1-jason.andryuk@amd.com> <20240306185032.103216-2-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Mar 2024, Jason Andryuk wrote:
> Replace hard tabs to match the rest of the file.
> 
> Fixes: 48a3fd1432 ("domain: expose newly introduced hypercalls as XENFEAT")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


