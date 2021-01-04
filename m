Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E82E9B22
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:36:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61367.107918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSqV-0004vZ-98; Mon, 04 Jan 2021 16:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61367.107918; Mon, 04 Jan 2021 16:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSqV-0004vA-5x; Mon, 04 Jan 2021 16:36:39 +0000
Received: by outflank-mailman (input) for mailman id 61367;
 Mon, 04 Jan 2021 16:36:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yCAg=GH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kwSqT-0004v1-6o
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:36:37 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22422037-9e61-44ca-8175-84e48679250f;
 Mon, 04 Jan 2021 16:36:36 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104GZSPW071017;
 Mon, 4 Jan 2021 16:36:26 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35tg8qw3uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 04 Jan 2021 16:36:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104GZx3F138732;
 Mon, 4 Jan 2021 16:36:25 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 35v1f7jkmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jan 2021 16:36:24 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 104GZmkc025064;
 Mon, 4 Jan 2021 16:35:48 GMT
Received: from [10.39.231.107] (/10.39.231.107)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Jan 2021 16:35:48 +0000
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
X-Inumbo-ID: 22422037-9e61-44ca-8175-84e48679250f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Tfjp9xoNOD8V0NWIpGkUBujBbCraoYZWwsm9QDWhYm8=;
 b=tVXUN1EWuQDztnMm+va5C7M/ER4JDUHKq/CPw4uSIqoDbwsvPPbHygEOCHkAovjnml2Q
 RqNFzbP5MPtPKYlo/L+lhmqAYLyJ8+x03VMLcJJ+EeRh3hYZl/s6D/ooSv29UdYmOGoh
 +2WFu20zly5DJnGifMAm2/aC4WCjrtSG/hNCMTYa6OEIV1DXff3UlA62fBdCBgChIdSp
 Mtn9tUO6Yd5dk6Z4KTmt//q8V5zcndvJjmY57ScRcDjB4zvQA8sXX/LEeSldvspzY0SD
 YTxgI4kKgEnHUamnJxZDmaQaNoLEj52jo+tKHFBSm6L3UnjSoFudASaqT7VqFM1zE9Xu Yg== 
Subject: Re: [PATCH 1/5] xen: Fix event channel callback via INTX/GSI
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
 <20201224115323.3540130-2-dwmw2@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <b7717356-a15f-40d4-eb29-386cf110b5c6@oracle.com>
Date: Mon, 4 Jan 2021 11:35:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224115323.3540130-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040107


On 12/24/20 6:53 AM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> For a while, event channel notification via the PCI platform device
> has been broken, because we attempt to communicate with xenstore before
> we even have notifications working, with the xs_reset_watches() call
> in xs_init().
>
> We tend to get away with this on Xen versions below 4.0 because we avoid
> calling xs_reset_watches() anyway, because xenstore might not cope with
> reading a non-existent key. And newer Xen *does* have the vector
> callback support, so we rarely fall back to INTX/GSI delivery.
>
> To fix it, clean up a bit of the mess of xs_init() and xenbus_probe()
> startup. Call xs_init() directly from xenbus_init() only in the !XS_HVM
> case, deferring it to be called from xenbus_probe() in the XS_HVM case
> instead.
>
> Then fix up the invocation of xenbus_probe() to happen either from its
> device_initcall if the callback is available early enough, or when the
> callback is finally set up. This means that the hack of calling
> xenbus_probe() from a workqueue after the first interrupt, or directly
> from the PCI platform device setup, is no longer needed.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



