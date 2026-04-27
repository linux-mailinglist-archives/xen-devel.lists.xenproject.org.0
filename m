Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAA2Kc2y72n5DwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 21:02:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44868478F5F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 21:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295253.1571939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHRDp-00050K-Gp; Mon, 27 Apr 2026 19:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295253.1571939; Mon, 27 Apr 2026 19:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHRDp-0004ys-Dm; Mon, 27 Apr 2026 19:02:21 +0000
Received: by outflank-mailman (input) for mailman id 1295253;
 Mon, 27 Apr 2026 19:02:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <deller@gmx.de>) id 1wHRDo-0004ym-GV
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 19:02:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHRDn-00GeOw-P9
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 21:02:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <deller@gmx.de>)
 id 69efb2a3-2eae-0a2a0a5409dd-0a2a4508901e-26
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 21:02:19 +0200
Received: from [212.227.15.18] (helo=mout.gmx.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <deller@gmx.de>)
 id 69efb2bb-63b5-0a2a45080019-d4e30f12bf23-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 21:02:19 +0200
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXUD-1vxzDK309n-00RQkF; Mon, 27
 Apr 2026 21:01:21 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=s31663417 header.d=gmx.de header.i="deller@gmx.de" header.h="X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777316482; x=1777921282; i=deller@gmx.de;
	bh=Zt1qoBiZgQM1t1btlI0mC79addHEa7yO7OT0uaav6JI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pvJKKcq2bvRAhsxjqAkSqPCTHz+c9uXutnBUNfweFC5C6v6Q3EgeOKe/MJanf1Ba
	 sAehF4t5/xUIpLJRVOl0YNFM0UY2s1ZtmOUE+OxOPa2dZ4N+GaoaNXUJVeKbqUObc
	 zWTti5uW04mbR8LXlYdWXdzH0idgP2vWBzyha8fXbLatDwnhl5ulQbpKW/B/LIbfq
	 m9Sk/0zz5Hq5YiFn5LKjsXeE3bvcDSyAbbuH306N8cXcn/B+mqRHa0DLJIfFBgcYb
	 SPUzS1OgVVxqH7BapIrTRFMwx269SyWfjiAxp4nbh+xegJyY+50MN5oyqjtATSzbv
	 OtP1eu9OBKhkgrJwaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Message-ID: <844ee1e8-e7e2-40ef-a2b1-b7a6b6a44cb2@gmx.de>
Date: Mon, 27 Apr 2026 21:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/9] uaccess: Convert small fixed size
 copy_{to/from}_user() to scoped user access
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <david.laight.linux@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
References: <cover.1777306795.git.chleroy@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <cover.1777306795.git.chleroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1BVGzEnh9ud/z86J5vc3jwqhrUEQaFN9ezvONBNWk23lK0h66Lj
 0xrtgBmMIOPcBoDWmEQeS4PXCvzdwIxhn4Pzilub15kM3Feqk0H3eDb2tX/MG5xgU1O6fnx
 QeGvXu9BfFIEYVIV+dF2H3PKbCBnzALlwBp4AW5heloRv5iuM8nQW3/zjVECVWKsEM94tAo
 sS/Thsodt5emF3NO5Yt1A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0TjjV61NXRM=;CbjUzEi6igRLCIXmnNBp946d8aL
 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
X-purgate-ID: tlsNG-c1860d/1777316539-C3F7ADB1-BE51A611/0/0
X-purgate-type: clean
X-purgate-size: 8501
X-Rspamd-Queue-Id: 44868478F5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:ynorov@nvidia.com,m:akpm@linux-foundation.org,m:torvalds@linux-foundation.org,m:david.laight.linux@gmail.com,m:tglx@linutronix.de,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:dmaengine@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-fsi@lists.ozlabs.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:linux-wpan@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-serial@vger.kernel.org,m:linux-usb@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-fsdevel@vger.ke
 rnel.org,m:ocfs2-devel@lists.linux.dev,m:bpf@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-x25@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-sound@vger.kernel.org,m:sound-open-firmware@alsa-project.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-arch@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[deller@gmx.de,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,linux-foundation.org,gmail.com,linutronix.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:dkim,gmx.de:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]

Hello Christophe,

On 4/27/26 19:13, Christophe Leroy (CS GROUP) wrote:
> A lot of copy_from_user() and copy_to_user() perform copies of small
> fixed size pieces of data between kernel and userspace, and don't
> care about partial copies.
>=20
> copy_from_user() and copy_to_user() are big functions optimised for
> copying large amount of data, with cache management, etc ...=20

They take care of much more: alignments, exception handling (e.g. if userp=
age
is read-only and kernel writes to it), various rules when to return faults
(e.g. sometime reading from page0 is allowed for other arches not), and
much more. I've seen so many strange things during the last few years,
and you would need to get it right if you want to "make small" versions
of those functions.

> This is often overkill for small copies that could just be inlined
> instead.

Isn't put_user() and get_user() for that ?
And if you inline you need to take care of faults as well, so indirectly
you will add more fault handlers (or fault pointers) to the generated code=
,
effectively making the kernel bigger.

> What makes things a bit more tricky is that those copy functions
> are designed to handle partial copies in case of page fault. But among
> the 6000 callers of those functions, only 2% really care about the
> quantity of no-copied data that those functions return. All other ones
> fails as soon as the returned value is not 0, returning -EACCESS.
>=20
> So first step in this series is to introduce variants called
> copy_from_user_partial() and copy_to_user_partial() which will be
> called by the 2% users that care about the partial copy, then the
> original copy_from_user() and copy_to_user() are changed to return
> -EFAULT when the copy fails.
>=20
> Then the second step is to implement copy of small fixed-size data
> with scoped user access instead of calling the arch specific heavy
> user copy functions.

I'm not against your idea or your patch, but I wonder if you
really gain much from it.
Have you done some size or speed comparisons ?

Helge

> Patch 5, can be split in different patches for each archicture or
> subsystem, but let's get a first feedback and agree on the principle.
>=20
> Christophe Leroy (CS GROUP) (9):
>    uaccess: Split check_zeroed_user() out of usercopy.c
>    uaccess: Convert INLINE_COPY_{TO/FROM}_USER to kconfig and reduce
>      ifdefery
>    x86/umip: Be stricter in fixup_umip_exception()
>    uaccess: Introduce copy_{to/from}_user_partial()
>    uaccess: Switch to copy_{to/from}_user_partial() when relevant
>    uaccess: Change copy_{to/from}_user to return -EFAULT
>    x86: Add unsafe_copy_from_user()
>    arm64: Add unsafe_copy_from_user()
>    uaccess: Convert small fixed size copy_{to/from}_user() to scoped use=
r
>      access
>=20
>   arch/alpha/Kconfig                            |   1 +
>   arch/alpha/kernel/osf_sys.c                   |   4 +-
>   arch/alpha/kernel/termios.c                   |   2 +-
>   arch/arc/include/asm/uaccess.h                |   3 -
>   arch/arc/kernel/disasm.c                      |   2 +-
>   arch/arm/include/asm/uaccess.h                |   2 -
>   arch/arm64/include/asm/gcs.h                  |   2 +-
>   arch/arm64/include/asm/uaccess.h              |  30 +++--
>   arch/arm64/kernel/signal32.c                  |   2 +-
>   arch/csky/Kconfig                             |   1 +
>   arch/hexagon/include/asm/uaccess.h            |   3 -
>   arch/loongarch/include/asm/uaccess.h          |   3 -
>   arch/m68k/include/asm/uaccess.h               |   3 -
>   arch/microblaze/include/asm/uaccess.h         |   2 -
>   arch/mips/include/asm/uaccess.h               |   3 -
>   arch/mips/kernel/rtlx.c                       |   8 +-
>   arch/mips/kernel/vpe.c                        |   2 +-
>   arch/nios2/include/asm/uaccess.h              |   2 -
>   arch/openrisc/include/asm/uaccess.h           |   2 -
>   arch/parisc/include/asm/uaccess.h             |   3 -
>   arch/powerpc/Kconfig                          |   1 +
>   arch/powerpc/kvm/book3s_64_mmu_hv.c           |   4 +-
>   arch/powerpc/kvm/book3s_64_mmu_radix.c        |   4 +-
>   arch/powerpc/kvm/book3s_hv.c                  |   2 +-
>   arch/riscv/Kconfig                            |   1 +
>   arch/riscv/kernel/signal.c                    |   2 +-
>   arch/s390/include/asm/idals.h                 |   8 +-
>   arch/s390/include/asm/uaccess.h               |   3 -
>   arch/sh/include/asm/uaccess.h                 |   2 -
>   arch/sparc/include/asm/uaccess_32.h           |   3 -
>   arch/sparc/include/asm/uaccess_64.h           |   2 -
>   arch/sparc/kernel/termios.c                   |   2 +-
>   arch/um/include/asm/uaccess.h                 |   3 -
>   arch/um/kernel/process.c                      |   2 +-
>   arch/x86/Kconfig                              |   1 +
>   arch/x86/include/asm/uaccess.h                |  29 ++++-
>   arch/x86/kernel/umip.c                        |   2 +-
>   arch/x86/lib/insn-eval.c                      |   2 +-
>   arch/x86/um/signal.c                          |   2 +-
>   arch/xtensa/include/asm/uaccess.h             |   2 -
>   drivers/android/binder_alloc.c                |   2 +-
>   drivers/comedi/comedi_fops.c                  |   4 +-
>   drivers/dma/idxd/cdev.c                       |   2 +-
>   drivers/firmware/efi/test/efi_test.c          |   2 +-
>   drivers/fsi/fsi-scom.c                        |   2 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   2 +-
>   drivers/gpu/drm/i915/gt/intel_sseu.c          |   4 +-
>   drivers/gpu/drm/i915/i915_gem.c               |   4 +-
>   drivers/hwtracing/intel_th/msu.c              |   2 +-
>   drivers/misc/ibmvmc.c                         |   2 +-
>   drivers/misc/vmw_vmci/vmci_host.c             |   2 +-
>   drivers/most/most_cdev.c                      |   2 +-
>   drivers/net/ieee802154/ca8210.c               |   4 +-
>   drivers/net/wireless/ath/wil6210/debugfs.c    |   2 +-
>   .../intel/iwlwifi/pcie/gen1_2/trans.c         |   2 +-
>   drivers/net/wireless/ti/wlcore/debugfs.c      |   2 +-
>   drivers/ps3/ps3-lpm.c                         |   2 +-
>   drivers/s390/crypto/zcrypt_api.h              |   4 +-
>   drivers/spi/spidev.c                          |   2 +-
>   .../staging/media/atomisp/pci/atomisp_cmd.c   |   8 +-
>   drivers/tty/tty_ioctl.c                       |  14 +--
>   drivers/tty/vt/vc_screen.c                    |   4 +-
>   drivers/usb/gadget/function/f_hid.c           |   4 +-
>   drivers/usb/gadget/function/f_printer.c       |   2 +-
>   drivers/vfio/vfio_iommu_type1.c               |   4 +-
>   drivers/xen/xenbus/xenbus_dev_frontend.c      |   2 +-
>   fs/namespace.c                                |   2 +-
>   fs/ocfs2/dlmfs/dlmfs.c                        |   2 +-
>   fs/proc/base.c                                |   4 +-
>   include/asm-generic/uaccess.h                 |   2 -
>   include/linux/bpfptr.h                        |   2 +-
>   include/linux/sockptr.h                       |   4 +-
>   include/linux/uaccess.h                       | 107 ++++++++++++++----
>   ipc/msg.c                                     |   8 +-
>   ipc/sem.c                                     |   8 +-
>   ipc/shm.c                                     |  18 +--
>   kernel/regset.c                               |   2 +-
>   kernel/sys.c                                  |   4 +-
>   lib/Kconfig                                   |   3 +
>   lib/Makefile                                  |   4 +-
>   lib/kfifo.c                                   |   8 +-
>   lib/{usercopy.c =3D> usercheck.c}               |  22 ----
>   lib/usercopy.c                                |  66 -----------
>   mm/kasan/kasan_test_c.c                       |   4 +-
>   mm/memory.c                                   |   2 +-
>   net/x25/af_x25.c                              |   2 +-
>   rust/helpers/uaccess.c                        |   6 +-
>   sound/pci/emu10k1/emufx.c                     |   4 +-
>   sound/pci/rme9652/hdsp.c                      |   6 +-
>   sound/soc/intel/avs/probes.c                  |   6 +-
>   sound/soc/sof/compress.c                      |  12 +-
>   sound/soc/sof/sof-client-probes.c             |   6 +-
>   92 files changed, 269 insertions(+), 288 deletions(-)
>   copy lib/{usercopy.c =3D> usercheck.c} (73%)
>=20


