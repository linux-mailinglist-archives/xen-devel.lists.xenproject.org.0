Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35172EBFCE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 15:47:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62517.110773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxA65-00079I-JK; Wed, 06 Jan 2021 14:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62517.110773; Wed, 06 Jan 2021 14:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxA65-00078p-Fm; Wed, 06 Jan 2021 14:47:37 +0000
Received: by outflank-mailman (input) for mailman id 62517;
 Wed, 06 Jan 2021 14:47:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OkmI=GJ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxA63-00078h-9N
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 14:47:35 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6157c84b-b591-4746-9866-40a8a062630b;
 Wed, 06 Jan 2021 14:47:34 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106EhOG5065359;
 Wed, 6 Jan 2021 14:47:28 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35wcuxrjay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 14:47:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106EePU3173730;
 Wed, 6 Jan 2021 14:47:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 35w3qs3nm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 14:47:27 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 106ElOoC000811;
 Wed, 6 Jan 2021 14:47:25 GMT
Received: from [10.39.201.28] (/10.39.201.28)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Jan 2021 06:47:24 -0800
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
X-Inumbo-ID: 6157c84b-b591-4746-9866-40a8a062630b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=09+4PDHHrUBOwb9WMk1CfSv3Xz06qXDGUy+PMbt0nhk=;
 b=eyAttSoTi2pUmZY+5YHj1iL9kcAHpNl+Du8GOthwHofX2tJSWNuMYuAsqfELVHzlJYLW
 m/GeCkTjrVYSqFZet2DaxpGfi5TVuU0une4k6TpXJNgX4+Vw6X6/IoTtMrkmIz/GDPMo
 S/N7JAV8jxBr+RlekAtZp61BMKkzbfeIWGSZAqftjxBg16H2jcNU6br+0J7ByxiZydHW
 Ex0hqSW24TsOm6eAkwFiUMy8PFJXI3zvKKzbKcIEv4CeF3oX3BdglSS56wseocPiv6Us
 EsGOoJ0EdT7OgRBuQI4+1QrTxcc6+B7Q2uHcydLnTNTbj94CZQO32eVScTn3Td1j0sj+ xw== 
Subject: Re: [PATCH v2 4/5] x86/xen: Don't register Xen IPIs when they aren't
 going to be used
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20210105235736.326797-1-dwmw2@infradead.org>
 <20210105235736.326797-5-dwmw2@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <c6f946a5-b301-c6e8-8b6c-89e761254514@oracle.com>
Date: Wed, 6 Jan 2021 09:47:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105235736.326797-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101060092


On 1/5/21 6:57 PM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> In the case where xen_have_vector_callback is false, we still register
> the IPI vectors in xen_smp_intr_init() for the secondary CPUs even
> though they aren't going to be used. Stop doing that.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>



Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


