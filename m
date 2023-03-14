Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285576B8778
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 02:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509403.785091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtFs-0005Tu-NX; Tue, 14 Mar 2023 01:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509403.785091; Tue, 14 Mar 2023 01:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtFs-0005S3-KV; Tue, 14 Mar 2023 01:15:08 +0000
Received: by outflank-mailman (input) for mailman id 509403;
 Tue, 14 Mar 2023 01:15:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxk=7G=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1pbtFr-0005Rx-5G
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 01:15:07 +0000
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a69ee17f-c205-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 02:15:05 +0100 (CET)
Received: from [185.71.171.210] ([185.71.171.210]) by web-mail.web.de
 (3c-app-webde-bs22.server.lan [172.19.170.22]) (via HTTP); Tue, 14 Mar 2023
 02:15:03 +0100
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
X-Inumbo-ID: a69ee17f-c205-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678756504; i=tachyon_gun@web.de;
	bh=XY2+nkIiZkcoQyfuUeewwAzpVCKrCOwHxQeazcGTW70=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ifp4QY8OnuGFxuBaDH4HMPJrJy+HwGww5/Ytf6Fu1CQQLwqkQUc4ZvugbRaHISVY3
	 C2k41xhi1IOS+v0qnpNjRo9oxlGvPshTYvUMh4M8HdT4lt9wnBH2XAdZrZXvxLFMOc
	 damDMIHx6DYH9oQHubQgiARL/kwZBNDaII5lirOO9T7fNnvvmGyzuxtd+PYXqQMqK1
	 MfN23YHhs+MFuy59XM7wMvIMlocNYNmIdxS6VkW3vOGNR+rcR7u0mcJySRKt/kHUA/
	 u2tSBba5JdJCFLzkBkGYxm/p2v5VFb4eZJyC8SeNhVcNWxCO5OmanYVJUTD9bAUxrV
	 iA1cYE4ZEQ2VA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
From: Denis <tachyon_gun@web.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Aw: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from
 Xen 4.0.1
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Mar 2023 02:15:03 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:N0m0/xAO2QlHWb6XSuTrCEUSww9RfRIN1+Yojk8CQFhQu7jGmq4ktubJGs5ItIDXgCfIx
 a8kbTbfgp5zgbbMNRuZvsUYYUAOpGEyIvTVW1t/WL4XMDGHlhdebwYVzhSRSSuKNBam1c0XfR/iy
 d5ZeYBfOPWbLQ6WuYLOhmFSqnKr0ot0dIYY6Aw7JY2vJojO7MwinT42p7f5tAOFcHDLp3M9wDu88
 zGMuaIECEfj2ihlVfeDTTZEg5N3w3hO6d984AQtR0c/FreVB4duwGhcx2koRbvee1xQsnlwXk+xK
 Qc=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RtjRjOo5Zdo=;Zl9E5gBCLGGCt2GosUOt1CRqfR3
 9kA8QdLB2eGvonCy8abJRUelmERFBFI3Z0JpLyyyUB5IL9P8Kh8O+IYTA9tVjNvJww2wt2TVR
 v/N+pQCb2lok/PFWMTaglRNrxGACDhBnoomlVgtYX4BelXjAHCkEr5Yjb72p+QZmIlApkf/bf
 LWQo1ZXWMOZs8QSykt4IlzJUfOFdGazO8oCjeOAdm7chVmzQKcueUKSC8vXMZH5ItnIY+2w9l
 +xZmEhvMWNZHHJbe1Y5d7GdAzw2LdN1wSE4oLnRE0wbwi1AtTOpXunAxULUP3Ud0H2SfSbFUG
 KLVPcfYDr8X865zvgFjHagq2U+NkxefDqm8SZ77BjEuLkEotwx7bjPKZrVFXvM+5FkQdK14C2
 ylwHoHe1d5dDAKdoVNf5E1Mk8pn+iY71LWM+RCJV2yD7loRwAkTx4bhiTZtsQV/5EsFgK258B
 7yAKmZ9/2o8jhvSXQ7sda5Y+k27gVbNr+bHn14HovnTKG0v2T3MUun6m08TjAfGXViED9nFAY
 E4kTB4epvbxw4Zbq1qf/s9AgnFvQfnoO5A87zCYXWNMlrpAuZgZ8m3+mnbxK9OJuUcHqnUGjd
 bgDFRwcHzKiJubXuP6umGp6uDJ/zpvK3lYGAnuqBOqgqSnKFOkzuNjbibECZ3A/3QpdqltN3a
 iowoo8GEMyo5Z3lT/iajZ2YMQhkHt1WycQKRLfR9Ju8REzh17pjYQ+pjZzv2kQjqHdfhHiAWF
 UGJV0x9jwWKucpkJDSR5GvElQGdZViOKWrg+o0+eFiTqH1UnaWM7SDKh/MOGbnMzCG7/B1+F3
 JfgOnAuUEdRYSnuxxtJOWnaA==

On 13=2E03=2E2023 10:36, Jan wrote
> On 10=2E03=2E2023 21:50, Denis wrote:
> > On 10=2E03=2E2023 09:51, Jan Beulich wrote:
> >> On 09=2E03=2E2023 21:37, Andrew Cooper wrote:
> >>> On 09/03/2023 7:34 pm, tachyon_gun@web=2Ede wrote:
> >>>> A short snippet of what I see when invoking "xl dmesg":
> >>>> =C2=A0
> >>>> (XEN) No southbridge IO-APIC found in IVRS table
> >>>> (XEN) AMD-Vi: Error initialization
> >>>> (XEN) I/O virtualisation disabled=C2=A0
> >>>> =C2=A0
> >>>> What I would like to see (taken from Xen=C2=A04=2E0=2E1 running on =
Debian
> >>>> Squeeze, in use since 2011):
> >>>> =C2=A0
> >>>> (XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-2=
3
> >>>> (XEN) Enabling APIC mode: =C2=A0Flat=2E =C2=A0Using 1 I/O APICs
> >>>> (XEN) Using scheduler: SMP Credit Scheduler (credit)
> >>>> (XEN) Detected 2611=2E936 MHz processor=2E
> >>>> (XEN) Initing memory sharing=2E
> >>>> (XEN) HVM: ASIDs enabled=2E
> >>>> (XEN) HVM: SVM enabled
> >>>> (XEN) HVM: Hardware Assisted Paging detected=2E
> >>>> (XEN) AMD-Vi: IOMMU 0 Enabled=2E
> >>>> (XEN) I/O virtualisation enabled
> >>>> =C2=A0
> >>>> My question would be if this is=C2=A0"normal" behaviour due to olde=
r hardware
> >>>> being used with newer versions of Xen (compared to the old 4=2E0=2E=
1) or if
> >>>> this is=C2=A0a bug=2E
> >>>> If the latter, has this been addressed already in newer version (4=
=2E14+)?
> >>
> >> No, the code there is still the same=2E The commit introducing the ch=
eck
> >> (06bbcaf48d09 ["AMD IOMMU: fail if there is no southbridge IO-APIC"])
> >> specifically provided for a workaround: "iommu=3Dno-intremap" on the =
Xen
> >> command line=2E Could you give this a try? (As per below this could b=
e
> >> what we want to do "automatically" in such a situation, i=2Ee=2E with=
out
> >> the need for a command line option=2E But you then still would face a
> >> perceived regression of interrupt remapping being disabled on such a
> >> system=2E)
> >>
> >> The other possible workaround, "iommu=3Dno-amd-iommu-perdev-intremap"=
,
> >> is something I rather wouldn't want to recommend, but you may still
> >> want to give it a try=2E
> > =20
> > Thanks for your reply=2E
> >=20
> > I added the lines you suggested and it seems that "AMD-Vi: IOMMU 0" an=
d
> > "I/O virtualisation" is enabled again=2E
>=20
> Good - that'll have to do as a workaround for the time being=2E
>=20
> > There are only minor differences in the "xl dmesg" output=2E
> > In the one with "iommu=3Dno-amd-iommu-perdev-intremap",=20
> > the line "No southbridge IO-APIC found in IVRS table" is listed=2E
>=20
> That's as expected - the message is issued as a non-error one in this
> case=2E
>=20
> > Though I yet have to test a HVM domU with passthrough=2E
> >=20
> > I'll attach the two "xl dmesg" files and a third one from the old vers=
ion of Xen=2E
> >=20
> >>>> I'll attach some log files (hypervisor=2Elog, dom0=2Elog, xl_info=
=2Elog,
> >>>> lspci_vvv=2Elog, acpi=2Edmp, ivrs=2Edat, ivrs=2Edsl)=2E
> >>>> =C2=A0
> >>>> Thank you for your time=2E
> >>>
> >>> Let me braindump the investigation so far before I forget it=2E
> >>>
> >>> Xen requires that there is an IVRS special-device record describing =
an
> >>> IO-APIC 00:14=2E0=2E  This check failing is the source of the "No
> >>> southbridge" message, and the cause of the IOMMU(s) being turned off=
=2E
> >>>
> >>> The MADT and IVRS tables agree that there is one IO-APIC in the syst=
em,
> >>> but that's the northbridge IO-APIC, not the southbridge=2E
> >>>
> >>> The block diagram for the southbridge does have a PIC/IO-APIC as par=
t of
> >>> the PCI bridge, so honestly I was expecting the MADT to describe 2
> >>> IO-APICs=2E  But OTOH, I could see this legitimately not existing in
> >>> configurations where the PCI bridge isn't in use=2E
> >>>
> >>> `xl dmesg` does have a few unknown irqs, so there might be something
> >>> down in the southbridge really generating interrupts=2E  Or there mi=
ght be
> >>> a IRQ misconfiguration elsewhere, and this is just a red herring=2E
> >>>
> >>> However, a consequence of the northbridge and southbridge being sepa=
rate
> >>> chips means that all southbridge IO is fully encapsulated by the IOM=
MU
> >>> in the northbridge=2E
> >>>
> >>> So irrespective of whether there is ah IO-APIC operating properly in=
 the
> >>> southbridge, and whether or not it's properly described, I think Xen=
's
> >>> insistence that there must be an IVRS special-device entry for it is=
 bogus=2E
> >>>
> >>>
> >>> Furthermore, Xen's decisions are monumentally stupid=2E  It takes a
> >>> specifically safe (IOMMU-wise) system, and because it can't figure o=
ut a
> >>> partial aspect of interrupt handling the southbridge, decided that t=
he
> >>> system can't be safe (a false conclusion) and turns the IOMMU off fu=
lly
> >>> to compensate, which makes the system concretely less safe=2E
> >=20
> > Also, thank you Andrew for bringing this in=2E
> >=20
> >> So this touches once again the area of the fuzzy split between the IO=
MMU
> >> being disabled as a whole (meaning DMA+interrupt remapping off) vs on=
ly
> >> one of the two being off (where presently we are unable to turn off j=
ust
> >> DMA remapping)=2E Indeed the original Linux commit, which our change =
was
> >> inspired by, results in merely interrupt remapping getting turned off
> >> (afaict), and that hasn't changed=2E (Would be nice to have this conf=
irmed
> >> for the system in question, i=2Ee=2E without Xen underneath Linux=2E)=
 It would
> >> certainly be possible for us to do so too - it might be a one line ch=
ange:
> > =20
> > Could you elaborate on that one?
>=20
> I guess I'd need to know what you're missing; the entire paragraph was
> intended more for Andrew and Roger (and others who are interested on the
> "development" side) rather than you=2E Specifically =2E=2E=2E
>=20
> > Should I test something else?
>=20
> =2E=2E=2E there was no request for any further testing here, for the mom=
ent=2E

ah=2E=2E=2Esorry, going by "Would be nice to have this confirmed forthe sy=
stem=20
in question, i=2Ee=2E without Xen underneath Linux" I thought I could test=
=20
something which might help shed some light on all of this=2E

Denis

