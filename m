Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A841129295A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 16:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8728.23415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUWBq-00037l-Vn; Mon, 19 Oct 2020 14:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8728.23415; Mon, 19 Oct 2020 14:31:10 +0000
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
	id 1kUWBq-00037C-SK; Mon, 19 Oct 2020 14:31:10 +0000
Received: by outflank-mailman (input) for mailman id 8728;
 Mon, 19 Oct 2020 14:31:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L3Wa=D2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kUWBp-00036o-6T
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:31:09 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e41c120-92eb-49d6-95fe-e95dc6bdf72b;
 Mon, 19 Oct 2020 14:30:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=L3Wa=D2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kUWBp-00036o-6T
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:31:09 +0000
X-Inumbo-ID: 5e41c120-92eb-49d6-95fe-e95dc6bdf72b
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5e41c120-92eb-49d6-95fe-e95dc6bdf72b;
	Mon, 19 Oct 2020 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603117857;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=52UN4GH401zBIqFd+LIiuHFO8x4myJdJe/Zsm2McNhY=;
  b=BXUtpANq14C+aEWAe716tUc9/wyvtZzY/cwBFISHdCHKyH7T1CQ+qdtA
   9Ry6i8P2LkohopCtCikp4zJx/MCamYnsFFbm7eY9+jh3aBmjVm8LIQrPk
   mVmt+d8eWxDOVciy47C4hxwzY/GDT6ZI2wCxBhCCNmBp29LZ3UyBR7K4p
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2NW4VCpKbbpQTiUYVJwqnjH7RxwYcekGibTeUbWeJV4InFtEtHA+RLaPu/e+N+TzkxVnnc3NdC
 Cji8B/eeCxt9dbcLPkVNYcwJLU07QcC3Y9SHqzXHqtyr76GsmC5NtY0/5ud4aE9hiUqFfPT1mg
 FoRS6YgRUQv4JrDnIh6hCf+esNiSWjMr2mJJD2Q1HGgrqNHEmpv9htfADJqxq6QruQuCREuois
 3+SI0daBAOW4IfMBc87D0X3/luU6fDBNN25H/BIbfnoUe66+8SHwhOcsiTkp6GKJjLtww1y7IQ
 /7A=
X-SBRS: None
X-MesageID: 29636912
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,394,1596513600"; 
   d="scan'208";a="29636912"
Subject: Re: [PATCH] SVM: avoid VMSAVE in ctxt-switch-to
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a01862b8-6e16-5ddc-7f48-2d3bed2f34b6@suse.com>
 <9d0cae4e-f849-f2a3-4261-d3efb977deeb@citrix.com>
 <b3b581fc-b1c9-cdc2-add6-900a4305623a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6af1bbb6-d717-affa-6409-2b983e48ed30@citrix.com>
Date: Mon, 19 Oct 2020 15:30:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b3b581fc-b1c9-cdc2-add6-900a4305623a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 19/10/2020 15:21, Jan Beulich wrote:
> On 19.10.2020 16:10, Andrew Cooper wrote:
>> On 19/10/2020 14:40, Jan Beulich wrote:
>>> Of the state saved by the insn and reloaded by the corresponding VMLOAD
>>> - TR, syscall, and sysenter state are invariant while having Xen's state
>>>   loaded,
>>> - FS, GS, and LDTR are not used by Xen and get suitably set in PV
>>>   context switch code.
>> I think it would be helpful to state that Xen's state is suitably cached
>> in _svm_cpu_up(), as this does now introduce an ordering dependency
>> during boot.
> I've added a sentence.
>
>> Is it possibly worth putting an assert checking the TR selector?  That
>> ought to be good enough to catch stray init reordering problems.
> How would checking just the TR selector help? If other pieces of TR
> or syscall/sysenter were out of sync, we'd be hosed, too.

They're far less likely to move relative to tr, than everything relative
to hvm_up().

> I'm also not sure what exactly you mean to do for such an assertion:
> Merely check the host VMCB field against TSS_SELECTOR, or do an
> actual STR to be closer to what the VMSAVE actually did?

ASSERT(str() == TSS_SELECTOR);

The problem with the other state is that it compiletime/runtime
dependent, and we don't want to be opencoding the logic a second time.

~Andrew

