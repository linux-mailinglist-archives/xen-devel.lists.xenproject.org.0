Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765F97829E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 16:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798239.1208384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7ON-0001un-C6; Fri, 13 Sep 2024 14:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798239.1208384; Fri, 13 Sep 2024 14:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7ON-0001sn-9N; Fri, 13 Sep 2024 14:35:23 +0000
Received: by outflank-mailman (input) for mailman id 798239;
 Fri, 13 Sep 2024 14:35:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NjI=QL=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1sp7OM-0001sf-4v
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 14:35:22 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65aae04c-71dd-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 16:35:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4AF2E8285C21;
 Fri, 13 Sep 2024 09:35:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id wbIT8HDkd5OY; Fri, 13 Sep 2024 09:35:16 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DCBDF8286C39;
 Fri, 13 Sep 2024 09:35:15 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UeqGcI9RxGTb; Fri, 13 Sep 2024 09:35:15 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 8A2408285C21;
 Fri, 13 Sep 2024 09:35:15 -0500 (CDT)
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
X-Inumbo-ID: 65aae04c-71dd-11ef-99a2-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DCBDF8286C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1726238115; bh=2KwgQut5HIJ9AJZJuAhW+vvBb53WI2mG+kgOtQE96r0=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=U1NiDLreb4XEb5hDA0Fdgzm24tkTtr61ZJSCLXa6xSatZZze4GDKFWzZzpLdutURf
	 4OuGW/tFjzx4MzbpVMrURKbCElzz3+VjT62sWqxJfxehqkPXHt9hUIMkQV11lf8x29
	 4UbP/8pjSWFb+LI5hh+yDFU8gsyUK+/j0dzhhlOg=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <1ae939b4-0d15-4406-8ac3-3e2735550b13@raptorengineering.com>
Date: Fri, 13 Sep 2024 09:35:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/ppc: add section for device information in
 linker script
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
 <395dd494ad09b315e5e383aa41f8dad4548ba613.1726048521.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <395dd494ad09b315e5e383aa41f8dad4548ba613.1726048521.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 9/11/24 5:04 AM, Oleksii Kurochko wrote:
> Introduce a new `.dev.info` section in the PPC linker script to
> handle device-specific information.
> This section is aligned to `POINTER_ALIGN`, with `_sdevice` and `_edevice`
> marking the start and end of the section, respectively.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/ppc/xen.lds.S | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 38cd857187..c087827d28 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -161,6 +161,13 @@ SECTIONS
>          __bss_end = .;
>      } :text
>  
> +    . = ALIGN(POINTER_ALIGN);
> +    .dev.info : {

Sections in the PPC linker script must be declared with the DECL_SECTION
macro to ensure that they are placed at the correct physical and virtual
address (see all other sections in the file).

Additionally, like Jan mentioned, placing the section section before
.bss would probably be preferable. Right before .init.text would
probably be a reasonable place to put it, like ARM's linker script does.

Thanks,
Shawn

