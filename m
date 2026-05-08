Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOgICiTl/WnckQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 15:29:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA1B4F7103
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 15:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303628.1576905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLLFS-0006Vo-Lv; Fri, 08 May 2026 13:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303628.1576905; Fri, 08 May 2026 13:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLLFS-0006T9-Ik; Fri, 08 May 2026 13:28:10 +0000
Received: by outflank-mailman (input) for mailman id 1303628;
 Fri, 08 May 2026 13:28:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wLLFQ-0006T0-B7
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 13:28:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLLFP-009v2t-O1
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 15:28:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fde4d9-e002-0a2a0a5209dd-0a2a4506c380-44
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 15:28:06 +0200
Received: from [52.101.66.4]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fde4e6-7371-0a2a45060019-34654204a3ba-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 15:28:06 +0200
Received: from CW1P123CA0001.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:293::9)
 by DU0PR08MB7857.eurprd08.prod.outlook.com (2603:10a6:10:3b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 13:28:00 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:400:293:cafe::5d) by CW1P123CA0001.outlook.office365.com
 (2603:10a6:400:293::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 13:28:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 13:28:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV1PR08MB8716.eurprd08.prod.outlook.com (2603:10a6:150:86::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 13:26:54 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 13:26:54 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BzB03V4U73CWbTqrdmiphmbutRhcSti1bblh3d9SkyrJAj1XbifalpU2fL8kh9TKlWgda3eKwPqpahXiylrpK9vOeyFn4VEYVAkX3AAJ70LSIvn/nN2YW1RHFPQ79w5bywjN+8fyhYd8031UuwQ2Y9t1G5W/gbD8E/tdDx7S47hke5C+C90R4TTBMNdki5Myr07vHfx0JOvHI5G5jjG3VQVKdXz4qu2k65Wmwtn+st9vt4gs3X2Bb/vUEstol6dW+4Dioy58gT/rqcyh/b2YBqjfsuGzwJDdzeemKV+Kq3bM+/aOYTmtZDPP3QtLiyDt/oThLNRLs+f+yZX9TFewoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yNstBt9AM+ciEjllsDNPg7NlbAi4aYRocuTHW9WGrc=;
 b=kNEpGNg+jMz8esHDDgQt/RFsgsptB+YsLOz1kasoyz9dpNnxQlJEflpNtaBA80e/6FyTizFxX8zHC+/krDhtKiwrTz/MuQ7V65Cnn0O2oweGUbBtOGX7IZjPRWErj0y1x+Tu4WbCmTm4sbbsF8Zug4dSk20QikhFZDrYcsESB0lSIppwqIJFfun6mLCxHiR02+Of2h6dbH6DWfecHi8AOUHxI6cYWU54ZGPhxWCG37y1OnZwFDD6OPHCHlDP+k9sqxNM5+02d/h+z2QYko0GwxTwVqvPhmJTCAAEU+DoJOxVQrczEGNBzQ+UxaMxSnTfP6DWkUbXxlyZrjJtkzJdxA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yNstBt9AM+ciEjllsDNPg7NlbAi4aYRocuTHW9WGrc=;
 b=BxNbXGZfyisqQHkfeHgfqEa9Og5I0eWoCypkWSVmlTa48CsJ5FllDb+lPrxsSJzvdfz6GGDAIOMQKtGi0ny06S+kRDYMdPoNMQzWKMH3wvW8DFn2Sg5blnULE1Gbn2/gKh3XnhDcFIY+7N+3Rfy+bxczEmDoMEnVgtNlY1bA3vQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPnYLWMBzdwHtU60mKatuw6U9AqKl1Y8JHc4yLqK3yoPieGWpuxEW8AAN1lb82hVMdFP7uOBpOQwVmT2QgWJVsPJ+M87Ocx0m4v+airP4xXC+snXA8B6vMoBFLRtKkRgJdrdFdjYp9rggzhcWUfMK1yV+nYaxn4Wj9/vdjH6A0H6SqDVg3SGSGAaIEq+1po6qLwmGOIeYc37cWEHamredvQb1ZYOnzbazyWPyObjv3JUIOiy0RlOq40imbenxrVWVwwinzGdTiDgldaLDLHESKVsI6+VEu4yVHXOfdN+MH2+F/kRswGV+UzDxE+KWmstO0igXnX0j44+2Iknk6DrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yNstBt9AM+ciEjllsDNPg7NlbAi4aYRocuTHW9WGrc=;
 b=w4vSJqZ+7YcquQ0zsVKc+MBhT2m4FHqEz03MyN2OovTDJGygmvdRjyokIschX29XTSewf8iPmifNMWXva3BCwM9BnLnVx9t82qroUwcW+2iP1NfuUEyKL6R5QiWRHT/+HZqMYMuJPbZSmXRtpvoj9GnnFZxNT+aiRu/zRFOyVXCbmciPbsfmygK8hjuiyp2eVMe0KbrPIzuGQV3+iDJ7XrEAbFmqu2tDXDjbaAAwbd4FzKmWYcXaEQ3aSXwP2ObnP87OfaiOI7IY5PKuKVWeVPfBu7MCKkMPhl3SHciVYlmTlWLuUYLJjh8EuMOPcTpT/LMvwTVeLSf7awW0zRGHSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yNstBt9AM+ciEjllsDNPg7NlbAi4aYRocuTHW9WGrc=;
 b=BxNbXGZfyisqQHkfeHgfqEa9Og5I0eWoCypkWSVmlTa48CsJ5FllDb+lPrxsSJzvdfz6GGDAIOMQKtGi0ny06S+kRDYMdPoNMQzWKMH3wvW8DFn2Sg5blnULE1Gbn2/gKh3XnhDcFIY+7N+3Rfy+bxczEmDoMEnVgtNlY1bA3vQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 10/13] xen/arm: Resume memory management on Xen resume
Thread-Topic: [PATCH v8 10/13] xen/arm: Resume memory management on Xen resume
Thread-Index: AQHc1lUPIk7A8CPopkGFdHGIM/WlP7X/oqWAgASNN4A=
Date: Fri, 8 May 2026 13:26:54 +0000
Message-ID: <4BFA8CEE-0168-4C14-8B5F-E19E6FD7D747@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <02b55a02f329d09c9f8b15d97ca9176b3c33017a.1775125380.git.mykola_kvach@epam.com>
 <ECDA0BD5-C2C8-4726-9377-AE4AFBE972AD@arm.com>
 <CAGeoDV9Jg0neHn0qzoaDSThhVRGQE8ko2qhbhDvF77=6hrYUWg@mail.gmail.com>
In-Reply-To:
 <CAGeoDV9Jg0neHn0qzoaDSThhVRGQE8ko2qhbhDvF77=6hrYUWg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV1PR08MB8716:EE_|AMS1EPF00000091:EE_|DU0PR08MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: c04522f5-c09f-4eb6-3159-08dead05a01b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099003|4133799003;
X-Microsoft-Antispam-Message-Info-Original:
 32mznoH5+4Pdbt/stZcfwBNSy/rn7zth4VjCLDI1OE1Zur7Fl3lZeXAI8y2R5DfOUZ7WnghPmM/VlLzTl4qAJj0tjx9A4baMiiL9/eQN/py0WL2AXWQGqZQRPp6XsjITg+9vrdcxOlspf9Ea5s2x0E8dRzvigi6Nc1jboNIYLelwp8m4hJBxh+kePIZV4XNOriFJqhsvfqqJe1kSypbnjBBTBrw+8HsvzZN6fxIiEaQk3U8ICSPdrw6NX/dHtmXivrzlBZX0GHx37l3gsM+4lYIdtmFO6cCaZllP7b+c0NeyKsnb7F6N5nl9gkGXgs6HOOSTxPUgGDyChmiKMSxVfjl4kIGtplnb9Xd/USzXxO9NstCiBPirUUN+PjwoaHnkHu+QeYNu87v5/EmMis8nTA5kv1zkNu4f8acJ5Po1k+kop6HTrcOtfAiuHKav6asR49Qpq7odY3hreBNEkFsCoCtY3YfvyHIJc9TAQDCikFLDKucRJHYLeWRRZTDZtKji1EqxD45yBdHG1y6fiMEJprYmCZ9GksDBH1Dgz8vjfVRiamDwgvKhn5Fx9Cw7Pwte5sXJ3mb4+1RNTXhYF0RpME+2q6SCgi220RxfE0MHifdxyVXlyOpPiHpamiJNWvxCPqyH4J0UhyBq2hYWnaAZtuZBRKuRFzpsFzqfgSbASEBsJ7Cx+Uah31+nAyeffQBwMggnsaUANXEyUMZr+5op6g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003)(4133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9489D4EA649B034DB595C9CFFEA0DCAC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Nz0BHTI+DKNYxWYTmIXFesGbupZ2Qg5JYuoAbqNGb5gjjkdujYprqQd0uDJmCGUaEBP9HGVnkoKUhejsgyExXSMeytrbbaNS162nsqF0t8rn86UlSpIWrhJwXj0J/cL/x/TAsYMmNlr1kfItOtwwPrVou6d7fna8ss4sfk/weRdfHIMQaeIa38VcpueAV9RHeWz7i8et78b675rA4EOaObTp79pegsNc1YAt+tJXgw7AwaYI04HONdAjW2xHG4JIo+uSq3vwzjtlh2o/naVCaKHnh2BdZaVtJC24Os5WD0MMsdcQPDfl6A9LSFwtknUbJzZuua03lHt3zi4gdUgNgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8716
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4c78b4f3-bfd3-448f-edb3-08dead057872
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|35042699022|376014|1800799024|82310400026|4133799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	odqKZQkdM6BEcmkrA99glfT2KaNS9yMWtpQ//PnRHfL7ROuH6o4p9ecDWWy1KyUjaInMvokrciZS0BCCirskZbxBvJuwg9HIDQRTQxtIu8+u/DzvoAS4/AAWEAeTO/fAInwLDbUs4c48QZ5DVSspiGwSDq75VvcQut1Lwocy8iPz/ZXSQN8BqXjWLxiQhvM3OqF2lwh2xNGDVXaLcgIp+9wy2CGkPlj6t3CAnItdVkLdsOHmZ0urb08Opct1rz+0lLngS4aaBz9yK6dfhgvJfkhlEWPoE8g9xKwmyf3F4uIoPxTMm6HIdfce7wrZvUoaQ3aW1a7UXI3oibo7wnl9L+7NCGFkfBgHTEiCO4BGaOsB0vdF4MswOBOxzYm04UoGhOu+p3ARJn1TQQzS6UpahI4tiDEn3WLM3KwLn7IzIB5z8Vy60R7jadsjzLYy1eWfnRnr0aaflFfmVxFljNrQcQuxDXTfoGOchg39Ds5wEIEo2Vf4AZh6Xco4kf8Raz3OH4lWliNB+GKH4yVw2OG6qEJfNcNQs34TGquC0uhLCMf5t8Bh+3cf0hQzvUsE1y06AE8OrSNTnnD0EuN49l4Zzar9979IbndK3a54XVg7fEMXsArHn0cSdKJfB43vX+tHgNx03V9fC8Fui7FazJsTvs8Qmz3c08eAAVpV8PJo4GDfIh+d+YdXe7mrRSsR+oLE
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(376014)(1800799024)(82310400026)(4133799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vPx0C38LbWoxxzsXJgZ+93nPzCnrrfcnJjxdTeIhFKFSai1EUEM0p/M0cEgR/ZyS6p6eo8ZMtGeTAHfXTXELYqZ8+I+slI9ZYZ3fo8s3f2jiyHB0FsPy5Xpo4wadwVIk9udOy2LLie66eAvtDXgkkTmifjjnDCvKXGDQOMImST1R6kphqplz6NvNES2z3NoEVQuEFTd/MMiXJyM4GJmhszUXWy+z78kENbsPmubOEIidTIwD5ojwai3igjKhndzx/jNCMwyyc1gOudb9aCleosSIQTDAAlMOZEnh5y6mZDNvXGgWhtQujYBXnSJpKFQxaAtHMbL/mlYdYTESVd9QqD65YWMgw8Gdu2v9RCss3JhCEuyrDCi0+sS9J6BxK0i033G5hjajdzcJG2ZwAEBrgsjMdKfReGlMjtHh+hAR1txDtKT5doZQ7Jay/ylwpoSV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 13:28:00.4865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c04522f5-c09f-4eb6-3159-08dead05a01b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7857
X-purgate-ID: tlsNG-16d1c6/1778246886-87D7AD75-602AFC03/0/0
X-purgate-type: clean
X-purgate-size: 1872
X-Rspamd-Queue-Id: 7AA1B4F7103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Hi Mykola,

>>> xen/arch/arm/arm64/head.S | 24 ++++++++++++++++++++++++
>>> 1 file changed, 24 insertions(+)
>>>=20
>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>> index 72c7b24498..596e960152 100644
>>> --- a/xen/arch/arm/arm64/head.S
>>> +++ b/xen/arch/arm/arm64/head.S
>>> @@ -561,6 +561,30 @@ END(efi_xen_start)
>>>=20
>>> #endif /* CONFIG_ARM_EFI */
>>>=20
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +
>>> +FUNC(hyp_resume)
>>=20
>> I think we should mask all exceptions here:
>> msr DAIFSet, 0xf
>>=20
>> until we resume correctly the status (VBAR_EL2, etc).
>=20
> This was discussed in an earlier version:
>=20
> https://patchew.org/Xen/cover.1741164138.git.xakep.amatop@gmail.com/2ef15=
cb605f987eb087c5496d123c47c01cc0ae7.1741164138.git.xakep.amatop@gmail.com/#=
CAGeoDV97no7mXSKd7auFu5E85wSXAHKWvqGW2=3D-VEAbkrTyU8Q@mail.gmail.com
>=20
> For SYSTEM_SUSPEND, PSCI ties the call semantics to CPU_SUSPEND. In
> particular, section 5.20.2 says that the caller must observe all the rule=
s
> described for CPU_SUSPEND, and section 6.4 explicitly says that the initi=
al
> state rules also apply to SYSTEM_SUSPEND.
>=20
> For the return Exception level on AArch64, section 6.4.3.3 requires
> SPSR_ELx.{D,A,I,F} to be set to {1, 1, 1, 1}. Therefore Xen expects to en=
ter
> this resume path with DAIF already masked by PSCI-compliant firmware.
>=20
> I agree this assumption is not obvious from the code, so I will add a com=
ment
> at the resume entry point to document that this path relies on the PSCI i=
nitial
> core configuration requirements.

Yes please, something along the line of

/*
 * PSCI SYSTEM_SUSPEND follows CPU_SUSPEND initial-state rules.
 * On AArch64, firmware must return with SPSR_ELx.DAIF set, so
 * PSTATE.DAIF is already masked on entry here.
 */

Cheers,
Luca


