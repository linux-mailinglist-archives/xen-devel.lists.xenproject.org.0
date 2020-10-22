Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023F629607F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 15:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10463.27791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVb4a-0005eh-Ug; Thu, 22 Oct 2020 13:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10463.27791; Thu, 22 Oct 2020 13:56:08 +0000
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
	id 1kVb4a-0005eI-RM; Thu, 22 Oct 2020 13:56:08 +0000
Received: by outflank-mailman (input) for mailman id 10463;
 Thu, 22 Oct 2020 13:56:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L1Xo=D5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kVb4Y-0005eD-Q7
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:56:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab658084-3fbd-4905-b3ac-216890b9cebe;
 Thu, 22 Oct 2020 13:56:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=L1Xo=D5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kVb4Y-0005eD-Q7
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:56:06 +0000
X-Inumbo-ID: ab658084-3fbd-4905-b3ac-216890b9cebe
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ab658084-3fbd-4905-b3ac-216890b9cebe;
	Thu, 22 Oct 2020 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603374962;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=xIvhnaxGXwC7eRdxAHcJrIJSH93g+CeMtChMIroxYXE=;
  b=U+nYsk6YRlj6kplljuB/daJc+CR+avfe9IDaeU7n3sCfbrduhIl/X1hA
   oXAk9R1yZR56c3D18FGeQGvLypNEA/Y3xjAd80R1WkUY7Od5mAy/bc1e2
   f458FXUbWYILD4jHoGgqi1RV+YR9tZEUzUMBm9Hmoqki48qO8y/wd1Cl2
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gQv3tFbXCV1aKSXWEhDynYlB0+Tf38pRvB7oeQfQ1VTK2Cs7wlIQguIPk2F3Ka0XYNJiWJ7gdI
 b4lS6e4ImYW44HUn6OTQbRqN4QHtU94Pqz6MAq8R/0A71m9ly3aB9KfbP4QjRokYbLkdw2iZlm
 y2f9kow374XWJnNZgz/BelcfhbfN7HmZHs60lTURW40A7JruIif8Zx1Q54NrmUfAF/Xx6OjwdC
 M8ORIITQLmgBxDIGqvWcKiwx+PtTydxXss4U3AaDDzecKRe1QrGlT1Bw6NDg2fzPT4Gj1P8Jqv
 iz0=
X-SBRS: None
X-MesageID: 29543276
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,404,1596513600"; 
   d="scan'208";a="29543276"
Subject: Re: [PATCH] x86emul: increase FPU save area in test harness/fuzzer
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <adb5abbd-be50-82ba-c85d-c47024acc47c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <367a2c7b-3cdf-e8ff-a0d8-50c200956004@citrix.com>
Date: Thu, 22 Oct 2020 14:55:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <adb5abbd-be50-82ba-c85d-c47024acc47c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 22/10/2020 14:39, Jan Beulich wrote:
> Running them on a system (or emulator) with AMX support requires this
> to be quite a bit larger than 8k, to avoid triggering the assert() in
> emul_test_init(). Bump all the way up to 16k right away.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Intel's Software Development Emulator properly reports XSAVE-related AMX
> CPUID data for Sapphire Rapids emulation as of 8.59.0.
>
> --- a/tools/tests/x86_emulator/x86-emulate.c
> +++ b/tools/tests/x86_emulator/x86-emulate.c
> @@ -33,7 +33,7 @@
>  uint32_t mxcsr_mask = 0x0000ffbf;
>  struct cpuid_policy cp;
>  
> -static char fpu_save_area[4096] __attribute__((__aligned__((64))));
> +static char fpu_save_area[0x4000] __attribute__((__aligned__((64))));
>  static bool use_xsave;
>  
>  /*


