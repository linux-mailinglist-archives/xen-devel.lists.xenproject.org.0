Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0F4B134D3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 08:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061037.1426569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugHAh-0001uL-V7; Mon, 28 Jul 2025 06:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061037.1426569; Mon, 28 Jul 2025 06:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugHAh-0001su-SF; Mon, 28 Jul 2025 06:17:15 +0000
Received: by outflank-mailman (input) for mailman id 1061037;
 Mon, 28 Jul 2025 06:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ENqu=2J=alex0.net=me@srs-se1.protection.inumbo.net>)
 id 1ugHAg-0001so-7h
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 06:17:14 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster2-host10-snip4-10.eps.apple.com [57.103.87.231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f5f4b65-6b7a-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 08:17:12 +0200 (CEST)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-9 (Postfix) with ESMTPS id
 C32B6180014F
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:17:09 +0000 (UTC)
Received: from smtpclient.apple (qs-asmtp-me-k8s.p00.prod.me.com
 [17.57.155.37])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-9 (Postfix) with ESMTPSA id
 9DB4A180013E
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:17:08 +0000 (UTC)
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
X-Inumbo-ID: 7f5f4b65-6b7a-11f0-b895-0df219b8e170
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex0.net; s=sig1; bh=EBr2/MNv+1p2yTo/xIEHFFdBfS88z3rf+JJ8TwkwooM=; h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme; b=ATTuQYQSCFoXwoAaPjhf2oF86GjxEeJn0tJd3tMi7tzZVLqugDSyclTjpF7TqQCKMmI8G351cKZruQfejF+aTTq26JJBRH6+9pLusfp/Qur1Gla6QxRb3WmK1JNgwn98x9MuV767nLelflAQCaY7hmJnhbUuqEesddE9QyqfT/M2FfBX4w/2DFHzOS3ohlEQrpAyaa+OGqCdw9ITgyePBU12XbCQRrM9o2gb1c/LEsMgVMQWRy0YdDNyl3mmnjAn6xrDmMSGTRooBKRnV2sMwwa+eTv+QMBs2YtR/iUuVZNRFcb34REtzKn/bAowEyPYMmSMuIx33buhKtViAjSUyA==
X-Client-IP: 185.24.123.146
From: me@alex0.net
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_EDB941DF-6818-4381-B4EF-C0E649DAE668"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: ACPI C3 issues on Meteor Lake with HVMs
Message-Id: <A5CBEBE2-8EBB-4844-BEE5-BACA780EB534@alex0.net>
Date: Mon, 28 Jul 2025 07:16:57 +0100
To: xen-devel@lists.xenproject.org
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA0NiBTYWx0ZWRfX9i9N/lVk39nW
 OSx1NQvQ8NDlMHOan9ylkde1JBSJBOow+YhksNWEKTWFgcwGFyCxwzNhp+4+3kIFBLkO17IA8Po
 t+UH/UArKa5Z/rNjUVfROw21wRG706aUsNDVp+BFbdPqx3+cUqVW+hM4wYwcWWjPvyylBZZpz12
 lXDW07rR6+GycgMUYkgsPVGLBak5m+2WL3ibV0lcfwbxrHUzZ08s/1DKYLQS34O+dgT9qvtNsTg
 o80O83a78S5ND8X7yRmqXKwREw1VBTRyBvLY4EguC3+NsK5UVG3dyxBbMB2vlivAbEBbil7qc=
X-Proofpoint-GUID: x70JbrSuTJgqytpr16QZ5ODR6HqI52LU
X-Proofpoint-ORIG-GUID: x70JbrSuTJgqytpr16QZ5ODR6HqI52LU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2507280046


--Apple-Mail=_EDB941DF-6818-4381-B4EF-C0E649DAE668
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,

Hoping someone smarter than I can help out here =F0=9F=99=82 I have a =
Meteor Lake machine which has the new P/E core architecture. I am trying =
to optimise a mobile platform for on-battery runtime and from the =
documentation I have read this requires CPUs to be in ACPI state C3 =
(which corresponds to platform state C10). Though I=E2=80=99ve enabled =
cpuidle (with the corresponding GRUB parameter) the issue I=E2=80=99m =
having is Xen will never enter C3 on any cores once there are a certain =
number of HVMs running (on my platform it is around 3-4), no matter =
which cores they are pinned to. For example, even if I pin the HVMs (and =
their corresponding device model stubdoms) to the E-cores, the P-cores =
will refuse to enter C3 and display 99.81% residency for C2. This =
happens regardless of the number of vCPUs allocated to the HVMs (I =
tested it with just one allocated) nor the workload (it is very light, =
with barely any CPU time shown).

If I fully pause or shut down the HVMs however, C3 jumps up to a much =
more reasonable residency. I am using sched-credit2 as the scheduler =
with default weight and cap values.

Would appreciate any input.

Best,
Alex


--Apple-Mail=_EDB941DF-6818-4381-B4EF-C0E649DAE668
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;">Hi,<div><br></div><div>Hoping someone smarter than I =
can help out here =F0=9F=99=82 I have a Meteor Lake machine which has =
the new P/E core architecture. I am trying to optimise a mobile platform =
for on-battery runtime and from the documentation I have read this =
requires CPUs to be in ACPI state C3 (which corresponds to platform =
state C10). Though I=E2=80=99ve enabled cpuidle (with the corresponding =
GRUB parameter) the issue I=E2=80=99m having is Xen will never enter C3 =
on any cores once there are a certain number of HVMs running (on my =
platform it is around 3-4), no matter which cores they are pinned to. =
For example, even if I pin the HVMs (and their corresponding device =
model stubdoms) to the E-cores, the P-cores will refuse to enter C3 and =
display 99.81% residency for C2. This happens regardless of the number =
of vCPUs allocated to the HVMs (I tested it with just one allocated) nor =
the workload (it is very light, with barely any CPU time =
shown).</div><div><br></div><div><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);">If I fully pause or shut down the HVMs =
however, C3 jumps up to a much more reasonable residency. I am using =
sched-credit2 as the scheduler with default weight and cap =
values.</span></div><div><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);"><br></span></div><div><span style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);">Would appreciate any =
input.</span></div><div><br></div><div><font color=3D"#000000"><span =
style=3D"caret-color: rgb(0, 0, 0);">Best,</span></font></div><div><font =
color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, =
0);">Alex</span></font></div><div><font color=3D"#000000"><span =
style=3D"caret-color: rgb(0, 0, =
0);"><br></span></font></div></body></html>=

--Apple-Mail=_EDB941DF-6818-4381-B4EF-C0E649DAE668--

