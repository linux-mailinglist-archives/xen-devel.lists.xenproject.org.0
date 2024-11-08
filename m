Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5929C18C0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 10:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832368.1247680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9KwJ-00074M-FG; Fri, 08 Nov 2024 09:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832368.1247680; Fri, 08 Nov 2024 09:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9KwJ-00071i-C8; Fri, 08 Nov 2024 09:05:59 +0000
Received: by outflank-mailman (input) for mailman id 832368;
 Fri, 08 Nov 2024 09:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwxj=SD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t9KwI-00071J-DT
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 09:05:58 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8a55562-9db0-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 10:05:54 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fb5be4381dso19164271fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 01:05:54 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff17900a63sm5625601fa.47.2024.11.08.01.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 01:05:50 -0800 (PST)
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
X-Inumbo-ID: a8a55562-9db0-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzQiLCJoZWxvIjoibWFpbC1sajEteDIzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE4YTU1NTYyLTlkYjAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDU2NzU0LjIzMTc0Mywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731056753; x=1731661553; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7Jql9MZWi7RMQuyLHQJSF5WsDDEPGdW1VQps+dmrYmw=;
        b=WzLX9JsKj4Nx4AXBPHtnDzlEH9TigjzwxtXiy/x9iFXUdo4Z74a1N/XybdSOMBiZXb
         fm8Vp9YwAsQDjvhYJ27ptMKWOMqA87kl2FazZHMVyeBe9qKOQ79S27CsWq2t5RL4eMrp
         cmCZJa7QLXneBGgdaqR3kCZC7X505i6Qw907mdaYmA8Op/Zjz3TD2gXFd32y59z47F2L
         +PUwo5Ep/zgW9t8Tv05b0aHKcsOLhfQWY/QpcjdxJed1h7NYa3znbuu6kzCncFfsSUdr
         /MSmxzeNdRHPcSI4902RG5zCC+PmLhHHe8+wDwQeC06m4f8M/drBbeb5a46q/eLzPG3W
         hBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731056753; x=1731661553;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Jql9MZWi7RMQuyLHQJSF5WsDDEPGdW1VQps+dmrYmw=;
        b=O9z/0je38/ZNLU76X4J3vSxuNz8knVkYMmRExXCNhFGWW6TlHjyH95b+MSO328cNxa
         f6uGej4DwyKCAN7mcDic8d1h8i9W6USdXxmOf5++ey1PoVe8iwhwWrd7j2jnbSFtOQFP
         LrJOzUw8HZgL9PWAyUKMKIiTiX88480nC30E6qhd5MzUposcyYW+aeSaFqGUetmczZfV
         Ga8v49Mt5qCiSlMB7PMPX4aMOBEkjo0SVBqwRageEE4HKFpYrAr085MXvnZSRInIZLzj
         egTfgVfKngsAUJV0GMu906MdBiAngpITmzmzNBTf+S9mQCwwEtpfkyobmxBqTWbKVSA6
         h32Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFddh/niXBMFGPkK4EKHwDB3p+1PgnBvbFsew7J+Lwsqq/5iummeOLqvEPfpb4GS2EH3kht3rE+EI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyd8Ib+phgw6P6G46K8rcdnntTLOqDwmv44F37h0ar/Yb6Ojd3Y
	AGqEHcGPgB0/l2zWECvSuV/aOvEoFpGKj27vCCfJAIu68Okjq3qj
X-Google-Smtp-Source: AGHT+IEytm3Nn50CtNxcbxcAeV6p4F2EE7ghw4mWw6b/f9wSGCG24DgELQk/VG7/2JRWXB6w+iuUww==
X-Received: by 2002:a05:651c:1589:b0:2fc:a347:6d87 with SMTP id 38308e7fff4ca-2ff20162111mr10285211fa.13.1731056753203;
        Fri, 08 Nov 2024 01:05:53 -0800 (PST)
Message-ID: <05906194cc4197d281142734baa48118afb64b4f.camel@gmail.com>
Subject: Re: [PATCH v2] CHANGELOG: Add note about xAPIC destination mode
 change
From: oleksii.kurochko@gmail.com
To: Matthew Barnes <matthew.barnes@cloud.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>, Jan Beulich
	 <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Date: Fri, 08 Nov 2024 10:05:49 +0100
In-Reply-To: <f7e299a8c1af7c5875e07f80b0229b1cd322a5f6.1730987624.git.matthew.barnes@cloud.com>
References: 
	<f7e299a8c1af7c5875e07f80b0229b1cd322a5f6.1730987624.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Thu, 2024-11-07 at 14:08 +0000, Matthew Barnes wrote:
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> Changes in v2:
> - Move notes from "Removed" to "Changed" section
> ---
> =C2=A0CHANGELOG.md | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 674944cbe4fb..8553b2e4516e 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -10,6 +10,8 @@ The format is based on [Keep a
> Changelog](https://keepachangelog.com/en/1.0.0/)
> =C2=A0 - Fixed blkif protocol specification for sector sizes different
> than 512b.
> =C2=A0 - On x86:
> =C2=A0=C2=A0=C2=A0 - Prefer ACPI reboot over UEFI ResetSystem() run time =
service
> call.
> +=C2=A0=C2=A0 - Switched the xAPIC flat driver to use physical destinatio=
n mode
> for external
> +=C2=A0=C2=A0=C2=A0=C2=A0 interrupts instead of logical destination mode.
> =C2=A0
> =C2=A0### Added
> =C2=A0 - On Arm:


