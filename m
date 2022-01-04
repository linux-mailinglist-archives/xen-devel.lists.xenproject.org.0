Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8C484005
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 11:41:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253154.434232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4hFe-0004NS-7A; Tue, 04 Jan 2022 10:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253154.434232; Tue, 04 Jan 2022 10:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4hFe-0004Kz-3b; Tue, 04 Jan 2022 10:41:10 +0000
Received: by outflank-mailman (input) for mailman id 253154;
 Tue, 04 Jan 2022 10:41:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FUAt=RU=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1n4hFc-0004Kt-N2
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 10:41:08 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d03827cd-6d4a-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 11:41:06 +0100 (CET)
Received: by chiark.greenend.org.uk (Debian Exim 4.89 #1) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1n4hFX-0003g0-AT; Tue, 04 Jan 2022 10:41:03 +0000
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
X-Inumbo-ID: d03827cd-6d4a-11ec-81c0-a30af7de8005
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25044.9279.250794.5712@chiark.greenend.org.uk>
Date: Tue, 4 Jan 2022 10:41:03 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    xen-devel@lists.xenproject.org,
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] SUPPORT.md, MAINTAINERS: De-support qemu-xen-traditional
In-Reply-To: <e9e984f3-fc98-9179-1958-0330c828fbda@suse.com>
References: <20211209142640.24437-1-iwj@xenproject.org>
	<4ed5073e-8083-ac72-6477-676eaf2e2eb8@xen.org>
	<e9e984f3-fc98-9179-1958-0330c828fbda@suse.com>
X-Mailer: VM 8.2.0b under 24.4.1 (i586-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] SUPPORT.md, MAINTAINERS: De-support qemu-xen-traditional"):
> FWIW I agree that this needs updating at the same time or in a prereq
> change. I guess it'll need to be someone other than Ian now to pick
> up and progress this patch, though.

Yes, I'm afraid so.

Regards,
Ian.

-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

