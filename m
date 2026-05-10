Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI+8AuwVAWpIQgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 01:34:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE2B506D33
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 01:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305660.1577904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMDds-0000L3-7h; Sun, 10 May 2026 23:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305660.1577904; Sun, 10 May 2026 23:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMDds-0000Jq-4l; Sun, 10 May 2026 23:33:00 +0000
Received: by outflank-mailman (input) for mailman id 1305660;
 Sun, 10 May 2026 23:32:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <x1917x@gmail.com>) id 1wMDdq-0000Jk-PD
 for xen-devel@lists.xenproject.org; Sun, 10 May 2026 23:32:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMDdo-002arT-KK
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 01:32:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <x1917x@gmail.com>)
 id 6a011560-bab6-0a2a0a5309dd-0a2a450285c2-32
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 01:32:58 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <x1917x@gmail.com>)
 id 6a0115aa-af86-0a2a45020019-d155dd31b006-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 01:32:58 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so2238675f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 10 May 2026 16:32:58 -0700 (PDT)
Received: from LinuxLaptop ([45.157.112.7]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e702e6d41sm183399535e9.7.2026.05.10.16.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2026 16:32:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Organization:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778455977; x=1779060777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ta7TMvMqH6+uZY4QpSPG2FQFlhWtL36NChaZdBFFffI=;
        b=saPpRtVgRnb2bFGeB2oHcM/tvyEF0vJAZbM+du9aaqhX8S7oPBHOY22jUUDzB5NWGU
         LXSP8mmMIQwgHW3mRImXtvKjPgbM0DCnIYd3SZPF5XZCeoSqAGGEE9Z8vYA7OpyVastH
         3xExipRtxETUZhKf/1fRkOghhmU+wBwPLQt4ZltM8L01nJ5lPmu0PLsQc4zCz6dkVwa8
         qG2GBYmXS+FEYGp1khf+5Kd5kTy6dNR06HmeKv314ryd/OXVRWv1/jBtCQJphIOy7ZSv
         F6ZnmuJkFDFdt3FO94s0xXkDvGwODjH2O8SrH5ESn2fg+h6LM5ZVtfFyWNK4E/qVg9Mt
         EFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778455977; x=1779060777;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ta7TMvMqH6+uZY4QpSPG2FQFlhWtL36NChaZdBFFffI=;
        b=V6ut8wSnXF2+vdaDRargEEg9sNUjF0BB7NSVT+LVKleTZHBV76CD583pO3uDp6kMr1
         h8xW3ciz/L4UrgpNg6av9Jirnz77BX538r30QmypNo7CeuZdlChsDkMzcAuH3EHW0rdf
         RnuxzWOy6qM0IdwUW/KHvCWJv00vmwsD7mySlpeW2TdjJYKxoBIfrS3YQbzeO5vsso3q
         a/y5yTleOPO207cXI/koO40Xzu9S58uusrURoKAu1vVfbuGWbj+YXPGXy4xxOso4veL0
         g87a2KjU1sXLo+U7lC2F1+YZvifNCm0ERsxG/mvcYemv1X8tM38UDcSuabrLv0XK5fGM
         1SlA==
X-Forwarded-Encrypted: i=1; AFNElJ8FdxaAxRHFMX4U0L2jsEXFB37lZYk25mEGIkVU3Fntn2R5twDS7fMF4xIRCoc3/Nle56poMAQM+Do=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzU2I1mLbx+ITGEVKs6ayaXiXhQ9zbWP6X+KmjC33CJVR5QZB4c
	ATx+cvtxDjIdNGi0xvXr4CpWNf6JtLT2Y/jpP3ysKSbbhSjLm2OEzEQx
X-Gm-Gg: Acq92OEUfgc+ZoLU2uDfOen5NdLoyZqhVwtsCuyEcFtJd6OVq+wdMZK4RlKRj8KElvo
	ZWcAPbKas0l649Di7eaybUq1zZipHYvfTgjNz6N+2BoSGXQuzFYKvlBygd09UCenYXLOJDFauFJ
	zaNabFyLKc7EEgWNBKMhGAm88Jsj7pskGXXHD+BXhANRS55v6EotvIIPkCanDL5Plt13+l0nBVH
	9p/TWzZUsFLFrgpBNDB2+e6TdpVdHrz+zv/9IFUEcfvMlwv8VWTtrMe4RF2BDikgg4Z0ghQEp2v
	eVs49ZckmDKvvtEwEGJxLbFcz03A5VaoUjHfRdT3HJfMyF8U4QJwtTTm/kxWvBQWg9Sq2zF09dW
	NxwHY7FhnGLpxWq2jpdx/Z5HppJg8OkOcBtd4wfl5w59fd1mkWOhLlln7jKxoGhYu6J93u57SlW
	dNpKZuhOiWKaZLo1g=
X-Received: by 2002:a05:600c:a30d:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-48e6748a72fmr123941125e9.1.1778455977319;
        Sun, 10 May 2026 16:32:57 -0700 (PDT)
Date: Mon, 11 May 2026 01:32:52 +0200
From: Alexey G <x1917x@gmail.com>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Thierry Escande <thierry.escande@vates.tech>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>
Subject: Re: [PATCH 07/17] hvmloader: add basic Q35 support
Message-ID: <20260511013252.326cd768@LinuxLaptop>
In-Reply-To: <afCy-IU85MdDBlUq@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
	<20260313163455.790692-8-thierry.escande@vates.tech>
	<afCy-IU85MdDBlUq@macbook.local>
Organization: none
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1778455978-B0B78161-EB2FB015/0/0
X-purgate-type: clean
X-purgate-size: 2556
X-Rspamd-Queue-Id: 5AE2B506D33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[x1917x@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[x1917x@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, 28 Apr 2026 15:15:36 +0200
Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wrote:
>
>> +        pci_writel(devfn, 0x40, ACPI_PM1A_EVT_BLK_ADDRESS_V1 | 1);
>> +        pci_writeb(devfn, 0x44, 0x80); /* enable PM io space */
>> +        outl(SCI_EN_IOPORT, inl(SCI_EN_IOPORT) | GBL_SMI_EN | APMC_EN);
>
>Most of the above looks like black magic.  It's not like the context
>of this function is great, most of the existing stuff is poorly
>documented.  Can we get a bit more comments about what's this supposed
>to do, and maybe a reference to the Intel specification that lists
>where those PCI config space registers are coming from?

This is a precondition for the (later) switch to ACPI.

First, we set the ACPI I/O registers base - it can be absolutely
arbitrary but we choose the same value that was used before for PIIX4 -
ACPI_PM1A_EVT_BLK_ADDRESS_V1. The "| 1" part is likely NOT necessary
and should be removed unless QEMU has a bug with its handling -
according to Intel datasheet, bit0 is "Hardwired to 1 to indicate I/O
space", no need to set it explicitly.

At this point we can use ACPI I/O register block at
ACPI_PM1A_EVT_BLK_ADDRESS_V1. We are only interested in one register
from this range - at offset +30h. SCI_EN_IOPORT is a wrong name
actually, it should be renamed to SMI_EN_IOPORT.

Finally, the line
"outl(SCI_EN_IOPORT, inl(SCI_EN_IOPORT) | GBL_SMI_EN | APMC_EN)"
enables SMI generation - we will use it later to perform a classic
APM -> ACPI switch via a write to the APM_CNT (0B2h) register to
trigger an SW SMI, followed by validating SCI_EN=3D1 to confirm the
successful switch.

Basically, all this setup is just a preparation for the step done in
the next patch - "hvmloader: add ACPI enabling for Q35".

What I don't remember is who was actually responsible for actual ACPI
enabling - either QEMU or firmware.
On real systems it is a bit more complicated - the APM -> ACPI switch
is done by an ACPI-aware OS itself (OSPM, how they call it). The OS
extracts information from ACPI tables and use it to find out what and
where to write in order to switch to ACPI. Under the hood it's still a
special value written to the SW SMI register, triggering a SMI handler
in the firmware. The actual hand-off to ACPI was done by the SMI
handler, including switching the PM interrupt from SMI to ACPI's SCI.

I'm not sure why hvmloader does this switch early instead. But at least
this APM -> ACPI switch flow matches the older (PIIX4) one. Perhaps
this is how it was handled by QEMU.

