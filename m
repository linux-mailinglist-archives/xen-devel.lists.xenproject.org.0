Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393FA2CC01E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 15:53:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42818.77064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTVN-00056H-9R; Wed, 02 Dec 2020 14:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42818.77064; Wed, 02 Dec 2020 14:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTVN-00055r-6H; Wed, 02 Dec 2020 14:53:17 +0000
Received: by outflank-mailman (input) for mailman id 42818;
 Wed, 02 Dec 2020 14:53:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnsL=FG=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kkTVL-00055l-De
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 14:53:15 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47c90c37-bb16-4c2c-ba00-73c12babbbd1;
 Wed, 02 Dec 2020 14:53:14 +0000 (UTC)
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
X-Inumbo-ID: 47c90c37-bb16-4c2c-ba00-73c12babbbd1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606920794;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+km+qYoT+GfRCnvw41Pngpu9ryNDDDkSetdoW9zY/9g=;
  b=gIeSuy9MZ8mxTbgFTKjRlE9aOGjE6DCYBSU/xS3MpmpYreZjz8/XsVE/
   lb1CLMkXajQc4nV3EsffjOTmvesq3nDMM2hKMllzl2domYXQKBwLY3UiA
   P3/cf/XOZCfAXX43yoZvhsU6279BguRm0j4reAlE6hcnl0J4CpJOY0SD6
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: doGrgZq6PS74a89lqfIVn4zs7R1viOiOITNT/3mDFwZ8OHQl8Pub647M4FUOYk2d0LVgheVxhU
 fZgqeTX2G6WYXLmaqg2ziuCULHNIraXQh0jjZ+3hmKcNxSL9tzJr/kmBuNhznijLIYnmB79qL5
 vupgmD35MSPAG2pnm+p70Y233gqPioVW3tdFbzhpSQ3lVv+EMfZEHdJuEQzhh1+3y0tYSBsvY0
 WZG1kOgtBvvYFF7/CCIjQ2qBWH5P8SagAvipv4/nRYBBXkZlVEW3PHKsBkadStN5CyXRVjyAcS
 2Gw=
X-SBRS: None
X-MesageID: 32368170
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,387,1599537600"; 
   d="scan'208";a="32368170"
Subject: Re: [PATCH] x86/IRQ: bump max number of guests for a shared IRQ to 31
To: Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <1606780777-30718-1-git-send-email-igor.druzhinin@citrix.com>
 <b98d3517-6c9d-6f40-6e28-cde142978143@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <3c9735ec-2b04-1ace-2adb-d72b32c4a5f9@citrix.com>
Date: Wed, 2 Dec 2020 14:53:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b98d3517-6c9d-6f40-6e28-cde142978143@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/12/2020 09:25, Jan Beulich wrote:
> On 01.12.2020 00:59, Igor Druzhinin wrote:
>> Current limit of 7 is too restrictive for modern systems where one GSI
>> could be shared by potentially many PCI INTx sources where each of them
>> corresponds to a device passed through to its own guest. Some systems do not
>> apply due dilligence in swizzling INTx links in case e.g. INTA is declared as
>> interrupt pin for the majority of PCI devices behind a single router,
>> resulting in overuse of a GSI.
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>> ---
>>
>> If people think that would make sense - I can rework the array to a list of
>> domain pointers to avoid the limit.
> 
> Not sure about this. What is the biggest number you've found on any
> system? (I assume the chosen value of 31 has some headroom.)

The value 31 was taken as a practical maximum for one specific HP system
if all of the PCI slots in all of its riser cards are occupied with GPUs.
The value is obtained by reverse engineering their ACPI tables. Currently
we're only concerned with number 8 (our graphics vendors do not recommend
installing more cards than that) but it's a matter of time it will grow.
I'm also not sure why this routing scheme was chosen in the first place:
is it dictated by hardware restrictions or firmware engineers being lazy - 
we're working with HP to determine it.

> Instead I'm wondering whether this wouldn't better be a Kconfig
> setting (or even command line controllable). There don't look to be
> any restrictions on the precise value chosen (i.e. 2**n-1 like is
> the case for old and new values here, for whatever reason), so a
> simple permitted range of like 4...64 would seem fine to specify.
> Whether the default then would want to be 8 (close to the current
> 7) or higher (around the actually observed maximum) is a different
> question.

I'm in favor of a command line argument here - it would be much less trouble
if a higher limit was suddenly necessary in the field. The default IMO
should definitely be higher than 8 - I'd stick with number 32 which to me
should cover our real world scenarios and apply some headroom for the future.

Igor

