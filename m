Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08D87448C5
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 14:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557849.871554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFZFz-00010n-Vt; Sat, 01 Jul 2023 11:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557849.871554; Sat, 01 Jul 2023 11:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFZFz-0000yd-Sw; Sat, 01 Jul 2023 11:59:15 +0000
Received: by outflank-mailman (input) for mailman id 557849;
 Sat, 01 Jul 2023 11:59:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zKT7=CT=ilande.co.uk=mark.cave-ayland@srs-se1.protection.inumbo.net>)
 id 1qFZFy-0000yX-7r
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 11:59:14 +0000
Received: from mail.ilande.co.uk (mail.ilande.co.uk [2001:41c9:1:41f::167])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b09240ed-1806-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 13:59:11 +0200 (CEST)
Received: from [2a00:23c4:8bad:df00:f732:dd76:7417:d15b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qFZFc-0005I2-Q0; Sat, 01 Jul 2023 12:58:56 +0100
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
X-Inumbo-ID: b09240ed-1806-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HUvWWzeC6i10u0AquICUezzYl2yLIB0LMiRxiVfqyBk=; b=IOmQ7yGgID/KuDQlwtrlcQjPDM
	eWMWXQyTr62fuLjJqJQ9UN++wx1Ds4IlurVCjW4mSI6bLcOIb5ZxF7eBJi3Z04pRAlF5Q1cru7UMK
	jxe8qdkDMU1ydCeTJmFOiDWhZLnZcgdjYIZaUsIP0ucHwF4AHqnN+Ll3I86IEcYxjF1gkRjmCYjCC
	5oE9M7qcTlfXwZKdiFLd3gC8WfgwKFtffJ3RaquYsvf6aLETE7RLiWsWbKbCJZ4z2Z+MvR4qz3hy6
	z12ik1OC5MxQorqKWQwc3WselrMPoMM8NCphrUYqXd4HxhpanLriXtBWsbXCqSsFEelDirg5a85BS
	ZTnZZYSJ19/ghWtSTlNIYSe+BXFcFjesy1ob12n1N52j874sk42lkgXq9h+sM8ddANTtCBnqOWZzQ
	3vKjmnU2dj1mB29rCR0MaVqPWdm3eVcgcbXyPSn+oiO+v6BlS9nj1fnXfFkX5QgHuFlWWmO3xBTG3
	XOlclsW1vaXd6LMWbdfj2VER3mqf9cbIjmfOlsU3NfuBPgf+nrJlHgb4mwMO1jPyev8d0KMixbNP9
	u7D80zH1olqYW9AB+04tXhCPDH8jeenM4l7uEh2nweyGdyZTehPMTOG+ZY+VzhOV5Fp/0DJMvbBZg
	dk0YCPgLCNoghK9WLBBck+lRnI8S5T++MrJ7Ngs4M=;
Message-ID: <b562eb6f-c7ad-dec9-d92f-266ca8561170@ilande.co.uk>
Date: Sat, 1 Jul 2023 12:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Bernhard Beschow <shentey@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Olaf Hering <olaf@aepfle.de>, qemu-devel <qemu-devel@nongnu.org>,
 John Snow <jsnow@redhat.com>, "open list:X86"
 <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20210317070046.17860-1-olaf@aepfle.de>
 <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
 <20210325121219.7b5daf76.olaf@aepfle.de>
 <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
 <20230509225818.GA16290@aepfle.de> <20230626231901.5b5d11c1.olaf@aepfle.de>
 <c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com>
 <5DB37FA5-41DF-4ED6-8C8A-CDDD6F276F42@gmail.com>
 <20230627140740.2736f6e8.olaf@aepfle.de>
 <4F5609FD-4A89-4450-89E2-3311CC5A9317@gmail.com>
 <CABgObfamZEHv0W3B6kPXGTiT1f2G__S=Bi1-_PYeSomsiVFaFg@mail.gmail.com>
 <3987B0DB-46F2-49F1-AEA5-B88BC61A633F@gmail.com>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <3987B0DB-46F2-49F1-AEA5-B88BC61A633F@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bad:df00:f732:dd76:7417:d15b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

On 01/07/2023 10:53, Bernhard Beschow wrote:

> Am 30. Juni 2023 08:48:02 UTC schrieb Paolo Bonzini <pbonzini@redhat.com>:
>> Il mer 28 giu 2023, 13:28 Bernhard Beschow <shentey@gmail.com> ha scritto:
>>
>>>
>>>
>>> Am 27. Juni 2023 12:07:40 UTC schrieb Olaf Hering <olaf@aepfle.de>:
>>>> Tue, 27 Jun 2023 10:12:50 +0000 Bernhard Beschow <shentey@gmail.com>:
>>>>
>>>>> The BAR is a 32 bit register whose default value is 0x00000001. I think
>>> what's supposed to happen here is a pci_set_long() rather than a
>>> pci_set_byte().
>>>>
>>>> Indeed, the u32 at that address changes from c121 to c101 with the
>>> current code.
>>>
>>> Neat! Would you mind sending a patch fixing the BMIBA register to be reset
>>> as 32 bit?
>>>
>>
>> I think we should also check why writing the command register is not
>> disabling the BAR as well.
> 
> So IIUC the BMIBA register is managed internally by QEMU's PCI code and we shouldn't have to mess with the register at all. We should actually remove the explicit reset of BMIBA, correct?
> 
> I've tried debugging the PCI code when working on the VIA IDE controller to understand it better. But despite QEMU being compiled with --enable-debug it seemd to be compiled with -O2 still, making debugging quite hard. I'm not sure if any compile flags leak into my build environment though.

Certainly --enable-debug normally does the right thing when building QEMU. If you 
want to double-check the compiler flags in use to see if anything from CFLAGS/LDFLAGS 
is getting picked up, use "make V=1" after configure which outputs the full command 
being used during the build rather than just the summary.


ATB,

Mark.


