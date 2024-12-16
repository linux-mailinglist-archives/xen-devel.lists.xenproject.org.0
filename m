Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8472F9F3698
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 17:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858385.1270608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNEJr-0003DS-FT; Mon, 16 Dec 2024 16:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858385.1270608; Mon, 16 Dec 2024 16:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNEJr-0003B5-Ca; Mon, 16 Dec 2024 16:51:43 +0000
Received: by outflank-mailman (input) for mailman id 858385;
 Mon, 16 Dec 2024 16:51:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBMF=TJ=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tNEJq-0003Az-1J
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 16:51:42 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0509e3ab-bbce-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 17:51:39 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 16 Dec 2024 17:51:39 +0100
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
X-Inumbo-ID: 0509e3ab-bbce-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734367900; x=1765903900;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=QHWfcLnJ/NkdFiBCvjorln0ohBppte9uNiADP/3iEvM=;
  b=QspoDnimKgUMoVzMhO3tvgUYonljjyJbmyP5kP9bCrJ5CkrY6ulIqPAn
   HBS4eD4VIokzPtlXi3upp4EVILlkzOxZB8cZhsEI4mmMtU6LOo2Bpmkw9
   8tNIoHFrDhn9uKf9a0x5HXcyHWc46bnAtMoXYPXdeFdFr+2QqKyoLYL3y
   w=;
X-CSE-ConnectionGUID: XxQNsC37StuOJhaBwO9iYQ==
X-CSE-MsgGUID: tPScodwQTESouMyNiePfRQ==
X-IronPort-AV: E=Sophos;i="6.12,239,1728943200"; 
   d="scan'208";a="28202852"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <49497f8c-a2e4-49a1-aac0-96d704834f0f@citrix.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 149.5.228.1
References: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241214161350.70515-3-Ariel.Otilibili-Anieli@eurecom.fr> <49497f8c-a2e4-49a1-aac0-96d704834f0f@citrix.com>
Date: Mon, 16 Dec 2024 17:51:39 +0100
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Luca Fancellu" <luca.fancellu@arm.com>, "Anthony PERARD" <anthony.perard@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
MIME-Version: 1.0
Message-ID: <2f7a87-67605a80-ce37-141f3260@214819454>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/1] =?utf-8?q?tools=2C?=
 =?utf-8?q?_xen/scripts=3A?= clear out Python syntax warnings
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Monday, December 16, 2024 12:34 CET, Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:

> On 14/12/2024 4:09 pm, Ariel Otilibili wrote:
> > * since 3.12 invalid escape sequences generate SyntaxWarning
> > * in the future, these invalid sequences will generate SyntaxError
> > * therefore changed syntax to raw string notation.
> >
> > Link: https://docs.python.org/3/whatsnew/3.12.html#other-language-c=
hanges
> > Fixes: e45e8f69047 ("bitkeeper revision 1.803 (4056f51d2UjBnn9uwzC9=
Vu3LspnUCg)")
> > Fixes: d8f3a67bf98 ("pygrub: further improve grub2 support")
> > Fixes: dd03048708a ("xen/pygrub: grub2/grub.cfg from RHEL 7 has new=
 commands in menuentry")
> > Fixes: d1b93ea2615 ("tools/pygrub: Make pygrub understand default e=
ntry in string format")
> > Fixes: 622e368758b ("Add ZFS libfsimage support patch")
> > Fixes: 02b26c02c7c ("xen/scripts: add cppcheck tool to the xen-anal=
ysis.py script")
> > Fixes: 56c0063f4e7 ("xen/misra: xen-analysis.py: Improve the cppche=
ck version check")
> >
> > Cc: Anthony PERARD <anthony.perard@vates.tech>
> > Cc: Luca Fancellu <luca.fancellu@arm.com>
> > Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
> > ---
> >  tools/misc/xensymoops                         | 4 ++--
> >  tools/pygrub/src/GrubConf.py                  | 4 ++--
> >  tools/pygrub/src/pygrub                       | 6 +++---
> >  xen/scripts/xen=5Fanalysis/cppcheck=5Fanalysis.py | 4 ++--
> >  4 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/tools/misc/xensymoops b/tools/misc/xensymoops
> > index 835d187e90..bec75cae93 100755
> > --- a/tools/misc/xensymoops
> > +++ b/tools/misc/xensymoops
> > @@ -17,7 +17,7 @@ def read=5Foops():
> >      stack=5Faddrs is a dictionary mapping potential code addresses=
 in the stack
> >        to their order in the stack trace.
> >      """
> > -    stackaddr=5Fptn =3D "\[([a-z,0-9]*)\]"
> > +    stackaddr=5Fptn =3D r"\[([a-z,0-9]*)\]"
> >      stackaddr=5Fre  =3D re.compile(stackaddr=5Fptn)
> > =20
> >      eip=5Fptn =3D ".*EIP:.*<([a-z,0-9]*)>.*"
>=20
> Oh wow.=C2=A0 I've not come across this script before, and it's not
> referenced in the build system.
>=20
> Also, it's hard-coded to 32bit Xen which was deleted in Xen 4.13 more
> than a decade ago, and there are other errors in the regexes such as
> including a comma in stackaddr=5Fptn
>=20
> Worse however, it escaped the Py2->3 conversion and is still using ra=
w
> print statements.
>=20
> I'll submit a patch deleting it entirely.

Acked-by: Ariel Otilibili-Anieli <Ariel.Otilibili-Anieli@eurecom.fr>

I'll send a new series, only on the subsequent feedback.=20
>=20
> > diff --git a/tools/pygrub/src/GrubConf.py b/tools/pygrub/src/GrubCo=
nf.py
> > index 580c9628ca..7cd2bc9aeb 100644
> > --- a/tools/pygrub/src/GrubConf.py
> > +++ b/tools/pygrub/src/GrubConf.py
> > @@ -320,7 +320,7 @@ class GrubConfigFile(=5FGrubConfigFile):
> >  def grub2=5Fhandle=5Fset(arg):
> >      (com,arg) =3D grub=5Fsplit(arg,2)
> >      com=3D"set:" + com
> > -    m =3D re.match("([\"\'])(.*)\\1", arg)
> > +    m =3D re.match(r"([\"\'])(.*)\\1", arg)
>=20
> Doesn't this \\1 want to turn into just \1 now it's a raw string?

Indeed; I'll do that.
>=20
> > diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
> > index 9d51f96070..58b088d285 100755
> > --- a/tools/pygrub/src/pygrub
> > +++ b/tools/pygrub/src/pygrub
> > @@ -1104,7 +1104,7 @@ if =5F=5Fname=5F=5F =3D=3D "=5F=5Fmain=5F=5F"=
:
> >      if chosencfg["args"]:
> >          zfsinfo =3D xenfsimage.getbootstring(fs)
> >          if zfsinfo is not None:
> > -            e =3D re.compile("zfs-bootfs=3D[\w\-\.\:@/]+" )
> > +            e =3D re.compile(r"zfs-bootfs=3D[\w\-\.\:@/]+" )
>=20
> Related, this string looks dodgy.=C2=A0 The \- is correct (I think, t=
o not
> have it interpreted as a range), but I'm pretty sure a literal . and =
:
> don't need escaping inside a [], and the result here would be for a
> literal \ to be included.
>=20

To replace: \w\-\.\:@/
By: \w\-.:@/

Is this what you mean?
> ~Andrew


