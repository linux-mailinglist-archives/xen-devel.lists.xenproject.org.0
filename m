Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9120C9DE8F2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 15:52:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846028.1261308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tH2Ku-0003MB-TN; Fri, 29 Nov 2024 14:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846028.1261308; Fri, 29 Nov 2024 14:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tH2Ku-0003Jh-Ou; Fri, 29 Nov 2024 14:51:12 +0000
Received: by outflank-mailman (input) for mailman id 846028;
 Fri, 29 Nov 2024 14:51:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5mU=SY=bounce.vates.tech=bounce-md_30504962.6749d4d0.v1-12fcfe0bf84843e594a39beb982d550a@srs-se1.protection.inumbo.net>)
 id 1tH2Ks-0003JZ-Hy
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 14:51:10 +0000
Received: from mail180-27.suw31.mandrillapp.com
 (mail180-27.suw31.mandrillapp.com [198.2.180.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 576715d3-ae61-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 15:50:58 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-27.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Y0GMN4mxdz6CPyPr
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 14:50:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 12fcfe0bf84843e594a39beb982d550a; Fri, 29 Nov 2024 14:50:56 +0000
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
X-Inumbo-ID: 576715d3-ae61-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC4yNyIsImhlbG8iOiJtYWlsMTgwLTI3LnN1dzMxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjU3NjcxNWQzLWFlNjEtMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODkxODU4LjM3NzU5NSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDlkNGQwLnYxLTEyZmNmZTBiZjg0ODQzZTU5NGEzOWJlYjk4MmQ1NTBhQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732891856; x=1733152356;
	bh=+ZBetPMI2OwnoEKFVuJ+NhQwKrv5m2cvszeiHnM3vMU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Mopn4DU2ri3B3fjAehbIEy6E2wIJtBgnmRF3Zekd+ONi5RKT9yjT0lHA3yplERgsQ
	 uNlCKlZF+s1pwatnvaWGcWmsWryTAP2hx/v264xNGFlxk9/HBula7T1nfAWYv2G/iO
	 hDHMMnjq7h3SiqBWfo6iVkVSAKX0PQ3ErOV5BqhJa3XBr2qFwWrVb0cVRw24FgJOto
	 PW/wiKcO/0mULHUllMtl4eyEe8DZznYZWIre2zBgXue5NmAXdYsOLEtO0j5ZkoUGAG
	 eet+ZC2nK7bSYhqwBeiNi5W2OkPv50Bg4+PnGjuL2VueIXfP59/JrGmmOxjH2TLTsv
	 oRMvDVF1LRyKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732891856; x=1733152356; i=anthony.perard@vates.tech;
	bh=+ZBetPMI2OwnoEKFVuJ+NhQwKrv5m2cvszeiHnM3vMU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=niPqc8uDauQ0WXGCW4eVJjt7IunEfYd3gb96Iyz6kTewn3Tudd/kWBZfR0qtwiznb
	 74rLv5YCuoctB/dIH9+4qjzpIZGcn+AEYSaBNRHTJtcklhWlk+UqgdrenbBop/x7Oa
	 02wcjM664PApkbN8eqYSpqE+d4AUZYAfvjJItX5K6TMrwZUf5hoYjkIPsmb4f1cGcc
	 B7imnMxS4JaoNoyYFFMw3T+77k29mdlh22r3BjBpXhxXiC3jjVrbX+71+Syn2h1YJo
	 FUEH/rWdoZrUTAfJeMVMQazSq5s1ifb4w4PbG9Nj2dZ8DEZrdKYDE9iULAI+4aaNUL
	 +OyYwGbXRO/WA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/5]=20build:=20add=20possibility=20to=20use=20LLVM=20tools?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732891855469
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-Id: <Z0nUzQk5Nr7WQ2kI@l14>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com> <20241129014850.2852844-3-volodymyr_babchuk@epam.com> <57291d0d-fe7e-4410-8cc5-a2bed0de108e@suse.com>
In-Reply-To: <57291d0d-fe7e-4410-8cc5-a2bed0de108e@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.12fcfe0bf84843e594a39beb982d550a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241129:md
Date: Fri, 29 Nov 2024 14:50:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Nov 29, 2024 at 08:57:47AM +0100, Jan Beulich wrote:
> On 29.11.2024 02:49, Volodymyr Babchuk wrote:
> > Currently, even if we are using clang as a C compiler, we still use
> > GNU binutils. This patch adds new option "llvm" that allows to use
> > linker, objcopy and all other tools from LLVM project. As LLVM tools
> > use different approach for cross-compilation, we don't need
> > CROSS_COMPILE prefix in this case.

It might be worth explaining what this different approach is ;-). My
guess is that you ask llvm/clang to build for a specific arch, via
XEN_TARGET_ARCH=riscv64, and llvm doesn't need different binaries will
just do what is needed, right? (with -march I guess).

> This new option is meant to control both toolstack and hypervisor builds?
> As to the latter, I assume you're aware we're trying to move away from
> this kind of command line control of the build.

Having "clang=y" is a bit useless when one can do "CC=clang" and let
the build system figure out what CC is. That's at least true for the
build system under "xen/".

But if one want to use the whole LLVM toolchain, it as to write a lot
more. To build Xen (just the hypervisor) with it, one would need to run:

make CC=clang CXX=clang++ AS=llvm-as LD=ld.lld LD_LTO=llvm-lto \
    ADDR2LINE=llvm-addr2line AR=llvm-ar RANLIB=llvm-ranlib NM=llvm-nm \
    STRIP=llvm-strip OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump \
    SIZEUTIL=llvm-size

So while it's possible, maybe introducing "llvm" or "LLVM" to switch
toolchain might be ok, to help. (Just because Linux did just that
recently:
    https://www.kernel.org/doc/html/latest/kbuild/llvm.html#the-llvm-argument
)

Beyond switching toolchain, I don't think $(llvm) or $(clang) should be
used in the build system, and instead rely on autodetection for
arguments. (There's already $(CONFIG_CC_IS_CLANG) and
$(CONFIG_LD_IS_LLVM) in the hypervisor's build system, via Kconfig)

At least for the hypervisor. For the toolstack, we should probably deal
with toolchain in ./configure.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

