Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DDB421BD8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 03:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201901.356548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXZDp-0005B2-Qp; Tue, 05 Oct 2021 01:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201901.356548; Tue, 05 Oct 2021 01:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXZDp-00058e-N3; Tue, 05 Oct 2021 01:26:21 +0000
Received: by outflank-mailman (input) for mailman id 201901;
 Tue, 05 Oct 2021 01:26:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0nn=OZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mXZDo-00058W-G0
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 01:26:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e18049e-257b-11ec-bec4-12813bfff9fa;
 Tue, 05 Oct 2021 01:26:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED78161406;
 Tue,  5 Oct 2021 01:26:18 +0000 (UTC)
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
X-Inumbo-ID: 3e18049e-257b-11ec-bec4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633397179;
	bh=fphcFAyIr9Owp7rjYXg1gmcORGGWpJyRFdOdnO36iIY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CKjCii2P955VGT+LsEXyUkw7Bt5BvgldS1iD46j8NX0aKolKxhrTr8HdWZzc9nft2
	 QDRXFJQ5FBTbCAYBsWr6FoH8hAbE3widBayb5bh3oW6UaWilxyZvi655jLpBguoaWE
	 q1Qu5Hm4rW0k29YzH6MFsPGQOo7XifnkIV2llqGG99S5rOgrhAnqY6f2DjuKPtgTsn
	 fWAOMXjgu12t540qNx4XT4W3iwBfLLfmWRhWEJQeeDdfYSigp8Hu7yimBzSVKyjyvQ
	 cFC72bOUK6cQaHuXKuAxFu053+VsBVBVY/9oQlAJIcpSxekduN6rp4zTJw7+HK3eGV
	 BuC2UuKA1DJLg==
Date: Mon, 4 Oct 2021 18:26:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <iwj@xenproject.org>
cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    julien.grall.oss@gmail.com, sstabellini@kernel.org, 
    dpsmith@apertussolutions.com
Subject: Re: [adhoc test] 165359: tolerable truncated
In-Reply-To: <24923.38127.990669.853370@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2110041824350.3209@sstabellini-ThinkPad-T480s>
References: <E1mXTS5-00046z-9X@osstest.test-lab.xenproject.org> <24923.38127.990669.853370@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Oct 2021, Ian Jackson wrote:
> iwj@xenbits.xen.org writes ("[adhoc test] 165359: tolerable truncated"):
> > [adhoc play] <testing.git master not a tty>
> > harness 3a3089c9: mfi-common: Drop Linux dom0 i386 tests for newer Lin...
> > 165359: tolerable truncated
> ...
> > Tests which did not succeed, but are not blocking:
> >  test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail  like 165218
> >  test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail  like 165218
> 
> This means that the kernel patch fixed the problem.  Nothing went
> wrong here other than that arm64 doesn't support save/restore and
> migraiton.

Fantastic! Let me know if you would like my help updating the Linux
kernel tree for ARM [1].


[1] git://xenbits.xen.org/arm/linux.git:linux-arm-xen

