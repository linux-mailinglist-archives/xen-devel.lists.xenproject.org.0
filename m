Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5682A3FC6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 10:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18042.42788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZsPb-0001A6-Px; Tue, 03 Nov 2020 09:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18042.42788; Tue, 03 Nov 2020 09:15:31 +0000
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
	id 1kZsPb-00019f-Ly; Tue, 03 Nov 2020 09:15:31 +0000
Received: by outflank-mailman (input) for mailman id 18042;
 Tue, 03 Nov 2020 09:15:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZsPa-00019a-Bt
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:15:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1c5e7289-613b-43b9-9cdf-3ca1feb2393c;
 Tue, 03 Nov 2020 09:15:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E25B4ACF5;
 Tue,  3 Nov 2020 09:15:27 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZsPa-00019a-Bt
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:15:30 +0000
X-Inumbo-ID: 1c5e7289-613b-43b9-9cdf-3ca1feb2393c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 1c5e7289-613b-43b9-9cdf-3ca1feb2393c;
	Tue, 03 Nov 2020 09:15:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604394928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OTaupi/1smCjLukJ2z+KNJLk6tcqet1wRcBYM0kglSw=;
	b=b37Iku0YUTN/E+Xso/zrADLCnBK6tIyIfdIY6nghSFqRL+IxomTCXgL6chVWnhFRZ9i7fO
	i39lRu3ApnZwYrYYRIkNZAF6GAvmI7GhRq+JQlhJ5/S9jAof+qevHXSAOWfZ6GwqH1TgiN
	NjzHVjxVwcRBBMW1qnYoAJQVyJG00v8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E25B4ACF5;
	Tue,  3 Nov 2020 09:15:27 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] Define SOURCE_DATE_EPOCH based on git log
To: =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fabf886c-4270-9620-5a72-210a2fccb016@suse.com>
Date: Tue, 3 Nov 2020 10:15:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 31.10.2020 16:14, Frédéric Pierret (fepitre) wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -6,6 +6,8 @@ export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>  export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>  -include xen-version
>  
> +export SOURCE_DATE_EPOCH	?= $(shell git log -1 --format=%ct 2>/dev/null)

In patch 1 you also use the variable under tools/. Why do you
place this here rather than in the top level Makefile?

This said I'm not convinced anyway that we want this to be the
default. I'd rather see this as something to get set by the
package build process of distros, outside of any of the source
files.

Jan

