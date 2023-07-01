Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708CB744A61
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 17:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557898.871643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFctO-0001uj-RC; Sat, 01 Jul 2023 15:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557898.871643; Sat, 01 Jul 2023 15:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFctO-0001rN-OU; Sat, 01 Jul 2023 15:52:10 +0000
Received: by outflank-mailman (input) for mailman id 557898;
 Sat, 01 Jul 2023 15:52:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDMf=CT=foxmail.com=zhang_shurong@srs-se1.protection.inumbo.net>)
 id 1qFctN-0001rH-HD
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 15:52:10 +0000
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com
 [203.205.221.202]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37959b9b-1827-11ee-b237-6b7b168915f2;
 Sat, 01 Jul 2023 17:52:03 +0200 (CEST)
Received: from localhost.localdomain ([116.132.239.178])
 by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
 id CEC3EC5C; Sat, 01 Jul 2023 23:51:44 +0800
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
X-Inumbo-ID: 37959b9b-1827-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1688226707;
	bh=Ou1vBhUK87QUl5Q7dSsJPlf9T8VgS2NFf1k7CSQDkDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=InzfP/PjalXsy1+062ZbHDH7LNSpAlZb/OGrkFlT6ZDcVxJ4s6E21Y0Jh5QIZW12E
	 8Q6ikCFwk6a7xFshJF2ClUrLspmGWaAzCwUa7DR26CeBpg0R82CYdvizzsxYzyHwiD
	 EroHbCc8jD++VaWGfM/AMg/i+2aX4+bzXi2cjbQE=
X-QQ-mid: xmsmtpt1688226704te5jbpodh
Message-ID: <tencent_62EE5604188B87B14220EA91C4CD8D4C2D06@qq.com>
X-QQ-XMAILINFO: MBf0q8AysQnB9O7sZj5jgSNUnizJ7WyO6idPxUw5LGBRfADxCatimjS8frcO53
	 OYG4ZoWqWzofoy5ziRmfTupTo+9SoOjDeAa2XX9YKT/v6+RqbSpF9nfPC/dGXC4N5shyi5gUCwOT
	 onoHlWGeP9TLE3B6807xVCxkhTgd3gCIDZMm2wgDX5qq7cBSJjjDTJD+DhgAIWj3ijzYA8OazRjZ
	 hCcsv3ngIQWuWZ0JSLmHwZ0UTSQCQ+9gatNz0ByQexx5wiifL6/U5IQ7aBk3ePXUrbKuGItZ/hth
	 J0HU4mV5UX8OkRfpsjypjuHOye9svDBiMghR4ItEpq2kZmcX/kuf80ic6deCMBP6ElKiIBP9ff1M
	 4lOyjJfPUA9x/gXw+ENR6TGd92i29BwXM/DgZkKAqY8DUCD/yZ3yW2123KA9L3yVAbe94o2uKMzD
	 OMRE+Re8ojaYsncs3JXQn+bYECgh2lMahvq6+QCkbEuT7Xp8xqlQ5jQgmTO2RvZWIJaOSknu1Jnr
	 9zgUDCBhqd0kM0AVy2PG2RsWQYFXmpk/nTTyhbSMz0mcugnZurXaV+Zalva/b+Z1rWGRSlmaHFG5
	 Nt4yPNg2xE5TQM5F0EOzRFkYY3z/EX45mBDeOQOayUqoRYNAr1XMUUeLW/1K4uMQ5vyErjZktHTT
	 W5/dU7km1Hhw9eV1NMOvr6ebUdby4tj5Cre0paw+bqbVT+FxVEZ10nqTEPGgnPFF7CU7dg6ldQ+N
	 BSVtP0u4M1PgcSaSx9O3vGFeCPowRXKZFUVilSO/Kg+reSKEHWpHGSvM931iETynrTcFIgaMb5sV
	 uNWHwK/TtGkrB72YjZYAaZ4s/r91k4vXQb4o3gxi1hfa9DP4mGcVtTTZHXL2ujyaM38vMmB8EbF9
	 Ys7lowKPVSCv27wAE8K5uFPml5MLKQ+1/R2VHsVSEI06yNT6ndWmX2YHu27XEtRV/qRxg7QRs8mF
	 29XvdMS3b9UjAGJ9Pz/mO2TCWkoQvKZvrnJAhicjk1Ja1cW6BfCg==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] xen: fix potential shift out-of-bounds in xenhcd_hub_control()
Date: Sat, 01 Jul 2023 23:51:43 +0800
X-OQ-MSGID: <4825193.GXAFRqVoOG@localhost.localdomain>
In-Reply-To: <2023062628-shame-ebook-56f2@gregkh>
References:
 <tencent_15DD79B42AD8A0D64A7CDC24D4FE6C85800A@qq.com>
 <1c8ff405-2bfe-37ff-42ba-aa4f81853475@suse.com>
 <2023062628-shame-ebook-56f2@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

=E5=9C=A8 2023=E5=B9=B46=E6=9C=8826=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 CST=
 =E4=B8=8B=E5=8D=881:52:02=EF=BC=8C=E6=82=A8=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, Jun 26, 2023 at 07:48:05AM +0200, Jan Beulich wrote:
> > On 25.06.2023 18:42, Zhang Shurong wrote:
> > > --- a/drivers/usb/host/xen-hcd.c
> > > +++ b/drivers/usb/host/xen-hcd.c
> > > @@ -456,6 +456,8 @@ static int xenhcd_hub_control(struct usb_hcd *hcd,
> > > __u16 typeReq, __u16 wValue,> >=20
> > >  			info->ports[wIndex - 1].c_connection =3D=20
false;
> > >  			fallthrough;
> > >  	=09
> > >  		default:
> > > +			if (wValue >=3D 32)
> > > +				goto error;
> > >=20
> > >  			info->ports[wIndex - 1].status &=3D ~(1=20
<< wValue);
> >=20
> > Even 31 is out of bounds (as in: UB) as long as it's 1 here rather
> > than 1u.
>=20
> Why isn't the caller fixed so this type of value could never be passed
> to the hub_control callback?
>=20
> thanks,
>=20
> greg k-h
Although I'm not knowledgeable about the USB subsystem, I've observed that =
not=20
all driver code that implements hub_control callback performs a shift=20
operation on wValue, and not all shift operations among them cause problems=
=2E=20
Therefore, I've decided to fix this issue within each driver itself.

=46or example, in r8a66597_hub_control, it will first check whether wValue =
is=20
valid (always < 31) before the shift operation. In case of an invalid numbe=
r,=20
the code would execute the error branch instead of the shift operation.

switch (wValue) {
case USB_PORT_FEAT_ENABLE:
	rh->port &=3D ~USB_PORT_STAT_POWER;
	break;
case USB_PORT_FEAT_SUSPEND:
	break;
case USB_PORT_FEAT_POWER:
	r8a66597_port_power(r8a66597, port, 0);
	break;
case USB_PORT_FEAT_C_ENABLE:
case USB_PORT_FEAT_C_SUSPEND:
case USB_PORT_FEAT_C_CONNECTION:
case USB_PORT_FEAT_C_OVER_CURRENT:
case USB_PORT_FEAT_C_RESET:
	break;
default:
	goto error;
}
rh->port &=3D ~(1 << wValue);






