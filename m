Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3AA70A5D8
	for <lists+xen-devel@lfdr.de>; Sat, 20 May 2023 08:02:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537224.836538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0Ffb-0002SW-KR; Sat, 20 May 2023 06:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537224.836538; Sat, 20 May 2023 06:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0Ffb-0002Hu-B2; Sat, 20 May 2023 06:02:23 +0000
Received: by outflank-mailman (input) for mailman id 537224;
 Fri, 19 May 2023 17:46:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+OQ=BI=quicinc.com=quic_jhugo@srs-se1.protection.inumbo.net>)
 id 1q04B7-0005Ax-Dp
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 17:46:09 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0772ecf6-f66d-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 19:46:06 +0200 (CEST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34JFMfDd012512; Fri, 19 May 2023 17:45:03 GMT
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qp95v0w04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 17:45:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JHj1wR008027
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 17:45:01 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 19 May
 2023 10:44:59 -0700
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
X-Inumbo-ID: 0772ecf6-f66d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eudHzY6WP7JinnfOr70AykPZvSkkpEMxuNg8hMfppYo=;
 b=DMV0U+nIXEVCY+aepXRfFYvdfBeVO+N4QF0je1NreoKWWMhdhmNCmkCFY69GHp3G1MUl
 W4uLhQQIfJlWzCmL2UlwpB67SLBLlnvd3eaMcPBXY3xpzTd4DPesNiwRSj6AMqZBspVo
 08MDwx36HiK4jQA4XpyJQxV1CWo2sx0aEh71PEANzSjVcRsNE8URDp/9OH/+p2Kh4/Bd
 u8dY8/MWw20kSLCJ06My3a975QQQC9ySq7nhEqEvzzuIHXWUfJmJ+Gzj0a0CNBUiRPUE
 dcRr1k8AfSKrqIM3q0pDGScz3hGnOYsEF+bviVQ6TCuLFhAIK7GTUA+1LUQeisPdvBFr pg== 
Message-ID: <ebe36911-024a-839c-3b7e-05c99bfb0d66@quicinc.com>
Date: Fri, 19 May 2023 11:44:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [patch V4 36/37] x86/smpboot: Support parallel startup of
 secondary CPUs
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        David Woodhouse
	<dwmw2@infradead.org>
CC: <x86@kernel.org>, Brian Gerst <brgerst@gmail.com>,
        Arjan van de Veen
	<arjan@linux.intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul McKenney
	<paulmck@kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Sean
 Christopherson <seanjc@google.com>,
        Oleksandr Natalenko
	<oleksandr@natalenko.name>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        "Guilherme
 G. Piccoli" <gpiccoli@igalia.com>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>,
        Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>,
        Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
        <xen-devel@lists.xenproject.org>, Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren
	<guoren@kernel.org>,
        <linux-csky@vger.kernel.org>,
        Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>,
        <linux-mips@vger.kernel.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller
	<deller@gmx.de>, <linux-parisc@vger.kernel.org>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sabin
 Rapan <sabrapan@amazon.com>,
        "Michael Kelley (LINUX)"
	<mikelley@microsoft.com>,
        Ross Philipson <ross.philipson@oracle.com>,
        David
 Woodhouse <dwmw@amazon.co.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230512205257.411554373@linutronix.de>
 <16562305-3bc0-c69f-0cb5-1b9da1014f19@quicinc.com>
 <0cafbfcb-2430-6d90-ee77-4e5de08ee1da@citrix.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <0cafbfcb-2430-6d90-ee77-4e5de08ee1da@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wzgfaxTFUND7jtAhGx51l9t9Ic-_fDjs
X-Proofpoint-GUID: wzgfaxTFUND7jtAhGx51l9t9Ic-_fDjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_12,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190152

On 5/19/2023 10:57 AM, Andrew Cooper wrote:
> On 19/05/2023 5:28 pm, Jeffrey Hugo wrote:
>>    DESCEND objtool
>>    INSTALL libsubcmd_headers
>>    CALL    scripts/checksyscalls.sh
>>    AS      arch/x86/kernel/head_64.o
>> arch/x86/kernel/head_64.S: Assembler messages:
>> arch/x86/kernel/head_64.S:261: Error: missing ')'
>> arch/x86/kernel/head_64.S:261: Error: junk `UL<<10)' after expression
>>    CC      arch/x86/kernel/head64.o
>>    CC      arch/x86/kernel/ebda.o
>>    CC      arch/x86/kernel/platform-quirks.o
>> scripts/Makefile.build:374: recipe for target
>> 'arch/x86/kernel/head_64.o' failed
>> make[3]: *** [arch/x86/kernel/head_64.o] Error 1
>> make[3]: *** Waiting for unfinished jobs....
>> scripts/Makefile.build:494: recipe for target 'arch/x86/kernel' failed
>> make[2]: *** [arch/x86/kernel] Error 2
>> scripts/Makefile.build:494: recipe for target 'arch/x86' failed
>> make[1]: *** [arch/x86] Error 2
>> make[1]: *** Waiting for unfinished jobs....
>> Makefile:2026: recipe for target '.' failed
>> make: *** [.] Error 2
>>
>> This is with GCC 5.4.0, if it matters.
>>
>> Reverting this change allows the build to move forward, although I
>> also need to revert "x86/smpboot/64: Implement
>> arch_cpuhp_init_parallel_bringup() and enable it" for the build to
>> fully succeed.
>>
>> I'm not familiar with this code, and nothing obvious stands out to me.
>> What can I do to help root cause this?
> 
> Can you try:
> 
> -#define XAPIC_ENABLE    (1UL << 11)
> -#define X2APIC_ENABLE    (1UL << 10)
> +#define XAPIC_ENABLE    BIT(11)
> +#define X2APIC_ENABLE    BIT(10)
> 
> The UL suffix isn't understood by older binutils, and this patch adds
> the first use of these constants in assembly.

Ah, makes sense.

Your suggested change works for me.  No more compile error.

I assume you will be following up with a patch to address this.  Feel 
free to add the following tags as you see fit:

Reported-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

-Jeff

