Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A6C2837DA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 16:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3038.8772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPRVm-0003qS-8Z; Mon, 05 Oct 2020 14:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3038.8772; Mon, 05 Oct 2020 14:30:46 +0000
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
	id 1kPRVm-0003q3-5D; Mon, 05 Oct 2020 14:30:46 +0000
Received: by outflank-mailman (input) for mailman id 3038;
 Mon, 05 Oct 2020 14:30:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kPRVk-0003ps-KL
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 14:30:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41d812fb-380f-44ab-b1f5-bb7111cc2032;
 Mon, 05 Oct 2020 14:30:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kPRVk-0003ps-KL
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 14:30:44 +0000
X-Inumbo-ID: 41d812fb-380f-44ab-b1f5-bb7111cc2032
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 41d812fb-380f-44ab-b1f5-bb7111cc2032;
	Mon, 05 Oct 2020 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601908242;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=1PbzvOMyYiCA8HRp1C2Z5uZAn7tZtAPSW1EUWLpxzK0=;
  b=hVyhn+aYlQpGfCUSVGyCD0ma5ZhNxQdpjcgwwXbmtfg2y2dry4IxEg3M
   T44guurPniKiu7c3k2dBUeDnQ/algODYKRHK1ISgmI7Es+vr9hTaXHB5C
   JTWjrjxa3lq4t/50QUQFYPw9PGOVoOupNm7nGnztMbCERw6xF5r4a0h6Z
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5NfeUyMmJ7ZCSCc4Fjo7RwASt7DO584VaS/tUzGSR6l0q66wM8YRzbBMBc/L4dr2ZoGzHV9K46
 gpsz0C26MsWRARo4jm13Etv27veFRYpEFRaNwvKMypOjcejxw25b4Xl4yLjTywhvio334XnXlL
 THNQSe581rWt1w/fQ8HNW7j1p1giOYe0VNQ2SkUuG585k7XPCTheLeSzYgor0iezSCp15HH8lg
 9AkI+3GYGCTyAvJt8iyoMCxNSNm2fIjS2oAgOGiL6oIUJgO1xrPEr7AA2dR05Yibx6m53qvvcc
 wV4=
X-SBRS: None
X-MesageID: 28297677
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,338,1596513600"; 
   d="scan'208";a="28297677"
Subject: Re: [PATCH] ioreq: cope with server disappearing while I/O is pending
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Julien Grall <julien@xen.org>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201005140817.1339-1-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <84dea7c2-cd0e-c954-1bc7-80568e428ff4@citrix.com>
Date: Mon, 5 Oct 2020 15:30:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005140817.1339-1-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 05/10/2020 15:08, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> Currently, in the event of an ioreq server being destroyed while I/O is
> pending in the attached emulator, it is possible that hvm_wait_for_io() will
> dereference a pointer to a 'struct hvm_ioreq_vcpu' or the ioreq server's
> shared page after it has been freed.

It's not legitimate for the shared page to be freed while Xen is still
using it.

Furthermore, this patch only covers the most obvious place for the bug
to manifest.  It doesn't fix them all, as a ioreq server destroy can
race with an in-progress emulation and still suffer a UAF.


An extra ref needs holding on the shared page between acquire_resource
and domain destruction, to cover Xen's use of the page.

Similarly, I don't think it is legitimate for hvm_ioreq_vcpu to be freed
while potentially in use.  These need to stick around until domain
destruction as well, I think.

> This will only occur if the emulator (which is necessarily running in a
> service domain with some degree of privilege) does not complete pending I/O
> during tear-down and is not directly exploitable by a guest domain.
>
> This patch adds a call to get_pending_vcpu() into the condition of the
> wait_on_xen_event_channel() macro to verify the continued existence of the
> ioreq server. Should it disappear, the guest domain will be crashed.
>
> NOTE: take the opportunity to modify the text on one gdprintk() for
>       consistency with others.

I know this is tangential, but all these gdprintk()'s need to change to
gprintk()'s, so release builds provide at least some hint as to why the
domain has been crashed.

(And I also really need to finish off my domain_crash() patch to force
this everywhere.)

~Andrew

