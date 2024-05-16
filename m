Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6C38C782E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723381.1128270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bgs-0006Dc-3p; Thu, 16 May 2024 14:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723381.1128270; Thu, 16 May 2024 14:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bgs-0006Aq-0z; Thu, 16 May 2024 14:02:38 +0000
Received: by outflank-mailman (input) for mailman id 723381;
 Thu, 16 May 2024 14:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G7yJ=MT=amazon.es=prvs=85909aada=nsaenz@srs-se1.protection.inumbo.net>)
 id 1s7bgq-00069X-6h
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 14:02:36 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f13a966b-138c-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 16:02:35 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 14:02:24 +0000
Received: from EX19MTAEUC001.ant.amazon.com [10.0.17.79:61258]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.38.98:2525]
 with esmtp (Farcaster)
 id 669cf238-0252-433a-b5ae-10131f992275; Thu, 16 May 2024 14:02:23 +0000 (UTC)
Received: from EX19D004EUC001.ant.amazon.com (10.252.51.190) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 May 2024 14:02:23 +0000
Received: from localhost (10.13.235.138) by EX19D004EUC001.ant.amazon.com
 (10.252.51.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Thu, 16 May
 2024 14:02:12 +0000
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
X-Inumbo-ID: f13a966b-138c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715868155; x=1747404155;
  h=mime-version:content-transfer-encoding:date:message-id:
   cc:from:to:references:in-reply-to:subject;
  bh=PII+OyY3HRsFOpjW5l++XBk5W4fZ/zADl3BCmJlUORM=;
  b=MxGCVqenHOOu1amiqFPIJj8iHolMiELzMBkfgtz7aRgui5laU37yroIm
   PQlMALS83R8GC1Hep2GTybOqW92bpd5lOId6oaujqhVvjc75ecQ6PUtaJ
   kfxBDC2COnweQbgDZQbxg4MreqHCUZ5EY8+IykAJjK5klmj0rZDibvbBM
   g=;
X-IronPort-AV: E=Sophos;i="6.08,164,1712620800"; 
   d="scan'208";a="419475431"
Subject: Re: [RFC PATCH v3 3/5] KVM: x86: Add notifications for Heki policy
 configuration and violation
X-Farcaster-Flow-ID: 669cf238-0252-433a-b5ae-10131f992275
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 May 2024 14:02:09 +0000
Message-ID: <D1B4HKJAJG21.2DH9F3E1Q6J9L@amazon.com>
CC: Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Vitaly
 Kuznetsov" <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, "Rick P
 Edgecombe" <rick.p.edgecombe@intel.com>, Alexander Graf <graf@amazon.com>,
	Angelina Vu <angelinavu@linux.microsoft.com>, Anna Trikalinou
	<atrikalinou@microsoft.com>, Chao Peng <chao.p.peng@linux.intel.com>,
	"Forrest Yuan Yu" <yuanyu@google.com>, James Gowans <jgowans@amazon.com>,
	James Morris <jamorris@linux.microsoft.com>, John Andersen
	<john.s.andersen@intel.com>, "Madhavan T . Venkataraman"
	<madvenka@linux.microsoft.com>, Marian Rotariu <marian.c.rotariu@gmail.com>,
	=?utf-8?q?Mihai_Don=C8=9Bu?= <mdontu@bitdefender.com>,
	=?utf-8?q?Nicu=C8=99or_C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>, Thara
 Gopinath <tgopinath@microsoft.com>, "Trilok Soni" <quic_tsoni@quicinc.com>,
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, Yu Zhang
	<yu.c.zhang@linux.intel.com>, =?utf-8?q?=C8=98tefan_=C8=98icleru?=
	<ssicleru@bitdefender.com>, <dev@lists.cloudhypervisor.org>,
	<kvm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<linux-hyperv@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-security-module@vger.kernel.org>, <qemu-devel@nongnu.org>,
	<virtualization@lists.linux-foundation.org>, <x86@kernel.org>,
	<xen-devel@lists.xenproject.org>
From: Nicolas Saenz Julienne <nsaenz@amazon.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
X-Mailer: aerc 0.17.0-129-gd582ac682cdf-dirty
References: <20240503131910.307630-1-mic@digikod.net>
 <20240503131910.307630-4-mic@digikod.net> <ZjTuqV-AxQQRWwUW@google.com>
 <20240506.ohwe7eewu0oB@digikod.net> <ZjmFPZd5q_hEBdBz@google.com>
 <20240507.ieghomae0UoC@digikod.net> <ZjpTxt-Bxia3bRwB@google.com>
 <D15VQ97L5M8J.1TDNQE6KLW6JO@amazon.com> <20240514.mai3Ahdoo2qu@digikod.net>
In-Reply-To: <20240514.mai3Ahdoo2qu@digikod.net>
X-Originating-IP: [10.13.235.138]
X-ClientProxiedBy: EX19D046UWA001.ant.amazon.com (10.13.139.112) To
 EX19D004EUC001.ant.amazon.com (10.252.51.190)

On Tue May 14, 2024 at 12:23 PM UTC, Micka=C3=ABl Sala=C3=BCn wrote:
> > Development happens
> > https://github.com/vianpl/{linux,qemu,kvm-unit-tests} and the vsm-next
> > branch, but I'd advice against looking into it until we add some order
> > to the rework. Regardless, feel free to get in touch.
>
> Thanks for the update.
>
> Could we schedule a PUCK meeting to synchronize and help each other?
> What about June 12?

Sounds great! June 12th works for me.

Nicolas

