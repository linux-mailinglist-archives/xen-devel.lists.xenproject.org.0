Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A633E4A59
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 18:53:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164407.301673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD8WM-0006Z7-Kz; Mon, 09 Aug 2021 16:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164407.301673; Mon, 09 Aug 2021 16:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD8WM-0006Nl-Fj; Mon, 09 Aug 2021 16:53:02 +0000
Received: by outflank-mailman (input) for mailman id 164407;
 Thu, 05 Aug 2021 15:11:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UwlS=M4=linux.ibm.com=ajd@srs-us1.protection.inumbo.net>)
 id 1mBf1X-00010d-Ap
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 15:11:07 +0000
Received: from mx0a-001b2d01.pphosted.com (unknown [148.163.156.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2846347d-f795-46ad-89fa-ca7c3a698849;
 Thu, 05 Aug 2021 15:11:04 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175F4EmC005933; Thu, 5 Aug 2021 11:09:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a88599e9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 11:09:52 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175F4lkt007894;
 Thu, 5 Aug 2021 11:09:51 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a88599e7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 11:09:51 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175F8XUx021505;
 Thu, 5 Aug 2021 15:09:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3a4wsj27yx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 15:09:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 175F9iFG49348978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 15:09:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC867421F2;
 Thu,  5 Aug 2021 15:09:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6879D421D7;
 Thu,  5 Aug 2021 15:09:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 15:09:44 +0000 (GMT)
Received: from [9.206.171.115] (unknown [9.206.171.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D69DE600B2;
 Fri,  6 Aug 2021 01:09:19 +1000 (AEST)
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
X-Inumbo-ID: 2846347d-f795-46ad-89fa-ca7c3a698849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PYHeUHL0ZH8GoGa/stFMWsqDkOKMwYpeVYQU+PRHDys=;
 b=kWCQrWA8FO5KjMsKJYhTjzMslbexR3lrUnigXsdYDtzPndt3N6OUvoEdkVx9002xs7lj
 0Agjq9pZ+7AHBWChrwjltOA5lzXp4B5IF3Ghn4zNbly1JArc+EARvIUVX8FL+8qEMZJ7
 A8Db7/fGPv9ocXDf3uZwSmBFRyPaCA1UYaWMB5VML1ZmzhbOU9ZkeGYNFxm7hwmmrQdO
 OjeQWLkTR1qVQzb3vbrghmADqt0LrDt+b3ardW94BLZUQODxLYQvY1hqylCDIzHc6qoD
 UXsjpxAIhvrAtuRnuQwMMzpTl5+36Prhqr6y6VaWwVWHT3/2j4xQ1zzlsCjkbkNQpJdx 1w== 
Subject: Re: [PATCH v2 5/6] PCI: Adapt all code locations to not use struct
 pci_dev::driver directly
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-pci@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, Russell Currey <ruscur@russell.cc>,
        "Oliver O'Halloran" <oohall@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu
 <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
        Sathya Prakash <sathya.prakash@broadcom.com>,
        Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
        Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
        Frederic Barrat <fbarrat@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Yisen Zhuang <yisen.zhuang@huawei.com>,
        Salil Mehta
 <salil.mehta@huawei.com>,
        Jakub Kicinski <kuba@kernel.org>, Vadym Kochan <vkochan@marvell.com>,
        Taras Chornyi <tchornyi@marvell.com>, Jiri Pirko <jiri@nvidia.com>,
        Ido Schimmel <idosch@nvidia.com>,
        Simon Horman <simon.horman@corigine.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross
 <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Michael Buesch <m@bues.ch>, Mathias Nyman <mathias.nyman@intel.com>,
        Fiona Trahe <fiona.trahe@intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Wojciech Ziemba <wojciech.ziemba@intel.com>,
        Alexander Duyck <alexanderduyck@fb.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-crypto@vger.kernel.org,
        qat-linux@intel.com, MPT-FusionLinux.pdl@broadcom.com,
        linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
        oss-drivers@corigine.com, xen-devel@lists.xenproject.org,
        linux-usb@vger.kernel.org
References: <20210803100150.1543597-1-u.kleine-koenig@pengutronix.de>
 <20210803100150.1543597-6-u.kleine-koenig@pengutronix.de>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <4b8d26d5-443c-600f-78a9-de5214c80452@linux.ibm.com>
Date: Fri, 6 Aug 2021 01:09:08 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803100150.1543597-6-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SKWjp6RCFUPhal8PxWyzHfD-QFMwM8HG
X-Proofpoint-ORIG-GUID: V9rEFGa5BbjLQbM1Nl6jGEVpBSAwreDP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-05_05:2021-08-05,2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 adultscore=0 impostorscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108050092

On 3/8/21 8:01 pm, Uwe Kleine-König wrote:
> This prepares removing the driver member of struct pci_dev which holds the
> same information than struct pci_dev::dev->driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

cxl hunks look alright.

Acked-by: Andrew Donnellan <ajd@linux.ibm.com> # cxl

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

