Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC342DDF2E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 08:42:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56341.98631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqANw-0003Hi-Ul; Fri, 18 Dec 2020 07:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56341.98631; Fri, 18 Dec 2020 07:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqANw-0003HJ-RQ; Fri, 18 Dec 2020 07:41:08 +0000
Received: by outflank-mailman (input) for mailman id 56341;
 Fri, 18 Dec 2020 07:41:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ets7=FW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kqANv-0003HE-C3
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 07:41:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7d09d10-8b9b-43bb-a83d-979b3b1460cd;
 Fri, 18 Dec 2020 07:41:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5C8AACC4;
 Fri, 18 Dec 2020 07:41:00 +0000 (UTC)
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
X-Inumbo-ID: e7d09d10-8b9b-43bb-a83d-979b3b1460cd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608277261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lx03LAFVea+M7tq/9HJSfW52P41fC1cx/bBol9an1Pg=;
	b=mcGgcb32ScgQC/vVm9JXkslxbXHds+g9VZSgULhmVFP1XCHOA0R2hKEG+66ESTxmQ8NNd3
	bgp/GyT1B8eljvIMIXn77rbC/doXgaVCzdV1OzWsdTIUA2403TmWOu/4voq6583i3H5mEk
	0O+NPvz8mRnJWR5JuSjdU+iBqWuuYuo=
Subject: Re: [xen-4.13-testing bisection] complete
 test-amd64-amd64-xl-qemuu-ovmf-amd64
To: osstest service owner <osstest-admin@xenproject.org>
References: <E1kq3ge-0007H1-P9@osstest.test-lab.xenproject.org>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9c63132b-fa66-2f33-6e0e-64368f2d5c49@suse.com>
Date: Fri, 18 Dec 2020 08:40:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <E1kq3ge-0007H1-P9@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.12.2020 01:32, osstest service owner wrote:
> branch xen-4.13-testing
> xenbranch xen-4.13-testing
> job test-amd64-amd64-xl-qemuu-ovmf-amd64
> testid debian-hvm-install
> 
> Tree: linux git://xenbits.xen.org/linux-pvops.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: seabios git://xenbits.xen.org/osstest/seabios.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
>   Bug introduced:  cee5b0441af39dd6f76cc4e0447a1c7f788cbb00
>   Bug not present: 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157657/
> 
> 
>   commit cee5b0441af39dd6f76cc4e0447a1c7f788cbb00
>   Author: Guo Dong <guo.dong@intel.com>
>   Date:   Wed Dec 2 14:18:18 2020 -0700
>   
>       UefiCpuPkg/CpuDxe: Fix boot error
>       
>       REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3084
>       
>       When DXE drivers are dispatched above 4GB memory and
>       the system is already in 64bit mode, the address
>       setCodeSelectorLongJump in stack will be override
>       by parameter. so change to use 64bit address and
>       jump to qword address.
>       
>       Signed-off-by: Guo Dong <guo.dong@intel.com>
>       Reviewed-by: Ray Ni <ray.ni@intel.com>
>       Reviewed-by: Eric Dong <eric.dong@intel.com>

Is this a result one can consider trustworthy? The ovmf tree used
with 4.13 shouldn't have changed anywhere half recently, I would
assume ...

Jan

> For bisection revision-tuple graph see:
>    http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.13-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
> Revision IDs in each graph node refer, respectively, to the Trees above.
> 
> ----------------------------------------
> Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/157657.bisection-summary --basis-template=157135 --blessings=real,real-bisect,real-retry xen-4.13-testing test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
> Searching for failure / basis pass:
>  157597 fail [host=rimava1] / 157135 [host=godello1] 156988 [host=godello0] 156636 [host=godello1] 156593 [host=albana1] 156399 [host=chardonnay0] 156317 [host=elbling0] 156265 [host=huxelrebe1] 156054 [host=godello1] 156030 [host=godello0] 155377 [host=fiano1] 155258 ok.
> Failure / basis pass flights: 157597 / 155258
> (tree with no url: minios)
> Tree: linux git://xenbits.xen.org/linux-pvops.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: seabios git://xenbits.xen.org/osstest/seabios.git
> Tree: xen git://xenbits.xen.org/xen.git
> Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 10c7c213bef26274684798deb3e351a6756046d2
> Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
> Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#d8ab884fe9b4dd148980bf0d8673187f8fb25887-f95e80d832e923046c92cd6f0b8208cec147138e git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
>  fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#730e2b1927e7d911bbd5350714054ddd5912f4ed-7269466a5b0c0e89b36dc9a7db0554ae404aa230 git://xenbits.xen.org/osstest/seabios.git#41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5-748d619be3282fba35f99446098ac2d0579f6063 git://xenbits.xen.org/xen.git#88f5b414ac0f8008c1e2b26f93c3d980120941f7-10c7c213bef26274684798deb3e351a6756046d2
> Loaded 7669 nodes in revision graph
> Searching for test results:
>  155132 [host=albana0]
>  155258 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
>  155377 [host=fiano1]
>  156030 [host=godello0]
>  156054 [host=godello1]
>  156265 [host=huxelrebe1]
>  156317 [host=elbling0]
>  156399 [host=chardonnay0]
>  156593 [host=albana1]
>  156636 [host=godello1]
>  156988 [host=godello0]
>  157135 [host=godello1]
>  157563 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 10c7c213bef26274684798deb3e351a6756046d2
>  157596 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
>  157616 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 10c7c213bef26274684798deb3e351a6756046d2
>  157622 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b96b44feab7aad2b9ae73a3602924b42d148bb03 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 94f0510dc75e910400aad6c169048d672c8c7193 971a9d14667448427ddea1cf15fd7fd409205c58
>  157626 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 391610903b2944bb6bfed76fe9f9b46838600baf d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 5e4914e60da9a8dfdc00e839278f40c87525b8ae
>  157597 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 10c7c213bef26274684798deb3e351a6756046d2
>  157628 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 375e9b190e37041129b35a1c667993ea145e5b7e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 b5302273e2c51940172400486644636f2f4fc64a
>  157630 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 60e3727bcae7268a57aa240c799b1bc788c9c39b
>  157631 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 4959626e926ce2e6de731135b1f567433edcd992
>  157635 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 b5302273e2c51940172400486644636f2f4fc64a
>  157639 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7061294be500de021bef3d4bc5218134d223315f d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 b5302273e2c51940172400486644636f2f4fc64a
>  157640 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee5b0441af39dd6f76cc4e0447a1c7f788cbb00 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 b5302273e2c51940172400486644636f2f4fc64a
>  157643 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 b5302273e2c51940172400486644636f2f4fc64a
>  157651 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee5b0441af39dd6f76cc4e0447a1c7f788cbb00 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 b5302273e2c51940172400486644636f2f4fc64a
>  157653 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 b5302273e2c51940172400486644636f2f4fc64a
>  157657 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cee5b0441af39dd6f76cc4e0447a1c7f788cbb00 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 b5302273e2c51940172400486644636f2f4fc64a
> Searching for interesting versions
>  Result found: flight 155258 (pass), for basis pass
>  For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 b5302273e2c51940172400486644636f2f4fc64a, results HASH(0x55b5783495c8) HASH(0x55b578278648) HASH(0x55b57829faa0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
>  e6a472b0eb9558310b518f0dfcd8860 375e9b190e37041129b35a1c667993ea145e5b7e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 b5302273e2c51940172400486644636f2f4fc64a, results HASH(0x55b5782852a0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 391610903b2944bb6bfed76fe9f9b46838600baf d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7\
>  db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 5e4914e60da9a8dfdc00e839278f40c87525b8ae, results HASH(0x55b5778cb898) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b96b44feab7aad2b9ae73a3602924b42d148bb03 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 94f0510dc75e910400aad6c169048d672c8c7193 971a9d14667448427ddea1cf15fd7fd409205c58, results HASH(0x55b578295150) For basis\
>   failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7, results HASH(0x55b578287ed0) HASH(0x55b57828dbe8) Result found: flight 157563 (fail), for basis failure (at ancestor ~7668)
>  Repro found: flight 157596 (pass), for basis pass
>  Repro found: flight 157597 (fail), for basis failure
>  0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 b5302273e2c51940172400486644636f2f4fc64a
> No revisions left to test, checking graph state.
>  Result found: flight 157635 (pass), for last pass
>  Result found: flight 157640 (fail), for first failure
>  Repro found: flight 157643 (pass), for last pass
>  Repro found: flight 157651 (fail), for first failure
>  Repro found: flight 157653 (pass), for last pass
>  Repro found: flight 157657 (fail), for first failure
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
>   Bug introduced:  cee5b0441af39dd6f76cc4e0447a1c7f788cbb00
>   Bug not present: 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157657/
> 
> 
>   commit cee5b0441af39dd6f76cc4e0447a1c7f788cbb00
>   Author: Guo Dong <guo.dong@intel.com>
>   Date:   Wed Dec 2 14:18:18 2020 -0700
>   
>       UefiCpuPkg/CpuDxe: Fix boot error
>       
>       REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3084
>       
>       When DXE drivers are dispatched above 4GB memory and
>       the system is already in 64bit mode, the address
>       setCodeSelectorLongJump in stack will be override
>       by parameter. so change to use 64bit address and
>       jump to qword address.
>       
>       Signed-off-by: Guo Dong <guo.dong@intel.com>
>       Reviewed-by: Ray Ni <ray.ni@intel.com>
>       Reviewed-by: Eric Dong <eric.dong@intel.com>
> 
> pnmtopng: 145 colors found
> Revision graph left in /home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
> ----------------------------------------
> 157657: tolerable ALL FAIL
> 
> flight 157657 xen-4.13-testing real-bisect [real]
> http://logs.test-lab.xenproject.org/osstest/logs/157657/
> 
> Failures :-/ but no regressions.
> 
> Tests which did not succeed,
> including tests which could not be run:
>  test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail baseline untested
> 
> 
> jobs:
>  test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
> 
> 
> ------------------------------------------------------------
> sg-report-flight on osstest.test-lab.xenproject.org
> logs: /home/logs/logs
> images: /home/logs/images
> 
> Logs, config files, etc. are available at
>     http://logs.test-lab.xenproject.org/osstest/logs
> 
> Explanation of these reports, and of osstest in general, is at
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master
> 
> Test harness code can be found at
>     http://xenbits.xen.org/gitweb?p=osstest.git;a=summary
> 
> 


