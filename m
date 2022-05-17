Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3A752AB97
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 21:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331449.554961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr2YB-0005ww-O3; Tue, 17 May 2022 19:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331449.554961; Tue, 17 May 2022 19:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr2YB-0005uT-LG; Tue, 17 May 2022 19:08:07 +0000
Received: by outflank-mailman (input) for mailman id 331449;
 Tue, 17 May 2022 19:08:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k6T6=VZ=intel.com=tony.luck@srs-se1.protection.inumbo.net>)
 id 1nr2Y9-0005uN-4k
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 19:08:05 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa9c5dc5-d614-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 21:08:01 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 12:07:58 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 17 May 2022 12:07:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 12:07:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 12:07:55 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Tue, 17 May 2022 12:07:55 -0700
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
X-Inumbo-ID: aa9c5dc5-d614-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652814481; x=1684350481;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dMu3qmaQOzDmPfmmDPn/58HAfnv205GwUCrX1kk3ZHk=;
  b=UstW7IB9SExFC4y2nGop6Pb5l/DA//aaFkJro4864uBwZnKpokFle51Z
   uFqyKOCxkua4bkscIXaF3kmdQ4LztoHh9SQRNMat5HYyn/ipAI7RMSuwm
   Q2/EHofL0PhwjXSUghb83D2jPCijQf2uMPl2tZ0uR1MgynB65CVwNwDnp
   r90h8/eF5o/lEN2Q7pYtWGL4kWoAbWXwb/7UKZCN5WmUceLHeED4XiNY1
   Dv1SzQYbOXwgm8tzDnhseHrS8R3EsR1qb+DdHIJzXTtEUAcLm3SwLFfT+
   rJi0ZpcUKee8Qs2LU0WJ+p9MvD3MIVSI2JuLO6zesfoNErXdLIGMiJisc
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="270985081"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="270985081"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="605497608"
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
Thread-Index: AQHYWooLnXaT7guJw0OCpuGv/IkEoK0iJCSAgAAZuAD//40QkIAAesuAgAFqbACAACtDgP//jcxAgACKZID//5nyAA==
Date: Tue, 17 May 2022 19:07:54 +0000
Message-ID: <7f9f6feb9f494b0288deab718807172d@intel.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
 <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com> <YoOs9GJ5Ovq63u5Q@alley>
 <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
 <06d85642fef24bc482642d669242654b@intel.com>
 <62a63fc2-346f-f375-043a-fa21385279df@igalia.com>
In-Reply-To: <62a63fc2-346f-f375-043a-fa21385279df@igalia.com>
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

PiBXaGF0IEknbSBwbGFubmluZyB0byBkbyBpbiB0aGUgYWx0ZXJhX2VkYWMgbm90aWZpZXIgaXM6
DQo+DQo+IGlmIChrZHVtcF9pc19zZXQpDQo+ICAgcmV0dXJuOw0KDQpZZXMuIFRoYXQncyB3aGF0
IEkgdGhpbmsgc2hvdWxkIGhhcHBlbi4NCg0KLVRvbnkNCg==

