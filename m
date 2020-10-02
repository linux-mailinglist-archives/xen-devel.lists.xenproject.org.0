Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144DE281025
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 11:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1793.5486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHlE-0000aw-5A; Fri, 02 Oct 2020 09:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1793.5486; Fri, 02 Oct 2020 09:53:56 +0000
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
	id 1kOHlE-0000aX-1x; Fri, 02 Oct 2020 09:53:56 +0000
Received: by outflank-mailman (input) for mailman id 1793;
 Fri, 02 Oct 2020 09:53:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kOHlC-0000aR-DC
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:53:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86440e6d-0b18-4323-952a-47cb42ee2ce4;
 Fri, 02 Oct 2020 09:53:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9FB2AAD39;
 Fri,  2 Oct 2020 09:53:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kOHlC-0000aR-DC
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:53:54 +0000
X-Inumbo-ID: 86440e6d-0b18-4323-952a-47cb42ee2ce4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 86440e6d-0b18-4323-952a-47cb42ee2ce4;
	Fri, 02 Oct 2020 09:53:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601632432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCHj6y8mdiCVDqDTzx/FzYO2RGdpOCYbUB/HCAvXXnE=;
	b=EdZqP89whwOCSUtnqob9vvPhW/FyqKbX5AF0QLUcR/Qy1c7F72gtR1kDiZO6uLcxxWbGyS
	dF7y9zAKHmm/Ixz9yzqePPZs4s2lJLJ+6KLbs/yV3jFMNn6hrwpz70psNXDJ54A1R4epI5
	6sLrQvMHPDBBVoDmIPwemyvLKV6Cm/0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9FB2AAD39;
	Fri,  2 Oct 2020 09:53:52 +0000 (UTC)
Subject: Re: Re: [Xen-devel] Xen Solaris support still required? Illumos/Dilos
 Xen
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Igor Kozhukhov <igor@dilos.org>
Cc: =?UTF-8?B?UGFzaSBLw6Rya2vDpGluZW4=?= <pasik@iki.fi>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <9ee9bda5-0333-0482-75aa-81a4d352a77e@suse.com>
 <20161103135632.GF28824@reaktio.net> <20161204165715.GN28824@reaktio.net>
 <E1236D3A-24CA-4ECF-B7C8-547406C54911@dilos.org>
 <642cf596-12bc-6f94-3e2a-e0343a250abc@suse.com>
Message-ID: <746d05db-cbe0-4013-41fb-a4a5b9b71d5c@suse.com>
Date: Fri, 2 Oct 2020 11:53:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <642cf596-12bc-6f94-3e2a-e0343a250abc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.12.16 06:32, Juergen Gross wrote:
> On 04/12/16 18:11, Igor Kozhukhov wrote:
>> Hi Pasi,
>>
>> i’m using both addresses, but probably @gmale missed some emails with
>> maillist.
>>
>> About DilOS + Xen.
>>
>> i’m using xen-3.4 - old version what i backported to DilOS based on old
>> opensolaris varsion and upadted it to use python2.7 and some others zfs
>> updates - more updates :)
>> i tried to port Xen-4.3, but not finished it yet because i have no found
>> sponsors and i have been moved to some aonther job without DilOS/illumos
>> activities.
>> try to do it by free time was/is overhead.
>>
>> i have plans try to return back and look at latest Xen.
>>
>> right now i try to move DilOS bulid env to use more Debian style build
>> env and to use gcc-5.4 as primary compiler.
>> Also, i have SPARC support with DilOS and it eat some additional free time.
>> please do not drop solaris support :) - i’ll use and update it soon -
>> probably on next year.
> 
> Got it. Thanks for the note and good luck for the port!

As a followup after nearly 4 years:

It seems nothing has happened, and Solaris specific coding in Xen is
bit-rotting further. Last example is xenstored, which lost an interface
mandatory for Solaris about 1 year ago (nobody noticed, as Solaris
specific parts are neither built nor tested).

I stumbled over this one as I did some reorg of the Xen libraries and
checked all the dependencies between those.

I think at least the no longer working Solaris stuff in xenstored should
be removed now (in theory it would still be possible to use xenstore-
stubdom in Solaris), but I honestly think all the other Solaris cruft in
Xen tools should go away, too, in case nobody is really showing some
interest in it (e.g. by doing some basic build tests and maybe a small
functional test for each release of Xen).

So how does the realistic future of a Solaris dom0 look like? Is there
a non-neglectable chance it will be revived in the near future, or can
we remove the Solaris abstractions?


Juergen

