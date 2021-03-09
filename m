Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E86033293F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95536.180408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdkw-0004k1-Nd; Tue, 09 Mar 2021 14:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95536.180408; Tue, 09 Mar 2021 14:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdkw-0004jc-K4; Tue, 09 Mar 2021 14:54:42 +0000
Received: by outflank-mailman (input) for mailman id 95536;
 Tue, 09 Mar 2021 14:54:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJdkv-0004jX-OO
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:54:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a61d2a39-0e73-41c8-b80d-bd2fd8d6ec98;
 Tue, 09 Mar 2021 14:54:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A81FAC8C;
 Tue,  9 Mar 2021 14:54:40 +0000 (UTC)
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
X-Inumbo-ID: a61d2a39-0e73-41c8-b80d-bd2fd8d6ec98
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615301680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETTUihX3iW7pnaaMUGCw+M/HQk6c3CfgbtPXSoBXFyQ=;
	b=VRTZUsWNfBiUF41sXeHfnmmn31wWpizh3TcZFkka/YUn8JPDoAktp9fMDz8+Zi8UwWgXZT
	Ls/vCkNkn1oRL1Uqr4E+pIMBCKu+SsU0DNHzuXc1z6CqUFje3600qjwQ++L1Pkp7QW0Pr3
	d8nwI+a3Ec6raUg1uDDK8KT2265UGds=
Subject: Re: [PATCH 4.15 2/3] CHANGELOG.md: Clear out 4.14 stuff and start
 4.15 info
To: Ian Jackson <iwj@xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20210309145002.30359-1-iwj@xenproject.org>
 <20210309145002.30359-3-iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d5c56af-e7dd-1861-0246-b3c1760cb8e9@suse.com>
Date: Tue, 9 Mar 2021 15:54:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309145002.30359-3-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.03.2021 15:50, Ian Jackson wrote:
> Signed-off-by: Ian Jackson <iwj@xenproject.org>
> ---
>  CHANGELOG.md | 27 +--------------------------
>  1 file changed, 1 insertion(+), 26 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5c3d3c791d..4ecd157a35 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -6,31 +6,6 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
>  ## [Unreleased](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog)
>  
> -### Added
> - - This file and MAINTAINERS entry.
> - - Use x2APIC mode whenever available, regardless of interrupt remapping
> -   support.
> - - Performance improvements to guest assisted TLB flushes, either when using
> -   the Xen hypercall interface or the viridian one.
> - - Assorted pvshim performance and scalability improvements plus some bug
> -   fixes.
> - - Hypervisor framework to ease porting Xen to run on hypervisors.
> - - Initial support to run on Hyper-V.
> - - Initial hypervisor file system (hypfs) support.
> - - libxl support for running qemu-xen device model in a linux stubdomain.
> - - New 'domid_policy', allowing domain-ids to be randomly chosen.
> - - Option to preserve domain-id across migrate or save+restore.
> - - Support in kdd for initial KD protocol handshake for Win 7, 8 and 10 (64 bit).
> - - Tech preview support for Control-flow Execution Technology, with Xen using
> -   Supervisor Shadow Stacks for its own protection.
> -
> -### Changed
> - - The CPUID data seen by a guest on boot is now moved in the migration
> -   stream.  A guest migrating between non-identical hardware will now no
> -   longer observe details such as Family/Model/Stepping, Cache, etc changing.
> -   An administrator still needs to take care to ensure the features visible to
> -   the guest at boot are compatible with anywhere it might migrate.
> -
> -## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
> +## [4.14.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.14.0) - 2020-07-23

Was the plan here really to remove old information? I'd have expected
you to add the one line you do add (perhaps together with empty
"### Added" and "### Changed" sections) between [Unreleased] and the
section you remove.

Jan

