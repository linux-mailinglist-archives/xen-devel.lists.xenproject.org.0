Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D6E4D7F59
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 11:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290093.491998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nThVY-0000T3-5I; Mon, 14 Mar 2022 10:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290093.491998; Mon, 14 Mar 2022 10:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nThVY-0000Py-1k; Mon, 14 Mar 2022 10:00:56 +0000
Received: by outflank-mailman (input) for mailman id 290093;
 Mon, 14 Mar 2022 10:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V24r=TZ=xen.org=julien@srs-se1.protection.inumbo.net>)
 id 1nThVW-0000Ps-TK
 for xen-devel@lists.xen.org; Mon, 14 Mar 2022 10:00:55 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1f0af21-a37d-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 11:00:53 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nThVT-0001FO-On; Mon, 14 Mar 2022 10:00:51 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nThVT-0003up-Iu; Mon, 14 Mar 2022 10:00:51 +0000
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
X-Inumbo-ID: a1f0af21-a37d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Fx+hiWYfzPVZVzTD2vYyiLrLdz5SWQnLfAvaQT0sd0c=; b=UEYTKhYMHhA4/rkqFusFYxBf8h
	fZvgjyI7XK3ywOYBmocR2t+zxWMMmeZFe1kIxPU1kethdAuttn7Tap6Tl6bcbyletPgpcPZNMp/kp
	ncAFIFzDowjbn27hM5dfwhxtSLIoW31Bo+RS5p0V05Qxi9GV5kxZjeAUi1tSpK3/9qN4=;
Message-ID: <91222ce2-05d4-3a75-6da0-f9a8066e6fb7@xen.org>
Date: Mon, 14 Mar 2022 10:00:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] MAINTAINERS: Propose Henry Wang as the new release
 manager
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org
Cc: Henry Wang <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220310214655.14510-1-george.dunlap@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220310214655.14510-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi George,

On 10/03/2022 21:46, George Dunlap wrote:
> ARM has proposed Henry Wang as a release manager for 4.17.  Signify
> this by giving him maintainership over CHANGELOG.md.
> 
> Below is an introduction given by Bertrand Marquis:
> 
> Henry Wang is an open-source software engineer at Arm focusing on the
> hypervisor and virtualization technology. Before joining the
> AIS-Hypervisor team, he was one of the leading Arm contributors of the
> Rust-VMM and the Cloud Hypervisor community.  He is the Arm reviewer
> of the Cloud Hypervisor project. His work includes basic project
> enabling on Arm platform, Arm device emulation, advanced features
> support on Arm and bug fixes.
> 
> After joining the AIS-Hypervisor team at Arm, he has been involved in Xen feature
> development on Arm in various areas, including:
> 
> 1. Xen Arm MPAM extension research and PoC: Ongoing, the design will
> share in xen-devel soon.
> 
> 2. Port of Xen to Arm MPU systems: Working together with Penny Zheng
> on coding and testing, will be soon sent to xen-devel.
> 
> 3. Static Xen heap on Arm: Work done but depend on the direct mapping
> series from Penny Zheng, will be upstreamed in the next weeks.
> 
> 4. Virtio PoC for Xen on Arm using kvmtool as the Xen virtio backend:
> Work done, including the enabling of the virtio and the virtio
> performance tuning.
> 
> 5. Participated in code reviews and discussions in xen-devel,
> including the foreign memory mapping series from EPAM, etc.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

