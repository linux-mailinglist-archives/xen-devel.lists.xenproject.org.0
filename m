Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37DA5902C7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384747.620194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMAqd-0006VO-Jt; Thu, 11 Aug 2022 16:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384747.620194; Thu, 11 Aug 2022 16:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMAqd-0006Sp-Fr; Thu, 11 Aug 2022 16:15:51 +0000
Received: by outflank-mailman (input) for mailman id 384747;
 Thu, 11 Aug 2022 16:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO9K=YP=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oMAqc-0006Sj-JR
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:15:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc2d2a27-1990-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:15:48 +0200 (CEST)
Received: from DU2PR04CA0241.eurprd04.prod.outlook.com (2603:10a6:10:28e::6)
 by AM8PR08MB6369.eurprd08.prod.outlook.com (2603:10a6:20b:354::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 16:15:45 +0000
Received: from DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::b8) by DU2PR04CA0241.outlook.office365.com
 (2603:10a6:10:28e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.12 via Frontend
 Transport; Thu, 11 Aug 2022 16:15:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT056.mail.protection.outlook.com (100.127.142.88) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 16:15:44 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 11 Aug 2022 16:15:44 +0000
Received: from 958a58905dff.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC2E35DD-3CBF-4841-9DFA-052A670C552A.1; 
 Thu, 11 Aug 2022 16:15:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 958a58905dff.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Aug 2022 16:15:37 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM0PR08MB3634.eurprd08.prod.outlook.com (2603:10a6:208:d6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 11 Aug
 2022 16:15:36 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%4]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 16:15:36 +0000
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
X-Inumbo-ID: dc2d2a27-1990-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bAZuHkTKWuXzp8xSGD8HLjcgztGI7z9WlLQESko7wYZsGmypsjT963FkGz44p51qWZX1hoPb+33rk/RaeLbWQmo9kiyktzGa9VVezQISTF5PDmMlGQ647HMi6MO8dOQHp9NYuMrurTn3SEcljk7YIuN6gvpDvGebleZmTFeQ/NaQfzvHmrFWBDcNCVL/W0S2VKPPyd8Z8FPO2BM53l3+Z1GMXtQG3OhvpcqGutfjO6wWGmMsdjbNNi7r3LmSAeBAMuq5haylLHayH2lzN0Dg/aXJaS8JMFIkwa7yvvP62fwAzoVxxwO5/IspPSlZYg9snt7j6nW85Ioug3zmISWOyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmWPOcTyyFe8ypUr/fHSs5KlmXuh1gcUOk0+I3vMoPo=;
 b=MQGiaoIRPTD4BFXxPMG7ZO7P431xsNSRFPV8MeOq8SI48H6ipUwzmRc1G5SwAwiRZPe/kfykR0Yaz595lJEPRAnJzOvtlYlgDp+AwzJpdMDLuwWd2iGve0d4hPHFeckT+/eLjM3w/J9Cmr4mAJbsRQsYculthrtw6RcchzT2N8Wh3cnzwnsHGIUTjTkPBFOYdekbUPkOGPhMSwp+OE2T3PlXJS5rTBeCdOmrl+8cVi8fp3jVuezV2AXmUdxWvM+9sWhnE2yv8k07YGmDJd8CuUs7ncf2Epne5vIERTxdYDj6rcn8hYHOimoj02Pujfvw3JF6erd25ANRUWj9YE+S3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmWPOcTyyFe8ypUr/fHSs5KlmXuh1gcUOk0+I3vMoPo=;
 b=HJPp43Uqz3bHQF64FKPDKlbEnaHLtRa5WZia6qQBqHRbyNGnI4Dw4DsMe7LnqP1mzZSU3Xhyj3JF/xdokR7rL3WbXMPRDwnnP9eZ05jt8Mlngio4uqWIeGKg6jJDJ8SELAM12P1H3Vr8FWg50Cl1xC/V2U1oONlRGw/F0WOezAg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 749d0d732aa18f9a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgbGTn7URAP9e7yxKI3TiXjIl/G3D5MCKd+UUo5HACfkE1SJ+zaa0loUbSAKn6GtkGj8VrZS37AABfV9vdQ2YZxgi8k7Ne4W7EkT2yIR1uof4Wn+ikfT+tFMTTMuCc1B3iLydam6wr58T4J45W0L6DN+7aHhukucC18/ZqqFyPeCMv+cZtluqe22lc05kFtqOskB1ot9Gfg2uJq7Jge01A18Z+gM0/2pMFWN0HlWUTEN2krW7FGF4d0SQmMd+BwOiGB5dXAE49R5fOmapfH2IbgEjjazfg/n4aj+YDefOPH4KbRHxraXdHgRK89Ggp8Iiwics+qYIhdrWo4R5MYZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmWPOcTyyFe8ypUr/fHSs5KlmXuh1gcUOk0+I3vMoPo=;
 b=Su4EYR1IEvsKIi6EXW7wGolSLdr73HQJFHppRTGThr5/3oDKEjSus+mgVxtdF4XLtCCQAZfRwafTeYozNHJ83e1wGNvkqfUKF7xpDeV3gqVUASWxI3bTZq8WAbzrXteMPO3CH/vTqtgLszHh5ECkwhoeEbs/bFEWIyDSI9opgyvEATzHJZbpAOZDDgpH985av/FxXfuibbOdMWPsz3dv4L/tmQpriLEe8dz65zHUolrRrKZXJoO0ePXoAedeaYegxOSUMIpVBDUrno9o8n2n7YDGZuEsAhj9eBCyq5yAdufGzpscbpOINc+dSeRaxrg8B7EeqFvaiP+zZeG8W/xIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmWPOcTyyFe8ypUr/fHSs5KlmXuh1gcUOk0+I3vMoPo=;
 b=HJPp43Uqz3bHQF64FKPDKlbEnaHLtRa5WZia6qQBqHRbyNGnI4Dw4DsMe7LnqP1mzZSU3Xhyj3JF/xdokR7rL3WbXMPRDwnnP9eZ05jt8Mlngio4uqWIeGKg6jJDJ8SELAM12P1H3Vr8FWg50Cl1xC/V2U1oONlRGw/F0WOezAg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] PCI: simplify (and thus correct)
 pci_get_pdev{,_by_domain}()
Thread-Topic: [PATCH v2 1/3] PCI: simplify (and thus correct)
 pci_get_pdev{,_by_domain}()
Thread-Index: AQHYrXBYbAi5RKJo+EWRwqCP3VXH1K2p4E0A
Date: Thu, 11 Aug 2022 16:15:36 +0000
Message-ID: <19F45D6B-45E6-4F10-B6F7-089796E0D5D4@arm.com>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <ad2d9405-9712-79bd-16d7-666ce79bcb3c@suse.com>
In-Reply-To: <ad2d9405-9712-79bd-16d7-666ce79bcb3c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4444ef01-2d87-44b3-4bd1-08da7bb4beac
x-ms-traffictypediagnostic:
	AM0PR08MB3634:EE_|DBAEUR03FT056:EE_|AM8PR08MB6369:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 REPeaVU/2JoE4WajHF9PVtpvzjR9e7KFktA2OD5FCC0QijVt7yp+mK17csIHRkaR5xanzsuen4t3weYU0JmcnQRjNsHH198jw5z0mUx01B+XsSTmepNF0H3VFUyaLwRoAkojLLAXVZblDksxPmQyHb3DgwE9HUjckHFORzPLX8+8Y0RrqDerxIgXFrJpbGwDca6DtWXVBlmWLsp8Mh6XKaHaIxhMM/Si8NNH70a2c+en5gLnxC/pwb/DNc/SYR0kLJz6RmqLxw50ddlhAt7RkM0tx6k8MmjW5WSoZ8h78ys5p4kRMFxNqwPBstbxGF+BI1U4545DRSCgbplkaw7cHHne3YkSXoD0919Apnykh8/bhu6RBhfDBKvBhrLPHdxWjztnNzc4vbqW9Tt7jB4Vwadu1yf1FIQbrNF0v2dmq7PKkNjvej1XDGVjS9JC2pYsfX52hGCVpvOSkud3XeAncqimHjNSdPSkRSa3hPWw6tnJsWTtg1UBu2KoVdqZeEy21MwzJqIr3CPJY09n2/9s0ByYaF+Fp3SBmub2FXSepoVtXWh106LWKysdqWBwL5SjBPQRs+v0gjgPSnFLjwKIpXV7g0MXUTNbZk7pZri1d+wbdDpV0Kdna+w7Md6iRQAhKe2jCmWsz3gft0nwErPa1KgKypIXCM/jJoLa5IciMwYgumJSgru4MKi2Xogbz98pNIwmkfkfuOO5skakMdQWIMV4XC7gbmfi+woSPazEZsjRelMfo8mK9XTj46tHhV9WY7eTY6p3OAri8kCyn84QzHQgUkRa45Yr/zNOH9Wb7yBQ4NAREJtEUe0Rg39AmZrOO7YT+9xoZlvXS+z6rbtyrA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(2616005)(2906002)(478600001)(33656002)(6916009)(122000001)(86362001)(64756008)(36756003)(54906003)(8936002)(5660300002)(66946007)(8676002)(26005)(6512007)(41300700001)(76116006)(38100700002)(53546011)(38070700005)(66446008)(4326008)(316002)(71200400001)(91956017)(66556008)(66476007)(186003)(6506007)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9D751966CBE73C44BEB01E7CB17CC3D6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3634
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ebb72f23-786c-4912-0058-08da7bb4b98b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FOFbc7JgZuHLRK/HgOZdBzn/s8IhviVpMC0z3nExlL5wUr1LYuexhAkZzyaczgPCtY49yYuo9ThfSl4L3wiQ8J1RbQtRxzJWxPFuqxG5VoSNjzb9XR70aWL51K/S++NjffnrZJzsQ+mmOppsYgiwem+zmnNXeey4xKmquf37PzsZp69PxHQXd8lVQozADruZF6qjbXDClu0ZEuWdB5vkIHn2gJ3u9v3fYXaNvBP0s68YajpE2rWtFczKGjADLFo2+gBliA82QEbG0JFpa3bg3xmmV/gDUab8QP6rRVoWv5mx6pRGx+vW9qBrpU5iT3KYak2dwBCv7jiKE1QLG5Lb15ik56wF+6Py6LnJP2cSabZrG41VE49CMZgpGrsfTsCKe4tiPj0YLMedTsQ1YsXBwKGssQXgO0HXeTPyylqRR2jbxPhINwUINuURdTnNcMNzUfxIFtasJ2EQQUxMatoIjlZuJMQ30gPUpdMypCNoN2aNMk/nmJqjHnw9aNZ2MbCT3vDjZ09ehUw24NF1FOXwN1GE0R4VO6SvBzmp2bh9ubdESOavLNM4t11FCPPA+VCXFktsRe4hjLWJq+u/9K6iscqerP+vK5SH2g1B6R4QBP2mJY8WNj3VfluwL86sSn9c7Z3MVFbWzMAWnAglHrV+OqqVbepWxXOpnkszsq9+1yNGdpa3MEE6V6ceJbOs32Ie+Jks20Md91auMTvc40XnxHkDGDFiOEZu7+lwyqmq2/9HiBLoyI7frsEBNgw2xG+eB4Bhc3jAeo0wLjk4jlvlaItsE41OCgqihTqIIxH19KA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(396003)(136003)(36840700001)(40470700004)(46966006)(26005)(356005)(81166007)(6512007)(82310400005)(82740400003)(53546011)(6486002)(40460700003)(8936002)(6862004)(86362001)(478600001)(6506007)(5660300002)(33656002)(41300700001)(8676002)(4326008)(70586007)(2906002)(70206006)(40480700001)(36756003)(2616005)(54906003)(186003)(107886003)(336012)(47076005)(36860700001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 16:15:44.9482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4444ef01-2d87-44b3-4bd1-08da7bb4beac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6369

Hi Jan,

> On 11 Aug 2022, at 11:51 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> The last "wildcard" use of either function went away with f591755823a7
> ("IOMMU/PCI: don't let domain cleanup continue when device de-assignment
> failed"). Don't allow them to be called this way anymore. Besides
> simplifying the code this also fixes two bugs:
>=20
> 1) When seg !=3D -1, the outer loops should have been terminated after th=
e
>   first iteration, or else a device with the same BDF but on another
>   segment could be found / returned.
>=20
> Reported-by: Rahul Singh <rahul.singh@arm.com>
>=20
> 2) When seg =3D=3D -1 calling get_pseg() is bogus. The function (taking a
>   u16) would look for segment 0xffff, which might exist. If it exists,
>   we might then find / return a wrong device.
>=20
> In pci_get_pdev_by_domain() also switch from using the per-segment list
> to using the per-domain one, with the exception of the hardware domain
> (see the code comment there).
>=20
> While there also constify "pseg" and drop "pdev"'s already previously
> unnecessary initializer.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I tested the patch series on ARM  and it works as expected.

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
=20

