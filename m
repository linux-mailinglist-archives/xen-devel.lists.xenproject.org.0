Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209139D8AAB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 17:54:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842984.1258649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcLh-0001Cf-GP; Mon, 25 Nov 2024 16:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842984.1258649; Mon, 25 Nov 2024 16:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcLh-00019p-Ch; Mon, 25 Nov 2024 16:54:09 +0000
Received: by outflank-mailman (input) for mailman id 842984;
 Mon, 25 Nov 2024 16:54:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bTcJ=SU=bounce.vates.tech=bounce-md_30504962.6744aba8.v1-923f503bf8d1455887d6cbac0db9dd8b@srs-se1.protection.inumbo.net>)
 id 1tFcLg-00019j-DX
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 16:54:08 +0000
Received: from mail179-37.suw41.mandrillapp.com
 (mail179-37.suw41.mandrillapp.com [198.2.179.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df25ed3b-ab4d-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 17:54:02 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4XxsHD6KQMzG0CT9p
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 16:54:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 923f503bf8d1455887d6cbac0db9dd8b; Mon, 25 Nov 2024 16:54:00 +0000
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
X-Inumbo-ID: df25ed3b-ab4d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE3OS4zNyIsImhlbG8iOiJtYWlsMTc5LTM3LnN1dzQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImRmMjVlZDNiLWFiNGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTUzNjQyLjY4MzQ0Miwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDRhYmE4LnYxLTkyM2Y1MDNiZjhkMTQ1NTg4N2Q2Y2JhYzBkYjlkZDhiQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732553640; x=1732814140;
	bh=omW5yMXMgseSyf8ib7wjp+EAatzve5bYK/DdFmQA4zs=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ja+kjBbzjq1IF26MUbAgINz8CIFIfE818dQPvMwI5OyVxfA4aHSAVMNa6B5QSEZDM
	 WctxU3jrPsFoXdYw3/Wf4yyTuPKend3k3mcC/3gGStu/zNJ48cvLC/833AlgjDicd0
	 a/QKM383fRGX66sNkA5XTSREalvD1MGkR335U9ogEkxsujtUfdaLOc1aNJ1Q/mwP0I
	 Z5/zEWxIo2Xwp3yqIU+nuFdgyRF04ph4FnvreP0H7CANt5ucHf4BMNv7yrdyyDBE8f
	 ddE9ldFuTrv2Qd3grkjCdxv4pEvVrE8NCp7rRVUs9Z+Tv+gbtF3kWSIUT73ZBBpgWS
	 2oz+95aWBjWJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732553640; x=1732814140; i=anthony.perard@vates.tech;
	bh=omW5yMXMgseSyf8ib7wjp+EAatzve5bYK/DdFmQA4zs=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=E7FVtmd1jGHmxd71cyfNWBCpYzbJu9LSqXcL/HQQ6OTR31nGxsUQGPRY7TGKArFmA
	 rmMfOSKZqiuOM/RfwZNBcLT6FPJBU51rZIDJ4xTjYI2xZlVaCdVTIXoHyUL1GwgAEd
	 XPKVfYNVWjwL9lswgd8pGeknVGTz0HGvUvoz7VAnGtpcgUbf4bHPEEa5K49jP0loN9
	 Cpfkrd80Qsn7m+oNi2BIFsToyCemInZ6ZE4wzg/eucgoNh2tKgHpmVgzwevfvzmxp7
	 118nq9LZT6iAFBHefHAm/XbO1yG5fzVVuK3Q/4QrqYqDjOGihOBpHqXyj/fu8D4Ttv
	 NUTnllo7NL1jw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/2]=20libxl/ACPI:=20don't=20hard-code=20guest=20page=20size?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732553640217
To: "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z0Srp0Ag0y4AQQiE@l14>
References: <7455ff48-4bbc-465c-baff-d5c0ff684dfd@suse.com> <9eca264f-57b3-45d3-8017-cd11af0b6cf7@suse.com>
In-Reply-To: <9eca264f-57b3-45d3-8017-cd11af0b6cf7@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.923f503bf8d1455887d6cbac0db9dd8b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241125:md
Date: Mon, 25 Nov 2024 16:54:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Nov 25, 2024 at 04:15:28PM +0100, Jan Beulich wrote:
> We have libxl_ctxt.page_size for this purpose; use it to eliminate a
> latent buffer overrun.

The 4096 here might actually refer to the size used to allocate
`config.infop`, which is `libxl_ctxt.page_size`. So I don't if the
explanation is correct, but at least now the same value is used for both
zmalloc() and .lenght.

> Fixes: 14c0d328da2b ("libxl/acpi: Build ACPI tables for HVMlite guests")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

> ---
> Yet better might be to limit the size to what's actually used (libacpi's
> struct acpi_info). That would then also have avoided the respective part
> of XSA-???.

It's kind of hard to tell here how `infop` is going to be used from this
function, so changing the lenght just here might not do the right thing.

> --- a/tools/libs/light/libxl_x86_acpi.c
> +++ b/tools/libs/light/libxl_x86_acpi.c
> @@ -218,7 +218,7 @@ int libxl__dom_load_acpi(libxl__gc *gc,
>          dom->acpi_modules[0].guest_addr_out = 0x100000 - 64;
>  
>      dom->acpi_modules[1].data = (void *)config.infop;
> -    dom->acpi_modules[1].length = 4096;
> +    dom->acpi_modules[1].length = libxl_ctxt.page_size;
>      dom->acpi_modules[1].guest_addr_out = ACPI_INFO_PHYSICAL_ADDRESS;
>  
>      dom->acpi_modules[2].data = libxl_ctxt.buf;

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

