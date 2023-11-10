Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A47E7AD9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630026.982676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NqS-0003W1-4R; Fri, 10 Nov 2023 09:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630026.982676; Fri, 10 Nov 2023 09:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NqS-0003TL-0u; Fri, 10 Nov 2023 09:30:32 +0000
Received: by outflank-mailman (input) for mailman id 630026;
 Fri, 10 Nov 2023 09:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVdC=GX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r1NqQ-0001uY-Jf
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:30:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c93cc022-7fab-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 10:30:28 +0100 (CET)
Received: from AS9PR05CA0358.eurprd05.prod.outlook.com (2603:10a6:20b:490::25)
 by AS4PR08MB7928.eurprd08.prod.outlook.com (2603:10a6:20b:577::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 09:30:21 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:20b:490:cafe::a7) by AS9PR05CA0358.outlook.office365.com
 (2603:10a6:20b:490::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21 via Frontend
 Transport; Fri, 10 Nov 2023 09:30:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.17 via Frontend Transport; Fri, 10 Nov 2023 09:30:21 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Fri, 10 Nov 2023 09:30:21 +0000
Received: from 6dc7d8b754e4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 465F921F-378C-48F4-A59E-FE7411347A5D.1; 
 Fri, 10 Nov 2023 09:30:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6dc7d8b754e4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Nov 2023 09:30:14 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VE1PR08MB5741.eurprd08.prod.outlook.com (2603:10a6:800:1b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 09:30:12 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f6b:d51:7aa3:ad16]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f6b:d51:7aa3:ad16%6]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 09:30:12 +0000
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
X-Inumbo-ID: c93cc022-7fab-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AGLkVhUeJOW5wLlsEGIEGvbDns55trcJOQoCzbFHFAODyB8rMLbSx+z6pVJRWMywXUfp57OVhBNJ9RM0Bmt+7YrtskYcrt+gMdh190XI9u/KchJSoM2ndLXc2wWbJX9HjsDob7f656CUx/vGosmsg5aE7awkP5nXMkVuBF+L+IQ5CdraokJ1zd2vzsjsRDyP6sgnAD8WKsZsEKrtLNGeqm/WL8oTB3n6FnQWw2PyizjIazNB/4Q5Ke4aKmh5sOt+qMADhE05RlmB9Me4elLUxWAtjzLiiDWFdvKpwhNQShCqQs0d8Cha2ZvzRwW9j8HTeAs70gG0gZIopaJjgf0DLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5enDbHKeOspL9dlEtYf6mrz5pcNhPPasm7en2wriDG0=;
 b=II3D0LV9bDtU1gsxjGLKseaDn8f5oD/wBrE9Ufi5w6pMdux7yoaUrAkTY+7NIsCu9p4C+0725RoXx8u2WUfk3McstQNLw5qiVgFpI0MEQctwhWuVG0TA2FaXCbmPZsq9gR0pzQQhrquo58fXi4ReK5QD0eJH4/fQ8oUP0/49c/anHxVElG39NQCrtiMsQwTxAg92+fIiSia5ZA1irJhTQpwdnh1G4LpimEirG7FkxAviT7RmhH3Orx5UwIvf7NNcHl3eWvHcMepBNmFAM0QH2/82cuBD3XTivF3yqMJ/7vbrIAEcJVmL6GRosHvibMYJKMFD4n7ReXOseA5vzNvwLw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5enDbHKeOspL9dlEtYf6mrz5pcNhPPasm7en2wriDG0=;
 b=7Lj0cEPefME96+27sI/EadqtH4z+Y4LvenYTNPlRpj9o//AHaMU2u/mK5Lbnhl9+sccHvAyDQrBq9edYbWWY0uiJ5bVBnU73nbA7jY7jViLrD5Q7LSvM98j1v+nSKD0p49DgAlbwv6H9H3V9zm/JTPlhHBzatOono1AvkrOfY74=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 593ce6cf7aa5defe
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3T/8RnMG0XMxiNVDH2SPmi837XD1pFsFH2t2A8iy5Q1gQa2KB6y3GQWojb9DLCa7CGTqviBbT5yVIEN7WFGHaAxOsPF0LDiXBTuCcg/4zB8JspLbZUX81lUOjNS9Cph+uVdkTsh9wMUNmxlhNMw0Hubvmqa1EkoFLp04lOJ3YH0gRam9S0rEjJ7lzmnN7YTOvB8Hvt0sCSwDZhzJs2ail5wJcQRMYixDcqeDOxPf0ykqUHJRxdo8NVqoL6C9RsF8SAqzwInr9J7WwzGY8IGbWjREheHQLsBVBJoIOVyQwzckKa1zGkCUmxv+Q7TR1pSZFKdpk/uCrv5CbhKQ+lhPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5enDbHKeOspL9dlEtYf6mrz5pcNhPPasm7en2wriDG0=;
 b=iFrmht6ShkLjDr9Wunx7x/FCvG0avgG7jj+lphasR1lvSUyGSSGtqxI+uMOQsurGMGkUAHDLRnI73ao8Fo/mjiAGIgS5g85iRJKqJXWcLnayz9eJLGUqah+Uvlw/jOEZPTMQZvv9AwioQpYE5lsw2thSz3sdTNj0WaLUh7jDGbtRdO2CtGfoDfxoXUktN9oO7xzm2lOO2CgW5w1G2FJ76aS55YzMeQZmcWPyaIQMwDDefLjFr65IW27DdHytMlzWDKgXaorLzrNSLgkN4XPsKWCKNrCCDQJg41Pv6zKX3EPuwd2SfJjAjBldfEutKP1j2123Ad/rrhzdu8qqN/6NRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5enDbHKeOspL9dlEtYf6mrz5pcNhPPasm7en2wriDG0=;
 b=7Lj0cEPefME96+27sI/EadqtH4z+Y4LvenYTNPlRpj9o//AHaMU2u/mK5Lbnhl9+sccHvAyDQrBq9edYbWWY0uiJ5bVBnU73nbA7jY7jViLrD5Q7LSvM98j1v+nSKD0p49DgAlbwv6H9H3V9zm/JTPlhHBzatOono1AvkrOfY74=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/5] arm/dom0less: introduce Kconfig for dom0less
 feature
Thread-Topic: [PATCH v3 5/5] arm/dom0less: introduce Kconfig for dom0less
 feature
Thread-Index: AQHaEuwVAcRvSKcty0WG4JBMWUF0b7BzQ0WAgAABDgCAAAbKAA==
Date: Fri, 10 Nov 2023 09:30:12 +0000
Message-ID: <3BB52078-B58C-4476-867A-B29438C56487@arm.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-6-luca.fancellu@arm.com>
 <43a1c5c8-6243-4912-bf3f-f3e35b504271@amd.com>
 <9FE35A69-2EEF-4098-8F9E-B373D813AB47@arm.com>
In-Reply-To: <9FE35A69-2EEF-4098-8F9E-B373D813AB47@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VE1PR08MB5741:EE_|AM2PEPF0001C712:EE_|AS4PR08MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4a40ed-157d-4b8b-bc5e-08dbe1cfa905
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bU3JHc7qRHgTqEDS73NQupiFKTaXx/NBS4+aWy3fpt6UgckRPNfqrrwKdAvUIXJV8qBH1Rfu0BAFuVV+AsK7oJdoGxVyl3tDcm3YMbO17qT4d91liersra4TK0HMupfWKAwws0B6I6dcM0nOjBhDVVTX8NzDJcbajShizBxfsp/rcDktmtTWyErZL5iCFUgFCudkEHLldLVFHrIG1sOp64nDEG41k4qo6DzHBtyNtUR97zn6oSG9MjT0EC3TAQwQ6O5z3ZONFqek9IeqirKkuYjmc8J1lkw/j4EPpy5sWH09y9pUe0xXZJEJq2knrDHDFeTdFImA2ahFJc7LVQTNbMHjhOxR3OfXzXccOzEk7HRaCL2INdQt5D/Z/yPbLEA1+mPwB/Ukp+xrI4A1C5kTM7lx1HAF41xlcaRiFcGJEcZwVEnF6xXns+T9YQYAFHlq8+ZK/bIWAbWC97rAvqLMNoaVt1ufEcf47R8ckmAN9j3fsA+EalVg7u6mFKJlqGSDe1saqoI734Zu4igWF65Y65O5R1nbrxve5cOP8dgV/Nmlc8nltX2GJEaUOnZTng/g5nfzQyy6S0LXRZCEdQURAqw1u6sS9TecKKSqCz8UYn55I06Q76mJeezF9WHsj2Gn9ZhF8XcFM2/wf/Xx/AQQcWfm/JQNOD2nwkkvpIl/2Dw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39850400004)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(478600001)(71200400001)(6486002)(53546011)(6506007)(38070700009)(33656002)(36756003)(38100700002)(86362001)(122000001)(41300700001)(2616005)(5660300002)(6916009)(66476007)(54906003)(76116006)(66556008)(66446008)(64756008)(91956017)(6512007)(66946007)(26005)(316002)(4326008)(2906002)(8676002)(8936002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8BEA954D0894C43A7DA410289863562@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5741
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70c5b5e1-22ac-4f10-662d-08dbe1cfa3bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lE58xl4pt8715uJsA7heSqk3loIT/lqL7FK6tYxJ/yRTWGx8QjBnLcFlY6i4LvxUt5cFmfM7zUxB1DP6asAbZBQpKLZDtkm3GYdxCYUFc1vhn7Emv04Yjf12P0jSkCKLjSYVSRws2tpG60ZBqqzElLgqcMoKMdY29Rqu1OAXt4zRxEK/QD0E4Ka9RqzTCLlnsUuzfjVKmCRxLIwJ0dlCouP8m/+1A+KyC+yxNCD25FfPyqicmJcYKtyM3kd0EFAhrJxdtqBkLgK/u53vVgRX/jsaliJ2Fnkf53iBwEg8Ygzk6WuEQRqN6aJ5Fa+A6woEwAPwqhbigQ/F2pSXGP2QAaIQDUhOFxqQf7uOSk8KdSF6JizBJOPuoF7Oeiynn+/fE98IBGMn9TxYvp4bAKCsmlkL7eFGTkUZFqD+c8M5ZnGzlqakGzUTkMN6Ww4e7Js6mGzcRD/u/uDb5vpVUAuj/GQfpyEkDSyw9vKeAT9vTHcASaV9fYrXcScBce0sU17dIwzR6PApihNy9fSWpszkvsDTI6o10Ev6SATCFyQYCW12fH7UPOtpqDh8dhA+rvGOry2y7j+8gPPMZXJ8Yh8bxAjlTZeIZYVBUTp38MRQPlpqMtWSMYu2XFEdl85XheTY6887p0Ll1NE1+Nx+CXgy6uey8E1m/7AEOzJoF/O3LjeaRnuTIEdAdwrkcnDFqCe3emN2CGbkllXqPjK2wgRYUMQQDQOC3IkO7pTp+juDYgYGHJokx+23YQ4a7MaJppz4z/lCs8izuOLeKaXIDv3qxg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(36840700001)(40470700004)(46966006)(107886003)(6486002)(2616005)(6512007)(336012)(40460700003)(82740400003)(36756003)(478600001)(70586007)(54906003)(70206006)(26005)(6506007)(53546011)(316002)(4326008)(6862004)(5660300002)(8936002)(8676002)(40480700001)(2906002)(41300700001)(47076005)(36860700001)(33656002)(81166007)(356005)(86362001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 09:30:21.2793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4a40ed-157d-4b8b-bc5e-08dbe1cfa905
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7928

DQoNCj4gT24gMTAgTm92IDIwMjMsIGF0IDA5OjA1LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgTWljaGFsLA0KPiANCj4+PiANCj4+PiArY29u
ZmlnIERPTTBMRVNTX0JPT1QNCj4+PiArICAgICAgIGJvb2wgIkRvbTBsZXNzIGJvb3Qgc3VwcG9y
dCIgaWYgRVhQRVJUDQo+Pj4gKyAgICAgICBkZXBlbmRzIG9uIEFSTQ0KPj4gWW91J3JlIGluIHRo
ZSBBcm0gS2NvbmZpZywgc28gdGhlcmUgc2hvdWxkIGJlIG5vIG5lZWQgZm9yIHRoaXMgZGVwZW5k
ZW5jeSAoaXQgaXMgaW1wbGljaXQpLg0KPj4gDQo+PiBBcGFydCBmcm9tIHRoYXQsIHdlIGhhdmUg
MiBmZWF0dXJlczogc3RhdGljIG1lbSBhbmQgc3RhdGljIHNobWVtIHRoYXQgYXJlIG9ubHkgbWVh
bnQgZm9yIGRvbTBsZXNzIGRvbVVzLg0KPj4gU2hvdWxkbid0IHdlIG1ha2UgdGhlbSBkZXBlbmRl
bnQgb24gRE9NMExFU1NfQk9PVD8gT3RoZXJ3aXNlLCB3aGF0IGlzIHRoZSBwdXJwb3NlIG9mIHNl
bGVjdGluZyB0aGVtDQo+PiB3aXRoIERPTTBMRVNTX0JPT1Q9bj8NCj4gDQo+IFN1cmUsIEnigJls
bCBhZGQgdGhlIGRlcGVuZGVuY2llcyBhbmQgcmVtb3ZlIHRoZSBBUk0gb25lDQoNCkp1c3QgdG8g
YmUgc3VyZSwgaXMgaXQgd2hhdCB5b3UgYXJlIGFza2luZz8NCg0KZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9LY29uZmlnIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCmluZGV4IDAzOTlmMmZhZjcz
NC4uZDljNTM0MGZmM2EyIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCisrKyBi
L3hlbi9hcmNoL2FybS9LY29uZmlnDQpAQCAtOTAsNyArOTAsNiBAQCBjb25maWcgR0lDVjINCiAN
CiBjb25maWcgRE9NMExFU1NfQk9PVA0KICAgICAgICBib29sICJEb20wbGVzcyBib290IHN1cHBv
cnQiIGlmIEVYUEVSVA0KLSAgICAgICBkZXBlbmRzIG9uIEFSTQ0KICAgICAgICBkZWZhdWx0IHkN
CiAgICAgICAgaGVscA0KICAgICAgICAgIERvbTBsZXNzIGJvb3Qgc3VwcG9ydCBlbmFibGVzIFhl
biB0byBjcmVhdGUgYW5kIHN0YXJ0IGRvbVUgZ3Vlc3RzIGR1cmluZw0KQEAgLTIxNCw3ICsyMTMs
NyBAQCBzb3VyY2UgImFyY2gvYXJtL3RlZS9LY29uZmlnIg0KIA0KIGNvbmZpZyBTVEFUSUNfU0hN
DQogICAgICAgIGJvb2wgIlN0YXRpY2FsbHkgc2hhcmVkIG1lbW9yeSBvbiBhIGRvbTBsZXNzIHN5
c3RlbSIgaWYgVU5TVVBQT1JURUQNCi0gICAgICAgZGVwZW5kcyBvbiBTVEFUSUNfTUVNT1JZDQor
ICAgICAgIGRlcGVuZHMgb24gU1RBVElDX01FTU9SWSAmJiBET00wTEVTU19CT09UDQogICAgICAg
IGhlbHANCiAgICAgICAgICBUaGlzIG9wdGlvbiBlbmFibGVzIHN0YXRpY2FsbHkgc2hhcmVkIG1l
bW9yeSBvbiBhIGRvbTBsZXNzIHN5c3RlbS4NCiANCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tj
b25maWcgYi94ZW4vY29tbW9uL0tjb25maWcNCmluZGV4IDRkNmZlMDUxNjQxZC4uZTBlNWY0NDg1
ZDFmIDEwMDY0NA0KLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnDQorKysgYi94ZW4vY29tbW9uL0tj
b25maWcNCkBAIC0xMDAsNyArMTAwLDcgQEAgY29uZmlnIE5VTUENCiANCiBjb25maWcgU1RBVElD
X01FTU9SWQ0KICAgICAgICBib29sICJTdGF0aWMgQWxsb2NhdGlvbiBTdXBwb3J0IChVTlNVUFBP
UlRFRCkiIGlmIFVOU1VQUE9SVEVEDQotICAgICAgIGRlcGVuZHMgb24gQVJNDQorICAgICAgIGRl
cGVuZHMgb24gQVJNICYmIERPTTBMRVNTX0JPT1QNCiAgICAgICAgaGVscA0KICAgICAgICAgIFN0
YXRpYyBBbGxvY2F0aW9uIHJlZmVycyB0byBzeXN0ZW0gb3Igc3ViLXN5c3RlbShkb21haW5zKSBm
b3INCiAgICAgICAgICB3aGljaCBtZW1vcnkgYXJlYXMgYXJlIHByZS1kZWZpbmVkIGJ5IGNvbmZp
Z3VyYXRpb24gdXNpbmcgcGh5c2ljYWwNCg0KDQo=

