Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79328505E06
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 20:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307537.522678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngWM7-0000UY-RJ; Mon, 18 Apr 2022 18:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307537.522678; Mon, 18 Apr 2022 18:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngWM7-0000SU-Nb; Mon, 18 Apr 2022 18:44:11 +0000
Received: by outflank-mailman (input) for mailman id 307537;
 Mon, 18 Apr 2022 18:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WNlM=U4=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1ngWM6-0000SO-1n
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 18:44:10 +0000
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86b137a5-bf47-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 20:44:09 +0200 (CEST)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
 by mta-07.privateemail.com (Postfix) with ESMTP id E62AB18000A7
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 14:44:05 -0400 (EDT)
Received: from mail-ot1-f53.google.com (unknown [10.20.151.140])
 by mta-07.privateemail.com (Postfix) with ESMTPA id C148418000AC
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 14:44:05 -0400 (EDT)
Received: by mail-ot1-f53.google.com with SMTP id
 e15-20020a9d63cf000000b006054e65aaecso1810556otl.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 11:44:05 -0700 (PDT)
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
X-Inumbo-ID: 86b137a5-bf47-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1650307445;
	bh=7vUzavakaGaO6E0zlDOAogK+8n1PQfQHDvi1VXpo9lA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Flj2Coj75hUbQWIQNaqp7EXCKFL/qJWuN7eJGExmUfcVF9qapRHeuipFSu9nqAM8O
	 UXCeaAxsZKxNfUsyJuHgHxKMyBO2ei1VxrV7U8RRGOSSBvH63A7TkOXGz4V1lf1CHZ
	 vKs4RxXQjwYwttmCez9blAS0OsWDcg+oE8u1Z8qvrpMOfDos0+J1Nb5xHmscs4G05m
	 ssQisdjjyUdnb1qtQITP5QDs6o+EcE9lRKlcmcCvccqbhWVJ7L57saihzNAtdEFe/K
	 NWAorVEMXkZSCBNbEH3DqEutbc0OoM0qbHv+A6UvKCtDuZ4Plhaozhab2sBg4Vq9lE
	 eF0pTDToi0eDg==
X-Gm-Message-State: AOAM530Jz6bTPQK+Wton04/UQUS2RlAqhipbg3y97v2aMJwWiQDlL0+j
	SxPZpc7/h/bECNHyoCO+9QxH1meuXwy/Ezcue04=
X-Google-Smtp-Source: ABdhPJzsXMPBn9ZscHy6NSd943UAnP7Q0xuJUJG3Md84R3HOOC0ZsI99DMCq7OIZg7WmnCYgDMp3vs0ljI2yu52CQ+Y=
X-Received: by 2002:a9d:4e8d:0:b0:605:4f04:4863 with SMTP id
 v13-20020a9d4e8d000000b006054f044863mr1385531otk.204.1650307445122; Mon, 18
 Apr 2022 11:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
In-Reply-To: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 18 Apr 2022 14:43:28 -0400
X-Gmail-Original-Message-ID: <CABfawhk-oCAoz-99LOaOYKD-N1FvRnFvM9_AUCgsPEF16F=VCA@mail.gmail.com>
Message-ID: <CABfawhk-oCAoz-99LOaOYKD-N1FvRnFvM9_AUCgsPEF16F=VCA@mail.gmail.com>
Subject: Re: [PATCH v5] x86/vmx: add hvm functions to get/set non-register state
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: xen-devel@lists.xenproject.org, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Mar 25, 2022 at 9:34 AM Tamas K Lengyel <tamas.lengyel@intel.com> wrote:
>
> During VM forking and resetting a failed vmentry has been observed due
> to the guest non-register state going out-of-sync with the guest register
> state. For example, a VM fork reset right after a STI instruction can trigger
> the failed entry. This is due to the guest non-register state not being saved
> from the parent VM, thus the reset operation only copies the register state.
>
> Fix this by adding a new pair of hvm functions to get/set the guest
> non-register state so that the overall vCPU state remains in sync.
>
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
> v5: Switch to internal-only hvm funcs instead of adding to hvm_hw_cpu

Patch ping.

