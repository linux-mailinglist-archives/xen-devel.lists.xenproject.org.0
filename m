Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C452D6AED
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 00:22:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49976.88367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knVFr-0000dG-K8; Thu, 10 Dec 2020 23:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49976.88367; Thu, 10 Dec 2020 23:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knVFr-0000cr-G4; Thu, 10 Dec 2020 23:21:47 +0000
Received: by outflank-mailman (input) for mailman id 49976;
 Thu, 10 Dec 2020 23:21:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EOQ=FO=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1knVFp-0000cm-TY
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 23:21:46 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72a3a23b-512a-41cc-9e57-1c34b8744a00;
 Thu, 10 Dec 2020 23:21:45 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BANJcXS003074;
 Thu, 10 Dec 2020 23:19:38 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 357yqc85cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 23:19:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BAMxr2o074450;
 Thu, 10 Dec 2020 23:19:32 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 358m52xf7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 23:19:32 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BANJPdu022291;
 Thu, 10 Dec 2020 23:19:25 GMT
Received: from [10.39.227.125] (/10.39.227.125)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Dec 2020 15:19:24 -0800
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
X-Inumbo-ID: 72a3a23b-512a-41cc-9e57-1c34b8744a00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=+7Mm8NoMJp9j52xNSSS3U0SBEUJij5+TbHj/sEGWvTc=;
 b=u+3l3VwFE77ZdGsGjRddFE+dCehz5qrVKsbBnhGV+nhEsQXQr4wsZggjHTDzlgab5HWW
 W5egKIrrmhPu4ceJfalySBs8+I9FL0posNnaW9CbqbQrGVA0xg9R6RUkmEkz2s2No81L
 nPNXJeIgpYDvFxFB/WQZYYVQRZ8i2VKbURSVU2FxkTzOHIYKNUfXXIo5pBMOc10Am1by
 BIehnBSdx++jQOQE0Sqhoje+VUsTyicTJHRPdgx7QaW/te4Rwue+wm7tniYwBY8WiOcJ
 un2QEN6snEEYNGv5arjms4I4Cg54F0bI7f25KRnMCWmobnf82SR6SJhov103IcOkf0u5 8g== 
Subject: Re: [patch 24/30] xen/events: Remove unused
 bind_evtchn_to_irq_lateeoi()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-parisc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, Jon Mason <jdmason@kudzu.us>,
        Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
        linux-ntb@googlegroups.com,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Michal Simek <michal.simek@xilinx.com>, linux-pci@vger.kernel.org,
        Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-rdma@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.972064156@linutronix.de>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <748d8d81-ac0f-aee2-1a56-ba9c40fee52f@oracle.com>
Date: Thu, 10 Dec 2020 18:19:19 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210194044.972064156@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100148
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100149


On 12/10/20 2:26 PM, Thomas Gleixner wrote:
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  drivers/xen/events/events_base.c |    6 ------
>  1 file changed, 6 deletions(-)
>
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -1132,12 +1132,6 @@ int bind_evtchn_to_irq(evtchn_port_t evt
>  }
>  EXPORT_SYMBOL_GPL(bind_evtchn_to_irq);
>  
> -int bind_evtchn_to_irq_lateeoi(evtchn_port_t evtchn)
> -{
> -	return bind_evtchn_to_irq_chip(evtchn, &xen_lateeoi_chip);
> -}
> -EXPORT_SYMBOL_GPL(bind_evtchn_to_irq_lateeoi);



include/xen/events.h also needs to be updated (and in the next patch for xen_set_affinity_evtchn() as well).


-boris


