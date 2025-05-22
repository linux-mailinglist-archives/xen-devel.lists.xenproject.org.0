Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7EAC1849
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994737.1377562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiP-0000N4-I2; Thu, 22 May 2025 23:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994737.1377562; Thu, 22 May 2025 23:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiP-0000Ep-Cn; Thu, 22 May 2025 23:52:45 +0000
Received: by outflank-mailman (input) for mailman id 994737;
 Thu, 22 May 2025 23:23:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PZjB=YG=alex0.net=me@srs-se1.protection.inumbo.net>)
 id 1uIFFc-0004Yx-5I
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:23:00 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster1-host2-snip4-10.eps.apple.com [57.103.87.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1bbd007-3763-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 01:22:57 +0200 (CEST)
Received: from outbound.qs.icloud.com (localhost [127.0.0.1])
 by outbound.qs.icloud.com (Postfix) with ESMTPS id 08E1D18001D9
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 23:22:55 +0000 (UTC)
Received: from smtpclient.apple (qs-asmtp-me-k8s.p00.prod.me.com
 [17.57.155.37])
 by outbound.qs.icloud.com (Postfix) with ESMTPSA id 690C2180012D
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 23:22:55 +0000 (UTC)
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
X-Inumbo-ID: b1bbd007-3763-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex0.net; s=sig1;
	bh=W4igLNWEpJdS+ajzjNyCAoqzb9V+DG8pjtCGb23spVg=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme;
	b=pQA47SytSi4NDaGJen0AKZZPDX28fadWhK+mf3OfhXCjs7WxTPrs/Zif1GqifH1Pa
	 Ws7XkkKUhZbj5JEcCGZtqGgJbLSkqIIdzdoNi2ZEt/XibzFAKZuKBHETXQhlGn47VB
	 gFd+9cFaVU8CmDf8J/b9OXCTG0nqMfVyBU1c7UOHZGYCC1WdIVK4zQ8TNnLeBmMpOz
	 qh60G52sxNf/tZMnljJt5idwvQjrh4+cRy48AffjRp41RGtBUhUhiB1fsNs+QZi4En
	 jWqLid4LMRoiVGPJc2vBs8GiTU4Nx6HjwTr9nlCpqZeAVXBcFTWKY3rCPkEsCBR0S5
	 8Ut/YSqrHSSuA==
From: me@alex0.net
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_CDA98334-DDE1-4A16-9E49-F8DC6B31E240"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: xen_acpi_processor driver is bound to dom0 vcpu count
Message-Id: <A56FE54F-6BE8-4A4E-9598-B1C98028270F@alex0.net>
Date: Fri, 23 May 2025 00:22:44 +0100
To: xen-devel@lists.xenproject.org
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-GUID: 08OLpaYwqyWuO0fGwWXqHDti4i2hrTNe
X-Proofpoint-ORIG-GUID: 08OLpaYwqyWuO0fGwWXqHDti4i2hrTNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_10,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 clxscore=1030 phishscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2503310001 definitions=main-2505220234


--Apple-Mail=_CDA98334-DDE1-4A16-9E49-F8DC6B31E240
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I think I=E2=80=99ve just uncovered a rather nasty bug in the =
xen_acpi_processor driver in dom0. If the vcpu count in dom0 is set to =
anything other than the exact number of physical cores, the =
xen_acpi_processor kernel driver will fail to upload the C-state =
information for those cores to Xen, resulting in Xen never knowing about =
the C-states, which significantly impacts battery life on mobile =
platforms.

This can impact users who set dom0_max_vcpus to a lesser value than =
their number of CPU cores, but is particularly relevant if SMT is =
enabled in firmware but disabled in Xen. As the cores are disabled =
manually by Xen, dom0 will only see the number of active cores; but as =
this is a lesser number of cores than Xen knows of it will mismatch and =
half the cores will not see C-state information.

The bug is reproducible easily by setting dom0_max_vcpus to less than =
your physical core count and running xenpm start 1. See if there are any =
cores that only display C0 and C1 C-states.

Alex


--Apple-Mail=_CDA98334-DDE1-4A16-9E49-F8DC6B31E240
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">I think I=E2=80=99=
ve just uncovered a rather nasty bug in the xen_acpi_processor driver in =
dom0. If the vcpu count in dom0 is set to anything other than the exact =
number of physical cores, the xen_acpi_processor kernel driver will fail =
to upload the C-state information for those cores to Xen, resulting in =
Xen never knowing about the C-states, which significantly impacts =
battery life on mobile platforms.<br><div><br></div><div>This can impact =
users who set dom0_max_vcpus to a lesser value than their number of CPU =
cores, but is particularly relevant if SMT is enabled in firmware but =
disabled in Xen. As the cores are disabled manually by Xen, dom0 will =
only see the number of active cores; but as this is a lesser number of =
cores than Xen knows of it will mismatch and half the cores will not see =
C-state information.</div><div><br></div><div>The bug is reproducible =
easily by setting&nbsp;<font color=3D"#000000"><span style=3D"caret-color:=
 rgb(0, 0, 0);">dom0_max_vcpus to less than your physical core count and =
running xenpm start 1. See if there are any cores that only display C0 =
and C1 =
C-states.</span></font></div><div><br></div><div>Alex</div><div><br></div>=
</body></html>=

--Apple-Mail=_CDA98334-DDE1-4A16-9E49-F8DC6B31E240--

