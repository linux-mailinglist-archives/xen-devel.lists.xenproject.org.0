Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1837AA2A
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 17:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125780.236751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgTv0-0004L6-J2; Tue, 11 May 2021 15:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125780.236751; Tue, 11 May 2021 15:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgTv0-0004IG-Fy; Tue, 11 May 2021 15:03:30 +0000
Received: by outflank-mailman (input) for mailman id 125780;
 Tue, 11 May 2021 15:03:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgTuz-0004IA-Hf
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 15:03:29 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f05fb18-9082-4348-bdd5-515f3b03448f;
 Tue, 11 May 2021 15:03:28 +0000 (UTC)
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
X-Inumbo-ID: 3f05fb18-9082-4348-bdd5-515f3b03448f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620745408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ive6uwLR7sMAV0tERTAkBNbCIpG99cEIedUrrl5rArQ=;
  b=QjTksKL5+FxTir4c72NcDvRo2hB6/CotnQV36RXza8TF8D+JDI1g6i6x
   jKKkBLkD/IF+lkUS0h8s2mCiMnqF9Tv1BpokdYR0f1W83uLUTxS0fLxoJ
   DKypeImCI6t8mxkhD/ULEivZH8DMR43dq5DHlPgG8G4HjE2lKaAIrBu4J
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: u+OdYE2d9v5fvHCQ/rLOBtmfpBb+Z1zmb0fNJ4datVPHJIMG7FnqzqqHd3FDZSb69orUOjrM/p
 yALvlKIVpT4zAwdyq3WlwPdWsLDlEY0Xz+awpOKn+tteFe01+YACThZcvi4DcbQwrWo737+ZZ0
 cCqhnJ/cPEvJAkxcuD4jP6p0dyrFA2qCeoojy5Xu55reIS3/DLt7cG2wWIFph08g/VwpWjqoic
 9xghSp9CdyvXbLm9olSvTpx+Nwe7dhQ/ZMlVtn1xOFTcpV/818rK+VCr8X8Kr5EfRtKeXNNCUM
 WyY=
X-SBRS: 5.1
X-MesageID: 43539642
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wiBOm6v0tX0XhxJ9zhYdxSId7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43539642"
Date: Tue, 11 May 2021 16:03:24 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 06/14] tools/libs: stat: Use const whenever we point to
 literal strings
Message-ID: <YJqcvEeRLfwbZpEV@perard>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-7-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210405155713.29754-7-julien@xen.org>

On Mon, Apr 05, 2021 at 04:57:05PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> literal strings are not meant to be modified. So we should use const
> char * rather than char * when we want to store a pointer to them.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

