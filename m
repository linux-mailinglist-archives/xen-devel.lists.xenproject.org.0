Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0612E9B3A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:43:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61371.107930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSwd-0005rc-Vr; Mon, 04 Jan 2021 16:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61371.107930; Mon, 04 Jan 2021 16:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSwd-0005rD-SO; Mon, 04 Jan 2021 16:42:59 +0000
Received: by outflank-mailman (input) for mailman id 61371;
 Mon, 04 Jan 2021 16:42:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yCAg=GH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kwSwc-0005r8-F8
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:42:58 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11b4d000-8d16-4057-8c6a-6c228c10bf18;
 Mon, 04 Jan 2021 16:42:57 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104GcfBD012885;
 Mon, 4 Jan 2021 16:42:51 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35teban6yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 04 Jan 2021 16:42:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104GeKuf165314;
 Mon, 4 Jan 2021 16:42:50 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 35uxnrd6r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jan 2021 16:42:50 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 104GgnBc030126;
 Mon, 4 Jan 2021 16:42:49 GMT
Received: from [10.39.231.107] (/10.39.231.107)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Jan 2021 08:42:48 -0800
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
X-Inumbo-ID: 11b4d000-8d16-4057-8c6a-6c228c10bf18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=7oCioUYTPumcU2NqXQLPsXzObSZ7Tojx1PPlSyMwSqM=;
 b=IDOhmDfmFb0V8D0uA4rvHFtPoKHCPwY+dfzwVRu4wxikfkmzkNvLD6i0qG/0EKDPYl/S
 FpB4aUjzvC0bW3drNVZJxCyj492mQRci5b5lPh9RG0XG88sDr1gam1Nfx+42R4nhBwfT
 aKc06rzEeBfoBjH4JZGfxsTPkbLj7dGvTU50DJFnBB15Ul84KFC12Jljp3bmGsVa5IQH
 F6UOuPxw3vRl1WOERZi/TJapYIiq8uwuoPfj+cBdZNFW/0qsX6rbc4hAV5Li6mlBCI6p
 jUK/4jOMZRGZOpEoFT7MGThOhiYacKhvejp4XrPO7k53MQAH0Y04hGiQw62CILjY0SBC KA== 
Subject: Re: [PATCH 2/5] xen: Set platform PCI device INTX affinity to CPU0
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
 <20201224115323.3540130-3-dwmw2@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <005d7a50-eadf-d83a-9ebe-9a4aa901f8a2@oracle.com>
Date: Mon, 4 Jan 2021 11:42:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224115323.3540130-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040108


On 12/24/20 6:53 AM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> With INTX or GSI delivery, Xen uses the event channel structures of CPU0.
>
> If the interrupt gets handled by Linux on a different CPU, then no events
> are seen as pending. Rather than introducing locking to allow other CPUs
> to process CPU0's events, just ensure that the PCI interrupts happens
> only on CPU0.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



