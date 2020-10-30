Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A662A0672
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 14:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15815.38995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYUTx-0003eM-9Y; Fri, 30 Oct 2020 13:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15815.38995; Fri, 30 Oct 2020 13:30:17 +0000
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
	id 1kYUTx-0003dx-6H; Fri, 30 Oct 2020 13:30:17 +0000
Received: by outflank-mailman (input) for mailman id 15815;
 Fri, 30 Oct 2020 13:30:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0CY=EF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kYUTv-0003ds-Mo
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 13:30:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a260a30-446a-4556-a8e7-d03bea3f9037;
 Fri, 30 Oct 2020 13:30:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Y0CY=EF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kYUTv-0003ds-Mo
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 13:30:15 +0000
X-Inumbo-ID: 5a260a30-446a-4556-a8e7-d03bea3f9037
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5a260a30-446a-4556-a8e7-d03bea3f9037;
	Fri, 30 Oct 2020 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604064614;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=T97K5otZiBwgjVIL04COIXu0KdDLu6Ny4bmQhdICI8U=;
  b=BUkmd8kM5VYHdPIjIJgBARpLzZROxOXazXFGsuan7+RN7whrEjofGcLy
   5eJchoF/nw7NwYbDX+xMlUsvPlGED9iHBPYcmswix6rq85un26hqS8VkO
   jx+OKGPSwrbHbj7CWEoMICOUTNKvJxixgANzSmbjKsQ5OQti87grgkw9a
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KJItFsT+tGtT+dw1i9LURL+kpcrRMZxbgIoKvogl2pUPNr/beKRD7bDhphypesP1YPutZKUSzX
 8BLCfKnDDeGwwuNolwKw9SJrIvXmxT1qJypYYV/F4yW3TG892acOih7xay9wahK1CK5Gnf7nL1
 yySJUGFdsGdblvZVas7SFWU6HUxFW7pTp5P2a5IXoKmJ9qeRNZ9SFb2H3jrT+VLuall8gpqhGI
 p2rU1TZdVliKZmuiiIXjKkLp2veXfmYeA68Rs3sknHMCWECB1hjAuhYk6Koi572YTk+lidSGBI
 3fM=
X-SBRS: None
X-MesageID: 31247007
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,433,1596513600"; 
   d="scan'208";a="31247007"
Subject: Re: [PATCH v1 1/2] No insert of the build timestamp into the x86 xen
 efi binary
To: Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
CC: =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Pierret_=28fepitre=29?=
	<frederic.pierret@qubes-os.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <cover.1603725003.git.frederic.pierret@qubes-os.org>
 <64fc67bc2227d6cf92e079228c9f8d2d6404b001.1603725003.git.frederic.pierret@qubes-os.org>
 <93b0b06e-cb73-66eb-3535-e7ab2ca60bf8@suse.com>
 <20201030122319.GA16953@mail-itl>
 <9b278993-08bb-7ad2-2dfd-743987a9fd6f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3ee68210-a0d4-a906-c502-4988d996e61c@citrix.com>
Date: Fri, 30 Oct 2020 13:30:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9b278993-08bb-7ad2-2dfd-743987a9fd6f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 30/10/2020 12:48, Jan Beulich wrote:
> On 30.10.2020 13:23, Marek Marczykowski-Górecki wrote:
>> On Fri, Oct 30, 2020 at 01:08:44PM +0100, Jan Beulich wrote:
>>> On 30.10.2020 13:03, Frédéric Pierret (fepitre) wrote:
>>>
>>>> --- a/xen/arch/x86/Makefile
>>>> +++ b/xen/arch/x86/Makefile
>>>> @@ -170,6 +170,7 @@ EFI_LDFLAGS += --major-image-version=$(XEN_VERSION)
>>>>  EFI_LDFLAGS += --minor-image-version=$(XEN_SUBVERSION)
>>>>  EFI_LDFLAGS += --major-os-version=2 --minor-os-version=0
>>>>  EFI_LDFLAGS += --major-subsystem-version=2 --minor-subsystem-version=0
>>>> +EFI_LDFLAGS += --no-insert-timestamp
>>> Generally I prefer binaries to carry timestamps, when they are
>>> intended to do so (i.e. when they have a respective field). So
>>> I think if no timestamp is wanted, it should be as an option
>>> (not sure about the default).
>> What about setting it to the SOURCE_DATE_EPOCH[1] variable value, if
>> present? Of course if there is an option to set explicit timestamp
>> value.
>>
>> [1] https://reproducible-builds.org/docs/source-date-epoch/
> Why not.

SOURCE_DATE_EPOCH is the right way to fix this.

It probably wants to default to something sane in the root Makefile, so
it covers tools as well.

>>> This said, I didn't think time stamps got meaningfully in the
>>> way of reproducible builds - ignoring the minor differences
>>> cause by them, especially when they sit at well known offsets
>>> in the binaries, shouldn't be a big deal.
>> It is a big deal. There is a huge difference between running sha256sum
>> (or your other favorite hash) on two build artifacts, and using a
>> specialized tool/script to compare each file separately. Note the
>> xen.efi may be buried very deep in the thing you compare, for example
>> inside deb/rpm and then ISO image (installation image), at which point
>> it's far from "they sit at well known offsets".
> If you care about checking images / blobs where binaries with time
> stamps are merely constituent parts, why not strip the time stamps
> at the time of creation of those images / blobs (or as a minor
> intermediate step, in case you want to e.g. record the hashes for
> later reference)?

Because that is a disaster to maintain.  A critical part of reproducible
builds is not needing custom comparison logic for every binary artefact.

~Andrew

