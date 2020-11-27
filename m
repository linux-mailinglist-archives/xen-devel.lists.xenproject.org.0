Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606882C6C6A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 21:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39750.72755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kik1u-0000SX-Hg; Fri, 27 Nov 2020 20:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39750.72755; Fri, 27 Nov 2020 20:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kik1u-0000S8-EI; Fri, 27 Nov 2020 20:07:42 +0000
Received: by outflank-mailman (input) for mailman id 39750;
 Fri, 27 Nov 2020 20:07:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JwIZ=FB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kik1s-0000S3-V9
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 20:07:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 064e1b16-8d08-4c7b-b429-975f070b6184;
 Fri, 27 Nov 2020 20:07:40 +0000 (UTC)
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
X-Inumbo-ID: 064e1b16-8d08-4c7b-b429-975f070b6184
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606507659;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=C9n1oQhEsOHMBx+KbrK1gnFhFHJ6nRyCPoPSDo4N4EA=;
  b=L4AOfNVvUG1NLEGDug7gVrmO+GdRhyCzAPB31rmUa7nklzCWpxBd8P+q
   JCFLMpGNWbEXxHXJ9dLYEhtNYWm9LN9bNS237imtIMybFDtlmA2blFleo
   cPpxa9wOdqghydB0k72IctRvSJ2S7rQQM54RxpYg+8jvxwzvCEnd8szn5
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5pjND+uApVf2uh0XkcuNaA8W0kHzL4eGZF4BJEi43HE5N2jakdToZ7BjBMrnIBdyp9tEJ0BHB+
 w5s0/xhO5WFHuAxIisv+crNAEv96NqOpy0WaaJi/pUFiG0kKiuAzHNf0vN2CN5y297WrbY7ny+
 bd6QUolDDx6LgTyEG40uYqvGWu8XyBOjVHl/GNXcx7MbUJVBBJ3boblBw60ThyhD0K9qxyGWxY
 AgQe6Ziu0G6jvNgf6hyuGSFz9OfAJo51lEBZ7K5KznxMM04BlZyIPUTDzLV14V06BDD8dn7c06
 uAg=
X-SBRS: None
X-MesageID: 32405802
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,375,1599537600"; 
   d="scan'208";a="32405802"
Subject: Re: [PATCH 0/7] xen/arm: Emulate ID registers
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606151462.git.bertrand.marquis@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <45b8aac3-75a6-670f-d6f2-b427c497ee2d@citrix.com>
Date: Fri, 27 Nov 2020 20:07:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1606151462.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 26/11/2020 15:51, Bertrand Marquis wrote:
> The goal of this serie is to emulate coprocessor ID registers so that
> Xen only publish to guest features that are supported by Xen and can
> actually be used by guests.
> One practical example where this is required are SVE support which is
> forbidden by Xen as it is not supported, but if Linux is compiled with
> it, it will crash on boot. An other one is AMU which is also forbidden
> by Xen but one Linux compiled with it would crash if the platform
> supports it.
>
> To be able to emulate the coprocessor registers defining what features
> are supported by the hardware, the TID3 bit of HCR must be disabled and
> Xen must emulated the values of those registers when an exception is
> catched when a guest is accessing it.
>
> This serie is first creating a guest cpuinfo structure which will
> contain the values that we want to publish to the guests and then
> provides the proper emulationg for those registers when Xen is getting
> an exception due to an access to any of those registers.
>
> This is a first simple implementation to solve the problem and the way
> to define the values that we provide to guests and which features are
> disabled will be in a future patchset enhance so that we could decide
> per guest what can be used or not and depending on this deduce the bits
> to activate in HCR and the values that we must publish on ID registers.
>
> Bertrand Marquis (7):
>   xen/arm: Add ID registers and complete cpufinfo
>   xen/arm: Add arm64 ID registers definitions
>   xen/arm: create a cpuinfo structure for guest
>   xen/arm: Add handler for ID registers on arm64
>   xen/arm: Add handler for cp15 ID registers
>   xen/arm: Add CP10 exception support to handle VMFR
>   xen/arm: Activate TID3 in HCR_EL2

CI found an ARM randconfig failure against this series.

https://gitlab.com/xen-project/patchew/xen/-/pipelines/221798884

I have admit that I can't spot an obvious connection so it might be
collateral damage from elsewhere, but does need looking at irrespective.

~Andrew (in lieu of a real CI robot).

