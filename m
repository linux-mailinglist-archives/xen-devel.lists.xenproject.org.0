Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE692C45EF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 17:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37925.70502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khy0S-0002KC-BP; Wed, 25 Nov 2020 16:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37925.70502; Wed, 25 Nov 2020 16:51:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khy0S-0002Jn-7z; Wed, 25 Nov 2020 16:51:00 +0000
Received: by outflank-mailman (input) for mailman id 37925;
 Wed, 25 Nov 2020 16:50:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLmq=E7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1khy0Q-0002Ji-R8
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 16:50:58 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2db5e4ad-b9fe-4acb-b42b-21982dee91f1;
 Wed, 25 Nov 2020 16:50:57 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QLmq=E7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1khy0Q-0002Ji-R8
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 16:50:58 +0000
X-Inumbo-ID: 2db5e4ad-b9fe-4acb-b42b-21982dee91f1
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2db5e4ad-b9fe-4acb-b42b-21982dee91f1;
	Wed, 25 Nov 2020 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606323057;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=jVct1SK2i7CvNlY0fbNrhDdBreKhUZcUbCrCCUWkHws=;
  b=B8YHzhVjMfZlIrTSYZDj3pUVx0p2z4kQt22r2FiCR05YVZrT2gM7xYmg
   H287t336bDUl6VzLTJ7wlUYhBNCzya+UGhLcotmREwHhfX1dujaRZWqLK
   wcXeUI+CD2/1n8gnSzr0fh8hgHzzfu2nJSNe/3IqaZcDl+FYef5mHDyS+
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wRp/0NCnnebIOglK+wxbn6WEBUYWf6v+wkY5jMr5Q15Ar869etcq5f9iBHzzEGYukIWxNpaxsN
 5iFuXvzRT5duw7rF1borim8BmMOBIV6koHlgxhbNGCrinqmDp7ZIpUrIdyBGbObXswOPvVjskQ
 cQ7CpprWaALA2zifcPGbYprhY9jJQNnq28zfvdx+R/w8Evdqc0vHaDdQwU+33wgMp+M0DoD5GF
 jX4zuy6KWWzMnvDFUw55MPlv2EBlzZ+ruo94as82eKMExI4eMDGovogibOvdq/AxRNvc992cJh
 QIE=
X-SBRS: None
X-MesageID: 31933357
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,369,1599537600"; 
   d="scan'208";a="31933357"
Subject: Re: [PATCH] tools/libs: Simplify internal *.pc files
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
References: <20201125144928.22778-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <66d5ef1f-6120-38f6-2be0-c77720272e5d@citrix.com>
Date: Wed, 25 Nov 2020 16:50:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201125144928.22778-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 25/11/2020 14:49, Andrew Cooper wrote:
> diff --git a/tools/Rules.mk b/tools/Rules.mk
> index f61da81f4a..5d92ff0699 100644
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -184,7 +184,7 @@ $(PKG_CONFIG_DIR)/%.pc: Makefile $(XEN_ROOT)/tools/Rules.mk $(PKG_CONFIG_DIR)
>  	echo "Description: $(PKG_CONFIG_DESC)"; \
>  	echo "Version: $(PKG_CONFIG_VERSION)"; \
>  	echo "Cflags: -I\$${includedir} $(CFLAGS_xeninclude)"; \
> -	echo "Libs: -L\$${libdir} $(PKG_CONFIG_USELIBS) -l$(PKG_CONFIG_LIB)"; \
> +	echo "Libs: -L\$${libdir} $(sort $(PKG_CONFIG_USELIBS)) -l$(PKG_CONFIG_LIB)"; \
>  	echo "Libs.private: $(PKG_CONFIG_LIBSPRIV)"; \
>  	echo "Requires.private: $(PKG_CONFIG_REQPRIV)"; \
>  	} > $@

Actually, it occurs to me that this would be better in libs.mk as

PKG_CONFIG_USELIBS := $(sort $(SHLIB_libxen$(LIBNAME)))

in case we gain any further uses of PKG_CONFIG_USELIBS

~Andrew

