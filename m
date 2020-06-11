Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427921F6A26
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 16:36:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjOIw-0006tQ-6l; Thu, 11 Jun 2020 14:35:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7BRw=7Y=linux.ibm.com=stefanb@srs-us1.protection.inumbo.net>)
 id 1jjOGG-0006qG-7c
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 14:32:56 +0000
X-Inumbo-ID: 6f9390de-abf0-11ea-b53b-12813bfff9fa
Received: from mx0a-001b2d01.pphosted.com (unknown [148.163.156.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f9390de-abf0-11ea-b53b-12813bfff9fa;
 Thu, 11 Jun 2020 14:32:54 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05BE67Wv130396; Thu, 11 Jun 2020 10:32:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kp0y8xqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 10:32:52 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05BE66eV130207;
 Thu, 11 Jun 2020 10:32:52 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kp0y8xpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 10:32:52 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05BELHWV003046;
 Thu, 11 Jun 2020 14:32:50 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 31hw1c7gg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 14:32:50 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05BEWoVu20971782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jun 2020 14:32:50 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDCA9112075;
 Thu, 11 Jun 2020 14:32:49 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA126112074;
 Thu, 11 Jun 2020 14:32:49 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 11 Jun 2020 14:32:49 +0000 (GMT)
Subject: Re: Seabios Xen TPM check
To: Jason Andryuk <jandryuk@gmail.com>, seabios@seabios.org
References: <CAKf6xpvu6rMbBpxWUdDZ-W3ZL+6TTNad3tx6bwtieNkhjXeF6w@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <a31e3768-fa0b-de24-0603-31b01b058644@linux.ibm.com>
Date: Thu, 11 Jun 2020 10:32:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKf6xpvu6rMbBpxWUdDZ-W3ZL+6TTNad3tx6bwtieNkhjXeF6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_14:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 cotscore=-2147483648 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110110
X-Mailman-Approved-At: Thu, 11 Jun 2020 14:35:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Quan Xu <quan.xu@intel.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/11/20 8:36 AM, Jason Andryuk wrote:
> Hi,
>
> SeaBIOS commit 67643955c746 (make SeaBios compatible with Xen vTPM.)
> made tpm_start() exit before calling tpm_startup().  The commit
> message has no explanation why this change was made.  Does anyone
> remember why it was made?
>
> The code today means SeaBIOS will not populate PCRs when running on
> Xen.  If I revert the patch, SeaBIOS populates PCRs as one would
> expect.  This is with a QEMU-emulated TPM backed by swtpm in TPM 1.2
> mode (qemu & swtpm running in a linux stubdom).
>
> Any insight is appreciated.

My guess would be that for some reason the TPM 1.2 was already started 
up through other means and didn't need the SeaBIOS tpm_startup() to run.


>
> Thanks,
> Jason



