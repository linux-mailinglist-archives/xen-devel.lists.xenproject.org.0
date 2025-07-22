Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF60B0D5EA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 11:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052193.1420776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue9Ej-0007Ml-Fq; Tue, 22 Jul 2025 09:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052193.1420776; Tue, 22 Jul 2025 09:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue9Ej-0007Jx-C1; Tue, 22 Jul 2025 09:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1052193;
 Tue, 22 Jul 2025 09:24:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h7T/=2D=linux.intel.com=thomas.hellstrom@srs-se1.protection.inumbo.net>)
 id 1ue9Eh-0007JY-7j
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 09:24:35 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac24fe00-66dd-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 11:24:33 +0200 (CEST)
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 02:24:30 -0700
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.202])
 ([10.245.244.202])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 02:24:17 -0700
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
X-Inumbo-ID: ac24fe00-66dd-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753176274; x=1784712274;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Ksr4RcpyiaVxvdAz9Ft+gR94b9IMq2d1CEO85zHMm3o=;
  b=CcD/z4FVhrY//Gp2/7dKa0+EAv9IwU768RWd6H7B24hes7lT2kb8/lcm
   D7IRp8W1YfEUxF+qnTTiWJtXAUUbg67OBfo8AF2D5oDmDmmnTLzOgpTK6
   0/IOFZwTdvcOy80JCxnv53G7Y+RIQ5HaDoDTSjrpoF+ewtlu3Vna+JulV
   j3Sd9ei3JRIAcTXQB8XLJ4AnCSuFGPHa5jCaKzqbWMSPR1R77dZ3eluhA
   mkYhBJzC/KP4VMESeSsklYSLAl0gtpY+8fqtEdGu30AoF5hLL5dR/mq+F
   4dH9h7vCTMsLPTIRNbyogaXpbgVPYxKG241Qykl41ALIChT6BsW1f9O+g
   A==;
X-CSE-ConnectionGUID: PZ6/ZmRITQG5Y1jmd9oiew==
X-CSE-MsgGUID: ozkjrrIGRHWnhpnE5HjTlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55574726"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55574726"
X-CSE-ConnectionGUID: cbehGU95QkWPRtX5+LVZGA==
X-CSE-MsgGUID: 7OhfXV8JRdOAnLadikdZ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="163133052"
Message-ID: <ffd58e1a8b51c98cac9be49e85d367f1a3a24c2d.camel@linux.intel.com>
Subject: Re: [PATCH v3 3/8] drm/xe: Fix typo "notifer"
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org,
 alison.schofield@intel.com, 	andrew+netdev@lunn.ch,
 andriy.shevchenko@linux.intel.com, 	arend.vanspriel@broadcom.com,
 bp@alien8.de, brcm80211-dev-list.pdl@broadcom.com, 
	brcm80211@lists.linux.dev, colin.i.king@gmail.com, cvam0000@gmail.com, 
	dan.j.williams@intel.com, dave.hansen@linux.intel.com,
 dave.jiang@intel.com, 	dave@stgolabs.net, davem@davemloft.net,
 dri-devel@lists.freedesktop.org, 	edumazet@google.com,
 gregkh@linuxfoundation.org, guanwentao@uniontech.com, 	hpa@zytor.com,
 ilpo.jarvinen@linux.intel.com, intel-xe@lists.freedesktop.org, 
	ira.weiny@intel.com, j@jannau.net, jeff.johnson@oss.qualcomm.com,
 jgross@suse.com, 	jirislaby@kernel.org, johannes.berg@intel.com,
 jonathan.cameron@huawei.com, 	kuba@kernel.org, kvalo@kernel.org,
 kvm@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux@treblig.org,
 lucas.demarchi@intel.com, 	marcin.s.wojtas@gmail.com, ming.li@zohomail.com,
 mingo@kernel.org, 	mingo@redhat.com, netdev@vger.kernel.org,
 niecheng1@uniontech.com, 	oleksandr_tyshchenko@epam.com, pabeni@redhat.com,
 pbonzini@redhat.com, 	quic_ramess@quicinc.com, ragazenta@gmail.com,
 rodrigo.vivi@intel.com, 	seanjc@google.com, shenlichuan@vivo.com,
 simona@ffwll.ch, sstabellini@kernel.org, 	tglx@linutronix.de,
 vishal.l.verma@intel.com, wangyuli@deepin.org, x86@kernel.org, 
	xen-devel@lists.xenproject.org, yujiaoliang@vivo.com, zhanjun@uniontech.com
Date: Tue, 22 Jul 2025 11:24:15 +0200
In-Reply-To: <94190C5F54A19F3E+20250722073431.21983-3-wangyuli@uniontech.com>
References: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
	 <94190C5F54A19F3E+20250722073431.21983-3-wangyuli@uniontech.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0

On Tue, 2025-07-22 at 15:34 +0800, WangYuli wrote:
> There is a spelling mistake of 'notifer' in the comment which
> should be 'notifier'.
>=20
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1979e9bdbdf3..0ca27579fd1f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -259,7 +259,7 @@ struct xe_vm {
> =C2=A0		 * up for revalidation. Protected from access with
> the
> =C2=A0		 * @invalidated_lock. Removing items from the list
> =C2=A0		 * additionally requires @lock in write mode, and
> adding
> -		 * items to the list requires either the
> @userptr.notifer_lock in
> +		 * items to the list requires either the
> @userptr.notifier_lock in
> =C2=A0		 * write mode, OR @lock in write mode.
> =C2=A0		 */
> =C2=A0		struct list_head invalidated;


