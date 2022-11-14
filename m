Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2827F627778
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 09:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443174.697681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUkW-00058B-90; Mon, 14 Nov 2022 08:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443174.697681; Mon, 14 Nov 2022 08:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUkW-00054c-5J; Mon, 14 Nov 2022 08:23:24 +0000
Received: by outflank-mailman (input) for mailman id 443174;
 Mon, 14 Nov 2022 08:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eg9/=3O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ouUkU-0004kZ-Fi
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 08:23:22 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150042.outbound.protection.outlook.com [40.107.15.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98d15b0a-63f5-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 09:23:20 +0100 (CET)
Received: from AM6P194CA0079.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::20)
 by VI1PR08MB9958.eurprd08.prod.outlook.com (2603:10a6:800:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 08:23:18 +0000
Received: from AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::97) by AM6P194CA0079.outlook.office365.com
 (2603:10a6:209:8f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 08:23:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT064.mail.protection.outlook.com (100.127.140.127) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 08:23:17 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Mon, 14 Nov 2022 08:23:17 +0000
Received: from 19d26e4bc034.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83093BC0-515B-43F7-A9DB-9D0FC12365B5.1; 
 Mon, 14 Nov 2022 08:23:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19d26e4bc034.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 08:23:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8470.eurprd08.prod.outlook.com (2603:10a6:10:406::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.5; Mon, 14 Nov
 2022 08:23:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Mon, 14 Nov 2022
 08:23:05 +0000
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
X-Inumbo-ID: 98d15b0a-63f5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NEVrn6M7TTUMIOgnfeioFwJQ6KASZmLS1OJhIHdzIRGGd1Abz8znyQHSCPOj7WIbfaRu3hAtsTUBCrlxQtU155YlL4LSYm5eWnkmMJV2D0Nwh/8e70crBcOAJK0uWQcjs9Yx5To+S6lnxInl0H0NwE4lS/aAitRRXAVdkXX62okiEsI70IWG+lqWxptXKOfvmW0nNLChgNyJCJf50HAjGu+Bju17j3YJsT3blO8USPLlclEzQbIaH/o5tKqrZdRwzpywOQ5n1eYbi6wjwSYvrt25+5F7yJ/odifWW2TUiLJsJiVEL5OF8Fupz6n3NUtFuGbCIOqzUVHlPvJPHeaIZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udlqaRv59/uhgmT2ydhP1Tf+ZQ80ekLRtjCVDZyr1u8=;
 b=UD1B5zQreEZ8SzE3xAhaWD3FaofAETXqUePnVCXzKHzVKDwrhL+BqJ0bKTnDRVQ6q5fmlesxfWDEhT2DVXtLK5JALouKfR9VewQsdPaVH4lei6g4Br2IeH0d+b8Po4xq6rn2em6GVLvkbhaZi/kXrnrdsKs6TLU6QlKvwHCGL10wKA6C1f64Vh8wb7hYpIhVoZeog5W6nhKwGP/yIVekkrVBJ6di3YH04AE11YK2ouGkN9cFOUvDU2yczqc4qrfYP1TY+kVuaSgZFDv+1ibTfDgRdUMJCrTzMgJpHPLXq6IJJmwdCQH8NPECL41Rl3HYsYdwMRnnToBevcdQ1oJhVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udlqaRv59/uhgmT2ydhP1Tf+ZQ80ekLRtjCVDZyr1u8=;
 b=rvNUQDxpU9uQ1XlUC+MjGpHbm+LaPj8XZ1cH4VL/bhN/v/QgO2boYteXwzmMEcSLqIsLRsx+B4TOEJ9CCC1Ja83uOMYhvjLv31ol1e7lNyJ0BgOK+ssa4W22FxmS53WXcV12NeqdAPc9xhhqvTzU4ZW2v6LbH+DbjFDfoXo3nuY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGfCd+F+xZOuYX2RgQiDHrqCP8OocjCtijBuarku4yr7Pd8h+qujNQUleJiSsGZ6jxmXxwNHMNsvwn3kLF/VVd4XQjUho31SVcSmkIpgOrgMJ+w8CSqBwIIVOB6fG3CsjGPuAbRjJpM6mpaHAYFNyNcFMlw3IYdkcORd4WtmDmf37Gx/FqcygUDIIez4j+36rs75pKYjgyDX8loEC3f+FY2FaqvaqbtfZdvbZ/S461GFz0P3KA120c1rnsMYFvEMDc4SvMa6nRXKJ1qxeP2UspeJbSKdP1HVs48Ta137vZgPnEfdFJK18c3Dh8zia/+7zKaV0tS+PFlWAipDIso2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udlqaRv59/uhgmT2ydhP1Tf+ZQ80ekLRtjCVDZyr1u8=;
 b=YIIrXFTuPRjq8hbWk6uglFL8Ty3dhkK4RGfkDeizT3XUQWCCLIp7k8MccH2Q/RxFdTRgNulgjkWkA7In3vcKXYj7gf8QzVuJ6EWaZXLMHxnKy7GoUOt/YHdGFyj7wx1nY0rZzBUv3JFBAJZQh4p/Ai6tqKZoKXmT54ehfhh1Ec+clEgfGiD6J4gNTkctcsEmZhwpMMABmWTMHw8j+Nh5pzm3pQdwUxjjN2JwpgqZHiZylvNSmdj/ZYVYW9VtVmcBeoCGHI16SaImqDsOIwqNs356x6wulSC64hz5Q5iSEKMR1TryMOO7bEEvVxCwixNxMluKByqhkl1gLUQo6wBGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udlqaRv59/uhgmT2ydhP1Tf+ZQ80ekLRtjCVDZyr1u8=;
 b=rvNUQDxpU9uQ1XlUC+MjGpHbm+LaPj8XZ1cH4VL/bhN/v/QgO2boYteXwzmMEcSLqIsLRsx+B4TOEJ9CCC1Ja83uOMYhvjLv31ol1e7lNyJ0BgOK+ssa4W22FxmS53WXcV12NeqdAPc9xhhqvTzU4ZW2v6LbH+DbjFDfoXo3nuY=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jim Fehlig <jfehlig@suse.com>, xen-devel
	<xen-devel@lists.xenproject.org>
Subject: RE: vnuma_nodes missing pnode 0
Thread-Topic: vnuma_nodes missing pnode 0
Thread-Index: AQHY9iDYCXvlfuymEU2cRUBeAI3Esq49n+1wgABcSsCAABrwAIAAAERw
Date: Mon, 14 Nov 2022 08:23:05 +0000
Message-ID:
 <AS8PR08MB7991096EC1D6F1212C37FCB892059@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <2046b5fb-2533-02fe-69e8-f46174cf825d@suse.com>
 <AS8PR08MB799119CD58863C6D1D309E9092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB799186D9559BB2A066D3349092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <d3697867-7df2-0a1e-2485-18957b3b94a2@suse.com>
In-Reply-To: <d3697867-7df2-0a1e-2485-18957b3b94a2@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 80A024D32941CE4C9584E98C7F14C9BC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8470:EE_|AM7EUR03FT064:EE_|VI1PR08MB9958:EE_
X-MS-Office365-Filtering-Correlation-Id: 067f8354-6744-4f44-1809-08dac6197bb3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SU711Vvq8vvgWEYSVhdWOILwXfSmVIoB/OV9OCcSJI6osvoY36IIgIu6macE4hCUL/1BfpLoePYZtwwkphWU285SLxjhi3BinFa0TX4d6TzMZpdSnNviMhZ6E8h1wTkjyW8cR/MdDHbWqMRYZrNUHWrHJnzVlg6MYmGyP+NVk+zteHaxxs1SbCrUoBDtAdD1oYr9JHulosIiSXe2CLUbePD2TQ9CH2vS+EldKLryfcXHQ7eHQV2tA+hPfFGE1zokNCLnxEe0aYnY+w9WqN61UvfPVxxUpP7bkHbH/vDJW048rlXYMKpIM01AeYKe/F4DSiQAHTmKICrqG7vofI8DoDSrA8s81EKNUxRrn1/UnI3XVj/PvfzdL020svTAtKkulxFYkrE3koVuBn7c6C5A5gW77iI4LH7yeKvoMeV/zMMN5AuWZqpj37y20m6k0CFOHnkXKXYAZ/4/P9hwE4j4M02g2tEdihuA22KgQY9kXBzu3BQP5BKQcdA/oBq4lQAV3mHEQe0E1N5MlYO+o9NrU3QXgLO0NduIDYmfhIxj2yQfzfLiJxScxlLnLRl2Gp3vxSChm9VDyDKEkEFVUTodPG4UTZLOhpOBfFXc8IQ72EIZY1zolZ6goCSMihMMXVJssOAxykalZ7AfKjqbpSQGa+mSk8BgJdT1BUFch1h7GceNibniw8mQxwei/aw9t3qE70Nj0Z6DOlvbzM2UQDtOFG5inQ2X+asKEwlIsyPbnsWUf8raEvfz8Pv0rD9JfMKF7OCAUZeAB7sk5rhU7kHOqA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(83380400001)(86362001)(64756008)(122000001)(38070700005)(2906002)(41300700001)(52536014)(8936002)(5660300002)(38100700002)(7116003)(8676002)(66446008)(9686003)(66476007)(66556008)(6506007)(53546011)(26005)(71200400001)(7696005)(55016003)(54906003)(76116006)(478600001)(110136005)(4326008)(316002)(66946007)(186003)(66899015)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8470
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dca640b2-e9e3-4ea3-d5fa-08dac6197417
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wv2Cbn6srD3HS/Vw3txWRndvX4xBarHF4sU9tNuxdGj+PMoBKw6FC0buxj2lk1rbnh6U3UTasEeMI6XB5o4k4FWR+NrmTjst65rrOwmL6XB01OkXbrMEmpJYi0EGUoIIUXYEGnnevf9R51K6WvcMjpTS57hiWW8yALm6THtaFYESz6fZ4frUvfrALpDLvdCJEdFoOx/6HDKUfpc33XoU3DJhIkgEfa0BEnnZPEYM0DSz2I4E0ovPrh+k/oVQV6AKlfQKpqhZX6yAF+QFpmqniIXeCyBMHY1XStOYAayV7XrX1iV0NNUxcL0rDwDUBPivThcmAKp+5ZwGCD5qAiAo/JHY7Wq/+oj5v6TIgqL9ePU7rPQgWoKwY1uCubilPWIXKTWkOarWNcnuAIxKnpiWoih15FaTmlw4I5T7ls+/Le5lYHrIKPn55qH77PZhMB1Z5gdZTovWupEkZJSFUmmvcQP1vhSdbR6dnnghhIru2W3i1ho4ZCnj3rMWacEA2Kvg9+yT2/erLJgCatU7mlVkLdyITOgCqqb8DE+prj2+/dgVsccVtJ3q35ma5IWXO/lc7gGZeakOwAYMQDZVjykHPFa/5Qg6StiA/d+nIJbOnKbEIcpL+9ttDhALCfy16HbvN23mzf4d4Tn85+GiFWAZVTGxOQ4oBAEvIyQt3FUrfv5WZQNKjgRoLirTFl1jgHbTu/PLoqe+tQEXHzerIKtnkXF0/+kykVhtjiv55rlDkCHWJkVxkB35hOEZ+K43kA9U
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39850400004)(376002)(136003)(451199015)(46966006)(36840700001)(8676002)(52536014)(4326008)(7116003)(41300700001)(336012)(47076005)(82310400005)(8936002)(5660300002)(9686003)(186003)(2906002)(316002)(53546011)(70586007)(26005)(70206006)(40480700001)(86362001)(36860700001)(33656002)(83380400001)(55016003)(82740400003)(81166007)(356005)(66899015)(54906003)(6506007)(110136005)(7696005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 08:23:17.7538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 067f8354-6744-4f44-1809-08dac6197bb3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9958

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IHZudW1hX25vZGVzIG1pc3Np
bmcgcG5vZGUgMA0KPiANCj4gT24gMTQuMTEuMjAyMiAwNzo0MywgSGVucnkgV2FuZyB3cm90ZToN
Cj4gPiBTb3JyeSwgbWlzc2VkIEFudGhvbnkgKFRoZSB0b29sc3RhY2sgbWFpbnRhaW5lcikuIEFs
c28gYWRkZWQgaGltDQo+ID4gdG8gdGhpcyB0aHJlYWQuDQo+IA0KPiBJbmRlZWQgdGhlcmUncyBu
b3RoaW5nIHg4Ni1pc2ggaW4gaGVyZSwgaXQncyBhbGwgYWJvdXQgZGF0YSByZXByZXNlbnRhdGlv
bi4NCj4gSXQgbWVyZWx5IGhhcHBlbnMgdG8gYmUgKGZvciBub3cpIHg4Ni1zcGVjaWZpYyBkYXRh
IHdoaWNoIGlzIGJlaW5nIGRlYWx0DQo+IHdpdGguDQoNClRoYW5rIHlvdSBmb3IgbG9va2luZyBp
bnRvIHRoaXMgaXNzdWUgOikNCg0KPiANCj4gSW50ZXJuYWxseSBJIGluZGljYXRlZCB0byBKaW0g
dGhhdCB0aGUgd2F5IHRoZSBjb2RlIHByZXNlbnRseSBpcyBnZW5lcmF0ZWQNCj4gaXQgbG9va3Mg
dG8gbWUgYXMgaWYgMCB3YXMgc2ltcGx5IHRha2VuIGFzIHRoZSBkZWZhdWx0IGZvciAicG5vZGUi
LiANCg0KWWVhaCB0aGlzIGFsc28gbWF0Y2hlcyBteSBmaXJzdCB0aG91Z2h0LiBJIGFsc28gZGlk
IGEgZ2l0IGJsYW1lIGFuZCBkaWRuJ3QNCnJlYWxseSBzZWUgc29tZSByZWNlbnQgY29tbWl0cyB0
aGF0IGNoYW5nZSB0aGlzIHBhcnQgb2YgbG9naWMuDQoNCj4gV2hhdCBJDQo+IGRvbid0IGtub3cg
YXQgYWxsIGlzIHdoZXRoZXIgdGhlIGNvbmNlcHQgb2YgYW55IGtpbmQgb2YgZGVmYXVsdCBpcyBh
Y3R1YWxseQ0KPiB2YWxpZCBpbiBqc29uIHJlcHJlc2VudGF0aW9uIG9mIGd1ZXN0IGNvbmZpZ3Mu
DQoNCkxldCdzIHNlZSBpZiBBbnRob255IGhhcyBzb21lIGlkZWFzIDopDQoNCktpbmQgcmVnYXJk
cywNCkhlbnJ5DQoNCj4gDQo+IEphbg0KPiANCj4gPj4gKEFkZCB4ODYgbWFpbnRhaW5lcnMgZm9y
IG1vcmUgdmlzaWJpbGl0eSkNCj4gPj4NCj4gPj4gSGkgeDg2IG1haW50YWluZXJzLA0KPiA+Pg0K
PiA+PiBTaW5jZSB0aGlzIHJlcG9ydCBtaWdodCBiZSByZWxhdGVkIHdpdGggdGhlIHJlbGVhc2Us
IGlmIHlvdSBoYXZlIHRpbWUsDQo+ID4+IHBsZWFzZSBoYXZlIGEgbG9vay4gVGhhbmsgeW91IHZl
cnkgbXVjaC4NCj4gPj4NCj4gPj4gS2luZCByZWdhcmRzLA0KPiA+PiBIZW5yeQ0KDQo=

