Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8715A2DD693
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 18:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56075.97894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpxPE-0001gQ-Sw; Thu, 17 Dec 2020 17:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56075.97894; Thu, 17 Dec 2020 17:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpxPE-0001g1-PV; Thu, 17 Dec 2020 17:49:36 +0000
Received: by outflank-mailman (input) for mailman id 56075;
 Thu, 17 Dec 2020 17:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHkA=FV=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kpxPC-0001fw-Dj
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 17:49:34 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aef84541-a856-4e21-92e5-ac96e50afeb0;
 Thu, 17 Dec 2020 17:49:33 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHHiMec172221;
 Thu, 17 Dec 2020 17:49:29 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 35cn9rppav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Dec 2020 17:49:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHHjKjx174922;
 Thu, 17 Dec 2020 17:49:28 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 35d7er7q8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 17:49:28 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BHHnR5m005112;
 Thu, 17 Dec 2020 17:49:27 GMT
Received: from [10.39.250.121] (/10.39.250.121)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 09:49:27 -0800
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
X-Inumbo-ID: aef84541-a856-4e21-92e5-ac96e50afeb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=YbAHKLgMgETX0KzOa8PyAW+RsrrKIcquYoJvCL3P3vU=;
 b=ayT7jH0qYKhDJfv+NyxbbBbVB4biv5ZybKiAILSwpUUGrnMWpK9JrcQaT0eMqPpfprDg
 1wxY6c8JpacvTKg6iWYe1gsphxkMFV+sbS0ZgJmgIJE7tIGS6xJzNk6hAxXOoRjir3Kf
 R4rJ8HfkVpzP3r6rzdPO4qe9mCUTCZ3vi/kQecBQap52xMkDmUZza5nfmQsb427m3VOV
 /CtIf+Kg+HpQipoMrzFoP/TkCa6m/OcYmk+yjLHvp2ERUlVu3F9ML9nSM0Nqcuoi/WMK
 Sj7k7ZVIF8U7dngmbiz1qltMNK2axaIsMue/Mbtl5I7P7wTmwPaCMraJgz7GwDIUSj5E ow== 
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Cheyenne Wills <cheyenne.wills@gmail.com>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
 <4fc3532b-f53f-2a15-ce64-f857816b0566@oracle.com>
 <f4ff3d16-40f6-e8a1-fcdd-ca52e1f52ca6@suse.com>
 <c90622c4-f9e0-8b6d-ab46-bba0cbfc0fd9@oracle.com>
 <0430337a-6fcd-9471-4455-838390401220@citrix.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <c6e05b63-b066-9bd0-9da1-1fc089cd1aea@oracle.com>
Date: Thu, 17 Dec 2020 12:49:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <0430337a-6fcd-9471-4455-838390401220@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170122


On 12/17/20 11:46 AM, Andrew Cooper wrote:
> On 17/12/2020 16:25, boris.ostrovsky@oracle.com wrote:
>> On 12/17/20 2:40 AM, Jan Beulich wrote:
>>> On 17.12.2020 02:51, boris.ostrovsky@oracle.com wrote:
>>> I think this is acceptable as a workaround, albeit we may want to
>>> consider further restricting this (at least on staging), like e.g.
>>> requiring a guest config setting to enable the workaround. 
>> Maybe, but then someone migrating from a stable release to 4.15 will have to modify guest configuration.
>>
>>
>>> But
>>> maybe this will need to be part of the MSR policy for the domain
>>> instead, down the road. We'll definitely want Andrew's view here.
>>>
>>> Speaking of staging - before applying anything to the stable
>>> branches, I think we want to have this addressed on the main
>>> branch. I can't see how Solaris would work there.
>> Indeed it won't. I'll need to do that as well (I misinterpreted the statement in the XSA about only 4.14- being vulnerable)
> It's hopefully obvious now why we suddenly finished the "lets turn all
> unknown MSRs to #GP" work at the point that we did (after dithering on
> the point for several years).
>
> To put it bluntly, default MSR readability was not a clever decision at all.
>
> There is a large risk that there is a similar vulnerability elsewhere,
> given how poorly documented the MSRs are (and one contemporary CPU I've
> got the manual open for has more than 6000 *documented* MSRs).  We did
> debate for a while whether the readability of the PPIN MSRs was a
> vulnerability or not, before eventually deciding not.

> Irrespective of what we do to fix this in Xen, has anyone fixed Solaris yet?


I am not aware of anyone working on this (not that I would be).


-boris


