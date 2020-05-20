Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA061DB743
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 16:42:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbPuH-0001cd-6H; Wed, 20 May 2020 14:41:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4N77=7C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbPuF-0001cV-Td
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 14:41:15 +0000
X-Inumbo-ID: f4beb0fe-9aa7-11ea-ae69-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4beb0fe-9aa7-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 14:41:14 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sYwtYo5bEK5hVQ+5/4808OUOJfIg1YQVoHSEf6OeDo+JxvD/4LYxIbui7qrkwLcAwAaoewDUiV
 3qhpXsXU8BiMHq7Jcrh16jA1sa9vtSVQhyld8e3U4gC+mG96TwX8vMFWn9inb3dvevcA7Ai8lI
 puF4f2iaW2dog1B+H2ZyxYp6onjUJXVMrhRqRD/jjUEBtcU7R9wzoas1ZeVyltRHHA3GBXfYt7
 ktlrTMkjV4i1tLj7tq9gmTef8Nke1g0vlHlpAcq7SMTVac1rbIIxbqCWd0p8vhR33uLwi/zYSJ
 b3w=
X-SBRS: 2.7
X-MesageID: 18254154
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18254154"
Subject: Re: [PATCH] x86emul: correct {evex} assembler capability check
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <2c0c9040-5ae4-ec08-9ddc-b88b99645950@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a1215ec5-132f-e71a-39d7-c17a0d65969c@citrix.com>
Date: Wed, 20 May 2020 15:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2c0c9040-5ae4-ec08-9ddc-b88b99645950@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/05/2020 15:20, Jan Beulich wrote:
> The {evex} pseudo prefix gets rejected by gas for insns not allowing
> EVEX encoding. Except there's a gas bug due to which its check gets
> bypassed for insns without operands. Let's not rely on that bug to
> remain there.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

