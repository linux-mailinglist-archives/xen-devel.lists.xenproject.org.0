Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B452AB585
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 11:54:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22368.48671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4od-0001DH-6u; Mon, 09 Nov 2020 10:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22368.48671; Mon, 09 Nov 2020 10:54:27 +0000
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
	id 1kc4od-0001Cr-3E; Mon, 09 Nov 2020 10:54:27 +0000
Received: by outflank-mailman (input) for mailman id 22368;
 Mon, 09 Nov 2020 10:54:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NS2=EP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kc4ob-0001CW-Km
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:54:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0207ecf-dd8f-4568-b69b-aab8e27ed41b;
 Mon, 09 Nov 2020 10:54:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2NS2=EP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kc4ob-0001CW-Km
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:54:25 +0000
X-Inumbo-ID: e0207ecf-dd8f-4568-b69b-aab8e27ed41b
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e0207ecf-dd8f-4568-b69b-aab8e27ed41b;
	Mon, 09 Nov 2020 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604919263;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=K0393i6vKcAjDPstlMWXCVBlFDlN8IgGJ1fo3abEXHc=;
  b=X/rLMMJIcIQJx83i37ZqvgfuAiM7L4BizObwHWLA4l2Z1N81vzFmSTHz
   5qfgv48G+zjBms8t6x2XKPIpiuShhFWtZDYXVeSoGVwmwRdUkxaVTy3G3
   5dqnBfI2Amgn1ZJmWBUCLOP2xJvXkHQ4N2GSc6MajKnoDsyxPK7xwY4Cn
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ctql2X4OGiMxAzz13OyWDhYIQkPJMF5wMecpH0QPoeoRuiFG/O3FIlWkP+7OFLvoiuiRSCf0gp
 Fna0lvPCEyGtzpj1tZQEUxsDZOhzWMEsgV+HMuBK6VcSLBPkeM8cvozfLv//0J0Rwwoze81F+2
 nSxlu3n+tVeiosxy5bIr4Hmfm9FIm2WMicdMcJVt92W4u/M9XqSjmSC4BJTJcQ4TUsnOzQvPrQ
 TdKRZlvfvfUSNO64LqZFZb6uTjuabauGpgvOJ4qw1FhWo5fatqYWKaK4FjwnW3Us4c5pfJb4mh
 3/Q=
X-SBRS: None
X-MesageID: 30713828
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,463,1596513600"; 
   d="scan'208";a="30713828"
Subject: Re: [PATCH] x86/CPUID: don't use UB shift when library is built as
 32-bit
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <b579bde8-6cd2-0407-f098-c44e1c9ff814@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <21f2020b-f74b-3726-69ff-fa54f4a209c0@citrix.com>
Date: Mon, 9 Nov 2020 10:54:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b579bde8-6cd2-0407-f098-c44e1c9ff814@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 09/11/2020 10:53, Jan Beulich wrote:
> At least the insn emulator test harness will continue to be buildable
> (and ought to continue to be usable) also as a 32-bit binary. (Right now
> the CPU policy test harness is, too, but there it may be less relevant
> to keep it functional, just like e.g. we don't support fuzzing the insn
> emulator in 32-bit mode.) Hence the library code needs to cope with
> this.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

