Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5AA528A24
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 18:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330121.553445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqdQH-0003wt-VL; Mon, 16 May 2022 16:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330121.553445; Mon, 16 May 2022 16:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqdQH-0003uX-Rp; Mon, 16 May 2022 16:18:17 +0000
Received: by outflank-mailman (input) for mailman id 330121;
 Mon, 16 May 2022 16:18:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oZZ=VY=intel.com=tony.luck@srs-se1.protection.inumbo.net>)
 id 1nqdQG-0003tb-7E
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 16:18:16 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c63fbe78-d533-11ec-bd2c-47488cf2e6aa;
 Mon, 16 May 2022 18:18:11 +0200 (CEST)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 09:18:08 -0700
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 16 May 2022 09:18:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 16 May 2022 09:18:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 16 May 2022 09:18:04 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Mon, 16 May 2022 09:18:04 -0700
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
X-Inumbo-ID: c63fbe78-d533-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652717892; x=1684253892;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+l+W5AAGJYF9POu96DFeN42Yp1wDBbNs2cT6ebzm1Q4=;
  b=QdPVnh+idtMThKRNwa/dq0Cn0wshb1yL/J5gV02kbpMmc6oh+S5W5LFF
   ZVuY1oqh9bsF6izz/+CIoCQbikE/DRtfmDNd1cYDEfBkLvHArEtGKIglz
   TamqELhY2kYi/fssRaEhnCNomdxcesGygmi8ngeMS1MIn7OKKyhYpThfS
   IuKDbT6JPco52t+JejNhXZN0hgMnUmzwWYq0/jMCfHhEX56cLsIFcNi80
   SK9TXI7luCoX/ifdXqhBZkv98DbeoNQaUqPRISnC3dZDB4YhRE3H/rjYM
   nMx/Q8sgYjNf8X67otNPBViuixv8Jnuo+qe3+QtcX6il2TcGp6NQA2NV8
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="270576250"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="270576250"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="596591798"
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
Thread-Index: AQHYWooLnXaT7guJw0OCpuGv/IkEoK0iJCSAgAAZuAD//40QkA==
Date: Mon, 16 May 2022 16:18:04 +0000
Message-ID: <bed66b9467254a5a8bafc1983dad643a@intel.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
In-Reply-To: <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
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

PiBTbywgbXkgcmVhc29uaW5nIGhlcmUgaXM6IHRoaXMgbm90aWZpZXIgc2hvdWxkIGZpdCB0aGUg
aW5mbyBsaXN0LA0KPiBkZWZpbml0ZWx5ISBCdXQuLi5pdCdzIHZlcnkgaGlnaCByaXNrIGZvciBr
ZHVtcC4gSXQgZGVlcCBkaXZlcyBpbnRvIHRoZQ0KPiByZWdtYXAgQVBJICh0aGVyZSBhcmUgbG9j
a3MgaW4gc3VjaCBjb2RlKSBwbHVzIHRoZXJlIGlzIGFuIChNTSlJTyB3cml0ZQ0KPiB0byB0aGUg
ZGV2aWNlIGFuZCBhbiBBUk0gZmlybXdhcmUgY2FsbC4gU28sIGRlc3BpdGUgdGhlIG5hdHVyZSBv
ZiB0aGlzDQo+IG5vdGlmaWVyIF9maXRzIHRoZSBpbmZvcm1hdGlvbmFsIGxpc3RfLCB0aGUgX2Nv
ZGUgaXMgcmlza3lfIHNvIHdlIHNob3VsZA0KPiBhdm9pZCBydW5uaW5nIGl0IGJlZm9yZSBhIGtk
dW1wLg0KPg0KPiBOb3csIHdlIGluZGVlZCBoYXZlIGEgY2hpY2tlbi9lZ2cgcHJvYmxlbTogd2Fu
dCB0byBhdm9pZCBpdCBiZWZvcmUNCj4ga2R1bXAsIEJVVCBpbiBjYXNlIGtkdW1wIGlzIG5vdCBz
ZXQsIGttc2dfZHVtcCgpIChhbmQgY29uc29sZSBmbHVzaGluZywNCj4gYWZ0ZXIgeW91ciBzdWdn
ZXN0aW9uIFBldHIpIHdpbGwgcnVuIGJlZm9yZSBpdCBhbmQgbm90IHNhdmUgY29sbGVjdGVkDQo+
IGluZm9ybWF0aW9uIGZyb20gRURBQyBQb1YuDQoNCldvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGhh
dmUgc29tZSBnbG9iYWwgImtkdW1wIGlzIGNvbmZpZ3VyZWQgKyBlbmFibGVkIiBmbGFnPw0KDQpU
aGVuIG5vdGlmaWVycyBjb3VsZCBtYWtlIGFuIGluZm9ybWVkIGNob2ljZSBvbiB3aGV0aGVyIHRv
IGRlZXAgZGl2ZSB0bw0KZ2V0IGFsbCB0aGUgcG9zc2libGUgZGV0YWlscyAod2hlbiB0aGVyZSBp
cyBubyBrZHVtcCkgb3IganVzdCBza2ltIHRoZSBoaWdoDQpsZXZlbCBzdHVmZiAodG8gbWF4aW1p
emUgY2hhbmNlIG9mIGdldHRpbmcgYSBzdWNjZXNzZnVsIGtkdW1wKS4NCg0KLVRvbnkNCg==

