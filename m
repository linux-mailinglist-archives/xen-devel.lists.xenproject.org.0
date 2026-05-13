Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDPIKD6GBGrVKwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:10:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7632A534BC9
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308107.1579650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAHU-0003BV-Q5; Wed, 13 May 2026 14:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308107.1579650; Wed, 13 May 2026 14:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAHU-00038y-NN; Wed, 13 May 2026 14:09:48 +0000
Received: by outflank-mailman (input) for mailman id 1308107;
 Wed, 13 May 2026 14:09:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNAHS-00038s-HM
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:09:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNAHR-000mxS-UO
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:09:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a04861a-bab6-0a2a0a5309dd-0a2a4505d0c0-48
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:09:45 +0200
Received: from [40.107.162.58]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a048629-aaa8-0a2a45050019-286ba23ab93a-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:09:45 +0200
Received: from AS4P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::11)
 by VI1PR08MB10298.eurprd08.prod.outlook.com (2603:10a6:800:1be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:09:40 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::24) by AS4P191CA0012.outlook.office365.com
 (2603:10a6:20b:5d5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 14:09:40 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Wed, 13 May 2026 14:09:39 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AMBPR08MB11654.eurprd08.prod.outlook.com (2603:10a6:20b:737::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:08:37 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 14:08:37 +0000
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
 b=wKkPM54Ywb64mCG8VXRZomIGCWZUy9vgN5Rh+5Np+jx2QuWG3MCauTRqXity80fP2l7nIs3T5KHR0prdzelQW+QSy2KliLXoCCxjgIqk7SHeNY+Sc77jYtaz1Pv0YiLWjwID3n3C1n1zjXJDnrF/j1z3bccPLooDm4dwuQggOXcanSrO7ICk9ryOW6+PjTMVwUGpZ7+6fuwF0YptLiBuzcHEP60pf1Yqopv17LxRdbpY9K3uNJQnhXtaJrNun73Za9zTG1EUr6B/GKgJPiyX/KuvXZ6+PS7nMv/94ORdpqE4njWrFpJ+48ez5xrmY5Xd9+qCQnTQMAtV0MRctljkoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL4+9RzTBp0OdibY7cDOYg9n7P0dqjXUmHHEHExTaC4=;
 b=WTFxJhu1ObFEFYii43vzitJt3wPvjnGV6RHHd5lqv2GDHSLds8epO1Z1WzrCl44ZqV2VwpWLIlYKv+fO+KLJZ+6ZhLVv+dmsjXTzNg/qaFNdCNL2X11QCOHftgytitup07ptSZ38oaYzk8I9ImIY802DqA1LDT6Ho8qBbzLcL6LT1hMKabs6OoeCyZxMYP5lfScAXasXd0NOmtR8RaIhnme2cXroD1RK668W3rfeGugj2AuNtFOrb6yzj5zwPl9GBvwQpOEgTW0ZNx4c8CdymjTpLF4OIfkW7cpG81ES5ws+EvDVQ85rn0KEO5cZo1N35WM9sn4PGmfIrqRHi5tVQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZL4+9RzTBp0OdibY7cDOYg9n7P0dqjXUmHHEHExTaC4=;
 b=P1Nb8gdUlnhf5v3I31V7u+5+8IicXT0UVwvejnGBMfPfPgrh7G7tDCz2GF1FKX6Wk80T4lLf3PKPXOpZmHATnU46DqdMOmbc+i6HU3wjpkka03z4D5ZovOt2ANfb1pYwq9ZG0N3VJBGqV7cDR11wziCCZ/ISK8dOl4GJYTiiBSg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLMu3WoSwNNhsYhWK5jgeF+E9TzOWgsXeZudK5Q4332VIEAAllpq5NbyaDTP64PxlpzxNShbnptbuohx/PezKUaYRDESWQYImpIeRmwtI7p45HRggaANFmUm6ptFnMvwTSyA3cnJdEuodsO2B6NWSPv8cdsICuZjau7L15O4/zVA5j9pB8+yBxH1AwjCA5vyOaA70RJmZTKUceUm9X1JMmQ8zsCQx2THnRp2+nsWeLUd2I4tqI12/bsBvDPIhpMw4+vFEWLBO1ZGdpqWeKU+alwFMqbOO+dBSXfJR2/6RdfnQmeaKsis5xPSS3Gu8MIWCbqKMuE34ErlicpkoX5Onw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL4+9RzTBp0OdibY7cDOYg9n7P0dqjXUmHHEHExTaC4=;
 b=bpop2uDrmmW0xFIcXxuqP78rrwOjsBinFeoQLx/DlaoZV52W0G4zI8YT36IPONPYG8ok+rcfg/IrmrkwlLZM3yADPA7ilinSX0jP0/kIdhzo8R25lq9uqDFUpypJsUSx0Sohud1Yp38LCE9DCEpY3sADFFU3H+yahg0zuxXTBvPhoX43vBXZYek7leflibcL0So5ybIHZlY4xCkDY1Tbdrc6Bi/uQkqd90B3VDlu8Sjh7GNLCcjidSKQJRSgYsvCiA4AF46Aym2F+RfAfiKHfGGOvJeVzNWe6ZnVzhp5dTNStAjYFx1SZmvWchfH9EToQxSf0QaO6fRMUxv3zKhBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZL4+9RzTBp0OdibY7cDOYg9n7P0dqjXUmHHEHExTaC4=;
 b=P1Nb8gdUlnhf5v3I31V7u+5+8IicXT0UVwvejnGBMfPfPgrh7G7tDCz2GF1FKX6Wk80T4lLf3PKPXOpZmHATnU46DqdMOmbc+i6HU3wjpkka03z4D5ZovOt2ANfb1pYwq9ZG0N3VJBGqV7cDR11wziCCZ/ISK8dOl4GJYTiiBSg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Topic: [PATCH v9 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Index: AQHc4jIxK7EE6l+HQkWYC60FHhQX47YL/3OA
Date: Wed, 13 May 2026 14:08:37 +0000
Message-ID: <8E531A25-5AB5-41CD-AB61-C426C58C8E1C@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <613c8d67a66924ea62c2436dac14708d939f6784.1778605274.git.mykola_kvach@epam.com>
In-Reply-To:
 <613c8d67a66924ea62c2436dac14708d939f6784.1778605274.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AMBPR08MB11654:EE_|AM4PEPF00027A64:EE_|VI1PR08MB10298:EE_
X-MS-Office365-Filtering-Correlation-Id: af369cf1-e237-4296-552b-08deb0f945ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|11063799003|3023799003|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 SJXK3x9hx/8ZxXZilPXd4OOg3r7sOwsJwMWEwJwGpSZJpu9FW5a8xftobkEE3K4VAoueu0KqdbefgUrSc3HR2Poamj1oM4m75Zyxu/d1B7b3OYJQySRr/PjiWWVZqHYLv9Lt9PAGzSuHZwuqozpYrmbZlqxogs6dCr7ewIBDfqAAxXuomSQsccCb9edAWDyaFYfFPOZ0btdXcRrk4CKzqWlukedqYhADrBdvz0QdirEh/x8KyDfoYm9shRVMwqh448NNlQUSDGV4HzRQhCyMAPWa2J5RRI6iTeFBAJ8xImTSP5tOkPn1bzEfRyyhrK570ljhKK8W0OuwS0mRlTFW5nqnZZwYCMWFbWsH7UuyEGYLF5G23aILChdNYMuiW4aEGR5fsvfm9VjiUuv6e9lGUhWrm6/S7jpfCZkoLow0j4DL4n3H5f30jXKPyVEqdBUFPnEdYqU0uteth9aXoHwQRGRKLolTUkRvpRX6S2ErlzO/lvW1cisvm6q8uqvaNA+zXntUc+Ekm/X71qhQAcQiL4eD1bbXIQDLHcBK09Ce6suLWufGHsiGaJhEwUljo5QSf3M3FRRvr43YJB5UHrqFGzIKX8vaIXJGJvBcxNQEt0eGJFP4ZgP9yzHrJ/TuzjC7E+A4bw1nEcR0PJr9tVXRKNsnizzMmH5cdIfysDbhhlJ8in1YplM5AGd+dIG4sRvsqYwUcptX3NZ5IvjTfK0jDPFVLnWAUh/gTouC4A9s6/vkx9UhO4oSqQ+9vSXmd+ve
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(3023799003)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <684EAB3BC4066A45B220CAD2BCC87390@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 vpLHyHnzjPSY3Rit+9LVuoySkFe/fVRLGcnRpr8PoLEWFWa2Lh0yGRrTFtuFLGBZ+T93nYhquSpbUGkhXqleLu13OW1SiJED2i6i8LcvU/MNBqIA8ITDZIuqvzzPnHw6uHncy+gDAuEBhEsiEjdVgPmlfIlckie55BKjDGFCxsiuHczY7Q8Kkzu3bDtlBXBaNEgQBCyGH1IsFgmiTdFf+y6eyq5jPSurvBSHQY2pyzQ7J1oZaFrKa3bfHFJEFevC11EZOXBc27RMQUnYrSuy+jQ/mpcqRgSagn5R/gy4Wc60UimZW6CeU9wCNFZ3MzT58oPzitFHdUszRI183di3vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11654
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd135dd9-a355-4657-c24e-08deb0f92092
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|376014|35042699022|82310400026|36860700016|22082099003|18002099003|3023799003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dINLBE6m/7ervEK7Xhg37YyIRySDa7D4FJhTILkEj/lxZDzQDdNI6LCyFbk6ldqoaaIaJyytdFg5WGBSguVP5FKHkCvrXZTZIW5/aQpm+vzVei3YyM5eTfHMd7xhns/AydNFXxEFhHj02y0FCZX5Vn2vDjzgenlo1F8rQgZ6M+X6oplEW2XBSRjvUrP49D6EGudYWpU3v1CZ1+X9RFWhvZOQ/atLpQCeW80bN8BRh6pnqFKbuuQrJ1bG9GSLPDdpKW2osmsW8Nut8e7ozGTtvUt8effhQrXZkAO0NkednOfYxzamfnsHp9wurk8aOw3aqONSaCFrqfnk7DdK0lVwJkZklTpYKk2pWmOmDhN2fHcEv/EjQMD2f6kWtgImQx0pGCgHVAq01JzQRWVh/tGkR/KLw1gTunrFyWua1umLvkNs6K2042xvh1uEUIUsRmtYupuTDuIHTzm9yFNeQcoU147f5Rjwg9hTSN1khYFrwc2+727X1E9XKzC1+SouGFtmyYZZk+kH29sv7ehV/zTNOhs8DrhhGXcZ8+4YyIBEhTCxbbwUMiIBC+cn4xDK1SqeTCLhoP5+G8sd0HxJzVzdYR7MJZtEZhZJh5liMqzWLEYE/cePRL+Ymab/vpvYUJxjcxqTJTf470MpZBuR26BcDChR82xOf3Uyue3xzW9GyO1Fp/kVRi5TG3KDAl7RHefwdPjUOqhwaodTiVlzj7MfHVBgdGGrnhJ7yiwGttueOZ0=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(35042699022)(82310400026)(36860700016)(22082099003)(18002099003)(3023799003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+y6noabc7xBqJPLrLpP1xD4WA6uJxouI2HS9NQ7BUJiN+b9eCmCySIMNPa4tmHWcASn/wr2PvLwwBjChFHpFM+fRsN12uBTgKSrD2PFpn7KP6s1MKhZVTuIIO+1Z1+XWyY9otuMw2Gag/V3FYrFA5Xgig8eYmGW4+f08Xw8VSL8QfY2YuovsvuWLLZ47InTFqcwFYii6Pm17a/Js9Yyukulq2qy4h9Qww0BOliJwVzMiCye8JQVX7fn6KWQEQP1HJWl1dfU8nbri14BT8OGFkuUkqJ5ZT9F6bSG87/zaIVBkw53JnxE5Y0oN/vE9yBZLQfrwHqGJiOUW90kchd/lioqB5R+t2VrP25TzN8M7oZI0mVmqid++C4D+Jh/0XKAmUalYnYihWtvWXVKZFKojGzWBrbfUpP4yQniT1dEiDc8mIS0NjlSh0nUiSTnraI0C
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 14:09:39.8671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af369cf1-e237-4296-552b-08deb0f945ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10298
X-purgate-ID: tlsNG-c201ff/1778681385-E1D9D443-CEE6ECCB/0/0
X-purgate-type: clean
X-purgate-size: 6792
X-Rspamd-Queue-Id: 7632A534BC9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQo+ICsNCj4gK3N0YXRpYyB2b2lkIGdpY3YyX3Jlc3VtZSh2b2lkKQ0KPiAr
ew0KPiArICAgIHVuc2lnbmVkIGludCBpLCBibG9ja3MgPSBESVZfUk9VTkRfVVAoZ2ljdjJfaW5m
by5ucl9saW5lcywgMzIpOw0KPiArDQo+ICsgICAgZ2ljdjJfY3B1X2Rpc2FibGUoKTsNCj4gKyAg
ICAvKiBEaXNhYmxlIGRpc3RyaWJ1dG9yICovDQo+ICsgICAgd3JpdGVsX2dpY2QoMCwgR0lDRF9D
VExSKTsNCj4gKw0KPiArICAgIGZvciAoIGkgPSAwOyBpIDwgYmxvY2tzOyBpKysgKQ0KPiArICAg
IHsNCj4gKyAgICAgICAgc3RydWN0IGlycV9ibG9jayAqaXJxcyA9IGdpY19jdHguZGlzdC5pcnFz
ICsgaTsNCj4gKyAgICAgICAgc2l6ZV90IGosIG9mZiA9IGkgKiBzaXplb2YoaXJxcy0+aXNlbmFi
bGVyKTsNCj4gKw0KPiArICAgICAgICB3cml0ZWxfZ2ljZChHRU5NQVNLKDMxLCAwKSwgR0lDRF9J
Q0VOQUJMRVIgKyBvZmYpOw0KPiArICAgICAgICB3cml0ZWxfZ2ljZChpcnFzLT5pc2VuYWJsZXIs
IEdJQ0RfSVNFTkFCTEVSICsgb2ZmKTsNCj4gKw0KPiArICAgICAgICB3cml0ZWxfZ2ljZChHRU5N
QVNLKDMxLCAwKSwgR0lDRF9JQ0FDVElWRVIgKyBvZmYpOw0KPiArICAgICAgICB3cml0ZWxfZ2lj
ZChpcnFzLT5pc2FjdGl2ZXIsIEdJQ0RfSVNBQ1RJVkVSICsgb2ZmKTsNCj4gKw0KPiArICAgICAg
ICBvZmYgPSBpICogc2l6ZW9mKGlycXMtPmlwcmlvcml0eXIpOw0KPiArICAgICAgICBmb3IgKCBq
ID0gMDsgaiA8IEFSUkFZX1NJWkUoaXJxcy0+aXByaW9yaXR5cik7IGorKyApDQo+ICsgICAgICAg
ICAgICB3cml0ZWxfZ2ljZChpcnFzLT5pcHJpb3JpdHlyW2pdLCBHSUNEX0lQUklPUklUWVIgKyBv
ZmYgKyBqICogNCk7DQoNCmFwb2xvZ2llcyBmb3Igc3BvdHRpbmcgdGhlc2Ugb25seSBub3csIGlu
IGNhc2UgZ2ljdjJfaW5mby5ucl9saW5lcyBpcyAxMDIwLA0KaGVyZSBhbmQgYmVsb3cgZm9yIEdJ
Q0RfSVRBUkdFVFNSIHdlIGFyZSBnb2luZyB0byBzYXZlIGFsc28gSURzIDEwMjAtMTAyMw0Kd2hp
Y2ggYXJlIHJlc2VydmVkLg0KDQpDb3VsZCB3ZSBhc3N1bWUgaXJxcy0+aXByaW9yaXR5ciBhbmQg
aXJxcy0+aXRhcmdldHNyIGhhdmUgdGhlIHNhbWUgc2l6ZSBhbmQgaW1wbGVtZW50DQpzb21lIGNh
cCBsb2dpYyB3aGljaCBtaWdodCBjYXAgdGhlIGxhc3QgbG9vcCAoZXZlbnR1YWxseSk6DQoNCiAg
ICBmb3IgKCBpID0gMDsgaSA8IGJsb2NrczsgaSsrICkNCiAgICB7DQogICAgICAgIHN0cnVjdCBp
cnFfYmxvY2sgKmlycXMgPSBnaWNfY3R4LmRpc3QuaXJxcyArIGk7DQogICAgICAgIHNpemVfdCBq
LCBvZmYgPSBpICogc2l6ZW9mKGlycXMtPmlzZW5hYmxlcik7DQogICAgICAgIHNpemVfdCBucl9y
ZWdzID0gQVJSQVlfU0laRShpcnFzLT5pcHJpb3JpdHlyKTsNCg0KICAgICAgICBpZiAoIGkgPT0g
YmxvY2tzIC0gMSApDQogICAgICAgICAgICBucl9yZWdzID0gRElWX1JPVU5EX1VQKGdpY3YyX2lu
Zm8ubnJfbGluZXMgLSBpICogMzIsIDQpOw0KDQogICAgICAgIFvigKZdDQoNCiAgICAgICAgb2Zm
ID0gaSAqIHNpemVvZihpcnFzLT5pcHJpb3JpdHlyKTsNCiAgICAgICAgZm9yICggaiA9IDA7IGog
PCBucl9yZWdzOyBqKysgKQ0KICAgICAgICAgICAgd3JpdGVsX2dpY2QoaXJxcy0+aXByaW9yaXR5
cltqXSwgR0lDRF9JUFJJT1JJVFlSICsgb2ZmICsgaiAqIDQpOw0KDQogICAgICAgIC8qDQogICAg
ICAgICAqIEdJQ0RfSVRBUkdFVFNSMC4uNyBjb3ZlciBTR0lzL1BQSXMgYW5kIGhvbGQgbm8gc3Rh
dGUgdG8gc2F2ZToNCiAgICAgICAgICogdGhleSBhcmUgcmVhZC1vbmx5IG9uIG11bHRpcHJvY2Vz
c29yIGltcGxlbWVudGF0aW9ucyBhbmQgUkFaL1dJDQogICAgICAgICAqIG9uIHVuaXByb2Nlc3Nv
ciBpbXBsZW1lbnRhdGlvbnMuDQogICAgICAgICAqLw0KICAgICAgICBpZiAoIGkgKQ0KICAgICAg
ICB7DQogICAgICAgICAgICBvZmYgPSBpICogc2l6ZW9mKGlycXMtPml0YXJnZXRzcik7DQogICAg
ICAgICAgICBmb3IgKCBqID0gMDsgaiA8IG5yX3JlZ3M7IGorKyApDQogICAgICAgICAgICAgICAg
d3JpdGVsX2dpY2QoaXJxcy0+aXRhcmdldHNyW2pdLCBHSUNEX0lUQVJHRVRTUiArIG9mZiArIGog
KiA0KTsNCiAgICAgICAgfQ0KDQogICAgICAgIFvigKZdDQogICAgfQ0KDQo+ICsNCj4gKyAgICAg
ICAgLyoNCj4gKyAgICAgICAgICogR0lDRF9JVEFSR0VUU1IwLi43IGNvdmVyIFNHSXMvUFBJcyBh
bmQgaG9sZCBubyBzdGF0ZSB0byBzYXZlOg0KPiArICAgICAgICAgKiB0aGV5IGFyZSByZWFkLW9u
bHkgb24gbXVsdGlwcm9jZXNzb3IgaW1wbGVtZW50YXRpb25zIGFuZCBSQVovV0kNCj4gKyAgICAg
ICAgICogb24gdW5pcHJvY2Vzc29yIGltcGxlbWVudGF0aW9ucy4NCj4gKyAgICAgICAgICovDQo+
ICsgICAgICAgIGlmICggaSApDQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIG9mZiA9IGkg
KiBzaXplb2YoaXJxcy0+aXRhcmdldHNyKTsNCj4gKyAgICAgICAgICAgIGZvciAoIGogPSAwOyBq
IDwgQVJSQVlfU0laRShpcnFzLT5pdGFyZ2V0c3IpOyBqKysgKQ0KPiArICAgICAgICAgICAgICAg
IHdyaXRlbF9naWNkKGlycXMtPml0YXJnZXRzcltqXSwgR0lDRF9JVEFSR0VUU1IgKyBvZmYgKyBq
ICogNCk7DQo+ICsgICAgICAgIH0NCj4gKw0KPiArICAgICAgICBvZmYgPSBpICogc2l6ZW9mKGly
cXMtPmljZmdyKTsNCj4gKyAgICAgICAgZm9yICggaiA9IDA7IGogPCBBUlJBWV9TSVpFKGlycXMt
PmljZmdyKTsgaisrICkNCj4gKyAgICAgICAgICAgIHdyaXRlbF9naWNkKGlycXMtPmljZmdyW2pd
LCBHSUNEX0lDRkdSICsgb2ZmICsgaiAqIDQpOw0KDQppbiB0aGUgR0lDdjIgc3BlY3MgdGhlIHVz
YWdlIGNvbnN0cmFpbnRzDQpvZiBHSUNEX0lDRkdSIHNheXM6IOKAnEJlZm9yZSBjaGFuZ2luZyB0
aGUgdmFsdWUgb2YgYSBwcm9ncmFtbWFibGUgSW50X2NvbmZpZyBmaWVsZCwNCnNvZnR3YXJlIG11
c3QgZGlzYWJsZSB0aGUgY29ycmVzcG9uZGluZyBpbnRlcnJ1cHQsIG90aGVyd2lzZSBHSUMgYmVo
YXZpb3IgaXMNClVOUFJFRElDVEFCTEUiDQoNCkFSTSBJSEkgMDA0OEIuYiwgNC4zLjEzLg0KDQpJ
IHRoaW5rIHdlIHNob3VsZCBtb3ZlIHRoaXMgcmVzdG9yZSBqdXN0IGFmdGVyIEdJQ0RfSUNFTkFC
TEVSIHdyaXRlLCBiZWZvcmUgd3JpdGluZw0KR0lDRF9JU0VOQUJMRVIuDQoNCkFuZCBhbHNvIHRo
ZSBzZWN0aW9uIHNheXMgdGhhdCB0aGUgR0lDRF9JQ0ZHUjAgaXMgcmVhZC1vbmx5Lg0KDQpMZXQg
bWUga25vdyB5b3VyIHRob3VnaHRzIG9uIHRoYXQuDQoNCj4gKyAgICB9DQo+ICsNCj4gKyAgICAv
KiBNYWtlIHN1cmUgYWxsIHJlZ2lzdGVycyBhcmUgcmVzdG9yZWQgYW5kIGVuYWJsZSBkaXN0cmli
dXRvciAqLw0KPiArICAgIHdyaXRlbF9naWNkKGdpY19jdHguZGlzdC5jdGxyLCBHSUNEX0NUTFIp
Ow0KPiArDQo+ICsgICAgLyogUmVzdG9yZSBHSUMgQ1BVIGludGVyZmFjZSBjb25maWd1cmF0aW9u
ICovDQo+ICsgICAgd3JpdGVsX2dpY2MoZ2ljX2N0eC5jcHUucG1yLCBHSUNDX1BNUik7DQo+ICsg
ICAgd3JpdGVsX2dpY2MoZ2ljX2N0eC5jcHUuYnByLCBHSUNDX0JQUik7DQo+ICsNCj4gKyAgICAv
KiBFbmFibGUgR0lDIENQVSBpbnRlcmZhY2UgKi8NCj4gKyAgICB3cml0ZWxfZ2ljYyhnaWNfY3R4
LmNwdS5jdGxyLCBHSUNDX0NUTFIpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBfX2luaXQg
Z2ljdjJfYWxsb2NfY29udGV4dCh2b2lkKQ0KPiArew0KPiArICAgIHVpbnQzMl90IGJsb2NrcyA9
IERJVl9ST1VORF9VUChnaWN2Ml9pbmZvLm5yX2xpbmVzLCAzMik7DQo+ICsNCj4gKyAgICBnaWNf
Y3R4LmRpc3QuaXJxcyA9IHh6YWxsb2NfYXJyYXkoc3RydWN0IGlycV9ibG9jaywgYmxvY2tzKTsN
Cj4gKyAgICBpZiAoICFnaWNfY3R4LmRpc3QuaXJxcyApDQo+ICsgICAgICAgIHBhbmljKCJGYWls
ZWQgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBHSUN2MiBzdXNwZW5kIGNvbnRleHRcbiIpOw0KPiAr
fQ0KPiArDQo+ICsjZW5kaWYgLyogQ09ORklHX1NZU1RFTV9TVVNQRU5EICovDQo+ICsNCj4gI2lm
ZGVmIENPTkZJR19BQ1BJDQo+IHN0YXRpYyB1bnNpZ25lZCBsb25nIGdpY3YyX2dldF9od2RvbV9l
eHRyYV9tYWR0X3NpemUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkNCj4gew0KPiBAQCAtMTMxMiw2
ICsxNDg0LDExIEBAIHN0YXRpYyBpbnQgX19pbml0IGdpY3YyX2luaXQodm9pZCkNCj4gDQo+ICAg
ICBzcGluX3VubG9jaygmZ2ljdjIubG9jayk7DQo+IA0KPiArI2lmZGVmIENPTkZJR19TWVNURU1f
U1VTUEVORA0KPiArICAgIC8qIEFsbG9jYXRlIG1lbW9yeSB0byBiZSB1c2VkIGZvciBzYXZpbmcg
R0lDIGNvbnRleHQgZHVyaW5nIHRoZSBzdXNwZW5kICovDQo+ICsgICAgZ2ljdjJfYWxsb2NfY29u
dGV4dCgpOw0KPiArI2VuZGlmIC8qIENPTkZJR19TWVNURU1fU1VTUEVORCAqLw0KPiArDQo+ICAg
ICByZXR1cm4gMDsNCj4gfQ0KPiANCj4gQEAgLTEzNTUsNiArMTUzMiwxMCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGdpY19od19vcGVyYXRpb25zIGdpY3YyX29wcyA9IHsNCj4gICAgIC5tYXBfaHdk
b21fZXh0cmFfbWFwcGluZ3MgPSBnaWN2Ml9tYXBfaHdkb21fZXh0cmFfbWFwcGluZ3MsDQo+ICAg
ICAuaW9tZW1fZGVueV9hY2Nlc3MgICA9IGdpY3YyX2lvbWVtX2RlbnlfYWNjZXNzLA0KPiAgICAg
LmRvX0xQSSAgICAgICAgICAgICAgPSBnaWN2Ml9kb19MUEksDQo+ICsjaWZkZWYgQ09ORklHX1NZ
U1RFTV9TVVNQRU5EDQo+ICsgICAgLnN1c3BlbmQgICAgICAgICAgICAgPSBnaWN2Ml9zdXNwZW5k
LA0KPiArICAgIC5yZXN1bWUgICAgICAgICAgICAgID0gZ2ljdjJfcmVzdW1lLA0KPiArI2VuZGlm
IC8qIENPTkZJR19TWVNURU1fU1VTUEVORCAqLw0KPiB9Ow0KPiANCg0KSSBkb27igJl0IGhhdmUg
YW55IG90aGVyIGZpbmRpbmdzIGZvciB0aGlzIHBhdGNoLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg0K
DQo=

