Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJYyEZCq6WkxgwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 07:13:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06CC44D329
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 07:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291549.1570431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFmNX-0006GC-5o; Thu, 23 Apr 2026 05:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291549.1570431; Thu, 23 Apr 2026 05:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFmNX-0006Dx-38; Thu, 23 Apr 2026 05:13:31 +0000
Received: by outflank-mailman (input) for mailman id 1291549;
 Thu, 23 Apr 2026 05:13:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wFmNW-0006Dr-5k
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 05:13:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFmNV-00D8ch-1k
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 07:13:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e9aa5b-bab6-0a2a0a5309dd-0a2a4504a378-20
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 07:13:28 +0200
Received: from [209.85.208.175] (helo=mail-lj1-f175.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e9aa78-1dec-0a2a45040019-d155d0afddfd-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 07:13:28 +0200
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-38df1889fb9so60214751fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 22:13:28 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1776921208; cv=none;
        d=google.com; s=arc-20240605;
        b=V34aY9Tt7nIkJ6dz42cy6j7ERhmwrDwzLSOT2mZzMymc9j6vXNEPK19771WGsA7og2
         a3ItGu2sIq0sS1C+pWBrQRRsIJlQ7p/BzSer5K6YD6NQ4zl4GfeOzqfZDU2rVFT5o1Cs
         hnQxGBOArAaJQdmUMiL9JcLq1qJ8QsJnNVQ1LyZ+ptWyS1CJYF4mWqxqSiSdaqrJYYFg
         DvpnpYPQNdCYGkrSNrfqfpDWIJKFD0S5wxJdqOEbOsIFoTY5b99a31X0r9jWsR4t1rsP
         /szdT3p4BTfUtJZp2PpObz36Y+2vpwrCI/68XFMTxFe1SZcmYuhDAn3+44xq7N+ZHSD0
         J7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KCcfFoHP27cOrCoeHgAVx9tKLrioXkp942qiP418YI8=;
        fh=eMY2E6GaL/ZbzNsFM96x8qs39WPSLTuppOzw4R8QM3w=;
        b=Me66Q8NIzhB2atZ5+fMMEje5vQBdTqCNe6JKYU6mWmX84dpOAG2zPrwpGe5KpweKkf
         m5SDs0739abPYIJRo/qNA/O9OQWDPHSCYWbS4wZO4nB6yVAiv8H2RS6Ov3kFHWiB26Ag
         PHOLrkoyxc931PfwpHeM2XXxk6UjsH1t32JzgB4eOlBEIzTg+pMYRuue4X7PgGjcNZr5
         QM0FsIxnPFtZA2mCw+n6C85gI3X+1T2kFmTUy57C1jqiehu0JI8M6GaPP2gfCkYxJDpD
         PmcOW6TGUQd91BkGoBGtaSHbZ/LsCu5RjNqK8/yml0A5ugPAUBa1IKhx793UQWHmZXdM
         0YYw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776921208; x=1777526008; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCcfFoHP27cOrCoeHgAVx9tKLrioXkp942qiP418YI8=;
        b=I18R+8tpj2Gdnv9RE1DvY2nXuceqZjLccm3zsTfKWqf8b+cLoK06CtyE9+k1eXQClx
         MrFZVM2JeIAF8O9TlRU2cHC9xhSXJDk9ST8lpAJdtk0oZgfNf2kP+pcxyKxIk632xgzx
         DGzxLH3q7pguJ4Na193DC6P3Dwb/pl7/ebBK0lgvI7HRktriF419LW/4lRTfuHfia2PV
         F9Qqy5oH9uBy6f0NN9wk+fAjqsz+hQds0spY7RLG0FqSylSCgbYilfNZVYY8Pet5o1te
         MfaLWseF1oLNKUZeaMQhM/TpPo3nd/7ZZlJWzrSLKXv4me8dpqIeh/btTC8L9BC3duzh
         37ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776921208; x=1777526008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KCcfFoHP27cOrCoeHgAVx9tKLrioXkp942qiP418YI8=;
        b=OsqSMYSOCI08ddfrVTm+IpCMAouvv3fof13x2X57Pgevg7ecpJoz69HO3/Xchf0JLE
         M229Dvi1SANe9z6wMinXb0eIBLFiW+UqHRezZG6QXiIAd4m7ok/h+g6sq/4A6MUP0BhT
         n1oHwK6MSaeUgtnWhPRW7MKBz/zM+GE4Nbys5q7qJOs8FOPobug6+2tXu5mbxK4VFqOX
         Z+3xyZ9o26ImagIRekCB/LJs4F8dxhwE9WYeBCyv0lmZzDpE4O8wBs3c3W2Owq6mKr5s
         nQK0rEnacIav9dQsx/e6Il0STsMzO6b7dQK92S2/YV34ZubVJ/y5FgsmxKCTLqfSRByF
         6xCg==
X-Forwarded-Encrypted: i=1; AFNElJ9mTDOb802c2CMpVLh/mUsiC4sPtAO+Rwe+0P0i35lIG0LySahPbpqKZvMt10WRSFxDBQV9KMlGxGs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIUxzZRaquX2DUCffkJfhpx6c8RSp7C7j9FGSoMKhhv0osUqD4
	ptpgB7kzcMUBxMdGM8YJHDO8HLQuNo8NHihw0pSt7+wXCHniELdm3Zqrd9gZd2bkMAAnFN7CC9g
	vxLcn0Rv/VL6/PVonMjAawFnt+TE/tJc=
X-Gm-Gg: AeBDievISmzEDg1IoJ0F8szDAiDFkCZPY+74sEBJqL/QERWkaZKoT7OHF594TPeZGmF
	feTlBKjFpcBWAsxN49H8cKXPXmX0q8w0yLoF4zlNRnniN6h2uL9eYyo1rEzyTBBQlaKlW34nGw+
	muuthy72Yw8issRvTdC2fXwaBaUteSILQOqSc/8bHaIiNTe4QQpYkZku7Jj+VRPFlkHyzWm3Zhp
	X5xwWSOLgMYjMQQ8td5b9z1yecR90pqqWtSXhruqEqNsMJvBgLIQHSU4R+sKUMfFYh0PAqvE7WC
	HxCI9/CvArEUvD/5
X-Received: by 2002:a05:651c:41d7:b0:38e:84d3:f2c9 with SMTP id
 38308e7fff4ca-38ec77f5dd2mr73866311fa.7.1776921207633; Wed, 22 Apr 2026
 22:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
 <dc5550d7-5a2d-4ca1-85de-5a17c24aeac4@suse.com> <CAGeoDV-ffZsOW+Cu0-oPA1obBOv_1nWU8_PAdaqaoy6=YUHGig@mail.gmail.com>
 <5b16e00e-9a4d-4a18-8a5e-dde10b42a043@suse.com> <CAGeoDV_Cdpa6beFemKaVcCguwmo95x0g0rsRYbS1x5dAUxFPLQ@mail.gmail.com>
 <5fb9b5ee-ee71-49ec-b545-62c8ec27fc15@suse.com> <CAGeoDV-HCKUXZ-CZBASLik=xkR02w-n=5+HVsYGwfDf4zD-3zA@mail.gmail.com>
 <425cdc68-5e25-4e01-b5d9-6469e2d08abb@suse.com> <DDF9A244-22CB-416E-A855-D85FECE0A3C2@arm.com>
In-Reply-To: <DDF9A244-22CB-416E-A855-D85FECE0A3C2@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 23 Apr 2026 08:13:15 +0300
X-Gm-Features: AQROBzDLgaf4ettKLUBXexSNAAtxl3rUW9JKJ58G8GEbqkXZa-IOfnnF7Sg4TzQ
Message-ID: <CAGeoDV_0r8_-dB33G5U81+Q1yncgzgLgMF5Ar_rmVt5h8-rgZQ@mail.gmail.com>
Subject: Re: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI arguments
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1776921208-2BD6C3FF-85B1205F/0/0
X-purgate-type: clean
X-purgate-size: 7695
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,suse.com:email,mail.gmail.com:mid,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A06CC44D329
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand,

On Wed, Apr 15, 2026 at 3:31=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jan and Mykola,
>
> > On 1 Apr 2026, at 14:24, Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 01.04.2026 11:51, Mykola Kvach wrote:
> >> On Wed, Apr 1, 2026 at 12:22=E2=80=AFPM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>> On 01.04.2026 10:49, Mykola Kvach wrote:
> >>>> On Wed, Apr 1, 2026 at 11:14=E2=80=AFAM Jan Beulich <jbeulich@suse.c=
om> wrote:
> >>>>> On 01.04.2026 09:13, Mykola Kvach wrote:
> >>>>>> On Wed, Apr 1, 2026 at 9:29=E2=80=AFAM Jan Beulich <jbeulich@suse.=
com> wrote:
> >>>>>>> On 31.03.2026 20:31, Mykola Kvach wrote:
> >>>>>>>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>>>>>>
> >>>>>>>> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC cal=
ls
> >>>>>>>> using Wn, only the least significant 32 bits are significant and=
 the
> >>>>>>>> upper 32 bits must be ignored by the implementation.
> >>>>>>>>
> >>>>>>>> So for SMC32 PSCI calls, Xen must not treat non-zero upper bits =
in the
> >>>>>>>> argument registers as an error. Instead, they should be discarde=
d when
> >>>>>>>> decoding the arguments.
> >>>>>>>>
> >>>>>>>> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits =
may be
> >>>>>>>> implementation defined when entering from AArch32. Xen zeros the=
m on
> >>>>>>>> entry, but that guarantee is only relevant for 32-bit domains.
> >>>>>>>>
> >>>>>>>> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND, AFFINITY_INFO and SYSTEM_=
SUSPEND
> >>>>>>>> to read SMC32 arguments via PSCI_ARG32(), while keeping the SMC6=
4
> >>>>>>>> handling unchanged.
> >>>>>>>>
> >>>>>>>> No functional change is intended for PSCI 0.1.
> >>>>>>>>
> >>>>>>>> Suggested-by: Julien Grall <julien@xen.org>
> >>>>>>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>>>>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>>>>>
> >>>>>>> I thought I might as well include this in my next commit sweep, b=
ut isn't
> >>>>>>> this R-b being invalidated by ...
> >>>>>>>
> >>>>>>>> ---
> >>>>>>>> v3:
> >>>>>>>> - use PSCI_ARG_CONV for SYSTEM_SUSPEND
> >>>>>>>
> >>>>>>> ... this change. That's ...
> >>>>>>>
> >>>>>>>> @@ -422,14 +427,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs=
 *regs, uint32_t fid)
> >>>>>>>>     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >>>>>>>>     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >>>>>>>>     {
> >>>>>>>> -        register_t epoint =3D PSCI_ARG(regs, 1);
> >>>>>>>> -        register_t cid =3D PSCI_ARG(regs, 2);
> >>>>>>>> -
> >>>>>>>> -        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> >>>>>>>> -        {
> >>>>>>>> -            epoint &=3D GENMASK(31, 0);
> >>>>>>>> -            cid &=3D GENMASK(31, 0);
> >>>>>>>> -        }
> >>>>>>>> +        register_t epoint =3D PSCI_ARG_CONV(regs, 1, is_conv_64=
);
> >>>>>>>> +        register_t cid =3D PSCI_ARG_CONV(regs, 2, is_conv_64);
> >>>>>>>>
> >>>>>>>>         perfc_incr(vpsci_system_suspend);
> >>>>>>>>         PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint,=
 cid));
> >>>>>>>
> >>>>>>> ... this hunk aiui, which is far from merely cosmetic imo. While
> >>>>>>
> >>>>>> Nobody said that the change had to be purely cosmetic in order to =
keep
> >>>>>> the tag. I understood it differently from the official Xen
> >>>>>> documentation pages.
> >>>>>>
> >>>>>>> behavior looks to remain the same for PSCI_1_0_FN32_SYSTEM_SUSPEN=
D, it
> >>>>>>
> >>>>>> Exactly. If the changes are not substantial, I do not see a reason=
 to
> >>>>>> drop the tag ...
> >>>>>>
> >>>>>>> clearly changes for PSCI_1_0_FN64_SYSTEM_SUSPEND. That may be int=
ended
> >>>>>>> and for the better, but the change clearly wasn't reviewed by Ber=
trand,
> >>>>>>> nor - when offering the R-b - did he ask for this extra change.
> >>>>>>
> >>>>>> ... and this is also how I understood the Xen patch submission
> >>>>>> guidelines [1], which say:
> >>>>>>
> >>>>>> "Note that if there are several revisions of a patch, you ought to
> >>>>>> copy tags that have accumulated during the review. For example, if
> >>>>>> person A and person B added a Reviewed-by: tag to v1 of your patch=
,
> >>>>>> include it into v2 of your patch. If you make substantial changes
> >>>>>> after certain tags were already applied, you will want to consider
> >>>>>> which ones are no longer applicable (and may require re-providing)=
."
> >>>>>>
> >>>>>> So my understanding was that tags should normally be kept across
> >>>>>> revisions, unless the changes are substantial enough to make them =
no
> >>>>>> longer applicable.
> >>>>>
> >>>>> Maybe our understanding of "substantial" differs. To me that's anyt=
hing
> >>>>> changing functionality. Style adjustments, typo corrections, and al=
ike
> >>>>> generally aren't substantial (albeit even then there may be excepti=
ons).
> >>>>
> >>>> Thanks for clarifying what you consider substantial.
> >>>>
> >>>> Even under that interpretation, I do not see a functionality change
> >>>> here. "Refactoring" seems like the more accurate term in this case:
> >>>> the internal form changes, but the intended external behavior does
> >>>> not.
> >>>>
> >>>> It may be that we are using "functional change" in slightly differen=
t
> >>>> senses here.
> >>>>
> >>>> For v3, the switch to PSCI_ARG_CONV() in SYSTEM_SUSPEND was meant to
> >>>> make this case consistent with the helper-based argument decoding us=
ed
> >>>> elsewhere, not to change behavior.
> >>>>
> >>>> In particular, I do not see a functional change for
> >>>> PSCI_1_0_FN64_SYSTEM_SUSPEND: v2 used PSCI_ARG(regs, 1/2), and in v3
> >>>> PSCI_ARG_CONV(regs, 1/2, is_conv_64) should resolve to the same thin=
g
> >>>> when is_conv_64 is true.
> >>>
> >>> Isn't the whole point of the patch to alter behavior when is_conv_64 =
is
> >>> false? For that case PSCI_1_0_FN64_SYSTEM_SUSPEND behavior looks to
> >>> change in v3, when it didn't in v2. Whereas for
> >>> PSCI_1_0_FN32_SYSTEM_SUSPEND the v3 change indeed only eliminates ope=
n-
> >>> coding, which one may or may not regard as "substantial".
> >>
> >> I think the point I was trying to make is slightly narrower: in this
> >> code path, is_conv_64 is derived directly from fid via
> >> smccc_is_conv_64(fid) before the switch (fid).
> >>
> >> So for PSCI_1_0_FN64_SYSTEM_SUSPEND, I do not see how
> >> is_conv_64 =3D=3D false could arise here: if we are in the FN64 case,
> >> the function ID already encodes the 64-bit convention.
> >>
> >> Conversely, if is_conv_64 is false here, then this cannot be the
> >> FN64 case.
> >
> > Ah, I see. To figure that out, I would have had to do a proper review. =
I
> > was after committing only, which ought to be an entirely mechanical ste=
p.
> >
> >> On that basis, I do not see a behavioral change for the FN64
> >> SYSTEM_SUSPEND case in v3.
> >
> > I agree (now). I'm still not going to pick up that patch, but rather
> > leave it to the Arm maintainers. While not as clear cut as it first
> > seemed to me, I still consider it within the grey area.
>
> Sorry for the delay, this felt through in my filters as it was reviewed-b=
y already.
>
> I am ok with the changes done which make sense (mask is now done
> directly).
>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thank you for taking another look.

With your Reviewed-by in place, and since I do not expect any further
changes from my side, I believe this patch should now be ready for the
Arm maintainers to pick up.

Best regards,
Mykola

>
> Cheers
> Bertrand
>
> >
> > Jan
>
>

