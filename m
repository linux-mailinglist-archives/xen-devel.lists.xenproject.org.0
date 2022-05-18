Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7723A52B7B6
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331919.555546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGtq-00009J-Me; Wed, 18 May 2022 10:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331919.555546; Wed, 18 May 2022 10:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGtq-000064-J7; Wed, 18 May 2022 10:27:26 +0000
Received: by outflank-mailman (input) for mailman id 331919;
 Wed, 18 May 2022 10:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ceor=V2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nrGto-00005t-R8
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:27:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b5121a8-d695-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 12:27:23 +0200 (CEST)
Received: from AS9PR06CA0337.eurprd06.prod.outlook.com (2603:10a6:20b:466::13)
 by AM9PR08MB6260.eurprd08.prod.outlook.com (2603:10a6:20b:283::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 10:27:21 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::51) by AS9PR06CA0337.outlook.office365.com
 (2603:10a6:20b:466::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Wed, 18 May 2022 10:27:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 10:27:21 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Wed, 18 May 2022 10:27:21 +0000
Received: from 2fd44b83d5b7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE9BBF76-D928-44FF-9D3D-95A37BF912DF.1; 
 Wed, 18 May 2022 10:27:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2fd44b83d5b7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 May 2022 10:27:15 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM6PR08MB4245.eurprd08.prod.outlook.com (2603:10a6:20b:b4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Wed, 18 May
 2022 10:27:14 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::1017:8b09:6681:c914]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::1017:8b09:6681:c914%5]) with mapi id 15.20.5273.013; Wed, 18 May 2022
 10:27:14 +0000
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
X-Inumbo-ID: 1b5121a8-d695-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jWMslMfbM4UYrt0Nj4VIMwFBHltbbcVUm2MDOKQfLdYbX6Vqzvc2LetGDT9vvAQDZznxCf4fQe1+5CF+IxvnsPt6+u3v6twsrWpEMfXVXAhiCKC4gZSddZb+xOUpvCtSixIDStoahG0WNYWXxj7+OdLNfm+AN2iE6UtPtMPzjSVVDSrDDsWaWjqf6+Hozi+n7Ax59TVyUxF+uBDhKWW6dOBLYvk8eTDtkQFaRobV8lhsN3YAkBzcPRnUokuxHNbI3nxe0gzcHvYZ0gEpPiQJ+yCGru+czOT+XhgfE0Ng1PGGn9aH2Qx4ZLPR+pMgc4vOHOEZxuVks7sSpBuy0tzKqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/u9bsegGF40ABK22xm6M3A046Sjx9mDSLTJX5HtTVE=;
 b=I4VR6YA68Jk3I7h3OiWkaF5C3+vpFVaAonNo+vL8Xw7YQUn9TYBHGdDZ0Nz73LAHMt4OT7gaVM7rBpCA3CE6cVdssR3k+yR4SiihNXx7M0wyYeuna40QIhzPic5Uu0S2yW9gsrptiFPIbVXM7lNvSE2zopPdN6jdMtM7TSUAJyUOzRfz/qQdfASoTuSoAgOtv4Pz7Mjpfojagzz8RlBbNpkHKEyEtLZMAXZH+Df662O76iwq7ut2iOMvXAtd+1CboiU+xh0pdRKwnrPigSTk+c0KjCA7UFylkdoC+QDUgSkhn/E2U77RO8mabVt1iC47UsHovc+VAvzegROXve7njg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/u9bsegGF40ABK22xm6M3A046Sjx9mDSLTJX5HtTVE=;
 b=kQkn3d/EQoZDaJczPR+dsyLpI+W3MwjF3INam8FHuUoH5rLsN3Y5Djl53LID9VmPFw3A/u4gKMaVuUsmtNzc46kRA1JNqTm5npGOBsAiFH5o5ifziuP5VkbTmcs3mANurOlYUKAzQGWrHaRbin2hhn8b425ZlDDh6eiQbNAleos=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8c05096e494dd342
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuZR1uozdd4xlgKJbBNwFGQShPhCBzOnZtNmFXy4O+aGRg7/r7luh4b9t+Lj3kiM8TtLwNHcAkztNBqp8T+9aqaAHLSKOAOEccFzw++83Mg6epM/FbcADzrc/W0YFbpm+MKCY/JXBDp/1VryF37Xcf1LVZHUafnKOZ6atkF3WdtCyqYQ31QNTFD85kGOBRgYZAzzvCg54S3JXzcNCzBzP19Ps8EOGvB8a9hZmi3Z8buY4v3o4KIxD6raz3pzMQenuABWDoMfiY+gQ5I3zRw3MaIuZFGbgGhAn89dE/wrrf6ycOnNGADAnRe3KtAM0QjHrZUf2qLas5FTfukJH+DsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/u9bsegGF40ABK22xm6M3A046Sjx9mDSLTJX5HtTVE=;
 b=jY8G4o0cNPX23fvNjSC2CIMfvx3oHOrY3NjflmWTm8ChC/0nwet6NsISW9v46yOQP1Wghe8+HC3mCf/mU+gSw+8PAOngEuDWBDfB2AOnVPunkxNTsSn43JE3gYuKRsVG8AIaCHglhc8U9TFsXKbDTakghp/YwaFnf24wVUb5C+eA8O8VKxXmNyyyWDmxN3kuIr9UrRIaCwqQxWa2nsrn4b707ezXkVCg1eTjPs8ENdaGaxxaKIa1mEuVLpqEQxrRIUiCPVr6gGLNMiEjVjk0uswJ2Y6YtAGTlasqWTQsaay6YcTy2R8CUoWBoo14tVmx3pToVoQ5gDz9KBySzUkn2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/u9bsegGF40ABK22xm6M3A046Sjx9mDSLTJX5HtTVE=;
 b=kQkn3d/EQoZDaJczPR+dsyLpI+W3MwjF3INam8FHuUoH5rLsN3Y5Djl53LID9VmPFw3A/u4gKMaVuUsmtNzc46kRA1JNqTm5npGOBsAiFH5o5ifziuP5VkbTmcs3mANurOlYUKAzQGWrHaRbin2hhn8b425ZlDDh6eiQbNAleos=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/2] xen/cpupool: Reject attempts to add a domain to
 CPUPOOLID_NONE
Thread-Topic: [PATCH 1/2] xen/cpupool: Reject attempts to add a domain to
 CPUPOOLID_NONE
Thread-Index: AQHYaiYsSobfX0tA0kCIIfR0OlvQlq0kb2CA
Date: Wed, 18 May 2022 10:27:13 +0000
Message-ID: <2D47137E-C808-4FA7-B220-7022C85BBB4F@arm.com>
References: <20220517194113.2574-1-andrew.cooper3@citrix.com>
 <20220517194113.2574-2-andrew.cooper3@citrix.com>
In-Reply-To: <20220517194113.2574-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8edbb745-4017-420c-d43d-08da38b8fe2e
x-ms-traffictypediagnostic:
	AM6PR08MB4245:EE_|AM5EUR03FT027:EE_|AM9PR08MB6260:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6260C35CF3C53BC08247E655E4D19@AM9PR08MB6260.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2gfG2UZ6T+JKBkPW2p98ixmUYzJ6jbvdv1tYhZS286qV36SpdIX0oKA+sJChfRY7sn3yOXqQMhwVCulOfQ7LYjSkG96Asg27dKOULJ/3eUwLDjfNNGXViTaryRmtlU5Alljpw4KANxpG+/MjSQazMmFr4UmDS0XJ2a/83U6fGCbYmH0Po2rUlwgg0D9nuaoBOsvkclqgr9LecCe7D7JxgTYckZAwvuzzpWTWcDjI3Ixe0b9jwnxQEQ9WJw/crzXKs53c0xFSjQIzTJ3neJ1q7wTPvLlu96OlL8MhF8pywUaQzX8qLL0aqEx30W6VC2ofGmTX6QHEHLccTfWsRgT3Uhf1Md4DHrNKTFyeHd66Qwp8aymezTLqat279/hNOnEYpbCidHrbXDE2yDs1jnOrryYZQV0aob6pTcVzWxgMi3OxCpwWkF0TEP5l6GyMTJGaes52jZ03nM+qA9hsvPV9sHWqimGC78BESHICDHEK/WBTEFbnMoyhKkclM19BqFmjgR6PtBfm6gJAegDCI6A7Vurz2YHmvGH2pf/NELSmpNSFuJrwfsuOCtqZ55LzUxH9ID5+R1ELc7eF4/mKmsewC8L4ZxX9GZO8zqTC0PQ89nIAObiyHB5DVqU33jbOSpaK/sFW1WZyE8PE0lj3R+FysGx1ExiqU+fCXdWVpIqPj1+NfRqLDF+EW+SpvT2qrZ3ZnL/HQQvfnqBqBcGriBAhmfE4hizwxWqAv3TfUjswRQFm/cTPQ5+g3PJEgCXko4Wm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(122000001)(38070700005)(316002)(2616005)(6512007)(6486002)(6506007)(2906002)(86362001)(66476007)(64756008)(508600001)(8936002)(53546011)(71200400001)(8676002)(26005)(91956017)(76116006)(4326008)(66446008)(33656002)(6916009)(186003)(38100700002)(54906003)(5660300002)(66556008)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DA80ECD5E48FD44B03FD023C89CA7BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4245
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f0491246-698d-43cb-924d-08da38b8f9a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Inidpx6Oe8f2iwXUUd0f6Gv17UtvYH0dAxOuov1gCfvx+Xb2GucF2pBMI4UAgm4ZnzKX8vLEWrMXuf/sQ3//3yBFX2gTV7OhBR54LOZTVOViN1JT/9vfYe4+JW0H3iTSR1Ze3B4l559JRYOP11COpxpNmhF93yt/B6aku7Z9cc+Hynq6vbOBjQczil6Egzkxrryq/VJVvHrokk5FtL2lxj5Lt9jKsuuLqiooAT9EMiuPmfDfyLh603K8HmZ4dRK6Sx8EWOCeDXbZc9ZlEP8kbpIx+e8x08kny9DzGceSksQZUW71qHGWr0Nn3nQkV+If/KvhMPyLGdDvFYZo75Iz140ZbiRzD8gdxBVf+eGh7YuRUcwJ8IsP1ZyvBpaIoLfP9hvXivXdJKW8bOYXBZQKjeNbMDC5WxHc3O4vL8rIYM6OzQQSo3sWiWWvI4r9cT7GPKHnBICJh3qoPkidiD4qbPhdg+IMcx3x4zok/ivQXPLj/gC8NgH8L6oAFs+PDIqMbL/+1+O4/v4tpJBjJ2fvXLd4/6it4cpgCGwORsNhcfPsLlZ3U33h1jVuXuapMlVRgLK3bdlmhyQG9a8Krnd4bQflPHZTEIUZEYg/ZSPXQcHGR2URtG9o6RGhRaUVprd8gZ9svZ+zQZbiwjiNSPD/1R4TIIabdVaCLxWtr8IVTaWQLovRycreY04TmwlcieXU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6506007)(8676002)(70586007)(70206006)(336012)(26005)(47076005)(2616005)(40460700003)(186003)(6862004)(107886003)(316002)(82310400005)(4326008)(36756003)(6486002)(6512007)(86362001)(8936002)(36860700001)(356005)(2906002)(33656002)(5660300002)(54906003)(53546011)(81166007)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 10:27:21.5341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8edbb745-4017-420c-d43d-08da38b8fe2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6260

SGkgQW5kcmV3LA0KDQo+IE9uIDE3IE1heSAyMDIyLCBhdCAyMDo0MSwgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBjL3MgY2ZjNTIxNDg0NDRm
ICgieGVuL2RvbWFpbjogUmVkdWNlIHRoZSBxdWFudGl0eSBvZiBpbml0aWFsaXNhdGlvbiBmb3IN
Cj4gc3lzdGVtIGRvbWFpbnMiKSByZW1vdmVkIHRoZSBwYXRoIGluIGRvbWFpbl9jcmVhdGUoKSB3
aGljaCBjYWxsZWQNCj4gc2NoZWRfaW5pdF9kb21haW4oKSB3aXRoIENQVVBPT0xJRF9OT05FIGZv
ciBzeXN0ZW0gZG9tYWlucy4NCj4gDQo+IEFyZ3VhYmx5LCB0aGF0IGNoYW5nZXNldCBzaG91bGQg
aGF2ZSBjbGVhbmVkIHVwIHRoaXMgcGF0aCB0b28uDQo+IA0KPiBIb3dldmVyLCBjL3MgOTJlYTlj
NTRmYzgxICgiYXJtL2RvbTBsZXNzOiBhc3NpZ24gZG9tMGxlc3MgZ3Vlc3RzIHRvIGNwdXBvb2xz
IikNCj4gY2hhbmdlZCBkb21haW5fY3JlYXRlKCkgZnJvbSB1c2luZyBhIGhhcmRjb2RlZCBwb29s
aWQgb2YgMCwgdG8gdXNpbmcgYSB2YWx1ZQ0KPiBwYXNzZWQgYnkgdGhlIHRvb2xzdGFjay4NCj4g
DQo+IFdoaWxlIENQVVBPT0xJRF9OT05FIGlzIGFuIGludGVybmFsIGNvbnN0YW50LCB1c2Vyc3Bh
Y2UgY2FuIHBhc3MgLTEgZm9yIHRoZQ0KPiBjcHVwb29sX2lkIHBhcmFtZXRlciBhbmQgYXR0ZW1w
dCB0byBjb25zdHJ1Y3QgYSByZWFsIGRvbWFpbiB1c2luZyBkZWZhdWx0IG9wcywNCj4gd2hpY2gg
YXQgYSBtaW5pbXVtIHdpbGwgZmFpbCB0aGUgYXNzZXJ0aW9uIGluIGRvbV9zY2hlZHVsZXIoKS4N
Cj4gDQo+IEZpeGVzOiA5MmVhOWM1NGZjODEgKCJhcm0vZG9tMGxlc3M6IGFzc2lnbiBkb20wbGVz
cyBndWVzdHMgdG8gY3B1cG9vbHMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpUaGFua3MgZm9yIHRoaXMgZml4LCB3aXRoIHRo
ZSBpbnRyb2R1Y3Rpb24gb2YgOTJlYTljNTRmYzgxICgiYXJtL2RvbTBsZXNzOiBhc3NpZ24gZG9t
MGxlc3MgZ3Vlc3RzIHRvIGNwdXBvb2xz4oCdKQ0Kd2XigJl2ZSBjaGVja2VkIGFsbCB0aGUgcGF0
aCBwYXNzaW5nIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiwgYW5kIGF0IHRoYXQgdGlt
ZSBpdCBzZWVtcyB0byBiZSB0aGF0DQp0aGUgbmV3IGNwdXBvb2xfaWQgbWVtYmVyIHdvdWxkIGhh
dmUgYmVlbiBhbHdheXMgemVybyB3aGVuIGNyZWF0ZWQgZnJvbSB0aGUgdG9vbCBzdGFjaywgYW0g
SSB3cm9uZz8NCg0KSeKAmW0gYXNraW5nIHNvIHRoYXQgSSB3aWxsIGtlZXAgaW4gbWluZCBmb3Ig
dGhlIGZ1dHVyZS4NCg0KSG93ZXZlciB3aXRoIHlvdXIgc2Vjb25kIHBhdGNoIG9mIHRoaXMgc2Vy
aWUsIHRoZSB0b29sIHN0YWNrIGlzIGFibGUgdG8gd3JpdGUgaXQsIHNvIEkgZ3Vlc3MgdGhpcyBm
aXggbm93IGlzIG1hbmRhdG9yeS4NCg0KSeKAmXZlIHRlc3RlZCB5b3VyIHBhdGNoLCBlbmFibGlu
ZyBib290IHRpbWUgY3B1cG9vbHMsIG9uIGFuIGFybSBtYWNoaW5lIGFuZCBib290aW5nIFhlbitE
b20wIGFuZCBhbm90aGVyIERvbVUNCmJ5IGRvbTBsZXNzIGZlYXR1cmUsIGFuZCBhbGwgd29ya3Mu
DQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQpU
ZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQo=

