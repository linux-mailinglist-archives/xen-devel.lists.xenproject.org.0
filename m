Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E512EC0A9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 16:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62570.110896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxB6L-0006iI-6I; Wed, 06 Jan 2021 15:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62570.110896; Wed, 06 Jan 2021 15:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxB6L-0006ht-3I; Wed, 06 Jan 2021 15:51:57 +0000
Received: by outflank-mailman (input) for mailman id 62570;
 Wed, 06 Jan 2021 15:51:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OkmI=GJ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxB6J-0006ha-LL
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 15:51:55 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b4602b4-e8b0-4612-8883-d124f1038b13;
 Wed, 06 Jan 2021 15:51:54 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106FXanN160963;
 Wed, 6 Jan 2021 15:51:44 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35wepm8hvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 15:51:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106FUTF7128668;
 Wed, 6 Jan 2021 15:51:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 35v4rcu5t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 15:51:44 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 106FpgWn021259;
 Wed, 6 Jan 2021 15:51:42 GMT
Received: from [10.39.201.28] (/10.39.201.28)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Jan 2021 15:51:42 +0000
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
X-Inumbo-ID: 8b4602b4-e8b0-4612-8883-d124f1038b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=SwSd6kqmIQg31P+DyuS+4KwnexTBfqrs7yqcq5Abup8=;
 b=TRO7gs1oOr5V/yu1hQ+XVn6Md21ZjUEbLZQHwA2IWrYVK/RtesAw8AqbdZDyXwzJnsLW
 qQvmVlUWSfDrWn362MyNW26ZL+1sgPR8kongOw9nwOHou1R8ALJr8/tyUg8c7xiR4Nrw
 EHo97y9SM6Qi+Cjt2Zxg9072+k09H1kTiLl1086GE7R6jTDvo6n6kCHD3ea/At8azyzV
 rhwy82cDzx+xYq4N3gImyuHrXBfEWC8iSFapllBmCkl2u2p5BuE+hPQsuWiOw6Hcb80O
 aP0WrVb9F70xMLx8Axcet1oHqgp0juj2ioyXlr+4zxmNBswFOtbbOjBHnnO50emAVMBl DQ== 
Subject: Re: [PATCH v3 3/5] x86/xen: Add xen_no_vector_callback option to test
 PCI INTX delivery
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20210106153958.584169-1-dwmw2@infradead.org>
 <20210106153958.584169-4-dwmw2@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <bb657cd7-69e7-8837-830e-7bd8df4b94c8@oracle.com>
Date: Wed, 6 Jan 2021 10:51:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106153958.584169-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060097


On 1/6/21 10:39 AM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> It's useful to be able to test non-vector event channel delivery, to make
> sure Linux will work properly on older Xen which doesn't have it.
>
> It's also useful for those working on Xen and Xen-compatible hypervisors,
> because there are guest kernels still in active use which use PCI INTX
> even when vector delivery is available.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



