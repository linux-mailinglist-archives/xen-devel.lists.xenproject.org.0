Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMo0C6mdnWnwQgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 13:46:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904961872C4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 13:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240007.1541496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuro0-0004bY-5y; Tue, 24 Feb 2026 12:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240007.1541496; Tue, 24 Feb 2026 12:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuro0-0004ZX-2p; Tue, 24 Feb 2026 12:46:24 +0000
Received: by outflank-mailman (input) for mailman id 1240007;
 Tue, 24 Feb 2026 12:46:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfzY=A4=bounce.vates.tech=bounce-md_30504962.699d9d97.v1-d608bee5e0b64c53ae0669005322fb7a@srs-se1.protection.inumbo.net>)
 id 1vurny-0003tj-MQ
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 12:46:22 +0000
Received: from mail186-12.suw21.mandrillapp.com
 (mail186-12.suw21.mandrillapp.com [198.2.186.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf559567-117e-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 13:46:17 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-12.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4fKyBw0Kjcz705mf2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 12:46:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d608bee5e0b64c53ae0669005322fb7a; Tue, 24 Feb 2026 12:46:15 +0000
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
X-Inumbo-ID: cf559567-117e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771937176; x=1772207176;
	bh=lXd6UpYAp3t3un2N6Ph54v7LZ+JVCHmjwbvsN8beoWo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=i1ArAFs7TTxutCW9a9kp2BpFd+E4HozZeh7UlvFmxr4ZJt8qBxMXHwxBNOjhFmQIJ
	 cX/epq/tY5Em6HzY15w3W9LjB5vmMQ3b/A+4CEAGPzA3FaRPR1DojGaYeMzopfCsoq
	 gVf9cuogccmvYcfveU7MdmRqL6s6hYR7XDmARsFJKHznt9ZpXUn6Y9422EQ53+lb5i
	 e2XVDiCXjAC6ewN06px+B+tk5TK+IOgZDmg/qJ8ht+0WVhULVxnY/pZCN/eh6p+ckm
	 Hdz71KfVSbBMkcaXQPCPMVEeaTQn04ngvWh9iyr7X6kpRuOX838TI1TiohdulAsmdv
	 9mXwZb/JIH5/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771937176; x=1772197676; i=teddy.astie@vates.tech;
	bh=lXd6UpYAp3t3un2N6Ph54v7LZ+JVCHmjwbvsN8beoWo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CA8NzxnEwPLoZxAWhvZqsWJqfHwnYOQKWu1YpH1aWIuS1t979fnql7gqokbSp8dfs
	 b0A0tuAhj58feKMljgf78oKRsrxgVOAGWJZXRyQNeYA4hVUxUkr0IyQm1g/NtdP8NF
	 N6MuvpixrHvP9RJPtTr3IaR2cQtARi/C53IY28xfQ2xE7KImAMNRyu0MFFxUk8crTX
	 maOlTope0DaonbYVJ6n/cjGVjhHPZJGX8CLcFs3VABd/zDRxSE507rujPyTQlQV+ry
	 Gq8RqzeiIIOzhbEcG+NCXzD2O+It0Jy8BignXAkYi5myV2NZayA5PVNcnY1BWRQLmE
	 5nmREwLH4SzJg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20x86/xen:=20Consider=20Xen=20PVH=20support=20in=20CONFIG=5FXEN=5FPVHVM?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771937175070
Message-Id: <d4ff30fe-4770-49a7-8f80-3e45370b682a@vates.tech>
To: "=?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?=" <jgross@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, "Boris Ostrovsky" <boris.ostrovsky@oracle.com>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
References: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech> <aZ2IB9gBo_DrZLSf@macbook.local> <c788fa3d-4080-47bb-9fb4-1452866393bf@suse.com>
In-Reply-To: <c788fa3d-4080-47bb-9fb4-1452866393bf@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d608bee5e0b64c53ae0669005322fb7a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260224:md
Date: Tue, 24 Feb 2026 12:46:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:dkim,vates.tech:url,vates.tech:email,oracle.com:email,mandrillapp.com:dkim,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:boris.ostrovsky@oracle.com,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 904961872C4
X-Rspamd-Action: no action

Le 24/02/2026 =C3=A0 12:25, J=C3=BCrgen Gro=C3=9F a =C3=A9crit=C2=A0:
> On 24.02.26 12:14, Roger Pau Monn=C3=A9 wrote:
>> On Tue, Feb 24, 2026 at 10:51:35AM +0000, Teddy Astie wrote:
>>> It's currently possible to build Linux with CONFIG_PVH|CONFIG_XEN_PVHVM
>>> and no CONFIG_XEN_PVH. That leads to inconsistent kernels that fails 
>>> with
>>> "Missing xen PVH initialization" when booting using PVH boot method or
>>> display various errors and fail to initialize Xen PV drivers when 
>>> booting
>>> with PVH-GRUB.
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 platform_pci_unplug: Xen Platform PCI: unrecog=
nised magic value
>>> =C2=A0=C2=A0=C2=A0=C2=A0 ...
>>> =C2=A0=C2=A0=C2=A0=C2=A0 # modprobe xen-blkfront
>>> =C2=A0=C2=A0=C2=A0=C2=A0 modprobe: ERROR: could not insert 'xen_blkfron=
t': No such device
>>> =C2=A0=C2=A0=C2=A0=C2=A0 # modprobe xen-netfront
>>> =C2=A0=C2=A0=C2=A0=C2=A0 modprobe: ERROR: could not insert 'xen_netfron=
t': No such device
>>>
>>> When built without CONFIG_XEN_PVH, PVH-specific logic is disabled, 
>>> hence when
>>> booting with e.g PVH-OVMF, Linux assumes we are a HVM guest, even 
>>> when we aren't
>>> actually one (in the "with HVM emulated devices" sense).
>>>
>>> As it is actually possible to boot Xen PVH without CONFIG_PVH; and 
>>> that most
>>> Xen-related logic exist within CONFIG_XEN_PVHVM; consider PVH guests 
>>> support
>>> within CONFIG_XEN_PVHVM instead of CONFIG_XEN_PVH.
>>
>> So the current CONFIG_PVH selection done by CONFIG_XEN_PVH is moot?
> 
> No, it isn't.
> 
> CONFIG_PVH is the common base needed for Xen and KVM guests to be able to
> run in PVH mode.
> 

To me, CONFIG_PVH is more about being able to boot using PVH Direct Boot 
than something else.

>>
>>> Keep CONFIG_XEN_PVH as a shortcut to enable PVH boot, ACPI support 
>>> and PVHVM.
>>>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> ---
>>> Cc: Juergen Gross <jgross@suse.com>
>>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> A tentative patch, I'm not sure of the way of dealing with the 
>>> KConfig part,
>>> keeping CONFIG_XEN_PVH as a shortcut is interesting, but there may be 
>>> other
>>> options.
>>>
>>> There are widespreadly used Linux distributions that have a similar 
>>> configuration
>>> to this one, thus exhibit this issue i.e fail to boot.
>>
>> Do you know the underlying cause of not enabling CONFIG_XEN_PVH?=C2=A0 I=
s
>> the default set to n on the defconfig?=C2=A0 Or are distros specifically
>> disabling this option on purpose?
>>
>> It seems like a step backwards to merge this into some bigger generic
>> option, we always try to fine-grain as much as possible.
>>
>> Maybe you could introduce XEN_HVM meta option, that selects both PVHVM
>> and PVH?
> No, please don't use "HVM" for that purpose.
> 
> If anything I'd set the CONFIG_XEN_PVH default to that of CONFIG_XEN_PVHV=
M.
> 

That could work, but that would transitively imply that CONFIG_XEN needs 
CONFIG_PVH, which I guess we probably want to avoid.

As I said, it's not required to boot with "PVH direct boot" for a "PVH 
guest personality" to work in Linux since [1].

We can eventually consider decoupling CONFIG_XEN_PVH and CONFIG_PVH, but 
that would break setup that expects that CONFIG_XEN_PVH implies 
CONFIG_PVH (arch/x86/configs/xen.config in particular).

[1] 418492ba "x86/virt/xen: Use guest_late_init to detect Xen PVH guest"

> 
> Juergen

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



