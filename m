Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9FF2E8113
	for <lists+xen-devel@lfdr.de>; Thu, 31 Dec 2020 16:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60568.106291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kv0AH-00078o-Fl; Thu, 31 Dec 2020 15:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60568.106291; Thu, 31 Dec 2020 15:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kv0AH-00078P-C9; Thu, 31 Dec 2020 15:47:01 +0000
Received: by outflank-mailman (input) for mailman id 60568;
 Thu, 31 Dec 2020 15:46:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pjRP=GD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kv0AF-00078K-Iw
 for xen-devel@lists.xenproject.org; Thu, 31 Dec 2020 15:46:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eec76065-8527-461c-a60d-83c4b878d8cd;
 Thu, 31 Dec 2020 15:46:57 +0000 (UTC)
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
X-Inumbo-ID: eec76065-8527-461c-a60d-83c4b878d8cd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609429617;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=nrPjC/pKfEsU8MgX7FHzMHRBNM7Eu799QxtAXqkwuPM=;
  b=NdOqd3EPfOaKVZqz9Q6EJ265Es2QQoWYkD87aH9vvgJREHJqh+LBbFCJ
   6uu2TaUelWBQErBXt139v+RQlDG2Q1PmDEghSQ8NtiCshl2eqBycfOoqo
   e8JPuz5NfPyl3pAEZkOS23gnOdVWucWu5VAVr8qrhC8rcU08PEnn8y5XQ
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PM9OzY8Gp94buDjjhmxMueu4zGxTClg6RqTIpSZ8jGIRc/li8ae8wS4quAp/AAnKAA1YilRz6e
 PUrBAz37DkL/YnDgoO3sOPSu6nSErZRx5rOowLEU8r3oOsB2vWlfBAsCI178FOPapAqPgKxyUU
 kZHlWXQnpoRFhIL7mzz8Ikn4/2x+wAAqNcEmqJMFn/tFSNc5C8EjZauPKpXP6oPq1crbpJhY4E
 /4jifN7LTLz80Z2Ez+zrqHBNCsNRZQh635L4BGEj/RJyTPlEJM+StHf2GxotI5oC2p0AVwkPdE
 fjs=
X-SBRS: 5.2
X-MesageID: 34214217
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,464,1599537600"; 
   d="scan'208";a="34214217"
Subject: Re: [PATCH] xen: remove the usage of the P ar option
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201230173446.1768-1-roger.pau@citrix.com>
 <b90b93d0-ea83-bc00-6dc0-cbe9e7cfa1ce@citrix.com>
 <20201231092015.ojmlwfvqky6uqyig@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6a761459-7823-077b-2cee-b6d685eb10ee@citrix.com>
Date: Thu, 31 Dec 2020 15:46:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201231092015.ojmlwfvqky6uqyig@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 31/12/2020 09:20, Roger Pau Monné wrote:
> On Wed, Dec 30, 2020 at 06:32:58PM +0000, Andrew Cooper wrote:
>> On 30/12/2020 17:34, Roger Pau Monne wrote:
>>> It's not part of the POSIX standard [0] and as such non GNU ar
>>> implementations don't usually have it.
>>>
>>> It's not relevant for the use case here anyway, as the archive file is
>>> recreated every time due to the rm invocation before the ar call. No
>>> file name matching should happen so matching using the full path name
>>> or a relative one should yield the same result.
>>>
>>> This fixes the build on FreeBSD.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
>>
>> We really need some kind of BSD build in CI.  This kind of breakage
>> shouldn't get into master to begin with.
> Fully agree. I'm not that familiar with gitlab CI, but since we have
> our own runners there, could we also launch VMs instead of just using
> containers?
>
> It might be easier to integrate with osstest in the future, since
> FreeBSD has now switched to git.
>
>>> [0] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/ar.html
>>> ---
>>> I'm unsure whether the r and s options are also needed, since they
>>> seem to only be relevant when updating a library, and Xen build system
>>> always removes the old library prior to any ar call.
>> ... I think r should be dropped, because we're not replacing any files. 
>> However, I expect the index file is still relevant, because without it,
>> you've got to perform an O(n) search through the archive to find a file.
> Right, the description of 's' between opengroup and the Linux man page
> seems to be slightly different. From the opengroup description it seems
> like s should be used to force the generation of a symbol table when
> no changes are made to the archive, but otherwise ar should already
> generate such symbol table.

Ok - are you happy for me to commit with dropping the r and s?

~Andrew

