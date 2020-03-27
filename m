Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2CD19593D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 15:43:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHq7E-0002Mx-8J; Fri, 27 Mar 2020 14:37:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hYVq=5M=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jHq7C-0002Ms-B2
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 14:37:43 +0000
X-Inumbo-ID: 82659ca0-7038-11ea-bec1-bc764e2007e4
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::12])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82659ca0-7038-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585319859;
 s=strato-dkim-0002; d=aepfle.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=BWEe5yZwvv6uKqihOppNLDoGpcN02Idsi9DZIr2WNuM=;
 b=EH54ApmnzvLoVeIqGzCxCrEnavfV2VjAq/eLBL5W9TvEuHRiMymi5Z1V+Z5gJP9560
 z5Zy/rLiDIcE9gSv3vcQ/Jj07CgKopUSRTrbCSN+2uEFHcTBqqi5HxrRBj5OwIaXPsLu
 QV802o61Ecj6NY9uMJxaAcpOtXov+ugElr7oCmekA/zgig4fyNWWlmEH68dKhJZcWsjB
 AYCFtipjytf9byq4ikpaJ1R0S4+gZT6O8xFk0+ALx29nyGdHiYAK5YdwBzYHKUvp4vPa
 4jz2569kyoCcQHdcbALfa9f+1K2aJ5qyFYRQm9/sBWufAnz5roYgdMQjgYtl2PmugBsx
 uOgg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS1Wwg"
X-RZG-CLASS-ID: mo00
Received: from aepfle.de by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id 204e5fw2REbc4MM
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 27 Mar 2020 15:37:38 +0100 (CET)
Date: Fri, 27 Mar 2020 15:37:35 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20200327143735.GA4443@aepfle.de>
References: <20200327142256.3256-1-olaf@aepfle.de>
 <24190.3426.470473.335250@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <24190.3426.470473.335250@mariner.uk.xensource.com>
Subject: Re: [Xen-devel] [PATCH v1] libxl: remove limit for default number
 of event channels
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 27, Ian Jackson wrote:

> This seems likely to be right, but: what is the default in Xen ?  Is
> it sufficiently tight to stop a guest using too many resources ?

The value of d->max_evtchns will be either 4k or 128k.
AFAICS no extra resources are allocated with the changed value.

Olaf

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl5+D68ACgkQ86SN7mm1
DoBrfA/9EzMZJlmDImau0NrpAzWtZ/zldrIeR9DZVnfwz0hb9e4ALzRWQkF9I3tz
rg95wgLGd6Xh4nW8iAaUhj+TBJKKxx8qocW6f7n5641nPVYM7nXVKw12bvUjc9We
fQZKM3SvhWCUljUC2MqrBDWnlCGY9KY7atU5QGbZn2E/AxftprCR9j5BPjphQ2ne
rW6byXvVKwLvdr+sphfy3SlBRyVhxhfdhJmzb+AItCLGm8DocyDTRBt5x1trpngE
NNUNuGf+u+NFuer6hBCsi4W4igUqeUUTMKjFCvxSeAiGPkkmAgVTDDQx6spKLYCh
TnUF793Dz6ZhK3E/5KeizDZi5BA9CNQ4ZamD9wXJcKKJlsPuVlU1teykReV65sed
Y61W3AuIrVs7yNlLSPDNLUi5ZDn/xrbYYvDof9Kw+Xx92+wE/RT/wWjXISb6NXRP
g7N243qA5/VgLINjQDZrO/PFOdxjhx93y9K0cYiPeSQXxZwXPHFKw4EEYppKpSSu
JZA2DBjJFL2exgJfieFagwBTVPYUigj56EdTkSALVbsB4959CKdC5yVo4CLpDlo5
Iimi7CXUyLBqUlkJglg7t1kNsIaKTy0HqTHBmLJC03gJzXCRpQ21jOa7Pv6Zj/rC
rkXhEbCdIbj/iLPPUU6E13yxgQS/ullCxlSLlYTvHHc8PL5Rclw=
=YNAZ
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--

