Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A1829E38
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 17:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665666.1035897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNbAP-0007dw-6p; Wed, 10 Jan 2024 16:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665666.1035897; Wed, 10 Jan 2024 16:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNbAP-0007aX-3x; Wed, 10 Jan 2024 16:10:57 +0000
Received: by outflank-mailman (input) for mailman id 665666;
 Wed, 10 Jan 2024 16:10:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDiq=IU=proton.me=flamv3421@srs-se1.protection.inumbo.net>)
 id 1rNbAN-0007aN-8H
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 16:10:56 +0000
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3c2dddb-afd2-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 17:10:52 +0100 (CET)
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
X-Inumbo-ID: d3c2dddb-afd2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1704903051; x=1705162251;
	bh=STuSjKIcHdwXsLS/ydpP1x5weV2J0nTYy9x599GKTdo=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CMly94lulCNMW9fIK+NuM2eaJZ6qFu5G2zVW4mYrlO/HBH2yLMo0VQgNZT1M2xUco
	 Ez9dl1cQYcXbRDt5DasvIMRion/cKe0btY91q4bfHTbhEF+4w/CN1ntfnEnDnBFW0/
	 2/0tPbnny4zTuecVWprCaRHJl7uCoACP/yoLVM0TedlH7dqbxX734dHLVhl5bjwNlV
	 l48a36XInjsOWBEiqR3GaMrAyO2fUuq68AbjfwGN3d+DxkccpddqygmXciXtFoU5T9
	 MIq6BapPK6vjxYru45dj3+TYc/AAcJVE8XwguN7pO299t2IWTKApRaTjvjsmZq+FHi
	 0pV2bvkCfD3PQ==
Date: Wed, 10 Jan 2024 16:10:27 +0000
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: flamv3421 <flamv3421@proton.me>
Subject: Re: xenpm cpufrequency settings don't work
Message-ID: <NxxKTM-RboL02YYdZ7LMKCpfphKPxYIdi0vKU1VsfmI0JZnHoJxCWxpMbMV1auJzoJjz7lxh8T6Ec4JzF16mBw9FKCy52_r1xgXi7U3URD0=@proton.me>
In-Reply-To: <f5a8bcf4-6d07-4e9a-9da9-917aa4f0c769@suse.com>
References: <syS1MXE7yvGnsDP-cXFUjca-0S1PkY-H2thU-X7ECmFD2VnugsyWnS-7y386-LTwhazuSggAuZI4d7F0Myq1tjLuw18CeOXErRKHJFCowpQ=@proton.me> <f5a8bcf4-6d07-4e9a-9da9-917aa4f0c769@suse.com>
Feedback-ID: 90923600:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I meant the xenpm get-cpufreq-average result did not match with what I had =
set as the maximum scaling frequency with xenpm and there are even times wh=
ere the average is at 3GHz while my maximum scaling frequency is set to 800=
000. Even if it was accurate, I believe there is something wrong with power=
 management in xen since my laptop heats up very fast when using xen, and i=
t does not have this issue when I use it without xen.


On Thursday, January 4th, 2024 at 11:39 AM, Jan Beulich wrote:


> On 28.12.2023 12:28, flamv3421 wrote:
>=20
> > I used xenpm to disable turbo mode and set the maximum frequency to 800=
000 and governor to powersave, but my laptop fans are still running at full=
 speed when I am using xen and the average frequency shown does not match t=
he maximum frequency I set with xenpm which is 800000.
>=20
>=20
> What do you derive from that the maximum freq isn't 800MHz after you set
> it? All the CPUs are in P15 as per the output you supplied, which is a go=
od
> indication that no lower P-state is in use anymore (as even the CPU where
> the command was carried out was still in P15). Lower P-states would of
> course have been in use prior to you running xenpm. Sadly while there is =
a
> way to reset the statistics, the hypercall subfunction isn't wired up bey=
ond
> the libxc wrapper function.
>=20
> > Why are my fans running at full speed and why doesn't xenpm maximum fre=
quency setting work?
>=20
>=20
> I'm afraid I can't answer this question, as I don't know how exactly fan
> speed is controlled on that system of yours.
>=20
> Jan

