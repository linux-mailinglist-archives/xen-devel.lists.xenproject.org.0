Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A0E7F733F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:00:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640596.999026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6UqH-0007me-Gx; Fri, 24 Nov 2023 11:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640596.999026; Fri, 24 Nov 2023 11:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6UqH-0007iQ-D8; Fri, 24 Nov 2023 11:59:29 +0000
Received: by outflank-mailman (input) for mailman id 640596;
 Fri, 24 Nov 2023 11:59:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vqky=HF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r6UqG-0007iI-DJ
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 11:59:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9a95b22-8ac0-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 12:59:25 +0100 (CET)
Received: from DU2P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::30)
 by AS2PR08MB10351.eurprd08.prod.outlook.com (2603:10a6:20b:579::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Fri, 24 Nov
 2023 11:59:13 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::50) by DU2P250CA0025.outlook.office365.com
 (2603:10a6:10:231::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 11:59:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 11:59:11 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Fri, 24 Nov 2023 11:59:11 +0000
Received: from d46e7a75fa8a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D99FEB88-50E6-4E8C-9C89-2E644C5CE1F5.1; 
 Fri, 24 Nov 2023 11:59:04 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d46e7a75fa8a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Nov 2023 11:59:04 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GVXPR08MB10474.eurprd08.prod.outlook.com (2603:10a6:150:151::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 11:59:01 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 11:59:01 +0000
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
X-Inumbo-ID: e9a95b22-8ac0-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VGwKj084OJRahDg3chNGRUpRqioHqFpKLRzDmXjsZ7EAwInhj4YgYRJdmT1O426QIb0RSiavTQWJpHwZOfjAkvSoykZyB5jIYeKV3KGyBmuqTR6JuOuKxa1cAyHNYvlnmOflM8JSb9zEhs1N2/a0c+XoA/rUQaQ5zj9LM1n7chpp9VzGjCe3ephC2S+Wr40CgSYzJ65ANCtrsgb/mi86+CZvte+69qqVPQMQOuX2BysISAAFJdGM3IEl7KNXuGNv4N/D1vpnQN8vtn8GZ7/Sep1zCIRCKsw3eE+fRau7Jutxs4Agoa+6LH4kCd1SwevZCL+BKTDgbNGTgM74ppi4GA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdCCZbIeGHEQ9y1LwUZvXHWLTf7cMQ95NVDeLP7055U=;
 b=bOBBhhUeRw5xf9xItGeZ2iya+2y/HWc1hfpV2ANQv4ggG7Ynpcrf0ExpqHvxwnt0yTzJvhWr+QuN666wJifhTitarH+0o/8kw7ve3C6sFZZMzaUKO6+8EXhBhIXhiKao11UgpEMLjzurzZhmZo7Cdq0LspRp5oDy/lvcedmuIjT+pHdHRnr0ziZT04Du1oM63mcfSMMJPt808JYSniWVHjz4E/199suaHltpJZBj/o8zyYZAwo2P3IpY/VEjtsc+TBTSbjGhkTOcvxMno/nPCczgYt99cnUhUl7wuV75kPgp7kvgDm+PGSSvGZXmukSIyK5VI2RPxjMtjTicEm/wPQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdCCZbIeGHEQ9y1LwUZvXHWLTf7cMQ95NVDeLP7055U=;
 b=E5ZCtlNfnSh8oTurapzt/pDsAGpKmE6iGW5nuOLhLkMfqZpIdaOls4HneZAZ8X5U2jnK7Bo+BQjunEHmpH9R7B0/b/myNGetPFCdppeSbGcXtjpLKU9PIBVBFgUes4d9boi5phlYvfeeU53ib/CQQvI1nFrvcTMhXzpiX/XCBYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14bac7e7963564ae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCjgikWeFvCYCR09VdqvXoj7BiwyW2mT/KIJ+X95X1pMu7Z/wyKyIpWlXH0y65y+MfJhlSQ4IwC9ujAVBo6UltjKzZvzYeaC7ZV0YLS+xJSjC3mjSt6agu+QGzFkNtLljwcVFCDNA8gw+zL35l4GEHIkkshZqTQCeybkBXYGRZ0uP7tuvIEuS6toomLRYEfMHjb+HZQgO6ylGDvX63X5LHxVf7PAegPjlWmFMH7fXKI2m+211Yq6Bu+9AvArerfpkYFpkPCRra3h5GM4JAmD0eskKzzqurIvkBTR9/4qzxtwJ2Bx9gTZqeH9EeTRGsHsFIdhJYuLP5RIhlg/m2j7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdCCZbIeGHEQ9y1LwUZvXHWLTf7cMQ95NVDeLP7055U=;
 b=h4+A4+Uj/tRp/gkSL3BML3Bc65An+eqpq/tmULyuAJsGhJneVwX1ioN3EMuxmqFf6Ex2xaJ+mwr7RoktwGWh1yYVubwA7RpJxWK86ajR3ZJ5O3ZRpVdcEXxNmi1QKQThz4Hl6aDBa0JePku0Vg/CSLbvWTPD9RnxHNklH38mYJCADQ0fARNyBpujeX52I1jI+DEOZhkRAiKVvGjtYgBjvfATMAOnrKe60C22mYW/sBr2v42jVZA9FOrbPMaNmoYylshmtlLuzghJ9yI+nhMYqo37DbY6sOyqi+T7PpdV94aIMG+Cbei02oj1BQc8mhlXgF7Ss5AtDnwFtDHp3E21jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdCCZbIeGHEQ9y1LwUZvXHWLTf7cMQ95NVDeLP7055U=;
 b=E5ZCtlNfnSh8oTurapzt/pDsAGpKmE6iGW5nuOLhLkMfqZpIdaOls4HneZAZ8X5U2jnK7Bo+BQjunEHmpH9R7B0/b/myNGetPFCdppeSbGcXtjpLKU9PIBVBFgUes4d9boi5phlYvfeeU53ib/CQQvI1nFrvcTMhXzpiX/XCBYI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: George Dunlap <george.dunlap@cloud.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>, Wei
 Liu <wl@xen.org>
Subject: Re: Clang-format configuration discussion - pt 2
Thread-Topic: Clang-format configuration discussion - pt 2
Thread-Index: AQHaHhwDfni7SbjBtk6S7YLD/w4HebCJUeoAgAANCgA=
Date: Fri, 24 Nov 2023 11:59:01 +0000
Message-ID: <DE78DF95-3E57-4283-8252-01A0BA2219F8@arm.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <CA+zSX=YL0fjM+ZTEoXNpzQ9iFKFwzdZRR-QsyQAZCQVeOGdj6A@mail.gmail.com>
In-Reply-To:
 <CA+zSX=YL0fjM+ZTEoXNpzQ9iFKFwzdZRR-QsyQAZCQVeOGdj6A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GVXPR08MB10474:EE_|DB1PEPF00039233:EE_|AS2PR08MB10351:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d7e218-6013-452b-05b8-08dbece4c5de
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jk4tMHQ7RDE/f6AJ438/08upXcYOahsFB+XtKilrS7QiDwtuIyWDsWNBMywrCbXj4qL7i1Qni3GrWBYcf+YWgTbGwFnksb/JejYgxmuBQy3sBG/yFIyXjHVEnCyr/DYE5GO5n+Rt3Y3jscN/BBZDJqB6MjuHWWEwwPX7aA4+VpA5vhZraPr8atxfqJnC/ePEpqkoIjOpdCov9PA7w+Xh/V0/Tu5PC7C9ww+eS5BAX6N6rlPhuX32xIDoMLXJN9OxyTdCkHlnBGVw2YmLVSt6ZdbyBSRD5VL+kBQ+vaNRxptAxeQnSPi1ZIATZJytvOpChzn0+nfEUjcjwrTC6/wZDTbhVCTNUXBYbLgzf3WjE2ZKnR3JRts4lyYoC6Q69IwU9QgSN1SUlxIa04NnxwAbDHocIkI8mf10gx/ap//6DNiwqYgXCiOkD6X/6vz+zKP0e0tuvPUX0vWcPRjo+ZxwvgA2gDFxy2Ps5/H+YIUWxbnAP88S8D23xcS1zrOV/twLqxdLJeJwR8Wdx9wbZ6g4e9Bd2Bu/4sNOVRVQIVBEvF2Dk0G0pV47qc6gu7K9S0RKHyCuZGbYEBmjt9zJHeQUNutxXqxSqDZTYVuYxy9kJJPDP2vt5L/3UmaSIrbMiOIcyD1GAzA3s+2wEpZrvR7FugsVuBMucE1pLuAvfP9ObUw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(36756003)(38070700009)(122000001)(41300700001)(83380400001)(33656002)(8676002)(66476007)(6916009)(66946007)(64756008)(76116006)(66556008)(91956017)(54906003)(66446008)(316002)(4326008)(86362001)(2616005)(8936002)(478600001)(966005)(6486002)(6506007)(71200400001)(38100700002)(6512007)(53546011)(5660300002)(2906002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FBEA478C5CD59489EEF9CC6357B8DA7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10474
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4c1eaf41-3545-49be-dc6b-08dbece4bfbb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kHk5I4ugZq3XtNU+PDFLt8ZR2i6WVgBmH1HRKJ0tcCVNvY6YwvKbwf1VtQ8oRip9rEMmJ6vY0ix2mtYeWJjwcd9Cd5w5FzfyftWzb4xE+4c6MHeoSE5HqUjHme2Qk0QChWKV967ruTYatHsnUVDaLLx7XCpEMcFse+iIpWmETLD+XPGP0mHc5mP/DjKk1H4VSZtNPC/doB406ea8Jt9s9wZy/I5FQNgnaZGQB5IjyvfWiVTksCpBImD6T8rvRKi0Fosb0kG4ME/l6qzPRmoxTW9uJ4KtIPuxou/Z7gOcT2CM7SCcocvlD7EJEA/FgyGfm02Ot6UCuOgs2om3vBmGXLhTrXEuox4SorJ900NCatwHhoZc/KOTfjiAd+CwLt7xDzIx36NdQDPt3t9WStDoJ3As/Cn4YvkgfW1Ej2AnzC8aQZxHGWTtLr+D2vY4ETQEHRR4EUZd+NWpUCVzEs7ZKVthZCwbt8mJLipr3W8MYQHsq8fkSVpKJliC9j2r0zEZUktQqbkFFUbyTirn8ahjvBjw/ZrTGlRr/SHQqikP9+xL9d7QYgozrL7dsy2txgzJJNalxixnbltGNgdOzhrEjVCNzGo3BMt1FQY8dtS6LupDfmRJEAe7UIYYKxqniQ7dhLIMnbzMJPV3/765SGOZJ+Vr7D0FND0wPFmH60+SvFHmXvrK5UDWOfWuOgyCmTW4j88CyUgh6DC1QMItL/GDyFmarDmGKlmFM2f4xJ+cql/CWt8t5HkERl3FqGWwm+3evVYttMNw1Gvs6Zp0717HgA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(1800799012)(82310400011)(186009)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(5660300002)(2906002)(4326008)(8936002)(70206006)(6862004)(70586007)(316002)(8676002)(41300700001)(6486002)(966005)(6506007)(478600001)(53546011)(26005)(40480700001)(2616005)(54906003)(6512007)(83380400001)(336012)(40460700003)(36860700001)(47076005)(81166007)(356005)(36756003)(33656002)(82740400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 11:59:11.9261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d7e218-6013-452b-05b8-08dbece4c5de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10351

DQoNCj4gT24gMjQgTm92IDIwMjMsIGF0IDExOjEyLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNsb3VkLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIE5vdiAyMywgMjAyMyBhdCAyOjQ4
4oCvUE0gTHVjYSBGYW5jZWxsdSA8THVjYS5GYW5jZWxsdUBhcm0uY29tPiB3cm90ZToNCj4+IEFs
aWduQ29uc2VjdXRpdmVBc3NpZ25tZW50czogTm9uZQ0KPj4gDQo+PiAtLS0NCj4+IFRoaXMgb25l
IGlzIGRpc2FibGVkIGJlY2F1c2Ugb2YgZmVlZGJhY2tzIGZyb20gU3RlZmFubyBhbmQgQWxlamFu
ZHJvIGFib3V0IHNvbWUgd2VpcmQgYmVoYXZpb3VyIG9uIG91cg0KPj4gY29kZWJhc2UuDQo+PiAN
Cj4+IFRoaXMgb25lIGNvdWxkIGJlIHBoYXNlZCBhbG9uZyB0aGlzIGxpbmU6IOKAnENvbnNlY3V0
aXZlIGFzc2lnbm1lbnRzIGRvbid0IG5lZWQgdG8gYmUgYWxpZ25lZC7igJ0sIHRoZSBpc3N1ZSBp
cw0KPj4gdGhhdCBpbiB0aGlzIHdheSBpdCBzZWVtcyB0aGF0IGl04oCZcyBvcHRpb25hbCwgYnV0
IGNsYW5nLWZvcm1hdCBpcyBnb2luZyB0byByZW1vdmUgdGhlIGFsaWdubWVudCBhbnl3YXkgZm9y
DQo+PiBhc3NpZ25tZW50IHRoYXQgYXJlIGNvbnNlY3V0aXZlIGFuZCBhbGlnbmVkLg0KPiANCj4g
SXQncyBoYXJkIHRvIGFncmVlIG9uIHRoaXMgb25lIHdpdGhvdXQgc2VlaW5nIHNvbWUgb2YgdGhl
IGV4YW1wbGVzIG9mDQo+IHdoYXQgaXQgZG9lcywgc29tZSBleGFtcGxlcyBvZiB0aGUgIndlaXJk
IGJlaGF2aW9yIiBTdGVmYW5vICYNCj4gQWxsZWphbmRybyBmb3VuZCwNCg0KSSB0aGluayB0aGVy
ZSB3YXMgYSBjb21tZW50IGZyb20gU3RlZmFubyBmb3IgdGhlIFJGQyB2MToNCmh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvY292ZXIvMjAyMzA3MjgwODExNDQu
NDEyNDMwOS0xLWx1Y2EuZmFuY2VsbHVAYXJtLmNvbS8jMjU0NDc2MjUNCg0KPiBhbmQgc29tZSBl
eGFtcGxlcyBvZiBwbGFjZXMgd2hlcmUgaXQncyBnb2luZyB0bw0KPiByZW1vdmUgdGhlIGFsaWdu
bWVudC4NCg0KSGkgR2VvcmdlLA0KDQpZb3UgYXJlIHJpZ2h0LCB3aXRoIGFuIGV4YW1wbGUgaXMg
YmV0dGVyLCBzbyBJ4oCZdmUgY2hlY2tlZCBpbnRvIHRoZSBvdXRwdXQ6DQpodHRwczovL2dpdGxh
Yi5jb20vbHVjYS5mYW5jZWxsdS94ZW4tY2xhbmcvLS9jb21taXQvODkzOGJmMjE5NmJlNjZiMDU2
OTNhNDg3NTJlYmJkZjM2M2U4ZDhlMS5wYXRjaA0KDQpBbmQgZm9yIHRoaXMgb25lLCB5b3UgY2Fu
IHNlZSBoZXJlIG9uIGxpbmUgNjE4NiBvZiB0aGF0IHBhdGNoOg0KDQpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQpp
bmRleCA0OTc5MmRkNTkwLi5jMjI5MzE4NDUwIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jDQorKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCg0KWy4uLl0N
Cg0KQEAgLTMzMzMsMTkgKzMzMTgsMTggQEAgc3RhdGljIGludCBfX2luaXQgYWxsb2NfZG9tYWlu
X2V2dGNobihzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGUpDQpyYyA9IGV2dGNobl9hbGxvY191
bmJvdW5kKCZhbGxvY191bmJvdW5kLCBkb21VMV9wb3J0KTsNCmlmICggcmMgPCAwICkNCnsNCi0g
cHJpbnRrKFhFTkxPR19FUlINCi0gImV2dGNobl9hbGxvY191bmJvdW5kKCkgZmFpbHVyZSAoRXJy
b3IgJWQpIFxuIiwgcmMpOw0KKyBwcmludGsoWEVOTE9HX0VSUiAiZXZ0Y2huX2FsbG9jX3VuYm91
bmQoKSBmYWlsdXJlIChFcnJvciAlZCkgXG4iLCByYyk7DQpyZXR1cm4gcmM7DQp9DQotIGJpbmRf
aW50ZXJkb21haW4ucmVtb3RlX2RvbSA9IGQxLT5kb21haW5faWQ7DQorIGJpbmRfaW50ZXJkb21h
aW4ucmVtb3RlX2RvbSA9IGQxLT5kb21haW5faWQ7DQpiaW5kX2ludGVyZG9tYWluLnJlbW90ZV9w
b3J0ID0gZG9tVTFfcG9ydDsNCnJjID0gZXZ0Y2huX2JpbmRfaW50ZXJkb21haW4oJmJpbmRfaW50
ZXJkb21haW4sIGQyLCBkb21VMl9wb3J0KTsNCmlmICggcmMgPCAwICkNCnsNCg0KQXNzaWdubWVu
dCBvZiBiaW5kX2ludGVyZG9tYWluLnJlbW90ZV9kb20gd2FzIGFsaWduZWQgd2l0aCB0aGUgZm9s
bG93aW5nIGxpbmUsIGJ1dCBzaW5jZSB0aGUgdmFsdWUNCm9mIHRoaXMgY29uZmlndXJhYmxlIGlz
IOKAnE5vbmXigJ0sIGNsYW5nLWZvcm1hdCBpcyBtb2RpZnlpbmcgdGhhdCB0byB1c2Ugb25seSBv
bmUgc3BhY2UgYmVmb3JlIHRoZSBhc3NpZ25tZW50DQpvcGVyYXRvci4NCg0KDQoNCk9uZSBleGFt
cGxlIHJlbGF0ZWQgdG8gbWFjcm9zIGNhbiBiZSBmb3VuZCBvbiBsaW5lIDE2NjM6DQoNCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaW5zbi5jIGIveGVuL2FyY2gvYXJtL2FybTMyL2lu
c24uYw0KaW5kZXggNDk5NTNhMDQyYS4uMTYzNWM0YjZkMSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNo
L2FybS9hcm0zMi9pbnNuLmMNCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9pbnNuLmMNCkBAIC0x
OSw5ICsxOSw5IEBADQojaW5jbHVkZSA8YXNtL2luc24uaD4NCi8qIE1hc2sgb2YgYnJhbmNoIGlu
c3RydWN0aW9ucycgaW1tZWRpYXRlLiAqLw0KLSNkZWZpbmUgQlJBTkNIX0lOU05fSU1NX01BU0sg
R0VOTUFTSygyMywgMCkNCisjZGVmaW5lIEJSQU5DSF9JTlNOX0lNTV9NQVNLIEdFTk1BU0soMjMs
IDApDQovKiBTaGlmdCBvZiBicmFuY2ggaW5zdHJ1Y3Rpb25zJyBpbW1lZGlhdGUuICovDQotI2Rl
ZmluZSBCUkFOQ0hfSU5TTl9JTU1fU0hJRlQgMA0KKyNkZWZpbmUgQlJBTkNIX0lOU05fSU1NX1NI
SUZUIDANCg0KQ2xhbmcgZm9ybWF0IHNlZXMgdGhlIGNvbW1lbnQgYmV0d2VlbiBCUkFOQ0hfSU5T
Tl9JTU1fTUFTSyBhbmQgQlJBTkNIX0lOU05fSU1NX1NISUZUIGFuZA0KZXZlbiBpZiBiZWZvcmUg
dGhlIHZhbHVlIG9mIHRoZSBtYWNyb3Mgd2VyZSBhbGlnbmVkLCBpdCBhcHBsaWVzIHRoZSBydWxl
IG9mIG9uZSBzcGFjZSBiZXR3ZWVuIHRoZSBtYWNybyBuYW1lDQphbmQgdGhlIHZhbHVlLg0KDQo+
IA0KPiBJIGhhZCB0cmllZCB0byBhcHBseSB5b3VyIHNlcmllcyBiZWZvcmUgYW5kIGRpZG4ndCBn
ZXQgdmVyeSBmYXIgd2l0aA0KPiBpdCBmb3Igc29tZSByZWFzb24gSVNUUi4NCg0KSWYgeW91IHJl
YWNoIG1lIHdlIGNhbiBzZWUgd2hhdCBpc3N1ZSB5b3UgYXJlIGZhY2luZywgSSB0aGluayBzdGFn
aW5nIHdlbnQgYWhlYWQgc2luY2UgbXkgbGFzdCBwdXNoLA0KYnV0IEnigJl2ZSBwdXQgYSBTSEEg
aW4gdGhlIGNvdmVyIGxldHRlciwgYW55d2F5IEkgY2FuIGhlbHAgb24gdGhhdCBpZiB5b3Ugd2Fu
dC4NCg0KDQo+ICBPbmUgd2F5IHRvIHNlZSB0aGUgZWZmZWN0IG9mIGluZGl2aWR1YWwNCj4gZmVh
dHVyZXMgd291bGQgYmU6DQo+IA0KPiAxLiBNYWtlIGEgYnJhbmNoIHdpdGggb25lIGJpZyBwYXRj
aCBhcHBseWluZyBjbGFuZy1mb3JtYXQgZm9yIGEgZ2l2ZW4gc3R5bGUNCj4gDQo+IDIuIENoYW5n
ZSBqdXN0IG9uZSBzdHlsZSBsaW5lLCByZS1ydW4gY2xhbmcgZm9ybWF0LCBhbmQgY3JlYXRlIGEg
bmV3DQo+IHBhdGNoIGZyb20gdGhhdA0KPiANCj4gVGhlbiBpdCB3b3VsZCBiZSBlYXN5IHRvIHNl
ZSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB0d28uICBJdCBtaWdodA0KPiBhY3R1YWxseSBi
ZSBlYXNpZXIgZm9yIGluZGl2aWR1YWwgcmV2aWV3ZXJzIHRvIGRvIHRoYXQgb24gdGhlaXIgb3du
DQo+IHRyZWVzLCByYXRoZXIgdGhhbiB0byBhc2sgeW91IHRvIHRyeSB0byBnZW5lcmF0ZSBhbmQg
cG9zdCBzdWNoIHBhdGNoZXMNCj4gc29tZXdoZXJlLg0KPiANCj4gLUdlb3JnZQ0KDQo=

