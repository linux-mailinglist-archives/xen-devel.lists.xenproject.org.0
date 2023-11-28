Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B378A7FB8AD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643014.1002854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vkg-0003b7-S8; Tue, 28 Nov 2023 10:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643014.1002854; Tue, 28 Nov 2023 10:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vkg-0003YK-Ny; Tue, 28 Nov 2023 10:55:38 +0000
Received: by outflank-mailman (input) for mailman id 643014;
 Tue, 28 Nov 2023 10:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A0gx=HJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r7vke-0003Wg-Ip
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:55:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a790efe1-8ddc-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 11:55:34 +0100 (CET)
Received: from DUZPR01CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::10) by AM7PR08MB5431.eurprd08.prod.outlook.com
 (2603:10a6:20b:10c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 10:55:30 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::89) by DUZPR01CA0001.outlook.office365.com
 (2603:10a6:10:3c3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Tue, 28 Nov 2023 10:55:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 10:55:29 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Tue, 28 Nov 2023 10:55:29 +0000
Received: from 93ca64726e9e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FD9C356D-4219-4688-AED5-5FF7F696FF77.1; 
 Tue, 28 Nov 2023 10:55:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 93ca64726e9e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Nov 2023 10:55:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VI1PR08MB9981.eurprd08.prod.outlook.com (2603:10a6:800:1c5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 28 Nov
 2023 10:55:14 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 10:55:14 +0000
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
X-Inumbo-ID: a790efe1-8ddc-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VNJ8AZEM2SU0vOT9dsNCH6NU7d11HBPF1ZpHzSD2ny/Ym+0BVxJN97t0mOYS/EVGykx8ROBFKrHGsXzK+G2s2QN5CNr+a2e/+CLrhN8WjvmbhIqxJOXDqqr9Wxz3aSLYaWS13Xc/OOcZMAJEE4NXoGLpr1L/lamRSl1ulWmX1jE7vOC/t7HzaBDEgQXS62pnZHE2/52qgFbmJIss4ZkfcwbA6q1SPwVSICpPXD9lCnUQ7UBX+oDwbam65OLfX9i9fZu7wWER4RG1PT/OkfOroGKG1emVeCpSsoJmZqg3pqQWXqV07i8gJ8ueq5hMzW6BUk7V3no0vy1nkTqqIqbpGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qO3hbXopS1Gt+KOsjIh1wP42OchnGb1nznd3sKCCNfs=;
 b=LkhMA4XQqcRQuZHHO6mB9erArfhAvihOv+86j9dZM3NicysdcWwOKuBrQ6zVtc78gEf986YaVs2dvhN+zrp01H6GpEkPN4nUX6QKtXvSt2fSTTYtCkkjQ/Q6CcNveoLnsEILoMtYG0tnnRmguUh5UpUCL3ZPZdmmpW9n4K70K/Jg+qYmh65Dbys5MZLBrjRsfuHXtjJ5MPprONTs+eZ8IEn+aZlbd8XRzBeQAKzLMpwbV+xKTPqOe4/shadJkZBt4FMgo++TNqDrhbpJ989CMqw4W8FeuRb7OhVMBc7eAKc23lMrWOQzUwIzIC+LcIr2pngZNMdB8EL7as0m+56JxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qO3hbXopS1Gt+KOsjIh1wP42OchnGb1nznd3sKCCNfs=;
 b=lfwYlD4bwzlDXnbiFetCjfVBe0CsqKMDRUHq6VI+FMIGoLUgLCmxM8YW4QGSG1qnlIlLRDfjPZB91WwAq/OZQ308kZaupW4xLnI92HTbcIfPpHyNz6uE64LReCdH35jnO+VC7VvM4kvDNRa1AazUCFv64580FAARiTNuECOxPm4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 701a514e42a40085
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG41Suz4j/+KedeBB1tApcqJRvHlyaAzwHrLH8mZ9p+tuv+l6HnVaBdy2w9pC+7qkXIKH5ScJo18vI2r+QJF2fX0JLgva8GLZQJ4exPc2NR93P2FBwgij1Ayw87RkVXeowCnl17i3xbVnYvN7q1JJq3aceg9R70SDOz6u7RNCPWWVr46CAchU/iYpZebUvtMCc4kOy8sg3EzSdCUvX+YXDEDR48ffG1BzlY7jT7ouS1Qlzjfo59mdF4yto7TAqop5Z6dZAWdJS1lsPiperx79mQMrZVKoQX87Ce4inlBv9rpcHBQ0l4O7g5bqv3td44iNV07RyOlOFo14WCW3L6gXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qO3hbXopS1Gt+KOsjIh1wP42OchnGb1nznd3sKCCNfs=;
 b=Sn1xQ135rCNbxchqSm9OWolJ/7Ya5bRHnzDo8aUR9bD+DkRn4JhFZxKcCGlnPg6aueCGNp9Fm/4Rvf/3BLUiTFjoliFV1b7CJhkNeUqejI6LJqsZWCk2+z1hjgH6gblpesAOeacYSW3G2JCrRo3lPAswSPjH3w5SWQ45BimhSfzyYGyLAJZzUwDoF93WXjD3DhgF9Pzio4iGrQxTwBNlYCBTODJmHKy7Dd6uNJ6brOb35XVESaK1tY4W4CGNJTuv0uErXhcSkNdtiT+hN5KyxmctQtlqfKQAqOhzqWLUChPgm56HWSyjgLL2KJTlzVKpD3qy7ymykWqUQP/iFq/xbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qO3hbXopS1Gt+KOsjIh1wP42OchnGb1nznd3sKCCNfs=;
 b=lfwYlD4bwzlDXnbiFetCjfVBe0CsqKMDRUHq6VI+FMIGoLUgLCmxM8YW4QGSG1qnlIlLRDfjPZB91WwAq/OZQ308kZaupW4xLnI92HTbcIfPpHyNz6uE64LReCdH35jnO+VC7VvM4kvDNRa1AazUCFv64580FAARiTNuECOxPm4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Clang-format configuration discussion - pt 2
Thread-Topic: Clang-format configuration discussion - pt 2
Thread-Index:
 AQHaHhwDfni7SbjBtk6S7YLD/w4HebCJbICAgAAi9QCABIyNgIAAK/0AgAAEPICAAAbTgIABQ2eA
Date: Tue, 28 Nov 2023 10:55:14 +0000
Message-ID: <53B2087D-A24C-45EF-BC4F-012714C718B3@arm.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <1e770335-9606-4e9a-9f96-d04834675426@suse.com>
 <3E69667A-BB66-427D-A907-FA1537CFA1CC@arm.com>
 <838395c3-41ba-4004-abf1-948b655a5ef2@suse.com>
 <B5AF6A9F-3986-4F3C-90F7-122D63A2B31A@arm.com>
 <a99681e4-e201-4abe-bf6a-fda61674074e@suse.com>
 <8DE85ED0-2949-4FF1-832B-ABEDC86BF13B@arm.com>
In-Reply-To: <8DE85ED0-2949-4FF1-832B-ABEDC86BF13B@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VI1PR08MB9981:EE_|DB5PEPF00014B90:EE_|AM7PR08MB5431:EE_
X-MS-Office365-Filtering-Correlation-Id: 085deb45-dc09-468e-37f2-08dbf000892c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JQynM+i2EkvcdII3O7uyZ9uPPXs/OV9xZlqsNK5dTo8mpGBo2Uj8TdUC7Ar7KGv6LEVYFstRo3BGxJcA4GyObx8DsVUiKg/AAZsAVpehD4dlgN4/cKrxF5xbIU4JlhBAUnWBMqaKv/Q3cDOn/L+OMYtC5wV8uTl5gvkWvisgpGKehQc809M2/j5nO+hu4tznysDT/bGjHqBndfwa4rg0MHeer8r8nfaGNqseQ9Y65YWjkJaKFJLTf9dk36sClDJRIBR9RDEMEAnzABUtkhPQKA6odVqTau1QcAkIfLE7eqaS5ZpeqP0USVF/C225kf4MVcV2K7tMSt0GCwJ+8zrCqROBEQE++5XwEu8acD83yCZxdRR3mkIDsAAVze/f+Q6Wh8VsYmTBXx8YjeLZnAGIM6kmrP8ohZad3t1JcZj+qExIGjZi3NlCYr18d32Q2+YyvK6ZMpIP2h+j9GBNA1bAi0iCysHd4rBejJMQeM9BXL1bIH+6g8bqdj87H1by4rXgta/n6AbxHQg98cNkw6EAouaWJYIR4HwC96WGgnmqnRQcVLtZIt/WXFRAqWLWcJ8QOb2SukFC0HsjqaKATMKYrPPB8uEbmf/KN7KfXCwVORIhp/C/lDXY1YthlNufmJ90mS3uYei6E9DzuTobBi5EGaLoP7VvHsk9WY+dpI1LIRCFY9YShzco0NJUYvk8vNbJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39850400004)(346002)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38070700009)(2906002)(8936002)(4326008)(8676002)(41300700001)(5660300002)(478600001)(76116006)(316002)(6916009)(66946007)(64756008)(91956017)(66556008)(66446008)(66476007)(54906003)(36756003)(66899024)(86362001)(6486002)(26005)(71200400001)(53546011)(6512007)(33656002)(83380400001)(6506007)(122000001)(966005)(38100700002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F417763E2DB7F74DA69BF1DA3F26D948@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9981
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	edf4fb85-acad-43d2-8c94-08dbf0008038
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rNim0NKLWnXfNQPpYdq6751953mUWKZ6YZ8SWjCwkuR85+5VxYD8h7LQO101kX5/YuDDCFZ+7cz17xfALuM592gMgPB6NyBo8Bfa1Jx798rFKK+4wttHLwsrn0B3ryDnwA1z5EXgp4jlfkyAPn+yBXvTERPrAOUQmid5n8kXFpANU9F+YuwivvHaJHws+QMrYgChxdw546Loi82aOJ2eePTQA4jiFbiAdgbObMsEivBwvpXf+ks5KqgRGNCNUxtvwJOYHnt6geygH1wlg+VRhuXX5NtjBTMTdpws6SnVGZRcwDC2EvW0Md5p7a56fwiOpfxPpiQXYgX5oF3B80dN8I4esLgI4mXFtoBGIjX/US23Bd/N/2wC7Ungn8ql1StIy8cX//qlQs/67yfczj4CuY4hqdfJ3ZQf0fWv74j/OWHDi/af7zfx7+H/CfcgpTAL3a/wqHaxQ4cYQSurwA69bemnbLP7eU3dTdwPA/5xAmA7sHvdT3yAyrutgTBbmG+Bm6uKPmjvSttLprnZCc5EkZCce94yQPs1lAS555tUHDSyR9jE1mTqSa9L1fCim7AWXo4JXd7LNUYLaEVHTxpoEc1156FtzVCE1gyaxvozsONI+sszExb5THViHYCEMzk6xHa3QPDh55XoJe3Lr8ZWlR/WyIRmOoDCZljoNkDqqB54AL/hlV7QH+SC22NbtSHo84GHAM5lkXU9LqrUor8zyKQePm6fkXoRs5v9rHW8gfDUbaSJG5iFGI7VW/iTYV6xsO5gE4A6p7lCQtFEMqQnZw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39850400004)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(82310400011)(40470700004)(46966006)(36840700001)(40460700003)(66899024)(81166007)(356005)(6486002)(966005)(82740400003)(478600001)(33656002)(41300700001)(8676002)(6862004)(4326008)(8936002)(36756003)(316002)(86362001)(54906003)(70206006)(70586007)(26005)(2616005)(47076005)(336012)(83380400001)(6506007)(53546011)(36860700001)(6512007)(2906002)(5660300002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 10:55:29.4943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 085deb45-dc09-468e-37f2-08dbf000892c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5431

DQoNCj4gT24gMjcgTm92IDIwMjMsIGF0IDE1OjM3LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gMjcgTm92IDIwMjMsIGF0IDE1
OjEzLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4gDQo+PiBPbiAy
Ny4xMS4yMDIzIDE1OjU4LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+PiBPbiAyNyBOb3YgMjAy
MywgYXQgMTI6MjAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+
IE9uIDI0LjExLjIwMjMgMTU6NTIsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4gT24gMjQg
Tm92IDIwMjMsIGF0IDEyOjQ3LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Og0KPj4+Pj4+IE9uIDIzLjExLjIwMjMgMTU6NDcsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+
Pj4+IExldOKAmXMgY29udGludWUgdGhlIGRpc2N1c3Npb24gYWJvdXQgY2xhbmctZm9ybWF0IGNv
bmZpZ3VyYXRpb24sIHRoaXMgaXMgcGFydCAyLCBwcmV2aW91cyBkaXNjdXNzaW9ucyBhcmU6DQo+
Pj4+Pj4+IA0KPj4+Pj4+PiAtIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAyMy0xMS9tc2cwMDQ5OC5odG1sDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBZ
b3UgY2FuIGZpbmQgdGhlIHNlcmllIGludHJvZHVjaW5nIGNsYW5nLWZvcm1hdCBoZXJlOg0KPj4+
Pj4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL2NvdmVy
LzIwMjMxMDMxMTMyMzA0LjI1NzM5MjQtMS1sdWNhLmZhbmNlbGx1QGFybS5jb20vDQo+Pj4+Pj4+
IGFuZCB0aGVyZSBpcyBhbHNvIGEgcGF0Y2ggbGlua2VkIHRvIG15IGdpdGxhYiBhY2NvdW50IHdo
ZXJlIHlvdSBjYW4gZmluZCB0aGUgb3V0cHV0IGZvciB0aGUgaHlwZXJ2aXNvciBjb2RlLg0KPj4+
Pj4+PiANCj4+Pj4+Pj4gRm9yIGEgZnVsbCBsaXN0IG9mIGNvbmZpZ3VyYWJsZXMgYW5kIHRvIGZp
bmQgdGhlIHBvc3NpYmxlIHZhbHVlcyBmb3IgdGhlbSwgcGxlYXNlIHJlZmVyIHRvIHRoaXMgcGFn
ZToNCj4+Pj4+Pj4gaHR0cHM6Ly9jbGFuZy5sbHZtLm9yZy9kb2NzL0NsYW5nRm9ybWF0U3R5bGVP
cHRpb25zLmh0bWwNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBPdXIgY29kaW5nIHN0eWxlIGRvZXNu4oCZdCBtZW50
aW9uIGFueXRoaW5nIGFib3V0IGFsaWdubWVudCwgc2hhbGwgd2UgYWRkIGEgbmV3IHNlY3Rpb24/
DQo+Pj4+Pj4+IEkgY2FuIHNlbmQgcGF0Y2hlcyB3aGVuIHdlIHJlYWNoIGFncmVlbWVudCBvbiBl
YWNoIG9mIHRoZXNlIHJ1bGVzLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFF1YWxpZmll
ckFsaWdubWVudDogQ3VzdG9tDQo+Pj4+Pj4+IFF1YWxpZmllck9yZGVyOiBbJ3N0YXRpYycsICdp
bmxpbmUnLCAnY29uc3QnLCAndm9sYXRpbGUnLCAndHlwZSddDQo+Pj4+Pj4+IA0KPj4+Pj4+PiAt
LS0NCj4+Pj4+Pj4gRm9yIOKAnFF1YWxpZmllckFsaWdubWVudOKAnSBJIGNob3NlIEN1c3RvbSBp
biBvcmRlciB0byBhcHBseSBpbiDigJxRdWFsaWZpZXJPcmRlcuKAnSBhbiBvcmRlciBmb3IgdGhl
DQo+Pj4+Pj4+IHF1YWxpZmllcnMgdGhhdCBtYXRjaCB0aGUgY3VycmVudCBjb2RlYmFzZSwgd2Ug
Y291bGQgc3BlY2lmeSBhbHNvIOKAnExlYXZl4oCdIGluIG9yZGVyIHRvIGtlZXANCj4+Pj4+Pj4g
dGhlbSBhcyB0aGV5IGFyZS4NCj4+Pj4+PiANCj4+Pj4+PiBXaGVyZSBkbyBhdHRyaWJ1dGVzIGdv
IGluIHRoaXMgc2VxdWVuY2U/DQo+Pj4+PiANCj4+Pj4+IEkgdGhpbmsgZnVuY3Rpb24gZGVjbGFy
YXRpb24vZGVmaW5pdGlvbiBhbmQgdmFyaWFibGVzLg0KPj4+PiANCj4+Pj4gSG93IGRvZXMgdGhp
cyByZWxhdGUgdG8gbXkgcXVlc3Rpb24/IEkgYXNrZWQgYWJvdXQgdGhlIHNlcXVlbmNlIG9mIGVs
ZW1lbnRzDQo+Pj4+IGxpc3RlZCBmb3IgUXVhbGlmaWVyT3JkZXI6LCB3aGVyZSBhdHRyaWJ1dGVz
IGRvbid0IGFwcGVhciBhdCBhbGwgcmlnaHQgbm93Lg0KPj4+IA0KPj4+IFNvcnJ5LCBJIG1pc3Jl
YWQgeW91ciBxdWVzdGlvbiwgYXR0cmlidXRlcyBhcmUgbGlrZSBpbnZpc2libGUgZm9yIHRoZSB0
b29sLCB0aGV5IGNhbiBiZSBwbGFjZWQgd2hlcmV2ZXIgYmV0d2Vlbg0KPj4+IGVhY2ggb2YgdGhl
IFF1YWxpZmllck9yZGVyIGl0ZW1zLg0KPj4gDQo+PiBIb2hvLCBvbmUgdGhpbmcgd2hlcmUgdmFy
aW91cyBvcHRpb25zIGFyZSB0b2xlcmF0ZWQuDQoNCkkgcmVhbGlzZSBub3cgdGhhdCBteSBhbnN3
ZXIgYWJvdmUgaXMgbm90IGZ1bGx5IGNvcnJlY3QsIEkgd2FudGVkIHRvIHNheSB0aGF0IHRoZSBh
dHRyaWJ1dGVzIGFyZSBsaWtlIGludmlzaWJsZSBmb3IgdGhlIHRvb2wNCm9ubHkgd2hlbiBkZWFs
aW5nIHdpdGggdGhpcyBydWxlIGFib3V0IG9yZGVyaW5nIG9mIHRoZSBxdWFsaWZpZXJzLg0KDQpP
biB0aGUgb3RoZXIgaGFuZCwgeWVzLCBpZiB0aGUgUXVhbGlmaWVyQWxpZ25tZW50IGlzIOKAnExl
YXZl4oCdLCBjbGFuZy1mb3JtYXQgd29u4oCZdCB0b3VjaCB0aGVtLg0KDQpDaGVlcnMsDQpMdWNh
DQoNCg==

