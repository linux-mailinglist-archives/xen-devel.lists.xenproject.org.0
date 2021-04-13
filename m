Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ABC35D72C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 07:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109473.209061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWBRz-0004RN-4l; Tue, 13 Apr 2021 05:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109473.209061; Tue, 13 Apr 2021 05:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWBRz-0004Qy-1W; Tue, 13 Apr 2021 05:18:59 +0000
Received: by outflank-mailman (input) for mailman id 109473;
 Tue, 13 Apr 2021 01:00:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=biUC=JK=byosoft.net=byomail@srs-us1.protection.inumbo.net>)
 id 1lW7Pe-0006bm-QE
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 01:00:18 +0000
Received: from regular1.263xmail.com (unknown [211.150.70.200])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3f61924-4788-4730-b128-342b9c9eb904;
 Tue, 13 Apr 2021 01:00:16 +0000 (UTC)
Received: from localhost (unknown [192.168.167.69])
 by regular1.263xmail.com (Postfix) with ESMTP id 0C7AF1D8B
 for <xen-devel@lists.xenproject.org>; Tue, 13 Apr 2021 09:00:14 +0800 (CST)
Received: from mail.byosoft.com.cn (unknown [58.240.74.242])
 by smtp.263.net (postfix) whith ESMTP id
 P13167T139812237465344S1618275613190704_; 
 Tue, 13 Apr 2021 09:00:13 +0800 (CST)
Received: from DESKTOPS6D0PVI ([58.246.60.130])
 (envelope-sender <gaoliming@byosoft.com.cn>)
 by 192.168.6.13 with ESMTP
 for <anthony.perard@citrix.com>; Tue, 13 Apr 2021 08:58:59 +0800
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
X-Inumbo-ID: c3f61924-4788-4730-b128-342b9c9eb904
X-MAIL-GRAY:0
X-MAIL-DELIVERY:1
X-ADDR-CHECKED4:1
X-ANTISPAM-LEVEL:2
X-SKE-CHECKED:1
X-ABS-CHECKED:1
X-IP-DOMAINF:1
X-UNIQUE-TAG:<590428c32a38e4c3ec9272e0c2a4b8da>
X-RL-SENDER:byomail@byosoft.net
X-SENDER:byomail@byosoft.net
X-LOGIN-NAME:byomail@byosoft.net
X-FST-TO:xen-devel@lists.xenproject.org
X-SENDER-IP:58.240.74.242
X-ATTACHMENT-NUM:0
X-System-Flag:0
X-WM-Sender: gaoliming@byosoft.com.cn
X-Originating-IP: 58.246.60.130
X-WM-AuthFlag: YES
X-WM-AuthUser: gaoliming@byosoft.com.cn
From: "gaoliming" <gaoliming@byosoft.com.cn>
To: <devel@edk2.groups.io>,
	<anthony.perard@citrix.com>
Cc: "'Laszlo Ersek'" <lersek@redhat.com>,
	"'Jordan Justen'" <jordan.l.justen@intel.com>,
	"'Ard Biesheuvel'" <ardb+tianocore@kernel.org>,
	<xen-devel@lists.xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Michael D Kinney'" <michael.d.kinney@intel.com>,
	"'Zhiguang Liu'" <zhiguang.liu@intel.com>,
	"'Liming Gao'" <liming.gao@intel.com>
References: <20210412133003.146438-1-anthony.perard@citrix.com> <20210412133003.146438-3-anthony.perard@citrix.com>
In-Reply-To: <20210412133003.146438-3-anthony.perard@citrix.com>
Subject: =?gb2312?B?u9i4tDogW2VkazItZGV2ZWxdIFtQQVRDSCB2MyAyLzddIE1kZVBrZw==?=
	=?gb2312?B?OiBBbGxvdyBQY2RGU0JDbG9jayB0byBieSBEeW5hbWlj?=
Date: Tue, 13 Apr 2021 08:59:06 +0800
Message-ID: <00c601d73000$350a7510$9f1f5f30$@byosoft.com.cn>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG017LAufWq6diCCV2Qgjs5xaxIuAJhiU9zquNEocA=
Content-Language: zh-cn
Sender: "gaoliming" <gaoliming@byosoft.com.cn>

Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>

> -----=D3=CA=BC=FE=D4=AD=BC=FE-----
> =B7=A2=BC=FE=C8=CB: devel@edk2.groups.io <devel@edk2.groups.io> =
=B4=FA=B1=ED Anthony
> PERARD via groups.io
> =B7=A2=CB=CD=CA=B1=BC=E4: 2021=C4=EA4=D4=C212=C8=D5 21:30
> =CA=D5=BC=FE=C8=CB: devel@edk2.groups.io
> =B3=AD=CB=CD: Laszlo Ersek <lersek@redhat.com>; Jordan Justen
> <jordan.l.justen@intel.com>; Ard Biesheuvel =
<ardb+tianocore@kernel.org>;
> xen-devel@lists.xenproject.org; Anthony PERARD
> <anthony.perard@citrix.com>; Julien Grall <julien@xen.org>; Michael D
> Kinney <michael.d.kinney@intel.com>; Liming Gao
> <gaoliming@byosoft.com.cn>; Zhiguang Liu <zhiguang.liu@intel.com>; =
Liming
> Gao <liming.gao@intel.com>
> =D6=F7=CC=E2: [edk2-devel] [PATCH v3 2/7] MdePkg: Allow PcdFSBClock to =
by
> Dynamic
>=20
> We are going to want to change the value of PcdFSBClock at run time in
> OvmfXen, so move it to the PcdsDynamic section.
>=20
> Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3D2490
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Reviewed-by: Liming Gao <liming.gao@intel.com>
> ---
>=20
> Notes:
>     CC: Michael D Kinney <michael.d.kinney@intel.com>
>     CC: Liming Gao <gaoliming@byosoft.com.cn>
>     CC: Zhiguang Liu <zhiguang.liu@intel.com>
>=20
>  MdePkg/MdePkg.dec | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/MdePkg/MdePkg.dec b/MdePkg/MdePkg.dec
> index f4156920e599..8965e903e093 100644
> --- a/MdePkg/MdePkg.dec
> +++ b/MdePkg/MdePkg.dec
> @@ -2265,10 +2265,6 @@ [PcdsFixedAtBuild,PcdsPatchableInModule]
>    # @ValidList  0x80000001 | 8, 16, 32
>    gEfiMdePkgTokenSpaceGuid.PcdPort80DataWidth|8|UINT8|0x0000002d
>=20
> -  ## This value is used to configure X86 Processor FSB clock.
> -  # @Prompt FSB Clock.
> -
> gEfiMdePkgTokenSpaceGuid.PcdFSBClock|200000000|UINT32|0x0000000c
> -
>    ## The maximum printable number of characters. UefLib functions:
> AsciiPrint(), AsciiErrorPrint(),
>    #  PrintXY(), AsciiPrintXY(), Print(), ErrorPrint() base on this =
PCD
value to
> print characters.
>    # @Prompt Maximum Printable Number of Characters.
> @@ -2372,5 +2368,9 @@ [PcdsFixedAtBuild, PcdsPatchableInModule,
> PcdsDynamic, PcdsDynamicEx]
>    # @Prompt Boot Timeout (s)
>=20
> gEfiMdePkgTokenSpaceGuid.PcdPlatformBootTimeOut|0xffff|UINT16|0x0000
> 002c
>=20
> +  ## This value is used to configure X86 Processor FSB clock.
> +  # @Prompt FSB Clock.
> +
> gEfiMdePkgTokenSpaceGuid.PcdFSBClock|200000000|UINT32|0x0000000c
> +
>  [UserExtensions.TianoCore."ExtraFiles"]
>    MdePkgExtra.uni
> --
> Anthony PERARD
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#73954): =
https://edk2.groups.io/g/devel/message/73954
> Mute This Topic: https://groups.io/mt/82037830/4905953
> Group Owner: devel+owner@edk2.groups.io
> Unsubscribe: https://edk2.groups.io/g/devel/unsub
> [gaoliming@byosoft.com.cn]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20






