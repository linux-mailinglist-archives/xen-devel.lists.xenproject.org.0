Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CBC8A1FA4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 21:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704184.1100416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv0KN-0004D9-KD; Thu, 11 Apr 2024 19:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704184.1100416; Thu, 11 Apr 2024 19:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv0KN-0004BX-Fp; Thu, 11 Apr 2024 19:43:19 +0000
Received: by outflank-mailman (input) for mailman id 704184;
 Thu, 11 Apr 2024 19:43:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RFZQ=LQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rv0KL-0003vH-Ma
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 19:43:17 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2606::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bce71aed-f83b-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 21:43:15 +0200 (CEST)
Received: from AM6P194CA0049.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::26)
 by PA6PR08MB10624.eurprd08.prod.outlook.com (2603:10a6:102:3d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.53; Thu, 11 Apr
 2024 19:43:13 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:209:84:cafe::7e) by AM6P194CA0049.outlook.office365.com
 (2603:10a6:209:84::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Thu, 11 Apr 2024 19:43:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Thu, 11 Apr 2024 19:43:13 +0000
Received: ("Tessian outbound a35d20b28d50:v300");
 Thu, 11 Apr 2024 19:43:12 +0000
Received: from 9593e0edad37.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DFA43A8D-08BA-4CF7-B16E-F7E0EA0B39A6.1; 
 Thu, 11 Apr 2024 19:43:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9593e0edad37.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Apr 2024 19:43:05 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB8129.eurprd08.prod.outlook.com (2603:10a6:150:93::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 19:43:03 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 19:43:03 +0000
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
X-Inumbo-ID: bce71aed-f83b-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ECzkhhiGFjKSBZp+CIuPDFv1+3QCfCXdeJfe4G7OY9nawYr+OkzvRP5iXYKafrnnZ91tJrGDjHg82FvrNopj2JSdVvsO8wlStjJku/9qg16qbo+3RpmPPY8i7sV/hhsNwXhqssi0UEDqnzUei5uPrf4HU8ervjlGEvMKIVAPtBr19ZG6ZhPSZmFocHyvHEN79xeFED+YOvUEzm1kllidG1DC2VyNJloltExFI59eWyFp6qQ+yUGh0QZSwRJEB3+T5RrNAP35oYSeDUYRBPQKPDvDzFGw9MWpCYZpjQUuv43lOBygN6dp2azNtUO8dt9UHYdw59jmHsQbDxXoS6Yrog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XZUo5+4/X9ukIpEB25eh7G1VHUHBuYkYHmvfsCpbbA=;
 b=aaCXurSDii4Z+RxcAdugsF+rfIXdDeCYIeW69ks+DpEECAOixF5BzH5Hh3c9ZV7MlrZtNkqlbh8iZUN7vjSoWUunkzWbnQMCvmgv7MeLS5DZF00jb3ZYne/mkTMR892Rm3tVutq+9MZVIn0G9D7wS5aijrC693a8uz1eVpHcF/KIDQLfpOdqLmXd+BDxsXzwmr0UJUqAR6P9A07zdSs71M0kSw+DEwr1lJzytEtK/NDnGpJ4xc3aM0pgyaYoFPd5L489R1VhqMINx+wi9B5oONF6sd5Afhc+N0jd1rzY2wFGFFrZRjQ7c5F9DqMt0u29bYC/XcJmNuHx3dtJ/90Pvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XZUo5+4/X9ukIpEB25eh7G1VHUHBuYkYHmvfsCpbbA=;
 b=Et610zP3+b6nsHNixwvVuzJDmSCMo8jUFcC3abCqY8KQs3fwyVYKqmR9POPmbErGLNEQxB23TGKzAOOPsTgvJLHhy1NQrnqpROusxflvCrK2IQG0BguBO2QyU3wzEeIWDK9UHxTTPuyttsGamfe2HGhA4zXx07W1zdOElpTuSN0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e42fa407eb9de45
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UH4V4+xam9PkarsUHMpclmjw0oOIjwP7+aWFYFSgDgvj98ogMLsEvlH1mZrKx/W+hyCvxmnQz5vk+T6IQr2Z7jvoxmBWbPig+LMZZar/+KAa9kwx5Th4AHk58qKWozxJxCZkllfgPBmW+IBxsrbwCdb8/SXIw8wwzYNS6bmtCqRlthEbRH2dB3KHXKvb6QRouGeryLMnwyk7o6neOjfu8uYY5eYnPjAe6nOZd+SLAwzNCObLW+KmVgXMYolDsUs6IE/mR7mPCaRpGWjxB0rdG0yyCwEN1aKCIzIoFhjAQRiAjYsRlY8uDy8jchsszAMVu0SU/dTK47ddilXxMBwBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XZUo5+4/X9ukIpEB25eh7G1VHUHBuYkYHmvfsCpbbA=;
 b=OcGGFepHTNUmn93qwuVfvYInLB5zIDad1zN0G3yUMtNatNLdfDj4kXPE71VLCVdfx8l+U5DqEhnDT0tHZqF5pDnes5WsaMgTN0aq/i8BQhkDoQYBfaf1A/DjgW4i4adoufwwE6QtWTvhZFDzCqU12lYrXz7qoHmnAtY7/wgsAakl27WLXZnhAGzNnnSo2msJ+zok6Y8FrzlhHd4ubC0ejNnUXawZsZy+pIQZF1no4ePZ6HbSiuVSpmx+21iydttIVYMOkNrxsfS/RWGxM5gNRoerilOa7SEllScyM8PNEdOlWsJew96nGryX4Q9llQI4M0RydrdMx7//x4kAjHwCPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XZUo5+4/X9ukIpEB25eh7G1VHUHBuYkYHmvfsCpbbA=;
 b=Et610zP3+b6nsHNixwvVuzJDmSCMo8jUFcC3abCqY8KQs3fwyVYKqmR9POPmbErGLNEQxB23TGKzAOOPsTgvJLHhy1NQrnqpROusxflvCrK2IQG0BguBO2QyU3wzEeIWDK9UHxTTPuyttsGamfe2HGhA4zXx07W1zdOElpTuSN0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/5] gzip: colocate gunzip code files
Thread-Topic: [PATCH 1/5] gzip: colocate gunzip code files
Thread-Index: AQHajCSYwHdHlHteY0Sfgy/E9d+Go7FjOomAgAAt2ACAABA4gA==
Date: Thu, 11 Apr 2024 19:43:03 +0000
Message-ID: <8055E1FC-38DA-4534-BE04-F22AFC7B049F@arm.com>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-2-dpsmith@apertussolutions.com>
 <AA1FBA57-A643-4758-B99A-B59181B6329A@arm.com>
 <1552c28a-9c31-4771-94d1-20a51b2c641f@citrix.com>
In-Reply-To: <1552c28a-9c31-4771-94d1-20a51b2c641f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB8129:EE_|AM3PEPF0000A78F:EE_|PA6PR08MB10624:EE_
X-MS-Office365-Filtering-Correlation-Id: c580ea3e-a152-49e0-6a71-08dc5a5fa002
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 siyMNKjnIeJRpN3qdKqUZUYENp36iL9V8yZFR5iOvmF1g4DR3wKYdseNQe2jK3wx2a+VQDzvtRkeORzH6Qp5FJvPxOEiUJgErO9KsfgKpOeM0ZohGaX7mavNus6HQRnmosOFNMay2PvYIh1PhFWLMxcpLeElwwBY3kgRrzJu589hq/OiefGwBC4nWz/t+B6lG1OcdkMFfyeYLDmWt4A98y1IwpCLmfLGJyES5Xcu18dtsnSr6+O9Tsu7nyPX+4Rq0lG55p6sH5ZdgZz0MJeCCTleBRiaNga0eLHb4ypnStCWcoCP3cM09lyrsl2dUr+EJfVGEO2BBLdf1pcCFGd8Cxzu2oF7vQQo2eNlD08iWfoDkLOSEA80gmSkkraHed3Pxubo90yCgojQUAFjd/VPVrmcu04bn/Uaxw7cEFyatl1oHFay0eeSDpsRrB4yQc0NvUQIf4H77C8GL/044C8d4cUkpLMNbbFHftO0fzZpSyVNiueuS5QOCtCrtM3xw05qAonKWyQr1+WiE5jnCQunBfmaT9A4TC+DhyDtz52Z1QhczC+yi5B/CO/n702fIVnfwK+vTtQ1GL1vBeeyzFGFzd54El7doUrXVViOJWzAsltL+hBxLNUW/qHTFKPolJD4hq78KRb9xVbPVR9ehqLiMHtZebMT5G2SAXXzZWo/c+5gJ8wYhgHUGGhYQf9ytAbR5DTTnt1Kh1jz7mcuwYXpUuxRqFZyb2nePJ9I4+tRUG4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4508A0D341A7764EAA14644E237446B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8129
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d93c2e80-6d79-45af-d83b-08dc5a5f9a27
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i0g2HZJ6ZtWcfzqCa7m9paAApWz2ALxAlim77sG/d8QyNNhK40KSb2lCvOVqsXZAg6Mve/yZbbCDLmfpJo6DTdvZgNEmeGbodtI/fyXgwDcjQu5H2y5cYt4z2kfgz0xkY2V5fgTZn3QZb1g3OTv9tt4iZafdKoehsryzSwwfFMBPSQ04eYRR5hyDq/mi773JxxHi9Swa6U5fTFNPPGyw68r3I28UjNSkM0QibkphmZF6QOIVvcCrq/vW1Un5BstH7Tmv8qCs2Hv6Q3ZRmt19BDaUDr4+b7SoPsYwYJTV9G5EbbcLbE2k/8kZ9RLUAS7XCf5YE6AWz15pT4/mk38GPE3wkDBv2lGVsB7fFZ/OtUVTvodxEb2UAhbqn5SaoBXm0tss0zUJb4COg9VzijLrIxdka/jYJPavrWpvdiSDQlLZ99aOHCRQ2KbczS7AjuVPQICHQYvatSbZ9USSuWcINBOoMopL6bsU2RFBp+4Jyj0kCGIG0vWqN9WwzfZyphbeRqg+0E6zH72OSx13b4mK/Y63yF2qL8K2lVFfcgX9lG2K3K1ery16rQ9JmasinXX7iKagUt/ErGoCdR8aizRba+xm1j9T1SeLzy6sg7z5MuXIMAwhElTIiSOd754GFabDZBjGZ1s5rxHutSm3RW2EN22AlLaEYgND+RpYBbUVA4vbNDESBlQfQWJMuS5BcnzFTO+ZEEAxunr3DJ7oECCpvodanKhd9qRbJ1iBNp4Dbza30us85qyqMVLhwkCrzQrz
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 19:43:13.2204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c580ea3e-a152-49e0-6a71-08dc5a5fa002
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10624


>>> create mode 100644 xen/common/gzip/Makefile
>>> rename xen/common/{ =3D> gzip}/gunzip.c (100%)
>>> rename xen/common/{ =3D> gzip}/inflate.c (100%)
>> For inflate.c you will need to update also docs/misra/exclude-list.json
>=20
> Something like this?
>=20
> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
> index 36bad9e54f7d..095636415897 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -118,7 +118,7 @@
>              "comment": "Imported from Linux, ignore for now"
>          },
>          {
> -            "rel_path": "common/inflate.c",
> +            "rel_path": "common/gzip/inflate.c",
>              "comment": "Imported from Linux, ignore for now"
>          },
>          {

Yes indeed

