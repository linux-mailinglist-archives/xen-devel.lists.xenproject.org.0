Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B439BF988
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 23:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831398.1246694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8oxH-0004x4-Tt; Wed, 06 Nov 2024 22:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831398.1246694; Wed, 06 Nov 2024 22:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8oxH-0004vD-QV; Wed, 06 Nov 2024 22:56:51 +0000
Received: by outflank-mailman (input) for mailman id 831398;
 Wed, 06 Nov 2024 22:56:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4He5=SB=ilande.co.uk=mark.cave-ayland@srs-se1.protection.inumbo.net>)
 id 1t8oxF-0004v7-Ul
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 22:56:50 +0000
Received: from mail.ilande.co.uk (mail.ilande.co.uk [2001:41c9:1:41f::167])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62dc95e7-9c92-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 23:56:42 +0100 (CET)
Received: from [2a00:23c4:8bb8:f600:5c84:8fbb:e5d9:991a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1t8owe-0005r0-2z; Wed, 06 Nov 2024 22:56:16 +0000
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
X-Inumbo-ID: 62dc95e7-9c92-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwMDE6NDFjOToxOjQxZjo6MTY3IiwiaGVsbyI6Im1haWwuaWxhbmRlLmNvLnVrIn0=
X-Custom-Transaction: eyJpZCI6IjYyZGM5NWU3LTljOTItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTMzODAyLjI1NjQzOSwic2VuZGVyIjoibWFyay5jYXZlLWF5bGFuZEBpbGFuZGUuY28udWsiLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vPYua6EHEWEq/K0JkQ0LEICGjtmS8znNO+vD/x/Hz6M=; b=yi3a4QFJbaHjJMAE1MMOtblf/B
	jBBQW5JztSPJo8FiHX2FETYDSdv11VTzfszZoHFXbwuZZRROlVbdFnLZ685oW3kS0fjy1G/6I3KDl
	Mn3Br/PA51aCDXvbk3ys1SUKG9/bL332iOKhgI2RNbQPuvxeEIcFdggDUur96WcWkNlEzj31a+/2I
	S76L5YDZPRXhtYe8+fWlXdeaPcF6NQryMrk+eDmgg/zj4dKUb3aDA5zYp93ugcZk7W+qrFVZWZWHd
	Lh6JvfDbz1zVCtVdajaMNXuUF+rzGkbu+cSNjQMvhrOcQeS3DMdhA8U6p42MX+FbedI5z8AcwVmO0
	98Iq27ZhwmE9jJ7A3uWHTpT59cffbshRY9r6TOfoNL+pkADvb9MuU8NuPx9Ki+5HGkGTbjoUZqDML
	DZ/27gAVeUgRbUJBsZBzGFZKOZPUkWA3IoI4/GBfh6g1M12gNLo6Z2WlJUxBK2tKv2OynVFeItbon
	Ek5Dy52QdURAhixRShSQbYFK1rISHm2tXNyi9waAvsWkYx5P0OyvI0PSunMxIzF75/MJcMfUBqZWj
	tXPK7qYlV2l1yPMmsILBEgHJoNXrdzuXWAojEJSL2Wyht/SVgJ7bzA16YAWy4USrldY6C5p0wdmI3
	mWTS5vGl63k5/Yj/SvY2FSBHxGGgcgRtjrbfyXxQI=;
Message-ID: <3b172279-ee99-4a04-bf6e-fdf6511215d4@ilande.co.uk>
Date: Wed, 6 Nov 2024 22:56:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anthony PERARD <anthony@xenproject.org>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <huth@tuxfamily.org>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20241106184612.71897-1-philmd@linaro.org>
 <20241106184612.71897-6-philmd@linaro.org>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
In-Reply-To: <20241106184612.71897-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb8:f600:5c84:8fbb:e5d9:991a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH 5/5] hw/sparc: Mark devices as big-endian
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

On 06/11/2024 18:46, Philippe Mathieu-Daudé wrote:

> These devices are only used by the SPARC targets, which are
> only built as big-endian. Therefore the DEVICE_NATIVE_ENDIAN
> definition expand to DEVICE_BIG_ENDIAN (besides, the
> DEVICE_LITTLE_ENDIAN case isn't tested). Simplify directly
> using DEVICE_BIG_ENDIAN.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/sparc/sun4m_iommu.c | 2 +-
>   hw/sparc64/sun4u.c     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sparc/sun4m_iommu.c b/hw/sparc/sun4m_iommu.c
> index 6f765e97e4..4486508e3b 100644
> --- a/hw/sparc/sun4m_iommu.c
> +++ b/hw/sparc/sun4m_iommu.c
> @@ -238,7 +238,7 @@ static void iommu_mem_write(void *opaque, hwaddr addr,
>   static const MemoryRegionOps iommu_mem_ops = {
>       .read = iommu_mem_read,
>       .write = iommu_mem_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_BIG_ENDIAN,
>       .valid = {
>           .min_access_size = 4,
>           .max_access_size = 4,
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index 541c7f74fa..9d7aebf632 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -254,7 +254,7 @@ static void power_mem_write(void *opaque, hwaddr addr,
>   static const MemoryRegionOps power_mem_ops = {
>       .read = power_mem_read,
>       .write = power_mem_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_BIG_ENDIAN,
>       .valid = {
>           .min_access_size = 4,
>           .max_access_size = 4,

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.


