Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9837C6EC6FD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 09:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525142.816156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqXI-0007fF-2Y; Mon, 24 Apr 2023 07:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525142.816156; Mon, 24 Apr 2023 07:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqXH-0007d1-VS; Mon, 24 Apr 2023 07:22:55 +0000
Received: by outflank-mailman (input) for mailman id 525142;
 Mon, 24 Apr 2023 07:22:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qjkp=AP=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pqqXH-0007cv-5B
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 07:22:55 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d400cd49-e270-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 09:22:54 +0200 (CEST)
Received: from AM6P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::36)
 by DU0PR08MB9461.eurprd08.prod.outlook.com (2603:10a6:10:42f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 07:22:47 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::28) by AM6P192CA0023.outlook.office365.com
 (2603:10a6:209:83::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 07:22:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 07:22:46 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Mon, 24 Apr 2023 07:22:46 +0000
Received: from 052e517e695c.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 97B7CC79-374B-4004-A543-AA5D64B22E7A.1; 
 Mon, 24 Apr 2023 07:22:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 052e517e695c.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Apr 2023 07:22:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9006.eurprd08.prod.outlook.com (2603:10a6:102:33f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 07:22:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 07:22:36 +0000
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
X-Inumbo-ID: d400cd49-e270-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWZY2rSM/tCJktyejvgNGix7coLYZlQDSM6wK3mXlsU=;
 b=vn0aJ68HqVkWLoffnAPlZrjijZD612IQMYBu26SxYJSheuNdyhuAV2w+7EpKgDFf8/A+uHvtRwR7JjYAGsx7bh57bPE85WcQqC82s0A6IJWv8USvjKT9EDYsVwQ9msN/DD5THkCZkBXR1fdDDkHu2MDIcziWiP6lGGelXRgmeag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azUAZlf9IwESan4bJ5s6O77bw0qj9h8Yd2MP7pjSC8tbMMQ6yZ6DgRykrO0YtqEp9JEIGMnLbPPGSrrMEfpupKlgdkvtTefK7pRhi/mkH+q19RAyvFXo5ZjWePjXzXkF9Rj/iLv7P9qWVeCBXaXZgX3bUy+vFbiZRWT/UQvFkoRoCXY+tDa8j5s6QI7gWZiGAs0kbTfFhG1iywR67YCVYs9dYWl073KzEL+9S7ZDNEjtIJwfsNyh02pF5a/ngxMZt5JQLpa6w+8Kl1q9On9PfKq4BLV8R2K+R4xkhxXzbTXRKeFotOxe27qgtvh9q5qaABLtel73Yx4fGEm0XdW0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWZY2rSM/tCJktyejvgNGix7coLYZlQDSM6wK3mXlsU=;
 b=J4ZSK1OXdZTImoQ8A2eBMbs1vdX0dKxWrfYIyvy1Tx/JqJQGmdWg8RHISWVOrpw0F7nSZVPKJx90GUITWku0hpI2W6QdGilc5XHmYBg8OIc2fZ0Cgx+PSP/RzrwqjTZl8cwOZlhGuYkwFkxRpOMlVmSZ26Aa14UnpbfTitSbzULE4CuuwA8Ifk39a9m4MS7K8Bp+zRAEtZMgoaH3s2EvI0eCSUcRQUQE0awhAegAKF+mGGwsnGsH9JFvoE5Mbo7WeAi3NgUs6VId8fV2Cy/AzFAtqDfRbGHVVv4i6HBFnMNP/RvvHNrEom0PYriLIVaL2g9Ka4pOIMlhVvvuWhZG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWZY2rSM/tCJktyejvgNGix7coLYZlQDSM6wK3mXlsU=;
 b=vn0aJ68HqVkWLoffnAPlZrjijZD612IQMYBu26SxYJSheuNdyhuAV2w+7EpKgDFf8/A+uHvtRwR7JjYAGsx7bh57bPE85WcQqC82s0A6IJWv8USvjKT9EDYsVwQ9msN/DD5THkCZkBXR1fdDDkHu2MDIcziWiP6lGGelXRgmeag=
From: Henry Wang <Henry.Wang@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Community Manager <community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v6 12/12] xen/changelog: Add SVE and "dom0" options to the
 changelog for Arm
Thread-Topic: [PATCH v6 12/12] xen/changelog: Add SVE and "dom0" options to
 the changelog for Arm
Thread-Index: AQHZdnJ6OYC31hV5IU6Nadg0A3PyM686De0Q
Date: Mon, 24 Apr 2023 07:22:36 +0000
Message-ID:
 <AS8PR08MB799146450E0BBD6BF1C740BA92679@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-13-luca.fancellu@arm.com>
In-Reply-To: <20230424060248.1488859-13-luca.fancellu@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 14832DCF3D12584084C5229F410F1645.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9006:EE_|AM7EUR03FT058:EE_|DU0PR08MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 3148ab1c-11dd-4edc-4bbc-08db4494b3e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KQL14xjoFToztO9iKoHvxRLX01JjSRcYgsULmva5nT9Q0i24zf3ryIwayKup3pkFwh8mUbuB41JjJvQISf3XkG84bQkVHqabe8EbusfoB8BIuacnxAY9g6aAIMn9cmysti1F8JGiBMltLaJz8zcv06f018mngRnOaznwntjKEJGUhPWEuM26ooFHdDKw0/nEL4/u+KXJ8eL7u5RKgH7PK1Fv639Oz5g9J45hp+jdUQ9rnI4rJFNg6LZ2ghj1hFx+FZcZRfF02NctkbbTXach2PvCXXqgIAxx92JfKPX/URHVQ0nnNua8TWIpmc8j4DfcQ8ZAv0fPMJcp3pkd1XHgzSP96U/s8WiNmeeh/xXcPv8o0TynjZ15BT0Wnwc2E6C+86/b1TsHGnfaZeV/NFiraX4V6I7JJHXm2kXTEgcZvUJ4UmL6huvIuBpQQ2eXYNgdYFfDO+Wmc/D0uNjsmvJyjIaokdjkSeZt5H+B8/p4+Cf8lL91xGrvGYErgKMCO9gqeGojF7GXWvssAhaRm+NZ4kBDvq1f6nSaScDO3FUknzrs1dh+SNqwo7JoEZ5gLx5DEvGjUqtlNdKbT1kOdaE1cmd+hJW3RTin/PHpzY+BSy3GerHMtFGs8S+GjKKCkQGKmXjJlEgoLwxIAjOWaTC9bpu8qum3uBKgC89ugNREBssZVyAfYjJ0cSe7alj4JfmtmdHmx8f5mIlA+kBJElfE8A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(38100700002)(122000001)(6506007)(9686003)(26005)(55016003)(186003)(83380400001)(33656002)(2906002)(4744005)(8676002)(8936002)(52536014)(5660300002)(54906003)(478600001)(7696005)(71200400001)(38070700005)(110136005)(316002)(4326008)(41300700001)(64756008)(66446008)(66556008)(66946007)(76116006)(86362001)(66476007)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9006
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	36eaa4ac-c16a-42d7-01bf-08db4494ae04
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jFhWxbUr57iE40xG175KiG8m1aos2Fsa8nhwk8qeJuRo4oId1RyMOFkgKz9n6qDfOg7Km5xneZYYK4yPqMVARGXNR+1gN9x/Fw8PrJtTVxIP1ZaqPuHH3fZ/snbPWrZz6kbJHJISernJNl/vZL5kSEiUhs5Vn89GcAZm2SpB4I9KL8xzKPjOT+fhi778Hf/TAeaB282X+2nlNs4RTUYCqQd5pMW4IiNqFDRNHY9lmKYad5yG7ifJWAdwRXA1rb6aeiMBUVBJEGXnruJeTQMEIu727IeFm5k8ASEr/76xrDsx3Ln1MdwJHHIsELxQDiA5QKlknjE2yyRBtqB9tMRoTNtRS38AxHmJ2EIbUs0Gq7a6oWkHeuGXjIv0wWcy4Kdix2zM7AYNeTLpUttNG0RIOiryj3IaVvnE/WMui9xRuKjjmq8lNWi1JacAnwOV8hTXv0RpzNvloGXtQtrvcC/syrOASU6iR5cH4pP++AV2xs1l/eFGfRyDDkOi21wXXRB89+gYRM7qoeoJVKnEpBOMtyDOXEGXhQO6sghKZ6VZ5iUJubnQYsWZopRjJzAVW44+qGgQBe/iWgF4GjPBHgvgB5yF34aESKRlMg0SpzAEJiKSxzfysCJMYDsfEzSVnh9qSszDyS1bNARSij13YciRdsQM6tuqlVkAc/SGl/SlnKwtwEhoQw+0QI6Zcw4UpjTqBKbRvsISCIE2NYv8N0A/l0PSPGNg/C824FtfFYIkdeqJHSOOlJE3we1gVRYpYEMSclHCDuXBqXZxFEaZn75CqkVY021nJfxH/Mq7l/Iq7vA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(40470700004)(46966006)(36840700001)(54906003)(110136005)(40460700003)(478600001)(82740400003)(316002)(4326008)(40480700001)(70206006)(70586007)(55016003)(356005)(41300700001)(81166007)(4744005)(2906002)(8936002)(8676002)(52536014)(5660300002)(36860700001)(186003)(86362001)(336012)(26005)(33656002)(6506007)(9686003)(7696005)(47076005)(83380400001)(82310400005)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 07:22:46.6495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3148ab1c-11dd-4edc-4bbc-08db4494b3e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9461

Hi Luca,

> -----Original Message-----
> From: Luca Fancellu <luca.fancellu@arm.com>
> Subject: [PATCH v6 12/12] xen/changelog: Add SVE and "dom0" options to th=
e
> changelog for Arm
>=20
> Arm now can use the "dom0=3D" Xen command line option and the support
> for guests running SVE instructions is added, put entries in the
> changelog.
>=20
> Mention the "Tech Preview" status and add an entry in SUPPORT.md
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Henry Wang <Henry.Wang@arm.com> # CHANGELOG

Kind regards,
Henry

