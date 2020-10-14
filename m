Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC7028DA6E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 09:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6462.17274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSbBe-0002Lp-Rh; Wed, 14 Oct 2020 07:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6462.17274; Wed, 14 Oct 2020 07:27:02 +0000
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
	id 1kSbBe-0002LQ-O7; Wed, 14 Oct 2020 07:27:02 +0000
Received: by outflank-mailman (input) for mailman id 6462;
 Wed, 14 Oct 2020 07:27:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSbBd-0002LL-FY
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 07:27:01 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c922892e-4ce5-44bc-a104-776455766291;
 Wed, 14 Oct 2020 07:27:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSbBd-0002LL-FY
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 07:27:01 +0000
X-Inumbo-ID: c922892e-4ce5-44bc-a104-776455766291
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c922892e-4ce5-44bc-a104-776455766291;
	Wed, 14 Oct 2020 07:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602660420;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=IY90oTO/XQ2Xn0kKiPXT1+zqd4KPsoyyBd43FnKJ+Kc=;
  b=D7M/h1F7RgzYZB+cCCyEXriIHDuZbDKap8MykgKAC70etlcju3IkEp/r
   FqI0MCbgKK5X5S9XzhbJe7GylkvPiLxJKbbyMREQ0BQNy8OvQ3swuP6eA
   NQ8pPPqMvtUUtSHkGlc16HTI5bbOVdrN78GQxEKQEgf0KcCzNgUZ2DxBb
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: p/uXqkSUDTUMmxjK3WMwSIhyUmptY2jWQ5yFTnoHv9h2/JDBmP4ZPkj+/qscwjA5eS+Jep+/vQ
 05zdHIL4GxVQyfRvUgMUkN1UkQTa+I7moq/R607wUuBPNz/f5ZhcztgvHe2gOniwYLgs/z2Fb2
 ETR8UmbN3kOpo+r1lm6HQTkTFQxs8KCvEI0yWJgjIcc2fwq/+uaaVv0evymiwIqSBOClEdKKCa
 Ewwl/gzhWD8IRJIU2ZqxBXcv9nVeJHh+qd75Ocma3FIKCiIHFBHR0/L5IXEhZcQtDalPuUWBR1
 lDY=
X-SBRS: 2.5
X-MesageID: 29023519
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,374,1596513600"; 
   d="scan'208";a="29023519"
Subject: Re: [PATCH] kexec: some #include adjustments
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <c786bd7e-960a-6496-ec9a-4e04a771b80a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f00f10d5-96bd-d3f1-0800-a2415233265f@citrix.com>
Date: Wed, 14 Oct 2020 08:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c786bd7e-960a-6496-ec9a-4e04a771b80a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 14/10/2020 08:05, Jan Beulich wrote:
> In the context of working on x86's elf_core_save_regs() I noticed there
> were far more source files getting rebuilt than I would have expected.
> While the main offender looks to have been fixmap.h including kexec.h,
> also drop use of elfcore.h from kexec.h.
>
> While adjusting machine_kexec.c also replace use of guest_access.h by
> domain_page.h.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Perhaps best not to ask why it was like that...

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

