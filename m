Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D02A0122D
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865230.1276522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvLY-0007hd-98; Sat, 04 Jan 2025 04:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865230.1276522; Sat, 04 Jan 2025 04:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvLY-0007fD-5n; Sat, 04 Jan 2025 04:01:08 +0000
Received: by outflank-mailman (input) for mailman id 865230;
 Sat, 04 Jan 2025 04:01:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvLW-0007dh-6S
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:01:06 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 840b3a62-ca50-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 05:01:03 +0100 (CET)
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
X-Inumbo-ID: 840b3a62-ca50-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735963262; x=1736222462;
	bh=/5vzlfGpgvgVcegUJVZmXeoXDeL04N9KoKlstkZ9pQ8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=cOe7Fl/yu+IvoAIHjv9iUuOLK6Whn52QMTPPxIvv/XymJ2LNs1XSF0dXcxl3j9BoQ
	 HEI7+2fslQWLd5LFx1qEiSvrwdO542SNFjkUvY8+wT82DxXYz87HuuTv6njQjBeeB1
	 9G6/5SZGXelL1DkOANE8hspNIXScTNsuDNvi2iwBHV7V4G7DDqs9Rm1+1CMy7CYTCS
	 tWHxV8TehIphclziMLpI/rG4LQ/dS+topiKK6apGi7Z3JTNX6fmMBpSesG78gkTxO7
	 xPH7RjAaWC/SJS79EGCf0b1Wb6ZqOgOdzslOsoEdHmhirUuxTqeGvTCqhZQ+Z0YhLT
	 ZzpXr04PO7crQ==
Date: Sat, 04 Jan 2025 04:00:57 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 28/35] xen/8250-uart: add missing definitions
Message-ID: <45RKKdB9RUdYD5cKt4CA7xiWf9u4U98uW4WmLEAbAUVc57bEKFDm7_Kk_Q0sw_XoYaCUeBugXIBZC28kksNoEgII8eh-IDpiBIsZpYz1djg=@proton.me>
In-Reply-To: <e10255e4-c5e5-4cc7-9665-6852252e93cc@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-28-e9aa923127eb@ford.com> <e10255e4-c5e5-4cc7-9665-6852252e93cc@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f6940d0e88ed7a935ee98040bb050fa53e57c817
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 7:07 AM, Jan Beulich <jbeulich@suse.com=
> wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > --- a/xen/include/xen/8250-uart.h
> > +++ b/xen/include/xen/8250-uart.h
> > @@ -32,16 +32,22 @@
> > #define UART_MCR 0x04 /* Modem control /
> > #define UART_LSR 0x05 / line status /
> > #define UART_MSR 0x06 / Modem status /
> > +#define UART_SCR 0x07 / Scratch pad /
> > #define UART_USR 0x1f / Status register (DW) /
> > #define UART_DLL 0x00 / divisor latch (ls) (DLAB=3D1) /
> > #define UART_DLM 0x01 / divisor latch (ms) (DLAB=3D1) /
> > #define UART_XR_EFR 0x09 / Enhanced function register (Exar) */
> >
> > +/* ns8250 emulator: range of emulated registers [0..UART_MAX-1] */
> > +#define UART_MAX (UART_SCR + 1)
>
>
> There are two issues here: "max" means "highest within range", yet
> you define it as "first invalid", i.e. something we'd normally call
> "_NR" or "NUM". And then, as the comment says, this is a limit the
> emulation is going to expose, not something generally applicable to
> UARTs of this kind. Hence the UART prefix alone isn't quite correct
> either.

I did renaming and moved declaration to the UART emulator code.

>
> > @@ -51,12 +57,21 @@
> > #define UART_IIR_THR 0x02 /* - tx reg. empty /
> > #define UART_IIR_MSI 0x00 / - MODEM status /
> > #define UART_IIR_BSY 0x07 / - busy detect (DW) /
> > +#define UART_IIR_FE0 BIT(6, U) / FIFO enable #0 /
> > +#define UART_IIR_FE1 BIT(7, U) / FIFO enable #1 */
> > +#define UART_IIR_FE_MASK (UART_IIR_FE0 | UART_IIR_FE1)
>
>
> Much like BSY is a 3-bit field, aiui this is a 2-bit one.

Updated to 2-bit mask.

>
> > /* FIFO Control Register /
> > -#define UART_FCR_ENABLE 0x01 / enable FIFO /
> > -#define UART_FCR_CLRX 0x02 / clear Rx FIFO /
> > -#define UART_FCR_CLTX 0x04 / clear Tx FIFO /
> > -#define UART_FCR_DMA 0x10 / enter DMA mode /
> > +#define UART_FCR_ENABLE BIT(0, U) / enable FIFO /
> > +#define UART_FCR_CLRX BIT(1, U) / clear Rx FIFO /
> > +#define UART_FCR_CLTX BIT(2, U) / clear Tx FIFO /
> > +#define UART_FCR_DMA BIT(3, U) / enter DMA mode /
> > +#define UART_FCR_RESERVED0 BIT(4, U) / reserved; always 0 /
> > +#define UART_FCR_RESERVED1 BIT(5, U) / reserved; always 0 /
> > +#define UART_FCR_RTB0 BIT(6, U) / receiver trigger bit #0 /
> > +#define UART_FCR_RTB1 BIT(7, U) / receiver trigger bit #1 */
> > +#define UART_FCR_TRG_MASK (UART_FCR_RTB0 | UART_FCR_RTB1)
>
>
> Much like the top two bits here are, and - as Roger has said - the
> reserved bits probably also should be.

I kept reserved bits as is.
I think that will help to avoid confusion whether support for those bits
is missing in the driver code or those are reserved.

There are other examples, e.g. PCI_PM_CAP_RESERVED when reserved bits
declared and not necessarily used in the code base.

>
> > @@ -64,17 +79,17 @@
> >
> > /*
> > * Note: The FIFO trigger levels are chip specific:
> > - * RX:76 =3D 00 01 10 11 TX:54 =3D 00 01 10 11
> > - * PC16550D: 1 4 8 14 xx xx xx xx
> > - * TI16C550A: 1 4 8 14 xx xx xx xx
> > - * TI16C550C: 1 4 8 14 xx xx xx xx
> > - * ST16C550: 1 4 8 14 xx xx xx xx
> > - * ST16C650: 8 16 24 28 16 8 24 30 PORT_16650V2
> > - * NS16C552: 1 4 8 14 xx xx xx xx
> > - * ST16C654: 8 16 56 60 8 16 32 56 PORT_16654
> > - * TI16C750: 1 16 32 56 xx xx xx xx PORT_16750
> > - * TI16C752: 8 16 56 60 8 16 32 56
> > - * Tegra: 1 4 8 14 16 8 4 1 PORT_TEGRA
> > + * RX:76 =3D 00 01 10 11 TX:54 =3D 00 01 10 11
> > + * PC16550D: 1 4 8 14 xx xx xx xx
> > + * TI16C550A: 1 4 8 14 xx xx xx xx
> > + * TI16C550C: 1 4 8 14 xx xx xx xx
> > + * ST16C550: 1 4 8 14 xx xx xx xx
> > + * ST16C650: 8 16 24 28 16 8 24 30 PORT_16650V2
> > + * NS16C552: 1 4 8 14 xx xx xx xx
> > + * ST16C654: 8 16 56 60 8 16 32 56 PORT_16654
> > + * TI16C750: 1 16 32 56 xx xx xx xx PORT_16750
> > + * TI16C752: 8 16 56 60 8 16 32 56
> > + * Tegra: 1 4 8 14 16 8 4 1 PORT_TEGRA
> > */
>
>
> While perhaps okay, the adjustment of this table still looks unrelated.
> It wants at least mentioning in the description, to clarify it's an
> intentional change (as opposed to e.g. being an effect of how your
> editor is configured).

Thanks, I updated the commit message.

>
> > @@ -96,11 +111,31 @@
> > #define UART_LCR_CONF_MODE_B 0xBF /* Configuration mode B */
> >
> > /* Modem Control Register /
> > -#define UART_MCR_DTR 0x01 / Data Terminal Ready /
> > -#define UART_MCR_RTS 0x02 / Request to Send /
> > -#define UART_MCR_OUT2 0x08 / OUT2: interrupt mask /
> > -#define UART_MCR_LOOP 0x10 / Enable loopback test mode /
> > -#define UART_MCR_TCRTLR 0x40 / Access TCR/TLR (TI16C752, EFR[4]=3D1) /
> > +#define UART_MCR_DTR BIT(0, U) / Data Terminal Ready /
> > +#define UART_MCR_RTS BIT(1, U) / Request to Send /
> > +#define UART_MCR_OUT1 BIT(2, U) / OUT1: interrupt mask /
> > +#define UART_MCR_OUT2 BIT(3, U) / OUT2: interrupt mask /
> > +#define UART_MCR_LOOP BIT(4, U) / Enable loopback test mode /
> > +#define UART_MCR_RESERVED0 BIT(5, U) / Reserved #0 /
> > +#define UART_MCR_RESERVED1 BIT(6, U) / Reserved #1 /
> > +#define UART_MCR_TCRTLR BIT(6, U) / Access TCR/TLR (TI16C752, EFR[4]=
=3D1) /
> > +#define UART_MCR_RESERVED2 BIT(7, U) / Reserved #2 /
> > +#define UART_MCR_MASK \
> > + (UART_MCR_DTR | UART_MCR_RTS | \
> > + UART_MCR_OUT1 | UART_MCR_OUT2 | \
> > + UART_MCR_LOOP)
> > +
> > +/ Modem Status Register /
> > +#define UART_MSR_DCTS BIT(0, U) / Change in CTS /
> > +#define UART_MSR_DDSR BIT(1, U) / Change in DSR /
> > +#define UART_MSR_TERI BIT(2, U) / Change in RI /
> > +#define UART_MSR_DDCD BIT(3, U) / Change in CTS */
> > +#define UART_MSR_CTS BIT(4, U)
> > +#define UART_MSR_DSR BIT(5, U)
> > +#define UART_MSR_RI BIT(6, U)
> > +#define UART_MSR_DCD BIT(7, U)
>
>
> As you introduce these constants, I think you also want to switch the sol=
e
> MSR read we have to actually use them.

Sure, no problem; fixed.

>
> Jan



