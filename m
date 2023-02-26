Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56D6A2F53
	for <lists+xen-devel@lfdr.de>; Sun, 26 Feb 2023 12:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502034.773821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWFdz-0003FS-TD; Sun, 26 Feb 2023 11:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502034.773821; Sun, 26 Feb 2023 11:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWFdz-0003CJ-PX; Sun, 26 Feb 2023 11:56:43 +0000
Received: by outflank-mailman (input) for mailman id 502034;
 Sun, 26 Feb 2023 11:56:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pWFdy-0003CD-Au
 for xen-devel@lists.xenproject.org; Sun, 26 Feb 2023 11:56:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWFdw-00060P-5x; Sun, 26 Feb 2023 11:56:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWFdv-0003gx-VN; Sun, 26 Feb 2023 11:56:40 +0000
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
	bh=o6WW3lH/spdAbZ3Oah5HD+VM6LWMHeURqc+HEeH0LeQ=; b=YxHvZA5OB069JOzn0/D37PuF2R
	R7FxpeaLaQI4VkD3LFrg1WvgooRCdR6IrdIiR0yUfnjQwuZ0R9qzJvNVArEkpAjvYO+HQ6tSBajUm
	JwD39EZ4P4tSf9gAG4DSaT9SV6DRHCU+1wFL8CXoJBxddcT7LN4fnSWVA4UnHUuso0G4=;
Message-ID: <4840a055-723c-5f72-b3c1-0c9d72c4d413@xen.org>
Date: Sun, 26 Feb 2023 11:56:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 1/6] xen/x86: Replace GPL v2.0 copyright with an SPDX tag
 in *.c
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, demi@invisiblethingslab.com,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <20230209230020.52695-1-julien@xen.org>
 <20230209230020.52695-2-julien@xen.org> <Y/dMXBQJ86QHEAMB@perard.citrite.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Y/dMXBQJ86QHEAMB@perard.citrite.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 23/02/2023 11:22, Anthony PERARD wrote:
> On Thu, Feb 09, 2023 at 11:00:15PM +0000, Julien Grall wrote:
>> This is replacing the below pattern with the SPDX tag GPL-2.0 in
> 
> The "GPL-2.0" identifier is actually deprecated:
>      https://spdx.org/licenses/GPL-2.0.html

I hadn't realized that. It looks like there are many use of GPL-2.0 
within Xen and LICENSES/GPL-2.0 doesn't mention the deprecation.

I will add a patch to update LICENSES/GPL-2.0 and respin this series to 
switch to...

> We should use "GPL-2.0-only" instead.
... GPL-2.0-only.

Cheers,

-- 
Julien Grall

