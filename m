Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7371A71A0D7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542598.846633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jbm-00063p-1E; Thu, 01 Jun 2023 14:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542598.846633; Thu, 01 Jun 2023 14:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jbl-0005xL-TX; Thu, 01 Jun 2023 14:48:57 +0000
Received: by outflank-mailman (input) for mailman id 542598;
 Thu, 01 Jun 2023 14:48:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFRJ=BV=citrix.com=prvs=509590c99=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q4jbk-0005t4-FO
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:48:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d7ab5a2-008b-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 16:48:54 +0200 (CEST)
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
X-Inumbo-ID: 6d7ab5a2-008b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685630934;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s55Bg1RE/VtrmSUQ06M8Ht8TG3TDHN6a4seG18aiU7U=;
  b=hp+yhK932vPBwDQI/TQQvY1/Ueb8Q6/omS3Fc74H4paMh6Q8rS5DlujN
   bFiNJp5Lkd24Rbh+7ZVdEpvhJjxpNxs4umaX4oEFaeOg6WS8Q6gTEMNuv
   y/SkAm85U8MUj2mp2MiBd/WNnhbUP862G4+UutQv6XfBTNGTQNmfmht10
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113728656
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:rfGT8K+g8p3YTwSeBBYbDrUDnH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GIfXm3Qa/iCZWSmLYhyati09koGv5DVnNZgGVRpqys8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmO6gS5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklX9
 uM3MncoSyyxrMfqyayRV7Mxr8s8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0Mxx3H/
 DKYojqR7hcyOICU0TDZ/GqQrObzzXnnYNg8JLKo6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqfCwbYhFCxvzfkqoW0hvRZMs5TYe6kYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdkBiN2dDB0zWirhRdMOS
 BG7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHXoXwzOh7NhziwwCDAdJ3T3
 7/BK65A6l5DWMxaIMeeHb9BgdfHOAhjrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+W3oH
 yJkH5LSkX13CbSuChQ7BKZPdTjm21BnX8GpwyGWH8bfSjdb9JYJUKSJn+NxKtE8w8y4VI7gp
 xmAZ6OR83Kn7VWvFOlAQiwLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:kJVDcqPQnjCvfcBcT0r155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8Qr4WBkb6LO90dq7MAvhHP9OkMEs1NKZMDUO11HYS72KgbGC/9SCIVy0ygc+79
 YHT0EWMrSZYjZHZK3BkWuF+qMbsb26GdeT9ILjJhlWLT1CWuVF1UNUGwybGkp5SE1tHpwiDq
 eR4cJBun6JZWkXRt7TPAhJY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJ0x6s4+2
 StqX202kzjiYD19vbv7R6T031koqqg9jKFPr3OtiEhEESjtu9vXvUiZ1TNhkFxnAjl0idQrD
 CFmWZbAy000QKaQoj9m2qQ5+HtvQxelkPK2BuWh2Durtf+Qy9/A81dhZhBeh+c8EY4uspguZ
 g7qF5xGKAnfS8osR6NkuQgbSsa4nacsD4ni6oennZfWYwRZPtYqpEe5lpcFNMFEDjh4I4qHe
 FyBIWEjcwmOG+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljML9Y47SZND++
 PYW54Y4o1mX4sTd+ZwFe0BScy4BijERg/NKnubJRD9GKQOKxv22uzKCXUOlZKXkbAzveoPcc
 76ISxlXEYJCjzTNfE=
X-Talos-CUID: 9a23:e3DjSmC/6YAsPyr6EzBk62EOXeUATk/26SvZPWWlUztAR6LAHA==
X-Talos-MUID: 9a23:V654/QrbQW/+RnabX08ezz0+P99iv6q2NGoErcVcp/HeGxx/KyjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="113728656"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/3] x86: RSBA and RRSBA handling
Date: Thu, 1 Jun 2023 15:48:42 +0100
Message-ID: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This series deals with the hanlding of the RSBA and RRSBA bits across all
parts and all mistakes encountered in various microcode versions.

There are substantial changes from v1, following a clarification from Intel.
Importantly, CPUs are not expected to enumerate both RSBA and RRSBA, therefore
we should do the same for VMs.

Andrew Cooper (3):
  x86/spec-ctrl: Rename retpoline_safe() to retpoline_calculations()
  x86/spec-ctrl: Fix up the RSBA/RRSBA bits as appropriate
  x86/cpu-policy: Derive RSBA/RRSBA for guest policies

 xen/arch/x86/cpu-policy.c                   |  53 ++++++++
 xen/arch/x86/include/asm/cpufeature.h       |   1 +
 xen/arch/x86/spec_ctrl.c                    | 131 +++++++++++++++++---
 xen/include/public/arch-x86/cpufeatureset.h |   4 +-
 xen/tools/gen-cpuid.py                      |   5 +-
 5 files changed, 172 insertions(+), 22 deletions(-)

-- 
2.30.2


