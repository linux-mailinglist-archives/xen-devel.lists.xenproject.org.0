Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BA740A946
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 10:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186288.335012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3sy-0002P1-2A; Tue, 14 Sep 2021 08:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186288.335012; Tue, 14 Sep 2021 08:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3sx-0002NC-UI; Tue, 14 Sep 2021 08:33:47 +0000
Received: by outflank-mailman (input) for mailman id 186288;
 Tue, 14 Sep 2021 08:33:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rbOp=OE=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1mQ3sw-0002Mx-71
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 08:33:46 +0000
Received: from mx0a-001b2d01.pphosted.com (unknown [148.163.156.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 471392ab-cb59-486f-9816-50ed4797f3a9;
 Tue, 14 Sep 2021 08:33:45 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18E8DDVp003164;
 Tue, 14 Sep 2021 04:33:30 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b2n91v8qr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 04:33:30 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18E5xNPG014160;
 Tue, 14 Sep 2021 04:33:30 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b2n91v8pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 04:33:30 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18E8XOWD005452;
 Tue, 14 Sep 2021 08:33:27 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3b0m39rvyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 08:33:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18E8Sthk59048334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Sep 2021 08:28:55 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1501EA4057;
 Tue, 14 Sep 2021 08:33:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D5C7A405F;
 Tue, 14 Sep 2021 08:33:23 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.48.104])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Sep 2021 08:33:23 +0000 (GMT)
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
X-Inumbo-ID: 471392ab-cb59-486f-9816-50ed4797f3a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=pKxQpYGx7FCYqXPJeZcEZp0s2mCsJ/vTkMebph8UpHg=;
 b=c/jFDeff74opNPuhZivqJl24DeEXWtHpxq0scPesE73bTGItp2la9ee5Le8rh2WDqhK8
 19KvhsAHO5kIig7f3OtmztBotyUNdOjPpHcqNkQ3aoekjW6ssWFDj8sYyZRYyGZEVeJp
 W+KIFryQLSaPQLEYn80iFdI3jcSn3aukG2CQEjrLUBIWs8KA8ldRz5hq0JYSy3S03fav
 9eLKLDhoIapuWcwXS0GzUKMmu5bY38f0ZyI/PY8HPiQJeiePP1FRVQKFiR/WEcMzXNJG
 dTFSWKJ+Qj6/VfFT0S70+1k7A/Gg0Vbjd9Oqc/5OVdajPAHX5Q4/5htM421/ItjqzpKF 4g== 
Date: Tue, 14 Sep 2021 11:33:21 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Juergen Gross <jgross@suse.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@suse.de>,
        Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        linux-kernel@vger.kernel.org,
        xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 5.13+ as Xen dom0 crashes on Ryzen CPU (ucode loading
 related?)
Message-ID: <YUBeUZdduCAbOQJN@linux.ibm.com>
References: <YT9I+Xs9wOPVCIVd@mail-itl>
 <923de2f5-3d33-4c02-acec-739fdaf2ae05@suse.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <923de2f5-3d33-4c02-acec-739fdaf2ae05@suse.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Fek_4RKUSmSBac3314u_qg2oT-UwR5fB
X-Proofpoint-GUID: 1n5L13yxXZwxMDPxGVuAivJeUC3QPW11
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 adultscore=0 mlxscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140027

On Tue, Sep 14, 2021 at 09:14:38AM +0200, Juergen Gross wrote:
> On 13.09.21 14:50, Marek Marczykowski-Górecki wrote:
> > Hi,
> > 
> > Since 5.13, the Xen (PV) dom0 crashes on boot, before even printing the
> > kernel version.
> > Test environment:
> >   - Xen 4.14.2
> >   - AMD Ryzen 5 4500U (reported also on AMD Ryzen 7 4750U)
> >   - Linux 5.13.13, confirmed also on 5.14
> > 
> > The crash happens only if the initramfs has earlycpio with microcode.
> > I don't have a serial console, but I've got a photo with crash message
> > (from Xen, Linux doesn't managed to print anything):
> > https://user-images.githubusercontent.com/726704/133084966-5038f37e-001b-4688-9f90-83d09be3dc2d.jpg
> > 
> > Transcription of some of it:
> > 
> >      mapping kernel into physical memory
> >      about to get started
> >      (XEN) Pagetable walk from ffffffff82810888:
> >      (XEN)  L4[0x1ff] = 0000000332815067 0000000000002815
> >      (XEN)  L3[0x1fe] = 0000000332816067 0000000000002816
> >      (XEN)  L2[0x014] = 0000000334018067 0000000000004018
> >      (XEN)  L1[0x010] = 0000000332810067 0000000000002810
> >      (XEN) domain_crash_sync called from entry.S: fault at ffff82d04033e790 x86_64/entry.S#domain_crash_page_fault
> >      (XEN) Domain 0 (vcpu#0) crashed on cpu#0:
> >      (XEN) ----[ Xen-4.14.2  x86_64  debug=n  Not tainted ]----
> >      (XEN) CPU:    0
> >      (XEN) RIP:    e033:[<0000000000000000>]
> 
> The domain's run state seems to be completely clobbered.
> 
> Did you try to boot the kernel with "earlyprintk=xen" to get some idea
> how far it progressed?
> 
> I could imagine that doing the early reservations after the call of
> e820__memory_setup() is problematic, as Xen PV guests have a hook in
> this function performing some rather extended actions.

Right, among them it may relocate initrd:

https://elixir.bootlin.com/linux/latest/source/arch/x86/xen/setup.c#L872
 
and this may cause the reported crash.

> I'm not sure the call of early_reserve_memory() can be moved just before
> the e820__memory_setup() call. If this is possibel it should be done
> IMO, if not then the reservations which have been at the start of
> setup_arch() might need to go there again.

early_reserve_memory() can be moved to the beginning of setup_arch().

Anther possibility is to move initrd relocation out of xen_setup_memory()
and maybe even integrate it somehow in reserve_initrd().

-- 
Sincerely yours,
Mike.

