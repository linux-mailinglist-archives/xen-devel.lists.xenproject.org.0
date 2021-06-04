Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772839B4FA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 10:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136780.253452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp5Kd-00064f-7G; Fri, 04 Jun 2021 08:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136780.253452; Fri, 04 Jun 2021 08:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp5Kd-00062o-49; Fri, 04 Jun 2021 08:37:31 +0000
Received: by outflank-mailman (input) for mailman id 136780;
 Fri, 04 Jun 2021 08:37:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zHp=K6=rmail.be=alien@srs-us1.protection.inumbo.net>)
 id 1lp5Ka-00062i-Sd
 for xen-devel@lists.xen.org; Fri, 04 Jun 2021 08:37:28 +0000
Received: from mail.rmail.be (unknown [85.234.218.189])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fffd5c55-f3f7-48d9-8bb5-850de34fc4cc;
 Fri, 04 Jun 2021 08:37:25 +0000 (UTC)
Received: from mail.rmail.be (localhost [127.0.0.1])
 by mail.rmail.be (Postfix) with ESMTP id D7B46B1534D;
 Fri,  4 Jun 2021 10:37:24 +0200 (CEST)
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
X-Inumbo-ID: fffd5c55-f3f7-48d9-8bb5-850de34fc4cc
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 04 Jun 2021 10:37:24 +0200
From: AL13N <alien@rmail.be>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, "Durrant, Paul" <pdurrant@amazon.com>
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
In-Reply-To: <23d90cf3-2bc8-f6f6-449d-1741ff4261ec@suse.com>
References: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
 <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
 <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
 <b5ff15fc-ec3b-6b48-3d15-7de29fa5b2aa@suse.com>
 <175befe0e853565761e51f07b79c49cf@mail.rmail.be>
 <552b4348-1c52-ce6b-9001-a144c7147a7c@suse.com>
 <0100caba62175123c63f0df4749a8c88@mail.rmail.be>
 <8a572357-e743-80a6-fed6-3c4999b986ec@suse.com>
 <23d90cf3-2bc8-f6f6-449d-1741ff4261ec@suse.com>
Message-ID: <298871527ff81b658bf959551ae65235@mail.rmail.be>
X-Sender: alien@rmail.be
User-Agent: Roundcube Webmail/1.0.9-1.2.mga5

Juergen Gross schreef op 2021-06-04 09:10:
> On 04.06.21 08:56, Jan Beulich wrote:
>> On 03.06.2021 18:01, AL13N wrote:
>>> Jan Beulich schreef op 2021-06-01 16:53:
>>>> On 01.06.2021 16:44, AL13N wrote:
>>>>> This mailing list is the correct place for the toolstack too? 
>>>>> right?
>>>> 
>>>> Yes.
>>> 
>>> So, what's the plan to fix this? is the plan to fix the toolstack? or
>>> put your patch in kernel to kinda workaround it?
>> 
>> The patch has already been put in the kernel, as said. It would be 
>> good
>> to know whether it actually has helped your case as well.
>> 
>>> Is there a way to make a regression test or unit test or something?
>> 
>> Would be nice, but may be a little difficult to arrange for in, say,
>> osstest.
>> 
>>> Does anyone have an idea on what patch would cause the regression?
>> 
>> Not me, but I'm also not a tool stack maintainer (nor expert in any
>> way).
> 
> There has been a large series by Paul Durrant [1] making heavy
> modifications in this area.
> 
> Juergen
> 
> [1]: 
> https://lists.xen.org/archives/html/xen-devel/2020-11/msg01680.html

Hmm after a quick look-through, nothing stands out to me; except maybe 
if the pci list gets freed after the first add, it would prevent the 
adding of the other pci devices.

Could anyone explain/point me to the place where the toolstack adds pci 
devices from the xl create vs xl pci-add?

I'm circling back to the logs of xl create having 3 log entries "Adding 
new pci device to xenstore", but only one "Creating pci backend". While 
that is normal of course, it does give out 2 possibilities i can see for 
only having 1 device:

I'm looking at this function: 
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=tools/libs/light/libxl_pci.c;h=1a1c2630803b5b3b4e07f093b688e0fd5780e745;hb=e25aa9939ae0cd8317605be3d5c5611b76bc4ab4#l134 
.

possibility 1:
xs transaction at line 209 does not get called, which i presume would 
add the device to xs.

possibility 2:
xs transaction does get called, but by that time, the other end already 
has finished and thus does not look at the other devices in xs?

since xl pci-list actually does show all 3, and i see no errors, i would 
presume that for possibility 1, it can only really be line 201, but 
since this is a xl create, i'm assuming "starting" is true in this case, 
which means no lock and that line does not get called? (there is this 
weird thing where a transaction is committed and then aborted though?). 
so i guess possibility 1 is no go?

but possibility 2 would mean that unless there's another layer, the 
pcifront on the domU side would be faster than this function being 
called 3 times... which seems odd (unless this all gets done before domU 
is even started, which does not seem likely)

Of course this is all an amateur pov, i have no expertise with any of 
the xen code at all...

Well, I hope someone can take a look at this and/or help me out, please.

Maarten

