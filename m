Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D57C25CF2
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 16:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154403.1484424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEqvt-00022g-6W; Fri, 31 Oct 2025 15:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154403.1484424; Fri, 31 Oct 2025 15:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEqvt-00020J-3P; Fri, 31 Oct 2025 15:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1154403;
 Fri, 31 Oct 2025 15:20:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Exqh=5I=unpredictable.fr=mohamed@srs-se1.protection.inumbo.net>)
 id 1vEqvs-00020D-6r
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 15:20:52 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster2-host1-snip4-10.eps.apple.com [57.103.87.141])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c47efb5-b66d-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 16:20:46 +0100 (CET)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-east-2d-10-percent-0 (Postfix) with ESMTPS id
 3ED411800319; Fri, 31 Oct 2025 15:20:42 +0000 (UTC)
Received: from smtpclient.apple (unknown [17.57.155.37])
 by p00-icloudmta-asmtp-us-east-2d-10-percent-0 (Postfix) with ESMTPSA id
 19502180260E; Fri, 31 Oct 2025 15:17:46 +0000 (UTC)
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
X-Inumbo-ID: 2c47efb5-b66d-11f0-980a-7dc792cee155
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unpredictable.fr; s=sig1; bh=4U4IkgvelaoANo0vVatFRIc9fsW3H0HhVuJHKNrEyzw=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=O/2cVbA7jsyQd7NX6sayImQYecJ7QQ5gtnVf0wff009DcwVIKBTb9blwtamSIAdZ/+ck3BEidk+XWYcuf3QFzIZvMX1xd9rXS83R2LUkOTgZ7L9Dyy9lfI54Wy3vh1Uz1+dOrIKtjGlrmxi09Z/J4IXiEtQE3Ox0ZIOHKFVxgwP3EEreqs2zw5v7aw7HoAyaIzdD931Efq1hkaU+M4OUNqP7QX8Oy5Cmjeh8k8lCLzq/xSsTe1BNaI0PW0kDypdJIOOJ69tNH0PSuUDFKBnQgD6uMWB/iGWDA1KONZ0Gl4xtG08rUMStXqHz4IFfToRMdKcBWLxFkudCkjAyVM7IyQ==
mail-alias-created-date: 1752046281608
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: Limitations for Running Xen on KVM Arm64
From: Mohamed Mediouni <mohamed@unpredictable.fr>
In-Reply-To: <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
Date: Fri, 31 Oct 2025 16:17:33 +0100
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <98397590-7C1A-4BBB-9155-A64DDA86795F@unpredictable.fr>
References: <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
To: haseeb.ashraf@siemens.com
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzOCBTYWx0ZWRfXyhQvzzUKCDnR
 p/JVWGGoglzA3rPe7NiKddJPtZg6h+2iIQQnwwAH/UHXaa4CTiHS44ti0/uz1JjJkH4qMgOETfs
 IoE6H9jqforCZCMeFejDvqhyp0JrDGshViIvmCTnzrafaMpBNpoqhrMFUNY55mj0VY1E6nq4oIB
 k1bsEnx06f7FWmIqKE/enTfqj1/t2F5kdvYZbsBZ60ryzCmHKSCcbhobyC/c8X9swgpMaXNw2dw
 tcJlU0fel7xEO0uDD96DFdEjE6s+Th5EKTengwVITOZnh83eCgQWRU5RxLLCS/RkByQe8NuEk=
X-Proofpoint-GUID: 6jU94ztNDbEwwl4Tk8WhCZKlft8P5iQO
X-Proofpoint-ORIG-GUID: 6jU94ztNDbEwwl4Tk8WhCZKlft8P5iQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1030 spamscore=0
 bulkscore=0 phishscore=0 mlxlogscore=561 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2510310138
X-JNJ: AAAAAAABWtm5mvPRkmWOg96QxezQaVEV3+lK2+EUsNNdtu4b6KZXUx/+FGIacE0jstlsHx9FOw1UkNIHYm9/L5tBMo6f7yvR1vmniwuLgcweo8n7BaODoOXrjI+dq8XLb4e5z+SFxBN5Bhv1OxWeR/0Ru1/yzTvOVW8l0Un++AxGU3tGY2bGwcQ0kop472KCCIQYQfRMaiAcg3qRRFdSyv9MJbAtHz6NuSZ+4+22awPqHKw3aSaRow7Tw53v5HO/fpiOD+ErhKdFiPnQkWxO3hVSMYppqLxsY8JiCe13EdYtf4jnWZl2YSk84jm+W0N9v3bLI1QCRVaSHN8h9HhYnycthYlNa/aaoM67yfBRS1G2rJ+5Dr78CM934TBQ+U1CnXkZoXhiWUDPEQPaIa9rGfsv6eyQLRi6yOQsTAWz2Ncin/Kn/+zbHYJ6NQONtTgnMqE3vFIUtOA+IviisOo653LRcWHcSDCG8jZmbrTMkLPtbxHCJrQRN8uNnXEM2Ot4kI0ipZ8j9QJYMNwo4MJQWcvEnmYWjcduVf+JpWcUPGp2WQDlupCfJXNCPMyCL84WWVWmRaybIYOVumSO1Xhy+xgm5KXa47g=



> On 30. Oct 2025, at 07:12, haseeb.ashraf@siemens.com wrote:
>=20
>     =E2=80=A2 This can be optimized by either introducing a batch =
version of this hypercall i.e., XENMEM_remove_from_physmap_batch and =
flushing TLBs only once for all pages being removed
> OR
> by using a TLBI instruction that only invalidates the intended range =
of addresses instead of the whole stage-1 and stage-2 translations. I =
understand that a single TLBI instruction does not exist that can =
perform both stage-1 and stage-2 invalidations for a given address range =
but maybe a combination of instructions can be used such as:
> ; switch to current VMID
> tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by guest VA for =
current VMID
> tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB by IPA range =
for current VMID
> dsb ish
> isb
> ; switch back the VMID
>     =E2=80=A2 This is where I am not quite sure and I was hoping that =
if someone with Arm expertise could sign off on this so that I can work =
on its implementation in Xen. This will be an optimization not only for =
virtualized hardware but also in general for Xen on arm64 machines.


There=E2=80=99s no visibility on what=E2=80=99s going on at stage-1. We =
don=E2=80=99t know the guest VAs that map to the given IPA so doing the =
full stage-1 TLB flush is the only option if FEAT_nTLBPA isn=E2=80=99t =
present (and FEAT_nTLBPA is not present on Neoverse V2).

If FEAT_nTLBPA is present (such as Neoverse V3), then you don=E2=80=99t =
need the stage-1 TLB invalidate in this code path.

> So, on older architectures, full stage-2 invalidation would be =
required. For an architecture independent solution, creating a batch =
version seems to be a better way.

Might as well have both, although the range invalidate for stage-2 is =
most likely enough to resolve performance issues in your case.


