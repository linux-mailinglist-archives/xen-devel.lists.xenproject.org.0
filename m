Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B80C722911
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 16:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543739.848959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6BQq-0005G0-TL; Mon, 05 Jun 2023 14:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543739.848959; Mon, 05 Jun 2023 14:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6BQq-0005Da-Pw; Mon, 05 Jun 2023 14:43:40 +0000
Received: by outflank-mailman (input) for mailman id 543739;
 Mon, 05 Jun 2023 14:43:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6BQp-0005DU-Ez
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 14:43:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5953d0ae-03af-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 16:43:36 +0200 (CEST)
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
X-Inumbo-ID: 5953d0ae-03af-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685976216;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9S+JHMvNKOnGSpHMbGYSsipboUzoVEUR7YEn5J61QU8=;
  b=h7/+r4HVv0L7IngYrVq79CHN9T5yphtiMCZLCsMv5AC6Tp9UNpedqh70
   FYyJs+ven1YToXJhj6zkgxN1sSmacTLfdo3B1rpScyN4LCqBZtFhg00bd
   H5tyro+3CdnRj89I7RahUPtUk6HAx0vO5+qcQi539pze5Dcf3GXvA6LD/
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111652719
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:4rAmnaBZJC4UchVW/6Djw5YqxClBgxIJ4kV8jS/XYbTApDh00D0Dz
 zcaXDrVM/7eNmTzfd0nOtzloE8D7cDUytBjQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A4gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw8OIqAF1As
 r8hFzkwUj+mrtyTkJW7Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XTG5gPwR/Jz
 o7A1zS6Wz8APc2g8ByI2HitwcLBhRy4BatHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHr7m9WX+bsLCOoluaOzURLGIETT8JS00C+daLiL80ihXDX9NyCpmfh9f+GSzz6
 z2SpS14jLIW5eYB2r+n51nBj3Spr4LQUw8uzgzNWySu6QYRTIyoYZfu9lnY6f9GIIuDZl2Au
 nEenI6Z9u9mMH2WvHXTGqNXRujvvqvbdmSG2jaDAqXN6Ryn/yOiQY4XowhBLXpVHeMtRxq5R
 0/67FY5CIBoAFOmaqp+YoSUAssszLT9GdmNas04fuaicbAqKlbZoXgGiVq4mjm0zRNyyf1X1
 YKzK57EMJoMNUhwINNarc852KRj+C0xzHi7qXvTn0X+iur2iJJ4pN443LqyggIRtvjsTOb9q
 Yw32y62J/J3DoXDjtH/q9J7ELzzBSFT6WrKg8JWbPWfBQFtBXssDfTcqZt4Jdw4zvwOy7eUo
 C7jMqO99LYYrSeeQThml1g5MO+/NXqBhSxT0dMQ0aaAhCF4PNfHAFY3fJorZ7g3nNGPPtYtJ
 8Tpj/6oW6wVIhyeomR1UHUIhNA6HPhdrV7UbnXNjflWV8IIejElDfe9IlO2pHhWUnvu3Sb8y
 pX5vj7mrVM4b1wKJK7rhDiHlTtdYVB1dDpOYnb1
IronPort-HdrOrdr: A9a23:n7OecKyQyP5ukJ2QIo+oKrPw/L1zdoMgy1knxilNoHtuA7elfq
 GV7YwmPHrP41wssR4b9OxoR5PhfZqxz/FICPAqTNWftWrdyRKVxeNZjLcKmAeQfhEWn9Q1vZ
 uIGJIRNDSfNzRHZMzBkWqFOudl4N6c7aiuj+u29QYKcekWBpsQiDuRAzzraHFedU19CZ0lUK
 Wd7qN81l6dRUg=
X-Talos-CUID: =?us-ascii?q?9a23=3A/blxNWg4obxOMjN4htyxr1UF1jJueHmAzUveZAy?=
 =?us-ascii?q?BNm9UdJKwYGG1qIRkup87?=
X-Talos-MUID: 9a23:LoEDVAZyWW03wOBT53y1qitrJfhRxamEAkFKvJsehIrZHHkl
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="111652719"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH 0/2] xen: Arch Teardown
Date: Mon, 5 Jun 2023 15:43:29 +0100
Message-ID: <20230605144331.1819452-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Sorry this is late...  Patch 1 ought to be ready in this form.

I'll leave it up to the ARM maintainers as to whether they want to take patch
2 in that form (with TEE in patch 3), or whether to merge the two.

Compile tested on all architectures, functionally tested on x86 only.

Branch available from:

  https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/arch-teardown

Full Gitlab CI run in progress:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/889759838

Andrew Cooper (2):
  x86: Introduce arch_domain_teardown()
  arm: Boilerpate arch_domain_teardown()

 xen/arch/arm/domain.c    | 32 ++++++++++++++++++++++++++++++++
 xen/arch/x86/domain.c    |  5 +++++
 xen/common/domain.c      |  6 ++++++
 xen/include/xen/domain.h |  1 +
 xen/include/xen/sched.h  |  1 +
 5 files changed, 45 insertions(+)


base-commit: b3880c365db89051728e1de6b6889c750cbdd915
-- 
2.30.2


