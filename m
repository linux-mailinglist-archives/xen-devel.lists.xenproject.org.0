Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA057CEC92
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 02:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618828.962992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtGZO-0002db-DT; Thu, 19 Oct 2023 00:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618828.962992; Thu, 19 Oct 2023 00:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtGZO-0002bB-AT; Thu, 19 Oct 2023 00:07:22 +0000
Received: by outflank-mailman (input) for mailman id 618828;
 Thu, 19 Oct 2023 00:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtGZM-0002b5-ST
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 00:07:20 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76f08d08-6e13-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 02:07:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2FC2DCE278C;
 Thu, 19 Oct 2023 00:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D74C433C8;
 Thu, 19 Oct 2023 00:07:11 +0000 (UTC)
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
X-Inumbo-ID: 76f08d08-6e13-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697674033;
	bh=45T1Ts4CWcRjOlbhrg7tuYfg/OQJpw618hWVkhSq/IE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TdmHpirqdI0+FqN+VeuQShVx6+OrlpjW0rtFRN83Wr/6Grzn2VcTBbCAQweXc87sg
	 j/zXhpxr/XQbJFIXB4qMNdqmLlTS7S+4hbKBFJUvU1harOe0+/zNxLzun9Wr1Iudfp
	 +QOpsVUNQG+VCdUYIeWVEicDma6vpaaC7LfSKv7vVFEGd9D5/9vOkazFuF6Qo4e9xP
	 1riLPadQZA7fJWixG7Bg6+JjcHsCSAMMPS/P12qgqQUGtOGjWhoG4BXO/n80K8T5sB
	 zXuSgsKex+y/litrGoWXW5L3e5PeiHIBmHP8RNETfe5jmHqMMceWIZ+dK6z9/T1oz4
	 6EMHt8qVG28EQ==
Date: Wed, 18 Oct 2023 17:07:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 3/7] x86: add deviation comments for asm-only
 functions
In-Reply-To: <dd3534dd-29b0-129d-9f34-b542ed3ffabc@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310181703170.965337@ubuntu-linux-20-04-desktop>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com> <6476706490cc15406bcf3377a57b7c4a303c4901.1696833629.git.nicola.vetrini@bugseng.com> <741e81bc-050c-a773-e622-997b6c0b8335@suse.com> <alpine.DEB.2.22.394.2310161520180.965337@ubuntu-linux-20-04-desktop>
 <dd3534dd-29b0-129d-9f34-b542ed3ffabc@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Oct 2023, Jan Beulich wrote:
> > Jan, for this specific patch, I don't think we have the scan including
> > Intel vmx files yet. Nicola please correct me if I am wrong. So Nicola
> > wouldn't be able to easily expand this patch to also cover Intel vmx
> > violations of this rule because we don't have the list of violations
> > affecting those files. 
> 
> I'm afraid I disagree: There are likely direct VMX counterparts to the SVM
> items adjusted. No scan is needed to spot those. Anything VMX-only can be
> left separate, sure.

Nicola is new to the codebase, so let us help.

This patch adds deviations for these SVM functions:
- svm_intr_assist
- nsvm_vcpu_switch
- svm_vmenter_helper
- svm_vmexit_handler

I take these are the VMX equivalents:
- vmx_intr_assist
- nvmx_switch_guest
- vmx_vmenter_helper
- vmx_asm_vmexit_handler

Jan, did I miss anything?

