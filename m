Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E5ACBD33
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 00:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003829.1383436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDVH-00067q-U6; Mon, 02 Jun 2025 22:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003829.1383436; Mon, 02 Jun 2025 22:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDVH-00065Q-R4; Mon, 02 Jun 2025 22:19:35 +0000
Received: by outflank-mailman (input) for mailman id 1003829;
 Mon, 02 Jun 2025 22:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nif+=YR=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uMDVG-000651-HK
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 22:19:34 +0000
Received: from 11.mo581.mail-out.ovh.net (11.mo581.mail-out.ovh.net
 [87.98.173.157]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5f536fd-3fff-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 00:19:28 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.148.12])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4bB7YW6vCFz1SPG
 for <xen-devel@lists.xenproject.org>; Mon,  2 Jun 2025 22:19:27 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-2249b (unknown [10.110.118.96])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A8CB8C3B95;
 Mon,  2 Jun 2025 22:19:26 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.100])
 by ghost-submission-5b5ff79f4f-2249b with ESMTPSA
 id +vF7GW4jPmjPbgIAM3Irlw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Mon, 02 Jun 2025 22:19:26 +0000
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
X-Inumbo-ID: a5f536fd-3fff-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-100R003952fb7fe-7527-41fd-b0a6-24c88fefecaa,
                    22913471B39E4060B5DF5B2870BF10C0EF5640C4) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Tue, 3 Jun 2025 01:19:04 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
Message-ID: <aD4jWNhq6e8JDGsl@MjU3Nj>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <cdd7b9ff21c81683ce2245bc2b5e0a7a87e51e3c.1747155790.git.sergii.dmytruk@3mdeb.com>
 <4896ab0b-f45e-43e9-bcee-f5496717eb2a@suse.com>
 <aDD0ZYM-PtV7NKVc@MjU3Nj>
 <8521480a-f14d-4ac4-826e-6ed066619070@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8521480a-f14d-4ac4-826e-6ed066619070@suse.com>
X-Ovh-Tracer-Id: 2553259515016229977
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkeekheculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=8e5dtdmFkMnglKi+LBQl4WKLgk8ttsJC8rX2ANw4oew=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748902768; v=1;
 b=XKxH5J6e8suG/iFxgf+lmAbEMGzb1BrjPfmUgsiX9oA3cZbWS/qNdAgIEMs2974ro/TQ6NSx
 9qCkrBDhP9055LQSzVO6A7sq+Q444YdNCPmLZJkyxG3u5ZaM8VK76rBI7+SWeVE5YZtOv90Vfsi
 4IGAUPVhefifneiJfO58BpuiJSoW+9I3RGFsIgcf8GQ9QPoihIY5jK6FqMU/cyqphuM/jvQJjZ9
 70D6jbMKxsPWJ5oo+G2w3lOOoSl0uxPi4nTApMDnXT4rHdGvk0aHVzO+QgbdmhFjSWiYLYT6IdF
 yZs/a51GdCYUHnHNiLy+gCjWzABIyzeqTAP0tlLZM7Svg==

On Mon, Jun 02, 2025 at 09:31:11AM +0200, Jan Beulich wrote:
> >>> +#define UEFI_SLR_TABLE_GUID \
> >>> +    { 0x877a9b2aU, 0x0385, 0x45d1, { 0xa0, 0x34, 0x9d, 0xac, 0x9c, 0x9e, 0x56, 0x5f } }
> >>
> >> I'm not sure this is a good place to put UEFI GUIDs. Considering e.g ...
> >
> > It's here because the GUID is related more to SLRT than to EFI.  I can
> > move it if there is a more fitting place for table GUIDs.
>
> It'll (at least somewhat) depend on where it's going to be used. A common problem
> when definitions / declarations are introduced without any use.

It's only used in xen/common/efi/boot.c (patch #20), so looks like it
should actually be defined there like the rest of GUIDs.

> >>> +/*
> >>> + * Primary SLR Table Header
> >>> + */
> >>> +struct slr_table
> >>> +{
> >>> +    uint32_t magic;
> >>> +    uint16_t revision;
> >>> +    uint16_t architecture;
> >>> +    uint32_t size;
> >>> +    uint32_t max_size;
> >>> +    /* entries[] */
> >>> +} __packed;
> >>
> >> If x86-specific, the question on the need for some of the __packed arises
> >> again.
> >
> > The table is used to communicate data from pre-DRTM world to DRTM-world
> > and is produced and consumed by unrelated software components that don't
> > necessarily pad structures the same way by default.
>
> How do other environments matter when this header is solely used by Xen?

Xen uses this header to read data prepared for it.  Packing is an easy
way to ensure the data will be parsed consistently regardless of the
architecture or software component which prepared it (i.e., a way to
enforce proper "API").

Regards

