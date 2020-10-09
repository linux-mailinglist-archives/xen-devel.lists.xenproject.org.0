Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5514B288943
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 14:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4760.12533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQrrG-0000nM-Og; Fri, 09 Oct 2020 12:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4760.12533; Fri, 09 Oct 2020 12:50:50 +0000
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
	id 1kQrrG-0000mx-LR; Fri, 09 Oct 2020 12:50:50 +0000
Received: by outflank-mailman (input) for mailman id 4760;
 Fri, 09 Oct 2020 12:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4y9=DQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kQrrF-0000mn-19
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 12:50:49 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78e1486d-3f53-48ab-9fc7-5cb52875436e;
 Fri, 09 Oct 2020 12:50:47 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=n4y9=DQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kQrrF-0000mn-19
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 12:50:49 +0000
X-Inumbo-ID: 78e1486d-3f53-48ab-9fc7-5cb52875436e
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 78e1486d-3f53-48ab-9fc7-5cb52875436e;
	Fri, 09 Oct 2020 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602247847;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=LA4ValVjL8pCRMheQICR7aT2QKgr/PA2M2hwj82BINA=;
  b=IeZPWatKUAh7e7Aot15PtMzZLjZ3kjoz8ABdQ+ocoZEZTsijmrS5Bswf
   lgIH2QOzngPB5muw/xDBImV97lMwRXpqTJBFCwKyCK+fx+9lpO/eBErNS
   dHWmV5WL3ZYlpnUCfQ9UxwEOuk1o3fG9YTpj7tNbPhRb8CK8o3T4tx/Ec
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: smdUOx3w+32oKOmu51KwsCZaG4UKu0bEw/KfBW8svV1/vFYgHEy9I18K47LhVZtBBoLp813W7P
 KVTXBH18FaII4/fb4bZTDz458HlP6GI1xmLcBQfrsb1dKnqNnD1doo+b5+GYestrHk5TemCNR9
 IylMv2briVnewrrl9OP7tybN6Gp7L4r8pC1udySDfcYnACdXx+yJ3VsY9xDfVUPTjaTbalo/Je
 /9cnt28FKbQPVekyl6CcfuH6zhoM1gMrfPP8cKGw7aDFYObggwPJiJeXEhhfh+WO6dDYLg7idB
 8I4=
X-SBRS: 2.5
X-MesageID: 28739715
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,355,1596513600"; 
   d="scan'208";a="28739715"
Subject: Re: [PATCH v2] x86/pv: Inject #UD for missing SYSCALL callbacks
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Andy Lutomirski <luto@kernel.org>
References: <20200923101848.29049-4-andrew.cooper3@citrix.com>
 <20201009115301.19516-1-andrew.cooper3@citrix.com>
 <20201009124057.GC20248@mail.soc.lip6.fr>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8806fa3a-d614-c5e0-5456-5a286a48f9a5@citrix.com>
Date: Fri, 9 Oct 2020 13:50:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009124057.GC20248@mail.soc.lip6.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 09/10/2020 13:40, Manuel Bouyer wrote:
> On Fri, Oct 09, 2020 at 12:53:01PM +0100, Andrew Cooper wrote:
>> Despite appearing to be a deliberate design choice of early PV64, the
>> resulting behaviour for unregistered SYSCALL callbacks creates an untenable
>> testability problem for Xen.  Furthermore, the behaviour is undocumented,
>> bizarre, and inconsistent with related behaviour in Xen, and very liable
>> introduce a security vulnerability into a PV guest if the author hasn't
>> studied Xen's assembly code in detail.
>>
>> There are two different bugs here.
>>
>> 1) The current logic confuses the registered entrypoints, and may deliver a
>>    SYSCALL from 32bit userspace to the 64bit entry, when only a 64bit
>>    entrypoint is registered.
>>
>>    This has been the case ever since 2007 (c/s cd75d47348b) but up until
>>    2018 (c/s dba899de14) the wrong selectors would be handed to the guest for
>>    a 32bit SYSCALL entry, making it appear as if it a 64bit entry all along.
>>
>>    Xen would malfunction under these circumstances, if it were a PV guest.
>>    Linux would as well, but PVOps has always registered both entrypoints and
>>    discarded the Xen-provided selectors.  NetBSD really does malfunction as a
>>    consequence (benignly now, but a VM DoS before the 2018 Xen selector fix).
> What do you mean with «malfunction» ? A 64bits guest can run 32bit code
> just fine, this is part of our daily regression tests.

Right, but your 32bit code never executes the SYSCALL instruction,
because it is hardwired as -ENOSYS on native, and doesn't work on Intel
hardware at all.

Under Xen, this enters the regular syscall path (buggy but benign), and
before the selector fix two years ago, would (AFAICT) eventually try to
HYPERCALL_iret with the bogus selectors, and hit the failsafe callback,
which is a straight panic().

~Andrew

