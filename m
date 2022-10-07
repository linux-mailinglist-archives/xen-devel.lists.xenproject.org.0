Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54895F767E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 11:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417547.662293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogk0w-0004X0-CC; Fri, 07 Oct 2022 09:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417547.662293; Fri, 07 Oct 2022 09:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogk0w-0004TT-8n; Fri, 07 Oct 2022 09:51:30 +0000
Received: by outflank-mailman (input) for mailman id 417547;
 Fri, 07 Oct 2022 09:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XcYz=2I=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ogk0v-0004St-5l
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 09:51:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cc56068-4625-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 11:51:28 +0200 (CEST)
Received: from AM5PR0301CA0018.eurprd03.prod.outlook.com
 (2603:10a6:206:14::31) by GVXPR08MB7725.eurprd08.prod.outlook.com
 (2603:10a6:150:6d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Fri, 7 Oct
 2022 09:51:26 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::8a) by AM5PR0301CA0018.outlook.office365.com
 (2603:10a6:206:14::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Fri, 7 Oct 2022 09:51:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 7 Oct 2022 09:51:25 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Fri, 07 Oct 2022 09:51:24 +0000
Received: from ac388e65b203.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4BA4B2E2-330E-4C53-BBC3-017A80A28507.1; 
 Fri, 07 Oct 2022 09:51:18 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac388e65b203.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 07 Oct 2022 09:51:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB5409.eurprd08.prod.outlook.com (2603:10a6:208:183::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 7 Oct
 2022 09:51:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%3]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 09:51:17 +0000
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
X-Inumbo-ID: 9cc56068-4625-11ed-964a-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LOsMVBiIu5Gc7sF+/5AkF1HFHQPYfVhlaXonEw52UtjAB6aPuOnXZWYGzTBHYOphAQW88J9zAazwAfOgIor8D2ml8i5GhUbZf7ewCi1pQ+Al+7gGskkuyhzqccXQRIPWteOj2M5m5xbT0f6GQzIvm3vjoR3hAq7Dhn4jFls7yB7nQfhoB3kC3D8PuxRZZkSeM1qC3/4mvZIbaJ2jM5Z8a8+n26nFd9xOZdOMiLs2Pk7w4AA7wRhKEJ+1c7VUp74JpJTunZvF1X43St/yu3InpARclaOj5mKtxqlA5Rr8adOy+DG9QSQM1nkTEJA87uRo2lqVo5D+ggVYw3dZORrJVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnVnkyePrP+cVWMbAEaV9fneWzzWRCK1BkSotP3Vp24=;
 b=W82kKhirnkEB0VxeF6Ev7NUBJXE8miRxyFSaFt3TXxBgbK1fJUNcYKihiXdXBHOoaEsd4GrMKfywSAmUU6WJ4J/emuYjITrHeoRgwm6WlVBd0kIrNbFOhU41r1kinx7AW/tsb6Yiy5lv6KkzjLwm28skVj2TTIEKbmbcsrGwguQQLZmIE8utVOr9GG4cziN4ZrRRAKFJ05cFYPB1j0+0oYXJm2OuEhOx4URKPJFK7c/wwKcy3JyjNNCtTPbGgtWadvRNunVv03blgXivW73h2xR37zGRGmYd1UjGGaROqupvUuzBEZ+VGtYGXQghEgWw2bD01twPxgdquePWC//pNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnVnkyePrP+cVWMbAEaV9fneWzzWRCK1BkSotP3Vp24=;
 b=9qEOiPwyNaVDjT/Pw6SNgnpwTkSWC4/0Ku69ikca0u3JERrjb/+ldmmn7LHOWA4BA21QGWTXktmqlGtfW8Coi3OdG40j/cqYtBDCwV52jbTswzy3af2zBx+zpBcCZbxPOo66ERExrG0aYjfEqiK3ejENYQu1/XPDZd5TKodSaoE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=em9E3mULK6utSxbwYeB1tEdtnEPAXg8fBKXZU8qRHL3aiCqhLwk44/i1WswS1pP3XRYVcEvU9dYVwYvEuNMDlbxdLR/lmmHvDrTk9MxW5wxYLDADVtiYH+WAtGnCfMK+7C9axP89HI+hVl7crkAE5DiuEb/sw2wcMyGHLrLZq+cQ/a+CaRAPsg4CXrSeu2UG+cX3HM9JBwWsWzJrNeHhBsO2YEsnXbOLHjT9jIfILFJdqo657/Cl69DX2sDfOhLrykqTy5yTMfMS4u9SIGmtzOPlVooH1PPjSf4IUj3OYJSb4IOyC4m3so9W/aDMxAkRw9IxfaxUJpoUkMTOVpY+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnVnkyePrP+cVWMbAEaV9fneWzzWRCK1BkSotP3Vp24=;
 b=RIG4dK3E2/qp7THjaGYQrJStPatIR0eup4E9dBF6oCHXhwSAMj0b8C2uabzKa4CLopahM5w9xzThgFsQX3rWeGGiLhpC+9UXFNpdVVSuzdJJrpaiGe8Xbd5a8s/zLBgEFMkv8m6Qxrz23eYUtyNk4TjfxWMB0QUkIodLhdqGjgNiYhrMHI1Uk+CiUjcvwkr1sup1Q8OGP6tkGzqdajzvlOiafAoBnZoHdXMYZkla7BPz7iA0LPkRGLoYT/6ZqEWpA2LepKUR+8s9suVmoHQ822zkXPd3C8nVO99Cqeim5xO99CwM6ZZbsrqqC/6/R7uPdNylDEx0dJD66V0H2fUP+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnVnkyePrP+cVWMbAEaV9fneWzzWRCK1BkSotP3Vp24=;
 b=9qEOiPwyNaVDjT/Pw6SNgnpwTkSWC4/0Ku69ikca0u3JERrjb/+ldmmn7LHOWA4BA21QGWTXktmqlGtfW8Coi3OdG40j/cqYtBDCwV52jbTswzy3af2zBx+zpBcCZbxPOo66ERExrG0aYjfEqiK3ejENYQu1/XPDZd5TKodSaoE=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: RE: [PATCH 3/3] Update Xen version to 4.17-rc
Thread-Topic: [PATCH 3/3] Update Xen version to 4.17-rc
Thread-Index: AQHY2i0kbK3se4k2QkiZcyeFGqX6QK4Crs3A
Date: Fri, 7 Oct 2022 09:51:16 +0000
Message-ID:
 <AS8PR08MB7991D9B26480DCCDEA7DC755925F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221007091341.58542-1-julien@xen.org>
 <20221007091341.58542-4-julien@xen.org>
In-Reply-To: <20221007091341.58542-4-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8A75BC522F7E534AB3774E909643F43C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM0PR08MB5409:EE_|VE1EUR03FT063:EE_|GVXPR08MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: a95a64d7-d4a1-4e94-2cd7-08daa8497fa1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c90fqCcfZi8iRAtXbpbQTphOH6CHR0nygjxM070tB6evP3TvFKC77ZjzJD8qSy0qc1akDDvcCz8LTS1ReOR1IA5qLwiCGfcRaSgMUj42J+V2zCM4fE5LfxilnL7Ekk4+nMJHBIem8GJ+3AT/vzLgTV48keZ2stibejr04iYOaQgm/lGLel4SfI7TT7Y8MHaSqIH5s9NaFnnfiDmosQI1Q/d1DMJsxLlSMy4mrClF3ufuCeDajwxH/f5Vubbe0x0EF1HrbiRqXJb/+pG6NkP60UgGtFc8HwBRrYjZqRV6uPRCyVbRRBoaVhlmtUBgh2rS/DUY1ZFKJe7GMOwM49XhQxrCe14Vc+57yK7Eiuajnnm29UP7fVf91Ig/VUKrL/veb62j55dRUvi3FcQQ7wD8nFhUX4PkXdpYY26yEVc7d9EKjHMmTrceKR0VDxLAkvfAKCzp+b9sGCaImEjE+IdSZrsmIQb8zvkJirhUI17+6e5hMsubmCZTzY6IMT3LvHV1W1ZW8lx2bNDPwMgBwGHcqHAJoNB2VEHxTz6VgGG4QTXw3zcELjkz4sBmpo/Xn/3XQ6bzGjFDgEYsoMPdk45/WILugud2TiFiaMijzARPbd6SIwfPlHQIaUlhkvqhcX6DcOo4UxqW5IJueXo3u420Oov/lXIXP8KoM9FsYywb547JVisrTxRbGFsQNzC79E1haChcb3EkDXIvnuA77Rt3+vPQc1oOONq3C4GPV8zrxDbY5mkt2nvmZeoVAPRC2lSf7cm3X+1Xb3yGewSppT3F5chVbwisIr1EtK9bJBg+Naw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199015)(86362001)(52536014)(122000001)(186003)(33656002)(83380400001)(38070700005)(38100700002)(7696005)(9686003)(6506007)(26005)(478600001)(54906003)(41300700001)(2906002)(966005)(71200400001)(110136005)(316002)(45080400002)(5660300002)(66476007)(64756008)(55016003)(8676002)(4326008)(66556008)(66946007)(66446008)(76116006)(8936002)(15650500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5409
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1209a301-0a74-408e-05f5-08daa8497a85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QltLTGp/Kr+uziiKcF6sWJkQoJDOGQ/yxrkLpazeeN6i92Zt3RqIdj0bJC6uBzMJe+NC6bFi07bzlnhQhqY+hV+656xhkkHfh41MtVNBvMLkZkDcD/aDe+bJKbhKwElt31tq27dp/cqNMohT3KuRvoWd/3L8DWNcbCvxndNXwBhr9/ynv+3nsgJT+b8Wacboj6AK6rPgll6ucpL3pAG5pvkdrhh4Rq26eO2SuHf5TCX2nv33QuY7+vvEPmbn5oSyw3yEsmXJmL6j9p7Y5s27gL7tW9OjFZr/BRU1oKgU9zdsmOsuzZ6qvOCuFRJ+7i7iKSufD1oFNQLZq+cSjsKbKIx3Ky/B/BT2wnIKoukmBezI3pbrtzKoP2cN7vMCwsjKuJBZea1PhbN23kXLGBJjBC36SE4Lquq0RxXTWnGN5coSgk06hBklcwkTU28Ad2VK0sWNJ10uZEsP4qaqb9oJATm/STQxjP6bbOjcEQfthzNLIViott0511Xrj+b75Hu+x0cMK87eMFJU5xk6sUtUySJ39Fz9f+QavH7woWN6YWfC7CXNs36yls1hDTCSCSJRoRGyAHQ5qa65hCijgeGSdrgv2CTM7zsthkStCXWyeawuqy+vC5HrDM+eH9yCfB/MdpuUuzn0MKKc1gwEVOPnqqGRacIrTHEz9nw/B9DlHmBVtVtly6MhCwbKCpHUekexz7PhCz9xB5sTVufJ5ZxX0jehWy+a6Qs8uUd0in1pN6U6x4xL+yjiAR/jxKkuagLWcjx6vZ9ofnj90RUeOTg7rWmIR2+oSoz9cAJ7Kic03Z0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(81166007)(8936002)(2906002)(110136005)(15650500001)(36860700001)(83380400001)(40460700003)(70586007)(356005)(316002)(86362001)(70206006)(478600001)(966005)(45080400002)(82310400005)(8676002)(52536014)(54906003)(26005)(40480700001)(7696005)(55016003)(4326008)(41300700001)(33656002)(9686003)(6506007)(47076005)(82740400003)(186003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 09:51:25.2757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a95a64d7-d4a1-4e94-2cd7-08daa8497fa1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7725

Hi Julien,

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Subject: [PATCH 3/3] Update Xen version to 4.17-rc
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I am not very sure, but I think the name should be 4.17-rc1 since
we will likely to have rc2 to rc4 according to the previous plan in
xen-devel [1]?

[1] https://lore.kernel.org/xen-devel/AS8PR08MB7991DD9E3E7C966E9C6DCA03927B=
9@AS8PR08MB7991.eurprd08.prod.outlook.com/

Kind regards,
Henry

> ---
>  README       | 16 ++++++++--------
>  SUPPORT.md   |  2 +-
>  xen/Makefile |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/README b/README
> index 89a1d0b43c4c..2fdca8861bef 100644
> --- a/README
> +++ b/README
> @@ -1,11 +1,11 @@
> -############################################################
> -__  __                                _        _     _
> -\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
> - \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
> - /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
> -/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
> -
> -############################################################
> +###############################################
> +__  __            _  _    _ _____
> +\ \/ /___ _ __   | || |  / |___  |    _ __ ___
> + \  // _ \ '_ \  | || |_ | |  / /____| '__/ __|
> + /  \  __/ | | | |__   _|| | / /_____| | | (__
> +/_/\_\___|_| |_|    |_|(_)_|/_/      |_|  \___|
> +
> +###############################################
>=20
>  https://www.xen.org/
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 29f74ac5063e..cf2ddfacaf09 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
>=20
>  # Release Support
>=20
> -    Xen-Version: unstable
> +    Xen-Version: 4.17-rc
>      Initial-Release: n/a
>      Supported-Until: TBD
>      Security-Support-Until: Unreleased - not yet security-supported
> diff --git a/xen/Makefile b/xen/Makefile
> index 4e6e661261ae..9d0df5e2c543 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -6,7 +6,7 @@ this-makefile :=3D $(call lastword,$(MAKEFILE_LIST))
>  # All other places this is stored (eg. compile.h) should be autogenerate=
d.
>  export XEN_VERSION       =3D 4
>  export XEN_SUBVERSION    =3D 17
> -export XEN_EXTRAVERSION ?=3D -unstable$(XEN_VENDORVERSION)
> +export XEN_EXTRAVERSION ?=3D -rc$(XEN_VENDORVERSION)
>  export XEN_FULLVERSION   =3D
> $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>  -include xen-version
>=20
> --
> 2.37.1


