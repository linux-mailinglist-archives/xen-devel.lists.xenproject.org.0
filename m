Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477D0547691
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 18:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347296.573582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o04Gq-0005Lz-CO; Sat, 11 Jun 2022 16:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347296.573582; Sat, 11 Jun 2022 16:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o04Gq-0005Ip-8y; Sat, 11 Jun 2022 16:47:32 +0000
Received: by outflank-mailman (input) for mailman id 347296;
 Sat, 11 Jun 2022 16:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2a3a=WS=t-online.de=vr_qemu@srs-se1.protection.inumbo.net>)
 id 1o0455-0003UM-0f
 for xen-devel@lists.xenproject.org; Sat, 11 Jun 2022 16:35:23 +0000
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ad7a9cc-e9a4-11ec-8901-93a377f238d6;
 Sat, 11 Jun 2022 18:35:21 +0200 (CEST)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout06.t-online.de (Postfix) with SMTP id 6B4A110102;
 Sat, 11 Jun 2022 18:34:40 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.233.154]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1o044C-06EtoP0; Sat, 11 Jun 2022 18:34:29 +0200
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
X-Inumbo-ID: 7ad7a9cc-e9a4-11ec-8901-93a377f238d6
Message-ID: <60c72935-85ce-4e24-43a5-119f6428b916@t-online.de>
Date: Sat, 11 Jun 2022 18:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PULL 00/17] Kraxel 20220610 patches
To: Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220610092043.1874654-1-kraxel@redhat.com>
 <adec1cff-54f1-e2bf-8092-945601aeb912@linaro.org>
Content-Language: en-US
In-Reply-To: <adec1cff-54f1-e2bf-8092-945601aeb912@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1654965269-01432E2F-9B3FCAFB/0/0 CLEAN NORMAL
X-TOI-MSGID: 97fb026e-e35c-459b-a063-121af80287a2

Am 10.06.22 um 22:16 schrieb Richard Henderson:
> On 6/10/22 02:20, Gerd Hoffmann wrote:
>> The following changes since commit 
>> 9cc1bf1ebca550f8d90f967ccd2b6d2e00e81387:
>>
>>    Merge tag 'pull-xen-20220609' of 
>> https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging 
>> (2022-06-09 08:25:17 -0700)
>>
>> are available in the Git repository at:
>>
>>    git://git.kraxel.org/qemu tags/kraxel-20220610-pull-request
>>
>> for you to fetch changes up to 02319a4d67d3f19039127b8dc9ca9478b6d6ccd8:
>>
>>    virtio-gpu: Respect UI refresh rate for EDID (2022-06-10 11:11:44 
>> +0200)
>>
>> ----------------------------------------------------------------
>> usb: add CanoKey device, fixes for ehci + redir
>> ui: fixes for gtk and cocoa, move keymaps, rework refresh rate
>> virtio-gpu: scanout flush fix
>
> This introduces regressions:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/2576157660
> https://gitlab.com/qemu-project/qemu/-/jobs/2576151565
> https://gitlab.com/qemu-project/qemu/-/jobs/2576154539
> https://gitlab.com/qemu-project/qemu/-/jobs/2575867208
>
>
>  (27/43) 
> tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password: 
> ERROR: ConnectError: Failed to establish session: EOFError\n Exit 
> code: 1\n    Command: ./qemu-system-x86_64 -display none -vga none 
> -chardev 
> socket,id=mon,path=/var/tmp/avo_qemu_sock_4nrz0r37/qemu-2912538-7f732e94e0f0-monitor.sock 
> -mon chardev=mon,mode=control -node... (0.09 s)
>  (28/43) tests/avocado/vnc.py:Vnc.test_change_password:  ERROR: 
> ConnectError: Failed to establish session: EOFError\n    Exit code: 
> 1\n    Command: ./qemu-system-x86_64 -display none -vga none -chardev 
> socket,id=mon,path=/var/tmp/avo_qemu_sock_yhpzy5c3/qemu-2912543-7f732e94b438-monitor.sock 
> -mon chardev=mon,mode=control -node... (0.09 s)
>  (29/43) 
> tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password: 
> ERROR: ConnectError: Failed to establish session: EOFError\n Exit 
> code: 1\n    Command: ./qemu-system-x86_64 -display none -vga none 
> -chardev 
> socket,id=mon,path=/var/tmp/avo_qemu_sock_tk3pfmt2/qemu-2912548-7f732e93d7b8-monitor.sock 
> -mon chardev=mon,mode=control -node... (0.09 s)
>
>
> r~
>

This is caused by [PATCH 14/17] ui: move 'pc-bios/keymaps' to 
'ui/keymaps'. After this patch QEMU no longer finds it's keymaps if 
started directly from the build directory.

With best regards,
Volker


