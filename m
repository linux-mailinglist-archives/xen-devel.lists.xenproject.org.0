Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2D497CEB6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 23:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800937.1210935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srOQP-0006KG-9E; Thu, 19 Sep 2024 21:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800937.1210935; Thu, 19 Sep 2024 21:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srOQP-0006HI-6B; Thu, 19 Sep 2024 21:10:53 +0000
Received: by outflank-mailman (input) for mailman id 800937;
 Thu, 19 Sep 2024 21:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1jh=QR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1srOQN-0006HC-Ei
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 21:10:51 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4da25ec-76cb-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 23:10:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8CC89828596A;
 Thu, 19 Sep 2024 16:10:48 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WBQc2WS_vW8a; Thu, 19 Sep 2024 16:10:48 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DD3258287AC6;
 Thu, 19 Sep 2024 16:10:47 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RLdwD298kWB9; Thu, 19 Sep 2024 16:10:47 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 83494828596A;
 Thu, 19 Sep 2024 16:10:47 -0500 (CDT)
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
X-Inumbo-ID: a4da25ec-76cb-11ef-99a2-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DD3258287AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1726780247; bh=bd0Zyi6D9w/pN71rObvWPK8FBn+j9/HU8NgBqsZOcKQ=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=DI5fjJh+ZPhsEp126gEtOBaY9D4XngdWjvyqFLW1x2vTeC0vubHZ3/omd3e/hC5wU
	 nBD326498FiWLDDaaF5imfpvQUNoK0IZvUCMnC+QOIY7WXL0F+fXC21K6pyKgGnlzY
	 wawRKlxtsd/83Rc/DAz5unz9vht3tind6cU+RfW8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <2c2bd8bd-7d0f-4e47-9bab-e097a3ec8766@raptorengineering.com>
Date: Thu, 19 Sep 2024 16:10:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] xen/ppc: add section for device information in
 linker script
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
 <05eeb53403017fb40c4debf8a33f70438953d6de.1726579819.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <05eeb53403017fb40c4debf8a33f70438953d6de.1726579819.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 9/17/24 11:15 AM, Oleksii Kurochko wrote:
> Introduce a new `.dev.info` section in the PPC linker script to
> handle device-specific information. This section is required by
> common code (common/device.c: device_init(), device_get_class() ).
> This section is aligned to `POINTER_ALIGN`, with `_sdevice` and `_edevice`
> marking the start and end of the section, respectively.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - reuse DT_DEV_INFO_SEC introduced earlier in this patch series with using
>    of DECL_SECTION.  
> ---
>  xen/arch/ppc/xen.lds.S | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 38cd857187..6e5582c3e4 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -94,6 +94,9 @@ SECTIONS
>          CONSTRUCTORS
>      } :text
>  
> +    . = ALIGN(POINTER_ALIGN);         /* Devicetree based device info */
> +    DT_DEV_INFO_SEC(.dev.info, USE_DECL_SECTION)
> +

As I mentioned in my comment on patch 1, I think this should be done in
the same style as the other xen.lds.h macros, which leaves the actual
section declaration here in xen.lds.S and just uses the macro to fill in
the definition.

Whether or not that route is ultimately taken though, this change is
fine from the PPC end of things:

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn


