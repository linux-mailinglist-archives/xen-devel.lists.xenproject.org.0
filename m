Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B243927E940
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.685.2271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNbtT-0000tm-Ip; Wed, 30 Sep 2020 13:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685.2271; Wed, 30 Sep 2020 13:11:39 +0000
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
	id 1kNbtT-0000tN-Ez; Wed, 30 Sep 2020 13:11:39 +0000
Received: by outflank-mailman (input) for mailman id 685;
 Wed, 30 Sep 2020 13:11:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNbtR-0000tI-DJ
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:11:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87d8512b-de44-4311-b1fd-8e66c42f0225;
 Wed, 30 Sep 2020 13:11:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 100BDAC7D;
 Wed, 30 Sep 2020 13:11:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNbtR-0000tI-DJ
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:11:37 +0000
X-Inumbo-ID: 87d8512b-de44-4311-b1fd-8e66c42f0225
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 87d8512b-de44-4311-b1fd-8e66c42f0225;
	Wed, 30 Sep 2020 13:11:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601471495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIoqa7XN/JcrDiX2ER3dOduMzdf4RoLzhSbautzInCM=;
	b=Bcscvn/zHhrvdqvyy5uKY2lSe8QsuEGRcc9lffxAjFSxFi1/tDQjUgGiTMdkqvbm5SIQ89
	xuTG+/4V7J2lWY57agc5vhoOlGjANifEJBrQeWPKfZS60F+guw1Z6dWLEOdOT81TskV5VH
	T1RDSUYW7MZAMixrKCdKhosMDfjJgMQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 100BDAC7D;
	Wed, 30 Sep 2020 13:11:35 +0000 (UTC)
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy document
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Rich Persaud <persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20200930125736.95203-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b67dd36-4216-9480-57ec-5b453eae0036@suse.com>
Date: Wed, 30 Sep 2020 15:11:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930125736.95203-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 14:57, George Dunlap wrote:
> --- /dev/null
> +++ b/docs/policies/dependency-versions.rst
> @@ -0,0 +1,76 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Build and runtime dependencies
> +==============================
> +
> +Xen depends on other programs and libraries to build and to run.
> +Chosing a minimum version of these tools to support requires a careful
> +balance: Supporting older versions of these tools or libraries means
> +that Xen can compile on a wider variety of systems; but means that Xen
> +cannot take advantage of features available in newer versions.
> +Conversely, requiring newer versions means that Xen can take advantage
> +of newer features, but cannot work on as wide a variety of systems.

I think "cannot take advantage" is too strict here: It may be more
cumbersome (and as a result to ugly to maintain), but it ought to
generally be possible. IOW how about adding "easily"?

> +Specific distro versions supported in this release
> +--------------------------------------------------
> +
> +======== ==================
> +Distro   Supported releases
> +======== ==================
> +Debian   10 (Buster)
> +Ubuntu   20.10 (Groovy Gorilla), 20.04 (Focal Fossa), 18.04 (Bionic Beaver), 16.04 (Xenial Xerus)
> +OpenSUSE Leap 15.2
> +SLES     SLES 11, 12, 15

SLE 11 has all support packs in LTSS mode already, so as long as this
mode is what's equivalent to or even less than "Maintenance updates"
in what you did say for RHEL, it may want dropping. (Personally I'd
prefer if we remained sufficiently compatible, but I realize I may be
the only one.)

Additionally in service packs things like compiler or binutils versions
often get updated, so e.g. "SLES 11" alone is not sufficient to know
what's meant to be supported, it would likely need to be "SLES 11 SP4"
and alike, just like you also specify a minor version for some of the
other distros. SLES versions not yet in LTSS at this point are, if I'm
not mistaken, 12 SP5, 15 SP1, and 15 SP2.

Jan

