Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC8523AA9
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 18:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327117.549851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nopV3-0004YN-3h; Wed, 11 May 2022 16:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327117.549851; Wed, 11 May 2022 16:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nopV3-0004Vf-0d; Wed, 11 May 2022 16:47:45 +0000
Received: by outflank-mailman (input) for mailman id 327117;
 Wed, 11 May 2022 16:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a93T=VT=linux.ibm.com=hca@srs-se1.protection.inumbo.net>)
 id 1nopV2-0004VZ-60
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 16:47:44 +0000
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 125ad827-d14a-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 18:47:42 +0200 (CEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BESoKr028080;
 Wed, 11 May 2022 16:46:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0etx3406-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 16:46:00 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24BGebih023228;
 Wed, 11 May 2022 16:45:59 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0etx33y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 16:45:59 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24BGgY6p030999;
 Wed, 11 May 2022 16:45:56 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3fwgd8wsc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 16:45:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24BGjqsM27197764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 16:45:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA0B35204E;
 Wed, 11 May 2022 16:45:52 +0000 (GMT)
Received: from osiris (unknown [9.145.80.86])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id B9FCE52050;
 Wed, 11 May 2022 16:45:50 +0000 (GMT)
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
X-Inumbo-ID: 125ad827-d14a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=tjIW4ViQYza/lnoDnWyOhboEO5kjiPdt7taCyynzKFw=;
 b=lxUbqAEO3GqUpU+Tuw2IWXF1fzXIGSDn1j9FVHjMmFIPrrH/+bQrVN9PaaYcbEJhBJIr
 7d0t++ZFM6UKMdcnwcUF0YasHW2SP51KwmfPJnRgOou9+kRarIXLa3hIMjmu5cX5t3FO
 6rItwaIor28IfP+e6c0HY1HIerMLLjGg06tg70umpoMhCUKjDu0piWYCrZz/VisJ+s0b
 0DuyX+X+ttOZsVNhvwPdzqfPCbp/RA3MDqZWBEVZBj0PN/wvhGTqQYzQ4imgN+k8TjhU
 NC3v9IrNMZOoN56TSdKZo20ktYuMVwJV19grssXUZ/JxpGndCu9D0HmYa5fO310s9Ten QA== 
Date: Wed, 11 May 2022 18:45:49 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-leds@vger.kernel.org, pmladek@suse.com, bhe@redhat.com,
        akpm@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kexec@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
        rcu@vger.kernel.org, sparclinux@vger.kernel.org,
        xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com,
        kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com,
        alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com,
        arnd@arndb.de, bp@alien8.de, corbet@lwn.net, d.hatayama@jp.fujitsu.com,
        dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com,
        gregkh@linuxfoundation.org, mikelley@microsoft.com,
        hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
        john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
        mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
        peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
        stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
        vkuznets@redhat.com, will@kernel.org
Subject: Re: [PATCH 22/30] panic: Introduce the panic post-reboot notifier
 list
Message-ID: <YnvoPe2cTS31qbjb@osiris>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-23-gpiccoli@igalia.com>
 <7017c234-7c73-524a-11b6-fefdd5646f59@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7017c234-7c73-524a-11b6-fefdd5646f59@igalia.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P8jYmW-Xe3lS0Lxn9LfjJuLQx8-pWyu5
X-Proofpoint-ORIG-GUID: 3EoVOe4XNkWaSjwGnBLNECSOqY142ccD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=429 bulkscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205110076

On Mon, May 09, 2022 at 11:16:10AM -0300, Guilherme G. Piccoli wrote:
> On 27/04/2022 19:49, Guilherme G. Piccoli wrote:
> > Currently we have 3 notifier lists in the panic path, which will
> > be wired in a way to allow the notifier callbacks to run in
> > different moments at panic time, in a subsequent patch.
> > 
> > But there is also an odd set of architecture calls hardcoded in
> > the end of panic path, after the restart machinery. They're
> > responsible for late time tunings / events, like enabling a stop
> > button (Sparc) or effectively stopping the machine (s390).
> > 
> > This patch introduces yet another notifier list to offer the
> > architectures a way to add callbacks in such late moment on
> > panic path without the need of ifdefs / hardcoded approaches.
> > 
> > Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> > Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Heiko Carstens <hca@linux.ibm.com>
> > Cc: Sven Schnelle <svens@linux.ibm.com>
> > Cc: Vasily Gorbik <gor@linux.ibm.com>
> > Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> 
> Hey S390/SPARC folks, sorry for the ping!
> 
> Any reviews on this V1 would be greatly appreciated, I'm working on V2
> and seeking feedback in the non-reviewed patches.

Sorry, missed that this is quite s390 specific. So, yes, this looks
good to me and nice to see that one of the remaining CONFIG_S390 in
common code will be removed!

For the s390 bits:
Acked-by: Heiko Carstens <hca@linux.ibm.com>

