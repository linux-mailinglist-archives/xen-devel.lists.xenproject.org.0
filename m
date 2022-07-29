Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A65850E1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 15:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377530.610758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHQ0y-0006t4-Rk; Fri, 29 Jul 2022 13:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377530.610758; Fri, 29 Jul 2022 13:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHQ0y-0006rG-Os; Fri, 29 Jul 2022 13:26:52 +0000
Received: by outflank-mailman (input) for mailman id 377530;
 Fri, 29 Jul 2022 13:26:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bg2=YC=citrix.com=prvs=2023e7475=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oHQ0x-0006rA-BQ
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 13:26:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18f6d5e5-0f42-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 15:26:49 +0200 (CEST)
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
X-Inumbo-ID: 18f6d5e5-0f42-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659101209;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ollH2/IbyT5gpdGN2TR/c3jDymz+7HbuAnFWlnxMzig=;
  b=MQENVtJMDfn764onIWkomkWCNP5FZaampDE535wjiEYzNi/qbGf9Vtot
   hB4JGZJHFdq9HtDMFBaHo2Of07zk3iiwxW7lY7WRbOyDS+MxM0caQ701o
   LuUZki19RwdOpmFwXR835Pvfn7T3nnAS0jEEizo0rfzaS2LTsUZXRUcwW
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77366454
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JNhiXKp/KSg1zQii8X+4SYtd3yZeBmJgZRIvgKrLsJaIsI4StFCzt
 garIBnTa6uNZGT2Ktl+a9nk8U5Q7JPRndAxTwpprH88QSgQ9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q52lJ5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUe4u8oJGV0x
 cYhOXMfUlPZm+iY27ikH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIWKIYLUGZgJ9qqej
 kL65Dz7Pw0UDeaCjjih7l+H2bLQuiyuDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWWdhSN
 kgV8SoGtrUp+QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsAsQicx/
 kSUhN6vDjtq2IB5UlrEqO3S92nrf3FIcylSPkfoUDfp/fHluIhsqxb1fuxaAe2nsp6vBTve2
 DqV+X1Wa6oosSIb60mq1QmZ3mP0+8mUFl9dChb/BTz8sF4gDGKxT8nxsAWAs64dRGqMZgPZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyzyGsnTKuRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq4B6iPNYEePscrK2drGR2CgmbJhQjQfLUEy/lja
 f93j+73ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjG8vhT6pLHPSb9YepUbzOzghURtvzsTPP9r
 4kCbKNnCnx3DIXDX8Ug2dRLfQ5SdCRmX86eRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:a/aBN6CirQX8CMblHemm55DYdb4zR+YMi2TC1yhKJiC9Ffbo8/
 xG/c5rsCMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILBFvAE0WKI+VPd8kPFmtK1rZ
 0QEJRDNA==
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="77366454"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@citrix.com>
Subject: [XEN PATCH 0/X] tools/libxl: XSA-403 follow-up
Date: Fri, 29 Jul 2022 14:26:39 +0100
Message-ID: <20220729132641.21221-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

Two patches:
    - one for stable branches (I've rework the XSA's patch on 4.16 so
      patch will need to be backported);
    - and one patch for staging, forward porting the patch for stable
      branches.

Those patches are a rework of the patch for the stable branches available
in XSA-403. The environment variable is now in upper case, like one
would expect, and now a value of "0" as the same meaning as the variable
been absent. Also, there's a bit of documentation in `man xl`.

Thanks,

-- 
Anthony PERARD


