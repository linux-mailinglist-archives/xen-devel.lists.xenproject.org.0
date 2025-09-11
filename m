Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19072B531BE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 14:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120141.1465207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwg5V-0005xJ-6D; Thu, 11 Sep 2025 12:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120141.1465207; Thu, 11 Sep 2025 12:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwg5V-0005va-3T; Thu, 11 Sep 2025 12:07:41 +0000
Received: by outflank-mailman (input) for mailman id 1120141;
 Thu, 11 Sep 2025 12:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIEk=3W=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1uwg5T-0005vU-88
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 12:07:39 +0000
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7f8a992-8f07-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 14:07:38 +0200 (CEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B84fHU032047;
 Thu, 11 Sep 2025 12:06:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cffmge8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Sep 2025 12:06:56 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58BButst022969;
 Thu, 11 Sep 2025 12:06:55 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cffmge1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Sep 2025 12:06:55 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58B99ZNi011435;
 Thu, 11 Sep 2025 12:06:54 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 490y9unx8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Sep 2025 12:06:54 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 58BC6qp621103260
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Sep 2025 12:06:52 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 592C42004B;
 Thu, 11 Sep 2025 12:06:52 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95E1D20040;
 Thu, 11 Sep 2025 12:06:51 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.155.204.135])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 11 Sep 2025 12:06:51 +0000 (GMT)
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
X-Inumbo-ID: e7f8a992-8f07-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=c30ZQnsvAEyuVkRVamQoGQaRen0nYI
	Ra+BA7jFqu78U=; b=k8qq71z07GrReGd9S9mOiL2kfz2BW5pit9iGHWyQ501+3o
	18SrSVgXyKIh3fgbTocFTOqLMtqSFK4cxX7BIxE3tS22XZO0MuuzR1offUBCNMnq
	oKDIaYOBM6OqV/8/2nb5TYMMtbfty7TIxuJR1UwI7ijudG7hBz2n8mEO1/1JtIWQ
	dCG50x7Is5mNMQX/2OgEzJRaOS4B3WAK5BbVoavZQgJ0vMUStU+M4xrwJU761IBV
	72RsuHX8BmU9AXx/ZC8PQ4TAp5bfKtZi3PWfc0gEnh3wsk+FWngrjfyj6wXqFlUw
	ta9dp/wt1kSFBm9tnzdcdwRJffzZgn8TZgXdZhNg==
Date: Thu, 11 Sep 2025 14:06:50 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        Mark Rutland <Mark.Rutland@arm.com>
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <80be36e5-d6e1-4b37-a1ca-47e92ac21b02-agordeev@linux.ibm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <b2e52967-7ca1-411e-9c66-8d3483624ca7-agordeev@linux.ibm.com>
 <250835cd-f07a-4b8a-bc01-ace24b407efc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <250835cd-f07a-4b8a-bc01-ace24b407efc@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EOlye06iv3wrpFZ8EV5hsz2FcaKHpkNR
X-Proofpoint-GUID: 51K6fRL5QpJCzFIQhT_Qazz7bChQjXpl
X-Authority-Analysis: v=2.4 cv=EYDIQOmC c=1 sm=1 tr=0 ts=68c2bb60 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=jRhVRVM2bwpbWWX_RR8A:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMCBTYWx0ZWRfX8pGJfFgtntNW
 /kOIUEwDJMICGimD1/ufjSKSVIfmo3TNK7+Fxsinl9Egq+oGXoolAwIU93iuesvkQ3s13VVlzhh
 JIgGdj6U9PokjpkHg4ykDpABkraxfLb3HERwg3941FM1HXB2esU2ebixaknpbywBxWh5hGHimsp
 ci9R67AshxoJpy340lLj5ssEfi6eKhyjCh5p8fZq/k83GFNAv5ZYjhl/Hqc7I+sNgjVlWR40LHM
 kZLurS1M60tPSFVJMaBaPvAXWRbQAESVilgI8Vf2JWna8t2s571X/x3Ahb2bFBInNwL1PkLtgz0
 aizOmw9YsKcqSGhvZ6E05+Xu1Xlt46nNfGetQx37HOL9xVINKsAa7u5yRb/jAsXOIQWyZmkfM1v
 9y5BFajA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060020

On Wed, Sep 10, 2025 at 06:11:54PM +0200, Kevin Brodsky wrote:

Hi Kevin,

> On 09/09/2025 16:38, Alexander Gordeev wrote:
> >>>>> Would that integrate well with LAZY_MMU_DEFAULT etc?
> >>>> Hmm... I though the idea is to use LAZY_MMU_* by architectures that
> >>>> want to use it - at least that is how I read the description above.
> >>>>
> >>>> It is only kasan_populate|depopulate_vmalloc_pte() in generic code
> >>>> that do not follow this pattern, and it looks as a problem to me.
> >> This discussion also made me realise that this is problematic, as the
> >> LAZY_MMU_{DEFAULT,NESTED} macros were meant only for architectures'
> >> convenience, not for generic code (where lazy_mmu_state_t should ideally
> >> be an opaque type as mentioned above). It almost feels like the kasan
> >> case deserves a different API, because this is not how enter() and
> >> leave() are meant to be used. This would mean quite a bit of churn
> >> though, so maybe just introduce another arch-defined value to pass to
> >> leave() for such a situation - for instance,
> >> arch_leave_lazy_mmu_mode(LAZY_MMU_FLUSH)?
> > What about to adjust the semantics of apply_to_page_range() instead?
> >
> > It currently assumes any caller is fine with apply_to_pte_range() to
> > enter the lazy mode. By contrast, kasan_(de)populate_vmalloc_pte() are
> > not fine at all and must leave the lazy mode. That literally suggests
> > the original assumption is incorrect.
> >
> > We could change int apply_to_pte_range(..., bool create, ...) to e.g.
> > apply_to_pte_range(..., unsigned int flags, ...) and introduce a flag
> > that simply skips entering the lazy mmu mode.
> 
> This is pretty much what Ryan proposed [1r] some time ago, although for
> a different purpose (avoiding nesting). There wasn't much appetite for
> it then, but I agree that this would be a more logical way to go about it.
> 
> - Kevin
> 
> [1r]
> https://lore.kernel.org/all/20250530140446.2387131-4-ryan.roberts@arm.com/

May be I missing the point, but I read it as an opposition to the whole
series in general and to the way apply_to_pte_range() would be altered
in particular:

 static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 				     unsigned long addr, unsigned long end,
 				     pte_fn_t fn, void *data, bool create,
-				     pgtbl_mod_mask *mask)
+				     pgtbl_mod_mask *mask, bool lazy_mmu)

The idea of instructing apply_to_page_range() to skip the lazy mmu mode
was not countered. Quite opposite, Liam suggested exactly the same:

<quote>
Could we do something like the pgtbl_mod_mask or zap_details and pass
through a struct or one unsigned int for create and lazy_mmu?

These wrappers are terrible for readability and annoying for argument
lists too.

Could we do something like the pgtbl_mod_mask or zap_details and pass
through a struct or one unsigned int for create and lazy_mmu?

At least we'd have better self-documenting code in the wrappers.. and if
we ever need a third boolean, we could avoid multiplying the wrappers
again.
<quote>

Thanks!

