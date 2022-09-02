Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DFF5AADF0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 13:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397557.638169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU5Jg-0006ae-C1; Fri, 02 Sep 2022 11:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397557.638169; Fri, 02 Sep 2022 11:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU5Jg-0006Xz-94; Fri, 02 Sep 2022 11:58:32 +0000
Received: by outflank-mailman (input) for mailman id 397557;
 Fri, 02 Sep 2022 11:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCtF=ZF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oU5Je-0006Xt-OI
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 11:58:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e7b9f84-2ab6-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 13:58:28 +0200 (CEST)
Received: from FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::7) by
 AS2PR08MB8622.eurprd08.prod.outlook.com (2603:10a6:20b:55d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 11:58:26 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::3b) by FR3P281CA0148.outlook.office365.com
 (2603:10a6:d10:95::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.7 via Frontend
 Transport; Fri, 2 Sep 2022 11:58:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 11:58:26 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Fri, 02 Sep 2022 11:58:25 +0000
Received: from 652b8b2e35e4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D47D9A34-1816-4666-AFE6-E252A358879D.1; 
 Fri, 02 Sep 2022 11:58:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 652b8b2e35e4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 11:58:19 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 11:58:17 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::d889:1b83:c030:8d71]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::d889:1b83:c030:8d71%7]) with mapi id 15.20.5588.011; Fri, 2 Sep 2022
 11:58:17 +0000
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
X-Inumbo-ID: 8e7b9f84-2ab6-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EIbxU4FiL21fPaWUlJy6SvKBqUkW39UP01wLLlZQIkc4RjZWjRisezg+77xV0Hdap4eGr+eecgMMCRtkkg+rS6mq06hxbq8wvvttfe85TsH/FrSu/iaYkCqENz2D21QbtJol6R4nZ4KLFiwXHMy0+CIHZL9p5OGiJXB1LqdnqbH9crhD7rWILa96u/4ufUNsy8mqvOfpY1fWUcByxoK01iFOJtrXFs2bqt84LIKEFr3ZOB4zUuPZ91uGRupYMfvJRK4wEEYmSzSvCCwKVPnfsRoKSSGFKMKPC3pR5JU6c3iK346YWCRby+51IEVuv8pGkhVkYMXj2poxSX/4MLUmzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v77W0OIem+V5+t0XY7TRXqjtWXEVHZBee2Uxeph3ERU=;
 b=ILfuG6/OlnEnbX+Vfp+w9cnS27K7YVWImKABWYwtLSeDECJZu/MS/MNCgzdGL0oSagGKz1oahTkKpumxDPeNF2KQ6RaUfFeiqJcexYsJjHFHr1/3Wf1wz6eUrHQ1yZL8TXOna4Jv7T6II9E9c7bHMM7zJAt6NqFxln//Ex6UnhqdDq6O44jsE3T5YigacyLWQFUWdPu3lp1h20bpjE/Av9klRlyjaq07QB6r+g6ij0f363BH+BurfKTwin+J4tk+fcgmtW0uwxQQbegHI+QlW+YK0nPiK9zzA0LznzWWtaAjvAQLFgq13oTMDCk9kw2sbIPObj3PLgY8kOZCsM6O9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v77W0OIem+V5+t0XY7TRXqjtWXEVHZBee2Uxeph3ERU=;
 b=2pEkOPmKuedxJsbqSuqrU55ET2BA3IVRuGT35jlZOWd4ar/OPfohedG+IV+cFXq7sEiVFbFKdGze/VJx+5stlPt+0UUWxUzjqOD5UN1KRmG5ZMGpqMtAmkFLUaRfXVp3Q6k6W/qcoBB1iEltcJV41s+99np8WUekT9zn/kx1JUk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 23c65229d01dd821
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CotegCAyTbt5DO3l3o/Y0INnmISoJcH3wJmTKnV7IQGjN0aRYeif7AesfeVXf3SHQug25uvgYH9TmALUhHWB8G2Ioxo9RfcGt0gbqYoytBauL735a735m7W2OTBgmWt75ILQZKRC4BhqEU/pZSBCh4PYNLjvisdiW+jAUGrPQDEbAkOodoFevqqOEbCe2A7PlmhyIqSXcd/CZuZ4BaKqUdjfVA5ntx4/wsFhtWH5+mgCasD6iu/Rk85tRlrA+wlQ7KwIExer4oq7cYEKLex3PzDa/tzTMk3TkibRt0NTO1cwAZGddlErak44lfKOjdEuKbcJ8aFlQHkdVgBE9dGNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v77W0OIem+V5+t0XY7TRXqjtWXEVHZBee2Uxeph3ERU=;
 b=W3q8QW3EsYTG9ZYZswZ+t9QDRap1PwJ2NEB3lB9MVQmWoxz656Jcb11anPH6GAfbelAb70RlUp4q3Oyn4+mXYuf2oaviNmI+uODzTacfS3TXhteW4pkHMYvYXmiiGLdvP9ge2ZL3ruuWtmo6AEaDTulusn01n/S7UajjB4X35KPeM7w0FQHseex657oWnF2DX5w+E/pR/GaKZOoMsscCSjpvfinmVANBRQrh0XHcHtAkjbO+b7pLZ3BbH83htuwIGpyD+Y85m3pkQwenzVS4tixy/UmYxWbFcLwajWi0m2N7LtoxU1irXhU4OOU023dhMxaMI35aRWJj1BPGk2O4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v77W0OIem+V5+t0XY7TRXqjtWXEVHZBee2Uxeph3ERU=;
 b=2pEkOPmKuedxJsbqSuqrU55ET2BA3IVRuGT35jlZOWd4ar/OPfohedG+IV+cFXq7sEiVFbFKdGze/VJx+5stlPt+0UUWxUzjqOD5UN1KRmG5ZMGpqMtAmkFLUaRfXVp3Q6k6W/qcoBB1iEltcJV41s+99np8WUekT9zn/kx1JUk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [for-4.17 1/3] automation: qemu-alpine-arm64-gcc: Use kernel 5.19
Thread-Topic: [for-4.17 1/3] automation: qemu-alpine-arm64-gcc: Use kernel
 5.19
Thread-Index: AQHYvpsR/fswdO6djUeMGdO1y2PhXa3MCVqA
Date: Fri, 2 Sep 2022 11:58:16 +0000
Message-ID: <BA4253C5-2900-4B52-96E6-6D0FB2804597@arm.com>
References: <20220902070905.1262-1-michal.orzel@amd.com>
 <20220902070905.1262-2-michal.orzel@amd.com>
In-Reply-To: <20220902070905.1262-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ea2a8ab0-b346-4537-ab07-08da8cda718d
x-ms-traffictypediagnostic:
	DB8PR08MB5481:EE_|VE1EUR03FT055:EE_|AS2PR08MB8622:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wIZyFpBPdKMaXRXFWwu3/DqK0StDhg29Jf6IG2diUl+BGqgLK/y8g/v0THLn8eKOp5cw0nvoCH1vx2IjWps/O9DxhV15eOOSH/1aC/ZpMb2XwG+hnvP17vhsArxXKgx42LPmpg5uVRT8EcqymY1DZVp9req6rWKDz4a7rygEwK/PKH47TwUGiuovKmgomFJVmOWIeSFJZ+WyRPyGzfpQTJNWRSkKbuNZwtKkGG/2jOYsZn5yRztQJlPe9nrD08uPdWb2BpIikOZjGHQzsv4pJy8FuVlqPjib38hyHZ1iAfrY7+2py6qilf/P80hCcVtieTucljd9hHwhkX/SQZnXmrxz4sOlxadvIY52wGnFgVtMQB5uXJZS3olrDeKeprA2/Lr1oapFU3wD3z5aiD65x/+S6+mlx3EpL8MV73P4UyX5H1pKEKK7s3UGJ+MKK6GDw9OcHJKTNYV9QfJ9J8I4CbKeLkg+4aVj3u+ynnihBdCngxZ/1yDKUUKJ0wro+rv1Yr6Jnl7ggoFf5NYGhx8tfHtoaw4frwJLROdkKdp5Ba0IHXaS7i7YRUHvjikfVQ188P756ZGdJCCFMXXSjXvRqL111qhjWs71CLIb4eyjgTcyAEI3qjWiQ7qE0AVKxKOzHzo6zgHG75dPGX1wVDhLlt9El4muGmbtmCC5R7f+id9PC3xDQq0XaSGTcL+put2nEVa9E68WWAimvmjiSfL/foLgfD75aJ91pw0mqZJtSvaswPPj5e140P/FmsumgdW2YuipKJZRuGTSEo/fTXw1b7dCFnWWvGlcvqlE8t9Gp20=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(91956017)(76116006)(86362001)(66476007)(38100700002)(66946007)(66446008)(8676002)(66556008)(64756008)(4326008)(316002)(6506007)(6512007)(54906003)(38070700005)(6916009)(41300700001)(26005)(186003)(53546011)(2616005)(71200400001)(122000001)(478600001)(5660300002)(2906002)(6486002)(4744005)(8936002)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CFBEDB203FE984FA4B9448E3574A3A9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5481
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f4be583a-5d94-4ba5-1ade-08da8cda6bfe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7BRpdGE0bU45f4hAwkd9Z7X7KaOkApKMcKwKExNYV8K7lMzU19DAwdRiJGd1nrDiBxd0bf56UZ3T3ARuL87B4tnc0QQFj80klPSeDb2QX8N6iSEj1q69b4IpiZTPEHi1dncpOU+W9sdk7iIpjY3+0vKOU9gsw7DVtK6GHTmyLlLLqH2LWBBgS3CaILAFB4pUcjW++9k/1YbEeHPBqqamrXuAVsuz6NQppDKTr3AiV7ui/rgx4TqasFSLOy/zg/J6fpj6z+h20vJwxiRQZHU9tqJCksqtgVScq/j/GBATkVf+G6w07QA6eYFSHqzaEDyplXpPUXt40vMGLcn3p715jRKKun2rGuaxehD7CfVVsXXyC4N30YnBAyUD+2VtEkhmgvBTPzpLpE/JVMP7YYMaqLSG2HFS3Rq6IzKCj39EOhPbDKEizJ0cPFmHFCuHfy2NWPgucjqpPKGyOi13x4MlyevtD5s++v7J2t0TtAqG7AUWLGjOuIY8IZ5o22908lbbmxCXrxCoYF1wSFqzAWfHuzijvQob4snaVLXJGVQVP0to1zu16V3v+z15wL7jROIc1Rab3ANduDMtm+TPWRBvuhYZPs1fBYjDNNt0Blgd+lLrX2bAwpNvZefoYwirw4OV3tiI9Iht80hwqPnHnA6+jN009Rks/U93fIgKHslbszXk5/U0mZ9eheNRSroBpQuBX3zSDMxxgr9SbDEBBTlygyZGybIm+0wB9z7QQ2HVsUgK2Hz9/s2ZFMDYeTrDoRDKT1wCdmq7j3sZg3bFhD2XFQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(136003)(346002)(36840700001)(40470700004)(46966006)(478600001)(6506007)(33656002)(8676002)(107886003)(4326008)(54906003)(41300700001)(316002)(6486002)(82310400005)(6512007)(53546011)(26005)(356005)(86362001)(2616005)(336012)(36756003)(47076005)(36860700001)(81166007)(186003)(2906002)(5660300002)(40480700001)(6862004)(4744005)(70586007)(70206006)(8936002)(40460700003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 11:58:26.1121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2a8ab0-b346-4537-ab07-08da8cda718d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8622

DQoNCj4gT24gMiBTZXAgMjAyMiwgYXQgMDg6MDksIE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVs
QGFtZC5jb20+IHdyb3RlOg0KPiANCj4gQWZ0ZXIgcWVtdS1zbW9rZS1hcm02NCB3YXMgY2hhbmdl
ZCB0byB1c2Uga2VybmVsIDUuMTkgd2UgZW5kIHVwIGhhdmluZw0KPiB0d28ga2VybmVsIGNvbmZp
Z3VyYXRpb25zLiBUaGlzIGlzIHNvbWV0aGluZyBub3QgbmVlZGVkIGFuZCBtYWludGFpbmluZw0K
PiBhIHNpbmdsZSBrZXJuZWwgdmVyc2lvbiBpcyBhbHdheXMgZWFzaWVyLiBNb2RpZnkgcWVtdS1h
bHBpbmUtYXJtNjQtZ2NjDQo+IHRvIHVzZSBrZXJuZWwgNS4xOSBhbmQgcmVtb3ZlIGtlcm5lbCA1
LjkgZnJvbSB0ZXN0cy1hcnRpZmFjdHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgT3J6
ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KDQpIaSBNaWNoYWwsDQoNCknigJltIG5vdCBhbiBl
eHBlcnQgb2YgZ2l0bGFiLWNpLCBidXQgdGhlIGNoYW5nZXMgbG9va3Mgb2sgdG8gbWU6DQoNClJl
dmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0K

