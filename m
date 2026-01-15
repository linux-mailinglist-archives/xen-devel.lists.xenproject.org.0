Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB473D2334C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 09:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204277.1518981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgIuD-0002jd-HH; Thu, 15 Jan 2026 08:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204277.1518981; Thu, 15 Jan 2026 08:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgIuD-0002hK-ES; Thu, 15 Jan 2026 08:40:37 +0000
Received: by outflank-mailman (input) for mailman id 1204277;
 Thu, 15 Jan 2026 08:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VQ+V=7U=proton.me=milky_way_303030@srs-se1.protection.inumbo.net>)
 id 1vgIuB-0002hD-4j
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 08:40:36 +0000
Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch
 [109.224.244.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da7cac8d-f1ed-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 09:40:32 +0100 (CET)
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
X-Inumbo-ID: da7cac8d-f1ed-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=i3ue7g36xvelpdcfqqedl5amie.protonmail; t=1768466431; x=1768725631;
	bh=P0ydKPtJaYsx+LZsWuE/jP+cCQ+slQ4dQXQwtrZWcLU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=S7v8JtIbHpCRYkaIC9h5NfHQDs+Ee8RcjWiCzzRyHlUCyWx5Dh0c5fL0ZcCTp6qmt
	 eWFJoAv9+4PVmTHiusxCTShakmh+8n5N54xKdZsN47U/6fzSGM0ohYU78VCRYw/lnZ
	 VnBAuTN+NykKh61v04Bxu7GuvThIMwAtrkMnVOtVNNFyg1wqIFAjFCZr8SS6MDdHDC
	 rUseYbxwZGEO/0QIBaR8i6aVdB4dp9QzrvsC9B7nr6mPEPLdvrQ10P7Ymy+Om9pbi2
	 fTejWaKghTG02fm24UUPXDzegfjLB+4mtKHnKjmQnugmoyXcfKkQOCcRqN7mwVBHD5
	 DP8VTZiOu326A==
Date: Thu, 15 Jan 2026 08:40:27 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: Cpufreq drivers not working on T480S
Message-ID: <BJw95xUj4xE_QnaIZqUhBPTYt2jsi6f31o_CLj8Tu4OhIyiNQid8lafTuvCgFGnCB7yZeuIP0HixAjJ4-GxO_7ndGaBQBWmW60BYhwMMaFs=@proton.me>
In-Reply-To: <98b1ba19-40d3-4f36-9723-2773580df3e3@suse.com>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me> <7dbd26d1-0d9a-454f-90d8-5a7f3d8e12da@suse.com> <qo8wx-b_cpRuzol0X0mW_NHY1mu3tOBCzMvy5Y_8IASOkmy1oxPdJWdbrndDL63d5lMbw1FDMkI9gCSH9BS2UFWiuyjhycfqWpJWueeHq2E=@proton.me> <8a2125c7-c5ec-4be1-a7a5-61b2936cc90f@suse.com> <rhr8suTtSGv9hTwateK8Tx8Cm9xetzvaOsOIzexIaY-VaPyxsgzA3K0pYTeyyrKFtkc5gHJ3SrJ0I5VKjGsxBKdQm-QKPRVF_bugbAHM9uI=@proton.me> <FEKky8EG7uaCBf24_kJ7c8fNFwXgajV7RH98tbwxsty3gGkFcMJuI4plVzNAVqiLYKWFGwCUo6HsOFKD_abqWU9wZtxgTNXPJz8w7vv-PYI=@proton.me> <c713530f-5f54-44e0-9f45-8df8329c7aef@suse.com> <f7_mi42KcNcLkQfNwAwz-wjxWoXv_gbqEKrmEeFp43XDrFgoWBrSAP2doOzxvIUUM21AAXV3duZB_gZT03x5S8iT6WmU6A24H32vOu40iIc=@proton.me> <98b1ba19-40d3-4f36-9723-2773580df3e3@suse.com>
Feedback-ID: 171106842:user:proton
X-Pm-Message-ID: 4bdbe48abd5975c7a2fe586f2384d992a2312307
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Thursday, January 15th, 2026 at 10:51 AM, Jan Beulich <jbeulich@suse.com=
> wrote:

>=20
>=20
> On 15.01.2026 00:42, Milky wrote:
>=20
> > On Wednesday, January 14th, 2026 at 11:12 AM, Jan Beulich jbeulich@suse=
.com wrote:
> >=20
> > > On 14.01.2026 11:58, Milky wrote:
> > >=20
> > > > Just wanted to update this thread to say that now another T480 user=
 (the T480 is a very similar model to my T480S) using the release builds of=
 libreboot (as of 26.01 RC1) also has the entries missing from the ACPI tab=
les. That discussion was here https://codeberg.org/libreboot/lbmk/issues/39=
4. So this confirms that I'm running a standard libreboot, rather than a ba=
d build.
> > > >=20
> > > > Do you think there is any way to avoid the underclocking issue with=
 Xen on such devices/firmware?
> > >=20
> > > In principle there is, but in the absence of ACPI data that means hol=
ding model-
> > > specific data in Xen. Which iirc is what the intel-pstate driver in L=
inux does
> > > (using ACPI info nowadays only as "auxiliary" data). But I may be wro=
ng there,
> > > as it has been a long time since I last looked at that driver.
> >=20
> > In that case, would you say this is settled now? Would it make sense to=
 report back to the QubesOS community that librebooted T480/S will run unde=
rclocked, due to the missing data in ACPI tables and lack of native support=
 in Xen? This information is important, as the device is only barely usable=
.
>=20
>=20
> What to suggest to the Qubes community needs to be discussed there, I thi=
nk.
>=20
> Jan

I was just hoping to confirm with you that my understanding is correct, in =
order not to pass the wrong information. In fact I intend to report this to=
 the libreboot/coreboot community too, in case there is a way to include th=
e missing data in ACPI tables. But first I wanted to make sure that from th=
e Xen perspective, we got to the bottom of it.=20

Thanks for your time.

