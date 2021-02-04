Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ECD30F5E4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 16:13:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81339.150156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7gJN-0004qb-WB; Thu, 04 Feb 2021 15:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81339.150156; Thu, 04 Feb 2021 15:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7gJN-0004qC-TE; Thu, 04 Feb 2021 15:12:49 +0000
Received: by outflank-mailman (input) for mailman id 81339;
 Thu, 04 Feb 2021 15:12:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7gJN-0004q7-0N
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:12:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7gJM-0005I0-UF
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:12:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7gJM-0007kk-SU
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:12:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7gJI-0008QM-8X; Thu, 04 Feb 2021 15:12:44 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=/lCByavWdZXCvJxK0iDBpo4VmnYuCe3xKi1daN0BWvw=; b=rJAusodWIp705ZK8JS31TqfF5t
	B72ubCAwsWTmdBQa3UOGjCFOAQfJKiz/5PIdC/7H9QMbUJtSf3DLg5aD3UpxfnOvDSNtpqXcfPR45
	rNZP69vu00eZmOz3f3b+2ypZ3kK6hQwYiRTrBlUGw3lxfXviIGNABBiEJW+H6OexSjvQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <24604.3819.903469.786536@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 15:12:43 +0000
To: Dario Faggioli <dfaggioli@suse.com>
Cc: committers@xenproject.org,
    xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Jan Beulich  <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    community.manager@xenproject.org
Subject: Re: [ANNOUNCE] Xen 4.15 - call for notification/status of
 significant bugs
In-Reply-To: <6d0d7181bad79259aff28351621d2ac1eeaca113.camel@suse.com>
References: <24600.8030.769396.165224@mariner.uk.xensource.com>
	<24603.58528.901884.980466@mariner.uk.xensource.com>
	<6d0d7181bad79259aff28351621d2ac1eeaca113.camel@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Dario Faggioli writes ("Re: [ANNOUNCE] Xen 4.15 - call for notification=
/status of significant bugs"):
> On Thu, 2021-02-04 at 12:12 +0000, Ian Jackson wrote:
> > I reviewed a thread about this and it is not clear to me where we a=
re
> > with this.
.
> Ok, let me try to summarize the current status.

Thanks.

> - BUG: credit=3Dsched2 machine hang when using DRAKVUF
>=20
>   https://lists.xen.org/archives/html/xen-devel/2020-05/msg01985.html=

>   https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg015=
61.html
>   https://bugzilla.opensuse.org/show_bug.cgi?id=3D1179246
>=20
>   99% sure that it's a Credit2 scheduler issue.
>   I'm actively working on it.
>   "Seems a tricky one; I'm still in the analysis phase"
>=20
>   Manifests only with=A0certain combination of hardware and workload.=
=A0
>   I'm=A0not reproducing,=A0but there are multiple reports of it (see=A0=

>   above). I'm investigating and trying to come up at least with=A0
>   debug=A0patches that one of the reporter should be able and willing=
 to=A0
>   test.

I think this is a clear blocker for 4.15.  I will call it "F".

> - Null scheduler and vwfi native problem
>=20
>   https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg016=
34.html
>=20
>   RCU issues, but manifests due to scheduler behavior (especially  =A0=

>   NULL scheduler,=A0especially on ARM).
>   I'm actively working on it.
>=20
>   Patches that should solve the issue for ARM posted already. They=A0=

>   will=A0need to be slightly adjusted to cover x86 as well. Waiting a=
=A0
>   couple days more for a confirmation from the reporter that the
>   patches do help, at least on ARM.

I'm not sure whether this is a blocker but it looks like it is going
to be fixed so I will keep it on my list.  I will call it "G".


> - Xen crash after S3 suspend - Xen 4.13
>=20
>   https://lists.xen.org/archives/html/xen-devel/2020-03/msg01251.html=

>   https://lists.xen.org/archives/html/xen-devel/2021-01/msg02620.html=

>=20
>   S3 suspend issue, but root cause seems to be in the scheduler.
>=20
>   Marek is, as usual, providing good info and feedback. It comes as=A0=

>   third in my list (below the two above, basically), but I will look
>   into it.

This is not a blocker so I won't track it explicitly but I would
very much welcome a fix if it is simple or comes quickly.


> - Ryzen 4000 (Mobile) Softlocks/Micro-stutters
>=20
>   https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg009=
66.html
>=20
>   Seems could be scheduling, but amount of info is limited.
>=20
>   What we know is that with `dom0_max_vcpus=3D1 dom0_vcpus_pin`, all=A0=

>   schedulers seem to work fine. Without those params, Credit2 is the=A0=

>   "least bad", although not satisfactory. Other schedulers don't even=
=A0
>   boot.
>   Fact is, it is reported to occure on QubesOS, which has its own=A0
>   downstream patches, plus there are no logs.
>   There's a feeling that this (together with others) hints at SMT off=
=A0
>   having issues on AMD (Ryzen?), but again, it's not crystal clear to=
=A0
>   me whether this is the issue (or an issue at all) and, if yes, in=A0=

>   what subsystem the problem lays.
>   I can try to have a look, mostly for trying to understand whether o=
r=A0
>   not it is really the case that some AMDs have issues with SMT=3Doff=
.
>   But that probably will be after I'll be done with the other issues=A0=

>   I've mentioned before (above) this one.

I'm not sure whether you are saying (a) our current code is not
useable on this hardware because of this issue, or on the other hand
(b) you think the issue is specific to downstream patches ?

Do you think I should consider this a blocker for 4.15 ?


> -=A0Recent upgrade of 4.13 -> 4.14 issue
>=20
>   https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg018=
00.html=20
>=20
>   To my judgment, It's not at all clear whether or not this is a=A0
>   scheduler issue. And at least with the amount of info that we have=A0=

>   so=A0far, I'd lean toward "no, it's not". I'm happy to help with it=
=A0
>   anyway, of course,=A0but it comes after the others.

Again, I think this is not a regression so not a blocker for 4.15.


> So, Ian, was this any helpful?

Yes, very much so, thank you.

Ian.

