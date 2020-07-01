Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B9A211233
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 19:52:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqguA-0001jE-8B; Wed, 01 Jul 2020 17:52:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xe6U=AM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jqgu8-0001j6-Kh
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 17:52:16 +0000
X-Inumbo-ID: 99202092-bbc3-11ea-8751-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99202092-bbc3-11ea-8751-12813bfff9fa;
 Wed, 01 Jul 2020 17:52:15 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: p9HUq16D4AAzzYFj4pTIdFyoJSzWL1QVqfLKaG8z+PeddPoDV8F/ejsa5l5V8M/od7FVpUskxB
 184RsqVyciNFukZnSXfLLW3enB7gsYfNOfOk5E+uEGJ6ymTnrEqu6obHhaGItX7023jtH6y9yn
 zBmFLRKLgtgGpl2qSQT/reW+I5JUSgDrBrJP3O4pAUUVF2O7lxr66C7QHThRwy+USnFd9GgyFF
 qyrtZnrdd4tIjqs0NLvV9Mn/HJR6AS/H/8XDOBByZuzcnJaEWgOeq/H2gGKL8u/a+/zf4Lc5ZX
 r30=
X-SBRS: 2.7
X-MesageID: 21734709
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,301,1589256000"; d="scan'208";a="21734709"
Subject: Re: [PATCH v4 01/10] x86/vmx: add Intel PT MSR definitions
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 <xen-devel@lists.xenproject.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <2ff9ecee8367e814a29b17a34203bda0e3c48d74.1593519420.git.michal.leszczynski@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <46b8c096-91ae-a3d7-1c53-d54616f38388@citrix.com>
Date: Wed, 1 Jul 2020 18:52:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2ff9ecee8367e814a29b17a34203bda0e3c48d74.1593519420.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: tamas.lengyel@intel.com, luwei.kang@intel.com, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/06/2020 13:33, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
>
> Define constants related to Intel Processor Trace features.
>
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>

Acked-by: Andrew Cooper <andrew.cooper3@ctirix.com>

I wanted to have a play with the series, and have ended up having to do
the rebase anyway.

As we're in code freeze for 4.14, I've started x86-next in its usual
location
(https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/x86-next)
and will commit this (and any other accumulated patches) once 4.15 opens.

~Andrew

