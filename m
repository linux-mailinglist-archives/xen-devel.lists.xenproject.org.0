Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E157127FF66
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 14:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1254.4231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNxwG-0004AI-At; Thu, 01 Oct 2020 12:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254.4231; Thu, 01 Oct 2020 12:44:00 +0000
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
	id 1kNxwG-00049r-74; Thu, 01 Oct 2020 12:44:00 +0000
Received: by outflank-mailman (input) for mailman id 1254;
 Thu, 01 Oct 2020 12:43:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQij=DI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNxwF-00049h-Df
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 12:43:59 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0453461c-8dd5-41bb-8705-ef9a7c515a29;
 Thu, 01 Oct 2020 12:43:57 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uQij=DI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNxwF-00049h-Df
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 12:43:59 +0000
X-Inumbo-ID: 0453461c-8dd5-41bb-8705-ef9a7c515a29
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0453461c-8dd5-41bb-8705-ef9a7c515a29;
	Thu, 01 Oct 2020 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601556237;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=d4T2tjy0itaxm2AaSPrOmsLNIShrIBiR0eAWxmxC0qI=;
  b=KYLfnaux8gPR6S9f/jDIMHFAf1bPCfat2uxsmwZKMj9V4YvS1G3kiZue
   wDaGkmvs6XttCD2YObyw01QhakOxo9SSyLcUR3U86QGmV3rSZki+00dHS
   dX/Mp4ZCV6OWFnJzabui3xNxe0t7AH+zTxUrKXAdIA3wbGSDbW+3MBo21
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WOn/9cbOVMCFAfKu4pPAN5eUuxTIy+sxxlKrXa63dfN4I4+El8Xopr9kqIsWw3VWVNPGfa5f/4
 KVsmg80Zt6i3+ECiXvIHraqirBMxs4fGDfTIK/rb3hZ1TUZGIKStIgvpmOv0S4upMuUhtc6wqn
 NeXYkgsEMyH2jisoeE/WKAYUoPxlZL9AzfCHKSzb3qgMXk9+PpRIrxpNzkuzEOgmn1cTyz2QFc
 lJtyBgMXfmhBfuI55I7keFkNecEDh1c+P8Tsh+VpQS4LOTNbw5YAZskL2vhlyc5OofrWdjoftU
 h7Q=
X-SBRS: None
X-MesageID: 29078407
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="29078407"
Subject: Re: Yet another S3 issue in Xen 4.14
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
References: <20201001011245.GL3962@mail-itl>
 <a80ad59b-feb1-01c8-2b14-dbf6568d0ff5@suse.com>
 <20201001123129.GJ1482@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1e596ccc-a875-93f1-2619-e4dbcbd88b4d@citrix.com>
Date: Thu, 1 Oct 2020 13:43:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001123129.GJ1482@mail-itl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 01/10/2020 13:31, Marek Marczykowski-G=C3=B3recki wrote:
> On Thu, Oct 01, 2020 at 01:59:32PM +0200, Jan Beulich wrote:
>> On 01.10.2020 03:12, Marek Marczykowski-G=C3=B3recki wrote:
>>> After patching the previous issue ("x86/S3: Fix Shadow Stack resume
>>> path") I still encounter issues resume from S3.
>>> Since I had it working on Xen 4.13 on this particular hardware (Think=
pad
>>> P52), I bisected it and got this:
>>>
>>> commit 4304ff420e51b973ec9eb9dafd64a917dd9c0fb1
>>> Author: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Date:   Wed Dec 11 20:59:19 2019 +0000
>>>
>>>     x86/S3: Drop {save,restore}_rest_processor_state() completely
>>>    =20
>>>     There is no need to save/restore FS/GS/XCR0 state.  It will be ha=
ndled
>>>     suitably on the context switch away from the idle.
>>>    =20
>>>     The CR4 restoration in restore_rest_processor_state() was actuall=
y fighting
>>>     later code in enter_state() which tried to keep CR4.MCE clear unt=
il everything
>>>     was set up.  Delete the intermediate restoration, and defer final=
 restoration
>>>     until after MCE is reconfigured.
>>>    =20
>>>     Restoring PAT can be done earlier, and ideally before paging is e=
nabled.  By
>>>     moving it into the trampoline during the setup for 64bit, the cal=
l can be
>>>     dropped from cpu_init().  The EFI path boot path doesn't disable =
paging, so
>>>     make the adjustment when switching onto Xen's pagetables.
>>>    =20
>>>     The only remaing piece of restoration is load_system_tables(), so=
 suspend.c
>>>     can be deleted in its entirety.
>>>    =20
>>>     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>     Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Parent of this commit suspends and resumes just fine. With this commi=
t
>>> applied, it (I think) it panics, at least I get reboot after 5s. Sadl=
y, I
>>> don't have serial console there.
>>>
>>> I tried also master and stable-4.14 with this commit reverted (and al=
so
>>> the other fix applied), but it doesn't work. In this case I get a han=
g on
>>> resume (power led still flashing, but fan woke up). There are probabl=
y
>>> some other dependencies.
>> Since bisection may also point you at some intermediate breakage, whic=
h
>> these last results of yours seem to support, could you check whether
>> 55f8c389d434 put immediately on top of the above commit makes a differ=
ence,
>> and if so resume bisecting from there?
> Nope, 4304ff420e51b973ec9eb9dafd64a917dd9c0fb1 with 55f8c389d434 on top=

> it still hangs on resume.

Ok.=C2=A0 I'll see about breaking the change apart so we can bisect which=

specific bit of code movement broke things.

~Andrew


