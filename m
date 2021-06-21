Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506323AE60F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 11:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145431.267587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvGHG-0006UF-SE; Mon, 21 Jun 2021 09:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145431.267587; Mon, 21 Jun 2021 09:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvGHG-0006Rp-Ox; Mon, 21 Jun 2021 09:31:34 +0000
Received: by outflank-mailman (input) for mailman id 145431;
 Mon, 21 Jun 2021 09:31:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lvGHE-0006Qz-Uo
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 09:31:33 +0000
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [40.107.12.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cbc2d62-89a5-4056-9c0c-77771c504048;
 Mon, 21 Jun 2021 09:31:31 +0000 (UTC)
Received: from DU2PR04CA0245.eurprd04.prod.outlook.com (2603:10a6:10:28e::10)
 by PR2PR08MB4860.eurprd08.prod.outlook.com (2603:10a6:101:20::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Mon, 21 Jun
 2021 09:31:28 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::89) by DU2PR04CA0245.outlook.office365.com
 (2603:10a6:10:28e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend
 Transport; Mon, 21 Jun 2021 09:31:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 09:31:28 +0000
Received: ("Tessian outbound 7799c3c2ab28:v96");
 Mon, 21 Jun 2021 09:31:28 +0000
Received: from e5e3dca8cb3b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B64BCB73-9CE2-4AB1-A4FC-E35C2279C194.1; 
 Mon, 21 Jun 2021 09:30:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5e3dca8cb3b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Jun 2021 09:30:52 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6000.eurprd08.prod.outlook.com (2603:10a6:102:ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 09:30:48 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 09:30:48 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0106.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Mon, 21 Jun 2021 09:30:48 +0000
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
X-Inumbo-ID: 5cbc2d62-89a5-4056-9c0c-77771c504048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ASjjV7ehB6D0BbhjjaMU4QkbWhPk+IeC69pZ9yy5qI=;
 b=pPQKhPuCctIWgD1SIKEuYLtBFP5u/U+smnUmZ4DoQfT+BRwYUV8sbMGt0eE61FLdEdgovV/NH8GmKeO541LeZfGrSNyvIkDlfQQIFXnK8ccBUsNweI8UuW5IFOtZdATWV3R8kG2Jsey8qI9jGiVsgSwIMDGJM4rbBXnY8bjxhGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 07e935261128089e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esS0ioUkbx7dNMuJHTEtHolhLDUuUOt9v3MZyajYPY9v7/QTshbVp1yBOgfrfF5T2/i5iPmdyF6TSlo8vVniiTBjGx2/ZozPqvkyGewbKUTS+jQbQjtSJQlSN1ixPfGJkZXWYAmrO7OCmYAnxH5lL3QkFjYT7MROT9PauYP2s13xHOAZEzn1d30fVpOVkd/wUooHTn8paifzbwDU4oRS33mT5/iGlLgIDTWVB/RGQogOg5JbMO205iEANl0mOdNrt8qKiEIPGosrpJHreBJSCVFM1ESs+jXU93FxmRZ8UNwun/QnifqfYQq+xW6H19oFal8+Mc2v2oiHTDbUvjixIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ASjjV7ehB6D0BbhjjaMU4QkbWhPk+IeC69pZ9yy5qI=;
 b=V6EpkMTKzR8MniK4yjMa5vFsfWKxElGeJGkJFOBDfOUv6WKEbSSwlmI3rCsZXhwSaM91gAfkLI8UfrpkkrnJH0lzuRE84/9gcbyHIWSETOuYmXjdksoJgC2LUbu0FBRxAS/yAjhB+nLtSm8U17PsVlMb0qPeJh3n8AYEjH63rSFkwXWLZXTLo69BHMy9mPXJjd4tWV96mvG4qvNl+DV03ViB7F2Qqfdah8genJzXbWnhs1GKmrLU1NWgWnlNrKP8ZSBWlf1Y4d0VwiZoTPEMC+7WrBt2Tl+AZdbv5OaMo+Mb7VB96zQvMs1k2iGdLG95P2VEaOvKaf5gGRT2q8qkSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ASjjV7ehB6D0BbhjjaMU4QkbWhPk+IeC69pZ9yy5qI=;
 b=pPQKhPuCctIWgD1SIKEuYLtBFP5u/U+smnUmZ4DoQfT+BRwYUV8sbMGt0eE61FLdEdgovV/NH8GmKeO541LeZfGrSNyvIkDlfQQIFXnK8ccBUsNweI8UuW5IFOtZdATWV3R8kG2Jsey8qI9jGiVsgSwIMDGJM4rbBXnY8bjxhGM=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 10/10] tools/xenstored: Delay new transaction while
 Live-Update is pending
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210616144324.31652-11-julien@xen.org>
Date: Mon, 21 Jun 2021 10:30:41 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <111A40CF-F03A-4C03-BA32-55E1F1537F9A@arm.com>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-11-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::21) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e09ed5c8-ac72-41be-7ee2-08d9349758d3
X-MS-TrafficTypeDiagnostic: PA4PR08MB6000:|PR2PR08MB4860:
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB4860F83F7B21458AB7DD3A99E40A9@PR2PR08MB4860.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wn61GMi4/31BxeMbfviw4pJ2N8o1Ksi0Dqg1rG5ETh6+iZSkpDy+SgHuJsv9NCEdIgpuZKLA0qToa+D9Irdbxje9P9ON9Qd4Ghc6zQObYNZ35UvAM1RrKzRxNjVoMbtV/X+vHwIZ1ZMuRkTZvAhPU/WGr1C/Ow+koKYf7jsHSPHNftSx7O3iUUZVN0MkwL7ega9MUJtX0ZeJ0z0T/QtJ9qLfFdOAGLou7/P5Pk3EyKCX4xI8nmUStZuC86bTh/XTie3UdNGQHgKsTQNfaggRbNB1WvT8PAS5iWtN1F4xnS1ENxT2Dib4x3S2XL622UJjClL003G8VhuyVPgL5eeVSOfqaG92dFv0hYjp1Qi9690Egbm2edln7FFlmKV9csLsHkd0OW+/o1VhJulk+PXvbBK2urfvP3VZrmgCe7kIN++unAe9JYYaEMcX9QRCvnpR+rBgpS4/aXGM1GTiNChcc02AffUNjvld8NHI/K5DWqm4E5WmxkiMYqpK05TUXmrAaU4l/J6YmQB396e2aMZbqNNZ4mpStlc0LAo9otjLyiNLHzNG/6xV7QCsapXIS6nHopUpOQ8HQWNCR0h/hCRySX6X8vuEGkfPKXpltqa5BeHZ9y5VhcPSxDRsIDHQEPTEpAJXI8nve5mv2JGzBqsUgnjMjlnYX56xR2N3bhJwSONUNGo9t0PB9szHe3Xuxj5k
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(53546011)(6506007)(956004)(2616005)(15650500001)(44832011)(8936002)(26005)(52116002)(4326008)(38350700002)(38100700002)(33656002)(478600001)(186003)(16526019)(36756003)(54906003)(66946007)(66556008)(86362001)(8676002)(6666004)(2906002)(5660300002)(6512007)(83380400001)(6916009)(66476007)(316002)(6486002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?l4XrUOIjMtWT88D5vSJxlYyDgfWHVxxbBiEHFcalMdfEGrv7HRxPjmgJalgX?=
 =?us-ascii?Q?7bgaZj6icpesG2ceO07i3hQWKhyWzhP4FxdNGjqdqEcR+RwKEB+R85H7VTGQ?=
 =?us-ascii?Q?1kEy5otY0yPUcB+MJKzq/bn1pRVcwvWUk1mE64e5d8bbm4REOXGNeK8yM+dr?=
 =?us-ascii?Q?919K3VBmbHWqghqGvQmdMn2xI0E6h8ISjHK3KifThHIyVXnkt/eqdINfjC33?=
 =?us-ascii?Q?/Wb+29LlSdENGhpQ77/NorX1u2FpyWV0XGviI28rTmmIDi5xyzE+1BB4lpyN?=
 =?us-ascii?Q?hs7Of9dIj+L1bJlXZr0smdVeQMF2IXEjwNG+bQXDgqSU9u3bNDz98ShJRsLF?=
 =?us-ascii?Q?K7lA1APfEOpI4TleNqnm515Dz7hQiGbwO3WOw1rAM9obcn+NlbuKyl91iXsr?=
 =?us-ascii?Q?lNU6b0PxkEvjVJHrD5NbxIrUjYAK1BPsTlsHIDdMIpPUeD+v2o4BW6kWNkmS?=
 =?us-ascii?Q?OcRyReEhZ3jC09RazJsbXnEbctjGlWDax2yoRQEybrYXJYTDDnpguqUpzq7H?=
 =?us-ascii?Q?I8YXsUl+FXYR/w1ngc8L8X+KanuQf238DOmLknahHUSSZosgY/ZBMhVUK0Mw?=
 =?us-ascii?Q?lBddJsWMtFw8gaOrHYmnwFiyjdyGm50WPbLcTsIiYpn/hqfjNPlPzqlZe7nD?=
 =?us-ascii?Q?Paaj0nJ42RQIpPvOBiLvLhi1k0hWMlqv4OuFurwplA1JQVPMULIhYsU/xH/U?=
 =?us-ascii?Q?HWsL9EE/AKjw6/mSeVE0xcVI1F71d0w+XUtQl5vZJp/6ZMhB8AIjZ6dkTO8h?=
 =?us-ascii?Q?Dl+f1a+JsO7iNj4RBzpxmdFVkxxgxk6Nhk1PofTNY1Q3XLK4DVE5okEL860q?=
 =?us-ascii?Q?9YeWdosBP/gXqMQP7zshTSOkUah4WR0m3Q4bcGf6jyt8f6m5uMnrrBct3h68?=
 =?us-ascii?Q?RuDcuZFxYGknqm5yfSutcFeVjxNESD7lYaaaW9Y5Q8vS3c7/S5n9h+zL4w21?=
 =?us-ascii?Q?4EfAPuDfCW95cwIcqBZ5yJ0PDiYdacNmm2b0ETRAeUa6LXsGi/ZHJWcTM0i8?=
 =?us-ascii?Q?1yfbQlynA2lmJjX268IwvSONxWh9Z/iXEL48ZhDJYpOGHVKvgHW9ex9KNfiV?=
 =?us-ascii?Q?RIfWMU3z4NVeve6235qqFfH2FCdbIC1jHTtiUUrWIyBCK6cFkumHEzAUThV9?=
 =?us-ascii?Q?RahqfzE9BGEAqrxog4hOrUXSMEOi+0QSmyxHqvFPVKtwRJMtqUqcoLuubVyZ?=
 =?us-ascii?Q?JAPJspej5+Mx5mNLJHpEmBT5dAIbmFFi825jiKJR1p+snrPCkHdiF8b1Msox?=
 =?us-ascii?Q?p9ysVw6UBVI39JQ86po7uDuZbqRyBv89YBfv9n9ndsnEIJsr5lZmL+aWooHm?=
 =?us-ascii?Q?R/01Vm1OC6DINsQ6CtqbXF8t?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6000
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da514532-59ad-40d4-acb2-08d934974117
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oRHPT295lQDx4QvF1GiGi186bYG2vqQDSXIv+XdJj95ouzSxvufI6RiiLXXUYe50cy575QjcdN1BK53lh7Lo5X2UK581zLPB29oBEe8pkEuwEi2iho0ptLVaRFVq1ZctCEp5Mofam4tnP1jaBpKKJLur4m9f3k1soiSRwD6ofJrNvvLXtv+Gdo8dyvXhCXwvAr7/XLVmaFHTPoHyDGO6jDSUKMcPczXLqCXLKDiTn7lUGRLWYkTbp9en6USsL+1mzhtVL2ZoHaRAenI6lulkTcPyMgEZgetuXZsnXQEjbQKQ3i2bhDW67m3dDOhA5OXHQGctcNf7JyHjup0dMZqP/O72B137139XMieyRyfYj/aG4Nz31gNHjz3KxAB76Eg/IenMa8vQktRsM0ykqhtGIIUJlO1cMWTeX05jEd3uLfcv+XvatWj9fhYqDHRWAfQPNtT46xSZyTGHQNqYHm+Ymt3NBvPsmpD5u8X65KO2FYw5dtaf1zAXZxZlXvkh5SCxMmwTryfVeazDbYKbxbWFBHvaxdx3DglGskRwiuIOWdbwDjfIlT8+Lu136T1ToBC2IciDRPIrgTvUP8Dz65qsTut8m6aSxzNzd4JhDzrr/yDGWUqsp+p4KWwoO8iA/9sUqM3fn4IlUAdUsV04g+8KW3KJsBjPRrrcDwdGCRBYag8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966006)(36840700001)(6862004)(16526019)(82310400003)(6666004)(356005)(186003)(44832011)(2906002)(956004)(107886003)(15650500001)(26005)(33656002)(81166007)(2616005)(6486002)(36756003)(5660300002)(6512007)(4326008)(70206006)(82740400003)(53546011)(6506007)(8936002)(70586007)(478600001)(83380400001)(47076005)(36860700001)(8676002)(316002)(54906003)(336012)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 09:31:28.4507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e09ed5c8-ac72-41be-7ee2-08d9349758d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4860



> On 16 Jun 2021, at 15:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, Live-Update will, by default, not proceed if there are
> in-flight transactions. It is possible force it by passing -F but this
> will break any connection with in-flight transactions.
>=20
> There are PV drivers out that may never terminate some transaction. On
> host running such guest, we would need to use -F. Unfortunately, this
> also risks to break well-behaving guests (and even dom0) because
> Live-Update will happen as soon as the timeout is hit.
>=20
> Ideally, we would want to preserve transactions but this requires
> some work and a lot of testing to be able to use it in production.
>=20
> As a stop gap, we want to limit the damage of -F. This patch will delay
> any transactions that are started after Live-Update has been requested.
>=20
> If the request cannot be delayed, the connection will be stalled to
> avoid loosing requests.
>=20
> If the connection has already a pending transaction before Live-Update,
> then new transaction will not be delayed. This is to avoid the connection
> to stall.
>=20
> With this stop gap in place, domains with long running transactions will
> still break when using -F, but other domains which starts a transaction
> in the middle of Live-Update will continue to work.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> tools/xenstore/xenstored_control.c | 10 ++++++
> tools/xenstore/xenstored_control.h |  2 ++
> tools/xenstore/xenstored_core.c    | 49 +++++++++++++++++++++++++++++-
> tools/xenstore/xenstored_core.h    |  3 ++
> 4 files changed, 63 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstore=
d_control.c
> index 1c24d4869eab..a045f102a420 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -131,6 +131,11 @@ unsigned int lu_write_response(FILE *fp)
> 	return sizeof(msg) + msg.len;
> }
>=20
> +bool lu_is_pending(void)
> +{
> +	return lu_status !=3D NULL;
> +}
> +
> #else
> struct connection *lu_get_connection(void)
> {
> @@ -142,6 +147,11 @@ unsigned int lu_write_response(FILE *fp)
> 	/* Unsupported */
> 	return 0;
> }
> +
> +bool lu_is_pending(void)
> +{
> +	return false;
> +}
> #endif
>=20
> struct cmd_s {
> diff --git a/tools/xenstore/xenstored_control.h b/tools/xenstore/xenstore=
d_control.h
> index 27d7f19e4b7f..98b6fbcea2b1 100644
> --- a/tools/xenstore/xenstored_control.h
> +++ b/tools/xenstore/xenstored_control.h
> @@ -23,3 +23,5 @@ struct connection *lu_get_connection(void);
>=20
> /* Write the "OK" response for the live-update command */
> unsigned int lu_write_response(FILE *fp);
> +
> +bool lu_is_pending(void);
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_c=
ore.c
> index 9eca58682b51..10b53af76ac5 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -338,7 +338,20 @@ static int destroy_conn(void *_conn)
>=20
> static bool conn_can_read(struct connection *conn)
> {
> -	return conn->funcs->can_read(conn) && !conn->is_ignored;
> +	if (!conn->funcs->can_read(conn))
> +		return false;
> +
> +	if (conn->is_ignored)
> +		return false;
> +
> +	/*
> +	 * For stalled connection, we want to process the pending
> +	 * command as soon as live-update has aborted.
> +	 */
> +	if (conn->is_stalled)
> +		return !lu_is_pending();
> +
> +	return true;
> }
>=20
> static bool conn_can_write(struct connection *conn)
> @@ -417,6 +430,12 @@ static void initialize_fds(int *p_sock_pollfd_idx, i=
nt *ptimeout)
> 			if (!list_empty(&conn->out_list))
> 				events |=3D POLLOUT;
> 			conn->pollfd_idx =3D set_fd(conn->fd, events);
> +			/*
> +			 * For stalled connection, we want to process the
> +			 * pending command as soon as live-update has aborted.
> +			 */
> +			if (conn->is_stalled && !lu_is_pending())
> +				*ptimeout =3D 0;
> 		}
> 	}
> }
> @@ -1524,6 +1543,9 @@ static bool process_delayed_message(struct delayed_=
request *req)
> 	struct connection *conn =3D req->data;
> 	struct buffered_data *saved_in =3D conn->in;
>=20
> +	if (lu_is_pending())
> +		return false;
> +
> 	/*
> 	 * Part of process_message() expects conn->in to contains the
> 	 * processed response. So save the current conn->in and restore it
> @@ -1543,6 +1565,30 @@ static void consider_message(struct connection *co=
nn)
> 			sockmsg_string(conn->in->hdr.msg.type),
> 			conn->in->hdr.msg.len, conn);
>=20
> +	conn->is_stalled =3D false;
> +	/*
> +	 * Currently, Live-Update is not supported if there is active
> +	 * transactions. In order to reduce the number of retry, delay
> +	 * any new request to start a transaction if Live-Update is pending
> +	 * and there are no transactions in-flight.
> +	 *
> +	 * If we can't delay the request, then mark the connection as
> +	 * stalled. This will ignore new requests until Live-Update happened
> +	 * or it was aborted.
> +	 */
> +	if (lu_is_pending() && conn->transaction_started =3D=3D 0 &&
> +	    conn->in->hdr.msg.type =3D=3D XS_TRANSACTION_START) {
> +		trace("Delaying transaction start for connection %p req_id %u\n",
> +		      conn, conn->in->hdr.msg.req_id);
> +
> +		if (delay_request(conn, conn->in, process_delayed_message,
> +				  conn, false) !=3D 0) {
> +			trace("Stalling connection %p\n", conn);
> +			conn->is_stalled =3D true;
> +		}
> +		return;
> +	}
> +
> 	process_message(conn, conn->in);
>=20
> 	assert(conn->in =3D=3D NULL);
> @@ -1629,6 +1675,7 @@ struct connection *new_connection(const struct inte=
rface_funcs *funcs)
> 	new->pollfd_idx =3D -1;
> 	new->funcs =3D funcs;
> 	new->is_ignored =3D false;
> +	new->is_stalled =3D false;
> 	new->transaction_started =3D 0;
> 	INIT_LIST_HEAD(&new->out_list);
> 	INIT_LIST_HEAD(&new->watches);
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_c=
ore.h
> index dac517156993..258f6ff38279 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -110,6 +110,9 @@ struct connection
> 	/* Is this connection ignored? */
> 	bool is_ignored;
>=20
> +	/* Is the connection stalled? */
> +	bool is_stalled;
> +
> 	/* Buffered incoming data. */
> 	struct buffered_data *in;
>=20
> --=20
> 2.17.1
>=20
>=20


