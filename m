Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18C02E8132
	for <lists+xen-devel@lfdr.de>; Thu, 31 Dec 2020 17:15:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60580.106315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kv0bN-0001tm-Ve; Thu, 31 Dec 2020 16:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60580.106315; Thu, 31 Dec 2020 16:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kv0bN-0001tN-SR; Thu, 31 Dec 2020 16:15:01 +0000
Received: by outflank-mailman (input) for mailman id 60580;
 Thu, 31 Dec 2020 16:15:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pjRP=GD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kv0bM-0001tI-Cl
 for xen-devel@lists.xenproject.org; Thu, 31 Dec 2020 16:15:00 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08e21236-71f5-4eca-80b8-6480282968ef;
 Thu, 31 Dec 2020 16:14:59 +0000 (UTC)
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
X-Inumbo-ID: 08e21236-71f5-4eca-80b8-6480282968ef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609431299;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=V4zfVjWL8SLawwLXjOlKOXTnvYY9uxVxfzA9v+xAbtM=;
  b=VvclyvpqJZFdVhQo3UemXnMpQg8CcPtbdkPyMF+C6sG+AehPDh2JDOb9
   8/BqLGMEbGRaqbQdYJCuYx2kXwW6ZMQarvc1PLrzjVTgP2VYTn3i0x3w8
   CADGMBDxD6ljuKrru01moqUqTOnCndlpUETBJRzjXAZ7XnBEOpe+6CHJt
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MnSnFplfHPwlKJqRRZWemamAsJLTOUikoWeVsej/77JgeHPtNR8QxaNJbof5GEA7QM1QuTE6CS
 Gn8yl7M0xCswalDxkBFkcjt1ilAqBWPX2QRoblXmrsMqY2p6TX+xkgSN+aA9pYxdch6FFemdPb
 TufxVv+peaWq0VntNJ0Dc+crvCHPMG93kGiFkfNTgMRO/vyi4HR4rj5mlyZIJIIf5erAFve7A6
 zg9edeG6qKEd53cqqUsY3qVjjMz6PGjcJLtqMqRuf2Gt2kG5V3gfAh3MjU5t9FR4n0pbUVMZf4
 dIk=
X-SBRS: 5.2
X-MesageID: 34446950
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,464,1599537600"; 
   d="scan'208";a="34446950"
Subject: Re: [PATCH] xen: remove the usage of the P ar option
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201230173446.1768-1-roger.pau@citrix.com>
 <b90b93d0-ea83-bc00-6dc0-cbe9e7cfa1ce@citrix.com>
 <20201231092015.ojmlwfvqky6uqyig@Air-de-Roger>
 <6a761459-7823-077b-2cee-b6d685eb10ee@citrix.com>
 <20201231160506.247ctn2mnfdgcddx@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ab442464-8c04-d4e1-13fc-cc774b2ca09b@citrix.com>
Date: Thu, 31 Dec 2020 16:14:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201231160506.247ctn2mnfdgcddx@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 31/12/2020 16:05, Roger Pau Monné wrote:
> On Thu, Dec 31, 2020 at 03:46:50PM +0000, Andrew Cooper wrote:
>> On 31/12/2020 09:20, Roger Pau Monné wrote:
>>> On Wed, Dec 30, 2020 at 06:32:58PM +0000, Andrew Cooper wrote:
>>>> On 30/12/2020 17:34, Roger Pau Monne wrote:
>>>>> It's not part of the POSIX standard [0] and as such non GNU ar
>>>>> implementations don't usually have it.
>>>>>
>>>>> It's not relevant for the use case here anyway, as the archive file is
>>>>> recreated every time due to the rm invocation before the ar call. No
>>>>> file name matching should happen so matching using the full path name
>>>>> or a relative one should yield the same result.
>>>>>
>>>>> This fixes the build on FreeBSD.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
>>>>
>>>> We really need some kind of BSD build in CI.  This kind of breakage
>>>> shouldn't get into master to begin with.
>>> Fully agree. I'm not that familiar with gitlab CI, but since we have
>>> our own runners there, could we also launch VMs instead of just using
>>> containers?
>>>
>>> It might be easier to integrate with osstest in the future, since
>>> FreeBSD has now switched to git.
>>>
>>>>> [0] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/ar.html
>>>>> ---
>>>>> I'm unsure whether the r and s options are also needed, since they
>>>>> seem to only be relevant when updating a library, and Xen build system
>>>>> always removes the old library prior to any ar call.
>>>> ... I think r should be dropped, because we're not replacing any files. 
>>>> However, I expect the index file is still relevant, because without it,
>>>> you've got to perform an O(n) search through the archive to find a file.
>>> Right, the description of 's' between opengroup and the Linux man page
>>> seems to be slightly different. From the opengroup description it seems
>>> like s should be used to force the generation of a symbol table when
>>> no changes are made to the archive, but otherwise ar should already
>>> generate such symbol table.
>> Ok - are you happy for me to commit with dropping the r and s?
> So after testing this, I think we need at least the r option, as we
> want to add new files to the archive (regardless of whether it exists
> or not). That seems to be mandatory on FreeBSD, as calling 'ar c' is
> not valid.
>
> I think s can be dropped, as ar will generate the symbol table by
> default unless S is specified. s should just be used to force the
> generation of a symbol table when not adding files and the archive has
> been stripped AFAICT.
>
> If so would you mind adding:
>
> "While there also drop the s option, as ar will already generate a
> symbol table by default when creating the archive."
>
> To the commit message if you end up dropping s?

Will do.

~Andrew

