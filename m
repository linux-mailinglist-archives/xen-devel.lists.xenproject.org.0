Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F026C047A
	for <lists+xen-devel@lfdr.de>; Sun, 19 Mar 2023 20:40:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511663.790764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdyrx-0001an-0K; Sun, 19 Mar 2023 19:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511663.790764; Sun, 19 Mar 2023 19:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdyrw-0001Yp-St; Sun, 19 Mar 2023 19:39:04 +0000
Received: by outflank-mailman (input) for mailman id 511663;
 Sun, 19 Mar 2023 19:39:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u/8N=7L=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1pdyrv-0001Yj-GV
 for xen-devel@lists.xenproject.org; Sun, 19 Mar 2023 19:39:03 +0000
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1a58aa1-c68d-11ed-b464-930f4c7d94ae;
 Sun, 19 Mar 2023 20:39:00 +0100 (CET)
Received: from [92.76.123.191] ([92.76.123.191]) by web-mail.web.de
 (3c-app-webde-bap20.server.lan [172.19.172.20]) (via HTTP); Sun, 19 Mar
 2023 20:38:58 +0100
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
X-Inumbo-ID: b1a58aa1-c68d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679254738; i=tachyon_gun@web.de;
	bh=9N7Ozq3LYtqZ2FpsXbic/jSOCSxsgQR9JFYYA0KWP/Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VjA6iXvd3emwR9aPx3uhCotXBYI7MFI4MJ5v0QcCZtTqRudaq/PHCD3oTYvHjB2cV
	 MPM+yo/FdgzPjOqC67t6MPPZr+mIurl3IgzA5kjcidp/btF2aMfSXpg9XSyiJgj4J1
	 HBZTqjJrkRGcUHtamTUvF5sINysxqSUd76hedYON1H5b/gv1U1d9Xt66Y6mdsbEpr5
	 5NpJKEPPLq51m/kn6yB47AIpl5UxRf0LvIBVr3ec35xEW+dJIghIUSVGvdr6fGJjqt
	 KByEkxnyxl12CAxX+lwpmKKqCF4Dn52hIwr9/ViLbeZFKYuAt5eUqm0E0yU7nRSMg6
	 DLC+AHkkCmshw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-b7bc2797-26a7-455a-8080-8d33234171c9-1679254738309@3c-app-webde-bap20>
From: Denis <tachyon_gun@web.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Aw: Re:  Re: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera,
 regression from Xen 4.0.1
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Mar 2023 20:38:58 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:DfhVVStlaMo+T3RqVjxv3aeqrbUijAcIie4LApgd6Q+XjfJP2cuml7MSD34d+9lKjKdKn
 UVoj3gTN89Nzt7jGHXuo9CRA3sHgfY8FIEEumDLBoXAXpT3HIe1SuCHXS+AlsrRsIvmYL5obXWGG
 J7R+WZYehoPRRLTJ5bqVo4WnF2i3vhalxPIxKGBaBhLYUWffNZVKC0FfJhmOqIT7thZeb49AzjIA
 7oeI5ujt4H5rHa+qMTR+PWjJhMFNEFunNjhIyxbsuggurJFAR+JSWlQVEL4PEDWW9UbNNZLLrmpG
 PA=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lcgYRYfCrlY=;Y1ytJ4wDOXNw/zAdj43Cf6h7vzl
 ZvzvvNsseX4yYv/Tc9OqeUMJv8gnsXvzLeYyZ4QntZJ8AuuVZDK0EA6LfmUijJohawDt0EDMe
 VI61kJVIqD4fWWORq1ayDbJZjEWH8oRX+9qMMXh3lQCKhXA+pdgQxP2xoL7uUqfWLUTIjppBT
 h/GfCTQIHZDbXuXyvcCVO5S5/P/j5By4W+zlp57q3c9MqPwBP4sBON0m/OLWnmE23wCDXFvol
 w3zWDd/7HnWWTYIMFmnEojDU3xEuUFdXqJaY1zJfZUsy/1O2zlmjyeeTr5gOyRAOx12lIlyhS
 0p1sZ0tdCuwuVIFDEj9iifwdtYMUeYMpV5hMwFmZnskgeFnbucsh29D2KyJ5eD8ndlzODUj6Y
 t4HuaorEDqU3jXf7BIzO99oyoEKA1iNic3a7zR8BWSJdDrCOBRCJOS91PGFX8TnW29/R7tNHf
 o1qpQaIhKn+R+Vna61CvQt6h2dXhNUtf/gyLGkPSna+21yGCbcPh7uvVYiNzJ6tHzUOcXD14X
 Zmrw/4Gg86vINyuL5CRTsuxPHp5dfHdQqWHM7enE4L4LQNMaxZQVZznoLXHPSi8YLzVIQLEBG
 yFZzJ3HA25iJ9JpPe+4un1nb3cPMDrY5y9KOIhFmjcD/bIOTXckytpll831vhe1ctNP0h07HC
 4WCsWrzYCzVZpZXwUMrfdoay1fk3zBSZYmZzIt3E1D+zP1u50IKLz4c8C1sBG6vhfo0zFBSP6
 0mH6Do2px9mRG6xHRR8s0FOnZ6V9G8kiv+z0okiodChOXk9j+AUawfqKNtt9zxa9xo0Hc+bI0
 JZRohhzzwPrq5xJzIsbZyQW31elrSBuMSWDZvP+AIq1A4=

On 14=2E03=2E2023 16:11, Andrew Cooper wrote:
> On 14/03/2023 2:53 pm, Denis wrote:
> > On 14=2E03=2E2023 07:37; Jan Beulich wrote:
> >> On 14=2E03=2E2023 02:15, Denis wrote:
> >>> On 13=2E03=2E2023 10:36, Jan wrote
> >>>> On 10=2E03=2E2023 21:50, Denis wrote:
> >>>>> Should I test something else?
> >>>> =2E=2E=2E there was no request for any further testing here, for th=
e moment=2E
> >>> ah=2E=2E=2Esorry, going by "Would be nice to have this confirmed for=
the system
> >>> in question, i=2Ee=2E without Xen underneath Linux" I thought I coul=
d test
> >>> something which might help shed some light on all of this=2E
> >> Well, yes, that Linux-without-Xen test would still be useful to have
> >> results from=2E I didn't account for this in my earlier reply because
> >> I had asked for it before already, and I did take "something else"
> >> for meaning anything that might have turned up as useful from the new
> >> data you had provided=2E
> > What tests could I do or what info should I provide to help?
>=20
> Can you please rebuild Xen with this patch:
>=20
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> index 2fdebd2d74c9=2E=2E747eae25f56c 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> +++ b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> @@ -1033,7 +1033,7 @@ static int __init parse_ivrs_table(struct
> acpi_table_header *table)
> =C2=A0=C2=A0=C2=A0=C2=A0 const struct acpi_ivrs_header *ivrs_block;
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long length;
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int apic;
> -=C2=A0=C2=A0=C2=A0 bool_t sb_ioapic =3D !iommu_intremap;
> +=C2=A0=C2=A0=C2=A0 bool_t sb_ioapic =3D 1;
> =C2=A0=C2=A0=C2=A0=C2=A0 int error =3D 0;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(!table);
>=20
> which should cause the behaviour to revert back to that of Xen 4=2E0=2E1=
=C2=A0
> (i=2Ee=2E it will fully ignore the checks relating to the southbridge io=
apic)=2E
>=20
> Confirm that with this, and booting Xen simply with `iommu=3D1` that ful=
l
> DMA remapping and interrupt remapping is considered active=2E
>=20
>=20
> Then, can you play around with passing the soundblaster through to VMs=
=2E=C2=A0
> Looking at the LSPCI you provided, it only supports legacy line interrup=
ts=2E
>=20
> Does the device work fine, or do you get a bunch of errors on `xl dmesg`
> about IO page faults (which is a generic "IOMMU said no to something"
> message)?

Sorry, it took my awhile to get it done=2E

The relevant things are enabled again, passthrough works (even the PCI Aud=
igy2)=20
and the devices are recognzied in the HVM domU=2E

As you suspected, there are a few IO page faults at the end of the boot pr=
ocess
(from my limited understanding it's maybe related to=20
"00:14=2E0 SMBus: Advanced Micro Devices, Inc=2E [AMD/ATI] SBx00 SMBus Con=
troller (rev 41)")

I'll attach the "xl dmesg" output file=2E


Denis

