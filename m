Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E252A8D5
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 19:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331307.554793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0aq-0002RO-G2; Tue, 17 May 2022 17:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331307.554793; Tue, 17 May 2022 17:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0aq-0002OU-Cf; Tue, 17 May 2022 17:02:44 +0000
Received: by outflank-mailman (input) for mailman id 331307;
 Tue, 17 May 2022 17:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k6T6=VZ=intel.com=tony.luck@srs-se1.protection.inumbo.net>)
 id 1nr0ao-0002O8-L1
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 17:02:43 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26235fc1-d603-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 19:02:38 +0200 (CEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:02:34 -0700
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 17 May 2022 10:02:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 10:02:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 10:02:31 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Tue, 17 May 2022 10:02:31 -0700
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
X-Inumbo-ID: 26235fc1-d603-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652806958; x=1684342958;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wPndYlW5xEVdpcc0zA72NXu9ypQzfs4FPZzk6VJMkkY=;
  b=E7Pcez5DgdPL62RMz9czjYHtIWNHfSbSPAi6maTscPRNtXygBe1fFzXb
   MVe86PUkudZ87qt7RMGUr9lXJ2vxYv2w/Z3wPc1XN9EX9k4g1ejPQfjxW
   oRLBNwJjeaC6TAkUOMusi1Bo0yAzmkkwPmJE011o8TPNS4iCfOHzcVd9J
   NSXEX1T6vXte1GMp3jOFoCuqCN3stoeJXCwt6K5gA4+e7lbXfRFKeEgSq
   KWsQFMuQm74+5/Mkzl5ChuGhUq31nyRxTUChV7mcU4JQeAgc15CCGdssM
   Zu5VmZiY1vlC6XNaZtJQ4KpKYy+WpWIV4cWR7sd/+ue803iKp+Sf67T7y
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="270942691"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="270942691"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="700144313"
From: "Luck, Tony" <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek
	<pmladek@suse.com>, Dinh Nguyen <dinguyen@kernel.org>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com"
	<bhe@redhat.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-alpha@vger.kernel.org"
	<linux-alpha@vger.kernel.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-um@lists.infradead.org"
	<linux-um@lists.infradead.org>, "linux-xtensa@linux-xtensa.org"
	<linux-xtensa@linux-xtensa.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "openipmi-developer@lists.sourceforge.net"
	<openipmi-developer@lists.sourceforge.net>, "rcu@vger.kernel.org"
	<rcu@vger.kernel.org>, "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "x86@kernel.org" <x86@kernel.org>,
	"kernel-dev@igalia.com" <kernel-dev@igalia.com>, "kernel@gpiccoli.net"
	<kernel@gpiccoli.net>, "halves@canonical.com" <halves@canonical.com>,
	"fabiomirmar@gmail.com" <fabiomirmar@gmail.com>,
	"alejandro.j.jimenez@oracle.com" <alejandro.j.jimenez@oracle.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"arnd@arndb.de" <arnd@arndb.de>, "bp@alien8.de" <bp@alien8.de>,
	"corbet@lwn.net" <corbet@lwn.net>, "d.hatayama@jp.fujitsu.com"
	<d.hatayama@jp.fujitsu.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "dyoung@redhat.com" <dyoung@redhat.com>,
	"Tang, Feng" <feng.tang@intel.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "mikelley@microsoft.com"
	<mikelley@microsoft.com>, "hidehiro.kawai.ez@hitachi.com"
	<hidehiro.kawai.ez@hitachi.com>, "jgross@suse.com" <jgross@suse.com>,
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>,
	"keescook@chromium.org" <keescook@chromium.org>, "luto@kernel.org"
	<luto@kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "paulmck@kernel.org"
	<paulmck@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "senozhatsky@chromium.org"
	<senozhatsky@chromium.org>, "stern@rowland.harvard.edu"
	<stern@rowland.harvard.edu>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"vgoyal@redhat.com" <vgoyal@redhat.com>, "vkuznets@redhat.com"
	<vkuznets@redhat.com>, "will@kernel.org" <will@kernel.org>, Alex Elder
	<elder@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Anton Ivanov
	<anton.ivanov@cambridgegreys.com>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Chris Zankel
	<chris@zankel.net>, Christian Borntraeger <borntraeger@linux.ibm.com>, "Corey
 Minyard" <minyard@acm.org>, Dexuan Cui <decui@microsoft.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Haiyang Zhang <haiyangz@microsoft.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Ivan Kokshaysky
	<ink@jurassic.park.msu.ru>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, James Morse <james.morse@arm.com>,
	Johannes Berg <johannes@sipsolutions.net>, "K. Y. Srinivasan"
	<kys@microsoft.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, "Matt
 Turner" <mattst88@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Max
 Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul
 Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>, "Richard
 Weinberger" <richard@nod.at>, Robert Richter <rric@kernel.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Stephen Hemminger
	<sthemmin@microsoft.com>, Sven Schnelle <svens@linux.ibm.com>, "Vasily
 Gorbik" <gor@linux.ibm.com>, Wei Liu <wei.liu@kernel.org>
Subject: RE: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Thread-Topic: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier
 list
Thread-Index: AQHYWooLnXaT7guJw0OCpuGv/IkEoK0iJCSAgAAZuAD//40QkIAAesuAgAFqbACAACtDgP//jcxA
Date: Tue, 17 May 2022 17:02:31 +0000
Message-ID: <06d85642fef24bc482642d669242654b@intel.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
 <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com> <YoOs9GJ5Ovq63u5Q@alley>
 <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
In-Reply-To: <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

PiBUb255IC8gRGluaCAtIGNhbiBJIGp1c3QgKnNraXAqIHRoaXMgbm90aWZpZXIgKmlmIGtkdW1w
KiBpcyBzZXQgb3IgZWxzZQ0KPiB3ZSBydW4gdGhlIGNvZGUgYXMtaXM/IERvZXMgdGhhdCBtYWtl
IHNlbnNlIHRvIHlvdT8NCg0KVGhlICJza2lwIiBvcHRpb24gc291bmRzIGxpa2UgaXQgbmVlZHMg
c29tZSBzcGVjaWFsIGZsYWcgYXNzb2NpYXRlZCB3aXRoDQphbiBlbnRyeSBvbiB0aGUgbm90aWZp
ZXIgY2hhaW4uIEJ1dCB0aGVyZSBhcmUgb3RoZXIgbm90aWZpZXIgY2hhaW5zIC4uLiBzbyB0aGF0
DQpzb3VuZHMgbWVzc3kgdG8gbWUuDQoNCkp1c3QgYWxsIHRoZSBub3RpZmllcnMgaW4gcHJpb3Jp
dHkgb3JkZXIuIElmIGFueSB3YW50IHRvIHRha2UgZGlmZmVyZW50IGFjdGlvbnMNCmJhc2VkIG9u
IGtkdW1wIHN0YXR1cywgY2hhbmdlIHRoZSBjb2RlLiBUaGF0IHNlZW1zIG1vcmUgZmxleGlibGUg
dGhhbg0KYW4gImFsbCBvciBub3RoaW5nIiBhcHByb2FjaCBieSBza2lwcGluZy4NCg0KLVRvbnkN
Cg==

