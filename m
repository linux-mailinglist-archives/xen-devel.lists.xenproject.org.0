Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B8E2B1D7F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26540.54977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kda64-0001q0-L0; Fri, 13 Nov 2020 14:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26540.54977; Fri, 13 Nov 2020 14:30:40 +0000
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
	id 1kda64-0001pb-Hk; Fri, 13 Nov 2020 14:30:40 +0000
Received: by outflank-mailman (input) for mailman id 26540;
 Fri, 13 Nov 2020 14:30:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uoW6=ET=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kda63-0001pW-BB
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:30:39 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab0613d7-a5ef-4e46-befe-8b7e9a70e382;
 Fri, 13 Nov 2020 14:30:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uoW6=ET=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kda63-0001pW-BB
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:30:39 +0000
X-Inumbo-ID: ab0613d7-a5ef-4e46-befe-8b7e9a70e382
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ab0613d7-a5ef-4e46-befe-8b7e9a70e382;
	Fri, 13 Nov 2020 14:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605277838;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ni6uFxlookvwWxTeqxXDYqjhj5r2NpQO4zQ6Y7g1xrc=;
  b=Kj8ilPr5CkjA0lT7jUM/dTGARks/z4njiV+Hxo5E/HJSYjF3Hf0ARn/Q
   UBznh0BDN8AXCuDhxLyv6rHqHeX7VCrwCXxY4+1Y64vDeJxku4iUhnrK9
   U/kKS1yOfzRYCVhngSyPpDVayjfKZEP2Rth90f6QRSlV3Xg1Sb8mCxyJS
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Yk5nvlNlIf1/NvTnizdS9gf4vQXQxr/pgDrwWahazrT6Pid/u6kQ2a5E2MQv8T2iMqU/DBrFxE
 4+ZSovmEEpoPJx5/66XoUrrTkHoY0Ieqqox8g+8HM6x3qqXTGELLnD7YZuGH1RXRrxsekwVIF3
 2cxiE9qMDQVs337t2gCPwaaMTEAg0JUSSICnRqHFO8ghoKa1LPPKVjSNuumwon3WmG1JkrODy9
 vvENEOOIbQU713DL41cM9saoXXIeqhJ4EWG4r7htvCqCcH+ZZG7wcwryc+ik1vonCc0JH1GeFJ
 Ptw=
X-SBRS: None
X-MesageID: 31098301
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,475,1596513600"; 
   d="scan'208";a="31098301"
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
To: Bjoern Doebel <doebel@amazon.de>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.co.uk>, Eslam Elnikety <elnikety@amazon.de>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20201113141823.58712-1-doebel@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <de06e7ce-65cd-95fb-5862-0135e2110a99@citrix.com>
Date: Fri, 13 Nov 2020 14:30:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113141823.58712-1-doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 13/11/2020 14:18, Bjoern Doebel wrote:
> Right now we do not have a mechanism to determine the version of the
> currently running xenstored at runtime. As xenstored runs throughout the
> lifetime of a Xen host, this may lead to problems when newer user space
> builds are staged. Then, the running xenstored will no longer match the
> version of the installed xenstored.
>
> To allow users to always identify the running version of xenstored, add
> a linker-generated unique build ID to every xenstored build. Add
> functionality to log this build ID into a file upon service startup.
>
> Signed-off-by: Bjoern Doebel <doebel@amazon.de>
> Reviewed-by: Martin Mazein <amazein@amazon.de>
> Reviewed-by: Paul Durrant <pdurrant@amazon.co.uk>

I understand the problem you're trying to solve, but why is this
anything more than just enabling build-id's by default across tools/ ?

There are already standard ways of interacting with the build id of
running executables on the system.  I'd strongly discourage doing
anything custom in xenstored specifically.

~Andrew

