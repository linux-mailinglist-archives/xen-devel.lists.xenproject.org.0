Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A252DFB12
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 11:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57362.100353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krIRv-0000Jd-Ti; Mon, 21 Dec 2020 10:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57362.100353; Mon, 21 Dec 2020 10:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krIRv-0000JA-Qe; Mon, 21 Dec 2020 10:29:55 +0000
Received: by outflank-mailman (input) for mailman id 57362;
 Mon, 21 Dec 2020 10:29:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm/H=FZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krIRt-0000Im-Um
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 10:29:54 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb81cb85-8bb8-4991-8820-b689019f3b6e;
 Mon, 21 Dec 2020 10:29:52 +0000 (UTC)
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
X-Inumbo-ID: cb81cb85-8bb8-4991-8820-b689019f3b6e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608546592;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=X5nTjWghJrP336akGDxHsgts8oU+GCDoRaZNB+nMrcM=;
  b=YzkJSEm2QJC52AEvHNzveMhohpKui8kxKNHLRowROYHvoN2sRbPRWx5F
   vyjkaDlz+SCRPC5TMwRBNNKNrJeOeRuKDBvPVCnERQmQZeyI8sm/NFjO7
   tzA7vH9Kfgcv4d3a7sdNU8FM408jP2qccMUflGe5VJNETBjL/Gb2+6F6d
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: h/tm9huJx14nSvgZYpabcxKlgicIPIguIGJkRRh41NQVdNuBmXxEIusYyPWhiOxjdeJQnIMk0p
 UVP3wEvG9WtwKbk43xA5V4AuX9pRcccoSQFUHevmGAGvLmq8DJw/NEaToRwuNGibwKnERiMWpi
 B9SqeipPNjEXFQ2YD3TCK3X4CqtyfVozXAQTKSQ7LBhSOUak6nEm0xMvC1ZdB9tO33sjguYVHS
 LOPETS9MLlayonJt1Rl80hPf4EyvufllmImbj1X+GQhJUQy0V8fx0/+HKo8LDUpGE7Y1SYTWHY
 TPU=
X-SBRS: 5.2
X-MesageID: 33646630
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,436,1599537600"; 
   d="scan'208";a="33646630"
Subject: Re: [PATCH] xen/Kconfig: Correct the NR_CPUS description
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<hanetzer@startmail.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201218233842.5277-1-andrew.cooper3@citrix.com>
 <b5c1cd74-f418-1ad1-8cd0-7def522a4ca4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9d0c49e0-fe2c-604c-98bc-52ee0501a8fb@citrix.com>
Date: Mon, 21 Dec 2020 10:29:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b5c1cd74-f418-1ad1-8cd0-7def522a4ca4@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 21/12/2020 08:37, Jan Beulich wrote:
> On 19.12.2020 00:38, Andrew Cooper wrote:
>> The description "physical CPUs" is especially wrong, as it implies the number
>> of sockets, which tops out at 8 on all but the very biggest servers.
>>
>> NR_CPUS is the number of logical entities the scheduler can use.
>>
>> Reported-by: hanetzer@startmail.com
> This wasn't on xen-devel, was it?

No.  It was on IRC, hence the rather late patch.

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

