Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065569E691C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 09:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849937.1264423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJTq0-0002i7-Bw; Fri, 06 Dec 2024 08:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849937.1264423; Fri, 06 Dec 2024 08:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJTq0-0002fQ-94; Fri, 06 Dec 2024 08:37:24 +0000
Received: by outflank-mailman (input) for mailman id 849937;
 Fri, 06 Dec 2024 08:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbYF=S7=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tJTpy-0002fK-Bb
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 08:37:22 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e5c75ec-b3ad-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 09:37:20 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 06 Dec 2024 09:37:19 +0100
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
X-Inumbo-ID: 4e5c75ec-b3ad-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1733474240; x=1765010240;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=rTkhAMK/kNKQuhdzI/kBqZ0iMBZKcdMldxieIpvvQKo=;
  b=NIEh6ht5Jp84cVrHWytheoGxT7Xf1Jf9Kr1U8dJzQG7lbPPIkFI+9nWn
   ZaWOqkbVuWtOpzcekVRocDsQtFwFqn6llV+Xu9OtM94Pahx86aJnnt/yS
   phxeXnYgomhzDyyFzbmC3Nw0UJNFYI8Sk2LwoSs8XL+IOf+cfm4UlH3g9
   s=;
X-CSE-ConnectionGUID: a7vYs/GoRi+Rmoyl2ETVDg==
X-CSE-MsgGUID: fG5/L3wDS7+rOnRIlOK36A==
X-IronPort-AV: E=Sophos;i="6.12,212,1728943200"; 
   d="scan'208";a="28056097"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <ed248424-00a2-44ab-a7cf-3f2197d589a1@citrix.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
References: <20241206000422.331015-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241206000422.331015-2-Ariel.Otilibili-Anieli@eurecom.fr> <ed248424-00a2-44ab-a7cf-3f2197d589a1@citrix.com>
Date: Fri, 06 Dec 2024 09:37:19 +0100
Cc: xen-devel@lists.xenproject.org, "Anthony PERARD" <anthony.perard@vates.tech>, "Jan Beulich" <jbeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
MIME-Version: 1.0
Message-ID: <2a1a24-6752b780-91-c912830@6857849>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/1] =?utf-8?q?tools/libacpi=3A?= clear out 
 compilation warnings
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Friday, December 06, 2024 01:42 CET, Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:

> On 06/12/2024 12:00 am, Ariel Otilibili wrote:
> > From: Ariel Otilibili <otilibil@eurecom.fr>
> >
> > * While compiling ASLs, iasl puts out deprecation warnings
> >
> > ```
> > tools/libs/light/mk=5Fdsdt --debug=3Dy --maxcpu any --dm-version no=
ne >> tools/libs/light/dsdt=5Fpvh.asl
> > /usr/bin/iasl -vs -p tools/libs/light/dsdt=5Fpvh.tmp -tc tools/libs=
/light/dsdt=5Fpvh.asl
> >
> > tools/libs/light/dsdt=5Fpvh.asl     40:         Processor ( PR00, 0=
, 0x0000b010, 0x06 ) {
> > Warning  3168 -                                                    =
               ^ Legacy Processor() keyword detected. Use Device() keyw=
ord instead.
> >
> > tools/libs/light/dsdt=5Fpvh.asl     64:         Processor ( PR01, 1=
, 0x0000b010, 0x06 ) {
> > Warning  3168 -                                                    =
               ^ Legacy Processor() keyword detected. Use Device() keyw=
ord instead.
> > ```
> >
> > * since 6.0, the ACPI specs have deprecated the keyword Processor
> > * the deprecation is mentioned in Rev. History, Issue 1232
> > * instead, ACPI advices to use the keyword Device
> > * after the fix, the warnings are cleared out.
> >
> > ```
> > tools/libs/light/mk=5Fdsdt --debug=3Dy --maxcpu any --dm-version no=
ne >> tools/libs/light/dsdt=5Fpvh.asl
> > /usr/bin/iasl -vs -p tools/libs/light/dsdt=5Fpvh.tmp -tc tools/libs=
/light/dsdt=5Fpvh.asl
> >
> > ASL Input:     tools/libs/light/dsdt=5Fpvh.asl -  167025 bytes   37=
63 keywords      0 source lines
> > AML Output:    tools/libs/light/dsdt=5Fpvh.aml -   27035 bytes   25=
99 opcodes    1164 named objects
> > Hex Dump:      tools/libs/light/dsdt=5Fpvh.hex -  253913 bytes
> >
> > Compilation successful. 0 Errors, 0 Warnings, 0 Remarks, 1915 Optim=
izations
> > ```
> >
> > Link: https://uefi.org/specs/ACPI/6.5=5FA/Frontmatter/Revision=5FHi=
story.html#revision-history
> > Link: https://uefi.org/specs/ACPI/6.5=5FA/08=5FProcessor=5FConfigur=
ation=5Fand=5FControl.html#declaring-processors
> > Link: https://uefi.org/specs/ACPI/6.5=5FA/19=5FASL=5FReference.html=
#device-declare-device-package
> > Signed-off-by: Ariel Otilibili <otilibil@eurecom.fr>
> > Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
> > ---
> >  tools/libacpi/mk=5Fdsdt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/libacpi/mk=5Fdsdt.c b/tools/libacpi/mk=5Fdsdt.c
> > index 34f6753f61..5729b4238c 100644
> > --- a/tools/libacpi/mk=5Fdsdt.c
> > +++ b/tools/libacpi/mk=5Fdsdt.c
> > @@ -186,7 +186,7 @@ int main(int argc, char **argv)
> >      /* Define processor objects and control methods. */
> >      for ( cpu =3D 0; cpu < max=5Fcpus; cpu++)
> >      {
> > -        push=5Fblock("Processor", "PR%02X, %d, 0x0000b010, 0x06", =
cpu, cpu);
> > +        push=5Fblock("Device", "PR%02X", cpu);
> > =20
> >          stmt("Name", "=5FHID, \"ACPI0007\"");
> > =20
>=20
> Hello,
>=20
> Thankyou for your patch.
>=20
> Unfortunately, it's not quite this simple.=C2=A0 While there is a war=
ning out
> of IASL, older OSes coded to prior versions of the ACPI spec still
> depend on "Processor".

Thanks for the feedback, Andrew; I didn't consider older OSes in the pa=
tch, indeed.

>=20
> It may be time to start thinking about removing support for the likes=
 of
> WinXP, but that needs more consideration than simply fixing a warning=
.

If the removal makes sense; I am willing to work on it.

I would need to know which parts of the codebase should be modified.

Regards,
Ariel
>=20
> ~Andrew


