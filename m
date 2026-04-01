Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAgRAw4mzWlkaQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:05:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54137BCBF
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:04:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270351.1559041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wB5-0004D8-Qo; Wed, 01 Apr 2026 14:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270351.1559041; Wed, 01 Apr 2026 14:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wB5-0004Ah-O5; Wed, 01 Apr 2026 14:04:15 +0000
Received: by outflank-mailman (input) for mailman id 1270351;
 Wed, 01 Apr 2026 14:04:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7629=CB=ubuntu.com=enr0n@fe-bounces.ubuntu.com>)
 id 1w7wB3-0004Ab-J8
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:04:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wB2-00CLV8-FB
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:04:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <SRS0=7629=CB=ubuntu.com=enr0n@fe-bounces.ubuntu.com>)
 id 69cd25db-e002-0a2a0a5209dd-0a2a4506b7a0-10
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:04:12 +0200
Received: from [121.127.44.66] (helo=smtp.forwardemail.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <SRS0=7629=CB=ubuntu.com=enr0n@fe-bounces.ubuntu.com>)
 id 69cd25da-0df0-0a2a45060019-797f2c42241f-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:04:12 +0200
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-56ce17e1f56so4892866e0c.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:04:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fe-953a8a3ca9 header.d=ubuntu.com header.i="@ubuntu.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: Content-Type: Cc: To: Subject: Message-ID:
 Date: From: In-Reply-To: References: MIME-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1775052250;
 bh=ZYLQqX4T/QfgbLaRjWzbcTh4jjHfhPMxLig3H0OSreo=;
 b=bBr8arU/+f2uonEskRZVY+POvjpQeC7J+ZSxU6i5Ry54oTtTQdz3avq/CRPCHQMgecKMdt6hr
 5KKLS5dRKqCUCnmRfYj5mwgMsY99KLsWX6WFN7k2QgspbrWJ57XKKE96DxrQxkcON4g2NXxBQqn
 mgwfET9xxJNYDX05ZZnwIpZznfVsO0/UuIS5TLSoxEBzHdXtd2Ftf4f/QU1pFbGze/aEDA2dIcv
 dYZ6R+tUet8PDFXDubS3NbSs9JWGC126alRQEoWi1Hh4tU9/17oihfokxofCE4QKBrXdmupMcau
 A9jNPJZUxAU/Oet4Fu7OLzA609A60OAGpR4AdhXrhYwA==
X-Forward-Email-ID: 69cd25d713aa77a31744c685
X-Forward-Email-Sender: rfc822; enr0n@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.6.64
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Gm-Message-State: AOJu0YyoF3wHoM9k8JaBiirgQVfXFqWYLCTL3Vk+IyAtE5JTvq+0Uh7b
	3nf3x5htfwOW6ZVWA6eo7H68GufJ5XVPeOdi72uEnw5loMghXdzX5AdZFRibqgkYfzXhadogoBd
	67asvCDKPlbswhK0vW5DR2YXail4XFVsVnC542VjwiqRnPFNGrvQ3KhPjKzFHf9YWiHMXuhHhH/
	/V0UigUc7DbuRGzYIREANw0TTqrulWQsVIg+7X6mvIPBMzWoWD/jT1WC5Z2TM=
X-Gm-Gg: ATEYQzyoRbmosTflW2feJ//TwyxehQUZSrvQvt4qCMfCJ8gpHPby2yIrg2VlkA10xG6
	2BhDUL4wuekKfsOn8Q7NzN1aeRV1R3QB5vAezpjRmLP3v2YT0hMzHZshsJEW89xPGL4CQpxpK9+
	YzrclwX2lXp472/Mi5UdDtAYloLCjSujcC1LZ76Vmq1j5VhyFcwDbW6dfqWQprx40oclwkkUypa
	1+o
X-Received: by 2002:a05:6122:6087:b0:56c:dacc:9c3a with SMTP id 71dfb90a1353d-56d8a975f93mr1564556e0c.16.1775052245521;
        Wed, 01 Apr 2026 07:04:05 -0700 (PDT)
X-Received: by 2002:a05:6122:6087:b0:56c:dacc:9c3a with SMTP id
 71dfb90a1353d-56d8a975f93mr1564518e0c.16.1775052245226; Wed, 01 Apr 2026
 07:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774918270.git.milan_djokic@epam.com> <5bcbeb1d614be413c13196a38d13eb3de5c549e4.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <5bcbeb1d614be413c13196a38d13eb3de5c549e4.1774918270.git.milan_djokic@epam.com>
From: Nick Rosbrook <enr0n@ubuntu.com>
Date: Wed, 1 Apr 2026 10:03:54 -0400
X-Gmail-Original-Message-ID: <CAEN5XSFSZ+LYxX0FSP3P54dH+GY6AnNZv0E8SRdXmpJZR8q1kQ@mail.gmail.com>
X-Gm-Features: AQROBzDsIAkTT-BXTxpHUg7wEs4HsANEVI2yOsm8f9UXch0MQDO40ngiQI9DM5g
Message-ID: <CAEN5XSFSZ+LYxX0FSP3P54dH+GY6AnNZv0E8SRdXmpJZR8q1kQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/23] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
To: Milan Djokic <milan_djokic@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul Singh <rahul.singh@arm.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, George Dunlap <gwd@xenproject.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1775052252-64A4C3D8-CE7ECAD2/0/0
X-purgate-type: clean
X-purgate-size: 3457
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:gwd@xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:dkim,ubuntu.com:email,mail.gmail.com:mid,arm.com:email,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[enr0n@ubuntu.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enr0n@ubuntu.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6E54137BCBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 9:52=E2=80=AFPM Milan Djokic <milan_djokic@epam.com=
> wrote:
>
> From: Rahul Singh <rahul.singh@arm.com>
>
> Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
> XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
> enable/disable vIOMMU support for domains.
>
> Also add viommu=3D"N" parameter to xl domain configuration to enable the
> vIOMMU for the domains. Currently, only the "smmuv3" type is supported
> for ARM.
>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>  docs/man/xl.cfg.5.pod.in             | 13 +++++++++++++
>  tools/golang/xenlight/helpers.gen.go |  2 ++
>  tools/golang/xenlight/types.gen.go   |  7 +++++++
>  tools/include/libxl.h                |  5 +++++
>  tools/libs/light/libxl_arm.c         | 13 +++++++++++++
>  tools/libs/light/libxl_types.idl     |  6 ++++++
>  tools/xl/xl_parse.c                  |  9 +++++++++
>  7 files changed, 55 insertions(+)
>
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 3aac0bc4fb..4de8db42ac 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3175,6 +3175,19 @@ option.
>
>  =3Dback
>
> +=3Dover 4
> +
> +=3Ditem B<viommu=3D"N">
> +
> +To enable viommu, user must specify the following option in the VM
> +config file:
> +
> +viommu =3D "smmuv3"
> +
> +Currently, only the "smmuv3" type is supported for ARM.
> +
> +=3Dback
> +
>  =3Dhead3 x86
>
>  =3Dover 4
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight=
/helpers.gen.go
> index b0c09da910..b24cfd0533 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1273,6 +1273,7 @@ x.ArchArm.NrSpis =3D uint32(xc.arch_arm.nr_spis)
>  if err :=3D x.ArchArm.ArmSci.fromC(&xc.arch_arm.arm_sci);err !=3D nil {
>  return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
>  }
> +x.ArchArm.ViommuType =3D ViommuType(xc.arch_arm.viommu_type)
>  if err :=3D x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err !=
=3D nil {
>  return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  }
> @@ -1815,6 +1816,7 @@ xc.arch_arm.nr_spis =3D C.uint32_t(x.ArchArm.NrSpis=
)
>  if err :=3D x.ArchArm.ArmSci.toC(&xc.arch_arm.arm_sci); err !=3D nil {
>  return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
>  }
> +xc.arch_arm.viommu_type =3D C.libxl_viommu_type(x.ArchArm.ViommuType)
>  if err :=3D x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err !=3D=
 nil {
>  return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/t=
ypes.gen.go
> index e0fd78ec03..e306f9c1ac 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -530,6 +530,12 @@ type ArmSci struct {
>  Type ArmSciType
>  }
>
> +type ViommuType int
> +const(
> +ViommuTypeNone ViommuType =3D 0
> +ViommuTypeSmmuv3 ViommuType =3D 1
> +)
> +
>  type RdmReserve struct {
>  Strategy RdmReserveStrategy
>  Policy RdmReservePolicy
> @@ -619,6 +625,7 @@ Vuart VuartType
>  SveVl SveType
>  NrSpis uint32
>  ArmSci ArmSci
> +ViommuType ViommuType
>  }
>  ArchX86 struct {
>  MsrRelaxed Defbool

This looks right now. For the golang bits:

Acked-by: Nick Rosbrook <enr0n@ubuntu.com>

-Nick

