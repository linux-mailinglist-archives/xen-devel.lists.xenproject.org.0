Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66BB946EF6
	for <lists+xen-devel@lfdr.de>; Sun,  4 Aug 2024 15:18:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771659.1182135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sab7T-0001Ko-IS; Sun, 04 Aug 2024 13:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771659.1182135; Sun, 04 Aug 2024 13:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sab7T-0001IL-Er; Sun, 04 Aug 2024 13:17:55 +0000
Received: by outflank-mailman (input) for mailman id 771659;
 Sun, 04 Aug 2024 13:17:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufFg=PD=yahoo.com=avikalpa@srs-se1.protection.inumbo.net>)
 id 1sab7R-0001IE-5c
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2024 13:17:53 +0000
Received: from sonic306-20.consmr.mail.sg3.yahoo.com
 (sonic306-20.consmr.mail.sg3.yahoo.com [106.10.241.140])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f09e13c1-5263-11ef-8776-851b0ebba9a2;
 Sun, 04 Aug 2024 15:17:49 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.sg3.yahoo.com with HTTP; Sun, 4 Aug 2024 13:17:43 +0000
Received: by hermes--production-sg3-fc85cddf6-6jgr8 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 37747466b1a90a07168896b733ea2d20; 
 Sun, 04 Aug 2024 13:17:43 +0000 (UTC)
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
X-Inumbo-ID: f09e13c1-5263-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1722777463; bh=KTuMdd1zh6HTDH2YhL7095Abn07VWBYYH9xAFPngVZ4=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=sQYokT/er7U+fm/NXGGLqGuFrzGTuvsedt9Xuo/YTbGknZ1YJxz9KbWv+INoqKYv4bIe3dtRvGiFrmr95fV9RRKGet98RrQMbQuG1y22B4DCBLIBmzF1IJ+IGdhfFjl7xBsj/jtmv/lNISNqqtOVtxj5Eok1pYbknCZA2CjhCptgUCfQF1O1OgcXBVvXpnonFRYcoMldNpOi8FzJpU7CRkRggXb/4KtFBMOiquZZlCMoRPhwwKgocFZ39UJvxh2KduKo6AONpq1HiRmnVaxIieMJj/2fTDk2ztLdjD/BJip6iTndui9noeXqcK7dZM1oxEz8cbFUQoCu3HExnK1ibA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1722777463; bh=bI6cyOFgBn+wEt/H6ZDs8QZTm0BWA3SV+KxzWmck2Oy=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=jgtfumF2s+jg3wneMdXT5zyg1fKBUZGZoNNKbeZAIAlH/fXIEM2hBz6hCN6BiR9emG0MyxJUW33B+W5rfeZRx4LwHhidU76zs/mReowJf3COMV48R9kVNFGYMCndgPVx3+0+be0xQx99DCcDduNrjdIil2kVPM8NstHZW2SdaAQMLldXruWogqpWLPXTNM+wOVwXeHBX868gXPX48zz7GYZfYmTsN/aeBfiay9GQKzPw2dEQfrfNVr4UgC6hDNu69D+5Wi+zzk2XMTPq96egtu8jcNRcNJ3EYHIlyG3Ue3XnUifGnss2vA+8utcMmb4S0BlGs+7BIPOhR2lcIXTF/w==
X-YMail-OSG: 8H3zK2oVM1mu_UzawiwNFOMntvun56b2MS1sHxEeFXGjAhcPPi6VSb.KzWVFhJ0
 oM22j1FXUJ3o0Ow1fRxcGKvLyPq1oJsq.0FTvuvWcsymPgHbNptJO7HHUt2CHTAPQpnozVRovt4g
 JSZwu4hFMv7HtfwMjICzaH27b_dgjEcrFEG5yEBy1b7U8.63LKNc_yJp5rMyIP0Nbb16PdwpA0Hj
 ZZmti62AiZuZcxDUkgn8NzA5rYaory68_FPVMlm.N_rZqpVexLk2WmZ5VTuMa4VpKUEcAmT.3ZnX
 OPUqeQkKO8Du2K7gZecRlCTFlyNFgmMh09EBzxA_JHDGIWUs4Cyu3T7oypWPVffJ34HBKbfj8SH3
 BG0NymIE4bgiSgExSFRsc.H8xRNgoo3Wo3OOoFGyiPHOjPBOLXFKRvXp5ggnNecyDKe.CPgCUEoF
 mhAjamf.n2JrZI7MoC4yO48hIevQbIFGq9FanK3rks.kcfuNvZ5dF_zCIUPW1EXWH1hZEu.dvTHf
 Th6vLE6mI_Ifr6d9XTfUfhRXmULxYLdofTSv2TeCNycON4QXREij7aU1YlNlLVISKssUmAORHQUY
 ce18DW0I9T7ySxmpVWCYFRyJdntiThK_TQDu59ekrdIYEkfNnQrtH7htAzBUm3vDX68htfmNEIFd
 V6YzTvO7ASB9kZQJwAp8_brFYkXRgaMnaJVPLTbx64_o79K2N18vSUQ0B7b1R5n8mZfu1cbxHFyP
 QW3Gc7hg3WUp361hcEXsSOFPhdVb9oAHdwbw17wSvF_m27wvVz50vqizz9MQ1qUbnAZvYTp.0ZQp
 OTdz4FRAiPTOo5fO7ZwszKRQvwrU3z88YCxQlr4ucVo31Lzz9C2RhKqeWcRG1AKnTYaQ5GUnUdJ3
 V2iEkYKtZwxgL7Pni7MUl9VrjqRosDwxiGBYpmyfjV05ls.whXh95dNQ4sUEzsRoRvNgbgtLkX6Y
 c.KDMTXqyuMLK9xacUlMfHSDZhBaVF1Rr4s0ptLTA9TKYgcn0JfEAgOyW3DiDwm2BU5r8QTo52Ke
 s.6eOXGZuOIPluvQQAe_4ABXz1KmI3f8r0HAIYKPHj8lEuA0KIV90NsTE3l4Bb1mI_PNQy4O_vTT
 4aHYNtYJiRbY7vTyGoAgRysgmjRabCup4er9vh1rNv4WnPtT2r6wqBsZ_2O.nywtWzP6uMbUi3SX
 StxO2AdlerSzocObWJE7Xs1WrlZV338u9cVRNXfwyfNyvj.Cu0lYx.5iQLB2X9graverN2z0wNrK
 bjtywPRdGn.bQRap3JrKt1K1oI5pcPBg7PvY0TnYfIYZh8zqEjFeiUQdhZnqqkTg1swVWZj4TTHf
 hB5ZYyTH5YMPC7gXnL3LN_F3z4y830VNCc6qE5f.owVTGZZl4M_1Mewr.yAgaZ11Et3yoQPNwiOj
 jwq9qfs2yYaVK5VJuM.3lqnV6lwXqf7FRuNEy7mFys7arcSTxb9otAiptgBFmAofVq7Az1ISh17m
 RNjsehFKK9AjXL0brRsz4D55ilFPr2PQANTrYq58Ubfh5E6_II_25x6ou7vDOEBwp.S0cDwVSGSR
 XGE47HPAcX8dG8dQ2L0XgE8q1BMsYRAUiBUJzsSxyxX1Hxrqn411.GNd7VLpTOvMMNZBck_9e5B.
 GXvFKYLCQZflt6qUAzBS8XIVSxn8Bcs5RxYBejlorXp229rHMW.hkO7jNsdNM5y3Fg.mNl_KAa2C
 BkAZ.WnD0SgWMNm.0FDbunUaGPEKltkSUhMl38NORGP3zs8QNJZJ8q6Gn7jAyjLXMf__q_l.rNIC
 0ZzO_Tvr3GgADDpdkwcjEAr3an__PyZTxhAz.T3Q9DKI89erzYfT5dUj2haQ3oKfFI8YGkb3sEMJ
 HIM9kyMsf3_rTwx2KKCeVgx73SFIQQMK7OsaOyyTiEyDQ.7MivheTg9052BygNQ4jIB1xMflK5j0
 6GjBiyfDhiqhBKsSf0Zo472DuwYKe7YVea9A3aSGhY.k_ivGHj80JrpJhLhCwIrgbLru1yC7UHk7
 _X8KEr8z1atWBrogwIaWpuEKNo5oUBogZbtbqmTbyt3cf4ZjyHS4p_8JPfaJSIywYzGLJB0.VkjY
 zaErbMPlGEz5hAA.TFcwXGmW7sv.PUCq8s1wnRwxl0FxHfc3EpIpDH78MquISftexO8Xmwosi3QM
 USmEcA7P_tlvk_pK3NmYY.rAK9hsYGJu8rgXRJ42qJG6v6AZkWUWi3IC5KN5DekJtfC6q3kYiR52
 oFA--
X-Sonic-MF: <avikalpa@yahoo.com>
X-Sonic-ID: b9a632db-0c31-4574-a195-875efe122acf
Message-ID: <dc5c9dff-6bee-493a-8315-b2eee48bd802@yahoo.com>
Date: Sun, 4 Aug 2024 18:47:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kexec failure with Xen 4.19-rc4 and 4.20-dev on linux host
To: Jan Beulich <jbeulich@suse.com>
Cc: kexec@lists.infradead.org, horms@verge.net.au,
 xen-devel@lists.xenproject.org, Baoquan He <bhe@redhat.com>,
 andrew.cooper3@citrix.com
References: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26@yahoo.com>
 <cebc7800-df78-4f90-9f8e-82e3f9120b6e@yahoo.com>
 <ZqxUMgcEHakeFPaU@MiWiFi-R3L-srv>
 <abaceb99-4b80-49d7-ab7f-b190f73e858d@yahoo.com>
 <ac57dec1-68a3-471d-8f4c-c87fd9dca619@suse.com>
Content-Language: en-US
From: A Kundu <avikalpa@yahoo.com>
In-Reply-To: <ac57dec1-68a3-471d-8f4c-c87fd9dca619@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.22544 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 8/2/24 13:25, Jan Beulich wrote:
 > On 02.08.2024 09:28, A Kundu wrote:
 >> On 8/2/24 09:06, Baoquan He wrote:
 >>> On 07/31/24 at 06:34pm, A Kundu wrote:
 >>>> I am experiencing issues using kexec to load Xen 4.17(debian's apt 
version),
 >>>> Xen 4.19-rc4 (compiled from source) and 4.20-dev (compiled from 
source) on a
 >>>> debian host.
 >>> You should CC this to XEN dev list so that XEN dev knows this and may
 >>> provide help. Not everyone is interested in and knows XEN.
 >>>
 >>>> System information:
 >>>> $ uname -a
 >>>> Linux host 6.9.10-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.9.10-1 
(2024-07-19)
 >>>> x86_64 GNU/Linux
 >>>>
 >>>> $ kexec --version # compiled from source tarball with ./configure 
--with-xen
 >>>> kexec-tools 2.0.29
 >>>>
 >>>> Steps to reproduce:
 >>>>
 >>>> 1. Set variables:
 >>>>
 >>>> XEN_HYPERVISOR="/boot/xen.gz"
 >>>> XEN_CMD="dom0_mem=6G dom0_max_vcpus=6 dom0_vcpus_pin cpufreq=xen"
 >>>>
 >>>> 2. Attempt to load Xen 4.19-rc4:
 >>>>
 >>>> # kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD"
 >>>> Could not find a free area of memory of 0x3b6001 bytes...
 >>>> elf_exec_build_load_relocatable: ELF exec load failed
 >>>>
 >>>> 3. Attempt to load Xen 4.20-dev:
 >>>>
 >>>> # kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD"
 >>>> Could not find a free area of memory of 0x3f8001 bytes...
 >>>> elf_exec_build_load_relocatable: ELF exec load failed
 >>>>
 >>>> 4. Attempt to load Xen 4.17 (from debian rrepositories):
 >>>> # kexec -l /boot/xen-4.17-amd64.gz --command-line="$XEN_CMD"
 >>>> Could not find a free area of memory of 0x3b4001 bytes...
 >>>> elf_exec_build_load_relocatable: ELF exec load failed
 >
 > And with all of them saying effectively the same, did you verify you
 > actually have a sufficiently large area reserved? The obvious
 > place for you to look at is Xen's boot log (obtained via serial
 > console or "xl dmesg" immediately after booting the system). If you
 > find everything as expected there, ...
 >
 >>>> If you need any further information to investigate this problem,
 >>>> please let me know.
 >
 > ... please provide that boot log.

Dear Jan,

Thank you for your response and suggestions.

As mentioned in my original message, I have already attempted to load
Xen using kexec with various versions (4.17, 4.19-rc4, and 4.20-dev),
all of which resulted in the same error:

Could not find a free area of memory of 0x3b6001 bytes...
elf_exec_build_load_relocatable: ELF exec load failed

I have also followed up on your suggestion to check the Xen boot log
using "xl dmesg", but unfortunately, I received the following error:

xencall: error: Could not obtain handle on privileged command interface: 
No such file or directory
libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No 
such file or directory
cannot init xl context

This indicates that Xen did not boot successfully, so there are no logs
available.

 >
 > And with all of them saying effectively the same, did you verify you
 > actually have a sufficiently large area reserved? The obvious
 > place for you to look at is Xen's boot log (obtained via serial
 > console or "xl dmesg" immediately after booting the system). If you
 > find everything as expected there, ...
 >

In an attempt to resolve the memory allocation issue, I have tried the
following:

Added a crashkernel=<size>@<offset> parameter to the host kernel command
line to reserve a dedicated memory region for kexec, and attempted to
load Xen into that area.

Experimented with the mem=<size> parameter to limit the amount of memory
used by the host kernel, hoping to leave more contiguous space available
for loading Xen.

Unfortunately, neither of these approaches resolved the issue, and I
still encounter the same memory allocation error when attempting to load
Xen with kexec.

I have also reviewed the available documentation for kexec and Xen, but
much of it appears to be outdated, referencing archaic options like
--vmm which no longer exist in the current version of kexec-tools.

 > Jan

At this point, I'm unsure of how to proceed. I suspect the issue may be
related to changes in the kexec codebase and its interaction with Xen,
as kexec docs for Xen has not been actively maintained since 2017.

git log -1 --format="%ad" -- docs/misc/kexec_and_kdump.txt
Fri Jun 9 14:11:37 2017 +0200

If it's not too much to ask, could you please check if you can
successfully launch the Xen kernel using kexec with kexec-tools
version > 2.x.x and a Linux kernel version >= 6.6?

I have never been able to boot the Xen kernel with anything (syslinux,
zfsbootmenu)other than GRUB and mboot.c32, as used by Citrix or XCP-ng.

In fact, I have never come across a Xen distribution that doesn't rely
on GRUB for xen, which makes me question whether kexec'ing the Xen
kernel is even possible at this point.


For reference, I'm providing a log of my attempts to boot Xen using
ZFSBootMenu (a barebones linux kernel trying to boot via kexec; other 
details irrelevant):

tee: /zfsbootmenu/environments/zroot/ROOT/debian/mnt/var/zbm.log: 
Read-only file system
=== Attempting to Launch Xen ===
Selected Kernel     : /boot/vmlinuz-6.9.12-amd64
Selected initramfs  : /boot/initrd.img-6.9.12-amd64
Selected BE         : zroot/ROOT/debian
Selected Mountpoint : /zfsbootmenu/environments/zroot/ROOT/debian/mnt
ZFSBootMenu kernel commandline: quiet loglevel=0

zfs get org.zfsbootmenu:commandline zroot/ROOT/debian
NAME               PROPERTY VALUE                                        
SOURCE
zroot/ROOT/debian  org.zfsbootmenu:commandline  quiet crashkernel=0M 
memmap=64M$0x100000000  local
(^^^ This is the linux/dom0 commandline, executed by kexec)

=== Memory reported by head /proc/meminfo ===
MemTotal:        8044084 kB
MemFree:         7822332 kB
MemAvailable:    7687320 kB
Buffers:              0 kB
Cached:           49136 kB
SwapCached:           0 kB
Active:           45868 kB
Inactive:             0 kB
Active(anon):     45868 kB
Inactive(anon):       0 kB
=== End of Memory Report ===

Xen kernel found. Attempting kexec...
Xen Kernel Path     : 
/zfsbootmenu/environments/zroot/ROOT/debian/mnt/boot/xen.gz
Try gzip decompression.
Could not find a free area of memory of 0x3ba001 bytes...
elf_exec_build_load_relocatable: ELF exec load failed
Executing kexec...
Nothing has been loaded!

After booting into linux what happens, I have already shared.

If you have any further insights or suggestions on how to overcome this
memory allocation issue or successfully boot Xen using kexec on a modern
system, I would greatly appreciate your guidance.

Thank you for your time and assistance.

Best regards,
A Kundu

