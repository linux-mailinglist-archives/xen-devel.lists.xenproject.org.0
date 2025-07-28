Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7CCB134DE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 08:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061046.1426580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugHFi-0003YI-Gp; Mon, 28 Jul 2025 06:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061046.1426580; Mon, 28 Jul 2025 06:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugHFi-0003VG-Di; Mon, 28 Jul 2025 06:22:26 +0000
Received: by outflank-mailman (input) for mailman id 1061046;
 Mon, 28 Jul 2025 06:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ENqu=2J=alex0.net=me@srs-se1.protection.inumbo.net>)
 id 1ugHFh-0003VA-2o
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 06:22:25 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster4-host2-snip4-4.eps.apple.com [57.103.84.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38ac54fc-6b7b-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 08:22:23 +0200 (CEST)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-2 (Postfix) with ESMTPS id
 0BDD0180013D
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:22:20 +0000 (UTC)
Received: from smtpclient.apple (qs-asmtp-me-k8s.p00.prod.me.com
 [17.57.155.37])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-2 (Postfix) with ESMTPSA id
 249FB18000A4
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:22:20 +0000 (UTC)
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
X-Inumbo-ID: 38ac54fc-6b7b-11f0-b895-0df219b8e170
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex0.net; s=sig1; bh=LcqM1J+V2RdBxQdAIq40B2Qh1kHtL9uSlOq9fpcZewE=; h=From:Content-Type:Mime-Version:Subject:Date:To:Message-Id:x-icloud-hme; b=DTnyDKwiwrxXuLzK3VbpGyZgQ41ebyRU3rZ0vB8nsBDTo5TSIHVn/xloymxnGHtPGfxWHCjP+VK3YcZHlNvcwH6n8vRv3yGligHKS0/CTO+DhuSd3UTkaYPWve7tSdSSoIcWLs/bDV/0C5wnoKQsV59/HHVk8bexhxA4FsrW19pewv4WRKgXYkN33QL3iNvI7dCKGzXm0opwQIe7rovlsdPEdojpeir0R48UMyB7CbGsM6qEpuFvff3fI7gVLzTj8VcHscNSYD+Axntmi4kqAv85TXe/aMRj2hRqXsdCMKQ/I954RIolfJ3TbrsMFk0T6zVecX1GGCrIbxqqOqreVg==
X-Client-IP: 185.24.123.146
From: me@alex0.net
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C82CF8D9-7049-4503-B7E9-AB661FA09A37"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: ACPI C3 issues on Meteor Lake with HVMs
Date: Mon, 28 Jul 2025 07:22:09 +0100
References: <A5CBEBE2-8EBB-4844-BEE5-BACA780EB534@alex0.net>
To: xen-devel@lists.xenproject.org
In-Reply-To: <A5CBEBE2-8EBB-4844-BEE5-BACA780EB534@alex0.net>
Message-Id: <1B928130-4C91-4ED0-A25B-3E948C49E98C@alex0.net>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA0NiBTYWx0ZWRfX2TD6qhdK+VW2
 lIsE+FzmL6Wg2iawC44XciezmkN6NPJ+htir6sJstYfx+u7TGPU6VLkswkX7pIRLjq+HmQaQzKt
 z81kBj8phJ/i29SxvuTySc+/nYOLx24MBR3ZIk0pNKZPdNo39E7ykTSqz8pYJxDg44cdlUf5liL
 MIdefgGZHZDdZJT5mZchHdgnBzg/gUNKFwkmDMxw18ZX1n+q8++r8koVrruwFbjmbW/Ba1RyeyF
 ORLgp6ZimJewJsvVZ43E4QYDYfcU7C6waj/UTh+q2iqzQTzPbk8uhx96VA+oKddP0Psyxdb6I=
X-Proofpoint-GUID: qjU5kOmzhh9wkKJQiqTYuXtOm3G4HCmF
X-Proofpoint-ORIG-GUID: qjU5kOmzhh9wkKJQiqTYuXtOm3G4HCmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0 clxscore=1030 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2507280046


--Apple-Mail=_C82CF8D9-7049-4503-B7E9-AB661FA09A37
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Please disregard this email, it was sent to the wrong list.

> On 28 Jul 2025, at 07:16, me@alex0.net wrote:
>=20
> Hi,
>=20
> Hoping someone smarter than I can help out here =F0=9F=99=82 I have a =
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
>=20
> If I fully pause or shut down the HVMs however, C3 jumps up to a much =
more reasonable residency. I am using sched-credit2 as the scheduler =
with default weight and cap values.
>=20
> Would appreciate any input.
>=20
> Best,
> Alex
>=20


--Apple-Mail=_C82CF8D9-7049-4503-B7E9-AB661FA09A37
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Please =
disregard this email, it was sent to the wrong list.<br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On 28 Jul 2025, at 07:16, me@alex0.net =
wrote:</div><br class=3D"Apple-interchange-newline"><div><meta =
http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;">Hi,<div><br></div><div>Hoping someone =
smarter than I can help out here =F0=9F=99=82 I have a Meteor Lake =
machine which has the new P/E core architecture. I am trying to optimise =
a mobile platform for on-battery runtime and from the documentation I =
have read this requires CPUs to be in ACPI state C3 (which corresponds =
to platform state C10). Though I=E2=80=99ve enabled cpuidle (with the =
corresponding GRUB parameter) the issue I=E2=80=99m having is Xen will =
never enter C3 on any cores once there are a certain number of HVMs =
running (on my platform it is around 3-4), no matter which cores they =
are pinned to. For example, even if I pin the HVMs (and their =
corresponding device model stubdoms) to the E-cores, the P-cores will =
refuse to enter C3 and display 99.81% residency for C2. This happens =
regardless of the number of vCPUs allocated to the HVMs (I tested it =
with just one allocated) nor the workload (it is very light, with barely =
any CPU time shown).</div><div><br></div><div><span style=3D"caret-color: =
rgb(0, 0, 0);">If I fully pause or shut down the HVMs however, C3 jumps =
up to a much more reasonable residency. I am using sched-credit2 as the =
scheduler with default weight and cap values.</span></div><div><span =
style=3D"caret-color: rgb(0, 0, 0);"><br></span></div><div><span =
style=3D"caret-color: rgb(0, 0, 0);">Would appreciate any =
input.</span></div><div><br></div><div><font><span style=3D"caret-color: =
rgb(0, 0, 0);">Best,</span></font></div><div><font><span =
style=3D"caret-color: rgb(0, 0, =
0);">Alex</span></font></div><div><font><span style=3D"caret-color: =
rgb(0, 0, =
0);"><br></span></font></div></div></div></blockquote></div><br></body></h=
tml>=

--Apple-Mail=_C82CF8D9-7049-4503-B7E9-AB661FA09A37--

