Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA6C4ED204
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 05:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296636.504984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZltM-0001xB-MB; Thu, 31 Mar 2022 03:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296636.504984; Thu, 31 Mar 2022 03:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZltM-0001ud-J7; Thu, 31 Mar 2022 03:54:36 +0000
Received: by outflank-mailman (input) for mailman id 296636;
 Thu, 31 Mar 2022 03:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BbJ=UK=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nZltJ-0001uW-Ps
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 03:54:34 +0000
Received: from sonic301-20.consmr.mail.gq1.yahoo.com
 (sonic301-20.consmr.mail.gq1.yahoo.com [98.137.64.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4435afdc-b0a6-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 05:54:31 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Thu, 31 Mar 2022 03:54:29 +0000
Received: by kubenode531.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID d9e653a8b36759090ebe631f467114cf; 
 Thu, 31 Mar 2022 03:54:25 +0000 (UTC)
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
X-Inumbo-ID: 4435afdc-b0a6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648698869; bh=KKsyBEl4q1LDy1SP5VL4bgr8nVC6cxIiQ5mNNkiGHxk=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=bHVc/WY/2krO5EeYgr4y+qB5BG/vzi6bG6J9Umg8pTprC/sahuETQfLStD6s3h5FPgF/BidBBYPdlUsghSD4Q1lCxnBHoohoYJlO8VI5G+S11dzpErok8f/kOLx9m4l/Boii7r9/IS7t9wylw1nlrSsWnOroEmnAN+g4DBW8f2EvMLD9n/ESvTJa+WqbS5aPQuhmchOLEeUdn4GvVvHXIhhBouCwMPGK1ape4UsuKozX7xpfN7z9KSPLCqQKNgh1DCzwepcxNiMnT94zgvBYZfpZ9bvHgp8TJjqH/IdzhiztZkbIpT6f9HXRkSVUJHKBeWRVF70iejIxp7AMEXWp7Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648698869; bh=m80MGMabjDDMHFmsBASMVp03mG5NaoiOoPx52vUyxnZ=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=ulmjrNekmCosvieCj8uMb2biZxvbv7Z7hh8ud1YtYaP6Irdq+rY9g78c4IenMfjHA7KD/+Ebr28oCtVJxqmfPgM/XTph3MM5kKt8qMUPzAxgegevet25bUt+ziBM8EOmPx8fOasD8p5M3J2czOo93hXiPBRO19jWRVvbauSMwi1M5Faipsg1dg8lXX2PYlUad0JMMwf0bc6UFOSvowcV9hcWsAo290PVx5DiUcZQiNecbxBAeimJUVYpLrPl+mW522SIVFg6UXiDFZaKQXIMlXtDehNXPjNc4M+OTSDIf6DjIBNyZC0S0BsY/wTi1DWkP0FhH2VCM8Kl0dW5gJFpzg==
X-YMail-OSG: A7wwiecVM1nuU5tq9U4zvLY0Z72gn_Ak2hWT1T0HFAkIiRtp9J4_eW0EXirY.12
 9TFcpNq501fkHOTXIqoxaOO.5emQEJnlgoml2wybXtMoYYhqHYM2es0o4CVG7ROkBDagcz9I0.sd
 SPWE2SZLf_PVdtnD5e2fR6KgAiz2koEhtTxr1wi.83_r3ROWr7EenqRN9QzDl.r3npI37gZT.5NP
 1JKlMf4IrkEEnrWnaCkPPdkZcw1M4nAcPLc9s1nmd3eirL5..CW0LitqxCSsW4H4RFOTp_egygwP
 sGHCYQwz6AjJmc0vlCJYlJBC57XxsdYalZ21lbH4Ya4rREKaENaL.HVRkn51hVm51D3lD3qlEHtJ
 iYNYitnka6GlRrkEslaXpByV14hrZ6CzZewPnOFMT1J1NX5WgBgYwYr53XIheZnlINOgUfX0tBEq
 4DJpaDlrrOamrse7oCueMwnzaom065bH21_BebJ1t8EqptF0RYGRcmlX5H6gl7gVrj.A2CgvIYfu
 AnsACIoYtEkzF5_BpdevmI.BMcrJ6ab3tN.ude22_E3oXBErPvzpCw3D04cqClbPPwUwT_BWU_ER
 IlFhPdVhxmw.lh4yTi4TZbec_vefAwi3IRiBHemiHDqAboecGI2X3ra92d.xkCA_1UMTDaOj2xTo
 k2nA_8Lr6mpHUpcGlXD6ZY51xCRqKRbXjj6isN0EW9ZOIHxe1EgkOGkJyhIaZHkMwr0B3vo2RgZ6
 iAKrLqA0Ig44zvQoTd867sL9MSiUTDxcVMkToxrCk1aXcbrsi8kqA3_EgeybNyxywQvV_IyoVOZn
 XOCdL8xVNYS7Jw0gFbhn65B7F6XUaDY3JsKJPN1vKJw0z.4oDkgWxP_AEh.a9FXSuiMIttt7zbd5
 _7qMrZPEyXxRJ2OSs.pJV7bcXrtSXXjnZAEqH0qH7ITSxlV.Ho9niS2.HuLXxk3oOvbxfSpNu26B
 ZKthUtdSaBF89O1gnYAj7VmunfyH2PVUk.uDqpHApEjcHHstduA456bSCjaUbAhR.eO1189Ikj3B
 GDNxT8204oMChjxlFOjhDfSbmfHjvKxA.9.5kBu8UNe53VSllwjY9ARBkv2BqVTit5qHcL9Koshs
 3v130eza1aZtMrlm1g_yZzBBZlyfF_INpGKlfE1amthdMXDwz2zW0grn7ur87jvFUbUYdj7U9ql9
 lVu3sOYgp4cQe4ye0qc9DNMQA5Ptv0gfeUywmWxI6Qy66zXfNNlIMLlPPkrbmtJmV32w62KOccSf
 hoCMQWJ4GwTlMvntKdI7O8grYVc2MOiGJwyvdN6h3OUR2jTuw5Z.Ht9egOLh7A.R.4let6PDwlzr
 8nMNFhR1i41nohwQGxwGdgccOj0V_mKOYKCgwMBrL6cy5OT5ST5kwgO38TGu4.4yNs.ddBx0h78l
 ylqxucLvFVYATs64V2mvRDPialKMXfaiGq6cqqet9Irx4_vHAPTSneXv6QF8JosB7jnnmqDa3S1v
 cm2gvDXdvTW2bPkWpqLx3dYnKRfUsf.xr4INjgkTXOfnbnj9JMxfYC5QNkwcfymQVC3CWCGXLyD0
 Y5.kG59QdbQQ1sHjv7zyYAzl65BEvPjYq.S0NS5HMlMHJxm09TflaD8gfSrQ.EVAQipcuh2c4Uyw
 LygiOkgu5eU6Q6W8BHPcOueNtg2aTfmN.ziDYGenc26SlO3fHPC7Lft7_5WMOJ6acGXx_cEOZYkH
 Vzyi92hF5VQu_XTco9AdppVENfmC0fmlUdeJtug.ejXcG8WmNaeknb75uiyovM4AsWd1R7b_Mpk0
 pun7VE25NMaplggc_Urnj9mZkaQKscZyS8VfhjQBUUXiTO3G1ekvKrvf_7WCx1436aBWfC_49yqq
 QAwE8D0WXhRuaGH9KNvdT9yMzexgpRyqKq.H1eT7EeA8XV6u0cShviYTk8fPkzrRVJ66d1c3jNVw
 xbApekNXxNUORJ_plEPz0hjLFZ4RwejaOGNnWAFqQ_NV_vam8Q7_Y8OCsnjOXCD06znEkgePzTDx
 tP9hyYA9.tMu2UUvGbBQMygs0WmIO3nneoq9DtxwIME_OEoh._d0oxIKG5Bqv3HmHKAXJ6DucDjz
 4YNg61a9ID.XC7j_v49OXGy8bciI4ZeW83.QiTNEEqmRkT6NoXRZAa0gDnuiRVHkOG5XOEIrjvkF
 Dg.hK_Kn9hcal822Vukuo9ZBX.bBInam50ebPADnLFdSSzPsXb7WDCqBNTrN8_fF0tWy13RJ.ZOd
 bhgseQ7j_szhDSeMErg--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <46a8585e-2a2a-4d12-f221-e57bd157dec6@netscape.net>
Date: Wed, 30 Mar 2022 23:54:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
 <408e5e07-453c-f377-a5b0-c421d002aec5@srcf.net>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <408e5e07-453c-f377-a5b0-c421d002aec5@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/30/22 1:27 PM, Andrew Cooper wrote:
> On 30/03/2022 18:15, Anthony PERARD wrote:
>>
>> Some more though on that, looking at QEMU, it seems that there's already
>> a call to xc_domain_iomem_permission(), in igd_write_opregion().
> This has been discussed before, but noone's done anything about it.
> It's a massive layering violation for QEMU to issue
> xc_domain_iomem_permission()/etc hypercalls.
>
> It should be the toolstack, and only the toolstack, which makes
> permissions hypercalls, which in turn will fix a slew of "QEMU doesn't
> work when it doesn't have dom0 superpowers" bugs with stubdomains.

How much say does the Xen project have over the code
in Qemu under hw/xen? I would not be against having libxl
do the permissions hypercalls in this case instead of Qemu
doing it. My test with Qemu traditional and this patch proves
the permission can be granted by libxl instead of the device
model.
> In this case specifically, the opregion is a magic Intel graphics
> specific bodge.  The i915 driver in the guest really does need to access
> part of the real PCH during init, which (in Xen's permission model)
> really does require permitting access to the MMIO range (8k iirc) so it
> can be mapped as a BAR in QEMU's emulated PCH.

That is exactly what my testing confirmed, but in my
tests only Linux guests need access to the magic Intel
opregion. The proprietary Windows Intel graphics
drivers are apparently able to work around lack of
access to the opregion, at least on my system, and
Windows guests with Intel IGD passthrough function
very well without needing this patch. So the problem
could be fixed in the Linux i915 kernel driver, but Intel
has not contributed the magic sauce to the Linux kernel
that would enable Linux guests to work without access
to the Intel opregion.

And you are correct, the opregion is 8k (2 pages) in size,
but it is not always page aligned, as mentioned earlier,
so the IGD_OPREGION_PAGES constant is set to 3 instead
of 2.

Chuck

