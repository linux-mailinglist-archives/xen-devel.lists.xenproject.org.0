Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92642A90F28
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 01:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956757.1350054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5BqP-0000oa-TP; Wed, 16 Apr 2025 23:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956757.1350054; Wed, 16 Apr 2025 23:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5BqP-0000m9-QH; Wed, 16 Apr 2025 23:07:01 +0000
Received: by outflank-mailman (input) for mailman id 956757;
 Wed, 16 Apr 2025 22:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y+to=XC=tum.de=f.specht@srs-se1.protection.inumbo.net>)
 id 1u5BcZ-00079h-2K
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 22:52:45 +0000
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de [129.187.255.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f75aaa2-1b15-11f0-9eaf-5ba50f476ded;
 Thu, 17 Apr 2025 00:52:40 +0200 (CEST)
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
 by postout2.mail.lrz.de (Postfix) with ESMTP id 4ZdGWW352pzyXy;
 Thu, 17 Apr 2025 00:52:39 +0200 (CEST)
Received: from postout2.mail.lrz.de ([127.0.0.1])
 by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id BUKWwZpHKzs4; Thu, 17 Apr 2025 00:52:38 +0200 (CEST)
Received: from localhost (ip-77-25-21-71.web.vodafone.de [77.25.21.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4ZdGWV24mvzyXt;
 Thu, 17 Apr 2025 00:52:38 +0200 (CEST)
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
X-Inumbo-ID: 7f75aaa2-1b15-11f0-9eaf-5ba50f476ded
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	content-disposition:content-type:content-type:mime-version
	:message-id:subject:subject:from:from:date:date:received
	:received; s=tu-postout21; t=1744843958; bh=tLa+VU89u/pPAmcI58Xx
	Rvys5/PhJoI02bJae+8u2Og=; b=SifitEc0HgRMWodNj5JCqGWBtfzs+ooY6+F/
	DhOqq3usLmj1Cg6H+0DQJ32VyQ6hl8VqHaIrDfGa2kFplsU3PD4xrGZIZq4e2MoK
	FjeHamf+j4NdL5KULB/t0hG+JoEvjt+o/4KpgmzD6CYvArC73jrxCMoF0ecEV35Z
	yomVAKpbgSVBS6k3ZchAbpnAbWiSaxlVbIUpxm4lajN+A2eULD+6gAcgVj4FmXxh
	6XZ2B75PdXz5YSSEZj+BahtcRFbirhd76QXfxgbtoo1W0Uk1zuf3UhlLCnVuFJBs
	LXCKX/PCLWf/Vif19GGLWZ6L4l0KoLaxhWW1MgS13TgDBvqVDQ==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.871
X-Spam-Level:
X-Spam-Status: No, score=-2.871 tagged_above=-999 required=5
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
 DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001, LRZ_BND_AN=0.001,
 LRZ_BND_MUTT=0.001, LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
 LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
 LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_MATCH=0.001,
 LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001,
 LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
 LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
 LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
 LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001, LRZ_HAS_BND=0.001,
 LRZ_HAS_CT=0.001, LRZ_HAS_MIME_VERSION=0.001, LRZ_HAS_SPF=0.001,
 LRZ_MSGID_LONG_50=0.001, LRZ_MSGID_NO_FQDN=0.001, LRZ_NO_UA_HEADER=0.001,
 LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Date: Thu, 17 Apr 2025 00:52:23 +0200
From: Fabian Specht <f.specht@tum.de>
To: xen-devel@lists.xenproject.org
Cc: manuel.andreas@tum.de
Subject: x86 emulation bug
Message-ID: <jfgrmlid6fhbptebr22ccqimqhys3pchcoyuoepjz2iwoillei@xxaicsktj2pl>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="dtn5ecljjtysyige"
Content-Disposition: inline


--dtn5ecljjtysyige
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dear all,

we discovered a bug in hvm64 x86 Xen. Using the attached xtf test we are
able to trigger an assert in arch/x86/hvm/emulate.c:


if ( (hvmemul_ctxt->ctxt.regs->eflags & X86_EFLAGS_DF) && (reps > 1) )
{
	/*
	 * x86_emulate() clips the repetition count to ensure we don't wrap
	 * the effective-address index register. Hence this assertion holds.
	 */
	ASSERT(offset >= ((reps - 1) * bytes_per_rep));
	okay = hvm_virtual_to_linear_addr(
		seg, reg, offset - (reps - 1) * bytes_per_rep,
		reps * bytes_per_rep, access_type,
		hvmemul_get_seg_reg(x86_seg_cs, hvmemul_ctxt), linear);
	*linear += (reps - 1) * bytes_per_rep;
	if ( hvmemul_ctxt->ctxt.addr_size != 64 )
		*linear = (uint32_t)*linear;
}


If debug mode is not enabled, this will later on result in an integer
underflow, however we were not able to find any severe problems.

The test below will not work with vanilla xtf. To get it working,
we have to edit 'pae_l1_identmap' in arch/x86/hvm/pagetables.S in xtf
from


PAGETABLE_START(pae_l1_identmap)
        .long 0, 0
        .rept PAE_L1_PT_ENTRIES - 1
        .long (PAE_IDX(pae_l1_identmap) << PAE_L1_PT_SHIFT) + _PAGE_LEAF
        .long 0
        .endr
PAGETABLE_END(pae_l1_identmap)


to the following value:


PAGETABLE_START(pae_l1_identmap)
        .quad (0x5564000000) + _PAGE_LEAF
        .rept PAE_L1_PT_ENTRIES - 1
        .long (PAE_IDX(pae_l1_identmap) << PAE_L1_PT_SHIFT) + _PAGE_LEAF
        .long 0
        .endr
PAGETABLE_END(pae_l1_identmap)



We were able to reproduce this bug in several versions including the
most current one at the time of writing this.


Best,
Fabian

--dtn5ecljjtysyige
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="main.c"

/**
 * @file tests/poc/main.c
 * @ref test-poc
 *
 * @page test-poc poc
 *
 * @todo Docs for test-poc
 *
 * @see tests/poc/main.c
 */
#include <xtf.h>

const char test_title[] = "Test poc";

void test_main(void)
{
	printk("Starting up reps offset assert poc!\n");

    asm volatile ( 
        "mov $0xd000f8, %%eax;"
        "mov $0x0, %%rdi;"
        "mov $0x1900000000000000, %%rcx;"
        "std;"
        "rep stos %%eax, %%es:(%%rdi);"
        ::: "memory", "cc", "rax", "rdi", "rcx"
    );

    printk("Unreachable with enabled debug asserts!\n");
    xtf_success(NULL);
    xtf_success(NULL);
}

/*
 * Local variables:
 * mode: C
 * c-file-style: "BSD"
 * c-basic-offset: 4
 * tab-width: 4
 * indent-tabs-mode: nil
 * End:
 */

--dtn5ecljjtysyige--

