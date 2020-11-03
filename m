Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4D62A5430
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 22:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18708.43704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka3YH-0003Vu-JU; Tue, 03 Nov 2020 21:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18708.43704; Tue, 03 Nov 2020 21:09:13 +0000
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
	id 1ka3YH-0003VV-GU; Tue, 03 Nov 2020 21:09:13 +0000
Received: by outflank-mailman (input) for mailman id 18708;
 Tue, 03 Nov 2020 21:09:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHuI=EJ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1ka3YF-0003VQ-8v
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 21:09:11 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2015d19a-33f9-4d16-9fa4-7c529e393609;
 Tue, 03 Nov 2020 21:09:10 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a7so24142988lfk.9
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 13:09:09 -0800 (PST)
Received: from [100.64.112.11] (ll-18.209.223.85.sovam.net.ua. [85.223.209.18])
 by smtp.gmail.com with ESMTPSA id k23sm4263023lfm.144.2020.11.03.13.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 13:09:07 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gHuI=EJ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1ka3YF-0003VQ-8v
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 21:09:11 +0000
X-Inumbo-ID: 2015d19a-33f9-4d16-9fa4-7c529e393609
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2015d19a-33f9-4d16-9fa4-7c529e393609;
	Tue, 03 Nov 2020 21:09:10 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a7so24142988lfk.9
        for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 13:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=cVJnL9ewxvYcGID+vmkXVywCXdNU0ReBKwTW336NY+8=;
        b=JdQGgjULIgafS8NgexgfnaV3QmIIAJ1Y05EcQ6vDxxcEEq0tLg+CBRdLBhTgr9bP3K
         ACsY5PLgFcy3s1d1l7FfTUuU4xtM8wbN2TZNm7UctoTO+FH81CIl7pbpMvEfANtVMJXf
         7tSo+Tgs08VNE0XnLw3eUsi3yi60thBZlMnjtAIqaY3+aFcmXmLhu4YwInIobwA79yxp
         1L5X5Ew6An8uH6nZ8S8s0Eext/KsVMZ+Su3hZBmgLK1KLsZ7tqbQcF/41ACsifnJKwYL
         xVG87gT7TzS5uB9te/EFa0XVML3lNied4X7WrLGVDviO8vM8/0RazYWfFHmLK+lLeaUs
         +4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=cVJnL9ewxvYcGID+vmkXVywCXdNU0ReBKwTW336NY+8=;
        b=b1PgM6Ka/Q0ADGb7RKrh2/H+cdte97bb5ThsxXfm2MOOOqTP1Uzro5PB+olS/54Cea
         ajLoTbwj+p+tWYUQJiDyI+IlBtLzDNcx3POP+GSFap/6lBeNVI5IWfdJY/Ihtk4WmO91
         pkuqc0a1U3xCY1i4uOLZhZFB03CiYv0w4gwxgyI4pUzO5lZU7A7SHQG//Ay0o0I/Mn4d
         O+gUD9e25cB1+Hup8Hyvyx7gwWopdsGx1vwY48AI1YVkE9sKqE6bA1XgN+T0eALPzXKa
         rOLZ5KZN0KGKf0WHPnDtJLwk3vxHvsFTrgncFn5E22PEhH5WMKevnlpKJiIoqKN99bnA
         hKmQ==
X-Gm-Message-State: AOAM532CWCnqfEWV8SJhv7iSyAHItEwjKCyEEMUXBBaOhP5/EL3LbOZJ
	kbDPOWgJSt1VHL0TDjmdv98=
X-Google-Smtp-Source: ABdhPJzvh9Qc+v40cQh7jyFuPp1pn7qBhVfemeuTrJZGoZWRgdiaxHrLgPVr9/EvOjphJ7rmMgXcsw==
X-Received: by 2002:a05:6512:3193:: with SMTP id i19mr8927230lfe.80.1604437748765;
        Tue, 03 Nov 2020 13:09:08 -0800 (PST)
Received: from [100.64.112.11] (ll-18.209.223.85.sovam.net.ua. [85.223.209.18])
        by smtp.gmail.com with ESMTPSA id k23sm4263023lfm.144.2020.11.03.13.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 13:09:07 -0800 (PST)
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
To: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Tim Deegan <tim@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
 <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com>
 <alpine.DEB.2.21.2010291252410.12247@sstabellini-ThinkPad-T480s>
 <CAPD2p-mH0Hi+JOUB-mt+aZR_gN86EZCpnMPTww0ErMESTwZ=AA@mail.gmail.com>
 <CAA93ih3Z-zxQ33gvr2C43i0J5XP3OBgUhTyMcwhe9zVj-uOONA@mail.gmail.com>
 <CAPD2p-=2UimQy6VHKw1FgyVi2R94Ux_HFdPYk7=FR3KWSEqiHw@mail.gmail.com>
 <CAA93ih3LcHPLbL7dPof-OAbM2HRJv0neQtMuYDYcYAOYDhVbKA@mail.gmail.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d1a505ae-58f7-f096-eaaf-d249901c1861@gmail.com>
Date: Tue, 3 Nov 2020 23:09:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAA93ih3LcHPLbL7dPof-OAbM2HRJv0neQtMuYDYcYAOYDhVbKA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 03.11.20 16:30, Masami Hiramatsu wrote:
> Hi Oleksandr,

Hi Masami


>
> Thanks for sharing the virtio-disk server, I also tested with a real usb disk.
>
> In config file:
>
> virtio = 1
> vdisk = [ 'backend=Domain-0, disks=ro:/dev/sda1' ]
>
> And it can be mounted in DomU
>
> [    2.892874] virtio_blk virtio0: [vda] 1875382927 512-byte logical
> blocks (960 GB/894 GiB)
> [    2.892925] vda: detected capacity change from 0 to 960196058624
> ...
> root@develbox:~# cat /proc/partitions
> major minor  #blocks  name
>
>   254        0  937691463 vda
> ...
> root@develbox:~# mount /dev/vda /mnt/
> [  192.260968] EXT4-fs (vda): mounted filesystem with ordered data
> mode. Opts: (null)
> mount: /mnt: WARNING: source write-protected, mounted read-only.
>
> So "ro" flag also correctly works.
> Great!
>
> Thank you!

Sounds great. Thank you for testing!


-- 
Regards,

Oleksandr Tyshchenko


