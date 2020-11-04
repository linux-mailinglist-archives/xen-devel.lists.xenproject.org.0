Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25732A5EEE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 08:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18807.43818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaDWY-0005T4-Dx; Wed, 04 Nov 2020 07:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18807.43818; Wed, 04 Nov 2020 07:48:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaDWY-0005Sf-Ae; Wed, 04 Nov 2020 07:48:06 +0000
Received: by outflank-mailman (input) for mailman id 18807;
 Wed, 04 Nov 2020 07:48:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaDWW-0005Sa-Gf
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 07:48:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 73f9da6f-d52d-4dd6-82a5-7dbdd1de9436;
 Wed, 04 Nov 2020 07:47:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E76C3AC2E;
 Wed,  4 Nov 2020 07:47:57 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaDWW-0005Sa-Gf
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 07:48:04 +0000
X-Inumbo-ID: 73f9da6f-d52d-4dd6-82a5-7dbdd1de9436
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 73f9da6f-d52d-4dd6-82a5-7dbdd1de9436;
	Wed, 04 Nov 2020 07:47:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604476078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=plaQH/rZx43UY7+AQcByuHKm7pVAFkzf6AKcuqTZLME=;
	b=s9GLsRBXWkiz0BeerND4XkhOOnEHvmVfylMLNHe4VGNLWcU3nwvQPSsyv2R8dxZ4Rssx4u
	ulMyGs+j+UJKcPkRY8Mt18k4wrZAd+ZjAy1j3ftp/2K/w5Ot0H9EzKZM9oVPfqoFRGAHp4
	zK0r6yzwyTVFahKZuekWk39pmUi1rAk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E76C3AC2E;
	Wed,  4 Nov 2020 07:47:57 +0000 (UTC)
Subject: Re: Xen 4.13.2 released
To: Michael Young <m.a.young@durham.ac.uk>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <ed219f15-479b-5d06-c835-eb4f4c64db3a@suse.com>
 <a391cfd1-be4a-add6-cd36-8bb254f9b43f@austen3.home>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a3dfec9d-bb32-c1c5-c00e-ea95c62c9bde@suse.com>
Date: Wed, 4 Nov 2020 08:47:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a391cfd1-be4a-add6-cd36-8bb254f9b43f@austen3.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.11.2020 00:55, Michael Young wrote:
> On Tue, 3 Nov 2020, Jan Beulich wrote:
>> I am pleased to announce the release of Xen 4.13.2. This is available
>> immediately from its git repository
>> http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.13
>> (tag RELEASE-4.13.2) or from the XenProject download page
>> https://xenproject.org/downloads/xen-project-archives/xen-project-4-13-series/xen-project-4-13-2/
>> (where a list of changes can also be found).
> 
> Is the entry for XSA-335 correct on the download page? That was a qemu 
> patch but I don't think it was included in 4.13.2.

Interesting, thanks for pointing this out. The qemu-trad part,
albeit "just" a SUPPORT.md update, didn't even make it into
staging yet afaics. While this can perhaps be viewed as benign,
I'm concerned that the qemuu fix also doesn't look to have
landed in any of the branches yet, despite the version bump on
the staging/master branches just 5 days ago. Anthony, Stefano?

Jan

