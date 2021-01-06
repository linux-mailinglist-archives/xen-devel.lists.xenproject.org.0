Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E275D2EBFCD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 15:47:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62513.110759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxA5i-00073a-9e; Wed, 06 Jan 2021 14:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62513.110759; Wed, 06 Jan 2021 14:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxA5i-00073B-6B; Wed, 06 Jan 2021 14:47:14 +0000
Received: by outflank-mailman (input) for mailman id 62513;
 Wed, 06 Jan 2021 14:47:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OkmI=GJ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxA5g-000736-Id
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 14:47:12 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9469f8a-2377-40ef-b281-05a43a65a57b;
 Wed, 06 Jan 2021 14:47:11 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106EdhSm125034;
 Wed, 6 Jan 2021 14:47:00 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 35wbue8t9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 14:47:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106EePKO173746;
 Wed, 6 Jan 2021 14:47:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 35w3qs3n9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 14:46:59 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 106EkuZn015207;
 Wed, 6 Jan 2021 14:46:57 GMT
Received: from [10.39.201.28] (/10.39.201.28)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Jan 2021 06:46:56 -0800
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
X-Inumbo-ID: f9469f8a-2377-40ef-b281-05a43a65a57b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=YAefegOxVmedhtb7d2FefXHdga66lJO2KCM1bJs4cnU=;
 b=wsgbtDgBRzDgF37gEjFdxesJjvoxccHLWeXbUyB0iBEVmHX7+zzam4RospWdCJDxOner
 3n5h0MjNFOYPwrdCNBZjkxsqsahWNjVULQPH9lkOcTG66Lx53xuOaPrh+f5a2yra7Utt
 2+6Rj1QnjrE7e8GZzz0uTrhgcSrcGO5Ugh8T+IGCzBefAzvMguGYgzsQNUNHQtlscwms
 wV9lLrl5htnLn3u6ypuDrsAv+g8X3Cj9dBBRdKdA3CTHBZx7qBzrTtQ//StSilXp+w8E
 Kv6dn9VMhon6t1WGgr0nOrabJEkNWyoqAqRvur0tSpScCiWYRORQPR4r3ldc8fo6h11V vA== 
Subject: Re: [PATCH v2 3/5] x86/xen: Add a no_vector_callback option to test
 PCI INTX delivery
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20210105235736.326797-1-dwmw2@infradead.org>
 <20210105235736.326797-4-dwmw2@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <cd84d381-c3a5-9a7f-6b14-03f3424bf091@oracle.com>
Date: Wed, 6 Jan 2021 09:46:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105235736.326797-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060092


On 1/5/21 6:57 PM, David Woodhouse wrote:
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index c722ec19cd00..35b10982d363 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3389,6 +3389,10 @@
>  
>  	nosync		[HW,M68K] Disables sync negotiation for all devices.
>  
> +	no_vector_callback
> +			[KNL,X86,XEN] Disable the vector callback for Xen
> +			event channel interrupts.


Sorry, I should have noticed this before --- I think this needs to be prefixed with "xen_". I know it's pretty long but otherwise this will be the first Xen-only option without such prefix (or without "xen." module). We already have a bunch of long names for Xen so it won't necessarily stick out.


-boris


