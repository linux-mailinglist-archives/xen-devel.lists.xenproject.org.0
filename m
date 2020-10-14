Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003628D79C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 02:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6419.17099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSUs2-0007tD-4Z; Wed, 14 Oct 2020 00:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6419.17099; Wed, 14 Oct 2020 00:42:22 +0000
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
	id 1kSUs2-0007sr-1Z; Wed, 14 Oct 2020 00:42:22 +0000
Received: by outflank-mailman (input) for mailman id 6419;
 Wed, 14 Oct 2020 00:42:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbRJ=DV=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kSUs1-0007sm-4U
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 00:42:21 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5796dabe-4ae8-4bc7-afe0-1f236be85f18;
 Wed, 14 Oct 2020 00:42:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nbRJ=DV=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kSUs1-0007sm-4U
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 00:42:21 +0000
X-Inumbo-ID: 5796dabe-4ae8-4bc7-afe0-1f236be85f18
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5796dabe-4ae8-4bc7-afe0-1f236be85f18;
	Wed, 14 Oct 2020 00:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602636139;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=4YyvTEpfSD9d9EHo8mi7qbI8RZCQtnkGVyDKCF0dWu4=;
  b=UB3Gy77Tf4kMOfBhK5GSV6PhP5avF9m+Unbjt8L7kxgidM4JroR/b9QE
   GFZyfTMcei+37ahg6Q25pYJu6dBjFe5zfwW8kA0083PSS/n8GAuiMalle
   KyyxMzxWtEYNTYjyKYly1TxdrJgEvwyT/wxogOdQu8hCVpCxaQABKwJiG
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Wwh1x4Wxwz+U54MzjqMciC9ZQoaju3/DDoCRzXM59RI4J1ilVPFW79SJvEhi8vq4JoLBGPZhTK
 SnLwNizzVNl3jhi0RTP1ldq7ChVpn7J50tu907QKBIe0mmx+VpvlP6AqLt8MZyrrsDAdlK1omD
 GrTE0YBj1KkY/RczRGmKQ+CpLZcwabAUFuvJtllM8qV63h07PaJZphBKJK4iVvqL+j0wwj168L
 UvpN8BVUPeI1ws2igmxJq22gDJRWJO70xWQf+2PuNXbIH9vUM/RDuK8z4YmEXpxKwmEsTvllsT
 e6k=
X-SBRS: 2.5
X-MesageID: 29978529
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,372,1596513600"; 
   d="scan'208";a="29978529"
Subject: Re: [PATCH] hvmloader: flip "ACPI data" to ACPI NVS type for ACPI
 table region
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
	<roger.pau@citrix.com>, <wl@xen.org>, <iwj@xenproject.org>
References: <1602586216-27371-1-git-send-email-igor.druzhinin@citrix.com>
 <56bea9a9-2509-cc39-a6fd-fb7db3e54d71@suse.com>
 <83f567a1-35f3-a227-830b-a59b53217f3b@citrix.com>
 <ad54c16b-c3b0-cff2-921f-b84a735d3149@suse.com>
 <cc0f409e-60c0-41ae-f932-f6c2d7f82baa@citrix.com>
 <5d7bf2ce-1acb-05ff-a57b-d698e15c4dd1@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <74ad734a-634b-d6f0-3829-fb3895e7d9e5@citrix.com>
Date: Wed, 14 Oct 2020 01:42:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5d7bf2ce-1acb-05ff-a57b-d698e15c4dd1@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13/10/2020 16:54, Jan Beulich wrote:
> On 13.10.2020 17:47, Igor Druzhinin wrote:
>> On 13/10/2020 16:35, Jan Beulich wrote:
>>> On 13.10.2020 14:59, Igor Druzhinin wrote:
>>>> On 13/10/2020 13:51, Jan Beulich wrote:
>>>>> As a consequence I think we will also want to adjust Xen itself to
>>>>> automatically disable ACPI when it ends up consuming E801 data. Or
>>>>> alternatively we should consider dropping all E801-related code (as
>>>>> being inapplicable to 64-bit systems).
>>>>
>>>> I'm not following here. What Xen has to do with E801? It's a SeaBIOS implemented
>>>> call that happened to be used by QEMU option ROM. We cannot drop it from there
>>>> as it's part of BIOS spec.
>>>
>>> Any ACPI aware OS has to use E820 (and nothing else). Hence our
>>> own use of E801 should either be dropped, or lead to the
>>> disabling of ACPI. Otherwise real firmware using logic similar
>>> to SeaBIOS'es (but hopefully properly accounting for holes)
>>> could make us use ACPI table space as normal RAM.
>>
>> It's not us using it - it's a boot loader from QEMU in a form of option ROM
>> that works in 16bit pre-OS environment which is not OS and relies on e801 BIOS call.
>> I'm sure any ACPI aware OS does indeed use E820 but the problem here is not an OS.
>>
>> The option ROM is loaded using fw_cfg from QEMU so it's not our code. Technically
>> it's one foreign code (QEMU boot loader) talking to another foreign code (SeaBIOS)
>> which provides information based on E820 that we gave them.
>>
>> So I'm afraid decision to dynamically disable ACPI (whatever you mean by this)
>> cannot be made by sole usage of this call by a pre-OS boot loader.
> 
> I guess this is simply a misunderstanding. I'm not talking about
> your change or hvmloader or the boot loader at all. I was merely
> noticing a consequence of your findings on the behavior of Xen
> itself: Use of ACPI and use of E801 are exclusive of one another.

Sorry, yes. I forgot e801 is also used by Xen as an alternative to e820.

Igor

