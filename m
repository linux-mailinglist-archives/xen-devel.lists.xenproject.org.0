Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAF928CC67
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 13:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6153.16234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSIMg-0007g1-PT; Tue, 13 Oct 2020 11:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6153.16234; Tue, 13 Oct 2020 11:21:10 +0000
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
	id 1kSIMg-0007fb-Lk; Tue, 13 Oct 2020 11:21:10 +0000
Received: by outflank-mailman (input) for mailman id 6153;
 Tue, 13 Oct 2020 11:21:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSIMe-0007fW-JF
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:21:08 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5044220c-bf42-429b-b4cf-8039616a1f60;
 Tue, 13 Oct 2020 11:21:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSIMe-0007fW-JF
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:21:08 +0000
X-Inumbo-ID: 5044220c-bf42-429b-b4cf-8039616a1f60
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5044220c-bf42-429b-b4cf-8039616a1f60;
	Tue, 13 Oct 2020 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602588065;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=22HRaNEeiCSKk6IM3vfGJUohKRLKp++5B2v9SNKLOqg=;
  b=gbxnOnnTR4puxJLk1UsATt1nmLaVArXimOBRM3xWAXxzsHpWGEt2NtDK
   5TPqIuOSJrey4zkrZCjC6HmA/P6g16od5nIaGtT/l6zq79wC2gu38y6M7
   4e9mjsmPs8E4nwMakTel4WociyJNXePS+J/6jjxyf7aSAOBuKwxhwXICe
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: L1CABsBfV+AFo9dOWgNZgRGF/uIlF/nykEUR2JpEkAz9+9qIZZwoGNE7alNK1EhEz6BhCdEaxl
 3ftNIETqzeGQ7alrKJOE4ZOREq/2yFIWdq3tUNVfGOyHvm2EnTYT0Pld/huGkpr76kEg4cBRmm
 ATKh//fOEv2JwZvsSyyLIHgNM4urjKDLF2R1L2Q30wktfxJDESZV/PYvTa991lJC1Qcs6iqY6p
 KgpD4Hwy3udz5Oj1P6/J2WDtmWG5fNHNk0Q5v/b9DaGq5KrkBq/Wndh1gIPrkM+hKs7ECozUKs
 IsE=
X-SBRS: 2.5
X-MesageID: 28943955
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,370,1596513600"; 
   d="scan'208";a="28943955"
Subject: Re: [PATCH v2 2/6] x86: reduce CET-SS related #ifdef-ary
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <d8561c46-a6df-3f64-78df-f84c649a99b4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <88bf4e8d-055f-dfc6-5090-c2628d383632@citrix.com>
Date: Tue, 13 Oct 2020 12:20:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d8561c46-a6df-3f64-78df-f84c649a99b4@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 28/09/2020 13:30, Jan Beulich wrote:
> Commit b586a81b7a90 ("x86/CET: Fix build following c/s 43b98e7190") had
> to introduce a number of #ifdef-s to make the build work with older tool
> chains. Introduce an assembler macro covering for tool chains not
> knowing of CET-SS, allowing some conditionals where just SETSSBSY is the
> problem to be dropped again.
>
> No change to generated code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Now that I've done this I'm no longer sure which direction is better to
> follow: On one hand this introduces dead code (even if just NOPs) into
> CET-SS-disabled builds. Otoh this is a step towards breaking the tool
> chain version dependency of the feature.

I've said before.  You cannot break the toolchain dependency without
hardcoding memory operands.  I'm not prepared to let that happen.

There is no problem requiring newer toolchains for newer features
(you're definitely not having CET-IBT, for example), and there is a
(unacceptably, IMO) large cost to this work.

~Andrew

