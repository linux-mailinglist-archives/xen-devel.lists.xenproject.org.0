Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF029EF9A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 16:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14282.35401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY9jt-0007Wl-99; Thu, 29 Oct 2020 15:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14282.35401; Thu, 29 Oct 2020 15:21:21 +0000
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
	id 1kY9jt-0007WM-5n; Thu, 29 Oct 2020 15:21:21 +0000
Received: by outflank-mailman (input) for mailman id 14282;
 Thu, 29 Oct 2020 15:21:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFDJ=EE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kY9js-0007WH-38
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 15:21:20 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4db4a33-9efe-4c02-965a-7cda75d6d75f;
 Thu, 29 Oct 2020 15:21:18 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uFDJ=EE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kY9js-0007WH-38
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 15:21:20 +0000
X-Inumbo-ID: c4db4a33-9efe-4c02-965a-7cda75d6d75f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c4db4a33-9efe-4c02-965a-7cda75d6d75f;
	Thu, 29 Oct 2020 15:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603984878;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=7PjLjndO3ks+GSswA7Y3requtaj2/y5zuqaKPnZN2cI=;
  b=Ju41AET8xVZpNc8eGVDA6gmwn0jM5bGT/FYrPi2kWMOKBBR/keqiajV4
   fYdnUhjetqSNLU4ng2oLSm1faydhZjUWsditBUUd8RtTz1frG1QIiUNg4
   j6M36YYA8eRiXbUY1LwuysF+by+N2oiENzyUY522dFY9Hu914j0lGJVId
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZbmUzLXINQEI188lCzrT/6a0tiCE64K9cvEcdtWAah3G9RGMttHzMYz1oCzmW6/DakExeL/aCi
 VX9wJ/tElUhaV6wwsvdUIPrGMlrz7S23dWcSp2lK8baWj8Img/2bSL8sOvuxF1gw5NQfO20ySI
 tZJLR0HXy0/JGSiQ4piM+Grl1YCgG3R+tbYGNUrMnin/g86TBq3CHmEeBccCnVvf+rBYeKw4hQ
 C8LnvgaeJBGXgJ3eST2P0aiDxcgY4aecHbvoNIUph0h7DQkR9/0hweOuTr2hpAdeJ9Y7f+r5Sw
 53Q=
X-SBRS: None
X-MesageID: 30409310
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,430,1596513600"; 
   d="scan'208";a="30409310"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EojKTFJ3CNlSn4NWzvvQ+gnJF8cHi+O8Xvnfh4wSa2XPv4x9Ei4fZ1Zuwrt1R88VCRa2GqzJRtMbzfizgLlqO4clusj6bQeLtZF5MSs3BBj0PN65jH9iyX8iHJtYDydKbAHBKbyFxG646fS2UxxaV2fyyUIMLGDnBJ33gHQXOWdUlGrSySr05xguEW1wvTqlTayYxYs3sR5V8fOMK1mZ7c9FBWiWLQjEvxwgILZlD49dQWt7UjZvmp/BSd0ijHRtujxHHu9GJ0N+ynbeK9nx1zUF9nVXTKKNmXBGPJJKRGANMupCBXV0dxZ+17TNDqlDS+WgWQ/jAVwe+IjFG5g7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/DG2aYNv+hxwx2bL0bpNn0FsUDBwHEnHdbgGz6/Gy4=;
 b=N/TyU+y7pW7l4XQFJSbMS+NeOs3l32HlP5pPFSnnnZi6t9UKDlsMVL5OkJ/GuSWff2mC76KmjTV1Xuu7YyeLG35aUXSfzdMxGKwzJL/jx21tkSKPNB6O39yyZQQK9xRk0+O1wwVDah/9qLzv7bCRhoMvwvRGYYWGcSezGqCJ0Dh/rfNkm5oumbSyrYZOLsSt8iKkHtoXrNoX9uaNpcFsx29yw3HVfLv0QBnq6xFIIqfvavbI4q4KP2vsePBlS2XbjqMlaOIRMPFu6dmz97sjRure3GoHfdVj1ffGMtQe8MH+mtVN+yZxEeeH3dzGKn39PiQBkZJzdUOHG1LtXt/oyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/DG2aYNv+hxwx2bL0bpNn0FsUDBwHEnHdbgGz6/Gy4=;
 b=vVAxugVQPNh1+A3AqmSYqlys729763uXAJw98MAXv1OfZVneJWdo6iliMpKs0qvxA9eeUKlFbMy9OIXzlahsILUg42hXPGIdDm4l66wwjxuf7LPXc6adQIyQM7RJxGr7afXcBCrlyUXxjP/NL+cN34nVDQU9Lj0XkW+zHDrIXWg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hvm: process softirq while saving/loading entries
Date: Thu, 29 Oct 2020 16:20:54 +0100
Message-ID: <20201029152054.28635-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::23) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8b18530-9309-47b8-c529-08d87c1e465e
X-MS-TrafficTypeDiagnostic: SN6PR03MB3744:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3744E1DA8BFF5B83E21206F48F140@SN6PR03MB3744.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ri01FN6M9UVPwXsZdEUmFFWWKq8R7BGMD4/jEGD7tJxOTkC7qoLLfS/kaF9ZJeSOCNhZ0ZQKIFWMnPIP96l7QaWChkfY205+ALy4zIO6c0wVtSjDwwA+w7yjUwTpNH5q9adC6IczYXW4lSyd5zvF27hrPx/rVlT+/j2HPcf1EbQ/NylVDKUv4y/yy3/iL5J7j1oeHsU2/6rMTfz2GVOsm3vmH4V3xXVvAH5/CCZKQbaosQFEjUO86sBtgaMbvjuMisXuErACJmoRVk3f/Xgji2BzHYBXhTWvoxTyrIs2ShQ94byPoTiAmvR6cqdFd31k
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(36756003)(66556008)(186003)(5660300002)(2906002)(2616005)(1076003)(4326008)(16526019)(26005)(6916009)(956004)(86362001)(6486002)(478600001)(66946007)(83380400001)(66476007)(316002)(8676002)(8936002)(54906003)(6666004)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: l0t23ttVpE3dzF5+NO84NqkOnz6/fJ3bHTfcD+MBpbRPb9hMrGtq6lK3M44dqcYd2zECrNoRBQm04FecOagr0BrZkoLUBDuoCHvfJxhKL1hh3AshkMLOEPQziDZG5SbqdjPMquMiVs94oacQpkskTcMqjuaImmVMsk9CgfjWCtLh35DpRPq3tw1I/KkMxONykUqRon//tTkT7UTvxVxtMRr4ur0vzEmlu/0+ZJUVFJKfeCoAML0HsnhNJGhrnUnRbod10h4keZzorkXpvzmHdi6bmhbicFpd8pKSjNPw5OquHRyIzAjru96zHIWUJwk69ECLh4HdViH6qejKIQf/dknche94GVzXU2WifdQ1QjGUa5bR2mX4DVGWwvHgNhnwHeCK3Aw8p/2GYyqG87iLygfWb2hKto4kujHhDx8o4tS4M3ZoabEcwevXKPoiXtF4BIkKQH6AxIuLcAiQvABLDvakTd6sa5oVYmm7g3Q28bDJG1js0aoj7AK/eN3n+qJK4hmBZU2snRQ/fKdsX0OfZL+CsCFeewyiZ4nIof9VXnBhIbzQm52rqZ+Ha4i08AxXysqScO3dtSedCfRDsMVNKLwSbpkF8zYGgTzxG3YeHCQpPRDaurqmX9rcGPnQ3EnZCzmWKCgyrc3Nq2YW2qk5Eg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b18530-9309-47b8-c529-08d87c1e465e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2020 15:21:14.6893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0z0E1ipD0kanQyEAI01zEGVHAOGjvo3nMQbh0cHWVmPDFuXc+r+YDXAtKqD1SDe0DAlGrYnY1Ckc1LZ+Cw+Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3744
X-OriginatorOrg: citrix.com

On slow systems with sync_console saving or loading the context of big
guests can cause the watchdog to trigger. Fix this by adding a couple
of process_pending_softirqs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/save.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index a2c56fbc1e..584620985b 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -21,6 +21,7 @@
  */
 
 #include <xen/guest_access.h>
+#include <xen/softirq.h>
 #include <xen/version.h>
 
 #include <asm/hvm/support.h>
@@ -255,6 +256,7 @@ int hvm_save(struct domain *d, hvm_domain_context_t *h)
                            v, i);
                     return -ENODATA;
                 }
+                process_pending_softirqs();
             }
         }
         else
@@ -268,6 +270,7 @@ int hvm_save(struct domain *d, hvm_domain_context_t *h)
                        d->domain_id, i);
                 return -ENODATA;
             }
+            process_pending_softirqs();
         }
     }
 
@@ -341,6 +344,7 @@ int hvm_load(struct domain *d, hvm_domain_context_t *h)
                    d->domain_id, desc->typecode, desc->instance);
             return -1;
         }
+        process_pending_softirqs();
     }
 
     /* Not reached */
-- 
2.29.0


