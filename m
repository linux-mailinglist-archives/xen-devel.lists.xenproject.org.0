Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB6170FF9D
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 23:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539221.839879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1vfO-0006V7-G4; Wed, 24 May 2023 21:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539221.839879; Wed, 24 May 2023 21:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1vfO-0006Rq-Cy; Wed, 24 May 2023 21:05:06 +0000
Received: by outflank-mailman (input) for mailman id 539221;
 Wed, 24 May 2023 21:05:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eCI3=BN=quicinc.com=quic_tsoni@srs-se1.protection.inumbo.net>)
 id 1q1vfN-0006Rj-42
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 21:05:05 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a68a492e-fa76-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 23:05:03 +0200 (CEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34OKx7uq018706; Wed, 24 May 2023 21:04:10 GMT
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsqqj89sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 21:04:10 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34OL495t029551
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 21:04:09 GMT
Received: from [10.110.74.38] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 14:04:07 -0700
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
X-Inumbo-ID: a68a492e-fa76-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0IusaswoV4GMJ2krC0g9zaR7+NoenIcA9sZufP1qfbs=;
 b=Pn2tBz5Uml86ZbHPbF67KQqgCh73xR1i5yg3+TTBB9MLfOHQJBgnxJvGEGTnO1sjnbb5
 U3hN6SQPVGqczxdXEc5jZ3BsRuG4v1PjwOlJ+BUwBbaWu+Gb3kIhHgI2dJBJPsyyvDlc
 ARiZPVoxGryM9wKzC1smnDkbMLUTn0aGCjNLX7jJ+uzKz+02TGLf7WIxRqGxPINN1O7b
 H6OfnfxKsUpexRRPsIok/i/FsmrmmJJiNBeLOKhyCebYuCM7GoxBrHUKCD7zLJFN1tYw
 9ScZ+UfUU+jIHpa/GwHnf1SHGoNE2ZSw01qWH55IQJ4A/JSEPQvbLCoS3Id3Q46OwxcM vQ== 
Message-ID: <1e10da25-5704-18ee-b0ce-6de704e6f0e1@quicinc.com>
Date: Wed, 24 May 2023 14:04:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v1 0/9] Hypervisor-Enforced Kernel Integrity
Content-Language: en-US
To: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>,
        Borislav Petkov
	<bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H . Peter Anvin"
	<hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Kees Cook
	<keescook@chromium.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean
 Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>
CC: Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>,
        James Morris <jamorris@linux.microsoft.com>,
        John Andersen
	<john.s.andersen@intel.com>,
        Liran Alon <liran.alon@oracle.com>,
        "Madhavan T
 . Venkataraman" <madvenka@linux.microsoft.com>,
        Marian Rotariu
	<marian.c.rotariu@gmail.com>,
        =?UTF-8?Q?Mihai_Don=c8=9bu?=
	<mdontu@bitdefender.com>,
        =?UTF-8?B?TmljdciZb3IgQ8OuyJt1?=
	<nicu.citu@icloud.com>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Thara
 Gopinath <tgopinath@microsoft.com>,
        Will Deacon <will@kernel.org>,
        Zahra
 Tarkhani <ztarkhani@microsoft.com>,
        =?UTF-8?Q?=c8=98tefan_=c8=98icleru?=
	<ssicleru@bitdefender.com>,
        <dev@lists.cloudhypervisor.org>, <kvm@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>, <linux-hyperv@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-security-module@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <virtualization@lists.linux-foundation.org>, <x86@kernel.org>,
        <xen-devel@lists.xenproject.org>
References: <20230505152046.6575-1-mic@digikod.net>
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20230505152046.6575-1-mic@digikod.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 05vNi3kgc2wfcP2iD9QY9INL0A2A4C1U
X-Proofpoint-ORIG-GUID: 05vNi3kgc2wfcP2iD9QY9INL0A2A4C1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_15,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240176

On 5/5/2023 8:20 AM, Mickaël Salaün wrote:
> Hi,
> 
> This patch series is a proof-of-concept that implements new KVM features
> (extended page tracking, MBEC support, CR pinning) and defines a new API to
> protect guest VMs. No VMM (e.g., Qemu) modification is required.
> 
> The main idea being that kernel self-protection mechanisms should be delegated
> to a more privileged part of the system, hence the hypervisor. It is still the
> role of the guest kernel to request such restrictions according to its

Only for the guest kernel images here? Why not for the host OS kernel? 
Embedded devices w/ Android you have mentioned below supports the host 
OS as well it seems, right?

Do we suggest that all the functionalities should be implemented in the 
Hypervisor (NS-EL2 for ARM) or even at Secure EL like Secure-EL1 (ARM).

I am hoping that whatever we suggest the interface here from the Guest 
to the Hypervisor becomes the ABI right?


> 
> # Current limitations
> 
> The main limitation of this patch series is the statically enforced
> permissions. This is not an issue for kernels without module but this needs to
> be addressed.  Mechanisms that dynamically impact kernel executable memory are
> not handled for now (e.g., kernel modules, tracepoints, eBPF JIT), and such
> code will need to be authenticated.  Because the hypervisor is highly
> privileged and critical to the security of all the VMs, we don't want to
> implement a code authentication mechanism in the hypervisor itself but delegate
> this verification to something much less privileged. We are thinking of two
> ways to solve this: implement this verification in the VMM or spawn a dedicated
> special VM (similar to Windows's VBS). There are pros on cons to each approach:
> complexity, verification code ownership (guest's or VMM's), access to guest
> memory (i.e., confidential computing).

Do you foresee the performance regressions due to lot of tracking here? 
Production kernels do have lot of tracepoints and we use it as feature 
in the GKI kernel for the vendor hooks implementation and in those cases 
every vendor driver is a module. Separate VM further fragments this 
design and delegates more of it to proprietary solutions?

Do you have any performance numbers w/ current RFC?

---Trilok Soni

