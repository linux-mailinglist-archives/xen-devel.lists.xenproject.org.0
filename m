Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36D2954BE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 00:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10150.26857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVMSe-0006wu-57; Wed, 21 Oct 2020 22:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10150.26857; Wed, 21 Oct 2020 22:20:00 +0000
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
	id 1kVMSe-0006wV-1o; Wed, 21 Oct 2020 22:20:00 +0000
Received: by outflank-mailman (input) for mailman id 10150;
 Wed, 21 Oct 2020 22:19:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kVMSc-0006wQ-0l
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 22:19:58 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bb2c559-8662-406d-8741-6be5f1479558;
 Wed, 21 Oct 2020 22:19:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kVMSc-0006wQ-0l
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 22:19:58 +0000
X-Inumbo-ID: 1bb2c559-8662-406d-8741-6be5f1479558
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1bb2c559-8662-406d-8741-6be5f1479558;
	Wed, 21 Oct 2020 22:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603318796;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=9cBA/Wmi9yoXzSP093C/7HAdOeR5X/ffuX6BuKX7UUU=;
  b=J5RelrYjMjMa56G8uHSKw0dNr9FjcWQ4ezG87ymsahpy92i5GdkB44ZF
   9x7Limz4qhEuUqQUidRacINEqonvluABupL13KtAJ1i0bSEfM19P1WOhp
   9aYwXOgjlVvlSxFoA0YqgbDv4kg01hMLZJvGuPFydSCEFDvfPWDf61lNw
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LJS+Iw0KcEJFzMh0CmMjH6z5cIONCpUJdhEtRxY0thjIgwi4wcOH2avndW8PIlBCd9yctBQG/E
 gLfAsmOnUK9DpxZ2b/pJPcrO9dFXFHqrPSd+jeXrP820ap2fyj+SGaUP0l5hdmlbUpyTwIWvAh
 1WanFPEwne5iIhf+NU4TQqdNlgQ3djX+ICFM9gy23Oqwcg/sbgDc76UUrqu/YxchjKaHo0Evn6
 KpjNrCum/j7UOOZitjtmhZ3b/biSh0DeG4y14Iva5/+XKIfeeC2YxThExUMC7Abt8n6nefnEbt
 DDI=
X-SBRS: 2.5
X-MesageID: 30584730
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,402,1596513600"; 
   d="scan'208";a="30584730"
Subject: Re: [PATCH v2 00/14] kernel-doc: public/arch-arm.h
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <george.dunlap@citrix.com>,
	<ian.jackson@eu.citrix.com>, <jbeulich@suse.com>, <julien@xen.org>,
	<wl@xen.org>, <Bertrand.Marquis@arm.com>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
 <85d505c1-1328-055e-e3f9-1b8cddde16d6@citrix.com>
 <alpine.DEB.2.21.2010211504390.12247@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <966c90f8-730c-7df1-17bf-95a8a0bcaf9d@citrix.com>
Date: Wed, 21 Oct 2020 23:19:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010211504390.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 21/10/2020 23:08, Stefano Stabellini wrote:
> On Wed, 21 Oct 2020, Andrew Cooper wrote:
>> On 21/10/2020 01:00, Stefano Stabellini wrote:
>>> Hi all,
>>>
>>> This patch series converts Xen in-code comments to the kernel-doc (and
>>> doxygen) format:
>>>
>>> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html
>>>
>>> Please note that this patch series is meant as groundwork. The end goal
>>> is to enable a more sophisticated documents generation with doxygen,
>>> see: https://marc.info/?l=xen-devel&m=160220627022339
>>>
>>>
>>> # Changes compared to v1:
>>> - addressed review comments
>>> - use oneline comments even for nested struct members
>> On the whole, good.
>>
>> However, there is one thing which problematic.  Right from patch 1, you
>> start breaking the content used to render
>> https://xenbits.xen.org/docs/unstable/hypercall/index.html
>>
>> Either the patches need to incrementally feed the converted files into
>> Sphinx directly (possibly with some one-time plumbing ahead of time), or
>> patch 1 needs to be some script in docs/ capable of rendering kernel-doc
>> to HTML, so we at least keep the plain docs around until the Sphinx
>> integration is complete.
>>
>> i.e. don't cause what we currently have to fall off
>> https://xenbits.xen.org/docs/ entirely as a consequence of this series.
> Thanks for pointing this out, it was not my intention. In fact, I wasn't
> aware of https://xenbits.xen.org/docs/unstable/hypercall/index.html at
> all. How is it generated? I am asking because I need to understand how
> that works in order not to break it...

docs/xen-headers which is a random perl script suffering from
NIH-syndrome in a world with many far better alternatives.

> Is it just a matter of retaining the keywords like `incontents 50 and other
> comments starting with ` ?

I deliberately tried not to specify that "it should remain as is".

I will happily delete this script and infrastructure if you don't beat
me too it first, and it was one of my goals of suggesting kernel-doc in
the first place.  After all, our longterm goal is to move fully over to
Sphinx.

If that means maintaining both the legacy and the new side-by-side,
fine.  If it means moving one single header at a time fully into sphinx,
also fine.  (Observe that https://xenbits.xen.org/docs/latest/ is Sphinx
rendered from staging).  I certainly don't intend for the docs to
survive in their current form forever.

All I want to avoid is that the hypercall documentation disappears
entirely from https://xenbits.xen.org/docs/ in the interim.

~Andrew

