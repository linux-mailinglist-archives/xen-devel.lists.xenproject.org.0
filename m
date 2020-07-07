Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E9216BB0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 13:36:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsltK-0001Tw-Pz; Tue, 07 Jul 2020 11:36:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzy/=AS=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jsltK-0001Tr-36
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 11:36:02 +0000
X-Inumbo-ID: 07d95c98-c046-11ea-8d53-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07d95c98-c046-11ea-8d53-12813bfff9fa;
 Tue, 07 Jul 2020 11:36:00 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 95A6AA2338;
 Tue,  7 Jul 2020 13:35:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7F3E6A232E;
 Tue,  7 Jul 2020 13:35:58 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0FsJ15pnF5hk; Tue,  7 Jul 2020 13:35:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 11E70A233A;
 Tue,  7 Jul 2020 13:35:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id F_vW2uMNc4Ie; Tue,  7 Jul 2020 13:35:57 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id DA026A232E;
 Tue,  7 Jul 2020 13:35:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id C363E20B30;
 Tue,  7 Jul 2020 13:35:27 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PXgkSWN0EHas; Tue,  7 Jul 2020 13:35:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6488C215B3;
 Tue,  7 Jul 2020 13:35:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1m7ljDy6gyKa; Tue,  7 Jul 2020 13:35:22 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 416C2214C4;
 Tue,  7 Jul 2020 13:35:22 +0200 (CEST)
Date: Tue, 7 Jul 2020 13:35:22 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <668304207.20725370.1594121722137.JavaMail.zimbra@cert.pl>
In-Reply-To: <3644946e-a3fa-bef0-4c55-a42988b12368@suse.com>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <51ecaf40-8fb5-8454-7055-5af33a47152e@xen.org>
 <d9e604e9-acb7-17df-f0d1-7552dab526c7@suse.com>
 <88892784-0ed6-2594-bef8-fd0ae46c2b17@xen.org>
 <a13451d6-d6b5-6d86-aeb0-8985db730866@suse.com>
 <ab992813-4584-f8e0-b90a-7a587c396bae@xen.org>
 <1580655090.20712847.1594120639229.JavaMail.zimbra@cert.pl>
 <3644946e-a3fa-bef0-4c55-a42988b12368@suse.com>
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - FF78 (Linux)/8.6.0_GA_1194)
Thread-Topic: tools/libxl: add vmtrace_pt_size parameter
Thread-Index: /FX9IfO24J25T2HL91s/1VhYoIURdw==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 7 lip 2020 o 13:21, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 07.07.2020 13:17, Micha=C5=82 Leszczy=C5=84ski wrote:
>> So would it be OK to use uint32_t everywhere and to store the trace buff=
er
>> size as number of kB? I think this is the most straightforward option.
>>=20
>> I would also stick with the name "processor_trace_buf_size"
>> everywhere, both in the hypervisor, ABI and the toolstack, with the
>> respective comments that the size is in kB.
>=20
> Perhaps even more clearly "processor_trace_buf_kb" then?
>=20
> Jan


Ok.

Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

