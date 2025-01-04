Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA8A0122E
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865237.1276532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvMH-0008JL-IW; Sat, 04 Jan 2025 04:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865237.1276532; Sat, 04 Jan 2025 04:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvMH-0008H3-Em; Sat, 04 Jan 2025 04:01:53 +0000
Received: by outflank-mailman (input) for mailman id 865237;
 Sat, 04 Jan 2025 04:01:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvMG-0007dh-Me
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:01:52 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a07d562c-ca50-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 05:01:51 +0100 (CET)
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
X-Inumbo-ID: a07d562c-ca50-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=usqe2dgy7ne2dkl2qbugtq35ku.protonmail; t=1735963310; x=1736222510;
	bh=P2bG0zD4+qRHcNJXAcSZ4NMKsu13DoyVaZxfv2bwnpI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TE+KAdfz1LJZmbRrsQf8ObDEvKA/nSpnOMtG6VLjnGiZxHcC8+6SPkRRayEfk2rz0
	 5SsSEJ3AAyXVcaNnStpUeTioRTxedAK7B+X2SwHg05pYgLsRg/DPgGZO0Ahn7pgx1X
	 BQM6eG2hqD5zDA5zapN7i2oTJPGlSFSA4dCnN3tm3usRdMJblve+daNhGFvCTgGOAS
	 wfbHOON88FcAIZicLiZ33Vd8ZZN9KlFd88SCGItlGs1Y0BxtG5KRm1exDaUTDS2qsK
	 jN3LYyKn+X2tRUN9++HeYx+PrGpzZd/zUO0nz18E//GQKYuIrLKhe5TLbrTsCocUv9
	 vv90BA8vdDKuA==
Date: Sat, 04 Jan 2025 04:01:44 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 28/35] xen/8250-uart: add missing definitions
Message-ID: <TQpr0M1IH2DHO5zjeVbaVXHpUewfpSil_xElIa1ViXBELJsOUqipFNZdwZ3o02cOmGN-AvPJ2Iq2oibUEeopmehU26tBylu_eGQxa3Xtc9A=@proton.me>
In-Reply-To: <Z1rzZGef5SusIkN-@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-28-e9aa923127eb@ford.com> <Z1rzZGef5SusIkN-@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 31422d13bbdcb1690c3ba75d4517bbac163335d9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 6:29 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:58PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Added missing definitions needed for NS8250 UART emulator.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/include/xen/8250-uart.h | 81 +++++++++++++++++++++++++++++++++-----=
-------
> > 1 file changed, 60 insertions(+), 21 deletions(-)
> >
> > diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
> > index d13352940c13c50bac17d4cdf2f3bf584380776a..4a69b2b225140efda287bdf=
96fa0caa4aa70074f 100644
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
> > +/* ns8250 emulator: range of emulated registers [0..UART_MAX-1] /
> > +#define UART_MAX (UART_SCR + 1)
> > +
> > / Interrupt Enable Register /
> > #define UART_IER_ERDAI 0x01 / rx data recv'd /
> > #define UART_IER_ETHREI 0x02 / tx reg. empty /
> > #define UART_IER_ELSI 0x04 / rx line status /
> > #define UART_IER_EMSI 0x08 / MODEM status */
> > +#define UART_IER_MASK \
> > + (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
> >
> > /* Interrupt Identification Register /
> > #define UART_IIR_NOINT 0x01 / no interrupt pending /
> > @@ -51,12 +57,21 @@
> > #define UART_IIR_THR 0x02 / - tx reg. empty /
> > #define UART_IIR_MSI 0x00 / - MODEM status /
> > #define UART_IIR_BSY 0x07 / - busy detect (DW) /
> > +#define UART_IIR_FE0 BIT(6, U) / FIFO enable #0 /
> > +#define UART_IIR_FE1 BIT(7, U) / FIFO enable #1 */
> > +#define UART_IIR_FE_MASK (UART_IIR_FE0 | UART_IIR_FE1)
> >
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
> > +#define UART_FCR_RESERVED1 BIT(5, U) / reserved; always 0 */
>
>
> We don't usually define reserved bits I think, as I assume those won't
> be used by the code?

I found examples of reserved bits being defined and not used in the
code base, e.g. PCI_PM_CAP_RESERVED.

IMO marking reserved bits in the code will immediately explain
readers the purpose of those bits.

>
> Maybe a reserved mask for the hole register, to ensure the access to
> the register doesn't attempt to set reserved bits? But even then the
> best we can do when emulating is print a warning message.

Added warning messages in the emulator code (v3).

>
> Thanks, Roger.



