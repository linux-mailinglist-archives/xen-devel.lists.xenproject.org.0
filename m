Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D630C1BFD6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 17:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152976.1483468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8pD-0004mx-RX; Wed, 29 Oct 2025 16:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152976.1483468; Wed, 29 Oct 2025 16:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8pD-0004kW-Ow; Wed, 29 Oct 2025 16:15:03 +0000
Received: by outflank-mailman (input) for mailman id 1152976;
 Wed, 29 Oct 2025 16:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U31q=5G=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vE8pC-0004kQ-3m
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 16:15:02 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a8264bb-b4e2-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 17:14:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D76F477907ED;
 Wed, 29 Oct 2025 11:14:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ChDkDWUws-25; Wed, 29 Oct 2025 11:14:58 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1EACD7790836;
 Wed, 29 Oct 2025 11:14:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Pkqj3wIP6GVt; Wed, 29 Oct 2025 11:14:57 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id ECEBB77907ED;
 Wed, 29 Oct 2025 11:14:57 -0500 (CDT)
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
X-Inumbo-ID: 6a8264bb-b4e2-11f0-980a-7dc792cee155
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 1EACD7790836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761754498; bh=hkBO+AjfrJ1pLFpHSEWoH03QU5iRaf4ZfXqRnIasWyI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=u4M5eiuJsNy/xGeGFHBz1JlRMiPuswUIQJ4RybvVaaDAuW6bUUOe6LcVQppwuD/8Y
	 AP478oWl2E5Fj40kyPVo0BEBDrkegZcpCHHw5Z7EPnbrQRMLEx0m0nVQtnbVfcKi4f
	 GnT7JhMmj5U0mHIig53O51bCTBhJSPoVNDxQuTQw=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Wed, 29 Oct 2025 11:14:54 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <984265211.4841.1761754494758.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <51be9c37-2102-48f6-a135-a079fec334ff@citrix.com>
References: <1669204635.4117.1761694107160.JavaMail.zimbra@raptorengineeringinc.com> <51be9c37-2102-48f6-a135-a079fec334ff@citrix.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Shawn Anastasio as PPC64 reviewer
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: MAINTAINERS: Remove Shawn Anastasio as PPC64 reviewer
Thread-Index: uZVzH7OkcFEqExu44SEiG48+DAtGfQ==



----- Original Message -----
> From: "Andrew Cooper" <andrew.cooper3@citrix.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "xen-devel" <xen-=
devel@lists.xenproject.org>
> Sent: Wednesday, October 29, 2025 10:23:07 AM
> Subject: Re: [PATCH] MAINTAINERS: Remove Shawn Anastasio as PPC64 reviewe=
r

> On 28/10/2025 11:28 pm, Timothy Pearson wrote:
>> Shawn is no longer with Raptor Engineering.  For now, add myself as PPC6=
4
>> maintainer.
>> ---
>>  MAINTAINERS | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ecd3f40df8..c8764a8c5f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -472,7 +472,7 @@ F:=09xen/drivers/cpufreq/
>>  F:=09xen/include/acpi/cpufreq/
>> =20
>>  PPC64
>> -M:=09Shawn Anastasio <sanastasio@raptorengineering.com>
>> +M:=09Timothy Pearson <tpearson@raptorengineering.com>
>>  F:=09xen/arch/ppc/
>=20
> Sorry to hear, and thanks for letting us know.
>=20
> For a long while now, the committers (the group called The Rest in
> maintainer) have been operating as if this was an R rather than an M.

My apologies for not reaching out sooner; Shawn's departure has required re=
arranging some resources on this end and we're only getting back to Xen now=
.  Raptor remains committed to the port, and I intend to stay on as reviewe=
r / maintainer in the future to prevent this situation from ocurring again.

> It turns out that most changes technically touching PPC are common/arch
> rearrangements, or common things that need a copy in all arches, or
> comments fixes/etc.=C2=A0 We've been putting these in without a PPC ack, =
so
> as not to block work in other area.=C2=A0 Obviously, anything that is PPC
> specific waits for input.

Makes sense, and appreciated.

> If you're not aware, we do have some PPC64 build jobs and one QEMU boot
> test in CI running on every commit.=C2=A0 e.g.
> https://gitlab.com/xen-project/hardware/xen/-/pipelines/2127184050

Indeed!  In fact, if there is any desire for native builds in parallel on o=
ur POWER9 infrastructure we could arrange that as well.

> Would you mind changing to R to reflect how things are working in practic=
e?

I can do that.  Is there a path where we would want to move that back towar=
d M or is this decision a wait and see as the port progresses?

> Also, we're in code freeze for the Xen 4.21 release right now.=C2=A0 This
> patch will be fine, with a SoB, but the others will have to wait until
> 4.22 opens.

Fair enough, nothing here is time sensitive.  Work continues on the port an=
d patches will start flowing again for 4.22.

Thanks again, and looking forward to working with you over the coming month=
s!

