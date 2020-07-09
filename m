Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1477219E1B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jul 2020 12:43:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtU14-0007b8-DF; Thu, 09 Jul 2020 10:42:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAgz=AU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jtU12-0007b3-Pq
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2020 10:42:56 +0000
X-Inumbo-ID: f214dc84-c1d0-11ea-8eb3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f214dc84-c1d0-11ea-8eb3-12813bfff9fa;
 Thu, 09 Jul 2020 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594291375;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZNcSrL/sffho2hPU646wScTh9BRapwNszVWJHurTmpw=;
 b=Bb5C+1+4Y4wDcal0F93V1veNbYQC8WiRCvLoaG0CVbwgeKDb/OM+FRjG
 S1/a7ZT02bKBjOBEJQCHOF8oKerlRK0nhU7qOK5PrarG/y/AUNCoQSFsX
 SQOcOP9VbJZ6aqa9Kh96QUrd+uM2tKZ9SgA2e+GGn1wFE6ulBT/8XInZt Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: f1FV1F/pVtT9bOmvlu2myC0wQ18xub/hvV780AcLgepTfIG+8vWFnwLqLDfp+Gsgck8m0Crw8u
 kydZ5oiESOmrAwO8v4gpiYtuW8HR2Xp+cPcCFe/EHtfZYci4WXYblmDNJ5oQwamIfx/koPTcuK
 weF0Iqdg2KoKj5fdOiJA2lrxIcUKPJ00To9Nvb616NiCzMyYqKAmNY9uq0Ba3A7I7Ue71AhReV
 lPzrHx1VxHcWlppBuiM8vrpAaWki9S+/4EaoW+QCtGprkE8F+7gaechox940/m7M7NXMxFP/jf
 Ruc=
X-SBRS: 2.7
X-MesageID: 22274415
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,331,1589256000"; d="scan'208";a="22274415"
Date: Thu, 9 Jul 2020 12:42:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: PCI passthrough on arm Design Session MoM
Message-ID: <20200709104245.GG7191@Air-de-Roger>
References: <4E0A40D3-2979-4A91-9376-C2B19B9F582E@arm.com>
 <20200708133205.GE7191@Air-de-Roger>
 <227BD2A5-1FC7-4B1A-8B93-4DBECC43BDA2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <227BD2A5-1FC7-4B1A-8B93-4DBECC43BDA2@arm.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 09, 2020 at 10:29:52AM +0000, Bertrand Marquis wrote:
> 
> 
> > On 8 Jul 2020, at 14:32, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Wed, Jul 08, 2020 at 12:55:36PM +0000, Bertrand Marquis wrote:
> >> Hi,
> >> 
> >> Here are the notes we took during the design session around PCI devices passthrough on Arm.
> >> Feel free to comment or add anything :-)
> >> 
> >> Bertrand
> >> 
> >> PCI devices passthrough on Arm Design Session
> >> ======================================
> >> 
> >> Date: 7/7/2020
> >> 
> >> - X86 VPCI support  is for the PVH guest .
> > 
> > Current vPCI is only for PVH dom0. We need to decide what to do for
> > PVH domUs, whether we want to use vPCI or xenpt from Paul:
> > 
> > http://xenbits.xen.org/gitweb/?p=people/pauldu/xenpt.git;a=summary
> > 
> > Or something else. I think this decision also needs to take into
> > account Arm.
> 
> We are currently using vpci for guests.
> But we could also look into xenpt but from a quick check it does require a Dom0 which would defeat the Dom0less use case.

Right, you need a hardware domain in order to use xenpt. Note that
AFAICT you would also need a hardware domain in order to do the
placement of BARs for example if the firmware is not doing it for you.

Likely better to discuss all this against a design document instead of
raising specific issues here I guess :).

Roger.

