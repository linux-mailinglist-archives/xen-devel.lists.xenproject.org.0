Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1322AEF3E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 12:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24622.51962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kco19-0004zT-8G; Wed, 11 Nov 2020 11:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24622.51962; Wed, 11 Nov 2020 11:10:23 +0000
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
	id 1kco19-0004z4-4b; Wed, 11 Nov 2020 11:10:23 +0000
Received: by outflank-mailman (input) for mailman id 24622;
 Wed, 11 Nov 2020 11:10:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ttLz=ER=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kco17-0004yz-Tc
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:10:21 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bede7193-360a-48b6-8584-b428ba45975a;
 Wed, 11 Nov 2020 11:10:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ttLz=ER=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kco17-0004yz-Tc
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:10:21 +0000
X-Inumbo-ID: bede7193-360a-48b6-8584-b428ba45975a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bede7193-360a-48b6-8584-b428ba45975a;
	Wed, 11 Nov 2020 11:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605093020;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=FrUrfzQ1PWZCL6L9TISjWH7ECa/n8mftd8rRa8EUYe8=;
  b=R1Gc2H4DNQFeD+x8M/7uSKGl4DwM0uDaeU8rCf4oB/ylJzA2hjUfH9GW
   C3Wi2XTeFd+g/RhnRaIV1N3bf8KIxSXbeK5jVTbAMWI6VNWQf1yYoAe0G
   KuMP5u7VJxnPokRHt+/i04z1ho+9CniWKPSNG04rX5b+ya7ZS4pblugjM
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +xuZKQeB7BNIaxRVbBleRdPCuv86qLyFoaNB2dbeS019F4JBEYHgjC+7vcrmFqUXMmIqvMwzxE
 HpQLGQwxUD3/43fsEIB4ahsUbApffGkbmRlMo+h3tQ6PH40XrGowjcihiEAhVV81PN24YjIb8u
 MeSlIgwjEo8369ePT4Rmqf+24W6h07p40fUwgksqogOUcHOv1VslZuGuRmuXSv/PU3+Esm/aUV
 MCQp3ekcsEqbjrO5Cu0bvgXiHvuOV2UKot2tk5AnGsr6Aw4N2vT8Z9vd9JLFRwSfbffgE8tn4b
 mZI=
X-SBRS: None
X-MesageID: 32056078
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="32056078"
Subject: Re: [PATCH] docs: fix documentation about default scheduler
To: George Dunlap <George.Dunlap@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20201110185129.5951-1-roger.pau@citrix.com>
 <9A8ADF64-4D76-4BEE-8E1C-4E23E77B9112@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e24211db-7ab5-d950-df56-669b90fda041@citrix.com>
Date: Wed, 11 Nov 2020 11:10:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9A8ADF64-4D76-4BEE-8E1C-4E23E77B9112@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 11/11/2020 10:12, George Dunlap wrote:
>
>> On Nov 10, 2020, at 6:51 PM, Roger Pau Monne <roger.pau@citrix.com> wrote:
>>
>> Fix the command line document to account for the default scheduler not
>> being credit anymore likely, and the fact that it's selectable from
>> Kconfig and thus different builds could end up with different default
>> schedulers.
>>
>> Fixes: dafd936dddbd ('Make credit2 the default scheduler')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Changes since v1:
>> - Point that the default scheduler is being selected by Kconfig,
>>   don't mention the default Kconfig selection.
>> ---
>> docs/misc/xen-command-line.pandoc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index 4ae9391fcd..eb1db25f92 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1876,7 +1876,7 @@ with read and write permissions.
>> ### sched
>>> `= credit | credit2 | arinc653 | rtds | null`
>> -> Default: `sched=credit`
>> +> Default: selectable via Kconfig.  Depends on enabled schedulers.
> Sorry for not weighing in earlier; but this basically makes this documentation useless.

No.  It is the only half useable version, by being the only version
which isn't misleading.

It would however be far better to name the CONFIG_ variable (we do
elsewhere in this doc) in question so people can actually figure out
what they've got in front of them.

~Andrew

