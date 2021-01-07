Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDB92EE71B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 21:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63123.112074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc7I-0003xm-T6; Thu, 07 Jan 2021 20:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63123.112074; Thu, 07 Jan 2021 20:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc7I-0003xQ-Pv; Thu, 07 Jan 2021 20:42:44 +0000
Received: by outflank-mailman (input) for mailman id 63123;
 Thu, 07 Jan 2021 20:42:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2pyT=GK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxc7H-0003xL-0m
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 20:42:43 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 116d3d72-9517-457c-9b71-60b56e6c3dc6;
 Thu, 07 Jan 2021 20:42:42 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KZ13P103239;
 Thu, 7 Jan 2021 20:42:39 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35wepme859-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 07 Jan 2021 20:42:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KebAG173844;
 Thu, 7 Jan 2021 20:40:38 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 35v4refa13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jan 2021 20:40:38 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 107KeLvw002550;
 Thu, 7 Jan 2021 20:40:21 GMT
Received: from [10.39.201.2] (/10.39.201.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 12:40:21 -0800
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
X-Inumbo-ID: 116d3d72-9517-457c-9b71-60b56e6c3dc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=rnJhBKfF5AKjEF07eGzgTzrJrzlbr0d3S28UPCHjVVk=;
 b=sSGPrUUZ3a/ytiXxt5mntZfBATQqVnURcc56bHsZk9MtjuMuKGbHA9kfnJF6R2O23mYd
 +1ZKUNHoA2dwdbZNi9TqZGxVqS2JDF4N4YN6YM9cHUPCh3bVNq0YrnrGclFX2UhlAyUI
 pNC8xU4li41XqNpaaZ+kQ4vFeiSa/RkoBMRxjsStoT0DKU/6wge4D19VSZtMExjAzn0R
 2gPF32DyE9R8qalk33pnUWU8u6/amROl8GTsN+q65KXKMDEF6hoEE3Uxn16mF0cd3bmX
 KzM3nYWcVLNR9RcqPeJpADRCe+ySC3ul97HzNcIeRPOpVCSAmaYYxAhxArVovt4BnJ6G Ww== 
Subject: Re: [PATCH 0/4] Permit fault-less access to non-emulated MSRs
From: boris.ostrovsky@oracle.com
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com
References: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
Organization: Oracle Corporation
Message-ID: <3859f6ef-41ac-2bc5-b9eb-9d448fe63838@oracle.com>
Date: Thu, 7 Jan 2021 15:40:19 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070120


Apparently I can't spell my own name. Please drop it from CC when responding.


-boris



