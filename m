Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CBE739330
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 01:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553214.863641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC7Tl-0002Bp-TB; Wed, 21 Jun 2023 23:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553214.863641; Wed, 21 Jun 2023 23:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC7Tl-0002AA-QK; Wed, 21 Jun 2023 23:43:13 +0000
Received: by outflank-mailman (input) for mailman id 553214;
 Wed, 21 Jun 2023 23:43:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q5qy=CJ=kernel.org=luto@srs-se1.protection.inumbo.net>)
 id 1qC7Tk-0002A4-VE
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 23:43:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60c4edb8-108d-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 01:43:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C706661709;
 Wed, 21 Jun 2023 23:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE63C433C0;
 Wed, 21 Jun 2023 23:43:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailauth.nyi.internal (Postfix) with ESMTP id B90EA27C0054;
 Wed, 21 Jun 2023 19:43:06 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
 by compute3.internal (MEProxy); Wed, 21 Jun 2023 19:43:06 -0400
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B529031A0063; Wed, 21 Jun 2023 19:43:05 -0400 (EDT)
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
X-Inumbo-ID: 60c4edb8-108d-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687390988;
	bh=RoMKsAIPNmQwi8XbSHui64FM9FxWSSvleopyh2AgkRM=;
	h=In-Reply-To:References:Date:From:To:Subject:From;
	b=RKi6Ips4YOcbYcSL+N6hHAUWYJR6dKGoSb6XrgLAZZHGkQjJfQf1VPwVQfWN2Zg9p
	 sWkKS9KCXft23kpaZG7HVrPM+0h3zRkveO6j1IzFPaKT85rVRTI7pubtWOYDlL5nAA
	 2m+ylJBz1/dsFJEX3z+ZutLurK9Ai+osB9x1HXGq8RKBoHdIKj7yZJVWA+GxKlwpiB
	 7GUwY1cdaJHgnP7scmNfiQzG5gAcV0pWiYAISwTH2XUn119UYQyrzIf8iGNskrlDop
	 HojHFlz6lTvhrChkXd974yn9s1DvlZaln/siwyBn0UgeweX/ZoVo7xzIGzTSQy4+GL
	 s1RFJL5M0051A==
X-ME-Sender: <xms:CYuTZFAa6hQW_d42ApNMnsOzzM229EWsvjyeO6Yhq9Dsm6tKPId0AQ>
    <xme:CYuTZDgwByWAovgL8gv2kxdOB1mFofssm-NxewxM3JiORDuF2Y50AWHhm3vC75JzJ
    p50rGRcljbKGi_eux8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegtddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
    ugihucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecugg
    ftrfgrthhtvghrnhepvdelheejjeevhfdutdeggefftdejtdffgeevteehvdfgjeeiveei
    ueefveeuvdetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudeiudek
    heeifedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuh
    igrdhluhhtohdruhhs
X-ME-Proxy: <xmx:CYuTZAkwYjTbT-0I6lmCvRq-yKXaUGs9x3_-SeWI2wOv0N2ZnfiEsQ>
    <xmx:CYuTZPz1JeAs_Wg7NKoa1mLqaJNSv3vANaW33SnEVZVSOe_OYqjgAA>
    <xmx:CYuTZKTovROWPa5HA8sZdk3gI_rWibusyDJTjM6YmhAF9lgRUAGRjA>
    <xmx:CouTZL-N1Ehe5PoxPWGKkMpxrzfjKCQY0Qjqe1HGaQdVTOP0iaoiLg>
Feedback-ID: ieff94742:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <0ff85b95-f4c7-445c-b0e0-7368c182ee0b@app.fastmail.com>
In-Reply-To: <333138f8-9fbe-be5b-d125-12c9d3ed3eda@citrix.com>
References: <20230621151442.2152425-1-per.bilse@citrix.com>
 <7fbad052-4c4a-4a49-913d-ea836c180dc2@app.fastmail.com>
 <333138f8-9fbe-be5b-d125-12c9d3ed3eda@citrix.com>
Date: Wed, 21 Jun 2023 16:42:44 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Per Bilse" <Per.Bilse@citrix.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "the arch/x86 maintainers" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Juergen Gross" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Updates to Xen hypercall preemption
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Wed, Jun 21, 2023, at 12:05 PM, Per Bilse wrote:
> On 6/21/2023 5:27 PM, Andy Lutomirski wrote:
>> This code is a horrible mess, with and without your patches.  I think=
 that, if this were new, there's no way it would make it in to the kerne=
l.
>
> Hi Andy, and many thanks for your frank assessments.  Generally, this
> is indeed somewhat old code, first introduced in 2015 by way of commit
> fdfd811ddde3.  There's more information in the notes to that, and it's
> maybe worth noting that we're not trying to introduce anything new,
> merely fix what various commits since then have broken.
>
>> I propose one of two rather radical changes:
>>=20
>> 1. (preferred) Just delete all of it and make support for dom0 requir=
e either full or dynamic preempt, and make a dynamic preempt kernel boot=
ing as dom0 run as full preempt.
>
> Personally I think that's a good idea; a machine so limited in resourc=
es
> that a fully preemptible dom0 kernel would be a problem wouldn't work =
as
> a Xen server anyway.  Having said that, what to do about this isn't
> really in my hands; the issues came to light because the kernel for
> Citrix's XenServer product is being upgraded, and it was considered in
> everybody's interest to upstream the fixes.  I'll see what I can do.

This isn=E2=80=99t actually a resource thing. It=E2=80=99s a distro thin=
g.

Historically, full preempt was a config option only, and distros, for wh=
atever reason, often shipped kernels with full preempt disabled.  (There=
 we probably decent reasons. There may still be decent reasons.). And Xe=
n needed to work on these kernels.  Hence the mess.

But Linux recently gained the ability to build a kernel that, by default=
, is not full preempt but can be switched *at boot or runtime* to full p=
reempt. And distros should ship *that* (or a kernel that does have full =
preempt by default).

So let=E2=80=99s just make Xen PV dom0 depend on this. It wasn=E2=80=99t=
 an option a couple years ago. Now it is.

>
> Best,
>
>    -- Per

