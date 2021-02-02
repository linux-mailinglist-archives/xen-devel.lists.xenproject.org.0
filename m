Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B112630BD48
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 12:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80504.147286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6u2g-0004LH-RV; Tue, 02 Feb 2021 11:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80504.147286; Tue, 02 Feb 2021 11:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6u2g-0004Kv-OG; Tue, 02 Feb 2021 11:40:22 +0000
Received: by outflank-mailman (input) for mailman id 80504;
 Tue, 02 Feb 2021 11:40:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33Vw=HE=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1l6u2g-0004Kq-3I
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 11:40:22 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cf433e3-6bba-4bb0-a376-66de3294a7a0;
 Tue, 02 Feb 2021 11:40:20 +0000 (UTC)
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
X-Inumbo-ID: 5cf433e3-6bba-4bb0-a376-66de3294a7a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612266020;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=+kTizDiF4wV7/9RFfLTm8OjoqBaK7bkQnA7o6h0Mck8=;
  b=Ju4NjJZbZkqM1yDCu3SpDgXBPm4XFPmpPVBhfoQeR7W+LZ1YuAnGXFGE
   u6i7OQBitZ2YgXbMXZu7elNLKdic8lR+puYtSA3+PW+/l7A459uVsAIvK
   Ie0dg+kU4HQ3GTe7zt+db1MGQ91Oy//Ox15fdyrbTcyCYIwiQGtZfzdKc
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: M4zBCpaNZ3+L6gJcZmnpqcy1J8OIfxaO0ESYP0qQ47leepw/plLxTjbAOj3A8Lzgy4InxOetui
 Z6BQAPTU2Ry/tDfbjsHb99HSVGYPWZHrE8iRKyPXRlWVizgphi1xWryS7c9WNpicxl0MTx0QnH
 b3HSSV8DwLNhY8reeerbJdPsOIop3QYK0JLluTDF89WIEilfW4H6rZvKbPKAQlQ3343T3H5Nm7
 G4BiqfvN+hJr7cIDfMprjZUYbTVPrP7KJAgs+k0t5xq4Mgp3fy69sTM8eX/6b7pIxdeByKyiQi
 1Xg=
X-SBRS: 5.1
X-MesageID: 36556528
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,394,1602561600"; 
   d="scan'208";a="36556528"
Subject: Re: staging: unable to restore HVM with Viridian param set
To: <paul@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>, "'Tamas K
 Lengyel'" <tamas.k.lengyel@gmail.com>, 'Xen-devel'
	<xen-devel@lists.xenproject.org>, 'Wei Liu' <wl@xen.org>, 'Ian Jackson'
	<iwj@xenproject.org>, 'Anthony PERARD' <anthony.perard@citrix.com>
References: <CABfawhkxEKOha7RYpSvTaJEtxyBsio9Pcc=xtRD7DszHm2k2pw@mail.gmail.com>
 <12e17af4-3502-0047-36e2-3c1262602747@citrix.com>
 <7ea14fac-7832-fe68-529e-03a8f9812f88@citrix.com>
 <035301d6f93e$4d03c6b0$e70b5410$@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <e8e7d041-3196-9387-df84-16176459d0ff@citrix.com>
Date: Tue, 2 Feb 2021 11:40:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <035301d6f93e$4d03c6b0$e70b5410$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/02/2021 08:35, Paul Durrant wrote:
>> -----Original Message-----
>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Sent: 02 February 2021 00:20
>> To: Andrew Cooper <andrew.cooper3@citrix.com>; Tamas K Lengyel <tamas.k.lengyel@gmail.com>; Xen-devel
>> <xen-devel@lists.xenproject.org>; Wei Liu <wl@xen.org>; Ian Jackson <iwj@xenproject.org>; Anthony
>> PERARD <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>
>> Subject: Re: staging: unable to restore HVM with Viridian param set
>>
>> n 01/02/2021 22:57, Andrew Cooper wrote:
>>> On 01/02/2021 22:51, Tamas K Lengyel wrote:
>>>> Hi all,
>>>> trying to restore a Windows VM saved on Xen 4.14 with Xen staging results in:
>>>>
>>>> # xl restore -p /shared/cfg/windows10.save
>>>> Loading new save file /shared/cfg/windows10.save (new xl fmt info 0x3/0x0/1475)
>>>>  Savefile contains xl domain config in JSON format
>>>> Parsing config from <saved>
>>>> xc: info: Found x86 HVM domain from Xen 4.14
>>>> xc: info: Restoring domain
>>>> xc: error: set HVM param 9 = 0x0000000000000065 (17 = File exists):
>>>> Internal error
>>>> xc: error: Restore failed (17 = File exists): Internal error
>>>> libxl: error: libxl_stream_read.c:850:libxl__xc_domain_restore_done:
>>>> restoring domain: File exists
>>>> libxl: error: libxl_create.c:1581:domcreate_rebuild_done: Domain
>>>> 8:cannot (re-)build domain: -3
>>>> libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
>>>> 8:Non-existant domain
>>>> libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
>>>> 8:Unable to destroy guest
>>>> libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
>>>> 8:Destruction of domain failed
>>>>
>>>> Running on staging 419cd07895891c6642f29085aee07be72413f08c
>>>
>>> CC'ing maintainers and those who've edited the code recently.
>>>
>>> What is happening is xl/libxl is selecting some viridian settings,
>>> applying them to the domain, and then the migrations stream has a
>>> different set of viridian settings.
>>>
>>> For a migrating-in VM, nothing should be set during domain build.
>>> Viridian state has been part of the migrate stream since before mig-v2,
>>> so can be considered to be everywhere relevant now.
>>
>> The fallout is likely from my changes that modified default set of viridian
>> settings. The relevant commits:
>> 983524671031fcfdb24a6c0da988203ebb47aebe
>> 7e5cffcd1e9300cab46a1816b5eb676caaeed2c1
>>
>> The same config from migrated domains now implies different set of viridian
>> extensions then those set at the source side. That creates inconsistency in
>> libxl. I don't really know how to address it properly in libxl other than
>> don't extend the default set ever.
>>
> 
> Surely it should be addressed properly in libxl by not messing with the viridian settings on migrate-in/resume, as Andrew says? TBH I thought this was already the case. There should be no problem with adding to the default set as this is just an xl/libxl concept; the param flags in Xen are always define the *exact* set of enabled enlightenments.

If maintainers agree with this approach I can make a patch.

Igor

