Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31AA9D0B36
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 09:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839116.1254933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxRx-0005Rp-Nc; Mon, 18 Nov 2024 08:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839116.1254933; Mon, 18 Nov 2024 08:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxRx-0005K7-GK; Mon, 18 Nov 2024 08:49:37 +0000
Received: by outflank-mailman (input) for mailman id 839116;
 Mon, 18 Nov 2024 08:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LbT5=SN=bounce.vates.tech=bounce-md_30504962.673aff99.v1-f79108cbb7fe484e862e7fcb365ac070@srs-se1.protection.inumbo.net>)
 id 1tCxRv-0005D3-Nj
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 08:49:35 +0000
Received: from mail136-26.atl41.mandrillapp.com
 (mail136-26.atl41.mandrillapp.com [198.2.136.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 063f63c6-a58a-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 09:49:30 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-26.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XsLsP1Yf1zJKF3ZX
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 08:49:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f79108cbb7fe484e862e7fcb365ac070; Mon, 18 Nov 2024 08:49:29 +0000
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
X-Inumbo-ID: 063f63c6-a58a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNi4yNiIsImhlbG8iOiJtYWlsMTM2LTI2LmF0bDQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjA2M2Y2M2M2LWE1OGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTE5NzcwLjk3MTMzNywic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2FmZjk5LnYxLWY3OTEwOGNiYjdmZTQ4NGU4NjJlN2ZjYjM2NWFjMDcwQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731919769; x=1732180269;
	bh=X7pAjJkg7RR9F2RG6GXKRb5z5KA6bPQawpOfGyb4kXo=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=vSvtLWmPJ7UfPQnS89TK3gdLWUtf8OgiElwcy5X9SdJ/Hwg72K/J5gz4zXQb4cwRi
	 N4Y6pUG/jua1stHN5nzyj+M0lCiTlyA7u87At2xtTlQJOahJHnH0HEpJaI2ooGlH+6
	 K3CEOn42vywIlFOm8i2jSkS5cKVHxMg5B39rCHGDNGWJ9GqeD9lvwz74HNp3LVa9+U
	 +a3yVxwgjHGQtKXPt5CuV+qZU2fn4KUD7FS9Zhec0/PceYpLyKgSpCVQ6+MI7fRorn
	 wL172JDrcRyA4nhHfZy87QxpqVyYmhLKk6H7T/DQKzhyb5+5DttsiNnozAMoglSMSl
	 H0Lu2bisFRsWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731919769; x=1732180269; i=ngoc-tu.dinh@vates.tech;
	bh=X7pAjJkg7RR9F2RG6GXKRb5z5KA6bPQawpOfGyb4kXo=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Q1XJg+dciNrjdkoRlczRZ5l1Ae1mgBY+VrMZjoj5tw9MCoqUPs2qb11GFJ7hyjTi4
	 sNZ/KwcXBlAbmxuNCRi/ugW2bZP+4hB63mfDBFPfzRF70lChr3qhDtIBbudj/WsYX5
	 +6Ghod2sI01CwojBnetWlF+NXV0N5v2XgouvkeaMxD/01laeqp7sbtwqyOxoMYryfm
	 8BS7cB/0M9hlYYXrQuQN6Ga4mglcCMgnw+f41TydlISEGToX9hHwWoGeUHY4ADvK8l
	 KaGq+mDCwZ4TbJC4jHoybaHKsiXByKk3SwhEi/Gmra286eM6lahuG73WlvI8U4WQ4s
	 kKysXBQ4ZMKvA==
From: ngoc-tu.dinh@vates.tech
Subject: =?utf-8?Q?[PATCH=200/4]=20Virtualize=20architectural=20LBRs?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731919768412
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Message-Id: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f79108cbb7fe484e862e7fcb365ac070?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241118:md
Date: Mon, 18 Nov 2024 08:49:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Tu Dinh <ngoc-tu.dinh@vates.tech>

Intel model-specific last branch records (LBRs) were replaced by
architectural LBRs (see Chapter 20 of Intel SDM volume 3B). This
patchset implements virtual LBRs for HVM guests using Intel's "load
guest IA32_LBR_CTL" and "clear IA32_LBR_CTL" VMX controls.

Add the necessary CPUID and VMX feature checks into Xen. Note that in
this patchset, MSR_IA32_LASTBRANCH_DEPTH is only allowed to be equal to
that of the host's.

Tu Dinh (4):
  x86: Add Intel architectural LBR featureset bits
  x86: Add architectural LBR declarations
  x86: Adjust arch LBR CPU policy
  x86/vmx: Virtualize architectural LBRs

 tools/libs/guest/xg_cpuid_x86.c             |   2 +-
 tools/misc/xen-cpuid.c                      |   3 +
 xen/arch/x86/cpu-policy.c                   |  39 +++
 xen/arch/x86/cpu/common.c                   |   7 +
 xen/arch/x86/hvm/vmx/vmcs.c                 |  11 +-
 xen/arch/x86/hvm/vmx/vmx.c                  | 269 ++++++++++++++------
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h     |   8 +
 xen/arch/x86/include/asm/msr-index.h        |  11 +
 xen/include/public/arch-x86/cpufeatureset.h |  28 +-
 xen/include/xen/lib/x86/cpu-policy.h        |  38 ++-
 xen/lib/x86/cpuid.c                         |   6 +
 11 files changed, 339 insertions(+), 83 deletions(-)

-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

