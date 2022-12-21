Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70468652EFF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 10:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467678.726706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7voN-0005hi-UL; Wed, 21 Dec 2022 09:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467678.726706; Wed, 21 Dec 2022 09:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7voN-0005eh-RD; Wed, 21 Dec 2022 09:54:55 +0000
Received: by outflank-mailman (input) for mailman id 467678;
 Wed, 21 Dec 2022 09:54:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCPi=4T=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1p7voM-0005eb-Lq
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 09:54:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2082.outbound.protection.outlook.com [40.107.14.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dd65ab9-8115-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 10:54:42 +0100 (CET)
Received: from FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a3::15)
 by DU0PR08MB8614.eurprd08.prod.outlook.com (2603:10a6:10:402::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Wed, 21 Dec
 2022 09:54:44 +0000
Received: from VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a3:cafe::9f) by FR3P281CA0112.outlook.office365.com
 (2603:10a6:d10:a3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.10 via Frontend
 Transport; Wed, 21 Dec 2022 09:54:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT017.mail.protection.outlook.com (100.127.145.12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.6 via Frontend Transport; Wed, 21 Dec 2022 09:54:43 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Wed, 21 Dec 2022 09:54:42 +0000
Received: from ceff234d6134.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 73D7890F-F670-4726-BF11-B7B5C26DD4AA.1; 
 Wed, 21 Dec 2022 09:54:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ceff234d6134.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Dec 2022 09:54:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB9687.eurprd08.prod.outlook.com (2603:10a6:102:2ee::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Wed, 21 Dec
 2022 09:54:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5944.006; Wed, 21 Dec 2022
 09:54:21 +0000
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
X-Inumbo-ID: 7dd65ab9-8115-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TYP5fR+DfSoZAPCJIFgeX9gLs5R8o+vrRrS4kGk9cE=;
 b=IcZpk9crdxj7hq3Qt7/bMZ8qvr2JvGIryopjd8gu5RbrVWhH6KofCWeEQQ1pqKL/oUHxgXSGRN0eJt220RTxHwtQhTBE1oXEmWrQOVWk/A0zr4EA2N3PaLVFbACp7rVnp4kZl14yTb7xZFWu8KtN1IYB5aZuNeNzGg4vqWN18uw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7137cfd5e8ab3ae3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l111vrGJLMhLDDZpUI+8FkXPYMgUxkOYdADINMOrCb8QRJ4FEdh/E3XOATXKlAxtbpN5JwU5tz1da22J8KN3VY19zYgi46/Lrb6X22UFRzB9SJBIqXvGslPjpKuqR2mv+q99EiNmmiO3slGIkf+vaSuzmP0fQnI9P78x33b1fKGjwpIsvhSKzKrLerNtWCUo9amdapBuTiSXVvPe0OarkB/++m5XAR5LDboAZPqHdj87tdWpX11DMONeY2MERq0umzTeCRSZh7UJ7/mUdtzAG5KjJufNdLqALIPnXTMQVARsItkwtkMF9xgKiYoBeaVLqAtFvAr/E5lyDV3RXJeDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TYP5fR+DfSoZAPCJIFgeX9gLs5R8o+vrRrS4kGk9cE=;
 b=nHn720Ai//GYNvqJC0bKFfnt1gINNfZ77eDyJuodEOikznnoBykaGZMt81rlKt+db5kF2IJ1sfxTDdSvYocpWEWzw/jC8YNVkbDSK/O8q7DBAZfe3P1pFZyeTz+lN4/vs2Fww5j0PMyJgkxQZGpnHagDoX7/uSClHEl/rx55+4LgHmnQv3Sj2aGZta4xSaXW/2satElIZx1Sk3Lp5FKiNSGG++NA4TWd6KTPfHiWnsf9zgUES9VbegSMuQixyEaTIvqcs75mxOhyDiuhBcdY26lQkN0CxYO1N/apOGD5Os4At8G5H0UYGiEto/zX5NjK5kU8FPtpbY70Ey2bXWl0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TYP5fR+DfSoZAPCJIFgeX9gLs5R8o+vrRrS4kGk9cE=;
 b=IcZpk9crdxj7hq3Qt7/bMZ8qvr2JvGIryopjd8gu5RbrVWhH6KofCWeEQQ1pqKL/oUHxgXSGRN0eJt220RTxHwtQhTBE1oXEmWrQOVWk/A0zr4EA2N3PaLVFbACp7rVnp4kZl14yTb7xZFWu8KtN1IYB5aZuNeNzGg4vqWN18uw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 09/18] xen: cppcheck: misra rule 20.7 deviation on
 kconfig.h
Thread-Topic: [RFC PATCH 09/18] xen: cppcheck: misra rule 20.7 deviation on
 kconfig.h
Thread-Index: AQHZFFBPeOWORFF7zU67S/8TUSweLK52h6oAgAGUD4A=
Date: Wed, 21 Dec 2022 09:54:21 +0000
Message-ID: <4E3B8FEF-10EF-4C4D-A8B1-8421FF8187A0@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-10-luca.fancellu@arm.com>
 <f1c0f957-62cb-f7e3-4a8c-1a90da683825@suse.com>
In-Reply-To: <f1c0f957-62cb-f7e3-4a8c-1a90da683825@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB9687:EE_|VI1EUR03FT017:EE_|DU0PR08MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b2f0bd-1bbf-4c71-912b-08dae3396292
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 L0wBqWREl8P1sh4rtV38tUhAeuS06BWDPXq0bXCJQHELi/VXTHAbungkN3Gcx4wcqkFly1R9oV1QAR5cNBq3Owia1RVKfkEkK92Ab8Gq5Db0YAycAeImbX2T+ZQpVaTlGGiK9G6pwXI+7U3YHh6AegB92Dul5ZREVQaA1hLLg6cUWQ4srTNg4p5CQpdMK03RfqEMPW9dsEzFhLJKn1F4C0SfLTE8hThVNfxZQhprUtA1FJoeP3XXrgZkM9ZEFoKt8xAL7MwLq0/AO/T4PW4EHvSb9kCIgSio1m5v8f6Cu5ev6ttVVEdW5a2mmQ2YQMksX34Nw4y11+9Iw3AK9LHsKBttYosPV4NrVd0GdL5MAm8xdTSeu9wzkepqhaQ9lQF85O2j7HS0Dao07SXPKPWXHi5eAXOIcX+tb9S1cOx8kaQPSynPoED2HaRzCUGfmO7VPZFQ5t2QcXDdYxXRtgU55nlDiOF7wrMKmKEnVoaajwm9TQZ01l57bN/vErnGmMM2A+kexcviScI6blus+ho+1qXxng3QHUdYl14KnEdcC+J3vB0zBttPMsc8DDfIFUH+2pcdFscworohjCS9ODFgPRawGJdjWyaMfPKo7NUjj9FrH48jU44TH+9TrLEcL5D07Cqf1QCabvOd6t0VOuc/nCHfrBSFfjIuAkQ9BAIQnSl87KWgAfJGhx/wn7s1aaiu1zZit7SNylO2Hwv5JVlEI2NOaSp0Xh00/ETp7j6cnwA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199015)(2616005)(38070700005)(316002)(2906002)(66556008)(91956017)(76116006)(66946007)(66446008)(64756008)(66476007)(4326008)(6512007)(186003)(26005)(8676002)(86362001)(71200400001)(6916009)(6486002)(53546011)(8936002)(54906003)(33656002)(122000001)(41300700001)(6506007)(38100700002)(4744005)(36756003)(478600001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AD50619A713D0749943F0A224638C9EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9687
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a9d6cb6d-c513-49b2-d882-08dae33955bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KYLi2fYhg7CoO6EPN08Mwfy/nk8Th/6uCiGg8KSUdYAcPXBorwhzwgKfNryLvmBuWBFZmI6cFujOxnzTCSLdahUFdMSOINYlaxrZEs26R27g5r2kj1kYAX9QMRIVpHXjUD1s8xrmNgnGHNx2ZgOega9JPBlFiI4gHGkSOWI+Xc5iIWRHs2fILs4M3mgzyx+1Xc/3iNGa1bl1jrGK4+PYfKXLQtV9mDLLfl5u29DY3QlHnpD6ikg8jryXnUU7ICqrnNgmRkAuECxau8RM2wIU0bR1DBv7z3GP9DotwBhJtBC98nUYSRehN9l/PmvnhxyEplLKCopg1Je0P/81YhxQLhdHzQH2OiYY8DR80EAij8ebIulZGOLYqBNh0pTdNH+Svx1RFf2K8K2UKBcwLANtGIlALclle0mjxXfDY6hOLjvz+ciuglGUuGGum3fgl4Pnc8Cho2smzaqRnY6ROZGow4Tzwk48zrCI5r4t2avhRfdNqFjuaQ/QG7DE69CknVaaRPPEpdFlX76IkOWQ63kYVBKgjvwkQESTt11y0whMcU5lAR785len1fRzaxW3ccgnjcoLp4lPPWbQZjXZXGz9FarbRJ/5eB99saLQs03FjRu2gi3q9CZy1ujIh8POsi0cRNPPWiDTFwAYfRW0eZ33XkObt7prwT+eX8gtbLyqBKBNYmt4b8bhvmzQmSpwyw9//W4J8f6E97DLo+1ye31msQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(186003)(6512007)(26005)(6506007)(36756003)(40480700001)(36860700001)(53546011)(81166007)(5660300002)(70206006)(86362001)(2616005)(336012)(82740400003)(82310400005)(8936002)(33656002)(47076005)(356005)(2906002)(40460700003)(6862004)(4744005)(316002)(54906003)(41300700001)(6486002)(70586007)(4326008)(8676002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 09:54:43.1666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b2f0bd-1bbf-4c71-912b-08dae3396292
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8614



> On 20 Dec 2022, at 09:48, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 20.12.2022 09:50, Luca Fancellu wrote:
>> Cppcheck has found a violation of rule 20.7 for the macro
>> __config_enabled but the preprocessor branch where this macro is
>> defined should not be analysed by cppcheck when CPPCHECK macro is
>> defined, hence this is a false positive of the tool and we can
>> safely suppress the finding.
>=20
> So what was commit 43aa3f6e72d3's ("xen/build: Add cppcheck and
> cppcheck-html make rules") adjustment to the file about then?

Yes the commit is right, cppcheck itself needs that, the problem here
comes from the misra add-on (the cppcheck component that does the
MISRA analysis) that is wrong.

Anyway I will drop this patch together with all the false-positive on the
Tool for now.

>=20
> Jan
>=20


