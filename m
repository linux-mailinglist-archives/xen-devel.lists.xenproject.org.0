Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D11EF835
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 14:45:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhBir-0006lx-R9; Fri, 05 Jun 2020 12:45:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVi9=7S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jhBiq-0006ls-E4
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 12:45:20 +0000
X-Inumbo-ID: 698161dc-a72a-11ea-afad-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 698161dc-a72a-11ea-afad-12813bfff9fa;
 Fri, 05 Jun 2020 12:45:19 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vel0pPoaFd46hVvlqul1HNTdMuk/V3VM5eqeEQvXyDhgCvi0slzrDpYVB26bgQgoO/pmEx82s6
 5YqooUMzknCsIGYjQIXvP3UFRUuuFHq7DrjM3qIH8nwr4vkEMaInR1cjESpbOFIqtMB20QRJ2Q
 QvHuN7qrE/ty/0Blvq03c5xC7w6tzEIRXNXGU16uPOQEDxbRt/AADVeDh0GkTkEcijTe5vGRCe
 GjdjVo5en4ssYxQSg1rOfkl2ZvOhmpVpj0CJAg/ppAki3xz3dLAkqu5gFBxlfwGScVhLPqYMMn
 L+U=
X-SBRS: 2.7
X-MesageID: 19320157
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,476,1583211600"; 
 d="asc'?scan'208";a="19320157"
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <f22ce6e0-d80b-2fc3-586a-c030fa22b3e8@suse.com>
 <20200605120137.GF98582@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <38121217-988a-40e1-f220-4643652a8609@citrix.com>
Date: Fri, 5 Jun 2020 13:44:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200605120137.GF98582@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zLORsC50kkiBCzUXwngisULTRAa30TRIs"
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--zLORsC50kkiBCzUXwngisULTRAa30TRIs
Content-Type: multipart/mixed; boundary="wCLS4FvVOeyXnND98kb7g2fVrTH67g8jK"

--wCLS4FvVOeyXnND98kb7g2fVrTH67g8jK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 05/06/2020 13:01, Marek Marczykowski-G=C3=B3recki wrote:
> On Fri, Jun 05, 2020 at 11:22:46AM +0200, Jan Beulich wrote:
>> On 05.06.2020 11:09, Jan Beulich wrote:
>>> On 04.06.2020 16:25, Marek Marczykowski-G=C3=B3recki wrote:
>>>> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>> (XEN) d3v0 handle_pio port 0xb004 write 0x0001
>>>> (XEN) d3v0 handle_pio port 0xb004 write 0x2001
>>>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
>>>> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
>>>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
>>>> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
>>>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
>>>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
>>>> (XEN) d1v0 handle_pio port 0xb004 write 0x0001
>>>> (XEN) d1v0 handle_pio port 0xb004 write 0x2001
>>>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
>>>> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
>>>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
>>>> (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags 0x2 =
d6
>>>> (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags 0x2 =
d6
>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>> Perhaps in this message could you also log
>>> v->domain->is_shutting_down, v->defer_shutdown, and
>>> v->paused_for_shutdown?
>> And v->domain->is_shut_down please.
> Here it is:
>
> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_=
shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_=
shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d3v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 defer=
_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d3v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 defer=
_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_=
shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_=
shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d1v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 defer=
_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d1v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 defer=
_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> (XEN) grant_table.c:3702:d0v1 Grant release 0x3 ref 0x125 flags 0x2 d6
> (XEN) grant_table.c:3702:d0v1 Grant release 0x4 ref 0x126 flags 0x2 d6
> (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 1 defer_=
shutdown 1 paused_for_shutdown 0 is_shut_down 0
> (XEN) d1v0 Unexpected PIO status 1, port 0xb004 read 0xffff
>
> (and then the stacktrace saying it's from vmexit handler)
>
> Regarding BUG/WARN - do you think I could get any more info then? I
> really don't mind crashing that system, it's a virtual machine
> currently used only for debugging this issue.

I specifically recommended BUG() so it crashed cleanly and didn't loop
infinitely spewing into the logs.

=46rom the analysis so far, whatever is going wrong is going wrong betwee=
n
XEN_DMOP_remote_shutdown and the first bad PIO, so I don't think letting
the system loop further is going to be helpful.

~Andrew


--wCLS4FvVOeyXnND98kb7g2fVrTH67g8jK--

--zLORsC50kkiBCzUXwngisULTRAa30TRIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzzVJW36m9w6nfSF2ZcP5BqXXn6AFAl7aPlYACgkQZcP5BqXX
n6A7ABAAn9bkSaPLulmkahc0e0aEcANlpPYjLbqDEjj1ij8TEldfjfCmvVDrzFDo
j86sMPl39wSUD7rwdKOZo3g/ZCnFwXTBDIfQmjPWIXfJW8U2n32/wHr0xsE8SRXn
5hCCmjR5LOJY1Yr//hGScEy4hCGgbBlSe+eODVzTJZJKsVe3jcgmufofqoXDO8As
JpNwdq2npA3Y2eUvzQpKpUBfSkEci7ckVFjQojunM1FzB65ZUo5X2f4chPDCxM81
VZEaECCX4EtG9gPWElyQ0fkkJ9ySuSbFt4FcfWIxBvrYolc83bL7o1m/FXtehR95
XEj45jdIM0YQb5eWFKrfEpC1MImzItG7+7WSFmQUSTwfgf0FhslP0GXjttzh9Xwm
2ytEKDhzt/E38iwXpachegyKD/9oB9okF8zHpGopoSkiMqgaskyX4jGvN0KNrMBE
8tVQiQpRDGKFHQgauvy+bOvriUkXxOeiprShBexcfvQZleF6rb9hWvrpySUvu9vC
ZVedoitMS0wUnVJKd+918zJE352Xf83fWbab9olGmfRPmLB7eYVno/3ggHuwnuDs
ctp87H1rb0s1gPnuCJ5FmeIypihPooDbbPwHofIxNL41xZj+5Idshse/jNTMRO7w
pOU3/Gs7C4yqOzHUi+T6kqGlroyh2loHGd3jMiqd4O2wKAvRr4U=
=pxyN
-----END PGP SIGNATURE-----

--zLORsC50kkiBCzUXwngisULTRAa30TRIs--

