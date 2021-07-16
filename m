Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCC93CB7AA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 15:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157183.290122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4NVT-00083V-RI; Fri, 16 Jul 2021 13:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157183.290122; Fri, 16 Jul 2021 13:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4NVT-00080Y-O6; Fri, 16 Jul 2021 13:03:55 +0000
Received: by outflank-mailman (input) for mailman id 157183;
 Fri, 16 Jul 2021 13:03:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KHJG=MI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m4NVS-00080B-3C
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 13:03:54 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44da7963-e636-11eb-8970-12813bfff9fa;
 Fri, 16 Jul 2021 13:03:53 +0000 (UTC)
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
X-Inumbo-ID: 44da7963-e636-11eb-8970-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626440632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=paVfQErJEQq2cpAhiw6I0NXZW70DeTfzJcL8T9D58XM=;
  b=V2HEVAa7YqX47sE0GCLeD3Txp/COVXiPT0OpZW/J2tv66FAK54vMIox4
   BeU2FnP7B8XBd1Hip1j6pTEhK/5pclnUdf9zMNIwYXEfb4sTKvMs1y0rB
   I+YE5dH7ond69BWcc5Z7ICRZkS1LU74jllNN9nye67fqJGssoybXZY+Hc
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: K1DqCOEy5/NlMJ9XKUN/sy+j2xrU2L6umDSH7WUAFEN+u4DzPemx7iEjnh32FLYtalDn5uRZGQ
 Ly9LICzu0f1+KC9B1pqhvpoZ3mOKUyRDGir+0bFEOdDqvkjyuC2cd3o/Sjqa0wVbfeiMZFSUkh
 GvChFKg2oFaihzfKMdQq7syVPtC3o3BPh3XEDeVoiLc+gZFiHVhj0XPSX4OgHOHdizDejDPKja
 ++A1Pa9y/ve5K/8fFdS9mgAMtmgWre486IGZ4r+Q/ir3ObD8gNfQdw2L4VibsMpgWl7GiHAtvk
 5Bg=
X-SBRS: 5.1
X-MesageID: 48490403
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ROKLYaC4aPXyfVjlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.84,244,1620705600"; 
   d="scan'208";a="48490403"
Date: Fri, 16 Jul 2021 14:03:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH v2 01/13] libxl/x86: check return value of
 SHADOW_OP_SET_ALLOCATION domctl
Message-ID: <YPGDtXBM+uivyiT8@perard>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <4d1e5a4d-05cf-964a-bc4b-9eecf26e58bb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4d1e5a4d-05cf-964a-bc4b-9eecf26e58bb@suse.com>

On Mon, Jul 05, 2021 at 05:11:31PM +0200, Jan Beulich wrote:
> The hypervisor may not have enough memory to satisfy the request. While
> there, make the unit of the value clear by renaming the local variable.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> v2: Rename local variables. Also log requested value. Don't log errno
>     explicitly in LOGED() (nor function return value). Integrate into
>     series.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

