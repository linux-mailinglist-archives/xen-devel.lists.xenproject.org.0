Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1702811B0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 13:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2000.5930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJeb-0006b7-2X; Fri, 02 Oct 2020 11:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2000.5930; Fri, 02 Oct 2020 11:55:13 +0000
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
	id 1kOJea-0006ai-VH; Fri, 02 Oct 2020 11:55:12 +0000
Received: by outflank-mailman (input) for mailman id 2000;
 Fri, 02 Oct 2020 11:55:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOJeY-0006ac-W9
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:55:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23cfc5dd-6ab1-49e7-9449-4e15921ea93b;
 Fri, 02 Oct 2020 11:55:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOJeY-0006ac-W9
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:55:11 +0000
X-Inumbo-ID: 23cfc5dd-6ab1-49e7-9449-4e15921ea93b
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 23cfc5dd-6ab1-49e7-9449-4e15921ea93b;
	Fri, 02 Oct 2020 11:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601639709;
  h=subject:to:references:from:cc:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=xwzCT+Copx3aEgviGeHmA5hn+Ofm5MhoBu1WshWrOo0=;
  b=T2PlnndAte8/IcwXSUkIj4q9mn2v/Crj6706JxBSidAIqoXRaxPFpkBp
   x8IPokJgfSJP/LIZHLqSn6Awc1kRNJ8MtpznhYA8nMXqXkbMcxNSVwep0
   GbsEf7XOLcUmmo/s5Qo2FQJJNLELynWLAVaeRE+yaultlkr3xBBgTOti1
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: v2PcWNnaYGcL/ylgiJ3SMF2nrZ44JYoMXlYVj3UarFnixThafqGqEEWseMMnGXf+XwtVbQYWQ9
 sGPKR0C8Nke/DPgivMhCWS7EW6yXLyYIWYZXu+2giWQ0snUzsu+ieZ3wgdcXx5XeYVVojn7ZI2
 cqsuIe7yoCdZu61wI4pikQizba81ZR0uXfQ+zcrbum6Q5tOX6MIXHgbq1vy9Bf/Ud5NZIGlgEL
 2j6cvqFxONdjP14C9gl0EKtB0Zfr4AZspRObN/m6BbKmNe2nRoLklthcV7Fw0kd0W0ae9FO4FC
 x68=
X-SBRS: None
X-MesageID: 29171978
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,327,1596513600"; 
   d="scan'208";a="29171978"
Subject: Re: [xen-unstable-smoke bisection] complete test-amd64-amd64-libvirt
To: <xen-devel@lists.xenproject.org>
References: <E1kOAhz-0006XB-8d@osstest.test-lab.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jim Fehlig <jfehlig@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<ian.jackson@eu.citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <f5c5e9ea-aab2-4295-9a68-56a1cc07645e@citrix.com>
Date: Fri, 2 Oct 2020 12:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <E1kOAhz-0006XB-8d@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 02/10/2020 03:22, osstest service owner wrote:
> *** Found and reproduced problem changeset ***
>
>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>   Bug introduced:  bfcc97c08c2258316d1cd92c23a441d97ad6ff4e
>   Bug not present: 50a5215f30e964a6f16165ab57925ca39f31a849
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155282/
>
>
>   commit bfcc97c08c2258316d1cd92c23a441d97ad6ff4e
>   Author: Andrew Cooper <andrew.cooper3@citrix.com>
>   Date:   Tue Sep 29 14:48:52 2020 +0100
>   
>       tools/cpuid: Plumb nested_virt down into xc_cpuid_apply_policy()
>       
>       Nested Virt is the final special case in legacy CPUID handling.  Pass the
>       (poorly named) nested_hvm setting down into xc_cpuid_apply_policy() to break
>       the semantic dependency on HVM_PARAM_NESTEDHVM.
>       
>       No functional change.
>       
>       Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>       Acked-by: Wei Liu <wl@xen.org>

This is totally bizarre.

From
http://logs.test-lab.xenproject.org/osstest/logs/155282/test-amd64-amd64-libvirt/huxelrebe1---var-log-libvirt-libvirtd.log.gz
we get a bunch of:

debug : libvirt_vmessage:71 : libvirt_vmessage: context='libxl'
format='%s%s%s%s%s%s'

lines, which I suspect means that libxl has tried logging and error, and
its not been rendered correctly.


The only possible change in libxl is side effects from the extra call to
libxl_defbool_val() which asserts that the boolean isn't in its default
form.

However, by this point in booting, libxl__domain_build_info_setdefault()
should have already forced it to true or false.

~Andrew, still very much confused

