Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D7CA21603
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 02:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878830.1289027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcwhB-0003Qi-Tn; Wed, 29 Jan 2025 01:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878830.1289027; Wed, 29 Jan 2025 01:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcwhB-0003Oj-RA; Wed, 29 Jan 2025 01:16:45 +0000
Received: by outflank-mailman (input) for mailman id 878830;
 Wed, 29 Jan 2025 01:16:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wz9u=UV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tcwh9-0003OX-RI
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 01:16:44 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b211e3cb-ddde-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 02:16:41 +0100 (CET)
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
X-Inumbo-ID: b211e3cb-ddde-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1738113400; x=1738372600;
	bh=JdWJmHQbmjZeiqwUM39FyhLa0jEhfsyR5FX5P4UOsjk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=K1MCrKKojTfksrtf406ona7lDmZjSKw5kQfU9geiDHMCqcCbE4UF1o8oi34K8x4QO
	 7ohOaAlgV2wK7CSGs1kBch31Tgg7nNzrcxDvXvadiSO3D2RTI2rawbRmbB+W0ezVJx
	 E0yWY5WgueYLkvgJEhDzkmYFxWs0JBt42JtS5BT61gtqRdYjpuTMTmdFPELdypBrY/
	 tgqtZsQqz8obvwsuylCU5b6jQRiysMHp/sEC5Hy92v0vpuPBSEBmRpwqrE2frcBncD
	 basmYuI9m7jj4cR+l/HpouRTOxV0FYnoqpvHq2qRIvzLSXkT0a1kSeR5w5f3Mqob0W
	 JfgZyjBZQhJcw==
Date: Wed, 29 Jan 2025 01:16:34 +0000
To: Jason Andryuk <jason.andryuk@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 19/24] xen/8250-uart: add missing definitions
Message-ID: <_2QXLWvBsyAVvLYs1e9CcyCX4s4MXM4YyIrs-lqVvpVUzZTdO6qkqnwJzHV_EEQnWkUhn2nhazgADEnsEM4kf8ciUYTrsjSJll57wFcW4nM=@proton.me>
In-Reply-To: <d58cfd92-cd73-4a7f-8660-6a235ae887e5@amd.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com> <20250103-vuart-ns8250-v3-v1-19-c5d36b31d66c@ford.com> <d58cfd92-cd73-4a7f-8660-6a235ae887e5@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 66400b03a27ad5d1f6a74964080aec0ede54e61e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, January 28th, 2025 at 2:34 PM, Jason Andryuk <jason.andryuk@amd=
.com> wrote:

>=20
>=20
> On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
>=20
> > From: Denis Mukhin dmukhin@ford.com
> >=20
> > Added missing definitions needed for NS8250 UART emulator.
> >=20
> > Re-used newly introduced MSR definitions in the existing ns16550 driver=
.
> >=20
> > Also, fixed indentation in a comment for FCR register.
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/drivers/char/ns16550.c | 6 ++--
> > xen/include/xen/8250-uart.h | 78 +++++++++++++++++++++++++++++++++-----=
-------
> > 2 files changed, 60 insertions(+), 24 deletions(-)
>=20
> > diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
> > index d13352940c13c50bac17d4cdf2f3bf584380776a..6d1af31d582a3dd674a401d=
7f649e28c889cdc3e 100644
> > --- a/xen/include/xen/8250-uart.h
> > +++ b/xen/include/xen/8250-uart.h
>=20
> > @@ -51,12 +54,19 @@
> > #define UART_IIR_THR 0x02 /* - tx reg. empty /
> > #define UART_IIR_MSI 0x00 / - MODEM status /
> > #define UART_IIR_BSY 0x07 / - busy detect (DW) /
> > +#define UART_IIR_FE 0xC0 / FIFO enabled (2 bits) */
> >=20
> > /* FIFO Control Register /
> > -#define UART_FCR_ENABLE 0x01 / enable FIFO /
> > -#define UART_FCR_CLRX 0x02 / clear Rx FIFO /
> > -#define UART_FCR_CLTX 0x04 / clear Tx FIFO /
> > -#define UART_FCR_DMA 0x10 / enter DMA mode */
>=20
>=20
> 0x10 is bit 4...
>=20
> > +#define UART_FCR_ENABLE BIT(0, U) /* enable FIFO /
> > +#define UART_FCR_CLRX BIT(1, U) / clear Rx FIFO /
> > +#define UART_FCR_CLTX BIT(2, U) / clear Tx FIFO /
> > +#define UART_FCR_DMA BIT(3, U) / enter DMA mode */
>=20
>=20
> Now it's 0x08. Is this a bug fix? Looks like UART_FCR_DMA is unused.

Correct, NS16550 defines FCR DMA as bit#3 (0x08):
  https://www.ti.com/lit/ds/symlink/tl16c550c.pdf

  Table 7-3. Summary of Accessible Registers
  7.7.2 FIFO Control Register (FCR)

>=20
> Regards,
> Jason
>=20
> > +#define UART_FCR_RESERVED0 BIT(4, U) /* reserved; always 0 /
> > +#define UART_FCR_RESERVED1 BIT(5, U) / reserved; always 0 /
> > +#define UART_FCR_RTB0 BIT(6, U) / receiver trigger bit #0 /
> > +#define UART_FCR_RTB1 BIT(7, U) / receiver trigger bit #1 /
> > +#define UART_FCR_TRG_MASK (UART_FCR_RTB0 | UART_FCR_RTB1)
> > +
> > #define UART_FCR_TRG1 0x00 / Rx FIFO trig lev 1 /
> > #define UART_FCR_TRG4 0x40 / Rx FIFO trig lev 4 /
> > #define UART_FCR_TRG8 0x80 / Rx FIFO trig lev 8 */
>=20
> 

