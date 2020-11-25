Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6FB2C4E2F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 06:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38139.70994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki9dF-0001yX-0U; Thu, 26 Nov 2020 05:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38139.70994; Thu, 26 Nov 2020 05:15:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki9dE-0001xx-Se; Thu, 26 Nov 2020 05:15:48 +0000
Received: by outflank-mailman (input) for mailman id 38139;
 Wed, 25 Nov 2020 23:02:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cX6R=E7=gmail.com=ecree.xilinx@srs-us1.protection.inumbo.net>)
 id 1ki3oD-000469-T0
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 23:02:45 +0000
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2802225f-6caa-4242-a188-4bdddacce7df;
 Wed, 25 Nov 2020 23:02:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 23so83248wrc.8
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 15:02:45 -0800 (PST)
Received: from [192.168.1.122]
 (cpc92720-cmbg20-2-0-cust364.5-4.cable.virginm.net. [82.21.83.109])
 by smtp.gmail.com with ESMTPSA id u129sm5552667wme.9.2020.11.25.15.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 15:02:43 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cX6R=E7=gmail.com=ecree.xilinx@srs-us1.protection.inumbo.net>)
	id 1ki3oD-000469-T0
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 23:02:45 +0000
X-Inumbo-ID: 2802225f-6caa-4242-a188-4bdddacce7df
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2802225f-6caa-4242-a188-4bdddacce7df;
	Wed, 25 Nov 2020 23:02:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 23so83248wrc.8
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 15:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ha42UWMtlXOL8kfvC1XpFKttY73p7G2gxviD5bIo2Ac=;
        b=cK16XuXEr1UlZZi/GgHF7dItPstb+7yZ2QUTp5Dxvdc6OIX52ygirnUAKuRVBOH+dK
         A20pmgUIw2HuGZFFAXCmBSAdjpUAnHlbQW6vzVJQphFFEbO8NHcI7pY1E1IYv6o5k0Qf
         jXWsM0ddqTXTn/1nZTXycpkYVMfbhxZxJ9mV7kOEU+Tec/es0pgNM20lzmzFkZBYIURn
         HK2FiFuW7CXMZxeXIL3yJ5bCH/J8M2hkcorgk3PecLezXYs+oTw3zVRlNq6FEGJfSXMe
         e5NpXkmlA2dB6AmhViUGWqJQAiQop1G/7Q0C0bZUhlLDOGEFt9XX9+Dv47nZ0Rj6T1x/
         IsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ha42UWMtlXOL8kfvC1XpFKttY73p7G2gxviD5bIo2Ac=;
        b=qIETVp5aZP1N6uw1r9UFwZX7gfdV0znpb/WHMg4sNlIOCiFsEjp+Avw1ffTtPFLKKa
         6QIucF+j+e5Z1iRfVdtVH7LUEJvW12WyIr2sSaVBixh9ace+Q0RKYKNbaAgVoxNCaLpz
         fF+M7kn6nEQFr7GyswbyDXLUPhXjsoCkMQRh14xX+XgEzPDd9sUs9/lB1QhMrjC5KD4E
         MZwqFbhNvPGBElER20zHmpQTiXjMMhnXOgcH/z79SEwphZnMLj4+l2e4LBvb7Zm1ieOW
         qS2YMPpjsFP5ukBLUk9M3wyAonKiUJzZqk0G/KTEn1EnSPtwNrz0vw3hkdNomac4jU0K
         IYNw==
X-Gm-Message-State: AOAM533Vu5xCmmd9wwPEThI2chtQliOhsuCUQwW4/yNBpvT7IMMHwlYy
	rpNb1fNFvso2oIQ3x4R8qYI=
X-Google-Smtp-Source: ABdhPJzir63ZhkohioP0Ktx42tkGcEWW5m4eKxg+CUjAscHddZDwqHZSdjbm/E0JNHFBggGwkKFODQ==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr180470wrs.235.1606345364309;
        Wed, 25 Nov 2020 15:02:44 -0800 (PST)
Received: from [192.168.1.122] (cpc92720-cmbg20-2-0-cust364.5-4.cable.virginm.net. [82.21.83.109])
        by smtp.gmail.com with ESMTPSA id u129sm5552667wme.9.2020.11.25.15.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 15:02:43 -0800 (PST)
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 bridge@lists.linux-foundation.org, ceph-devel@vger.kernel.org,
 cluster-devel@redhat.com, coreteam@netfilter.org,
 devel@driverdev.osuosl.org, dm-devel@redhat.com, drbd-dev@lists.linbit.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 GR-everest-linux-l2@marvell.com, GR-Linux-NIC-Dev@marvell.com,
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
 keyrings@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 linux-acpi@vger.kernel.org, linux-afs@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-atm-general@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-can@vger.kernel.org, linux-cifs@vger.kernel.org,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, linux-decnet-user@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-geode@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-hams@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
 linux-rdma@vger.kernel.org, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, linux-scsi@vger.kernel.org,
 linux-sctp@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 netfilter-devel@vger.kernel.org, nouveau@lists.freedesktop.org,
 op-tee@lists.trustedfirmware.org, oss-drivers@netronome.com,
 patches@opensource.cirrus.com, rds-devel@oss.oracle.com,
 reiserfs-devel@vger.kernel.org, samba-technical@lists.samba.org,
 selinux@vger.kernel.org, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, usb-storage@lists.one-eyed-alien.net,
 virtualization@lists.linux-foundation.org, wcn36xx@lists.infradead.org,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 xen-devel@lists.xenproject.org, linux-hardening@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda
 <ojeda@kernel.org>, Joe Perches <joe@perches.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>
 <202011241324.B3439A2@keescook>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <99a9ffd7-6356-b81d-6e08-7ed74b6fb82c@gmail.com>
Date: Wed, 25 Nov 2020 23:02:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <202011241324.B3439A2@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 24/11/2020 21:25, Kees Cook wrote:
> I still think this isn't right -- it's a case statement that runs off
> the end without an explicit flow control determination.

Proves too much — for instance
    case foo:
    case bar:
        thing;
        break;
 doesn't require a fallthrough; after case foo:, and afaik
 no-one is suggesting it should.  Yet it, too, is "a case
 statement that runs off the end without an explicit flow
 control determination".

-ed

