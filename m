Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B013E370AD3
	for <lists+xen-devel@lfdr.de>; Sun,  2 May 2021 10:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121101.228836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ld7rM-0001vm-43; Sun, 02 May 2021 08:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121101.228836; Sun, 02 May 2021 08:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ld7rM-0001vP-0c; Sun, 02 May 2021 08:53:52 +0000
Received: by outflank-mailman (input) for mailman id 121101;
 Sun, 02 May 2021 08:53:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Sey=J5=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1ld7rK-0001vK-55
 for xen-devel@lists.xenproject.org; Sun, 02 May 2021 08:53:50 +0000
Received: from sonic309-13.consmr.mail.bf2.yahoo.com (unknown [74.6.129.123])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b436ab04-d29d-4d1f-9ec8-624917360900;
 Sun, 02 May 2021 08:53:49 +0000 (UTC)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.bf2.yahoo.com with HTTP; Sun, 2 May 2021 08:53:49 +0000
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
X-Inumbo-ID: b436ab04-d29d-4d1f-9ec8-624917360900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1619945629; bh=RX+OVaklCNR9AyCjht1hbNKuOhLHjouMDPaxqOy3LcA=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=COk/UB3ggsXg/jTTminD+LWGjT42UvR/wtv4kXKQ/nS+jTIhUdDARkIbzZdvH4Vmw+odsqBu6bArqbAGx9M1etZ5P+s0QuFUD9u8Gv1Ypl8iMJrZl3gNWQY4QfULRWBpq1JGCSFkPpGubuk+yfLCQ4Ccyh/fI6ja8uwCvAx9yV6VuDkT5S2g4a0Gjx32ZAC+qhLEM4gjrqg3vczD86X6xzK9WskDtOkzSYsN8tpstXfLinXLSaMbDJX/gO7Bs3I7WghdffJNhyjy05zlCJ0BNX+KBHT12RJp+lnBXz16h7XapH7dE5aILGqoT+qilALIC9clybCBCLqsvCiyAJZgsg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1619945629; bh=4WEV62igjjlJZsTqsO/TS+ixU0UhcWXpOJNNs+pEGBG=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=oClQsep9d8FtJN2rwyR2hc3hjHbVQcn+aqtPbQ3eXl1JMwZtSpj0A4sJEX9pdrN6fo0rBd8Iu8IYI497SPTEyMmSvPy70EQ4MKWPMoM+5AasNdYwZgN1JsBmk5zZZ6qc891CjVmlgPxNvc6O5vFCOpLmGoulE4OZteDk+rNiMXnP0V2d19qdsHhmmEic/u5AKvQUUnRgAShLKSkyuhP3UqDKuYZQAfi+zMZLTvqhx4qei/RewTcLo2NICFPDiWX2IvNpYadsKPV/Ab+l7n+uiBiIPGlJIPoL7pgGl8mDYBeqer8DkWyLeooonGP+PRjz00gTDdK5ZEXknP8eX5bURA==
X-YMail-OSG: 6.Zd6qsVM1kQp8UhrSH_m.As0iGvQhpCKgBUKDuM5bHzRVquXFMr9tMSpeS9rOP
 H9R3AXLAzRQ82yRlfvFTia63hLMcZzXnoMmg_T_JP8r2ej9WitswpoBiIRSQS4Rcli15ft6l8wIr
 1Paj3w3ZOaDA9xNAv7GNFPhF8QVypBlxaj2F6GHfuYIT2.EKK0gkLNezUNB0D10JxBtMyflsZHv1
 PRhUrJwXT3c66HbBgKje21ZnXpDZnSO741QMPfK__ArHNtJECADdUcfZFsXqnu81lyI3CIjIUn9W
 S7Woc0vNIt.s3OqSL3py_kFY3zYY72p0Rwsiz6CDkid6MS4prXBSkWqgqMW4S9WRR05emEtn_oZ5
 J6jJVWc0WD06SRIN64r7F_Yhmv33IEhOrOH44UROT3gzLBzpspuliXm326jOpzvUP3IYmr2_mpaD
 yNf_XuLpTV3a_qcZ7n8RQJACfR7n0oryIpsQiOBaQZI799z07gCQQJ3X9UrZ6x6A6SeEufqgDJGp
 985OzaQ_0uWfVy.yOTIpQqQF7ygu3GwcEwEn5eUuTTHr2CLxRKopynhkjhlUCkHA0a6jMTQZFQP4
 PU54UcnKXDXAdAr2xc3djrx9x4c3LdjHHrfmt14jU9NjJ5c0SiamAOqpmewz_UyZY8ZbbNKrUC9Y
 _xVZ3RgWBSEQNspU8RX6NIgB3QEwMRx9PfQgMB.heQiFzto4YLheLYCdiI_ZA0k56LDVRtGCFCyB
 GElNG00zRMTGZC220mnJy_Zw7h7m.cBggOb5FA.QCXvbnROGs9vchRsrNvrvwHe_ZtDG0xnbD7he
 88TyXwOD2lCUlYLTsb7_NBmufbUwXpe6uYr0DFEaDDMwViFrezMcV_TCR7IdiA0kHwAgaDA0d4hN
 qntWgvQNS2dwKYx7TFCHuO5X4ZXWzN29LJxoxzdiwGRWW8e.fkc8ih1.ZEt3M49f7n9zNN7xU.yr
 cbUhRLgqBbV9xKR3544NvzjbqIZL3i5reV41gI0LH0R0pewEGf_R4r2hWg7Jqr6ZBneQ8A0sOmik
 YBWQKncvb6DNCN.YqLM2_p.ckN_tdV0XleaZ1wefA9JasVVqHk4l33vX7thr1ChqkQtOc.z4Ygs.
 rMzyjNd0ABvbHR8VsEMB7z5xFDMkB_ei_b70lSXdqazt0.TMgrRv9jMeoQo3h2598B3_u5FNe9xF
 N_nVDTyAGpeVoSV7t0ymV7D2NnSUxcL8yp.MBqdNgC9CgpN_5v0y884y2zWILg5DQ6qh4lhWX_DP
 fh2Lt8SHSkz11mdKDd7iymKJEsI8nbf_Rfvw8UncuRuwfFFfEJz5PGvf1FAVhhZV4J4Md6FBBJuY
 YKcNl8O9Vwh3PyCUVHSt48I00IVh_5lv5AtTFLgIsF5h5JIisW0EkSSrsJNCV_cO.h8eLVM_L.Ws
 NQ3iC13OYvpKLKjVF7ienciwqzdDwBwukrQK7hC8x2NFfTGrOhboDkfp8M82bwbb5vHqxtcJVl7W
 gtmKsE50mASpvXSXq87wtpK0aFZzGY.MHXLhle4Xd4pFvKZd9AwZ1ulxvYuErWNMbNojEVbfRyBS
 WAusmqIstQ747pNveuC9_F282XeQcr_8mH4A_RnzEW5aUXo3JKVE7wFhsT.E_fx1C33h9gsGw17n
 ygGllPbUYBJlc0BklpXB1yi7zK_ohwaRUKGaT0IHchcaF8jU4QrGgFGKeFpDvX60_bk9OhtUEFwa
 2vXmhQrfxbCtEt6j4XNOW0WSM.48yPXOR5ydgz3DKIcC0fQZOP60dcxh7C36N_Nzti_WNChaE_dg
 751B1kUS5A5COm1_Qz2dU6f2bWHGFWKGuM.ZFFQYOWnH2GaaPRsgBBC3kkOf0vKhlP4t10MIVJfu
 Ut2SPfG_q2uTbvogUDo4snVXtsHzBZsZeqDY_drr_Y32xrD9PlDhgfpRe0WDJI6LjRHbYjdtZ02.
 T5WSnQGiiq0kpnVf9yUGvbiEMCYixG93Ng3KLN6ENJLAm.ezccsWaz.1rHeJR.r0sMxhftOL1KBz
 xu.FMRv_Qw9M8iVM8Zp98RL.mrQByLHsdnWONfqjWuaLVhr12SCGhrh2FJNy20RP6qDH_cSbdaB1
 4I1E0LDqtPSyXxaG86JkuQcfuImsHsUahqdCTfrrMgcjYNXygjoh4LpfgQk2NhrELFI7YjhlESmk
 1SaPHoSrVw9D1Zk9rskGp8X6kxBptTN6C17nMB2Ut0MQEIq4qup8hfAXaa61sCvR13BnDzEJnIQF
 K7KC6zKBo65UtDe7nGbkF2impRiKa5qYhgtjziZ3OwTXUkJaDPD0Cdsj3xVc6NNx2IBkufoBZpYU
 86uINpG5HfQPvumewDaOQXbKGO7r8j60tAPma0mnONrUHTSU5FKnaEMuiNRvtCvf.VupW0U9S8q6
 DKW.W4ug_YgoBxvhX5XMNm.YKp2xHBl39PzjNrQdbYgazcDpDNftw1Rd3y3_s9S69Ctmc661uuca
 tdPkNj7on2b9nP.VRLSbX6xQvcDpTEkECH6TpbPh8YNSsHphPDjc-
X-Sonic-MF: <hack3rcon@yahoo.com>
Date: Sun, 2 May 2021 08:53:40 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: TMC <tmciolek@gmail.com>
Cc: Xen-users <xen-users@lists.xenproject.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <795375038.1654154.1619945620880@mail.yahoo.com>
In-Reply-To: <CAA3FNtPpz=4dwymk3+YeB+ZCOYYo9TirFqdjrf+qgSL39mBWYw@mail.gmail.com>
References: <314217522.1538685.1619859473008.ref@mail.yahoo.com> <314217522.1538685.1619859473008@mail.yahoo.com> <CAA3FNtPpz=4dwymk3+YeB+ZCOYYo9TirFqdjrf+qgSL39mBWYw@mail.gmail.com>
Subject: Re: Xen and Microservices.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.18138 YMailNorrin Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36

Thank you.
How about Unikernel?






On Sunday, May 2, 2021, 11:46:01 AM GMT+4:30, TMC <tmciolek@gmail.com> wrot=
e:=20





Jason,
containers, like Docker and kubernetes are designed to let you sandbox/isol=
ate one application or one service... without having to also host an operat=
ing system for each container.

=C2=A0Hypervisors like XEN are designed for operating systems, not single a=
pplications.=C2=A0

Hope this helps

Tomasz

On Sat, 1 May 2021 at 18:58, Jason Long <hack3rcon@yahoo.com> wrote:
> Hello,
> Why microservices use containers like Docker and not Hypervisors like Xen=
?
>=20
> Thanks.
>=20
>=20


--=20
--
GPG key fingerprint: 07DF B95B DB58 57B6 9656=C2=A0 682E 830A D092 288E F01=
7
GPG public key available on pgp(dot)net key server


