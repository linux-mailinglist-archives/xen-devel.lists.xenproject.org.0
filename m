Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E144B14E8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 19:05:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269952.464106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIDoA-0001WJ-Ls; Thu, 10 Feb 2022 18:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269952.464106; Thu, 10 Feb 2022 18:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIDoA-0001UE-HS; Thu, 10 Feb 2022 18:04:42 +0000
Received: by outflank-mailman (input) for mailman id 269952;
 Thu, 10 Feb 2022 18:04:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWaC=SZ=yahoo.com=akm2tosher@srs-se1.protection.inumbo.net>)
 id 1nIDo9-0001U8-2I
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 18:04:41 +0000
Received: from sonic308-36.consmr.mail.ne1.yahoo.com
 (sonic308-36.consmr.mail.ne1.yahoo.com [66.163.187.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e90ec4ea-8a9b-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 19:04:39 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Thu, 10 Feb 2022 18:04:36 +0000
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
X-Inumbo-ID: e90ec4ea-8a9b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1644516276; bh=iXa1Cd+VaT41h3q4J0/wJjNJWQrzjtgamcihiKFWOEY=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=Wo8XP2YZ4kpxlQf75qACX/IRdxEsXk2mqwml9cAg9pPRE+DvVRu3nI5MSxlXyml12JkP5zqNwp1MJZHGMA21XyBHaZ0SmdhSg5c4whXAScrMd+IodcGmvFRt9hGvHr7qb5zhOb9DRPgx7MUVkSTm+nUkdiYQnpkRQic5MNq+78/7ZlT/nLRw6Pi34BpFExlNfr2x5a7Czhv6dx44Rj/ZO9ytRuHgD7woi+OGONhLKv9TloDlQKTaSTUvv6PycNEg28cwQhm9pTMAOMUlsDWt1LYod7qRnM+BkUSKMzdIdTkGXR5Ofkco0shSXuWkaWkVeR3khFNIBIw/h1CA7xPpDw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1644516276; bh=lXu/O/9TKTtevBpBNF168Z5erX2WgYok7etbnWuiKd3=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=YOc+TTKvM6c6PpuoBCy/X6y1cSNgJe/kdP+ezgw3l8IE674OzYy93OSodPX0DhX+jv4onqY4aFHqQVtXuQ5l9J8CDTQMJ1oIbsKtGPIYc0myG1JC9OFY6dQylrMtbp+lmwpalkBhUJMr5xKpZgb3OQ19K0+lYlRAioq/llARDaWrWqmu2yceOSu38POM9UnSx1F8JT5SpzX1EOUFhbeU0xI11Lh6mFseSt0Ed+ke1wWfbtTELlNpoO+AlHd6R2JVohAHjt4U4PvM7zbzdgQ8xb0Qkr3r1TepSrCMNrve/c4SLa2hCYGTKbIunuhbFubaKErpOHOmIyciVba9Gv9BNw==
X-YMail-OSG: Syfh58UVM1nods1vOzQMVlgF99MQczZm7A1eCEJgfduY8PmoNYcGDGvomwNDtO1
 o192pnMizfDrwONRrx_xe9VnK.baCbfFQKG189JfYRtt_oVePF_pqTCRuhjZjfrGFal55SycMrXB
 CDWj5an.Ih6xiAa0kjl4XRhI.YG342_df74d1r4NHwfLCbhreXk9kDB8530c88BB4Cq9Mf6iVkA1
 HDGokzkmcUS8HQRAAv2Bh9r0iFVEYetjbocYYLsbRYnsd7Ka85xOUC8VT3UJzUEO7C815ilIoBwu
 35ll487bgazw.5x1mOiHDw444T_kOf2cc7SAOUNpRe7TaFNa1wQQedqWEgQfiNJD4UChjnci.uPb
 TGfvgzntKMoVpYouVs_L8tm3E2zo_n.ZrvoD1OMnQM0dlsfCAZeuzYWyG8QHcBp0sXq5SnabwWIz
 ..CgngLkxaVGtKLFnYQ.IaQazCKFgkPziiUX9AEGkDj0yNEdWnR46L8EJa5gazp9tMuP2ng8uQkE
 x_02pewDx4iL552DutJj3fs5ZBWjQKAD.ksevIOtjfqd.uSYUWvL50Flk5hjDyOEQ2hBmwVOWBD3
 _oG8cbWm.PAsf25hHyelGMAT9FmXC30UFVNY1LtMTl3RT.8OEBEhInb9SxkSdbfn4ILBynk80q9g
 EEB7vwZAryihfUKvmHt0zJmmGk_naKDYXA7YjarywpJ4mGNwVU.lb7Y510g7CEYeZPiC3eXdt8e6
 HgZiXJQ1VkYc.UuDVicfT3X4qINFYylCaTNUHfvalJ5RIiBNgnZCVFZrjQMLMAWDRAQAPsyZhDm7
 7Ygq3_U7weerLP5sCP1RbiwqCJhDHkIDZK.GsQvHfVHg8KYYrOyFAIby97UqXrzfBmEZ6Kqw_Mco
 IQowxa_iPh2cp7SiSiz1l1g49Dpo4U1oyVh.H1PtuG2DeDXDBRKdfBLclHQHWb5u4lk9f.Lm2NPn
 njscmk6_9Zq_rQiDDgUJDAns.28fFAXrag4iA5crohRu44mMN5_0bsSydKB9h4IbfxbHwUJ0OLGE
 LMxt2sdC9jZInfvHFYp5lNVkWvJUzDQzj2Ss2lC2iyQoW4JFR0ICKi23KhA9tQYMLD9jwRz6DX0u
 plFgI.M2lnl7Jy.RUo1d07iKGDIRcC7oBInfDNF6A2jfrhlJy33r8SpQMPAdYofzZ_z9gQBlosPW
 t4M6hV4vK.6N3_0VZA5oxDExURc6jY0WxPx85UvSEx9Ia9UUu1l9jMlazAIuU4k6IqPWN6_ZgE5J
 YiaST1Ox87xX0LgDHitaOVKbkC34P3PonulWPS91RRQ59WSBfrEbFAB54K5hbz04QCFdegA843ea
 8dddYeOskb8mvhcdxr_enKs9rU_aas6ZQwRP18FBsUcAsx4FvnpeFm..VEuQbgokz9lDlVkN3r7J
 Gk_VxQ9dpF7YVKI2mlWtu8n3AW1GYyN3u2nN54TCdCsEBA_lS9Ta02D7je8KN9ZLwPteNjLn9ysU
 nbgGs1o5iWXhzDeADJNmcLlnUuKsXgCc3pnVKS7euNxIjtC8Fex6zhmtgI0V69kIkQpm7b6y9m9W
 7OZndKfCWBLJqRjxyHFcErsC2fPrm87StbFVsyzil6OIEBjGBp8IgtCr6.EKoARj16eWOFf3hKbb
 l0SNJazE4ppnajIPfk.9dG80Es9O20ZaiAxWv313xGRVRhe_1i43Y5P5DAEjsiX53eF12atlY.VU
 a_LykEUT7f4_eazK4B.ETn_t0TUa4MAX1rkteG.jywVECbi7ZNR8KdSd1SF2imfkuYDpBoZwV_qf
 2oSn4KPhSlVv3iX_7ULzL1buwENmSHiZ_UpYjfm6nTNt9qb4A3OIjhV1l.GJ6lZUsirYbYOhnilB
 COTf.vnRoPsktUSCIbjRfuehVVXbnRNgWwv2C4drrj1LW88dUyyCGlFO6e1sSUTd2LYcJs3iEk.2
 h3v1GT9gg6ELoJMD_58WcT6E9wraYKrOYD77HCOJbpRSVTYYJLmaRBJ4GZZ6PHLhbx1Z9oJyyjyl
 yRnCTIvKIGf3Ph8Z59L4_hDqgWCBQhn2REH5QRLUmjEYCfXvyvFXFywVkIOPIr1jltmzNqkd30ep
 j5y5apW8m27M9DOT4d7PjaWnqs8TXZ7aiouvBm2JQ_ZYymA7AN7VhxF1FGBUzJx2efxnaU4nRR0E
 _uZmQEnh5ey2xHNefl3.njov6.KaX9Z8ar1aFlug7XgjRRtAJ3WoUgYY2i2ur4vD9DInNYFEXuC6
 It6HRhVB_eUZ.lmDWoJpNxPZNfLQbdo0oJFMTfTyBPA--
X-Sonic-MF: <akm2tosher@yahoo.com>
Date: Thu, 10 Feb 2022 18:02:31 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Jan Beulich <jbeulich@suse.com>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>, 
	"xadimgnik@gmail.com" <xadimgnik@gmail.com>, 
	"oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <1240968518.881344.1644516151890@mail.yahoo.com>
In-Reply-To: <2CDAD7A1-A628-4491-9DE0-1F4D5D9FF1A7@arm.com>
References: <709142925.628001.1644127197288.ref@mail.yahoo.com> <709142925.628001.1644127197288@mail.yahoo.com> <0e64c52c-1e9c-e89b-abb8-50171d885926@suse.com> <303292590.682317.1644477758255@mail.yahoo.com> <2CDAD7A1-A628-4491-9DE0-1F4D5D9FF1A7@arm.com>
Subject: Re: PCI passthrough support for PVH mode
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.19724 YMailNorrin

Hi Bertrand and Jan,

I thought PCI passthrough was a WIP only for PVH mode on Arm and x86. Howev=
er, it seems there are some differences. Thanks for the clarifications.

Regards,
Mehrab






On Thursday, February 10, 2022, 03:32:19 AM EST, Bertrand Marquis <bertrand=
.marquis@arm.com> wrote:=20





Hi Mihrab,

> On 10 Feb 2022, at 07:22, tosher 1 <akm2tosher@yahoo.com> wrote:
>=20
> Hi Jan,
>=20
> Thanks for letting me know this status.
>=20
> I am wondering if PCI passthrough is at least available in Arm for other =
virtualization modes like PV, HVM, or PVHVM. For example, is it possible fo=
r someone to attach a PCI device to a guest domain on an Arm machine and us=
e that domain as a driver domain, like we can do with the Xen on x86?

On arm there is only one virtualization mode which is equivalent to x86 HVM=
.

Regarding PCI passthrough on arm, this is currently a work in progress that=
 is being upstream so it is not available for now.
Once it will be merged in Xen, it will be possible to assign a PCI device t=
o a guest so you could then make a =E2=80=9Cdriver domain=E2=80=9D using th=
e functionality.

Regards
Bertrand


>=20
> Please let me know.
>=20
> Regards,
> Mehrab
>=20
>=20
>=20
>=20
> On Monday, February 7, 2022, 02:57:45 AM EST, Jan Beulich <jbeulich@suse.=
com> wrote:=20
>=20
>=20
>=20
>=20
>=20
> On 06.02.2022 06:59, tosher 1 wrote:
>=20
>> Back in the year 2020, I was inquiring into the status of PCI passthroug=
h support for PVH guests. At that time, Arm people were working on using vP=
CI for guest VMs. The expectation was to port that implementation to x86 on=
ce ready.
>>=20
>> I was wondering if there is any update on this. Does Xen support PCI pas=
sthrough for PVH mode yet? Please let me know.
>=20
>=20
> The Arm work is still WIP, and in how far it's going to be straightforwar=
d to
> re-use that code for x86 is still unclear (afaict at least).
>=20
> Jan
>=20
>=20
>=20


